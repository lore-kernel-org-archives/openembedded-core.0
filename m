Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69ADC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 21:00:32 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.387.1702501228212327513
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 13:00:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ap2qPsWh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c4846847eso36589655e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 13:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702501226; x=1703106026; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sGiSIRaDyUN91yVAa37aDkenTCfq/lYAotqItj3Qe2w=;
        b=Ap2qPsWhHCaT7tVc4p0Yf0ANRmqsKvSSWbtXum0e4dE0vw01Qp7DVxvtzNdnmWDMXC
         lM0if2OqGTMJRx68s3UNx4mAfQKk6zQ5z4XoGAD6tJ+5p4JjKQGk1fImwnMB5ONUuaRV
         s29ydTDcghYeAd9PoR5TFEc2U9Q2UXfN97ETw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702501226; x=1703106026;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sGiSIRaDyUN91yVAa37aDkenTCfq/lYAotqItj3Qe2w=;
        b=ZjeQB75DbLUyLIg6eCq4nWsdFVA8jPZf2QewcTgN0UdsofVGqW4bE3/lHjO18uyZa+
         qWw0KRvHCz5/zYQIRMOfkZmYutN1ReEHbSEmpvwCwJUR5So2Y3wo10E7/NoQ9fDSNr7r
         gKpRADkkRxCADidPsgBjUr8mJgXzFWwzWdujdWn8XfhFqMCeFA8Dw2KaBiw8MZZmx4ua
         FWH1yg8y3fEQEUDYTf5ZIFOe82Ac/8xx/lzDkMdueLRyFd+uvIdihs7SLPG71MsalAp2
         zPaa1wWYDhq3i0cJLoipiTBGSwRbbbZRBYgLBEtwnpP86buZYr7G58tJtbmn27ZtYniI
         4UxA==
X-Gm-Message-State: AOJu0Yz9EiAa0ivg/QccI2jZtQrAoA6tWgAQDPj7Sk859orhkl8psZBo
	7ZXa71s3Y57SS5ZsKEO7hckKVKeKiEOcOdNLgDg=
X-Google-Smtp-Source: AGHT+IEqAV2DGXu7fqJh8v6LrT/+F64sRYats4suz5y1KhPeI8kBww0NM2kAaFtRjpZvLUKIhcL/4A==
X-Received: by 2002:a05:600c:474c:b0:40c:4575:204c with SMTP id w12-20020a05600c474c00b0040c4575204cmr3311387wmo.176.1702501226608;
        Wed, 13 Dec 2023 13:00:26 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7173:bb34:6d69:83d3? ([2001:8b0:aba:5f3c:7173:bb34:6d69:83d3])
        by smtp.gmail.com with ESMTPSA id l6-20020a05600c4f0600b0040b45282f88sm23994440wmq.36.2023.12.13.13.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 13:00:26 -0800 (PST)
Message-ID: <58828ff743cb7eeb8f848ddde7bff1405cf542b4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2 2/4] python3-qemu-qmp: Add recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Eil=EDs?= 'pidge' =?ISO-8859-1?Q?N=ED_Fhlannag=E1in?=
	 <pidge@baylibre.com>, openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Date: Wed, 13 Dec 2023 21:00:25 +0000
In-Reply-To: <e7c107503fb1a3cb60b8f91b1150099f8377ca86.1702499299.git.pidge@baylibre.com>
References: <cover.1702499299.git.pidge@baylibre.com>
	 <e7c107503fb1a3cb60b8f91b1150099f8377ca86.1702499299.git.pidge@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 21:00:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192324

On Wed, 2023-12-13 at 20:30 +0000, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=
=A1in wrote:
> From: Ross Burton <ross.burton@arm.com>
>=20
> Add a recipe for python QEMU Monitor Protocol. This will be needed for
> qemu screendumps for qemu screendump testing.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibr=
e.com>
> ---
>  .../python/python3-qemu-qmp_0.0.2.bb               | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.b=
b
>=20
> diff --git a/meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb b/met=
a/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb
> new file mode 100644
> index 00000000000..faa0cc69738
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "asyncio library for communicating with QEMU Monitor Protoco=
l (QMP) servers"
> +LICENSE =3D "LGPLv2+ & GPLv2"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cf66a4984120007c9881cc871cf4=
9db \
> +                    file://LICENSE_GPL2;md5=3D441c28d2cf86e15a37fa47e15a=
72fbac"
> +
> +SRC_URI[sha256sum] =3D "c918e9e3ae09abdf70c7ece67637a93ac4583d940bbf48d2=
4ff77987f74f1b8b"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +PYPI_PACKAGE =3D "qemu.qmp"
> +
> +DEPENDS +=3D "python3-setuptools-scm-native"
> +
> +BBCLASSEXTEND =3D "native nativesdk"

None of the errors Alexandre reported originally from the autobuilder
have been fixed here :(

(HOMEPAGE, missing maintainer entry and so on)

Also, I'm not sure what qmp is doing on the target with this recipe?
Does qmp trigger remote command execution inside the guest? I'd
previously assumed the framedump was from the external presentation
rather than internal to the guest.

Cheers,

Richard

