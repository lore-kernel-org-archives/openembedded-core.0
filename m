Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F6DC25B5C
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 05:07:42 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.4515.1715058461686774287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 22:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S+0h0G9+;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51f1e8eaee5so3893464e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 22:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715058460; x=1715663260; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3U4FwJA0mpv9y1ckMebfPQuNVaZepnu0fclBZ1NchSY=;
        b=S+0h0G9+quwz7nlceOSLjjmN66ZQQrF6KpUhwU8K2AaumTObunAYuD7Cmd6kMmbyVB
         nplqGl5+UK8gOGVfYovur8RWdp5E5EsrmqEoaraCAn5WwNnLjQn5nhAuJhUfjKsUQcJ1
         OIx6RClwelFW+4SFU2+Eq+TTdIMPsDYi+JgkfwoVlAFliRlUX73h8F3snlfvWVdjU3Og
         SQsIMRjKL92LjG5VUuKF+olkY4eHz7vwCFDMGfEe73x8AbHhodwP5ElA5H2TrUC9iokL
         GlUXSRfXEdQRDaMsH1Y1y1Qf8L4TGW3ONaLpZHz/IpMr6UulFxpfDYsxmjJnVItZDYba
         d1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715058460; x=1715663260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3U4FwJA0mpv9y1ckMebfPQuNVaZepnu0fclBZ1NchSY=;
        b=KDGMRZTKbwZ/SUXUvqydygXFQUCIJ6NglSB32X+44yypCvzQTulQaAJfbqds0o6noA
         963m1erMVwnO+0GrundSQkSG+DRdHmv1fd1YD8Z4JKHMG5STjnIEibVuixyM/OeA3u5y
         cRkjh26RxZdoyB6AgxEf2Lcv1FGd+J+2B6Z+TwVJcGTwy85xGB88grvELdMRgs2LSl5G
         D9E4gYCqMKBC4ns/1TJ9ywz5mLfbTRt7OMVIvH/F2p9MNp6LUPlRzQuERsE5Xw+c7g+t
         qp8upSfNpGHta69zExn+AEGjhvZT2XmqqbERm9v+g/q4TozjR7GXzrimgacvqVqjL1FE
         u+ZQ==
X-Gm-Message-State: AOJu0YxT6e+vyido92IfjAMyssji4KpSj/PS0/uB+KghnHOoZc5/hYLd
	/FeCcV2bjzCWi2LmSQqEGBj8dnJykgrx24Q8Wvrm8T2TFtugI8swkEDJV0FWRJPbLFlD4vboM4+
	VwX2TqWABCpDD/2U8SyporXQqJBU=
X-Google-Smtp-Source: AGHT+IFcH3uwzgeMoRKIsXOUG4MB1O1+eBRteXjoLc1J8QfiUpzV5WKqGLb5sYASZ+hq/TSAFpaekRW9ORWQlsIbu3k=
X-Received: by 2002:a05:6512:29b:b0:51e:f830:2dec with SMTP id
 j27-20020a056512029b00b0051ef8302decmr461753lfp.17.1715058459559; Mon, 06 May
 2024 22:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240507011455.313230-1-raj.khem@gmail.com> <20240507011455.313230-4-raj.khem@gmail.com>
In-Reply-To: <20240507011455.313230-4-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 7 May 2024 07:07:27 +0200
Message-ID: <CA+chaQfpN17BCSy8PYsBX0BGOtSHjr6aM3orvySVs83YOFmboA@mail.gmail.com>
Subject: Re: [PATCH 04/10] zip lrzsz connman-gnome kea libfm: ignore various
 issues fatal with gcc-14
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 05:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199066

kea should be dropped from this (commit message as well as the bbfile)
I had a fix in my jansa/master-gcc14 branch and now you have a
different one in this series, so the TODO here doesn't make sense
anymore, you can pick it from:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/ma=
ster-gcc14&id=3D4c89509e37f86f4d8e0bfce6135e6eaefd9e216f
as mentioned yesterday

On Tue, May 7, 2024 at 3:15=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> From: Martin Jansa <martin.jansa@gmail.com>
>
> TODO: kea
>
> work arounds for:
> oe-core/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb:do_compile
> oe-core/meta/recipes-connectivity/connman/connman-gnome_0.7.bb:do_compile
> oe-core/meta/recipes-connectivity/kea/kea_2.4.1.bb:do_compile
> oe-core/meta/recipes-support/libfm/libfm_1.3.2.bb:do_compile
> oe-core/meta/recipes-extended/zip/zip_3.0.bb:do_compile
>
> http://errors.yoctoproject.org/Errors/Build/183127/
>
> More fixes on ML (especially for -native with gcc-14 on host)
> zip: https://lists.openembedded.org/g/openembedded-core/message/198783
> cdrtools: https://lists.openembedded.org/g/openembedded-core/message/1988=
99
> syslinux: https://lists.openembedded.org/g/openembedded-core/message/1989=
01
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb                | 6 ++++++
>  meta/recipes-connectivity/connman/connman-gnome_0.7.bb | 4 ++++
>  meta/recipes-connectivity/kea/kea_2.4.1.bb             | 6 ++++++
>  meta/recipes-extended/zip/zip_3.0.bb                   | 5 +++++
>  meta/recipes-support/libfm/libfm_1.3.2.bb              | 4 ++++
>  5 files changed, 25 insertions(+)
>
> diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/l=
rzsz/lrzsz_0.12.20.bb
> index 63edcbd8643..3024ddcaf07 100644
> --- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
> +++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
> @@ -46,3 +46,9 @@ ALTERNATIVE_TARGET[rb] =3D "${bindir}/lrz"
>  ALTERNATIVE_TARGET[sz] =3D "${bindir}/lsz"
>  ALTERNATIVE_TARGET[sx] =3D "${bindir}/lsz"
>  ALTERNATIVE_TARGET[sb] =3D "${bindir}/lsz"
> +
> +# http://errors.yoctoproject.org/Errors/Details/766929/
> +# lrzsz-0.12.20/src/tcp.c:75:56: error: passing argument 3 of 'getsockna=
me' from incompatible pointer type [-Wincompatible-pointer-types]
> +# lrzsz-0.12.20/src/tcp.c:83:52: error: passing argument 3 of 'getsockna=
me' from incompatible pointer type [-Wincompatible-pointer-types]
> +# lrzsz-0.12.20/src/tcp.c:103:51: error: passing argument 3 of 'accept' =
from incompatible pointer type [-Wincompatible-pointer-types]
> +CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/met=
a/recipes-connectivity/connman/connman-gnome_0.7.bb
> index f6150d98ec9..46b3f854c52 100644
> --- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> +++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> @@ -28,3 +28,7 @@ RDEPENDS:${PN} =3D "connman"
>  do_install:append() {
>      install -m 0644 ${UNPACKDIR}/images/* ${D}/usr/share/icons/hicolor/2=
2x22/apps/
>  }
> +
> +# http://errors.yoctoproject.org/Errors/Details/766926/
> +# connman-client.c:200:15: error: assignment to 'GtkTreeModel *' {aka 's=
truct _GtkTreeModel *'} from incompatible pointer type 'GtkTreeStore *' {ak=
a 'struct _GtkTreeStore *'} [-Wincompatible-pointer-types]
> +CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-co=
nnectivity/kea/kea_2.4.1.bb
> index 6c1e457938a..fc963e545ad 100644
> --- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
> +++ b/meta/recipes-connectivity/kea/kea_2.4.1.bb
> @@ -75,3 +75,9 @@ FILES:${PN}-staticdev +=3D "${libdir}/kea/hooks/*.a ${l=
ibdir}/hooks/*.a"
>  FILES:${PN} +=3D "${libdir}/hooks/*.so"
>
>  PARALLEL_MAKEINST =3D ""
> +
> +# http://errors.yoctoproject.org/Errors/Details/766928/
> +# TOPDIR/BUILD/work/qemux86_64-webos-linux/kea/2.4.1/recipe-sysroot-nati=
ve/usr/bin/x86_64-webos-linux/../../libexec/x86_64-webos-linux/gcc/x86_64-w=
ebos-linux/14.0.1/ld: ./.libs/libdhcp4.a(dhcp4_srv.o): in function `isc::dh=
cp::OptionDescriptor isc::dhcp::CfgOption::get<char [6]>(char const (&) [6]=
, unsigned short) const':
> +# /usr/src/debug/kea/2.4.1/src/lib/dhcpsrv/cfg_option.h:608:(.text._ZNK3=
isc4dhcp9CfgOption3getIA6_cEENS0_16OptionDescriptorERKT_t[_ZNK3isc4dhcp9Cfg=
Option3getIA6_cEENS0_16OptionDescriptorERKT_t]+0x85): undefined reference t=
o `isc::dhcp::CfgOption::getAll(std::__cxx11::basic_string<char, std::char_=
traits<char>, std::allocator<char> > const&) const'
> +# collect2: error: ld returned 1 exit status
> +# TODO: Fix for gcc-14
> diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended=
/zip/zip_3.0.bb
> index 70df5ab8728..e7705b8faf4 100644
> --- a/meta/recipes-extended/zip/zip_3.0.bb
> +++ b/meta/recipes-extended/zip/zip_3.0.bb
> @@ -53,3 +53,8 @@ BBCLASSEXTEND =3D "native"
>
>  # exclude version 2.3.2 which triggers a false positive
>  UPSTREAM_CHECK_REGEX =3D "^zip(?P<pver>(?!232).+)\.tgz"
> +
> +# http://errors.yoctoproject.org/Errors/Details/766953/
> +# unix/unix.c:84:51: error: passing argument 4 of 'fread' from incompati=
ble pointer type [-Wincompatible-pointer-types]
> +CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> +# proper fix on ML: https://lists.openembedded.org/g/openembedded-core/m=
essage/198783
> diff --git a/meta/recipes-support/libfm/libfm_1.3.2.bb b/meta/recipes-sup=
port/libfm/libfm_1.3.2.bb
> index 057c7370293..1d7609165b4 100644
> --- a/meta/recipes-support/libfm/libfm_1.3.2.bb
> +++ b/meta/recipes-support/libfm/libfm_1.3.2.bb
> @@ -53,3 +53,7 @@ do_install:append () {
>      rm -f ${D}${libdir}/libfm-extra.a
>      rm -f ${D}${libdir}/libfm-extra.la
>  }
> +
> +# http://errors.yoctoproject.org/Errors/Details/766924/
> +# libfm-1.3.2/src/actions/action.c:2050:25: error: assignment to 'gchar =
**' {aka 'char **'} from incompatible pointer type 'const gchar * const*' {=
aka 'const char * const*'} [-Wincompatible-pointer-types]
> +CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> --
> 2.45.0
>

