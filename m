Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA98C433F5
	for <webhook@archiver.kernel.org>; Sun,  8 May 2022 12:47:25 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.20127.1652014037888720885
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 05:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hC15Cxnt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id w4so15968249wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 05:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=0Q5S6S+Bo97PUNju7ulFrYWrVkNKFW5yEkRzPY2yszg=;
        b=hC15Cxnt9FiNJ9LS0NtoKRdA/fuAxOB9WLg9LU7N+6hAQQxuF/jbKaPG0Z1UxvL1l9
         bkUJlKUbK5u+jdSuB1KSgdsO6waVt916S6nJuoK1ToFDeSQvuRRw1MY30VD2x53JYuwi
         LpAEMc6QvDeBOs3GQf126CrMWXIk3aByT0x4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=0Q5S6S+Bo97PUNju7ulFrYWrVkNKFW5yEkRzPY2yszg=;
        b=bbGJF2xtedKyHEZlsBNrTcEK2kwxjdPoxTwdx9gh1FG1yvvFb/bZBBE94YMRcaqrWA
         QOuSE4VQE11mRPm8HGKe1xfEWtX0ZU2p4hPUgvdDwvj6KmlrKcRCCmVy8DzL8M6gfGZk
         4ljXTszjZSvAfXHfs4HKvkNDrFoyFTYYYfJsYoF+mx6pgL7mlMzxIKPquC5XvgZUOTQm
         FUsD3lxADUX6cLkLUAQc+FIE61/V/AVJ1iFMPego7DTjsfXpxxm1HRlXw5hzj+kGNwmJ
         EPF45owHf1wUNtYrgC7oSY7NC/ZC9TrFofSZdvUqeQimyRyP/H8kOZ+DLijUnXq1LNAa
         ZyOA==
X-Gm-Message-State: AOAM531GP3YaFPh8db5Az2Ae/wxjMU92tk2Q9XggVkMqA6Msw7qTMsTY
	LZjwgkQdDeLtvvbwXESawyyFyQ==
X-Google-Smtp-Source: 
 ABdhPJzlf6/7ckJcW+VasfvNKObfCYHLYHQnCcYaYgPZyPZMtMcWf/2Ans94wX+uDpucJfQz7Tn+3Q==
X-Received: by 2002:a5d:680f:0:b0:20a:d858:f703 with SMTP id
 w15-20020a5d680f000000b0020ad858f703mr9835059wru.414.1652014036320;
        Sun, 08 May 2022 05:47:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cf4d:812e:ce2e:1ff8?
 ([2001:8b0:aba:5f3c:cf4d:812e:ce2e:1ff8])
        by smtp.gmail.com with ESMTPSA id
 h5-20020a1ccc05000000b003942a244f29sm14192669wmb.2.2022.05.08.05.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 05:47:15 -0700 (PDT)
Message-ID: 
 <8afbfd2d139a2d19752af376f3bbeae39f64029a.camel@linuxfoundation.org>
Subject: Re: [OE-core][RFC Patch] Revert "kernel: make kernel-base recommend
 kernel-image, not depend"
From: richard.purdie@linuxfoundation.org
To: Max Krummenacher <max.oss.09@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross@burtonini.com>, Max Krummenacher
	 <max.krummenacher@toradex.com>
Date: Sun, 08 May 2022 13:47:14 +0100
In-Reply-To: <20220508110416.51510-1-max.oss.09@gmail.com>
References: <20220508110416.51510-1-max.oss.09@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 May 2022 12:47:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165374

On Sun, 2022-05-08 at 13:04 +0200, Max Krummenacher wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
>=20
> This reverts commit 1c90b27d2c65cfb4f9debf0272820b6a95942f76. [2]
>=20
> To exclude the kernel image from the final rootfs the documentation [1]
> suggest to override `RDEPENDS:${KERNEL_PACKAGE_NAME}-base`.
> With the change to RRECOMMENDS all layers which followed that suggestion
> now do get the kernel image as the override has no longer any effect.
> (a affected machine: openembedded-core/meta/conf/machine/include/qemu.inc=
)
>=20
> Is the use case described in the commit not solvable with less severe
> side effects?
>=20
> [1] https://docs.yoctoproject.org/singleindex.html#how-do-i-install-not-i=
nstall-the-kernel-image-on-the-root-filesystem
> [2] https://git.openembedded.org/openembedded-core/commit/meta/classes/ke=
rnel.bbclass?h=3Dmaster-next&id=3D1c90b27d2c65cfb4f9debf0272820b6a95942f76
>=20
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

That patch did solve a real world issue and I'm not sure how else we're
fix it. As such I think we'll need to update the documentation.

We should be able to add some kind of warning to let BSPs know
something needs updating too? Would that help?

Cheers,

Richard

