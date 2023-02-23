Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96396C64ED8
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 21:27:34 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.2015.1677187648304753525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 13:27:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cRDRuSDS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id p26so10010384wmc.4
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 13:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h6/UDV1B1/omUqvL2T7PjniWztmcJKbbL3s/T7g+q8g=;
        b=cRDRuSDSyyCkx1tFoO3US1DBdbSpaZywy++gFgv2slra7/EpUziAN8Zz4crPAFYZzf
         KNNuS3pc5snSTcPh0Dm8kNIz0+AzH4KadSbIJghv9S4ahQnXxQiNQC+tiz1HLijcbNU9
         J+VdwHWm4ASCdvoY+n+NgRitRu6+plL6MesOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h6/UDV1B1/omUqvL2T7PjniWztmcJKbbL3s/T7g+q8g=;
        b=FG7PGpA6fcd9o5XA1x2tHNlsybCks06TuxrYmYezvGHlQmuPlbd6Cyow8uX/tj/aDN
         Fqa6yZTdZ8anIrhsIPBq07/N/x1XZRLfO35j+25+d25mJ5xCugM8qv3x32YgFY4Xcz/Y
         UwZiZzZJLwYzGwMtfk5+F4Xv9I/Kuu6xdFdbObj4rTnoVCSUift5Yt6C+aerPP28iNp7
         /WDGhujDvoIAvW/OB7TPEfvsYNbd93Pxw57YZQ7r/exYzUwlXT/zSHls5cc9g11S/sXf
         N9vwFIRUnxwC/sRpmd/DRhBF89YOgt/kZjA92FRngVK8etL+IRYQ54yqXfRCBwfKUqR2
         VTVQ==
X-Gm-Message-State: AO0yUKXNNaOb+lSfZ78BtOjidUnpa6wIKif2M5wL7779m3nroLmxFCx4
	bZ7brgsiVZL9yz5aOTDtWvRLxA==
X-Google-Smtp-Source: AK7set8fxnANKEOhu5aselEQiEL0Q2eUk11jkrGrT+P38SYP+4o8AMi2Tzyt/n9I+ni2yy9Jlmsjlg==
X-Received: by 2002:a05:600c:1e86:b0:3ea:e834:d0d1 with SMTP id be6-20020a05600c1e8600b003eae834d0d1mr951592wmb.36.1677187646492;
        Thu, 23 Feb 2023 13:27:26 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7? ([2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7])
        by smtp.gmail.com with ESMTPSA id bi13-20020a05600c3d8d00b003e204fdb160sm555965wmb.3.2023.02.23.13.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 13:27:26 -0800 (PST)
Message-ID: <e86a37ada8859a11797f5d88e54eb972601a8f77.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv4] vte: update 0.70.2 -> 0.70.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Markus Volk
 <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2023 21:27:25 +0000
In-Reply-To: <CANNYZj8bg9srORG8rcOfqsmy420ZfFmSKAaZtJ7_D5eTibddDA@mail.gmail.com>
References: <20230223191937.1215699-1-f_l_k@t-online.de>
	 <CANNYZj96mFc9LN_R-Mn+6tzrNwW1TKr14bf6+1PaModzF+8gWA@mail.gmail.com>
	 <HFUJQR.91EYCKKAYQ3R3@t-online.de>
	 <CANNYZj8bg9srORG8rcOfqsmy420ZfFmSKAaZtJ7_D5eTibddDA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 21:27:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177632

On Thu, 2023-02-23 at 21:10 +0100, Alexander Kanavin wrote:
> On Thu, 23 Feb 2023 at 21:04, Markus Volk <f_l_k@t-online.de> wrote:
> >=20
> > Am Do, 23. Feb 2023 um 20:46:03 +0100 schrieb Alexander Kanavin <alex.k=
anavin@gmail.com>:
> >=20
> > Why does gtk4 need to be removed as well in this case?
> >=20
> >=20
> > Because gtk4 is not allowed to build for nativesdk yet, only for
> > native. I've tested that it'll work, if 'nativesdk' is added to
> > BBCLASSEXTEND for gtk4, xkeyboard-config and libxkbcommon
>=20
> Then that would be the correct fix.

Not necessarily. The question is whether we need gtk4 support in our
SDK? I've prefer not to build/include things we don't need and I'm not
sure where gtk4 is being used there as yet?

Cheers,

Richard

