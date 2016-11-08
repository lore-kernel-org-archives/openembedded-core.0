Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id F0B1F719B2;
	Tue,  8 Nov 2016 12:57:39 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p190so22483759wmp.1;
	Tue, 08 Nov 2016 04:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=oja1X9quRQYd7LEPJJr3ZHGPXJOW1o+V2c46KLP2xdo=;
	b=Hby5hy5qmZdynfj39tBWUR3eXCnHF7d2aO+6+DTmXncsUZXjTTJoLef3Tx3s6FcxR0
	CN+clvmDbK5inliVmej/64d2Xo47W6Vkz73fBRtZz3BOteaoqB6uSgtHhnxfpyVI8htN
	jmdMtOz6VKjZ+Dlnewta1p6gtxGQw9PSleLst8XrdUIhC6qc3C3Ca7QVN9mpcekfqkUM
	OQiHl5WDpD/5KDkI1PWNt0OX4iJ494CEm4rn+untq64M96Njjwy8Sufr/T10eTYw2QBn
	k+RgU6O2905Qmlxjc+sasSQaCc/g6aZGzAFh5+8laAODFvATtRgG17Bjj38jHWzCPHZG
	LlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=oja1X9quRQYd7LEPJJr3ZHGPXJOW1o+V2c46KLP2xdo=;
	b=RAjmxahredQrLQ4npNJPMVZUSOFsjao0sN4pn6Ai6DLgC4Iqz/cK47M5XebfB3O7I5
	Ofz002x1teZCTrApuNhLBCXOf22I2TqI4bELl8aom4TLGoyJwMhtT4vhoTnNITQq46pa
	tMrxeLV1bp7hkZJm7V9EPLtrkf+grxzSHHjuD88W9/O5ybpVSAHSomZiXaA/nDkca2LK
	mzq3VCUoBpsBwESfEaQZUR7rO2dlaG1cIzmiTipa1LceTMhtx15PYpIXRStzP5lNOM5J
	9DCWU1RkjKxbIclDKgGhnYdrrJgu4Xz6BxIRoQDBw8eYm6PpZ5285wSsS5fCNXDpehwy
	XhHg==
X-Gm-Message-State: ABUngvfDVL81CksmFUSCtKVYBRVveylDeBrJWDIu/5NSX0cEDgHD5riGMrW/kcHuVN9v2A==
X-Received: by 10.28.30.3 with SMTP id e3mr15682477wme.40.1478609860165;
	Tue, 08 Nov 2016 04:57:40 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	ua15sm36987494wjb.1.2016.11.08.04.57.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 08 Nov 2016 04:57:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 8 Nov 2016 13:57:38 +0100
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20161108125738.GB2916@jama>
References: <20161108122406.GA2916@jama>
	<CALbNGRSLA=tipe+eed4wSKzw0ycs0g+gZVUAC_6cq6Q=WBMjEg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSLA=tipe+eed4wSKzw0ycs0g+gZVUAC_6cq6Q=WBMjEg@mail.gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world 2016-11-03
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
X-List-Received-Date: Tue, 08 Nov 2016 12:57:42 -0000
X-Groupsio-MsgNum: 89127
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline

--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2016 at 01:32:27PM +0100, Andreas M=FCller wrote:
> On Tue, Nov 8, 2016 at 1:24 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > Please note that the logs aren't available online, because the server w=
ith logs
> > was moved to other HW and the files weren't rsynced (yet - at least not=
 to correct
> > location visible as http://logs.nslu2-linux.org/buildlogs/oe).
> >
> > =3D=3D Number of issues - stats =3D=3D
> > {| class=3D'wikitable'
> > !|Date               !!colspan=3D'3'|Failed tasks                     !=
!colspan=3D'6'|Failed depencencies                    !!|Signatures        =
    !!colspan=3D'12'|QA !!Comment
> > |-
> > ||              ||qemuarm       ||qemux86       ||qemux86_64    ||qemua=
rm||max||min     ||qemux86||max||min     ||all   ||already-stripped      ||=
libdir        ||textrel       ||build-deps    ||file-rdeps    ||version-goi=
ng-backwards       ||host-user-contaminated        ||installed-vs-shipped  =
||unknown-configure-option      ||symlink-to-sysroot    ||invalid-pkgconfig=
     ||pkgname       ||
> > |-
> > ||2016-11-03    ||3     ||3     ||2     ||6     ||3     ||2     ||6    =
 ||3     ||2     ||0     ||0             ||0             ||1             ||=
1             ||4             ||226           ||1             ||1          =
   ||0             ||0             ||0             ||0             ||
> > |}
> >
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >
> > =3D=3D Failed tasks 2016-11-03 =3D=3D
> >
> > INFO: jenkins-job.sh-1.8.11 Complete log available at http://logs.nslu2=
-linux.org/buildlogs/oe/world/log.report.20161108_021000.log
> >
> > =3D=3D=3D common (2) =3D=3D=3D
> >     * meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10=
=2E3.bb:do_configure
> >     * openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb:=
do_compile
> Woops - I touched both recently - can't wait for next build with logs..

Here you go:

xfce4-vala:
| checking for VALA... no
| configure: error: Package requirements (libvala-0.32) were not met:
|=20
| No package 'libvala-0.32' found
|=20
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|=20
| Alternatively, you may set the environment variables VALA_CFLAGS
| and VALA_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/xfce4-vala/4.10=
=2E3-r0/temp/log.do_configure.28501)
NOTE: recipe xfce4-vala-4.10.3-r0: task do_configure: Failed

libsdl2:
ERROR: libsdl2-2.0.5-r0 do_compile: oe_runmake failed
ERROR: libsdl2-2.0.5-r0 do_compile: Function failed: do_compile (log file i=
s located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linu=
x-gnueabi/libsdl2/2.0.5-r0/temp/log.do_compile.27513)
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5te-oe-linux-gnueabi/libsdl2/2.0.5-r0/temp/log.do_compile.27513
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32', 'co=
mmon-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function do_compile
| NOTE: make -j 22
| ERROR: oe_runmake failed
| /bin/bash ../SDL2-2.0.5/build-scripts/mkinstalldirs build
| make: *** No rule to make target '/usr/share/wayland/wayland.xml', needed=
 by 'gen/wayland-client-protocol.h'.  Stop.
| make: *** Waiting for unfinished jobs....
| mkdir -p -- build
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/libsdl2/2.0.5-r0/=
temp/log.do_compile.27513)
NOTE: recipe libsdl2-2.0.5-r0: task do_compile: Failed
ERROR: Task (/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes=
-graphics/libsdl2/libsdl2_2.0.5.bb:do_compile) failed with exit code '1'

webkitgtk:
| ERROR: oe_runmake failed
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/6.2.0/ld: error: /home/jen=
kins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/arm-oe-linux-gnue=
abi/6.2.0/libgcc.a(linux-atomic-64bit.o): multiple definition of '__sync_ad=
d_and_fetch_8'
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/6.2.0/ld: ../../lib/libWTF=
GTK.a(../../lib/../Source/WTF/wtf/CMakeFiles/WTF.dir/Atomics.cpp.o): previo=
us definition here
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/6.2.0/ld: error: /home/jen=
kins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/arm-oe-linux-gnue=
abi/6.2.0/libgcc.a(linux-atomic-64bit.o): multiple definition of '__sync_su=
b_and_fetch_8'
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libex=
ec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/6.2.0/ld: ../../lib/libWTF=
GTK.a(../../lib/../Source/WTF/wtf/CMakeFiles/WTF.dir/Atomics.cpp.o): previo=
us definition here
| collect2: error: ld returned 1 exit status
| Source/WebKit2/CMakeFiles/WebKit2.dir/build.make:19450: recipe for target=
 'lib/libwebkit2gtk-4.0.so.37.14.8' failed
| make[2]: *** [lib/libwebkit2gtk-4.0.so.37.14.8] Error 1
>=20
> Andreas

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlghy8EACgkQN1Ujt2V2gBy7bgCbB1q/RvIdRorGXr4WzIovK/3C
slcAniTmBTsdAW7nGOX+1yWW1e8/jElA
=5Ypl
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
