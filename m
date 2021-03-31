Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.7780.1617202270516447543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 07:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UyaLMyTw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id k128so10300177wmk.4
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 07:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=XMX2xSa7+h4c7soMMzmaNfsf+fd/qUK4vUuAzgORTic=;
        b=UyaLMyTwRPYseb+e4jjuUDNWdo/F95O3alL9XPiLqanlywZbONRlwyZyE5t0dvkd5Q
         AGVIUtcai2uKwPTKfbjTri52gCqYQAddj59by7e6ZjHKJf/E46foxcRF9KeRwHa0ore2
         4iOKVwWUA4eiw1iBov3ZgCCTrYBsctzkX+lsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XMX2xSa7+h4c7soMMzmaNfsf+fd/qUK4vUuAzgORTic=;
        b=WC8KVHY4uqYypOn77mn8tXlgdDGjsfL+mAEhANtkgaoPSrBUndjheFBPlFRTori2nZ
         YRzK5EexR69K4gio0yxyOljvIyhZnnvxnm2bAKbixxxEb8AIhYBSgh/koYFJoGS6Q+jW
         J3xVprx8nDpsd8bszoEScp0vbO7TQACFsjml4AsQ6kycdOsjn5v0MwBlgRRYS+U2BJ8j
         7KJ5M6Q32abskGK5sWu2lJaPE2ZH9ZPvhZ8RRAITWzkl664B3jR0kuI8FZNKpSV1s1P5
         8c9D6zpoj+o7usXf3RY45/pihMoN7gLibnapqVoptSJvPPqJVWptbZ+wH2Og7PpdVEKd
         GKAA==
X-Gm-Message-State: AOAM5338fbfc1Vkyd3Do+Qo19IaNCi8khfLlgdFCH6yeSTMd3JT5m25Y
	V6mh6iHGAchaWJdltY5VEME3HA==
X-Google-Smtp-Source: ABdhPJzyhls1cgi5lrdTk9zdiA2qXTSwnGTggtDr1Gu75im8qdWOi+k+2/Vcv2JW9Qerwkm0zSq53A==
X-Received: by 2002:a05:600c:d1:: with SMTP id u17mr3624342wmm.64.1617202269055;
        Wed, 31 Mar 2021 07:51:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:dd67:d113:44af:5a71? ([2001:8b0:aba:5f3c:dd67:d113:44af:5a71])
        by smtp.gmail.com with ESMTPSA id x14sm4835439wrw.13.2021.03.31.07.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 07:51:08 -0700 (PDT)
Message-ID: <9610fbe500dd63f56c2660f4a708c684fc2b47b8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] buildhistory: add missing vardepsexcludes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Christopher Larson <chris_larson@mentor.com>, Christopher Larson
	 <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Mar 2021 15:51:05 +0100
In-Reply-To: <CABcZANmkzd4nfvdAG_=KxHSd9ff7qMozvLdJ=M5f5P056WMuAA@mail.gmail.com>
References: <16712EDBC9E446B5.24964@lists.openembedded.org>
	 <CABcZANmkzd4nfvdAG_=KxHSd9ff7qMozvLdJ=M5f5P056WMuAA@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-03-30 at 10:29 -0700, Christopher Larson wrote:
> 
> 
> On Tue, Mar 30, 2021 at 10:27 AM Christopher Larson via lists.openembedded.org <
> kergoth=gmail.com@lists.openembedded.org> wrote:
> > For POPULATE_SDK_POST_TARGET_COMMAND, POPULATE_SDK_POST_HOST_COMMAND, and SDK_POSTPROCESS_COMMAND, the
> > appropriate entries were added to vardepvalueexclude, but we want them in vardepsexclude as well.
> > 
> 
> Richard,
> 
> This fixes the failures in sstatetests.SStateTests.test_sstate_noop_samesigs 
> seen with my other patch (image,populate_sdk_base: move 'func' flag setting 
> for sdk command vars) applied. Thanks.

Thanks, both tested cleanly and have merged now :)

Cheers,

Richard


