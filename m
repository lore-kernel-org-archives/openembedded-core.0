Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 288817FDAA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 11:54:09 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id d73so5150794wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 03:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Z8j0CO/QrTYpqwesyZrydMXE577a++KA1xq3/d5Qzw0=;
	b=rgLstFcIWfqYQ0Ik4Z+05FVfZNEK5Yo4QsAS4wypNut0Z422fPyydWABGHjFjmckzR
	UzO7iiRvEUzKWnhCjMQiv3S2dQhatCqKFnDQjsDuqRrnh5hvBi1GU4rPIT8Rt3Jj2WbN
	Vbj62Ec/Dqal8LvMfKTeG0NDc6AWTqyUPlj62zJ9SdPonaSJIgdYZ872VM45vIdpA5ol
	DTxRyDgUuhtYjyrQnLJiuZr7Ln89d5do1LfKoVR6PbErn0F1k7+RrzmuR/4mR0Zg9v0H
	JgUXRcCukjAmIsL185XbsdS4DKEWFtV87JU+ss6Dul4pO8JFY1tHR0PkAeKnBW2LBtAx
	dBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Z8j0CO/QrTYpqwesyZrydMXE577a++KA1xq3/d5Qzw0=;
	b=BK7IXGSxOQr6so9EomJxbCa0TP446g4qyFmBTBeghlAsYeHQw3qILqGWrPpzy9ABlR
	Ji1M0QEd3m7+DrlHVRYlSF8XoxDhPqT1zvBa6USv61G6Mu94wqHKIr2XmTSXJrvM5YFs
	Xq5xxbysOAIg5xDoveEJnceu4zmuO+jJCIFZuLXRCk3+8VAV55CPp1gbkgrniKMgJ6qs
	ofPjkBUll6Oo8xOVFy/EwZidS4VWVj0eKG1zuvjZXxxTcqFfdbXTmoyoae0LzXxZYXy/
	fNBnRjaBtSR4f4wIenQ8CGV9ChhEKsBlmcWDcyesRkBxcLcF+G6lHyMtvQZs9/fMh2oD
	frvA==
X-Gm-Message-State: APjAAAV6pMFN2FehupKOzlIhKD44WWYkzb/djiPfAGmVSjOab9XLELXA
	cg/YNcOHB+rqxwRLAmuwI0Imam/K
X-Google-Smtp-Source: APXvYqx7kl6K1k8jL+tt3di02VKmr1d9JZC2+W7B66R10XDFGGsgdQ5/c84e5XU51Zx+v5+B4G/RXA==
X-Received: by 2002:a1c:3dc3:: with SMTP id k186mr9240895wma.95.1576756449673; 
	Thu, 19 Dec 2019 03:54:09 -0800 (PST)
Received: from ?IPv6:2a01:598:b106:ffe1:8c7d:fd13:cdde:58e4?
	([2a01:598:b106:ffe1:8c7d:fd13:cdde:58e4])
	by smtp.gmail.com with ESMTPSA id t81sm6308326wmg.6.2019.12.19.03.54.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Dec 2019 03:54:08 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <8b734103-4339-f188-5cea-1e3d8cec6fcb@mailbox.org>
Date: Thu, 19 Dec 2019 12:54:07 +0100
Message-Id: <8F1B392E-EDDA-4F6E-ACB2-9CB112FF20BA@gmail.com>
References: <20191215124910.24946-1-crg7475@mailbox.org>
	<CANNYZj9LUKtJ9JcnyuAktOsco7_4euTVwHz2P5hrpk8Pcj8EBA@mail.gmail.com>
	<8b734103-4339-f188-5cea-1e3d8cec6fcb@mailbox.org>
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH 01/12] gstreamer: Add common .inc files for meson based recipes
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
X-List-Received-Date: Thu, 19 Dec 2019 11:54:10 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-E02F6168-02EF-4773-BA58-7394FDB08C0D
Content-Transfer-Encoding: 7bit

--Apple-Mail-E02F6168-02EF-4773-BA58-7394FDB08C0D
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I read them through now, and none of them are actually a big deal that need f=
urther discussion in my opinion. I=E2=80=99d rather get meson conversion don=
e, and handle any issues afterwards.

Alex

> On 19 Dec 2019, at 12.46, Carlos Rafael Giani <crg7475@mailbox.org> wrote:=

>=20
> First we should discuss the leftover TODOs I think. Since these may not be=
 trivial issues, it would be better to take a look at them and then decide o=
n a case-by-case basis whether to fix them now or later.
>=20
> For convenience, I copy-paste these bits from an older RFC email:
>=20
>=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Noteworthy changes:=20
>=20
> - A lot of autotools/M4 related patches are just gone. Well, obviously But=
 it is surprising just how much fewer patches there are now.=20
>=20
> - gstreamer1.0-libav no longer builds its own FFmpeg copy. This was done i=
n the past because there were no stable versioned FFmpeg releases. They do e=
xist now, so in meson based builds, gst-libav just builds the actual plugin c=
ode, meaning that the build time is much shorter, most of the recipe code (a=
nd all of the patches) are gone (because they were FFmpeg specific), and the=
 libgstlibav.so binary in /usr/lib/gstreamer-1.0/ is much smaller. This also=
 means that FFmpeg specials do not have to be added both to the FFmpeg and t=
o the gstreamer1.0-libav recipe anymore.=20
>=20
> - gstreamer1.0-plugins.inc was replaced by gstreamer1.0-plugins-common.inc=
, and gst-plugins-package.inc by gstreamer1.0-plugins-packaging.inc . These n=
ames are clearer. gst-plugins-package.inc in particular was named that way b=
ecause it used to be shared between GStreamer 0.10 and 1.0 recipes. Since th=
e former are gone by now, there's no point in keeping that name.=20
>=20
> - gstreamer1.0 ptest is now done differently. Originally, make was install=
ed on the target and the Makefile was run by the run-ptest script. Now, gstr=
eamer is patched to allow for installable tests that are accompanied by indi=
vidual shell scripts that set up the necessary environment variables, along w=
ith .test files so that the gnome-desktop-testing test runner can be used in=
 run-ptest to run the unit tests. This also makes it possible to inherit fro=
m ptest-gnome in the gstreamer1.0 recipe. The patch against gstreamer is nec=
essary because by default, one runs the test by executing "meson test". I do=
n't think installing meson along with all of the necessary meson.build scrip=
ts is a practical approach.=20
>=20
> - OpenGL packageconfigs now work quite differently in gstreamer1.0-plugins=
-base, since the meson options distinguish between OpenGL APIs, platforms, a=
nd windowing systems.=20
>=20
> - zlib in gstreamer1.0-plugins-base and -good is now required. I don't thi=
nk this is a big deal, since it is also a dependency of GLib itself, so zlib=
 has to be present on the rootfs anyway.=20
>=20
>=20
> There are some TODOs left that I want to bring up here for discussion:    =
  =20
>=20
> - The aforementioned PTest approach needs some review. Also, initially, I t=
hought I'd have to add PTest support to several GStreamer recipes, which is w=
hy I isolated the ptest code in gstreamer1.0-ptest.inc . But it turned out t=
hat only the gstreamer1.0 recipe needs it. I am unsure if I should just merg=
e that .inc into that recipe, since there's no reason why the tests from oth=
er recipes shouldn't be "ptest-ified" in the future. And then that .inc woul=
d be useful to have. (Tests from the plugin sets may be partially tough to r=
un, since some of them create X11 windows etc.)=20
>=20
> - The code in gstreamer1.0-ptest.inc sets up run-ptest in a rather uncommo=
n way, since that file has to be autogenerated.=20
>=20
> - gstreamer1.0_1.16.1.bb and gstreamer1.0-plugins-common.inc both contain a=
 "gettext_oemeson" function to set up meson NLS options. Ideally, this funct=
ionality would be part of the gettext bbclass itself. However, my bitbake/OE=
 knowledge does not suffice to do that, since with meson, you want to be abl=
e to configure what the enable/disable flags should be ("enabled"/"disabled"=
, "true"/"false" etc.); that's why for example the gtk-doc bbclass defines G=
TKDOC_MESON_OPTION, GTKDOC_MESON_ENABLE_FLAG, GTKDOC_MESON_DISABLE_FLAG. I a=
m not sure how to combine such variables with this kind of custom python cod=
e, and still allow for customized values in other recipes. In other words, i=
f I first get a "NLS_MESON_DISABLE_FLAG" value with getValue() in a modified=
 gettext_oemeson function, then I might not get the value I expect, since it=
 will get the initial value (the one set with ?=3D), not necessarily the one=
 that is redefined by a recipe.=20
>=20
> - The OpenGL packageconfigs are handled by a get_opengl_cmdline_list funct=
ion in gstreamer1.0-plugins-base_1.16.1.bb . I did this so that a comma-sepa=
rated list can be generated out of the packageconfigs that are (a) part of P=
ACKAGECONFIG and (b) part of the newly added OPENGL_APIS/OPENGL_PLATFORMS/OP=
ENGL_WINSYS lists. I do not know if there's a better approach for this. The i=
ntent is that other layers (most notably BSP layers) can add custom packagec=
onfig names to these lists. One example would be OPENGL_WINSYS +=3D "viv-fb"=
 in meta-freescale. Another would be OPENGL_WINSYS +=3D "dispmanx" in meta-r=
aspberrypi.=20
>=20
> - gstreamer1.0-python_1.16.1.bb currently has a problem in that the gst-py=
thon code tries to load /usr/lib/libpython3.7m.so. But, in a regular install=
ation, only /usr/lib/libpython3.7m.so.1.0 would be availale. It is possible t=
o adjust the libpython path & name during the build. But - what would it be a=
djusted to? How would the recipe know that "/usr/lib/libpython3.7m.so.1.0" i=
s the correct choice? Or perhaps would it make sense to add the /usr/lib/lib=
python3.7m.so symlink to the regular (as in: non-dev) Python package?
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D
>=20
>=20
>=20
>=20
>=20
>> On 18.12.19 22:14, Alexander Kanavin wrote:
>> Thanks :) Will there be a more refined version, or should these be merged=
 already, with followup fixing as needed?
>>=20
>> Alex
>>=20
>>> On Sun, 15 Dec 2019 at 13:55, Carlos Rafael Giani <crg7475@mailbox.org> w=
rote:
>>> * gstreamer1.0-plugins-common.inc
>>>   The old gstreamer1.0-plugins.inc file, adapted for meson
>>> * gstreamer1.0-plugins-packaging.inc
>>>   The old gst-plugins-package.inc file, adapted for meson
>>> * gstreamer1.0-ptest.inc
>>>   Common code for meson based PTest support; autogenerates the run-ptest=

>>>   file and is designed to use the gnome-desktop-testing suite runner
>>>   (which is why the .inc files inherits from ptest-gnome)
>>>=20
>>> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
>>> ---
>>>  .../gstreamer/gstreamer1.0-plugins-common.inc | 47 +++++++++++++
>>>  .../gstreamer1.0-plugins-packaging.inc        | 70 +++++++++++++++++++
>>>  .../gstreamer/gstreamer1.0-ptest.inc          | 21 ++++++
>>>  3 files changed, 138 insertions(+)
>>>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugi=
ns-common.inc
>>>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugi=
ns-packaging.inc
>>>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest=
.inc
>>>=20
>>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-comm=
on.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
>>> new file mode 100644
>>> index 0000000000..ccf55500a9
>>> --- /dev/null
>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
>>> @@ -0,0 +1,47 @@
>>> +# This .inc file contains the common setup for the gstreamer1.0-plugins=
-*
>>> +# plugin set recipes.
>>> +
>>> +# SUMMARY is set in the actual .bb recipes
>>> +HOMEPAGE =3D "https://gstreamer.freedesktop.org/"
>>> +BUGTRACKER =3D "https://bugzilla.gnome.org/enter_bug.cgi?product=3DGstr=
eamer"
>>> +SECTION =3D "multimedia"
>>> +
>>> +DEPENDS =3D "gstreamer1.0 glib-2.0-native"
>>> +
>>> +inherit gettext meson pkgconfig upstream-version-is-even
>>> +
>>> +require gstreamer1.0-plugins-packaging.inc
>>> +
>>> +# Orc enables runtime JIT compilation of data processing routines from O=
rc
>>> +# bytecode to SIMD instructions for various architectures (currently SS=
E, MMX,
>>> +# MIPS, Altivec and NEON are supported).
>>> +# This value is used in the PACKAGECONFIG values for each plugin set re=
cipe.
>>> +# By modifying it, Orc can be enabled/disabled in all of these recipes a=
t once.
>>> +GSTREAMER_ORC ?=3D "orc"
>>> +
>>> +PACKAGECONFIG[orc] =3D "-Dorc=3Denabled,-Dorc=3Ddisabled,orc orc-native=
"
>>> +
>>> +# TODO: put this in a gettext.bbclass patch (with variables to allow fo=
r
>>> +# configuring the option name and the enabled/disabled values).
>>> +def gettext_oemeson(d):
>>> +    if d.getVar('USE_NLS') =3D=3D 'no':
>>> +        return '-Dnls=3Ddisabled'
>>> +    # Remove the NLS bits if USE_NLS is no or INHIBIT_DEFAULT_DEPS is s=
et
>>> +    if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d, 'c=
ross-canadian'):
>>> +        return '-Dnls=3Ddisabled'
>>> +    return '-Dnls=3Denabled'
>>> +
>>> +# Not all plugin sets contain examples, so the -Dexamples
>>> +# option needs to be added conditionally.
>>> +GST_PLUGIN_SET_HAS_EXAMPLES ?=3D "1"
>>> +
>>> +EXTRA_OEMESON +=3D " \
>>> +    ${@bb.utils.contains('GST_PLUGIN_SET_HAS_EXAMPLES', '1', '-Dexample=
s=3Ddisabled', '', d)} \
>>> +    ${@gettext_oemeson(d)} \
>>> +"
>>> +
>>> +GIR_MESON_ENABLE_FLAG =3D "enabled"
>>> +GIR_MESON_DISABLE_FLAG =3D "disabled"
>>> +
>>> +# Dynamically generate packages for all enabled plugins
>>> +PACKAGES_DYNAMIC =3D "^${PN}-.*"
>>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-pack=
aging.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging=
.inc
>>> new file mode 100644
>>> index 0000000000..9a7a1b6afe
>>> --- /dev/null
>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.i=
nc
>>> @@ -0,0 +1,70 @@
>>> +# This .inc file contains functionality for automatically splitting
>>> +# built plugins into individual packages for each plugin. A -meta
>>> +# package is also set up that has no files of its own, but contains
>>> +# the names of all plugin packages in its RDEPENDS list.
>>> +#
>>> +# This is mainly used by the gstreamer1.0-plugins-* plugin set recipes,=

>>> +# but can be used in any recipe that produces GStreamer plugins.
>>> +
>>> +PACKAGESPLITFUNCS_prepend =3D " split_gstreamer10_packages "
>>> +PACKAGESPLITFUNCS_append =3D " set_gstreamer10_metapkg_rdepends "
>>> +
>>> +python split_gstreamer10_packages () {
>>> +    gst_libdir =3D d.expand('${libdir}/gstreamer-1.0')
>>> +    postinst =3D d.getVar('plugin_postinst')
>>> +    glibdir =3D d.getVar('libdir')
>>> +
>>> +    # GStreamer libraries
>>> +    do_split_packages(d, glibdir, r'^lib(.*)\.so\.*', 'lib%s', 'GStream=
er 1.0 %s library', extra_depends=3D'', allow_links=3DTrue)
>>> +    # GStreamer plugin shared objects
>>> +    do_split_packages(d, gst_libdir, r'libgst(.*)\.so$', d.expand('${PN=
}-%s'), 'GStreamer 1.0 plugin for %s', postinst=3Dpostinst, extra_depends=3D=
'')
>>> +    # GObject introspection files for GStreamer plugins
>>> +    do_split_packages(d, glibdir+'/girepository-1.0', r'Gst(.*)-1.0\.ty=
pelib$', d.expand('${PN}-%s-typelib'), 'GStreamer 1.0 typelib file for %s', p=
ostinst=3Dpostinst, extra_depends=3D'')
>>> +    # Static GStreamer libraries for development
>>> +    do_split_packages(d, gst_libdir, r'libgst(.*)\.a$', d.expand('${PN}=
-%s-staticdev'), 'GStreamer 1.0 plugin for %s (static development files)', e=
xtra_depends=3D'${PN}-staticdev')
>>> +}
>>> +
>>> +python set_gstreamer10_metapkg_rdepends () {
>>> +    import os
>>> +    import oe.utils
>>> +
>>> +    # Go through all generated packages (excluding the main package and=

>>> +    # the -meta package itself) and add them to the -meta package as RD=
EPENDS.
>>> +
>>> +    pn =3D d.getVar('PN')
>>> +    metapkg =3D  pn + '-meta'
>>> +    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
>>> +    d.setVar('FILES_' + metapkg, "")
>>> +    blacklist =3D [ pn, pn + '-meta' ]
>>> +    metapkg_rdepends =3D []
>>> +    pkgdest =3D d.getVar('PKGDEST')
>>> +    for pkg in oe.utils.packages_filter_out_system(d):
>>> +        if pkg not in blacklist and pkg not in metapkg_rdepends:
>>> +            # See if the package is empty by looking at the contents of=
 its PKGDEST subdirectory.
>>> +            # If this subdirectory is empty, then the package is.
>>> +            # Empty packages do not get added to the meta package's RDE=
PENDS
>>> +            pkgdir =3D os.path.join(pkgdest, pkg)
>>> +            if os.path.exists(pkgdir):
>>> +                dir_contents =3D os.listdir(pkgdir) or []
>>> +            else:
>>> +                dir_contents =3D []
>>> +            is_empty =3D len(dir_contents) =3D=3D 0
>>> +            if not is_empty:
>>> +                metapkg_rdepends.append(pkg)
>>> +    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
>>> +    d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
>>> +}
>>> +
>>> +# each plugin-dev depends on PN-dev, plugin-staticdev on PN-staticdev
>>> +# so we need them even when empty (like in gst-plugins-good case)
>>> +ALLOW_EMPTY_${PN} =3D "1"
>>> +ALLOW_EMPTY_${PN}-dev =3D "1"
>>> +ALLOW_EMPTY_${PN}-staticdev =3D "1"
>>> +
>>> +PACKAGES +=3D "${PN}-apps ${PN}-meta ${PN}-glib"
>>> +
>>> +FILES_${PN} =3D ""
>>> +FILES_${PN}-apps =3D "${bindir}"
>>> +FILES_${PN}-glib =3D "${datadir}/glib-2.0"
>>> +
>>> +RRECOMMENDS_${PN} +=3D "${PN}-meta"
>>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc b/=
meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
>>> new file mode 100644
>>> index 0000000000..74368c4cd8
>>> --- /dev/null
>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
>>> @@ -0,0 +1,21 @@
>>> +inherit ptest-gnome
>>> +
>>> +TEST_FILES_PATH =3D "${datadir}/installed-tests/gstreamer-1.0/test-file=
s"
>>> +RUN_PTEST_FILE =3D "${D}${PTEST_PATH}/run-ptest"
>>> +
>>> +EXTRA_OEMESON +=3D "-Dtest-files-path=3D${TEST_FILES_PATH}"
>>> +
>>> +# Using do_install_ptest_base instead of do_install_ptest, since
>>> +# the default do_install_ptest_base is hardcoded to expect Makefiles.
>>> +do_install_ptest_base() {
>>> +    # Generate run-ptest file
>>> +    echo "#!/usr/bin/env sh" > "${RUN_PTEST_FILE}"
>>> +    echo "gnome-desktop-testing-runner ${GST_TEST_SUITE_NAME}" >> "${RU=
N_PTEST_FILE}"
>>> +    chmod 0755 "${RUN_PTEST_FILE}"
>>> +
>>> +    # Install additional files required by tests
>>> +    if [ -d "${S}/tests/files" ] ; then
>>> +        install -d "${D}/${TEST_FILES_PATH}"
>>> +        install -m 0644 "${S}/tests/files"/* "${D}/${TEST_FILES_PATH}"
>>> +    fi
>>> +}
>>> --=20
>>> 2.17.1
>>>=20
>>> --=20
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--Apple-Mail-E02F6168-02EF-4773-BA58-7394FDB08C0D
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">I read them through now, and none of them a=
re actually a big deal that need further discussion in my opinion. I=E2=80=99=
d rather get meson conversion done, and handle any issues afterwards.<br><br=
><div id=3D"AppleMailSignature" dir=3D"ltr">Alex</div><div dir=3D"ltr"><br>O=
n 19 Dec 2019, at 12.46, Carlos Rafael Giani &lt;<a href=3D"mailto:crg7475@m=
ailbox.org">crg7475@mailbox.org</a>&gt; wrote:<br><br></div><blockquote type=
=3D"cite"><div dir=3D"ltr">
 =20
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"=
>
 =20
 =20
    <p>First we should discuss the leftover TODOs I think. Since these
      may not be trivial issues, it would be better to take a look at
      them and then decide on a case-by-case basis whether to fix them
      now or later.<br>
    </p>
    <p>For convenience, I copy-paste these bits from an older RFC email:</p>=

    <p><br>
    </p>
    <p>=3D=3D=3D=3D=3D=3D=3D=3D<br>
      <br>
      Noteworthy changes:
      <br>
      <br>
      - A lot of autotools/M4 related patches are just gone. Well,
      obviously <span class=3D"moz-smiley-s1" title=3D":)"></span> But it
      is surprising just how much fewer patches there are now.
      <br>
      <br>
      - gstreamer1.0-libav no longer builds its own FFmpeg copy. This
      was done in the past because there were no stable versioned FFmpeg
      releases. They do exist now, so in meson based builds, gst-libav
      just builds the actual plugin code, meaning that the build time is
      much shorter, most of the recipe code (and all of the patches) are
      gone (because they were FFmpeg specific), and the libgstlibav.so
      binary in /usr/lib/gstreamer-1.0/ is much smaller. This also means
      that FFmpeg specials do not have to be added both to the FFmpeg
      and to the gstreamer1.0-libav recipe anymore.
      <br>
      <br>
      - gstreamer1.0-plugins.inc was replaced by
      gstreamer1.0-plugins-common.inc, and gst-plugins-package.inc by
      gstreamer1.0-plugins-packaging.inc . These names are clearer.
      gst-plugins-package.inc in particular was named that way because
      it used to be shared between GStreamer 0.10 and 1.0 recipes. Since
      the former are gone by now, there's no point in keeping that name.
      <br>
      <br>
      - gstreamer1.0 ptest is now done differently. Originally, make was
      installed on the target and the Makefile was run by the run-ptest
      script. Now, gstreamer is patched to allow for installable tests
      that are accompanied by individual shell scripts that set up the
      necessary environment variables, along with .test files so that
      the gnome-desktop-testing test runner can be used in run-ptest to
      run the unit tests. This also makes it possible to inherit from
      ptest-gnome in the gstreamer1.0 recipe. The patch against
      gstreamer is necessary because by default, one runs the test by
      executing "meson test". I don't think installing meson along with
      all of the necessary meson.build scripts is a practical approach.
      <br>
      <br>
      - OpenGL packageconfigs now work quite differently in
      gstreamer1.0-plugins-base, since the meson options distinguish
      between OpenGL APIs, platforms, and windowing systems.
      <br>
      <br>
      - zlib in gstreamer1.0-plugins-base and -good is now required. I
      don't think this is a big deal, since it is also a dependency of
      GLib itself, so zlib has to be present on the rootfs anyway.
      <br>
      <br>
      <br>
      There are some TODOs left that I want to bring up here for
      discussion:
      <br>
      <br>
      - The aforementioned PTest approach needs some review. Also,
      initially, I thought I'd have to add PTest support to several
      GStreamer recipes, which is why I isolated the ptest code in
      gstreamer1.0-ptest.inc . But it turned out that only the
      gstreamer1.0 recipe needs it. I am unsure if I should just merge
      that .inc into that recipe, since there's no reason why the tests
      from other recipes shouldn't be "ptest-ified" in the future. And
      then that .inc would be useful to have. (Tests from the plugin
      sets may be partially tough to run, since some of them create X11
      windows etc.)
      <br>
      <br>
      - The code in gstreamer1.0-ptest.inc sets up run-ptest in a rather
      uncommon way, since that file has to be autogenerated.
      <br>
      <br>
      - gstreamer1.0_1.16.1.bb and gstreamer1.0-plugins-common.inc both
      contain a "gettext_oemeson" function to set up meson NLS options.
      Ideally, this functionality would be part of the gettext bbclass
      itself. However, my bitbake/OE knowledge does not suffice to do
      that, since with meson, you want to be able to configure what the
      enable/disable flags should be ("enabled"/"disabled",
      "true"/"false" etc.); that's why for example the gtk-doc bbclass
      defines GTKDOC_MESON_OPTION, GTKDOC_MESON_ENABLE_FLAG,
      GTKDOC_MESON_DISABLE_FLAG. I am not sure how to combine such
      variables with this kind of custom python code, and still allow
      for customized values in other recipes. In other words, if I first
      get a "NLS_MESON_DISABLE_FLAG" value with getValue() in a modified
      gettext_oemeson function, then I might not get the value I expect,
      since it will get the initial value (the one set with ?=3D), not
      necessarily the one that is redefined by a recipe.
      <br>
      <br>
      - The OpenGL packageconfigs are handled by a
      get_opengl_cmdline_list function in
      gstreamer1.0-plugins-base_1.16.1.bb . I did this so that a
      comma-separated list can be generated out of the packageconfigs
      that are (a) part of PACKAGECONFIG and (b) part of the newly added
      OPENGL_APIS/OPENGL_PLATFORMS/OPENGL_WINSYS lists. I do not know if
      there's a better approach for this. The intent is that other
      layers (most notably BSP layers) can add custom packageconfig
      names to these lists. One example would be OPENGL_WINSYS +=3D
      "viv-fb" in meta-freescale. Another would be OPENGL_WINSYS +=3D
      "dispmanx" in meta-raspberrypi.
      <br>
      <br>
      - gstreamer1.0-python_1.16.1.bb currently has a problem in that
      the gst-python code tries to load /usr/lib/libpython3.7m.so. But,
      in a regular installation, only /usr/lib/libpython3.7m.so.1.0
      would be availale. It is possible to adjust the libpython path
      &amp; name during the build. But - what would it be adjusted to?
      How would the recipe know that "/usr/lib/libpython3.7m.so.1.0" is
      the correct choice? Or perhaps would it make sense to add the
      /usr/lib/libpython3.7m.so symlink to the regular (as in: non-dev)
      Python package?
    </p>
    <p>=3D=3D=3D=3D=3D=3D=3D=3D<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    On 18.12.19 22:14, Alexander Kanavin wrote:<br>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj9LUKtJ9JcnyuAktOsco7_4euTVw=
Hz2P5hrpk8Pcj8EBA@mail.gmail.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-=
8">
      <div dir=3D"ltr">
        <div>Thanks :) Will there be a more refined version, or should
          these be merged already, with followup fixing as needed?</div>
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Sun, 15 Dec 2019 at 13:55,
          Carlos Rafael Giani &lt;<a href=3D"mailto:crg7475@mailbox.org" moz=
-do-not-send=3D"true">crg7475@mailbox.org</a>&gt; wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">*
          gstreamer1.0-plugins-common.inc<br>
          &nbsp; The old gstreamer1.0-plugins.inc file, adapted for meson<br=
>
          * gstreamer1.0-plugins-packaging.inc<br>
          &nbsp; The old gst-plugins-package.inc file, adapted for meson<br>=

          * gstreamer1.0-ptest.inc<br>
          &nbsp; Common code for meson based PTest support; autogenerates th=
e
          run-ptest<br>
          &nbsp; file and is designed to use the gnome-desktop-testing suite=

          runner<br>
          &nbsp; (which is why the .inc files inherits from ptest-gnome)<br>=

          <br>
          Signed-off-by: Carlos Rafael Giani &lt;<a href=3D"mailto:crg7475@m=
ailbox.org" target=3D"_blank" moz-do-not-send=3D"true">crg7475@mailbox.org</=
a>&gt;<br>
          ---<br>
          &nbsp;.../gstreamer/gstreamer1.0-plugins-common.inc | 47
          +++++++++++++<br>
          &nbsp;.../gstreamer1.0-plugins-packaging.inc&nbsp; &nbsp; &nbsp; &=
nbsp; | 70
          +++++++++++++++++++<br>
          &nbsp;.../gstreamer/gstreamer1.0-ptest.inc&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; | 21 ++++++<br>
          &nbsp;3 files changed, 138 insertions(+)<br>
          &nbsp;create mode 100644
          meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc<=
br>
          &nbsp;create mode 100644
          meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.i=
nc<br>
          &nbsp;create mode 100644
          meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc<br>
          <br>
          diff --git
          a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.in=
c
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc<br>
          new file mode 100644<br>
          index 0000000000..ccf55500a9<br>
          --- /dev/null<br>
          +++
          b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.in=
c<br>
          @@ -0,0 +1,47 @@<br>
          +# This .inc file contains the common setup for the
          gstreamer1.0-plugins-*<br>
          +# plugin set recipes.<br>
          +<br>
          +# SUMMARY is set in the actual .bb recipes<br>
          +HOMEPAGE =3D "<a href=3D"https://gstreamer.freedesktop.org/" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://gstreamer.fr=
eedesktop.org/</a>"<br>
          +BUGTRACKER =3D "<a href=3D"https://bugzilla.gnome.org/enter_bug.c=
gi?product=3DGstreamer" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=
=3D"true">https://bugzilla.gnome.org/enter_bug.cgi?product=3DGstreamer</a>"<=
br>
          +SECTION =3D "multimedia"<br>
          +<br>
          +DEPENDS =3D "gstreamer1.0 glib-2.0-native"<br>
          +<br>
          +inherit gettext meson pkgconfig upstream-version-is-even<br>
          +<br>
          +require gstreamer1.0-plugins-packaging.inc<br>
          +<br>
          +# Orc enables runtime JIT compilation of data processing
          routines from Orc<br>
          +# bytecode to SIMD instructions for various architectures
          (currently SSE, MMX,<br>
          +# MIPS, Altivec and NEON are supported).<br>
          +# This value is used in the PACKAGECONFIG values for each
          plugin set recipe.<br>
          +# By modifying it, Orc can be enabled/disabled in all of
          these recipes at once.<br>
          +GSTREAMER_ORC ?=3D "orc"<br>
          +<br>
          +PACKAGECONFIG[orc] =3D "-Dorc=3Denabled,-Dorc=3Ddisabled,orc
          orc-native"<br>
          +<br>
          +# TODO: put this in a gettext.bbclass patch (with variables
          to allow for<br>
          +# configuring the option name and the enabled/disabled
          values).<br>
          +def gettext_oemeson(d):<br>
          +&nbsp; &nbsp; if d.getVar('USE_NLS') =3D=3D 'no':<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; return '-Dnls=3Ddisabled'<br>
          +&nbsp; &nbsp; # Remove the NLS bits if USE_NLS is no or
          INHIBIT_DEFAULT_DEPS is set<br>
          +&nbsp; &nbsp; if d.getVar('INHIBIT_DEFAULT_DEPS') and not
          oe.utils.inherits(d, 'cross-canadian'):<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; return '-Dnls=3Ddisabled'<br>
          +&nbsp; &nbsp; return '-Dnls=3Denabled'<br>
          +<br>
          +# Not all plugin sets contain examples, so the -Dexamples<br>
          +# option needs to be added conditionally.<br>
          +GST_PLUGIN_SET_HAS_EXAMPLES ?=3D "1"<br>
          +<br>
          +EXTRA_OEMESON +=3D " \<br>
          +&nbsp; &nbsp; ${@bb.utils.contains('GST_PLUGIN_SET_HAS_EXAMPLES',=
 '1',
          '-Dexamples=3Ddisabled', '', d)} \<br>
          +&nbsp; &nbsp; ${@gettext_oemeson(d)} \<br>
          +"<br>
          +<br>
          +GIR_MESON_ENABLE_FLAG =3D "enabled"<br>
          +GIR_MESON_DISABLE_FLAG =3D "disabled"<br>
          +<br>
          +# Dynamically generate packages for all enabled plugins<br>
          +PACKAGES_DYNAMIC =3D "^${PN}-.*"<br>
          diff --git
          a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging=
.inc
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc<br>
          new file mode 100644<br>
          index 0000000000..9a7a1b6afe<br>
          --- /dev/null<br>
          +++
          b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging=
.inc<br>
          @@ -0,0 +1,70 @@<br>
          +# This .inc file contains functionality for automatically
          splitting<br>
          +# built plugins into individual packages for each plugin. A
          -meta<br>
          +# package is also set up that has no files of its own, but
          contains<br>
          +# the names of all plugin packages in its RDEPENDS list.<br>
          +#<br>
          +# This is mainly used by the gstreamer1.0-plugins-* plugin
          set recipes,<br>
          +# but can be used in any recipe that produces GStreamer
          plugins.<br>
          +<br>
          +PACKAGESPLITFUNCS_prepend =3D " split_gstreamer10_packages "<br>
          +PACKAGESPLITFUNCS_append =3D " set_gstreamer10_metapkg_rdepends
          "<br>
          +<br>
          +python split_gstreamer10_packages () {<br>
          +&nbsp; &nbsp; gst_libdir =3D d.expand('${libdir}/gstreamer-1.0')<=
br>
          +&nbsp; &nbsp; postinst =3D d.getVar('plugin_postinst')<br>
          +&nbsp; &nbsp; glibdir =3D d.getVar('libdir')<br>
          +<br>
          +&nbsp; &nbsp; # GStreamer libraries<br>
          +&nbsp; &nbsp; do_split_packages(d, glibdir, r'^lib(.*)\.so\.*',
          'lib%s', 'GStreamer 1.0 %s library', extra_depends=3D'',
          allow_links=3DTrue)<br>
          +&nbsp; &nbsp; # GStreamer plugin shared objects<br>
          +&nbsp; &nbsp; do_split_packages(d, gst_libdir, r'libgst(.*)\.so$'=
,
          d.expand('${PN}-%s'), 'GStreamer 1.0 plugin for %s',
          postinst=3Dpostinst, extra_depends=3D'')<br>
          +&nbsp; &nbsp; # GObject introspection files for GStreamer plugins=
<br>
          +&nbsp; &nbsp; do_split_packages(d, glibdir+'/girepository-1.0',
          r'Gst(.*)-1.0\.typelib$', d.expand('${PN}-%s-typelib'),
          'GStreamer 1.0 typelib file for %s', postinst=3Dpostinst,
          extra_depends=3D'')<br>
          +&nbsp; &nbsp; # Static GStreamer libraries for development<br>
          +&nbsp; &nbsp; do_split_packages(d, gst_libdir, r'libgst(.*)\.a$',=

          d.expand('${PN}-%s-staticdev'), 'GStreamer 1.0 plugin for %s
          (static development files)', extra_depends=3D'${PN}-staticdev')<br=
>
          +}<br>
          +<br>
          +python set_gstreamer10_metapkg_rdepends () {<br>
          +&nbsp; &nbsp; import os<br>
          +&nbsp; &nbsp; import oe.utils<br>
          +<br>
          +&nbsp; &nbsp; # Go through all generated packages (excluding the m=
ain
          package and<br>
          +&nbsp; &nbsp; # the -meta package itself) and add them to the -me=
ta
          package as RDEPENDS.<br>
          +<br>
          +&nbsp; &nbsp; pn =3D d.getVar('PN')<br>
          +&nbsp; &nbsp; metapkg =3D&nbsp; pn + '-meta'<br>
          +&nbsp; &nbsp; d.setVar('ALLOW_EMPTY_' + metapkg, "1")<br>
          +&nbsp; &nbsp; d.setVar('FILES_' + metapkg, "")<br>
          +&nbsp; &nbsp; blacklist =3D [ pn, pn + '-meta' ]<br>
          +&nbsp; &nbsp; metapkg_rdepends =3D []<br>
          +&nbsp; &nbsp; pkgdest =3D d.getVar('PKGDEST')<br>
          +&nbsp; &nbsp; for pkg in oe.utils.packages_filter_out_system(d):<=
br>
          +&nbsp; &nbsp; &nbsp; &nbsp; if pkg not in blacklist and pkg not i=
n
          metapkg_rdepends:<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # See if the package is=
 empty by looking at the
          contents of its PKGDEST subdirectory.<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # If this subdirectory i=
s empty, then the package
          is.<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # Empty packages do not=
 get added to the meta
          package's RDEPENDS<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pkgdir =3D os.path.join=
(pkgdest, pkg)<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if os.path.exists(pkgdi=
r):<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dir_conte=
nts =3D os.listdir(pkgdir) or []<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else:<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dir_conte=
nts =3D []<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; is_empty =3D len(dir_co=
ntents) =3D=3D 0<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if not is_empty:<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; metapkg_r=
depends.append(pkg)<br>
          +&nbsp; &nbsp; d.setVar('RDEPENDS_' + metapkg, '
          '.join(metapkg_rdepends))<br>
          +&nbsp; &nbsp; d.setVar('DESCRIPTION_' + metapkg, pn + ' meta pack=
age')<br>
          +}<br>
          +<br>
          +# each plugin-dev depends on PN-dev, plugin-staticdev on
          PN-staticdev<br>
          +# so we need them even when empty (like in gst-plugins-good
          case)<br>
          +ALLOW_EMPTY_${PN} =3D "1"<br>
          +ALLOW_EMPTY_${PN}-dev =3D "1"<br>
          +ALLOW_EMPTY_${PN}-staticdev =3D "1"<br>
          +<br>
          +PACKAGES +=3D "${PN}-apps ${PN}-meta ${PN}-glib"<br>
          +<br>
          +FILES_${PN} =3D ""<br>
          +FILES_${PN}-apps =3D "${bindir}"<br>
          +FILES_${PN}-glib =3D "${datadir}/glib-2.0"<br>
          +<br>
          +RRECOMMENDS_${PN} +=3D "${PN}-meta"<br>
          diff --git
          a/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
          b/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc<br>
          new file mode 100644<br>
          index 0000000000..74368c4cd8<br>
          --- /dev/null<br>
          +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc<br>=

          @@ -0,0 +1,21 @@<br>
          +inherit ptest-gnome<br>
          +<br>
          +TEST_FILES_PATH =3D
          "${datadir}/installed-tests/gstreamer-1.0/test-files"<br>
          +RUN_PTEST_FILE =3D "${D}${PTEST_PATH}/run-ptest"<br>
          +<br>
          +EXTRA_OEMESON +=3D "-Dtest-files-path=3D${TEST_FILES_PATH}"<br>
          +<br>
          +# Using do_install_ptest_base instead of do_install_ptest,
          since<br>
          +# the default do_install_ptest_base is hardcoded to expect
          Makefiles.<br>
          +do_install_ptest_base() {<br>
          +&nbsp; &nbsp; # Generate run-ptest file<br>
          +&nbsp; &nbsp; echo "#!/usr/bin/env sh" &gt; "${RUN_PTEST_FILE}"<b=
r>
          +&nbsp; &nbsp; echo "gnome-desktop-testing-runner
          ${GST_TEST_SUITE_NAME}" &gt;&gt; "${RUN_PTEST_FILE}"<br>
          +&nbsp; &nbsp; chmod 0755 "${RUN_PTEST_FILE}"<br>
          +<br>
          +&nbsp; &nbsp; # Install additional files required by tests<br>
          +&nbsp; &nbsp; if [ -d "${S}/tests/files" ] ; then<br>
          +&nbsp; &nbsp; &nbsp; &nbsp; install -d "${D}/${TEST_FILES_PATH}"<=
br>
          +&nbsp; &nbsp; &nbsp; &nbsp; install -m 0644 "${S}/tests/files"/*
          "${D}/${TEST_FILES_PATH}"<br>
          +&nbsp; &nbsp; fi<br>
          +}<br>
          -- <br>
          2.17.1<br>
          <br>
          -- <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank" moz-do-not-send=3D"true">Openembedded-core@lists.openembedded.or=
g</a><br>
          <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">htt=
p://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
    </blockquote>
 =20

</div></blockquote></body></html>=

--Apple-Mail-E02F6168-02EF-4773-BA58-7394FDB08C0D--
