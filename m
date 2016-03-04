Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 048566080F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 14:02:36 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l68so30413020wml.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 06:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZW0oNU7XblX737LUp7N1J4704g7q22iMmjJsCWCggec=;
	b=S42dMoe80AWX4ItbDybTJhosGzNO1rb8qmfTkB8Wl/VeO4ozf4G7GYoYbvWgcxnwk6
	hOZdpuNRYYGjWaqIfnRbcpAX6HYI0/7/TGLqUgSyp3i1pA99loCRBc77sbGy49s4X1E9
	QIcvi2CHjKp6UW5ycyqZCrmtP6bBwW6hq1xA/seAhrDg8tb+k1/Um5TtTWdbuFpEv5FW
	U7Qy0jogrZcvw14v6f1ECumRomwon1ssP7ca6CsqR5DhLrFMXu/bqd+YJhTmcCswbx3Y
	QtBdszoQlJoVXssqITsYgiIimzantXXG4X2sAT21k1Rq9EYCHcoPo0+bX680zL9qsU2Z
	fzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZW0oNU7XblX737LUp7N1J4704g7q22iMmjJsCWCggec=;
	b=SviMFMF0TDMKb6O2+gYh09LbqWVwa2YSBGSCdBg97CxEXYrbnQ1sr5/mB4H7+mdhMT
	F678uYCnFVhXy8n1f5VKaUc/hvCSxixvuKbob+36nOZl0JAYXkbkL1ID+uQEwuhYK6Kx
	GHZqmAcZmMbcKV1VCCJk9SIL4byo/iN3OUb6ALTS6DZmAIpo7U0Nfmhl1vPRH1LfQElj
	oo1rYk/j5ZePXA6T6fdy1rkrWBA2C+ue6mfS+gWJcP8C7OmP/EVAZa1/7bsbrVG8SlAl
	GKXq787XkQhAhnAPdyvsPgNaDyOiA8GpwJDC8IonkwSJREVVIRzZE4VSJAp+3PFWOaTK
	dVbA==
X-Gm-Message-State: AD7BkJLnE3s4D9VYY3xjv6fPPZhL/H55tuMgC3ITthJYabvnG33mgkdYMOySd/Mq7tbTkA==
X-Received: by 10.28.52.197 with SMTP id b188mr5263986wma.77.1457100157002;
	Fri, 04 Mar 2016 06:02:37 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 8sm3477817wmk.13.2016.03.04.06.02.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Mar 2016 06:02:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 4 Mar 2016 15:04:48 +0100
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20160304140448.GE2557@jama>
References: <1457038873-26591-1-git-send-email-ross.burton@intel.com>
	<20160304140212.GD2557@jama>
MIME-Version: 1.0
In-Reply-To: <20160304140212.GD2557@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gdb: fix builds with internal readline and no static libraries
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
X-List-Received-Date: Fri, 04 Mar 2016 14:02:37 -0000
X-Groupsio-MsgNum: 79120
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pY3vCvL1qV+PayAL"
Content-Disposition: inline

--pY3vCvL1qV+PayAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2016 at 03:02:12PM +0100, Martin Jansa wrote:
> On Thu, Mar 03, 2016 at 09:01:13PM +0000, Ross Burton wrote:
> > If gdb was configured to use the internal readline but static libraries=
 were
> > disabled, gdb wouldn't dutifully not build libreadline.a which was a pr=
oblem
> > when it tried to link with that library.
> >=20
> > Solve this by ensuring --enable-static is passed to the readline config=
ure.
>=20

Ups, sorry for noise

grub !=3D gdb, I need more coffee.

> Somehow this caused hardfloat builds to fail
>=20
> | checking for options to get soft-float... no
> | configure: error: could not force soft-float
> | NOTE: The following config.log files may provide further information.
> | WARNING: exit code 1 from a shell command.
>=20
> from config.log:
>=20
> configure:25055: arm-oe-linux-gnueabi-gcc -march=3Darmv7ve -mthumb
> -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 -mtune=3Dcortex-a7
> -rdynamic
> --sysroot=3D<sysroot>
> -c  -Os -Wall -W -Wshadow -Wpointer-arith -Wundef -Wchar-subscripts
> -Wcomment -Wdeprecated-declarations -Wdisabled-optimization
> -Wdiv-by-zero -Wfloat-equal -Wformat-extra-args -Wformat-security
> -Wformat-y2k -Wimplicit -Wimplicit-function-declaration -Wimplicit-int
> -Wmain -Wmissing-braces -Wmissing-format-attribute -Wmultichar
> -Wparentheses -Wreturn-type -Wsequence-point -Wshadow -Wsign-compare
> -Wswitch -Wtrigraphs -Wunknown-pragmas -Wunused -Wunused-function
> -Wunused-label -Wunused-parameter -Wunused-value  -Wunused-variable
> -Wwrite-strings -Wnested-externs -Wstrict-prototypes -g
> -Wredundant-decls -Wmissing-prototypes -Wmissing-declarations
> -Wcast-align  -Wextra -Wattributes -Wendif-labels -Winit-self
> -Wint-to-pointer-cast -Winvalid-pch -Wmissing-field-initializers
> -Wnonnull -Woverflow -Wvla -Wpointer-to-int-cast -Wstrict-aliasing
> -Wvariadic-macros -Wvolatile-register-var -Wpointer-sign
> -Wmissing-include-dirs -Wmissing-prototypes -Wmissing-declarations
> -Wformat=3D2 -freg-struct-return -msoft-float -Werror  -Wall -W
> -DGRUB_MACHINE_UBOOT=3D1 -DGRUB_MACHINE=3DARM_UBOOT conftest.c >&5
> arm-oe-linux-gnueabi-gcc: error: -mfloat-abi=3Dsoft and
> -mfloat-abi=3Dhard may not be used together
> configure:25055: $? =3D 1
>=20
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/recipes-devtools/gdb/gdb.inc                  |  1 +
> >  .../gdb/gdb/force-readline-static.patch            | 37 ++++++++++++++=
++++++++
> >  2 files changed, 38 insertions(+)
> >  create mode 100644 meta/recipes-devtools/gdb/gdb/force-readline-static=
=2Epatch
> >=20
> > diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/=
gdb/gdb.inc
> > index 1dd6551..507f274 100644
> > --- a/meta/recipes-devtools/gdb/gdb.inc
> > +++ b/meta/recipes-devtools/gdb/gdb.inc
> > @@ -7,6 +7,7 @@ SRC_URI +=3D "file://0002-Change-order-of-CFLAGS.patch \
> >              file://0001-Use-exported-definitions-of-SIGRTMIN.patch \
> >              file://0001-include-sys-types.h-for-mode_t.patch \
> >              file://0001-use-asm-sgidefs.h.patch \
> > +            file://force-readline-static.patch \
> >             "
> >  #LDFLAGS_append =3D " -s"
> >  #export CFLAGS_append=3D" -L${STAGING_LIBDIR}"
> > diff --git a/meta/recipes-devtools/gdb/gdb/force-readline-static.patch =
b/meta/recipes-devtools/gdb/gdb/force-readline-static.patch
> > new file mode 100644
> > index 0000000..d34ee8c
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gdb/gdb/force-readline-static.patch
> > @@ -0,0 +1,37 @@
> > +If gdb is configured with --disable-static then this is dutifully pass=
ed to
> > +readline which then disables libreadline.a, which causes a problem whe=
n gdb
> > +tries to link against that.
> > +
> > +To ensure that readline always builds static libraries, pass --enable-=
static to
> > +the sub-configure.
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Ross Burton <ross.burton@intel.com>
> > +
> > +diff --git a/Makefile.def b/Makefile.def
> > +index 4394188..05c661a 100644
> > +--- a/Makefile.def
> > ++++ b/Makefile.def
> > +@@ -100,7 +100,8 @@ host_modules=3D { module=3D libiconv;
> > + 		missing=3D install-html;
> > + 		missing=3D install-info; };
> > + host_modules=3D { module=3D m4; };
> > +-host_modules=3D { module=3D readline; };
> > ++host_modules=3D { module=3D readline;
> > ++                extra_configure_flags=3D'--enable-static';};
> > + host_modules=3D { module=3D sid; };
> > + host_modules=3D { module=3D sim; };
> > + host_modules=3D { module=3D texinfo; no_install=3D true; };
> > +diff --git a/Makefile.in b/Makefile.in
> > +index 61e0ab6..837f36e 100644
> > +--- a/Makefile.in
> > ++++ b/Makefile.in
> > +@@ -24971,7 +24971,7 @@ configure-readline:
> > + 	  $$s/$$module_srcdir/configure \
> > + 	  --srcdir=3D$${topdir}/$$module_srcdir \
> > + 	  $(HOST_CONFIGARGS) --build=3D${build_alias} --host=3D${host_alias}=
 \
> > +-	  --target=3D${target_alias}  \
> > ++	  --target=3D${target_alias} --enable-static \
> > + 	  || exit 1
> > + @endif readline
> > +=20
> > --=20
> > 2.7.0
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pY3vCvL1qV+PayAL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbZlf8ACgkQN1Ujt2V2gBwwjQCffMuvpwoaxTtvoooatJ6WEncd
QasAn1oCCOxmDKszcJoBeK6AL0E2EmCU
=9Cbu
-----END PGP SIGNATURE-----

--pY3vCvL1qV+PayAL--
