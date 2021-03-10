Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.web11.6589.1615368552902867515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 01:29:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=lNRQ/fLK;
 spf=pass (domain: mailbox.org, ip: 80.241.56.172, mailfrom: crg7475@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4DwRbn5qxKzQjxP;
	Wed, 10 Mar 2021 10:29:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-type:content-type:in-reply-to
	:mime-version:date:date:message-id:from:from:references:subject
	:subject:received; s=mail20150812; t=1615368542; bh=YJdy4ZXNnw78
	wYJFPoOZi1GDiMQjQH0UFUKnSm4NHDc=; b=lNRQ/fLKFpABZ1gVNDfxSUH7smW0
	VcITtACb9U3B63qYaD7QNNWmc6GqN09V8QuX5u3UdpsoeN4FTMyXZdjDHgBKWtvs
	C1MZ1HRwEXIfjzIqtdP/hGmSVTOED1qrhcp2PFA1KOyNSFOjc0HYg5OpJmLTx2JC
	Ts1J0RfaZpppNuHZCZ+Y1Ucn8Oyt1CnTN9myQsSMhx5eZ9wqgNKFx25RA6Dm7eKN
	l5z6/9W2ly+Xh2jU5rOwsC4QJ0L0p/Ll5DpRd/tRsPYv//NdWtYjsLYIdPUEsFDj
	lAiuJsnQQuFXRPOn/J+VSnBb0E09qCrEUVEGPvmdic9ZVgqGuHdbkf5JcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1615368547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XXntAACM1Nabp/+kn1ESwGXncm+hrtb1DZ7XSBWwdSE=;
	b=cNgkgtk97qlD2CdC0uoEAThP0+GT0ilfUV31bN5/0/zRHOX64dxaQimovptzPWeMBpRlfA
	ULvdPXY1JdbHiYCMASDxGWgqvpDr0BIFKAbsa2yQmV2XzLFaRse1NSH9T6QkNdAD36UgXB
	0AUQBdm1FOspfbnDQ4NFg8r5mlGSqDVerHjfYpez5htNjH8RxnNmrqgUx1/UElDSpIsBp4
	3wca4iJegM0G9XnZWUu/fK+08Y3v3PtpFBHOaai4gHCIDUgQwmT2tRlSb1DICA52ppqVIk
	ACE4RWFaw+g6YqF0lu/dJVWYf88gk1WitZ1jBmaSih19JzpLNRvfFPW6L9/rWg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
	with ESMTP id 8OQ7K3RsEE4A; Wed, 10 Mar 2021 10:29:02 +0100 (CET)
Subject: Re: [OE-core] [PATCH] pipewire: add recipe from meta-openembedded and upgrade to 0.3.23
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20210310070810.20295-1-crg7475@mailbox.org>
 <CANNYZj__UMPf97d-5q0oHSdfOm_-OEdqfTdqFW3-9t50tuzrmQ@mail.gmail.com>
From: "Carlos Rafael Giani" <crg7475@mailbox.org>
Message-ID: <a22009de-8d80-9571-115d-81d182634fee@mailbox.org>
Date: Wed, 10 Mar 2021 10:29:01 +0100
MIME-Version: 1.0
In-Reply-To: <CANNYZj__UMPf97d-5q0oHSdfOm_-OEdqfTdqFW3-9t50tuzrmQ@mail.gmail.com>
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.40 / 15.00 / 15.00
X-Rspamd-Queue-Id: 5BFB21886
X-Rspamd-UID: 926bf0
Content-Type: multipart/alternative;
 boundary="------------CE25D5F0C69DF44865177A70"
Content-Language: en-US

--------------CE25D5F0C69DF44865177A70
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

In an earlier discussion, it was mentioned that this can act as a=20
drop-in replacement for PulseAudio and JACK, and that the way to move=20
forward should be to first migrate it and then see if via a packagegroup=
=20
or feature such a replacement logic can be established. These would be=20
reasons for a migration.

On 10.03.21 09:35, Alexander Kanavin wrote:
> But why should it be in oe-core?
>
> Alex
>
> On Wed, 10 Mar 2021 at 08:09, Carlos Rafael Giani via=20
> lists.openembedded.org <http://lists.openembedded.org>=20
> <crg7475=3Dmailbox.org@lists.openembedded.org=20
> <mailto:mailbox.org@lists.openembedded.org>> wrote:
>
>     PipeWire is a new multimedia daemon that aims to be a replacement fo=
r
>     both JACK and PulseAudio. Additionally, it provides IO and routing
>     functionality for video. It also has PulseAudio shim to act as a
>     drop-in
>     replacement.
>
>     Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org
>     <mailto:crg7475@mailbox.org>>
>     ---
>     =C2=A0.../pipewire/pipewire_0.3.23.bb <http://pipewire_0.3.23.bb> =
=C2=A0 =C2=A0 =C2=A0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0| 272 ++++++++++++++++++
>     =C2=A01 file changed, 272 insertions(+)
>     =C2=A0create mode 100644
>     meta/recipes-multimedia/pipewire/pipewire_0.3.23.bb
>     <http://pipewire_0.3.23.bb>
>
>     diff --git a/meta/recipes-multimedia/pipewire/pipewire_0.3.23.bb
>     <http://pipewire_0.3.23.bb>
>     b/meta/recipes-multimedia/pipewire/pipewire_0.3.23.bb
>     <http://pipewire_0.3.23.bb>
>     new file mode 100644
>     index 0000000000..1c226b3faf
>     --- /dev/null
>     +++ b/meta/recipes-multimedia/pipewire/pipewire_0.3.23.bb
>     <http://pipewire_0.3.23.bb>
>     @@ -0,0 +1,272 @@
>     +SUMMARY =3D "Multimedia processing server for Linux"
>     +DESCRIPTION =3D "Linux server for handling and routing audio and
>     video streams between applications and multimedia I/O devices"
>     +HOMEPAGE =3D "https://pipewire.org/ <https://pipewire.org/>"
>     +BUGTRACKER=C2=A0 =3D
>     "https://gitlab.freedesktop.org/pipewire/pipewire/issues
>     <https://gitlab.freedesktop.org/pipewire/pipewire/issues>"
>     +LICENSE =3D "MIT"
>     +LIC_FILES_CHKSUM =3D " \
>     +=C2=A0 =C2=A0 file://LICENSE;md5=3De2c0b7d86d04e716a3c4c9ab34260e69=
 \
>     +=C2=A0 =C2=A0 file://COPYING;md5=3D97be96ca4fab23e9657ffa590b931c1a=
 \
>     +"
>     +SECTION =3D "multimedia"
>     +
>     +DEPENDS =3D "dbus"
>     +
>     +SRCREV =3D "68f6c75caed047af32320ab4de0c06457457be54"
>     +SRC_URI =3D
>     "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3Dmaster;=
protocol=3Dhttps
>     <http://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3Dmaster=
;protocol=3Dhttps>"
>     +
>     +S =3D "${WORKDIR}/git"
>     +
>     +inherit meson pkgconfig systemd manpages gettext useradd
>     +
>     +USERADD_PACKAGES =3D "${PN}"
>     +
>     +GROUPADD_PARAM_${PN} =3D "--system pipewire"
>     +
>     +USERADD_PARAM_${PN} =3D "--system --home / --no-create-home \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0--comment 'PipeWire multimedia daemon' \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0--gid pipewire --groups audio,video \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0pipewire"
>     +
>     +# For "EVL", look up https://evlproject.org/
>     <https://evlproject.org/> . It involves
>     +# a specially prepared kernel, and is currently unavailable
>     +# in Yocto.
>     +# FFmpeg and Vulkan aren't really supported - at the current
>     +# stage (version 0.3.23), these are just experiments, not
>     +# actual features.
>     +# libcamera support currently does not build successfully.
>     +# systemd user service files are disabled because per-user
>     +# PipeWire instances aren't really something that makes
>     +# much sense in an embedded environment. A system-wide
>     +# instance does.
>     +EXTRA_OEMESON +=3D " \
>     +=C2=A0 =C2=A0 -Daudiotestsrc=3Dtrue \
>     +=C2=A0 =C2=A0 -Devl=3Dfalse \
>     +=C2=A0 =C2=A0 -Dsystemd-user-service=3Dfalse \
>     +=C2=A0 =C2=A0 -Dtests=3Dfalse \
>     +=C2=A0 =C2=A0 -Dudevrulesdir=3D${nonarch_base_libdir}/udev/rules.d/=
 \
>     +=C2=A0 =C2=A0 -Dvideotestsrc=3Dtrue \
>     +=C2=A0 =C2=A0 -Dffmpeg=3Dfalse \
>     +=C2=A0 =C2=A0 -Dvulkan=3Dfalse \
>     +=C2=A0 =C2=A0 -Dlibcamera=3Dfalse \
>     +"
>     +
>     +PACKAGECONFIG ??=3D "\
>     +=C2=A0 =C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', =
'bluez',
>     '', d)} \
>     +=C2=A0 =C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'alsa systemd',=
 d)} \
>     +=C2=A0 =C2=A0 gstreamer jack v4l2 \
>     +"
>     +
>     +# "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
>     +# since "jack" imports libjack, and "pipewire-jack" generates
>     +# libjack.so* files, thus colliding with the libpack package. This
>     +# is why these two are marked in their respective packageconfigs
>     +# as being in conflict.
>     +
>     +PACKAGECONFIG[alsa] =3D "-Dalsa=3Dtrue,-Dalsa=3Dfalse,alsa-lib udev=
"
>     +PACKAGECONFIG[bluez] =3D "-Dbluez5=3Dtrue,-Dbluez5=3Dfalse,bluez5 s=
bc"
>     +PACKAGECONFIG[docs] =3D "-Ddocs=3Dtrue,-Ddocs=3Dfalse,doxygen"
>     +PACKAGECONFIG[gstreamer] =3D
>     "-Dgstreamer=3Dtrue,-Dgstreamer=3Dfalse,glib-2.0 gstreamer1.0
>     gstreamer1.0-plugins-base"
>     +PACKAGECONFIG[jack] =3D "-Djack=3Dtrue,-Djack=3Dfalse,jack,,,pipewi=
re-jack"
>     +PACKAGECONFIG[manpages] =3D
>     "-Dman=3Dtrue,-Dman=3Dfalse,libxml-parser-perl-native"
>     +PACKAGECONFIG[sdl2] =3D
>     "-Dsdl2=3Denabled,-Dsdl2=3Ddisabled,virtual/libsdl2"
>     +PACKAGECONFIG[sndfile] =3D
>     "-Dsndfile=3Denabled,-Dsndfile=3Ddisabled,libsndfile1"
>     +PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue
>     -Dsystemd-system-service=3Dtrue ,-Dsystemd=3Dfalse
>     -Dsystemd-system-service=3Dfalse,systemd"
>     +PACKAGECONFIG[v4l2] =3D "-Dv4l2=3Dtrue,-Dv4l2=3Dfalse,udev"
>     +PACKAGECONFIG[pipewire-alsa] =3D
>     "-Dpipewire-alsa=3Dtrue,-Dpipewire-alsa=3Dfalse,alsa-lib"
>     +PACKAGECONFIG[pipewire-jack] =3D "-Dpipewire-jack=3Dtrue
>     -Dlibjack-path=3D${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=
=3Dfalse,jack,,,jack"
>     +
>     +PACKAGESPLITFUNCS_prepend =3D " split_dynamic_packages "
>     +PACKAGESPLITFUNCS_append =3D " set_dynamic_metapkg_rdepends "
>     +
>     +SPA_SUBDIR =3D "spa-0.2"
>     +PW_MODULE_SUBDIR =3D "pipewire-0.3"
>     +
>     +remove_unused_installed_files() {
>     +=C2=A0 =C2=A0 # jack.conf is used by pipewire-jack (not the JACK SP=
A plugin).
>     +=C2=A0 =C2=A0 # Remove it if pipewire-jack is not built to avoid cr=
eating the
>     +=C2=A0 =C2=A0 # pipewire-jack package.
>     +=C2=A0 =C2=A0 if ${@bb.utils.contains('PACKAGECONFIG', 'pipewire-ja=
ck',
>     'false', 'true', d)}; then
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f "${D}${sysconfdir}/pipewire/jack.=
conf"
>     +=C2=A0 =C2=A0 fi
>     +}
>     +
>     +do_install[postfuncs] +=3D "remove_unused_installed_files"
>     +
>     +python split_dynamic_packages () {
>     +=C2=A0 =C2=A0 # Create packages for each SPA plugin. These plugins =
are located
>     +=C2=A0 =C2=A0 # in individual subdirectories, so a recursive search=
 is needed.
>     +=C2=A0 =C2=A0 spa_libdir =3D d.expand('${libdir}/${SPA_SUBDIR}')
>     +=C2=A0 =C2=A0 do_split_packages(d, spa_libdir, r'^libspa-(.*)\.so$'=
,
>     d.expand('${PN}-spa-plugins-%s'), 'PipeWire SPA plugin for %s',
>     extra_depends=3D'', recursive=3DTrue)
>     +
>     +=C2=A0 =C2=A0 # Create packages for each PipeWire module.
>     +=C2=A0 =C2=A0 pw_module_libdir =3D d.expand('${libdir}/${PW_MODULE_=
SUBDIR}')
>     +=C2=A0 =C2=A0 do_split_packages(d, pw_module_libdir,
>     r'^libpipewire-module-(.*)\.so$', d.expand('${PN}-modules-%s'),
>     'PipeWire %s module', extra_depends=3D'', recursive=3DFalse)
>     +}
>     +
>     +python set_dynamic_metapkg_rdepends () {
>     +=C2=A0 =C2=A0 import os
>     +=C2=A0 =C2=A0 import oe.utils
>     +
>     +=C2=A0 =C2=A0 # Go through all generated SPA plugin and PipeWire mo=
dule
>     packages
>     +=C2=A0 =C2=A0 # (excluding the main package and the -meta package i=
tself) and
>     +=C2=A0 =C2=A0 # add them to the -meta package as RDEPENDS.
>     +
>     +=C2=A0 =C2=A0 base_pn =3D d.getVar('PN')
>     +
>     +=C2=A0 =C2=A0 spa_pn =3D base_pn + '-spa-plugins'
>     +=C2=A0 =C2=A0 spa_metapkg =3D=C2=A0 spa_pn + '-meta'
>     +
>     +=C2=A0 =C2=A0 pw_module_pn =3D base_pn + '-modules'
>     +=C2=A0 =C2=A0 pw_module_metapkg =3D=C2=A0 pw_module_pn + '-meta'
>     +
>     +=C2=A0 =C2=A0 d.setVar('ALLOW_EMPTY_' + spa_metapkg, "1")
>     +=C2=A0 =C2=A0 d.setVar('FILES_' + spa_metapkg, "")
>     +
>     +=C2=A0 =C2=A0 d.setVar('ALLOW_EMPTY_' + pw_module_metapkg, "1")
>     +=C2=A0 =C2=A0 d.setVar('FILES_' + pw_module_metapkg, "")
>     +
>     +=C2=A0 =C2=A0 blacklist =3D [ spa_pn, spa_metapkg, pw_module_pn,
>     pw_module_metapkg ]
>     +=C2=A0 =C2=A0 spa_metapkg_rdepends =3D []
>     +=C2=A0 =C2=A0 pw_module_metapkg_rdepends =3D []
>     +=C2=A0 =C2=A0 pkgdest =3D d.getVar('PKGDEST')
>     +
>     +=C2=A0 =C2=A0 for pkg in oe.utils.packages_filter_out_system(d):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkg in blacklist:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_spa_pkg =3D pkg.startswith(spa_pn)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_pw_module_pkg =3D pkg.startswith(pw_=
module_pn)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not is_spa_pkg and not is_pw_module_=
pkg:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkg in spa_metapkg_rdepends or pkg i=
n
>     pw_module_metapkg_rdepends:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # See if the package is empty by lookin=
g at the contents
>     of its
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # PKGDEST subdirectory. If this subdire=
ctory is empty,
>     then then
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # package is empty as well. Empty packa=
ges do not get
>     added to
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the meta package's RDEPENDS.
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgdir =3D os.path.join(pkgdest, pkg)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(pkgdir):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir_contents =3D os.listd=
ir(pkgdir) or []
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir_contents =3D []
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_empty =3D len(dir_contents) =3D=3D 0
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not is_empty:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if is_spa_pkg:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_metapkg=
_rdepends.append(pkg)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if is_pw_module_pkg:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_module_m=
etapkg_rdepends.append(pkg)
>     +
>     +=C2=A0 =C2=A0 d.setVar('RDEPENDS_' + spa_metapkg, '
>     '.join(spa_metapkg_rdepends))
>     +=C2=A0 =C2=A0 d.setVar('DESCRIPTION_' + spa_metapkg, spa_pn + ' met=
a package')
>     +
>     +=C2=A0 =C2=A0 d.setVar('RDEPENDS_' + pw_module_metapkg, '
>     '.join(pw_module_metapkg_rdepends))
>     +=C2=A0 =C2=A0 d.setVar('DESCRIPTION_' + pw_module_metapkg, pw_modul=
e_pn + '
>     meta package')
>     +}
>     +
>     +PACKAGES =3D+ "\
>     +=C2=A0 =C2=A0 libpipewire \
>     +=C2=A0 =C2=A0 ${PN}-tools \
>     +=C2=A0 =C2=A0 ${PN}-pulse \
>     +=C2=A0 =C2=A0 ${PN}-alsa \
>     +=C2=A0 =C2=A0 ${PN}-jack \
>     +=C2=A0 =C2=A0 ${PN}-media-session \
>     +=C2=A0 =C2=A0 ${PN}-spa-plugins \
>     +=C2=A0 =C2=A0 ${PN}-spa-plugins-meta \
>     +=C2=A0 =C2=A0 ${PN}-spa-tools \
>     +=C2=A0 =C2=A0 ${PN}-modules \
>     +=C2=A0 =C2=A0 ${PN}-modules-meta \
>     +=C2=A0 =C2=A0 ${PN}-alsa-card-profile \
>     +=C2=A0 =C2=A0 gstreamer1.0-pipewire \
>     +"
>     +
>     +PACKAGES_DYNAMIC =3D "^${PN}-spa-plugins.* ^${PN}-modules.*"
>     +
>     +SYSTEMD_SERVICE_${PN} =3D "pipewire.service"
>     +CONFFILES_${PN} +=3D "${sysconfdir}/pipewire/pipewire.conf"
>     +FILES_${PN} =3D " \
>     +=C2=A0 =C2=A0 ${sysconfdir}/pipewire/pipewire.conf \
>     +=C2=A0 =C2=A0 ${systemd_system_unitdir}/pipewire.* \
>     +=C2=A0 =C2=A0 ${bindir}/pipewire \
>     +"
>     +
>     +FILES_${PN}-dev +=3D " \
>     +=C2=A0 =C2=A0 ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so \
>     +"
>     +
>     +CONFFILES_libpipewire +=3D "${sysconfdir}/pipewire/client.conf"
>     +FILES_libpipewire =3D " \
>     +=C2=A0 =C2=A0 ${sysconfdir}/pipewire/client.conf \
>     +=C2=A0 =C2=A0 ${libdir}/libpipewire-*.so.* \
>     +"
>     +# Add the bare minimum modules and plugins required to be able
>     +# to use libpipewire. Without these, it is essentially unusable.
>     +RDEPENDS_libpipewire +=3D " \
>     +=C2=A0 =C2=A0 ${PN}-modules-client-node \
>     +=C2=A0 =C2=A0 ${PN}-modules-protocol-native \
>     +=C2=A0 =C2=A0 ${PN}-spa-plugins-support \
>     +"
>     +
>     +FILES_${PN}-tools =3D " \
>     +=C2=A0 =C2=A0 ${bindir}/pw-* \
>     +"
>     +
>     +# This is a shim daemon that is intended to be used as a
>     +# drop-in PulseAudio replacement, providing a pulseaudio-compatible
>     +# socket that can be used by applications that use libpulse.
>     +CONFFILES_${PN}-pulse +=3D "${sysconfdir}/pipewire/pipewire-pulse.c=
onf"
>     +FILES_${PN}-pulse =3D " \
>     +=C2=A0 =C2=A0 ${sysconfdir}/pipewire/pipewire-pulse.conf \
>     +=C2=A0 =C2=A0 ${bindir}/pipewire-pulse \
>     +"
>     +RDEPENDS_${PN}-pulse +=3D " \
>     +=C2=A0 =C2=A0 ${PN}-modules-protocol-pulse \
>     +"
>     +
>     +# alsa plugin to redirect audio to pipewire
>     +FILES_${PN}-alsa =3D "\
>     +=C2=A0 =C2=A0 ${libdir}/alsa-lib/* \
>     +=C2=A0 =C2=A0 ${datadir}/alsa/alsa.conf.d/* \
>     +"
>     +
>     +# jack drop-in libraries to redirect audio to pipewire
>     +CONFFILES_${PN}-jack =3D "${sysconfdir}/pipewire/jack.conf"
>     +FILES_${PN}-jack =3D "\
>     +=C2=A0 =C2=A0 ${sysconfdir}/pipewire/jack.conf \
>     +=C2=A0 =C2=A0 ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* \
>     +"
>     +
>     +# Example session manager. Not intended for use in production.
>     +CONFFILES_${PN}-media-session =3D
>     "${sysconfdir}/pipewire/media-session.d/*"
>     +FILES_${PN}-media-session =3D " \
>     +=C2=A0 =C2=A0 ${bindir}/pipewire-media-session \
>     +=C2=A0 =C2=A0 ${sysconfdir}/pipewire/media-session.d/* \
>     +"
>     +RPROVIDES_${PN}-media-session =3D "virtual/pipewire-sessionmanager"
>     +
>     +# Dynamic packages (see set_dynamic_metapkg_rdepends).
>     +FILES_${PN}-spa-plugins =3D ""
>     +RRECOMMENDS_${PN}-spa-plugins +=3D "${PN}-spa-plugins-meta"
>     +
>     +FILES_${PN}-spa-tools =3D " \
>     +=C2=A0 =C2=A0 ${bindir}/spa-* \
>     +"
>     +
>     +# Dynamic packages (see set_dynamic_metapkg_rdepends).
>     +FILES_${PN}-modules =3D ""
>     +RRECOMMENDS_${PN}-modules +=3D "${PN}-modules-meta"
>     +
>     +CONFFILES_${PN}-modules-rtkit =3D
>     "${sysconfdir}/pipewire/client-rt.conf"
>     +FILES_${PN}-modules-rtkit +=3D " \
>     +=C2=A0 =C2=A0 ${sysconfdir}/pipewire/client-rt.conf \
>     +=C2=A0 =C2=A0 "
>     +
>     +FILES_${PN}-alsa-card-profile =3D " \
>     +=C2=A0 =C2=A0 ${datadir}/alsa-card-profile/* \
>     + ${nonarch_base_libdir}/udev/rules.d/90-pipewire-alsa.rules \
>     +"
>     +
>     +FILES_gstreamer1.0-pipewire =3D " \
>     +=C2=A0 =C2=A0 ${libdir}/gstreamer-1.0/* \
>     +"
>     --=20
>     2.25.1
>
>
>    =20
>

--------------CE25D5F0C69DF44865177A70
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <p>In an earlier discussion, it was mentioned that this can act as a
      drop-in replacement for PulseAudio and JACK, and that the way to
      move forward should be to first migrate it and then see if via a
      packagegroup or feature such a replacement logic can be
      established. These would be reasons for a migration.<br>
    </p>
    <div class=3D"moz-cite-prefix">On 10.03.21 09:35, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CANNYZj__UMPf97d-5q0oHSdfOm_-OEdqfTdqFW3-9t50tuzrmQ@mail.gmail=
.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUT=
F-8">
      <div dir=3D"ltr">
        <div>But why should it be in oe-core?</div>
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Wed, 10 Mar 2021 at 08:09=
,
          Carlos Rafael Giani via <a
            href=3D"http://lists.openembedded.org" moz-do-not-send=3D"true=
">lists.openembedded.org</a>
          &lt;crg7475=3D<a
            href=3D"mailto:mailbox.org@lists.openembedded.org"
            moz-do-not-send=3D"true">mailbox.org@lists.openembedded.org</a=
>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">P=
ipeWire
          is a new multimedia daemon that aims to be a replacement for<br>
          both JACK and PulseAudio. Additionally, it provides IO and
          routing<br>
          functionality for video. It also has PulseAudio shim to act as
          a drop-in<br>
          replacement.<br>
          <br>
          Signed-off-by: Carlos Rafael Giani &lt;<a
            href=3D"mailto:crg7475@mailbox.org" target=3D"_blank"
            moz-do-not-send=3D"true">crg7475@mailbox.org</a>&gt;<br>
          ---<br>
          =C2=A0.../pipewire/<a href=3D"http://pipewire_0.3.23.bb"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
pipewire_0.3.23.bb</a>=C2=A0
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 272 ++++++++++=
++++++++<br>
          =C2=A01 file changed, 272 insertions(+)<br>
          =C2=A0create mode 100644 meta/recipes-multimedia/pipewire/<a
            href=3D"http://pipewire_0.3.23.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">pipewire_0.3.23.bb<=
/a><br>
          <br>
          diff --git a/meta/recipes-multimedia/pipewire/<a
            href=3D"http://pipewire_0.3.23.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">pipewire_0.3.23.bb<=
/a>
          b/meta/recipes-multimedia/pipewire/<a
            href=3D"http://pipewire_0.3.23.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">pipewire_0.3.23.bb<=
/a><br>
          new file mode 100644<br>
          index 0000000000..1c226b3faf<br>
          --- /dev/null<br>
          +++ b/meta/recipes-multimedia/pipewire/<a
            href=3D"http://pipewire_0.3.23.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">pipewire_0.3.23.bb<=
/a><br>
          @@ -0,0 +1,272 @@<br>
          +SUMMARY =3D "Multimedia processing server for Linux"<br>
          +DESCRIPTION =3D "Linux server for handling and routing audio
          and video streams between applications and multimedia I/O
          devices"<br>
          +HOMEPAGE =3D "<a href=3D"https://pipewire.org/" rel=3D"noreferr=
er"
            target=3D"_blank" moz-do-not-send=3D"true">https://pipewire.or=
g/</a>"<br>
          +BUGTRACKER=C2=A0 =3D "<a
            href=3D"https://gitlab.freedesktop.org/pipewire/pipewire/issue=
s"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
https://gitlab.freedesktop.org/pipewire/pipewire/issues</a>"<br>
          +LICENSE =3D "MIT"<br>
          +LIC_FILES_CHKSUM =3D " \<br>
          +=C2=A0 =C2=A0 <a class=3D"moz-txt-link-freetext" href=3D"file:/=
/LICENSE;md5=3De2c0b7d86d04e716a3c4c9ab34260e69">file://LICENSE;md5=3De2c0b=
7d86d04e716a3c4c9ab34260e69</a> \<br>
          +=C2=A0 =C2=A0 <a class=3D"moz-txt-link-freetext" href=3D"file:/=
/COPYING;md5=3D97be96ca4fab23e9657ffa590b931c1a">file://COPYING;md5=3D97be9=
6ca4fab23e9657ffa590b931c1a</a> \<br>
          +"<br>
          +SECTION =3D "multimedia"<br>
          +<br>
          +DEPENDS =3D "dbus"<br>
          +<br>
          +SRCREV =3D "68f6c75caed047af32320ab4de0c06457457be54"<br>
          +SRC_URI =3D "git://<a
href=3D"http://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3Dmaste=
r;protocol=3Dhttps"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
gitlab.freedesktop.org/pipewire/pipewire.git;branch=3Dmaster;protocol=3Dhtt=
ps</a>"<br>
          +<br>
          +S =3D "${WORKDIR}/git"<br>
          +<br>
          +inherit meson pkgconfig systemd manpages gettext useradd<br>
          +<br>
          +USERADD_PACKAGES =3D "${PN}"<br>
          +<br>
          +GROUPADD_PARAM_${PN} =3D "--system pipewire"<br>
          +<br>
          +USERADD_PARAM_${PN} =3D "--system --home / --no-create-home \<b=
r>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0--comment 'PipeWire multimedia daemon'
          \<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0--gid pipewire --groups audio,video \<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0pipewire"<br>
          +<br>
          +# For "EVL", look up <a href=3D"https://evlproject.org/"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
https://evlproject.org/</a>
          . It involves<br>
          +# a specially prepared kernel, and is currently unavailable<br>
          +# in Yocto.<br>
          +# FFmpeg and Vulkan aren't really supported - at the current<br=
>
          +# stage (version 0.3.23), these are just experiments, not<br>
          +# actual features.<br>
          +# libcamera support currently does not build successfully.<br>
          +# systemd user service files are disabled because per-user<br>
          +# PipeWire instances aren't really something that makes<br>
          +# much sense in an embedded environment. A system-wide<br>
          +# instance does.<br>
          +EXTRA_OEMESON +=3D " \<br>
          +=C2=A0 =C2=A0 -Daudiotestsrc=3Dtrue \<br>
          +=C2=A0 =C2=A0 -Devl=3Dfalse \<br>
          +=C2=A0 =C2=A0 -Dsystemd-user-service=3Dfalse \<br>
          +=C2=A0 =C2=A0 -Dtests=3Dfalse \<br>
          +=C2=A0 =C2=A0 -Dudevrulesdir=3D${nonarch_base_libdir}/udev/rule=
s.d/ \<br>
          +=C2=A0 =C2=A0 -Dvideotestsrc=3Dtrue \<br>
          +=C2=A0 =C2=A0 -Dffmpeg=3Dfalse \<br>
          +=C2=A0 =C2=A0 -Dvulkan=3Dfalse \<br>
          +=C2=A0 =C2=A0 -Dlibcamera=3Dfalse \<br>
          +"<br>
          +<br>
          +PACKAGECONFIG ??=3D "\<br>
          +=C2=A0 =C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'bluetoot=
h',
          'bluez', '', d)} \<br>
          +=C2=A0 =C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'alsa syste=
md', d)}
          \<br>
          +=C2=A0 =C2=A0 gstreamer jack v4l2 \<br>
          +"<br>
          +<br>
          +# "jack" and "pipewire-jack" packageconfigs cannot be both
          enabled,<br>
          +# since "jack" imports libjack, and "pipewire-jack" generates<b=
r>
          +# libjack.so* files, thus colliding with the libpack package.
          This<br>
          +# is why these two are marked in their respective
          packageconfigs<br>
          +# as being in conflict.<br>
          +<br>
          +PACKAGECONFIG[alsa] =3D "-Dalsa=3Dtrue,-Dalsa=3Dfalse,alsa-lib
          udev"<br>
          +PACKAGECONFIG[bluez] =3D "-Dbluez5=3Dtrue,-Dbluez5=3Dfalse,blue=
z5
          sbc"<br>
          +PACKAGECONFIG[docs] =3D "-Ddocs=3Dtrue,-Ddocs=3Dfalse,doxygen"<=
br>
          +PACKAGECONFIG[gstreamer] =3D
          "-Dgstreamer=3Dtrue,-Dgstreamer=3Dfalse,glib-2.0 gstreamer1.0
          gstreamer1.0-plugins-base"<br>
          +PACKAGECONFIG[jack] =3D
          "-Djack=3Dtrue,-Djack=3Dfalse,jack,,,pipewire-jack"<br>
          +PACKAGECONFIG[manpages] =3D
          "-Dman=3Dtrue,-Dman=3Dfalse,libxml-parser-perl-native"<br>
          +PACKAGECONFIG[sdl2] =3D
          "-Dsdl2=3Denabled,-Dsdl2=3Ddisabled,virtual/libsdl2"<br>
          +PACKAGECONFIG[sndfile] =3D
          "-Dsndfile=3Denabled,-Dsndfile=3Ddisabled,libsndfile1"<br>
          +PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue
          -Dsystemd-system-service=3Dtrue ,-Dsystemd=3Dfalse
          -Dsystemd-system-service=3Dfalse,systemd"<br>
          +PACKAGECONFIG[v4l2] =3D "-Dv4l2=3Dtrue,-Dv4l2=3Dfalse,udev"<br>
          +PACKAGECONFIG[pipewire-alsa] =3D
          "-Dpipewire-alsa=3Dtrue,-Dpipewire-alsa=3Dfalse,alsa-lib"<br>
          +PACKAGECONFIG[pipewire-jack] =3D "-Dpipewire-jack=3Dtrue
-Dlibjack-path=3D${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=3Dfals=
e,jack,,,jack"<br>
          +<br>
          +PACKAGESPLITFUNCS_prepend =3D " split_dynamic_packages "<br>
          +PACKAGESPLITFUNCS_append =3D " set_dynamic_metapkg_rdepends "<b=
r>
          +<br>
          +SPA_SUBDIR =3D "spa-0.2"<br>
          +PW_MODULE_SUBDIR =3D "pipewire-0.3"<br>
          +<br>
          +remove_unused_installed_files() {<br>
          +=C2=A0 =C2=A0 # jack.conf is used by pipewire-jack (not the JAC=
K SPA
          plugin).<br>
          +=C2=A0 =C2=A0 # Remove it if pipewire-jack is not built to avoi=
d
          creating the<br>
          +=C2=A0 =C2=A0 # pipewire-jack package.<br>
          +=C2=A0 =C2=A0 if ${@bb.utils.contains('PACKAGECONFIG', 'pipewir=
e-jack',
          'false', 'true', d)}; then<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f "${D}${sysconfdir}/pipewire/j=
ack.conf"<br>
          +=C2=A0 =C2=A0 fi<br>
          +}<br>
          +<br>
          +do_install[postfuncs] +=3D "remove_unused_installed_files"<br>
          +<br>
          +python split_dynamic_packages () {<br>
          +=C2=A0 =C2=A0 # Create packages for each SPA plugin. These plug=
ins are
          located<br>
          +=C2=A0 =C2=A0 # in individual subdirectories, so a recursive se=
arch is
          needed.<br>
          +=C2=A0 =C2=A0 spa_libdir =3D d.expand('${libdir}/${SPA_SUBDIR}'=
)<br>
          +=C2=A0 =C2=A0 do_split_packages(d, spa_libdir, r'^libspa-(.*)\.=
so$',
          d.expand('${PN}-spa-plugins-%s'), 'PipeWire SPA plugin for
          %s', extra_depends=3D'', recursive=3DTrue)<br>
          +<br>
          +=C2=A0 =C2=A0 # Create packages for each PipeWire module.<br>
          +=C2=A0 =C2=A0 pw_module_libdir =3D
          d.expand('${libdir}/${PW_MODULE_SUBDIR}')<br>
          +=C2=A0 =C2=A0 do_split_packages(d, pw_module_libdir,
          r'^libpipewire-module-(.*)\.so$',
          d.expand('${PN}-modules-%s'), 'PipeWire %s module',
          extra_depends=3D'', recursive=3DFalse)<br>
          +}<br>
          +<br>
          +python set_dynamic_metapkg_rdepends () {<br>
          +=C2=A0 =C2=A0 import os<br>
          +=C2=A0 =C2=A0 import oe.utils<br>
          +<br>
          +=C2=A0 =C2=A0 # Go through all generated SPA plugin and PipeWir=
e module
          packages<br>
          +=C2=A0 =C2=A0 # (excluding the main package and the -meta packa=
ge
          itself) and<br>
          +=C2=A0 =C2=A0 # add them to the -meta package as RDEPENDS.<br>
          +<br>
          +=C2=A0 =C2=A0 base_pn =3D d.getVar('PN')<br>
          +<br>
          +=C2=A0 =C2=A0 spa_pn =3D base_pn + '-spa-plugins'<br>
          +=C2=A0 =C2=A0 spa_metapkg =3D=C2=A0 spa_pn + '-meta'<br>
          +<br>
          +=C2=A0 =C2=A0 pw_module_pn =3D base_pn + '-modules'<br>
          +=C2=A0 =C2=A0 pw_module_metapkg =3D=C2=A0 pw_module_pn + '-meta=
'<br>
          +<br>
          +=C2=A0 =C2=A0 d.setVar('ALLOW_EMPTY_' + spa_metapkg, "1")<br>
          +=C2=A0 =C2=A0 d.setVar('FILES_' + spa_metapkg, "")<br>
          +<br>
          +=C2=A0 =C2=A0 d.setVar('ALLOW_EMPTY_' + pw_module_metapkg, "1")=
<br>
          +=C2=A0 =C2=A0 d.setVar('FILES_' + pw_module_metapkg, "")<br>
          +<br>
          +=C2=A0 =C2=A0 blacklist =3D [ spa_pn, spa_metapkg, pw_module_pn=
,
          pw_module_metapkg ]<br>
          +=C2=A0 =C2=A0 spa_metapkg_rdepends =3D []<br>
          +=C2=A0 =C2=A0 pw_module_metapkg_rdepends =3D []<br>
          +=C2=A0 =C2=A0 pkgdest =3D d.getVar('PKGDEST')<br>
          +<br>
          +=C2=A0 =C2=A0 for pkg in oe.utils.packages_filter_out_system(d)=
:<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkg in blacklist:<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
          +<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_spa_pkg =3D pkg.startswith(spa_p=
n)<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_pw_module_pkg =3D pkg.startswith=
(pw_module_pn)<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not is_spa_pkg and not is_pw_mod=
ule_pkg:<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
          +<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkg in spa_metapkg_rdepends or p=
kg in
          pw_module_metapkg_rdepends:<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
          +<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # See if the package is empty by lo=
oking at the
          contents of its<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # PKGDEST subdirectory. If this sub=
directory is
          empty, then then<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # package is empty as well. Empty p=
ackages do not get
          added to<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the meta package's RDEPENDS.<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgdir =3D os.path.join(pkgdest, pk=
g)<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(pkgdir):<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir_contents =3D os.l=
istdir(pkgdir) or []<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir_contents =3D []<b=
r>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_empty =3D len(dir_contents) =3D=
=3D 0<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not is_empty:<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if is_spa_pkg:<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spa_met=
apkg_rdepends.append(pkg)<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if is_pw_module_pkg:<=
br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pw_modu=
le_metapkg_rdepends.append(pkg)<br>
          +<br>
          +=C2=A0 =C2=A0 d.setVar('RDEPENDS_' + spa_metapkg, '
          '.join(spa_metapkg_rdepends))<br>
          +=C2=A0 =C2=A0 d.setVar('DESCRIPTION_' + spa_metapkg, spa_pn + '=
 meta
          package')<br>
          +<br>
          +=C2=A0 =C2=A0 d.setVar('RDEPENDS_' + pw_module_metapkg, '
          '.join(pw_module_metapkg_rdepends))<br>
          +=C2=A0 =C2=A0 d.setVar('DESCRIPTION_' + pw_module_metapkg, pw_m=
odule_pn
          + ' meta package')<br>
          +}<br>
          +<br>
          +PACKAGES =3D+ "\<br>
          +=C2=A0 =C2=A0 libpipewire \<br>
          +=C2=A0 =C2=A0 ${PN}-tools \<br>
          +=C2=A0 =C2=A0 ${PN}-pulse \<br>
          +=C2=A0 =C2=A0 ${PN}-alsa \<br>
          +=C2=A0 =C2=A0 ${PN}-jack \<br>
          +=C2=A0 =C2=A0 ${PN}-media-session \<br>
          +=C2=A0 =C2=A0 ${PN}-spa-plugins \<br>
          +=C2=A0 =C2=A0 ${PN}-spa-plugins-meta \<br>
          +=C2=A0 =C2=A0 ${PN}-spa-tools \<br>
          +=C2=A0 =C2=A0 ${PN}-modules \<br>
          +=C2=A0 =C2=A0 ${PN}-modules-meta \<br>
          +=C2=A0 =C2=A0 ${PN}-alsa-card-profile \<br>
          +=C2=A0 =C2=A0 gstreamer1.0-pipewire \<br>
          +"<br>
          +<br>
          +PACKAGES_DYNAMIC =3D "^${PN}-spa-plugins.* ^${PN}-modules.*"<br=
>
          +<br>
          +SYSTEMD_SERVICE_${PN} =3D "pipewire.service"<br>
          +CONFFILES_${PN} +=3D "${sysconfdir}/pipewire/pipewire.conf"<br>
          +FILES_${PN} =3D " \<br>
          +=C2=A0 =C2=A0 ${sysconfdir}/pipewire/pipewire.conf \<br>
          +=C2=A0 =C2=A0 ${systemd_system_unitdir}/pipewire.* \<br>
          +=C2=A0 =C2=A0 ${bindir}/pipewire \<br>
          +"<br>
          +<br>
          +FILES_${PN}-dev +=3D " \<br>
          +=C2=A0 =C2=A0 ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so \<=
br>
          +"<br>
          +<br>
          +CONFFILES_libpipewire +=3D "${sysconfdir}/pipewire/client.conf"=
<br>
          +FILES_libpipewire =3D " \<br>
          +=C2=A0 =C2=A0 ${sysconfdir}/pipewire/client.conf \<br>
          +=C2=A0 =C2=A0 ${libdir}/libpipewire-*.so.* \<br>
          +"<br>
          +# Add the bare minimum modules and plugins required to be
          able<br>
          +# to use libpipewire. Without these, it is essentially
          unusable.<br>
          +RDEPENDS_libpipewire +=3D " \<br>
          +=C2=A0 =C2=A0 ${PN}-modules-client-node \<br>
          +=C2=A0 =C2=A0 ${PN}-modules-protocol-native \<br>
          +=C2=A0 =C2=A0 ${PN}-spa-plugins-support \<br>
          +"<br>
          +<br>
          +FILES_${PN}-tools =3D " \<br>
          +=C2=A0 =C2=A0 ${bindir}/pw-* \<br>
          +"<br>
          +<br>
          +# This is a shim daemon that is intended to be used as a<br>
          +# drop-in PulseAudio replacement, providing a
          pulseaudio-compatible<br>
          +# socket that can be used by applications that use libpulse.<br=
>
          +CONFFILES_${PN}-pulse +=3D
          "${sysconfdir}/pipewire/pipewire-pulse.conf"<br>
          +FILES_${PN}-pulse =3D " \<br>
          +=C2=A0 =C2=A0 ${sysconfdir}/pipewire/pipewire-pulse.conf \<br>
          +=C2=A0 =C2=A0 ${bindir}/pipewire-pulse \<br>
          +"<br>
          +RDEPENDS_${PN}-pulse +=3D " \<br>
          +=C2=A0 =C2=A0 ${PN}-modules-protocol-pulse \<br>
          +"<br>
          +<br>
          +# alsa plugin to redirect audio to pipewire<br>
          +FILES_${PN}-alsa =3D "\<br>
          +=C2=A0 =C2=A0 ${libdir}/alsa-lib/* \<br>
          +=C2=A0 =C2=A0 ${datadir}/alsa/alsa.conf.d/* \<br>
          +"<br>
          +<br>
          +# jack drop-in libraries to redirect audio to pipewire<br>
          +CONFFILES_${PN}-jack =3D "${sysconfdir}/pipewire/jack.conf"<br>
          +FILES_${PN}-jack =3D "\<br>
          +=C2=A0 =C2=A0 ${sysconfdir}/pipewire/jack.conf \<br>
          +=C2=A0 =C2=A0 ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* =
\<br>
          +"<br>
          +<br>
          +# Example session manager. Not intended for use in
          production.<br>
          +CONFFILES_${PN}-media-session =3D
          "${sysconfdir}/pipewire/media-session.d/*"<br>
          +FILES_${PN}-media-session =3D " \<br>
          +=C2=A0 =C2=A0 ${bindir}/pipewire-media-session \<br>
          +=C2=A0 =C2=A0 ${sysconfdir}/pipewire/media-session.d/* \<br>
          +"<br>
          +RPROVIDES_${PN}-media-session =3D
          "virtual/pipewire-sessionmanager"<br>
          +<br>
          +# Dynamic packages (see set_dynamic_metapkg_rdepends).<br>
          +FILES_${PN}-spa-plugins =3D ""<br>
          +RRECOMMENDS_${PN}-spa-plugins +=3D "${PN}-spa-plugins-meta"<br>
          +<br>
          +FILES_${PN}-spa-tools =3D " \<br>
          +=C2=A0 =C2=A0 ${bindir}/spa-* \<br>
          +"<br>
          +<br>
          +# Dynamic packages (see set_dynamic_metapkg_rdepends).<br>
          +FILES_${PN}-modules =3D ""<br>
          +RRECOMMENDS_${PN}-modules +=3D "${PN}-modules-meta"<br>
          +<br>
          +CONFFILES_${PN}-modules-rtkit =3D
          "${sysconfdir}/pipewire/client-rt.conf"<br>
          +FILES_${PN}-modules-rtkit +=3D " \<br>
          +=C2=A0 =C2=A0 ${sysconfdir}/pipewire/client-rt.conf \<br>
          +=C2=A0 =C2=A0 "<br>
          +<br>
          +FILES_${PN}-alsa-card-profile =3D " \<br>
          +=C2=A0 =C2=A0 ${datadir}/alsa-card-profile/* \<br>
          +=C2=A0 =C2=A0
          ${nonarch_base_libdir}/udev/rules.d/90-pipewire-alsa.rules \<br>
          +"<br>
          +<br>
          +FILES_gstreamer1.0-pipewire =3D " \<br>
          +=C2=A0 =C2=A0 ${libdir}/gstreamer-1.0/* \<br>
          +"<br>
          -- <br>
          2.25.1<br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------CE25D5F0C69DF44865177A70--
