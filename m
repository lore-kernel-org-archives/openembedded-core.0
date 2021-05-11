Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.12574.1620739519587348383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 06:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YhG4MtyH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso1199896wmh.4
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 06:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Kqe6v4mX0haYeaImYSOY5QYfpsszOi4wELQxIb3f1U0=;
        b=YhG4MtyHUucjx3I4aRHlitYJB8nJDIvq3UVUE47ND3t9NkSKoEuXynU3nXANaN7f/j
         jo5ni+2zcxDQANq1am9Q6CSJapGKLzEviLZ0+dHTkj3wOvONIL21AgAG5vX29Bjd5F4W
         X5Jrg0F8At1Pq1b2tO5M5GIHCD/nmxg9N4cLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Kqe6v4mX0haYeaImYSOY5QYfpsszOi4wELQxIb3f1U0=;
        b=cG60zale4uBmqB/1eifVMQmXEKIld+K4Z3kKZFV3ZsMLG4jPV+ln/OyQwTQnY3p9oY
         /A39rTf1Q3W+Atf9x4cZEufucvtUET6vGiiedsyklmJS6hgd8lCXM+2HDZGiyjKWDqiQ
         NR+EbYy3KtHPvt9O4brWaY3wWcb2/KyxJLn+kTQaykakxFg/eWljuKqGhBzOmQmX7C+H
         nm3BaJzEJ89vvkQlEvNgB7edos7SdTKXWyHKadnb8dNQueh2Nxkmj04R3mNmHRx/4TFb
         Uysh26KoPyjsaTGXxH94ANooGt4JMbczHEWHTFiPkCcGJpo2NmsYriaemdQg7m1mdAbo
         fcmQ==
X-Gm-Message-State: AOAM533hQVPGczcPMqO/XFT4cm8uo/sW6I/zrdu608k61ji/VPAmp61A
	Id3bfPsdjzei04gaQrYA5B4m/A==
X-Google-Smtp-Source: ABdhPJxfp4wmGTno4bHdOV0tHA/xREmMADruhhWV0gNJsW03cgoVfJhVm9AbryhGUc4QhLE/h/iGiQ==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id o16mr5452643wmq.137.1620739517712;
        Tue, 11 May 2021 06:25:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:29c0:3873:464b:b647? ([2001:8b0:aba:5f3c:29c0:3873:464b:b647])
        by smtp.gmail.com with ESMTPSA id c15sm26799165wrr.3.2021.05.11.06.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 06:25:17 -0700 (PDT)
Message-ID: <820df25f847056b25ddf5538cc0d042b2fa8fbb2.camel@linuxfoundation.org>
Subject: Re: [OE-core] QEMU rcu stalls on autobuilder - not what they seem?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-core
 <openembedded-core@lists.openembedded.org>, Tim Orling
 <timothy.t.orling@linux.intel.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
  Randy MacLeod <randy.macleod@windriver.com>
Date: Tue, 11 May 2021 14:25:16 +0100
In-Reply-To: <CANNYZj8ujWetFPd+S4KpiV22ZrQMO7ozn2cpBmzs44RcgO-zgQ@mail.gmail.com>
References: <167DF913750C3E0E.1178@lists.openembedded.org>
	 <82398336819fe90e1645fb2176037e28b11eb360.camel@linuxfoundation.org>
	 <CANNYZj8ujWetFPd+S4KpiV22ZrQMO7ozn2cpBmzs44RcgO-zgQ@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-05-11 at 13:33 +0200, Alexander Kanavin wrote:
> A quick question: are the AB machines using nested kvm, or 
> are they baremetal?
> 
> We've seen similar errors here with qemu SMP that were only 
> resolved after moving to baremetal builds for qemu targets.

Baremetal so that is one thing we can rule out! :)

Cheers,

Richard

