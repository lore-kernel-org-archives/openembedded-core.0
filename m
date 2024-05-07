Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEEB1C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 05:26:02 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.4674.1715059555453467851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 22:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KZKArc8G;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-23d16b9bca7so1185844fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 22:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715059555; x=1715664355; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwJZlztaVR/m/NPgI9LrFPDl0P5C0o+DIqrT9kwmIiY=;
        b=KZKArc8G4GZBDh4Pmk+tPkIDsCxh0//B5aHHXeCt3UEhuTpenIOcXmIteFgs25dr/v
         vUhwfmvTPoTKv69M2q1pEN22DZm9CdORtxvjhyzzycR9YpzTc0xNRXFAW7j1IN+N6Llp
         g/QK/ldcIyfec29TpORw3O8yu9wn+vAC7td1hdi/SVu0Qd+DS5b5LB8rGurPMSFaNEhp
         3hvMO9CDtzrmI2te44y6eSch170kcZtjfy6j7GcTRZsUOnShJsHqzcsxtgDvnxod27kf
         cwqU8HER1lNaHFe6ACi7tIRjyYTt+/1eQrbBwcpgZrRghrCihfqwOrxh7s6gWTvWPdIE
         il7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715059555; x=1715664355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwJZlztaVR/m/NPgI9LrFPDl0P5C0o+DIqrT9kwmIiY=;
        b=rboF7KsE4Zb5Wh6R1GZ1UFk8qloLCoPL0as/LF3PyAARuQMCrDY7fdHCaseTq56wZi
         3uInjFaoXc3+6YGWEhu8XSworSiBbSYuJSbxKCG+aGOi1nrpKxBrZtDwZQWF9CAjrsQ8
         t49AigV235zyrdFbtSUA70BdVKgzy1GiyOSwUJLTo+2kyAXJMDsAi3ymIsOiCXb+9acy
         mplQN74dY7N+SBT4FBVb9wn+UqekWB0OCeeZg5e1eyN9Y24IuD71WWuHGYXqTAD18jU8
         kV3XjnjwgB+AqIb+rQNrdOKRn77vi6ni6tqrwApEPQIWU/8OSJF9uD6/4ATlWwa9D/Y9
         tCXA==
X-Gm-Message-State: AOJu0YzYFY1CMg3SFbtlluq+b82pfInw+5B1iqOyjnANTRgnN7PmoAaR
	hMIdJLVOzlPtvdE6kjKNdMTkUa3VqUqlO2LvZythr2fvgrzV9mxo0XDTp2E2IDxepEh4NptS4d3
	6IsqPfhs5+fApOehc9iClhsp4iWEVNBo5
X-Google-Smtp-Source: AGHT+IHmtr2ML+hzorWuTEJ0qBNhE+Us2TQEdWv915cp6Kl+1+oVQo6l74NKWe9wNT+drId4TR+QjNr6ry0krORgqfM=
X-Received: by 2002:a05:6870:d205:b0:23f:ba88:d5ac with SMTP id
 g5-20020a056870d20500b0023fba88d5acmr4204788oac.53.1715059554643; Mon, 06 May
 2024 22:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240507011455.313230-1-raj.khem@gmail.com> <20240507011455.313230-4-raj.khem@gmail.com>
 <CA+chaQfpN17BCSy8PYsBX0BGOtSHjr6aM3orvySVs83YOFmboA@mail.gmail.com>
In-Reply-To: <CA+chaQfpN17BCSy8PYsBX0BGOtSHjr6aM3orvySVs83YOFmboA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 May 2024 22:25:28 -0700
Message-ID: <CAMKF1sopseq+zKXn+X-4yUwHwiyiOcGMCQM-dApXnVd9-tXW8g@mail.gmail.com>
Subject: Re: [PATCH 04/10] zip lrzsz connman-gnome kea libfm: ignore various
 issues fatal with gcc-14
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 05:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199068

On Mon, May 6, 2024 at 10:07=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> kea should be dropped from this (commit message as well as the bbfile)
> I had a fix in my jansa/master-gcc14 branch and now you have a
> different one in this series, so the TODO here doesn't make sense
> anymore, you can pick it from:
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/=
master-gcc14&id=3D4c89509e37f86f4d8e0bfce6135e6eaefd9e216f
> as mentioned yesterday

Thanks. I missed it, I think I picked it now.

>
> On Tue, May 7, 2024 at 3:15=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > TODO: kea
> >
> > work arounds for:
> > oe-core/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb:do_compile
> > oe-core/meta/recipes-connectivity/connman/connman-gnome_0.7.bb:do_compi=
le
> > oe-core/meta/recipes-connectivity/kea/kea_2.4.1.bb:do_compile
> > oe-core/meta/recipes-support/libfm/libfm_1.3.2.bb:do_compile
> > oe-core/meta/recipes-extended/zip/zip_3.0.bb:do_compile
> >
> > http://errors.yoctoproject.org/Errors/Build/183127/
> >
> > More fixes on ML (especially for -native with gcc-14 on host)
> > zip: https://lists.openembedded.org/g/openembedded-core/message/198783
> > cdrtools: https://lists.openembedded.org/g/openembedded-core/message/19=
8899
> > syslinux: https://lists.openembedded.org/g/openembedded-core/message/19=
8901
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb                | 6 ++++++
> >  meta/recipes-connectivity/connman/connman-gnome_0.7.bb | 4 ++++
> >  meta/recipes-connectivity/kea/kea_2.4.1.bb             | 6 ++++++
> >  meta/recipes-extended/zip/zip_3.0.bb                   | 5 +++++
> >  meta/recipes-support/libfm/libfm_1.3.2.bb              | 4 ++++
> >  5 files changed, 25 insertions(+)
> >
> > diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp=
/lrzsz/lrzsz_0.12.20.bb
> > index 63edcbd8643..3024ddcaf07 100644
> > --- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
> > +++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
> > @@ -46,3 +46,9 @@ ALTERNATIVE_TARGET[rb] =3D "${bindir}/lrz"
> >  ALTERNATIVE_TARGET[sz] =3D "${bindir}/lsz"
> >  ALTERNATIVE_TARGET[sx] =3D "${bindir}/lsz"
> >  ALTERNATIVE_TARGET[sb] =3D "${bindir}/lsz"
> > +
> > +# http://errors.yoctoproject.org/Errors/Details/766929/
> > +# lrzsz-0.12.20/src/tcp.c:75:56: error: passing argument 3 of 'getsock=
name' from incompatible pointer type [-Wincompatible-pointer-types]
> > +# lrzsz-0.12.20/src/tcp.c:83:52: error: passing argument 3 of 'getsock=
name' from incompatible pointer type [-Wincompatible-pointer-types]
> > +# lrzsz-0.12.20/src/tcp.c:103:51: error: passing argument 3 of 'accept=
' from incompatible pointer type [-Wincompatible-pointer-types]
> > +CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> > diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/m=
eta/recipes-connectivity/connman/connman-gnome_0.7.bb
> > index f6150d98ec9..46b3f854c52 100644
> > --- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> > +++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> > @@ -28,3 +28,7 @@ RDEPENDS:${PN} =3D "connman"
> >  do_install:append() {
> >      install -m 0644 ${UNPACKDIR}/images/* ${D}/usr/share/icons/hicolor=
/22x22/apps/
> >  }
> > +
> > +# http://errors.yoctoproject.org/Errors/Details/766926/
> > +# connman-client.c:200:15: error: assignment to 'GtkTreeModel *' {aka =
'struct _GtkTreeModel *'} from incompatible pointer type 'GtkTreeStore *' {=
aka 'struct _GtkTreeStore *'} [-Wincompatible-pointer-types]
> > +CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> > diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-=
connectivity/kea/kea_2.4.1.bb
> > index 6c1e457938a..fc963e545ad 100644
> > --- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
> > +++ b/meta/recipes-connectivity/kea/kea_2.4.1.bb
> > @@ -75,3 +75,9 @@ FILES:${PN}-staticdev +=3D "${libdir}/kea/hooks/*.a $=
{libdir}/hooks/*.a"
> >  FILES:${PN} +=3D "${libdir}/hooks/*.so"
> >
> >  PARALLEL_MAKEINST =3D ""
> > +
> > +# http://errors.yoctoproject.org/Errors/Details/766928/
> > +# TOPDIR/BUILD/work/qemux86_64-webos-linux/kea/2.4.1/recipe-sysroot-na=
tive/usr/bin/x86_64-webos-linux/../../libexec/x86_64-webos-linux/gcc/x86_64=
-webos-linux/14.0.1/ld: ./.libs/libdhcp4.a(dhcp4_srv.o): in function `isc::=
dhcp::OptionDescriptor isc::dhcp::CfgOption::get<char [6]>(char const (&) [=
6], unsigned short) const':
> > +# /usr/src/debug/kea/2.4.1/src/lib/dhcpsrv/cfg_option.h:608:(.text._ZN=
K3isc4dhcp9CfgOption3getIA6_cEENS0_16OptionDescriptorERKT_t[_ZNK3isc4dhcp9C=
fgOption3getIA6_cEENS0_16OptionDescriptorERKT_t]+0x85): undefined reference=
 to `isc::dhcp::CfgOption::getAll(std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char> > const&) const'
> > +# collect2: error: ld returned 1 exit status
> > +# TODO: Fix for gcc-14
> > diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extend=
ed/zip/zip_3.0.bb
> > index 70df5ab8728..e7705b8faf4 100644
> > --- a/meta/recipes-extended/zip/zip_3.0.bb
> > +++ b/meta/recipes-extended/zip/zip_3.0.bb
> > @@ -53,3 +53,8 @@ BBCLASSEXTEND =3D "native"
> >
> >  # exclude version 2.3.2 which triggers a false positive
> >  UPSTREAM_CHECK_REGEX =3D "^zip(?P<pver>(?!232).+)\.tgz"
> > +
> > +# http://errors.yoctoproject.org/Errors/Details/766953/
> > +# unix/unix.c:84:51: error: passing argument 4 of 'fread' from incompa=
tible pointer type [-Wincompatible-pointer-types]
> > +CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> > +# proper fix on ML: https://lists.openembedded.org/g/openembedded-core=
/message/198783
> > diff --git a/meta/recipes-support/libfm/libfm_1.3.2.bb b/meta/recipes-s=
upport/libfm/libfm_1.3.2.bb
> > index 057c7370293..1d7609165b4 100644
> > --- a/meta/recipes-support/libfm/libfm_1.3.2.bb
> > +++ b/meta/recipes-support/libfm/libfm_1.3.2.bb
> > @@ -53,3 +53,7 @@ do_install:append () {
> >      rm -f ${D}${libdir}/libfm-extra.a
> >      rm -f ${D}${libdir}/libfm-extra.la
> >  }
> > +
> > +# http://errors.yoctoproject.org/Errors/Details/766924/
> > +# libfm-1.3.2/src/actions/action.c:2050:25: error: assignment to 'gcha=
r **' {aka 'char **'} from incompatible pointer type 'const gchar * const*'=
 {aka 'const char * const*'} [-Wincompatible-pointer-types]
> > +CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> > --
> > 2.45.0
> >

