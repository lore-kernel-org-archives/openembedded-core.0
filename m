Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.18635.1594914931626671682
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 08:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W6+kZUsx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id q5so7582556wru.6
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 08:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=7a9KRvoFV1jksuIOe9or+o6XrCIzuouA2HqCQgLW1Y4=;
        b=W6+kZUsxR8jw2krsjfeidT7J3hB2JJxABL7GO12CHMnIa0QjRl4sJhgrD+q37TygrN
         eHyhd3Gv/yRk8mnAHOPUvTTwpk186F4bPC3UkovUVKeEishacG1swvs4TwKbuek8ncoT
         kzxZcwDzok1rz2c/bVOpedNtnmTcOoPXfvnnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7a9KRvoFV1jksuIOe9or+o6XrCIzuouA2HqCQgLW1Y4=;
        b=Av49G9fBG8NL7ekxlYLE3qngxlWHceihDEM1LaWRVhLGQU4lc2migOiEqzRICxjlDO
         YWEvPYhvx7VQ7gDcksE6Zv5a41x5HvJIs2UEVMrybMQavMzcnqIfFJQYhwFQiHLhzm+J
         aWW3xHcIBhOME0fBdJdxCehJnXLzih0dO9H8+TQjgwa2QPzoufvkhlOomIAxTQtBCSgZ
         W5M56hwU+HiR7v2VM7fHmtmey7m3Vvl2KK1LiJzKvx7BvQUFg65q5hopxi3nTWRcfjkY
         0g9GWVj8DZ2k0N2MDrJDAWq8A9FX5yYV3l23sGmYh1fNns9mnv0d7bdahPecrR82qP//
         ddzw==
X-Gm-Message-State: AOAM532vaKyt67ZGMWM1d6TB8t+3x874DK5cPs3tZRnTdbcpz0ONgUMJ
	j7CtVy9d1SFcV2g1VtqRiRMLJg==
X-Google-Smtp-Source: ABdhPJyl5SfRV/TZFplmUWAF/JjF9dBp5oubRrOlOL5Qjsn6W2rklV/nrUr/+6ulUXSYcyRDzAAPQw==
X-Received: by 2002:a5d:404e:: with SMTP id w14mr5598298wrp.268.1594914930027;
        Thu, 16 Jul 2020 08:55:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from e.5.e.d.0.0.8.7.7.9.2.b.d.5.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (e.5.e.d.0.0.8.7.7.9.2.b.d.5.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:d55d:b297:7800:de5e])
        by smtp.gmail.com with ESMTPSA id z6sm8890765wmf.33.2020.07.16.08.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 08:55:29 -0700 (PDT)
Message-ID: <09ec097fc3cd3f5bb1ebbc7248cc52e56716fbfb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [AUH] Upgrade status: 2020-07-15
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jul 2020 16:55:27 +0100
In-Reply-To: <CANNYZj8drAJ8fvTC_KPhQ3yZr7KN7iaB-616DnQHmf43TjCFmg@mail.gmail.com>
References: <20200715164441.DDD23E01EAA@yocto-www.yoctoproject.org>
	 <CANNYZj8drAJ8fvTC_KPhQ3yZr7KN7iaB-616DnQHmf43TjCFmg@mail.gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-07-16 at 16:31 +0200, Alexander Kanavin wrote:
> we have changed the AUH behavior so that it sends all upgrade patches
> not just to maintainers, but also to this mailing list. What this
> means is that if you are interested in an upgrade, and would like to
> contribute to Yocto, do not hesitate to take these patches, and send
> them to the mailing list according to instructions in the mails. Do
> not wait for 'official' maintainers to do it!

I did pull a chunk of the successful ones into master-next for
evaluation/testing.

I had to drop libhandy as it breaks epiphany:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1175

I needed a fix for mpfr in meta-mingw. Also, vulkan-headers breaks
gstreamer-plugins:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1173

There is another build running of -next as I send this...

Cheers,

Richard




