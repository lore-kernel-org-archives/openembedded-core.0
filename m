Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12940.1794489454151280193
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 05:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bt455qeu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so32830505e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 05:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794489452; x=1795094252; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DsXFv9TQRfHwBqEyeMIBc1BTftsYNnMjhDfQxITSBw8=;
        b=bt455qeuUaZhgGdb6r4XGkSEMU+SSPlJl0UZpj2rm8fPnbL4ro9nvjaB7SJN32QBIU
         H/ayzCDNaBgmbUlaKEnE0KOOdDu1DsnhAY/00OTwGJy/TeLBaC2VFMSpPi0yWSEi8YOV
         51nUaOmdPRJvtYwSpvyRRM/0DwrpoXuKnSJaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489452; x=1795094252;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DsXFv9TQRfHwBqEyeMIBc1BTftsYNnMjhDfQxITSBw8=;
        b=Aa6gGGSG421WuRUz/+YcfF2PcHGK1tmoDRaSO0MasJAux97EkWX2BfB0xo88orlFJ6
         1NZqCepPqP4tcNnuoF8RPHTD5XiDH5ckPPo4h5KPK7udhXU6i12X70r/tZOo5oR63BRE
         zzm5mgCNiowZbepsA6k1NtbpZkmWY9/ueW/yZTg9gCy5TrWWtVVADd3bs2O0XxBvDlhP
         Dht+2wZNGNI5MjchyhRuynzXxUXYJn/D0VPhfzQ5vSo+3AWc7sbQQJegKcuoygLmW1ow
         sLgw2/set06MLRomc6DvMBqM9gLG2qX4NKSZ7uB8jFllgx2b4tL7TZbcVI1PtYdQ99mF
         3KNQ==
X-Forwarded-Encrypted: i=1; AL+hErHzaWhwS9odljze3//Je5mqBzFzJ38v5ca0nRiHGvh2WxJssRkwrLmAXI8K5LjsAAwwz0rxO6P5zn0ZOj6JlN1pjg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/ZwF4nzuoeWrroXqhOLRjt8QX0SCCi4fUQFcq6T0agC3R37l3+
	ay+w9oXy4jaoGYoZhlAPwpgie6cKkDySnrngYFXgNWOdoInj7KMQTU5OBFhGRVq9xks=
X-Gm-Gg: AYBFou27iz2+yJVXorSv73rKTpUE76IZLBnI1mccH/hSqhSOEDMYbVKJxKcGc6UNgTC
	vzB50bxNnGZhqZxu8vsyPcX6zj1FDAeEwf4OD0N7CJiX/AyiAQe1usJGia28xsDMPVCv4uOb7UC
	TZQ6FIm+YTSQgoxotALTnX109hDhIysuuGvdr2cMyx+N2EgoyhDEIiPxCPZrmmywbNvMILe2at4
	VHUUqoFLrMwBVEwMtNcSUZiiRIN6lxAohsLtiovKmeoWx1JFzjYOu6viboDoKhSHflD9u9843ed
	3AuiX6rTDbvL29w+heJ500GtAXlGWFtounvok+y6UfCG9kohOg3LuGuhDht3DYuRPrzCgbVYzGA
	/xsXcpOOpDxrXQoo2v4gy9eBJws7EFf8w+vfzJbr99veIpLv/d2AmOMcYOWxqwr4INI4IVTPerC
	VCkKdqVueMct0VgaoxGlXsmlErjJE28Q426QsEA0dOHa18qOSZe7jqjGYnheiXXYZMskdsdwBYs
	0kzp0+8Ord2hcdG2RdkcrEysU+HEDOBpWCrINzv6uRre7kBnWLrrqu8FwXsWl8YAyIpiSqr0bx6
	9CgfCwQrPuR8WTyUSnItlUYmetGKHoW8pxQw1Ozwhj9t8KrCM+0bxI3YCqHWq7j37JOGKC/mY3o
	x4eah3b//Z3C151QOMw==
X-Received: by 2002:a05:600c:4f09:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4ba09383b92mr109201755e9.23.1794489452288;
        Thu, 12 Nov 2026 05:17:32 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1562:9f61:e354:1b51? ([2001:8b0:aba:5f3c:1562:9f61:e354:1b51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2776casm101776195e9.14.2026.11.12.05.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:17:29 -0800 (PST)
Message-ID: <676b4fc400334171a9619f1a4d1188d26473c366.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] kernel.bbclass: fix -dev files when
 KERNEL_PACKAGE_NAME is PN
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ragaprasanth@gmail.com, openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com
Date: Thu, 12 Nov 2026 13:17:28 +0000
In-Reply-To: <20261029060834.1586465-1-ragaprasanth@gmail.com>
References: <20261029060834.1586465-1-ragaprasanth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10build1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 13:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250092

On Thu, 2026-10-29 at 15:08 +0900, prasanth via lists.openembedded.org wrot=
e:
> For a second kernel next to virtual/kernel needs its own package names, e=
.g.
>=20
> =C2=A0 KERNEL_PACKAGE_NAME:pn-linux-yocto-rt =3D "linux-yocto-rt"
> =C2=A0 PROVIDES:remove:pn-linux-yocto-rt =3D "virtual/kernel"
>=20
> FILES:${KERNEL_PACKAGE_NAME}-dev and FILES:${PN}-dev from bitbake.conf
> are then the same key. Keys expand in sorted order, bitbake.conf wins
> and do_package fails with installed-vs-shipped for System.map,
> Module.symvers and config. -dbg only gets the collision warning, as the
> bitbake.conf value is a superset.
>=20
> Rename the kernel FILES to the ${PN} names in a RecipePreFinalise
> handler. __anonymous() is too late and would drop bbappend :append, and
> a class :append would still warn.
>=20
> -dev now matches kernel-dev, without the bitbake.conf -dev defaults.
> The default KERNEL_PACKAGE_NAME =3D "kernel" is unchanged. Drop the bug
> 11905 warning, as that is expected bitbake behaviour.
>=20
> AI-Generated: Uses Claude
> Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
> ---
>=20
> Notes:
> =C2=A0=C2=A0=C2=A0 v2: added the use case, why the handler is needed, -db=
g/-dev notes
> =C2=A0=C2=A0=C2=A0 and the comment.
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 Found while checking the bug 11905 warning in kernel.b=
bclass. Tested on
> =C2=A0=C2=A0=C2=A0 master (qemux86-64): linux-yocto-rt next to linux-yoct=
o fails without
> =C2=A0=C2=A0=C2=A0 the patch and builds with no warnings with it. The def=
ault "kernel"
> =C2=A0=C2=A0=C2=A0 case is unchanged.
>=20
> =C2=A0meta/classes-recipe/kernel.bbclass | 22 +++++++++++++++-------
> =C2=A01 file changed, 15 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index 0a6d754108..77ae9df4c9 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -60,16 +60,24 @@ KERNEL_VERSION_NAME[vardepvalue] =3D "${LINUX_VERSION=
}"
> =C2=A0KERNEL_VERSION_PKG_NAME =3D "${@legitimize_package_name(d.getVar('K=
ERNEL_VERSION'))}"
> =C2=A0KERNEL_VERSION_PKG_NAME[vardepvalue] =3D "${LINUX_VERSION}"
> =C2=A0
> +# With KERNEL_PACKAGE_NAME =3D "${PN}", FILES:${PN}-dev/-dbg from bitbak=
e.conf
> +# would replace the kernel values during key expansion, so rename the ke=
rnel
> +# variables to the ${PN} names first. This must run before key expansion=
, so
> +# it cannot be moved to __anonymous().
> +python kernel_package_name_handler () {
> +=C2=A0=C2=A0=C2=A0 d =3D e.data
> +=C2=A0=C2=A0=C2=A0 if d.getVar("KERNEL_PACKAGE_NAME") !=3D d.getVar("PN"=
):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return
> +
> +=C2=A0=C2=A0=C2=A0 for pkg in ("dev", "dbg"):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.renameVar("FILES:${KERNEL_P=
ACKAGE_NAME}-%s" % pkg, "FILES:${PN}-%s" % pkg)
> +}
> +addhandler kernel_package_name_handler
> +kernel_package_name_handler[eventmask] =3D "bb.event.RecipePreFinalise"
> +

We should not be using event handlers to do this, that is horrible.

Yes, multilib does it and that is probably where AI got the idea from=20
but the kernel should not need to. We need to find a different way.

I at least wanted to share the review feedback, I haven't had the
time/bandwidth to look into other solutions.

Cheers,

Richard

