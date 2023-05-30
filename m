Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A743C77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 13:30:22 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.10094.1685453413631614016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 06:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=QkjZFiWz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-30aeee7c8a0so1363911f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 06:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685453412; x=1688045412;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPuxTVVsegUv0bSPFLtle5i5OdKLs0KDL9cqBuaPQfY=;
        b=QkjZFiWzqgItJt54Pk/VG5Nkzs4OwzSTdl8F8p+HG7diCzCErJgp7TiuQlNK40+442
         O+7EO7qfgKXewxYr+NXfA+DaYvyfVvOoyEnDMeH26VVNd0HThnA9Ouj3zAPxOr75Cy8T
         oYYI+XwIvBDXfo1LCHoNDOuwyIO14nrBtX0+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685453412; x=1688045412;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XPuxTVVsegUv0bSPFLtle5i5OdKLs0KDL9cqBuaPQfY=;
        b=BwDOgyXHF/nZ1W0GcbLgQpLRrnFJ0QNhhZ7VH6xa94WEPjlERzhUr4VdgayqaBA/sd
         cDR4XEfSEpLvV1tvblxiXdKLPRgD67NbupMv2UQpR1+1FEelavA5jRaf7THAzGPf/ilj
         /jrH/421ix09UrSoGw1kNbzAQf37ackqOB10fI7Fx2SQBM+V2Z0xzMp8l2AI2RB7/BTG
         UzE0Yrze6DJOwptrbDAp3uBwHEwmlAqZjehuNIqgtil65aeW4EIrt+dzYPp/l3zeADGk
         JSHEixZEcZtl1Jsh0chnsdq58mRXa4z3Xpk6iW8VLJNPEjjPiHDTNY74axBIUwzczVfl
         9UhQ==
X-Gm-Message-State: AC+VfDyd7JHq/m8j30gxHx/DECdn6vD//F7S8FxP948rvhyci/NQbDUQ
	wGOfLhY/mO0kNtvxp9z02WqrQQEs5nIdMkmefOA=
X-Google-Smtp-Source: ACHHUZ5Ia7PadQ+7ZA7AuDuA3c5lLqBJnVubEKw/5Bsen+rH2IYlkX5FM/eZnin0z+UjYGCw+W0mDA==
X-Received: by 2002:adf:d4d0:0:b0:30a:e3bb:ba8b with SMTP id w16-20020adfd4d0000000b0030ae3bbba8bmr9137348wrk.29.1685453412035;
        Tue, 30 May 2023 06:30:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f1a1:bff7:58e4:eab3? ([2001:8b0:aba:5f3c:f1a1:bff7:58e4:eab3])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d522e000000b0030aded83385sm3338199wra.27.2023.05.30.06.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 06:30:11 -0700 (PDT)
Message-ID: <5e5a86e0a85dca8745393ff3f8a7fde37f004b1c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemu: Split the qemu package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2023 14:30:10 +0100
In-Reply-To: <20230530131708.1916975-1-mingli.yu@eng.windriver.com>
References: <20230530131708.1916975-1-mingli.yu@eng.windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 13:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181923

On Tue, 2023-05-30 at 21:17 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>=20
> Currently all files packaged into one package such as qemu-7.2.0-*.rpm.
> After the qemu package installed on the target, it will take up 464M
> which includes not only the one matches the arch of the target but aslo
> all available built qemu targets which set by QEMU_TARGETS.
>=20
> Split the qemu package into qemu-7.2.0-*.rpm, qemu-aarch64-7.2.0*.rpm,
> qemu-arm-7.2.0*.rpm, qemu-x86_64-7.2.0*.rpm and etc. And let user can onl=
y
> choose the corresponding qemu arch package they want to install should ea=
se
> the concerns who cares much about the size in embedded device as it
> decreases the qemu rpm(qemu-7.2.0*.rpm) size from about 65M to about 17M
> and the size of the extracted qemu RPM decreased from about 464M to about
> 248M.
>=20
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index a87dee5c99..7302d63747 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -230,6 +230,25 @@ INSANE_SKIP:${PN} =3D "arch"
> =20
>  FILES:${PN} +=3D "${datadir}/icons"
> =20
> +python(){
> +    allarchs =3D d.getVar('QEMU_TARGETS').split()
> +    packages =3D d.getVar('PACKAGES').split()
> +    pn =3D d.getVar('PN')
> +
> +    newpackages=3D[]
> +    for arch in allarchs:
> +        archpackage =3D 'qemu-' + arch
> +        if archpackage not in packages:
> +            newpackages.append(archpackage)

Are any of the architectures already in packages? I'm a little curious
if there are and why?

> +        d.setVar('FILES:' + pn + "-" + arch, '${bindir}/qemu-' + arch)
> +        d.appendVar('FILES:' + pn + "-" + arch, ' ' + '${bindir}/qemu-sy=
stem-' + arch)

Why set a variable, then append to it?

> +        if arch =3D=3D "mips":
> +            d.appendVar('RDEPENDS:' + pn + '-' + arch, ' ' + 'bash')

May as well just do:

RDEPENDS:${PN}-mips +=3D "bash"

?

> +    packages =3D newpackages + packages
> +    d.setVar('PACKAGES', ' '.join(packages))
> +}

Also, should the main qemu package pull in all the other subpackages?

Cheers,

Richard

