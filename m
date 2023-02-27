Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF46C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 09:18:21 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.86270.1677489500436125770
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 01:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EEDeIrWd;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id x6so68932ljq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 01:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677489498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V12Yq0I7ChuNi4ETr7Rk5OmoKrW7K76Fy0W+Wb9f0fU=;
        b=EEDeIrWdPuuUWcLtG51rdrxNoPW3QhWoIHCNda2bf3L/EJV+Q/Fm1nMxBL4o6jqQIW
         SHcXkke7Xn/EonG+9RtfhtxevzRI4diM7nX7TJX9fm2bm1Qc/eWwRZWIEyID/VvcdgsU
         /vcN6ujMaYUMQLtzrIkX5jxGVPaCOlH4yPupekH+3XZWSck2ET++l86RTatMDXP6d4MA
         nCSix32LZ0nV9Xfvbdtj9SlKIxpfRLfRGOzuWSeiKWjJi0RorK72PG2H8FNzz6dCEZeO
         /yitaXJ40qQgFhy+3xQdqTgx5XYOT/boyc8fgXcKJ7A0kUcGu7CMH19TI+TvCixifNzk
         +51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677489498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V12Yq0I7ChuNi4ETr7Rk5OmoKrW7K76Fy0W+Wb9f0fU=;
        b=xVpGhyFGLXofJ6LrUBiBx//6RAeLPZF3Mwe0kKL92+thYuS9BzU9/Txijx5S9GZXL0
         En/0gf7pH3IGeNAZ8D/BEAImmOp86dxj1dvuN7oicQnsvusvcmqUDP6vE+ONlQ2CmbZD
         Qy+WQweuQ8620+Fub4VKxiDP+uEGQRNPwfS6KepJy/p9wWuJamL3If0A03Nycg29oq0O
         kX8swegNNJ22wzrPJSJLjfhkThTZ27mWx+RDY+r742vydCqlLKFVuzClT4piLB6EWm73
         AfZqi7XBB4EvyQlfTABTikMF/WuXt8HCZP449ghZH6QVSa2sACk5PvV9Ttqr8m0F4PtZ
         wHqg==
X-Gm-Message-State: AO0yUKWcHE5b3Jz9+YLHLQ8Yvdk7IZ46PatxRCtX+F3IM/cs5wjHvtNa
	qNictbUSlcVFnkZKgknndhQofZm8Y/+aa6zrjEY=
X-Google-Smtp-Source: AK7set+esRAI5D52Ad2tMWiGh4fr3g2eQG31NRmC1fIuLcYweqtGEoEe9juKeicKeCoVQiInODg97Gdh0BbdOyjpf1g=
X-Received: by 2002:a05:651c:1a06:b0:295:ba28:a43 with SMTP id
 by6-20020a05651c1a0600b00295ba280a43mr933388ljb.4.1677489498569; Mon, 27 Feb
 2023 01:18:18 -0800 (PST)
MIME-Version: 1.0
References: <20230224093850.3393567-1-zboszor@gmail.com> <20230226050814.929055-1-zboszor@gmail.com>
 <20230226050814.929055-3-zboszor@gmail.com>
In-Reply-To: <20230226050814.929055-3-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Feb 2023 10:18:07 +0100
Message-ID: <CANNYZj_=qf2kVp-k4Uc8RBCc51n+6L0Xx8RurS7ZSMmnnJJPLA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mesa: Rename PACKAGECONFIG "opencl" to "clover"
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 09:18:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177777

On Sun, 26 Feb 2023 at 06:08, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbosz=
or@gmail.com> wrote:

> @@ -233,6 +233,8 @@ do_install:append () {
>  # RPROVIDEs/RCONFLICTs on the generic libgl name.
>  python __anonymous() {
>      pkgconfig =3D (d.getVar('PACKAGECONFIG') or "").split()
> +    if "clover" in pkgconfig:
> +        pkgconfig.append("opencl")
>      suffix =3D ""
>      if "-native" in d.getVar("PN"):
>          suffix =3D "-native"

Why? This change needs to be explained in the commit message.

Alex

