Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C77F075314
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 19:16:12 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id f8-v6so6191307wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 12:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=M1GJ5X/ha3LKf0Qwea5BHubiMqMx0ltN3hXfwQeXmhw=;
	b=tvxCfaIyWZQZOfXVSNKOeRYV1/bZ1MdX2hYoumyBMk6/5HYJ5CkqQ8m044TqcZz2lb
	ehMLEIA0yq6q265xnHI/qZky8bj4S3GhtoA9GaOIE5xlbGhD9tIp28Em4LxyjRcxfV5G
	rlcn10YmtwMn1lGDE87nkcL0s1ggTkf40yYpqyfKnmHuMy1erhc3ER4Y2Crsd5GkGKOu
	Yy01ImoG7qKPKhvvkrS46USMq0c8aMNmz9pfXodSDJ1mhqSePOCIDXgiSifnXnIlhmZH
	bggNXUTmXNUXB84/lbbVg3KkQMYbk/TWOZgYi2t7lkckBwB3JenXqc+vlVJtuPQ2R2MQ
	DsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=M1GJ5X/ha3LKf0Qwea5BHubiMqMx0ltN3hXfwQeXmhw=;
	b=auSeok4LlWCg5k46Yp/Nbn1uLHE9soPZ0n1BH+SWhcnd7YQ1yTWA3s9+HlxQeo5/Mu
	cu9FORkcUOkLd7W3N/MYxfFsSs3OYEugMR4Pz5dzGnzjY94Knl3tXPnlfnVTaVk12NF5
	VaPm+X70v/Ziy6CuuUZD1Rd7S7JQIbt3zds05UHqBUZK3nmsqAbvrQecTfiaq5o2OzxJ
	R8MWRIISXskWE7LyE+lM93e3IJLlDNJjhh68LbtYVfNJnhswaIvI5Pz+7jZd84MjpNaI
	rcyOD9Uq05cCaKILePIYA1bbUD3ebrJJu8KyO5iMV84vIM/1KgFF36snWGrHVA2yYA0f
	41vQ==
X-Gm-Message-State: ALKqPwdsz0J2uXwkh543KKDTJTWJPtoDnXVsI/U/lsssaS4pYhB0Vw+6
	xTsRrt27cZzz44MoFc90IOwpgQ==
X-Google-Smtp-Source: AB8JxZq5BCjLxUbKygwNZG4pkTJnqgMH2BK6nwCI+mBJXYHHrVZvE7QAqAWYKenVcmEfzt7bXhbowA==
X-Received: by 2002:a1c:1bcc:: with SMTP id
	b195-v6mr116956wmb.63.1525979773230; 
	Thu, 10 May 2018 12:16:13 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v75-v6sm2038772wrc.65.2018.05.10.12.16.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 10 May 2018 12:16:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 May 2018 21:16:12 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180510191612.GB1954@jama>
References: <CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<20180510122036.15212-1-Martin.Jansa@gmail.com>
	<CAJTo0Lb4aV0BKz=BQCf8-=8i16BDQAJZu8hGqBJoK497GowEUg@mail.gmail.com>
	<84e0278e-4ed3-51e7-81b8-f104c469ed4c@gmail.com>
	<8df86d81-5e7f-46fa-0d25-ecb902d70d8c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8df86d81-5e7f-46fa-0d25-ecb902d70d8c@gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: Enable FEATURE_MOUNT_NFS and use libtirpc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2018 19:16:13 -0000
X-Groupsio-MsgNum: 111232
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline

--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2018 at 11:24:02AM -0700, Khem Raj wrote:
>=20
>=20
> On 5/10/18 11:21 AM, Khem Raj wrote:
> >=20
> >=20
> > On 5/10/18 6:01 AM, Burton, Ross wrote:
> >> Fails to build here:
> >>
> >> =A0 coreutils/lib.a(mktemp.o): In function `mktemp_main':
> >> | /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/coreutils/mktemp.c:1=
05:
> >> warning: the use of `mktemp' is dangerous, better use `mkstemp' or
> >> `mkdtemp'
> >> | util-linux/lib.a(mount.o): In function `xdr_fhstatus':
> >> |=20
> >> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:105=
7:
> >> undefined reference to `xdr_u_int'
> >> | util-linux/lib.a(mount.o): In function `xdr_fhandle':
> >> |=20
> >> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:105=
2:
> >> undefined reference to `xdr_opaque'
> >> | util-linux/lib.a(mount.o): In function `xdr_mountstat3':
> >> |=20
> >> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:108=
9:
> >> undefined reference to `xdr_enum'
> >> | util-linux/lib.a(mount.o): In function `xdr_fhandle3':
> >> |=20
> >> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:107=
1:
> >> undefined reference to `xdr_bytes'
> >> | util-linux/lib.a(mount.o): In function `xdr_mountres3_ok':
> >> |=20
> >> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:108=
0:
> >> undefined reference to `xdr_int'
> >> |=20
> >> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:108=
0:
> >> undefined reference to `xdr_array'
> >> | util-linux/lib.a(mount.o): In function `xdr_dirpath':
> >> |=20
> >> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:106=
6:
> >> undefined reference to `xdr_string'
> >> | util-linux/lib.a(mount.o): In function `get_mountport':
> >> |=20
> >> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:114=
5:
> >> undefined reference to `pmap_getmaps'
> >> | util-linux/lib.a(mount.o): In function `nfsmount':
> >> |=20
> >> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:166=
2:
> >> undefined reference to `clnttcp_create'
> >> |=20
> >> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:167=
7:
> >> undefined reference to `authunix_create_default'
> >> |=20
> >> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:165=
2:
> >> undefined reference to `clntudp_create'
> >> |=20
> >> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:167=
2:
> >> undefined reference to `clnt_spcreateerror'
> >> |=20
> >> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:170=
2:
> >> undefined reference to `clnt_sperror'
> >> |=20
> >> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:170=
7:
> >> undefined reference to `clnt_sperror'
> >> |=20
> >> /usr/src/debug/busybox/1.27.2-r0/busybox-1.27.2/util-linux/mount.c:178=
8:
> >> undefined reference to `pmap_getport'
> >>
> >=20
> > We need to specify
> >=20
> > CONFIG_EXTRA_LDLIBS=3D"tirpc"
> >=20
> > along with
> >=20
> > CONFIG_FEATURE_MOUNT_NFS=3Dy
> >=20
> > secondly in v2 please delete
> >=20
> > # CONFIG_FEATURE_MOUNT_NFS is not set
> >=20
> > from meta/recipes-core/busybox/busybox/musl.cfg as well
> >=20
>=20
> On second thought, this probably should be enabled using a config=20
> fragment, since its not gonna link in another library it may not be=20
> common case to justify for a default config.

That's true, I've enabled CONFIG_FEATURE_MOUNT_NFS mostly to show how to
reproduce the issue.

If there isn't interest to enable this by default, I'm fine with keeping th=
is
locally (to enable it only with our defconfig changes which enable it).

> >> Ross
> >>
> >> On 10 May 2018 at 13:20, Martin Jansa <martin.jansa@gmail.com> wrote:
> >>> * We dropped in-tree obsoleted rpc from glibc and now busybox builds
> >>> =A0=A0 which had CONFIG_FEATURE_MOUNT_NFS enabled were failing with:
> >>> =A0=A0 | util-linux/mount.c:252:11: fatal error: rpc/rpc.h: No such f=
ile=20
> >>> or directory
> >>> =A0=A0 |=A0 # include <rpc/rpc.h>
> >>> =A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~~~~~~~~
> >>> =A0=A0 | compilation terminated.
> >>> =A0=A0 | make[1]: *** [util-linux/mount.o] Error 1
> >>>
> >>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>> ---
> >>> =A0 meta/recipes-core/busybox/busybox.inc=A0=A0=A0=A0=A0=A0 | 6 +++---
> >>> =A0 meta/recipes-core/busybox/busybox/defconfig | 2 +-
> >>> =A0 2 files changed, 4 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/meta/recipes-core/busybox/busybox.inc=20
> >>> b/meta/recipes-core/busybox/busybox.inc
> >>> index d1675c37aa..2db19ed317 100644
> >>> --- a/meta/recipes-core/busybox/busybox.inc
> >>> +++ b/meta/recipes-core/busybox/busybox.inc
> >>> @@ -3,7 +3,7 @@ DESCRIPTION =3D "BusyBox combines tiny versions of ma=
ny=20
> >>> common UNIX utilities into
> >>> =A0 HOMEPAGE =3D "http://www.busybox.net"
> >>> =A0 BUGTRACKER =3D "https://bugs.busybox.net/"
> >>>
> >>> -DEPENDS +=3D "kern-tools-native"
> >>> +DEPENDS +=3D "kern-tools-native libtirpc"
> >>>
> >>> =A0 # bzip2 applet in busybox is based on lightly-modified bzip2 sour=
ce
> >>> =A0 # the GPL is version 2 only
> >>> @@ -15,8 +15,8 @@ SECTION =3D "base"
> >>> =A0 # Whether to split the suid apps into a seperate binary
> >>> =A0 BUSYBOX_SPLIT_SUID ?=3D "1"
> >>>
> >>> -export EXTRA_CFLAGS =3D "${CFLAGS}"
> >>> -export EXTRA_LDFLAGS =3D "${LDFLAGS}"
> >>> +export EXTRA_CFLAGS =3D "${CFLAGS} -I${STAGING_INCDIR}/tirpc"
> >>> +export EXTRA_LDFLAGS =3D "${LDFLAGS} -ltirpc"
> >>>
> >>> =A0 EXTRA_OEMAKE =3D "CC=3D'${CC}' LD=3D'${CCLD}' V=3D1 ARCH=3D${TARG=
ET_ARCH}=20
> >>> CROSS_COMPILE=3D${TARGET_PREFIX} SKIP_STRIP=3Dy HOSTCC=3D'${BUILD_CC}=
'=20
> >>> HOSTCPP=3D'${BUILD_CPP}'"
> >>>
> >>> diff --git a/meta/recipes-core/busybox/busybox/defconfig=20
> >>> b/meta/recipes-core/busybox/busybox/defconfig
> >>> index fbb5fd852c..816555fc21 100644
> >>> --- a/meta/recipes-core/busybox/busybox/defconfig
> >>> +++ b/meta/recipes-core/busybox/busybox/defconfig
> >>> @@ -638,7 +638,7 @@ CONFIG_MOUNT=3Dy
> >>> =A0 # CONFIG_FEATURE_MOUNT_VERBOSE is not set
> >>> =A0 # CONFIG_FEATURE_MOUNT_HELPERS is not set
> >>> =A0 # CONFIG_FEATURE_MOUNT_LABEL is not set
> >>> -# CONFIG_FEATURE_MOUNT_NFS is not set
> >>> +CONFIG_FEATURE_MOUNT_NFS=3Dy
> >>> =A0 # CONFIG_FEATURE_MOUNT_CIFS is not set
> >>> =A0 CONFIG_FEATURE_MOUNT_FLAGS=3Dy
> >>> =A0 CONFIG_FEATURE_MOUNT_FSTAB=3Dy
> >>> --=20
> >>> 2.17.0
> >>>
> >>> --=20
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWvSafAAKCRA3VSO3ZXaA
HIyNAKCq23W9izs+rx1CgUsrnNWC3qucuwCeNDs/5VNu/39WdlVvuMFOIxg4j7k=
=9xy0
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
