Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626CCC001DB
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 15:05:27 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.86584.1691939120889651682
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 08:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R+8DSFl2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fe4cdb72b9so31914575e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 08:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691939119; x=1692543919;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RSBTCDC8JGjXTbq2O+J2Nm/LBqnq2lwTm/vBcu9bW1s=;
        b=R+8DSFl2xZq7mm16BHs7YX58SkePyMD0fHjuuCZ722QWCbL2ixeREBlAMAR7PSBSgt
         RxNl6vjxJxcSvjTqJC3x/qclNlkKWFo/lkORJQdgxngdun7NkR+dchTD+Rawl5I2Upj6
         Tm+AFiK6LzTtlE0dSVfKitduA7iSFyq9KmgxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691939119; x=1692543919;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RSBTCDC8JGjXTbq2O+J2Nm/LBqnq2lwTm/vBcu9bW1s=;
        b=OwY0Z4/oUsydLgczfjL91s9NhfAtKTdLOZ+pRthm1wPnCA9uk87zq8H8yYOjCFEJBB
         JxL+d/YI3ii/25F8gTG1AFC3ggO80dOrvJgSZJyYO3z93DT2Hq1/+W8YfhCXBhw2A8VZ
         kV+Sef/fEltENTBcCJv27R530z0LxSUMk8i6382v28bETeWY9/b4UazMZ72kCX6hlR+/
         xbPd5rtEtgsvAbJMBOIwlIvtIWZjifrYvGnZ8Y0VV7qvlas+SOkWyV9ir6fquHXpb78z
         0b1q7raP2WK0tyOGmhd+AhxIcpTIhxzhKAD8o5vQEMvjiZI0sslZCci9vSYpzlvF8NBT
         qY0Q==
X-Gm-Message-State: AOJu0Yw8KRRhBvWHlEKmH/PKDJFy9uxgPw0ZHflMUnfuLcHqwNtN526N
	gHQsAyRPRzLXf+BnyCU6P72CwA==
X-Google-Smtp-Source: AGHT+IHl35SX1rv2eq/yLurotDXelqNHTmVguO1JgxTeGUCmwseTL+B54p9oo7hfHwrYu1AZqB0t3Q==
X-Received: by 2002:a7b:c4d7:0:b0:3fe:1db2:5179 with SMTP id g23-20020a7bc4d7000000b003fe1db25179mr6102728wmk.19.1691939119242;
        Sun, 13 Aug 2023 08:05:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:17a:7286:2cf2:8a86? ([2001:8b0:aba:5f3c:17a:7286:2cf2:8a86])
        by smtp.gmail.com with ESMTPSA id t21-20020a1c7715000000b003fe0bb31a6asm11421851wmi.43.2023.08.13.08.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 08:05:18 -0700 (PDT)
Message-ID: <843d59933f8943bfa78919faf608a7b0feaf3dce.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCHV2 0/4] Introduction of cargo-c class and
 recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Aug 2023 16:05:17 +0100
In-Reply-To: <CA+cAkeqexEemD1vcRoVOdha8e32Wfzr-9-5z-xU3enC_Y41QoQ@mail.gmail.com>
References: <cover.1691914589.git.frederic.martinsons@gmail.com>
	 <c4d2d924272d180ed88076e61dc59abc71d227f0.camel@linuxfoundation.org>
	 <CA+cAkeptfJVB=EzEm46898iXjnNodr7Ct9TzQ7FycOkCkiA0_Q@mail.gmail.com>
	 <177AED879B83B027.8497@lists.openembedded.org>
	 <177AF35A822C5F89.12117@lists.openembedded.org>
	 <89d5c672b989d1ac30a10093c89227da182748e3.camel@linuxfoundation.org>
	 <CA+cAkeqexEemD1vcRoVOdha8e32Wfzr-9-5z-xU3enC_Y41QoQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 15:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185889

On Sun, 2023-08-13 at 17:00 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> On Sun, 13 Aug 2023 at 16:53, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > and a reproducibility failure:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3355=
/steps/13/logs/stdio
> >=20
> > which leads to:
> >=20
> > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230813-z_b=
2j3ha/packages/diff-html/
> >=20
>=20
>=20
> Argh, this makes me remember
> of=C2=A0https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090
> Do you know if any of cargo based recipe is reproducible ?
> Should I add EXCLUDE_FROM_WORLD in cargo-c ?

At some point we're going to have to dive in and fix the
reproducibility issues so I'm reluctant to take more patches with that
set...

Cheers,

Richard



