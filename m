Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.29379.1629979253052151059
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 05:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QCBp5BG2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id z4so4645701wrr.6
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 05:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EDDhIi52ZCUbczGzxK272zrQ9iMsn1WUetbc596xAFU=;
        b=QCBp5BG2Wsf3qFksDPPZawvPlTSPK8wiXghpY8ED3j07R+iYbXZV1AATpsdRxjaiTq
         0Bg2piWYOecApz+WRgnGCf1VhcEs0dirrel9U+uqh7/lzpmFprs3ftbKNpoEPrs57Ndh
         vwIn1rDTsbzJpwsF6UrO30KLkqmMI5/2DB8VU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EDDhIi52ZCUbczGzxK272zrQ9iMsn1WUetbc596xAFU=;
        b=UXubzMKzyF7A/7pR5k1Pwml3pD3M7dWBMQ0RIrw0G6KtqydZ6GUnRLVI45d+qiOSxJ
         DIYhow3srr5PyxW0FpySSGVscZ3/NaruNqzoFNeJAFFBEd1sd/jm5UorJck4N/0+O82R
         TQ0MFrdkCrlzRQJkusCEhaCGgos5t5RqGWw8tLr+qSSbIBz2Iv+oLooYEHnQ2pe7YR9h
         f+/whu/T7AeALKaS5eamAWYm0mffCKtmdUT2DOFeu1ONcbPev0IGaLvVF10mWZn7w7cs
         LVJ7uTRZgKIF6YEM6Vcp0OgQwmjgb4yFEFSM1GMLffgXa8BkFgpTBA/XNbsnztIJrAOo
         Coww==
X-Gm-Message-State: AOAM530TuhhYU4yfH48Np1s63LF5q7HKMRrgHE2VI5L7sKKt304rvWuc
	bSFW7aC9cCFCh0vtLCl3W2wQlA==
X-Google-Smtp-Source: ABdhPJwupDhw5aVlp9zi4a9Sbs6IxsYDuovjTpk8BbmzSi1Ua31JS5434YGk3eITbsGDigQlSZfnIw==
X-Received: by 2002:adf:c3c9:: with SMTP id d9mr2463739wrg.339.1629979251539;
        Thu, 26 Aug 2021 05:00:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4? ([2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4])
        by smtp.gmail.com with ESMTPSA id b10sm3220977wrt.43.2021.08.26.05.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 05:00:51 -0700 (PDT)
Message-ID: <b2dab4ebd32e02a84bc7087a3e3ac62c78255547.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] vim: add option to disable NLS support
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Valek, Andrej" <andrej.valek@siemens.com>, "armccurdy@gmail.com"
	 <armccurdy@gmail.com>, "steve@sakoman.com" <steve@sakoman.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	 <raj.khem@gmail.com>
Date: Thu, 26 Aug 2021 13:00:46 +0100
In-Reply-To: <98ece42c21301b8384d4b2e92cedb232b324b6a0.camel@siemens.com>
References: <20210823101205.29267-1-andrej.valek@siemens.com>
	 <ce3005b3-6213-9528-2c82-c4f612f3b549@gmail.com>
	 <DB8PR10MB3977E6C2E704FF73707CA62492C49@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
	 <CAJ86T=V2zSGf3ebYWFh-2-QZ1w55Xsz+6nbkcR9jayh9ANyraQ@mail.gmail.com>
	 <DB8PR10MB3977DC6B069FA94E5EB4399992C59@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
	 <452907b1c72251c6a445882c7dea2ea2dc1b913e.camel@siemens.com>
	 <1b35875da7fb3481400f09bcefd532be90d098cf.camel@linuxfoundation.org>
	 <98ece42c21301b8384d4b2e92cedb232b324b6a0.camel@siemens.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-08-26 at 11:24 +0000, Valek, Andrej wrote:
> Hello Richard,
> 
> If it isn't a big deal, I can use the "--enable" variant. If we keep --
> enable-nls like a default, we will brake nothing I guess. (It's enabled
> by default anyway). So I'm adding there only a feature to disable it
> with PACKAGEOPTION.

Yes, lets use --enable please since that is the way the rest of the world/code 
works.

I'm a bit worried about the nls option since the recipe does have BBCLASSEXTEND
for native/nativesdk and we do disable nls for native by default. As you say,
the patch probably doesn't change anything but it is a bit of an oddity.

The code does look to be using gettext and there is a gettext-native dependency
but the recipe does not use the gettext class. Why? Not sure.

I'll put the patch in for testing if we can use the standard format though
(which should work since I checked and configure is using the standard autoconf
macros).

Cheers,

Richard

