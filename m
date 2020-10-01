Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.3406.1601583738387892848
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 13:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XymY55RR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id s12so116984wrw.11
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2020 13:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=wvEMomYb4jiaJbGjy/QN3kxB/OvAHn8F07Pfg9+iZQs=;
        b=XymY55RRuc6tkk1Qu8G2fRN/illOYjhoJgu7ZMnqUL6AppBi+JAPt7hNbRrAjtnupE
         OJXpdYknKkLvuQcO0+NMSQTlDgeVAuUKuIKxMkcc6bhn8LRvmLLj4JA/0D/Z1pRj+44n
         o5HtF2npuTWdYe9On2Bnx2SBaRaljb+WVBRbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wvEMomYb4jiaJbGjy/QN3kxB/OvAHn8F07Pfg9+iZQs=;
        b=TD93XQIZbPtgn+3VZJf57KnsVGVVSCfpFdiM98Fi8vFwl7FNSk0ueOZDY+McI/272P
         P6pCQ7QShn8b1rPfIuQAYBk43446BcXc380Up/EKqT0ELKq8FpJW8sXuidzKG9u9bPZe
         B7Ky9JkoM8l5ZoXiae3qubc9BpOpwcMadRs79XXoxTE3TCrIpYX7CceBLo/6Hq+PvMc0
         aEzjqfxrrier/C+tZ7+KoFWBEhhuvlVP1uMXEIWilyyOE3e5dHFbWBKNrhl2//HY1tBm
         yLBsauCwxhxv0Gz0C01mPHX2hzj63qwXAUaAA2EQBmlMamynAgSClBT8/ZSvl8pUMK8v
         dQFQ==
X-Gm-Message-State: AOAM531OMrr+Q09bxU+RU6qfjFQTtmeW1QbIvz9e4PdCMBwXlDqREWKA
	LLkxnsN61d1UPd6j8KFwSCVXUA==
X-Google-Smtp-Source: ABdhPJwhprzLOfG4mq1B9EQosBsDDJSnKof8nlZCv34MYsLRKtjY1d3UuPdGx/ZCHm6yq8JfQHS7xg==
X-Received: by 2002:adf:b74a:: with SMTP id n10mr10520624wre.140.1601583736554;
        Thu, 01 Oct 2020 13:22:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:9c3e:7322:3204:3cf7])
        by smtp.gmail.com with ESMTPSA id n10sm1572015wmk.7.2020.10.01.13.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 13:22:16 -0700 (PDT)
Message-ID: <fb9f5077a1748b307eadb41a618bfd1abd0c7be1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] coreutils: improve coreutils-ptest RDEPENDS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 01 Oct 2020 21:22:10 +0100
In-Reply-To: <CAAnfSTtumHZnTF82Cb4n1mrvmst3+=R32rsqf8fCy++xKnQSSg@mail.gmail.com>
References: <20201001161111.2889773-1-ross.burton@arm.com>
	 <9d4997385b6095a0569babae0eb1241274cd9e2e.camel@linuxfoundation.org>
	 <CAAnfSTtumHZnTF82Cb4n1mrvmst3+=R32rsqf8fCy++xKnQSSg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-01 at 21:20 +0100, Ross Burton wrote:
> On Thu, 1 Oct 2020 at 18:07, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > When you tested that, did you actually test an image just with the
> > coreutils ptest installed? That was how we exposed this originally
> > and
> > without it, the test results werent' consistent.
> 
> Yes, core-image-base with coreutils-ptest installed.  I can try again
> with core-image-minimal if you have concerns?

I think -base should be ok. I know I had to brute force this with
testing a while back, I think I did use minimal for that but base
should be ok.

Cheers,

Richard

