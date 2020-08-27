Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.16771.1598528219606353441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 04:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DFued/9H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id u18so4847590wmc.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 04:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Y9LF6oDcDNem6qVyf3zE24aIwPB8wr3Ph95h42niUNc=;
        b=DFued/9HfuXosd1in9QeXVqiwKrVt5pxiI86AJGQsjsUZk6FIMDHpLIkpJg4ua4sbM
         fnOTyU2cwmmIUYfrB8pGIownAqSlN573g/CraPTX2t4YI3FcRAKVQmIvebM4fzKdKry5
         teitp53Ac77qe2D2GFnSlHGmrFltbsWQB5ttI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Y9LF6oDcDNem6qVyf3zE24aIwPB8wr3Ph95h42niUNc=;
        b=LTjnMey+1s3nZ89/omHh4R99JfYI503sNY9pzxktT3p1NTGrs3M8QJJo4TISmzF/v3
         OdqmcA4sbVlYzptPSk07LzO1iawfY3taphhUVGxebksbGTo0skw3GVdKL5hMCQgGbeqY
         1kOZccrNLHEYxu/qdCDo4zsC/B40wFRcv4Eax4Yc5F9TdLAByD1i/F1ZnvBp4oI3o6LX
         S9rqdGsa3p3yNSeR3Bygo9vxKAW8JfBJsl7tC9QUFmjHe4VZYyeoQS9NyRHmODXzoG9A
         kAtN5c7ZKeK28qeQiw2LSUrot02iYscn3FW06rFo77laDAPtTcXpSKz3Zw3XpFmqBxaO
         JOMQ==
X-Gm-Message-State: AOAM530qyJY+FpxVXGRZuIh7gHKSNLc40vJ8sbSrWZRB3qlYXrrKFaKQ
	4IrMTbxZt4K4WFcNM9wtZCyAHg==
X-Google-Smtp-Source: ABdhPJz3xK6EB726rm04+Ak+lHEwt32w7XUHFsQv4CwYyFrDDiuMa0hq1kuYKINMT4Mpma8jk93oXw==
X-Received: by 2002:a7b:c011:: with SMTP id c17mr11291757wmb.63.1598528217881;
        Thu, 27 Aug 2020 04:36:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id i12sm4726084wrm.46.2020.08.27.04.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 04:36:57 -0700 (PDT)
Message-ID: <24104bbec782fc24a0f827a9e26d3977b7028446.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/6] oeqa/multilib: un-skip the connman test
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Aug 2020 12:36:56 +0100
In-Reply-To: <CANNYZj9kX8td0hAPyWtT=Jyd5+5fkoneX-j9btxU3OYEowUseA@mail.gmail.com>
References: <20200827105933.3575-1-alex.kanavin@gmail.com>
	 <20200827105933.3575-6-alex.kanavin@gmail.com>
	 <7c38e0ce946af6c0f1075b95c5f41e6f772c9241.camel@linuxfoundation.org>
	 <CANNYZj9kX8td0hAPyWtT=Jyd5+5fkoneX-j9btxU3OYEowUseA@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-08-27 at 13:25 +0200, Alexander Kanavin wrote:
> On Thu, 27 Aug 2020 at 13:06, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > Hmm. I think this test is only meant to trigger in a lib32-core-image-
> > sato where lib32-connman would be present and connman would not?
> > 
> > The test name could certainly be clearer as its not a generic connman
> > test...
> 
> There is no lib32-core-image-sato anywhere in config.json  - and I think 
> RPM_PREFER_ELF_ARCH in existing tests should ensure that 32 bit connman package takes precedence.
> 
> Also note that those same tests install lib32-connman, which can only be for the purpose of the test:
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/tree/config.json#n495

Right, those are the tests I was thinking this test is related to. It
looks like its only those tests that enable this TEST_SUITE so your
patch is probably correct. Its a shame this test suite is so tied to
the configuration in ab-helper though. Not sure how we could improve
that...

Cheers,

Richard

