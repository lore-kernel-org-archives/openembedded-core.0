Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.471.1614711704528532587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 11:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WfRFB282;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id l22so3140430wme.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 11:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=8m7CBE6E9j59gzCBL+/jCfXJL+/a6ZO00WH8PEIZris=;
        b=WfRFB282Dblf9xhUVExog5I93MXSwzhiACaBCHwzB0E/8B7Mdkb+AD7wxFh4yiUYuT
         z7RFrNx2+ycGogxOUJ0CQnyzG0MW8iWjf2jIkvtEQk+lmIq3oNLXjUAoRV4VvgjkKzX2
         kalP8Coz6JWO3ADPzCVCGHXaYU1Tm8As3cCvcvBtnS0LxaGdu/D5p4yro30nJpJWv85G
         /iQFQFDgY0Myap5VH6dfYl5Y3jA5JEuTq0iDE7mRm3N3UP2pFwx5XeZGlm/n2cbSiPnn
         ulGfT9NEyd3P1WDvkbocAuq/YI9Y2NJVrBV6HlLRY16vRI8kt1+kg7d+DUSBUObT/JO1
         nEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=8m7CBE6E9j59gzCBL+/jCfXJL+/a6ZO00WH8PEIZris=;
        b=s8ZpJcpLxKGnoZtq+r4+pzaO8CkcOj2z65hIItHfE4NG6Gq4xxELc1V1Sodx/A7tvc
         p82d1H1XwqkD4kw7rngqWWQOQP66pHHo5FBGHgCt2TwgD+F5Xb3BaU8wltpDR3ZM1h+a
         RkEwhO9XVtRxrvdWfSBfnORbT2psf10s97UOkF7ILo0Ng5CmiayWNXuPC0Mc7P2rr8Ce
         7qKewWtWVaCrEzwdq0Kjh1LoyWQAnSEl1PfcKM8p1RANZPvMytFb7T10+ln7Dbgxan6p
         R1+0ORyzApuvIkP/JHvIVburdmdgDyiDIobikKbAA5+eTUprjyCTTQR09+eGGtDPqRwi
         NC5A==
X-Gm-Message-State: AOAM533XqDpTjmxdkPNAfJ0vAZAkEHVrvHmPQ1EOcawFLrChBFTxeacr
	1s1jNKz6OvLTdGC6I8xKPjebvmsJJiE=
X-Google-Smtp-Source: ABdhPJy17EZ1Y/XK9FVUQL65GcuNmVta2wRoN2ZN5JC2lLwQnjyxHcBraGAbvufK+JNz2gcycMcTqg==
X-Received: by 2002:a1c:1dd5:: with SMTP id d204mr5292214wmd.127.1614711702789;
        Tue, 02 Mar 2021 11:01:42 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
        by smtp.gmail.com with ESMTPSA id h20sm3510947wmb.1.2021.03.02.11.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 11:01:40 -0800 (PST)
Message-ID: <8381e86c6924947b9b7c1343cdfbf95ba57b718f.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v5] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Richard Purdie
	 <richard.purdie@linuxfoundation.org>, Paul Eggleton
	 <bluelightning@bluelightning.org>
Date: Tue, 02 Mar 2021 19:01:37 +0000
In-Reply-To: <CAMKF1sog1N1hWtSMTZtg4my86ZtPC_g=SVsD-c8MX5MKhcEwag@mail.gmail.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210225153035.1239276-1-luca.boccassi@gmail.com>
	 <CAMKF1sog1N1hWtSMTZtg4my86ZtPC_g=SVsD-c8MX5MKhcEwag@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 148869
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-6oyB2NzvKBD0PumeoSMr"

--=-6oyB2NzvKBD0PumeoSMr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-02-26 at 11:02 -0800, Khem Raj wrote:
> seeing dependency loops
> http://sprunge.us/E5c3NC

Thanks for the heads-up - didn't see when building locally with a
minimal poky, anything in particular needed in the local.conf to
trigger it?

> On Thu, Feb 25, 2021 at 7:30 AM Luca Bocassi <luca.boccassi@gmail.com> w=
rote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >=20
> > Recently util-linux gained an (optional) build dependency on libcrypts=
etup.
> > But libcryptsetup build-depends on util-linux for blkid (optional, can=
 be disabled)
> > and uuid (mandatory).
> > Split out util-linux-uuid in a different recipe to break the cycle.
> >=20
> > https://github.com/karelzak/util-linux/pull/898
> >=20
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > v1: util-linux 2.35 is not out yet, but I'd like to get the preparator=
y work
> >     underway as I'm not sure if this is the best approach or if there =
are
> >     alternatives. Suggestions and comments very welcome. Thanks!
> > v2: changed packages names to reflect old ones (eg: libuuid1 -> util-l=
inux-libuuid)
> >     and leave uuid build enable in main recipe to allow for uuidgen bu=
ild to happen,
> >     as it does not have its own autoconf switch. Delete the library ma=
nualy from
> >     the main recipe after build instead, and add dependency.
> >     Might help to break loop python3 -> util-linux -> libselinux -> py=
thon3, as it's
> >     only libuuid that is needed, see https://lists.yoctoproject.org/g/=
yocto/message/47570
> > v3: rebased and refactored to have a common util-linux.inc file
> > v4: added RDEPENDS on util-linux-libuuid on various packages to fix QA=
 warnings
> > v5: remove RDEPENDS and instead have util-linux RDEPEND on util-linux-=
uuid.
> >     Removed PACKAGES_remove and instead filter out libuuid via the pac=
kage generation
> >     regex.
> >     Rebased on util-linux 2.36.2.
> >=20
> >  .../util-linux/util-linux-uuid_2.36.2.bb      | 22 ++++++++
> >  meta/recipes-core/util-linux/util-linux.inc   | 41 ++++++++++++++
> >  .../util-linux/util-linux_2.36.2.bb           | 53 +++++-------------=
-
> >  3 files changed, 75 insertions(+), 41 deletions(-)
> >  create mode 100644 meta/recipes-core/util-linux/util-linux-uuid_2.36.=
2.bb
> >  create mode 100644 meta/recipes-core/util-linux/util-linux.inc
> >=20
> > diff --git a/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb b/=
meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
> > new file mode 100644
> > index 0000000000..ffb2c87270
> > --- /dev/null
> > +++ b/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
> > @@ -0,0 +1,22 @@
> > +# To allow util-linux to optionally build-depend on cryptsetup, libuu=
id is
> > +# split out of the main recipe, as it's needed by cryptsetup
> > +
> > +require util-linux.inc
> > +
> > +inherit autotools gettext pkgconfig
> > +
> > +S =3D "${WORKDIR}/util-linux-${PV}"
> > +EXTRA_OECONF +=3D "--disable-all-programs --enable-libuuid"
> > +DEBIAN_NOAUTONAME_util-linux-libuuid =3D "1"
> > +DEBIAN_NOAUTONAME_util-linux-libuuid-dev =3D "1"
> > +DEBIAN_NOAUTONAME_util-linux-libuuid-dbg =3D "1"
> > +PACKAGES =3D "util-linux-libuuid util-linux-libuuid-dev util-linux-li=
buuid-dbg"
> > +FILES_util-linux-libuuid =3D "${libdir}/libuuid.so.*"
> > +FILES_util-linux-libuuid-dev =3D "${libdir}/libuuid.so ${includedir} =
${libdir}/pkgconfig"
> > +FILES_util-linux-libuuid-dbg =3D "/usr/src ${libdir}/.debug"
> > +
> > +do_install_append() {
> > +       rm -rf ${D}${datadir} ${D}${bindir} ${D}${base_bindir} ${D}${s=
bindir} ${D}${base_sbindir} ${D}${exec_prefix}/sbin
> > +}
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipe=
s-core/util-linux/util-linux.inc
> > new file mode 100644
> > index 0000000000..b4f817ed82
> > --- /dev/null
> > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > @@ -0,0 +1,41 @@
> > +SUMMARY =3D "A suite of basic system administration utilities"
> > +HOMEPAGE =3D "https://en.wikipedia.org/wiki/Util-linux"
> > +DESCRIPTION =3D "Util-linux includes a suite of basic system administ=
ration utilities \
> > +commonly found on most Linux systems.  Some of the more important uti=
lities include \
> > +disk partitioning, kernel message management, filesystem creation, an=
d system login."
> > +
> > +SECTION =3D "base"
> > +
> > +LICENSE =3D "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
> > +LICENSE_${PN}-libblkid =3D "LGPLv2.1+"
> > +LICENSE_${PN}-libfdisk =3D "LGPLv2.1+"
> > +LICENSE_${PN}-libmount =3D "LGPLv2.1+"
> > +LICENSE_${PN}-libsmartcols =3D "LGPLv2.1+"
> > +LICENSE_${PN}-libuuid =3D "BSD-3-Clause"
> > +
> > +LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D0fd5c050c6187d2bf=
0a4492b7f4e33da \
> > +                    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a=
4263 \
> > +                    file://Documentation/licenses/COPYING.GPL-2.0-or-=
later;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> > +                    file://Documentation/licenses/COPYING.LGPL-2.1-or=
-later;md5=3D4fbd65380cdd255951079008b364516c \
> > +                    file://Documentation/licenses/COPYING.BSD-3-Claus=
e;md5=3D58dcd8452651fc8b07d1f65ce07ca8af \
> > +                    file://Documentation/licenses/COPYING.BSD-4-Claus=
e-UC;md5=3D263860f8968d8bafa5392cab74285262 \
> > +                    file://libuuid/COPYING;md5=3D6d2cafc999feb2c2de84=
d4d24b23290c \
> > +                    file://libmount/COPYING;md5=3D7c7e39fb7d70ffe5d69=
3a643e29987c2 \
> > +                    file://libblkid/COPYING;md5=3D693bcbbe16d3a4a4b37=
bc906bc01cc04 \
> > +                    file://libfdisk/COPYING;md5=3D693bcbbe16d3a4a4b37=
bc906bc01cc04 \
> > +                    file://libsmartcols/COPYING;md5=3D693bcbbe16d3a4a=
4b37bc906bc01cc04 \
> > +"
> > +
> > +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/util-linux:"
> > +MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
> > +BPN =3D "util-linux"
> > +SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}=
/${BP}.tar.xz \
> > +           file://configure-sbindir.patch \
> > +           file://runuser.pamd \
> > +           file://runuser-l.pamd \
> > +           file://ptest.patch \
> > +           file://run-ptest \
> > +           file://display_testname_for_subtest.patch \
> > +           file://avoid_parallel_tests.patch \
> > +           "
> > +SRC_URI[sha256sum] =3D "f7516ba9d8689343594356f0e5e1a5f0da34adfbc8902=
3437735872bb5024c5f"
> > diff --git a/meta/recipes-core/util-linux/util-linux_2.36.2.bb b/meta/=
recipes-core/util-linux/util-linux_2.36.2.bb
> > index 19950a2726..d4406695f6 100644
> > --- a/meta/recipes-core/util-linux/util-linux_2.36.2.bb
> > +++ b/meta/recipes-core/util-linux/util-linux_2.36.2.bb
> > @@ -1,46 +1,8 @@
> > -SUMMARY =3D "A suite of basic system administration utilities"
> > -HOMEPAGE =3D "https://en.wikipedia.org/wiki/Util-linux"
> > -DESCRIPTION =3D "Util-linux includes a suite of basic system administ=
ration utilities \
> > -commonly found on most Linux systems.  Some of the more important uti=
lities include \
> > -disk partitioning, kernel message management, filesystem creation, an=
d system login."
> > -
> > -SECTION =3D "base"
> > -
> > -LICENSE =3D "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
> > -LICENSE_${PN}-libblkid =3D "LGPLv2.1+"
> > -LICENSE_${PN}-libfdisk =3D "LGPLv2.1+"
> > -LICENSE_${PN}-libmount =3D "LGPLv2.1+"
> > -LICENSE_${PN}-libsmartcols =3D "LGPLv2.1+"
> > -LICENSE_${PN}-libuuid =3D "BSD-3-Clause"
> > -
> > -LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D0fd5c050c6187d2bf=
0a4492b7f4e33da \
> > -                    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a=
4263 \
> > -                    file://Documentation/licenses/COPYING.GPL-2.0-or-=
later;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> > -                    file://Documentation/licenses/COPYING.LGPL-2.1-or=
-later;md5=3D4fbd65380cdd255951079008b364516c \
> > -                    file://Documentation/licenses/COPYING.BSD-3-Claus=
e;md5=3D58dcd8452651fc8b07d1f65ce07ca8af \
> > -                    file://Documentation/licenses/COPYING.BSD-4-Claus=
e-UC;md5=3D263860f8968d8bafa5392cab74285262 \
> > -                    file://libuuid/COPYING;md5=3D6d2cafc999feb2c2de84=
d4d24b23290c \
> > -                    file://libmount/COPYING;md5=3D7c7e39fb7d70ffe5d69=
3a643e29987c2 \
> > -                    file://libblkid/COPYING;md5=3D693bcbbe16d3a4a4b37=
bc906bc01cc04 \
> > -                    file://libfdisk/COPYING;md5=3D693bcbbe16d3a4a4b37=
bc906bc01cc04 \
> > -                    file://libsmartcols/COPYING;md5=3D693bcbbe16d3a4a=
4b37bc906bc01cc04 \
> > -"
> > +require util-linux.inc
> >=20
> >  #gtk-doc is not enabled as it requires xmlto which requires util-linu=
x
> >  inherit autotools gettext manpages pkgconfig systemd update-alternati=
ves python3-dir bash-completion ptest
> > -DEPENDS =3D "libcap-ng ncurses virtual/crypt zlib"
> > -
> > -MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
> > -SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}=
/${BP}.tar.xz \
> > -           file://configure-sbindir.patch \
> > -           file://runuser.pamd \
> > -           file://runuser-l.pamd \
> > -           file://ptest.patch \
> > -           file://run-ptest \
> > -           file://display_testname_for_subtest.patch \
> > -           file://avoid_parallel_tests.patch \
> > -           "
> > -SRC_URI[sha256sum] =3D "f7516ba9d8689343594356f0e5e1a5f0da34adfbc8902=
3437735872bb5024c5f"
> > +DEPENDS =3D "libcap-ng ncurses virtual/crypt zlib util-linux-uuid"
> >=20
> >  PACKAGES =3D+ "${PN}-swaponoff"
> >  PACKAGES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', '$=
{PN}-pylibmount', '', d)}"
> > @@ -87,8 +49,9 @@ python util_linux_binpackages () {
> >  # we must execute before update-alternatives PACKAGE_PREPROCESS_FUNCS
> >  PACKAGE_PREPROCESS_FUNCS =3D+ "util_linux_binpackages "
> >=20
> > +# skip libuuid as it will be packaged by the util-linux-uuid recipe
> >  python util_linux_libpackages() {
> > -    do_split_packages(d, root=3Dd.getVar('UTIL_LINUX_LIBDIR'), file_r=
egex=3Dr'^lib(.*)\.so\..*$',
> > +    do_split_packages(d, root=3Dd.getVar('UTIL_LINUX_LIBDIR'), file_r=
egex=3Dr'^lib(?!uuid)(.*)\.so\..*$',
> >                        output_pattern=3D'${PN}-lib%s',
> >                        description=3D'${PN} lib%s',
> >                        extra_depends=3D'', prepend=3DTrue, allow_links=
=
=3DTrue)
> > @@ -141,6 +104,7 @@ PACKAGECONFIG[pylibmount] =3D "--with-python=3D3 -=
-enable-pylibmount,--without-pytho
> >  PACKAGECONFIG[readline] =3D "--with-readline,--without-readline,readl=
ine"
> >  # PCRE support in hardlink
> >  PACKAGECONFIG[pcre2] =3D ",,libpcre2"
> > +PACKAGECONFIG[cryptsetup] =3D "--with-cryptsetup,--without-cryptsetup=
,cryptsetup"
> >=20
> >  EXTRA_OEMAKE =3D "ARCH=3D${TARGET_ARCH} CPU=3D CPUOPT=3D 'OPT=3D${CFL=
AGS}'"
> >=20
> > @@ -165,6 +129,8 @@ RRECOMMENDS_${PN}_class-nativesdk =3D ""
> >  RDEPENDS_${PN}_class-native =3D ""
> >  RDEPENDS_${PN}_class-nativesdk =3D ""
> >=20
> > +RDEPENDS_${PN}_append +=3D " util-linux-uuid"
> > +
> >  RPROVIDES_${PN}-dev =3D "${PN}-libblkid-dev ${PN}-libmount-dev ${PN}-=
libuuid-dev"
> >=20
> >  RDEPENDS_${PN}-bash-completion +=3D "${PN}-lsblk"
> > @@ -316,6 +282,11 @@ ALTERNATIVE_LINK_NAME[utmpdump.1] =3D "${mandir}/=
man1/utmpdump.1"
> >  ALTERNATIVE_LINK_NAME[uuid.3] =3D "${mandir}/man3/uuid.3"
> >  ALTERNATIVE_LINK_NAME[wall.1] =3D "${mandir}/man1/wall.1"
> >=20
> > +# dm-verity support introduces a circular build dependency, so util-l=
inux-uuid is split out for target builds
> > +# Need to build libuuid for uuidgen, but then delete it and let the o=
ther recipe ship it
> > +do_install_append() {
> > +    rm -rf ${D}${includedir}/uuid ${D}${libdir}/pkgconfig/uuid.pc ${D=
}${libdir}/libuuid* ${D}/lib/libuuid*
> > +}
> >=20
> >  BBCLASSEXTEND =3D "native nativesdk"
> >=20
> > --
> > 2.29.2
> >=20
> >=20
> >=20
> >=20


--=-6oyB2NzvKBD0PumeoSMr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmA+i5EACgkQSylmgFB4
UWKbLwf/Tsf4q+8eK1cucKMrAKYCvkJTRBLjQs/AEi1x6tBjQkuERolKhlA0WQTz
zbhtLcDmaFZho7H3H4KmuoXULfDPKcgj6phX6YdsQ+6q625fcCl+LtZHqE30kPHt
XwEc7wo4rRayvz+Cdl+VIGMP/ODb7KdoBVOTWUMRJf2JqW2UlKno8vRleDday06+
i3kfmMOV7YL3zHwApzNgHkJgON0xg9ZEg3cABDRYb2H8ecNulpYwOqZ62TMSazdY
vB2FPXP2wq0tmojlouvOIJmO7NX3OljI840FtbqUtlOKGCoofyeOkQHmZkt/4t5r
LX4eTPrH+1TqAugkFEaTZj8cIcPgjA==
=tsJE
-----END PGP SIGNATURE-----

--=-6oyB2NzvKBD0PumeoSMr--
