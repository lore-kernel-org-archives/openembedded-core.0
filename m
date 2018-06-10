Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id B021F78C43
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2018 11:05:54 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id f16-v6so17457864wrm.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2018 04:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SzjuOA47rFt+5oLF5j+cTNZe7fj8KlCMU462nlFLUGU=;
	b=Hpcn9YYztm0r6mQXfKUpeURdmFeUXQiqZLwiVXkQKTt7z/Rfw+gFKRKopoa9MoSI4k
	K3QF90VU3nkZwX4tWQKpzFvcc6xvm3NX2lIexvaxtQVG6m3XKG8MtUZTfly3n78u38bD
	JOEsoOgRROfjPY+qiknNbnQZM90KQ0VIEBr/1bnmGhgqEAeFWCVDm33s3GUDubcY+3C/
	4orYSBP3pcNA8JS6YeDyxF28tRkBHCS5foPwYtbv3Xmw5RxljTRcJCNBWaK17kSKJN1O
	L/MbKYpheQFc3xulNh/SXEqKhlWntS+tK7Xg2zUso4HQsCmH96adevwlMRRhqI0/HdkC
	eHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SzjuOA47rFt+5oLF5j+cTNZe7fj8KlCMU462nlFLUGU=;
	b=rw9uVNlV/f71+wQzvn6ugCfOA5ef1nQdqlY/BQgjbMrgVvzDEkiqBcvy9i+l553FdZ
	C/EF9+hJB2OZsWP3TYwVW5hUAr986cX3qMRrup0PZoFGsk/3U5L2EeXDI2z6RBjtxryM
	NAebe2UV74LxswJVIRshWiqHRzfEVFiF6G+vnmko5IN+/ZgQn7XwVE1MFoPk794YghGR
	U4btnyj0ackt9UOrqbiO3ZDA0zJK6R1Z1Z57Xa84xCHt7QtvDlhTQyncBBFHi8DnV7AI
	k6++kOeIuJ51iOsNSDk1Hk49GEjEr6TSczfm7LV3G1R8P/LM7vDdGfLcMmO69Mw/dp3A
	NQlQ==
X-Gm-Message-State: APt69E0aVeZxVUZ3hyR09T2Puw6Mb6bTxDbFhNesN+HoU4xaZOIPICQl
	QB00epzjDLbIf7CMdaK86EE=
X-Google-Smtp-Source: ADUXVKKtRuXq7iTeeB+mkLsV9ZOavNsWtqfqss+L+yeE/tfO331JpfHubcjJekL1jNuaftt1HaS4dQ==
X-Received: by 2002:adf:a148:: with SMTP id
	r8-v6mr9548585wrr.104.1528628755486; 
	Sun, 10 Jun 2018 04:05:55 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	n12-v6sm4422692wmh.30.2018.06.10.04.05.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 04:05:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 10 Jun 2018 13:05:54 +0200
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180610110554.GA1355@jama>
References: <CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<20180510122036.15212-1-Martin.Jansa@gmail.com>
	<CAJTo0Lb4aV0BKz=BQCf8-=8i16BDQAJZu8hGqBJoK497GowEUg@mail.gmail.com>
	<84e0278e-4ed3-51e7-81b8-f104c469ed4c@gmail.com>
	<8df86d81-5e7f-46fa-0d25-ecb902d70d8c@gmail.com>
	<20180510191612.GB1954@jama>
	<4ab499de-5f57-520e-4951-91f15115435d@gmail.com>
	<CAJ86T=Xk+fUWoOM5igiD6ZBTQfb4opLooTa3HeAFHVs7GFAvDg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Xk+fUWoOM5igiD6ZBTQfb4opLooTa3HeAFHVs7GFAvDg@mail.gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
X-List-Received-Date: Sun, 10 Jun 2018 11:05:55 -0000
X-Groupsio-MsgNum: 112378
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline

--kORqDWCi7qDJ0mEj
Content-Type: multipart/mixed; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline

--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 30, 2018 at 10:39:16AM -0700, Andre McCurdy wrote:
>  On Thu, May 10, 2018 at 12:26 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On 5/10/18 12:16 PM, Martin Jansa wrote:
> >>>
> >>> On second thought, this probably should be enabled using a config
> >>> fragment, since its not gonna link in another library it may not be
> >>> common case to justify for a default config.
> >>
> >> That's true, I've enabled CONFIG_FEATURE_MOUNT_NFS mostly to show how =
to
> >> reproduce the issue.
> >>
> >> If there isn't interest to enable this by default, I'm fine with keepi=
ng
> >> this
> >> locally (to enable it only with our defconfig changes which enable it).
> >
> > I think keeping it as a nfsmount.cfg which then can be applied via a
> > bbappend could be a good option. May be adding a PACKAGECONFIG to contr=
ol
> > the -I flag and libtirpc dependency would be nice too
>=20
> According to the busybox config help, CONFIG_FEATURE_MOUNT_NFS is only
> required for kernel versions before 2.6.23. Do we officially support
> kernels that old in oe-core? Or should this be in a .bbappend etc in
> separate layer?

OK, I agree that this should be kept in separate layer. If anyone needs
it, the working version (with tirpc added in CONFIG_EXTRA_LDLIBS) is
attached.

> //config:config FEATURE_MOUNT_NFS
> //config:    bool "Support mounting NFS file systems on Linux < 2.6.23"
> //config:    default n
> //config:    depends on MOUNT
> //config:    select FEATURE_SYSLOG
> //config:    help
> //config:    Enable mounting of NFS file systems on Linux kernels prior
> //config:    to version 2.6.23. Note that in this case mounting of NFS
> //config:    over IPv6 will not be possible.
> //config:
> //config:    Note that this option links in RPC support from libc,
> //config:    which is rather large (~10 kbytes on uclibc).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PNTmBPCT7hxwcZjr
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-busybox-Enable-FEATURE_MOUNT_NFS-and-use-libtirpc.patch"
Content-Transfer-Encoding: quoted-printable

From 3316407c73058173bcfa1b9fabcad4592d23cbfc Mon Sep 17 00:00:00 2001
From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 May 2018 12:08:58 +0000
Subject: [PATCH] busybox: Enable FEATURE_MOUNT_NFS and use libtirpc

* We dropped in-tree obsoleted rpc from glibc and now busybox builds
  which had CONFIG_FEATURE_MOUNT_NFS enabled were failing with:
  | util-linux/mount.c:252:11: fatal error: rpc/rpc.h: No such file or dire=
ctory
  |  # include <rpc/rpc.h>
  |            ^~~~~~~~~~~
  | compilation terminated.
  | make[1]: *** [util-linux/mount.o] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc       | 6 +++---
 meta/recipes-core/busybox/busybox/defconfig | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busy=
box/busybox.inc
index d1675c37aa..2db19ed317 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -3,7 +3,7 @@ DESCRIPTION =3D "BusyBox combines tiny versions of many com=
mon UNIX utilities into
 HOMEPAGE =3D "http://www.busybox.net"
 BUGTRACKER =3D "https://bugs.busybox.net/"
=20
-DEPENDS +=3D "kern-tools-native"
+DEPENDS +=3D "kern-tools-native libtirpc"
=20
 # bzip2 applet in busybox is based on lightly-modified bzip2 source
 # the GPL is version 2 only
@@ -15,8 +15,8 @@ SECTION =3D "base"
 # Whether to split the suid apps into a seperate binary
 BUSYBOX_SPLIT_SUID ?=3D "1"
=20
-export EXTRA_CFLAGS =3D "${CFLAGS}"
-export EXTRA_LDFLAGS =3D "${LDFLAGS}"
+export EXTRA_CFLAGS =3D "${CFLAGS} -I${STAGING_INCDIR}/tirpc"
+export EXTRA_LDFLAGS =3D "${LDFLAGS} -ltirpc"
=20
 EXTRA_OEMAKE =3D "CC=3D'${CC}' LD=3D'${CCLD}' V=3D1 ARCH=3D${TARGET_ARCH} =
CROSS_COMPILE=3D${TARGET_PREFIX} SKIP_STRIP=3Dy HOSTCC=3D'${BUILD_CC}' HOST=
CPP=3D'${BUILD_CPP}'"
=20
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-cor=
e/busybox/busybox/defconfig
index fbb5fd852c..2e920277b7 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -51,7 +51,7 @@ CONFIG_CROSS_COMPILER_PREFIX=3D""
 CONFIG_SYSROOT=3D""
 CONFIG_EXTRA_CFLAGS=3D""
 CONFIG_EXTRA_LDFLAGS=3D""
-CONFIG_EXTRA_LDLIBS=3D""
+CONFIG_EXTRA_LDLIBS=3D"tirpc"
=20
 #
 # Installation Options ("make install" behavior)
@@ -638,7 +638,7 @@ CONFIG_MOUNT=3Dy
 # CONFIG_FEATURE_MOUNT_VERBOSE is not set
 # CONFIG_FEATURE_MOUNT_HELPERS is not set
 # CONFIG_FEATURE_MOUNT_LABEL is not set
-# CONFIG_FEATURE_MOUNT_NFS is not set
+CONFIG_FEATURE_MOUNT_NFS=3Dy
 # CONFIG_FEATURE_MOUNT_CIFS is not set
 CONFIG_FEATURE_MOUNT_FLAGS=3Dy
 CONFIG_FEATURE_MOUNT_FSTAB=3Dy
--=20
2.17.1


--PNTmBPCT7hxwcZjr--

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWx0GEQAKCRA3VSO3ZXaA
HMO2AKCasmIX+eHmsvhGtRmCTlnGWLayvACfaD0a8uUUmquMKBelAd2Mw6kbyro=
=7bJ2
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
