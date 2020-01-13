Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0ECED7FC1F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 20:24:37 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id d18so10293970qtj.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 12:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Y2R70QDEMF6ttc4ijW32XNfZy+aMRWMbOEdZLtnXt/4=;
	b=BkeN/u5jmLMjj6DbQCEq8JqPQ0icGWVsbE+WOUbduLzvYdd/IC1Lru6wf4OpcCt+9l
	vUn6jtVzwQl4TrEgm7GB0TgTTAeImssBHd8y9MHNZCCj9QWZBxsNxUhzLjJPMLOvdiDn
	88fMe9qlP4tGQq56g0uNvdOpjCzHw8GlOsUbflFhny/DoCoE5NouKzxUmE7jnSz5/btF
	aBPnWRvxVLhChcd2+tKlXR8Iw4GLQOOpnja3HamvMyoAKaxkUIq//Njd0EZX0xR7NT9n
	NrBA0nxXvcOGEh7HmOM6wDxEQrWXbC2ZApgJlvX3FhHm83aytwzUfZTX4wxnzJd7BoG6
	4Eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Y2R70QDEMF6ttc4ijW32XNfZy+aMRWMbOEdZLtnXt/4=;
	b=VyuijryDoF+OdrZqxhi5KAbaIHG3J6hVumhKwxtBHEOv2dk5U874PyMSbtPpOEBt04
	iO52Pf47r3Bfmw0ajZnIukUS1JUKEQISC6yc9OVpCmal791q8o3LBfdPMV90A6mvM1lq
	n0YBIHZgwT2esYvh8hoWPkwL+/nkx6oKP1qiUrChdEFkALm8yc7Xk0aUJNnMdpnlLk8N
	fp9jE9w78kckYZQ52IY3B9ms951Y3SvSAeJ1h9IZ4SdrBh/DFEIYcf/8Mllz98su/lYz
	bQgNBLx+DFfzepjz781mYdsFVadqK5wTHPDnXh0ASWfP+DNwF9uXtYlxbAPwGDQJS+hr
	itnw==
X-Gm-Message-State: APjAAAUGHzz9u8bCbxLhaux1hp2Y+5MhnXGnOUvBJ33JucxTd6fzt5bx
	cgeVTA2eEtsSJ8HPRZCx17yDlP2EHfGMJQsukIc=
X-Google-Smtp-Source: APXvYqxXcH4X6u07VRs3yMk5U0HuPIgF2yCR0tpiqw8zT0b7jziUuE7hmH1QVuY8Mt1auMyr2SZlZtEN/RZd8Oq05PA=
X-Received: by 2002:ac8:544f:: with SMTP id d15mr365178qtq.53.1578947078356;
	Mon, 13 Jan 2020 12:24:38 -0800 (PST)
MIME-Version: 1.0
References: <20191215124910.24946-1-crg7475@mailbox.org>
	<CANNYZj9LUKtJ9JcnyuAktOsco7_4euTVwHz2P5hrpk8Pcj8EBA@mail.gmail.com>
	<8b734103-4339-f188-5cea-1e3d8cec6fcb@mailbox.org>
	<8F1B392E-EDDA-4F6E-ACB2-9CB112FF20BA@gmail.com>
	<5c9e71b3-5dbc-5995-c007-7bb5b04538cb@mailbox.org>
	<4928009E-991D-4801-9369-4CE2FFE53160@gmail.com>
	<99ff5473-8c51-83c6-9009-766ebf8820f4@mailbox.org>
In-Reply-To: <99ff5473-8c51-83c6-9009-766ebf8820f4@mailbox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Jan 2020 12:24:11 -0800
Message-ID: <CAMKF1sp8QE0PWC44PULAY5fhtJAys00_m-UF_KnPWBEGv4_6jA@mail.gmail.com>
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
X-List-Received-Date: Mon, 13 Jan 2020 20:24:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

there are some plugins in meta-multimedia which are erroring out

https://errors.yoctoproject.org/Errors/Build/96752/

On Wed, Jan 8, 2020 at 3:43 PM Carlos Rafael Giani <crg7475@mailbox.org> wr=
ote:
>
> Sorry, I missed this message somehow. Will do that tomorrow.
>
>
> On 02.01.20 22:47, Alexander Kanavin wrote:
>
> So can you resend the patchset, without any special tags (wip/rfc etc) pl=
ease? To give it a run on the autobuilder.
>
> Alex
>
> On 19 Dec 2019, at 12.57, Carlos Rafael Giani <crg7475@mailbox.org> wrote=
:
>
> Well, alright, then let's merge this. You do have a point in that we are =
not close to a release. Plenty of time left to fix these issues afterwards.
>
> On 19.12.19 12:54, Alexander Kanavin wrote:
>
> I read them through now, and none of them are actually a big deal that ne=
ed further discussion in my opinion. I=E2=80=99d rather get meson conversio=
n done, and handle any issues afterwards.
>
> Alex
>
> On 19 Dec 2019, at 12.46, Carlos Rafael Giani <crg7475@mailbox.org> wrote=
:
>
> First we should discuss the leftover TODOs I think. Since these may not b=
e trivial issues, it would be better to take a look at them and then decide=
 on a case-by-case basis whether to fix them now or later.
>
> For convenience, I copy-paste these bits from an older RFC email:
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D
>
> Noteworthy changes:
>
> - A lot of autotools/M4 related patches are just gone. Well, obviously Bu=
t it is surprising just how much fewer patches there are now.
>
> - gstreamer1.0-libav no longer builds its own FFmpeg copy. This was done =
in the past because there were no stable versioned FFmpeg releases. They do=
 exist now, so in meson based builds, gst-libav just builds the actual plug=
in code, meaning that the build time is much shorter, most of the recipe co=
de (and all of the patches) are gone (because they were FFmpeg specific), a=
nd the libgstlibav.so binary in /usr/lib/gstreamer-1.0/ is much smaller. Th=
is also means that FFmpeg specials do not have to be added both to the FFmp=
eg and to the gstreamer1.0-libav recipe anymore.
>
> - gstreamer1.0-plugins.inc was replaced by gstreamer1.0-plugins-common.in=
c, and gst-plugins-package.inc by gstreamer1.0-plugins-packaging.inc . Thes=
e names are clearer. gst-plugins-package.inc in particular was named that w=
ay because it used to be shared between GStreamer 0.10 and 1.0 recipes. Sin=
ce the former are gone by now, there's no point in keeping that name.
>
> - gstreamer1.0 ptest is now done differently. Originally, make was instal=
led on the target and the Makefile was run by the run-ptest script. Now, gs=
treamer is patched to allow for installable tests that are accompanied by i=
ndividual shell scripts that set up the necessary environment variables, al=
ong with .test files so that the gnome-desktop-testing test runner can be u=
sed in run-ptest to run the unit tests. This also makes it possible to inhe=
rit from ptest-gnome in the gstreamer1.0 recipe. The patch against gstreame=
r is necessary because by default, one runs the test by executing "meson te=
st". I don't think installing meson along with all of the necessary meson.b=
uild scripts is a practical approach.
>
> - OpenGL packageconfigs now work quite differently in gstreamer1.0-plugin=
s-base, since the meson options distinguish between OpenGL APIs, platforms,=
 and windowing systems.
>
> - zlib in gstreamer1.0-plugins-base and -good is now required. I don't th=
ink this is a big deal, since it is also a dependency of GLib itself, so zl=
ib has to be present on the rootfs anyway.
>
>
> There are some TODOs left that I want to bring up here for discussion:
>
> - The aforementioned PTest approach needs some review. Also, initially, I=
 thought I'd have to add PTest support to several GStreamer recipes, which =
is why I isolated the ptest code in gstreamer1.0-ptest.inc . But it turned =
out that only the gstreamer1.0 recipe needs it. I am unsure if I should jus=
t merge that .inc into that recipe, since there's no reason why the tests f=
rom other recipes shouldn't be "ptest-ified" in the future. And then that .=
inc would be useful to have. (Tests from the plugin sets may be partially t=
ough to run, since some of them create X11 windows etc.)
>
> - The code in gstreamer1.0-ptest.inc sets up run-ptest in a rather uncomm=
on way, since that file has to be autogenerated.
>
> - gstreamer1.0_1.16.1.bb and gstreamer1.0-plugins-common.inc both contain=
 a "gettext_oemeson" function to set up meson NLS options. Ideally, this fu=
nctionality would be part of the gettext bbclass itself. However, my bitbak=
e/OE knowledge does not suffice to do that, since with meson, you want to b=
e able to configure what the enable/disable flags should be ("enabled"/"dis=
abled", "true"/"false" etc.); that's why for example the gtk-doc bbclass de=
fines GTKDOC_MESON_OPTION, GTKDOC_MESON_ENABLE_FLAG, GTKDOC_MESON_DISABLE_F=
LAG. I am not sure how to combine such variables with this kind of custom p=
ython code, and still allow for customized values in other recipes. In othe=
r words, if I first get a "NLS_MESON_DISABLE_FLAG" value with getValue() in=
 a modified gettext_oemeson function, then I might not get the value I expe=
ct, since it will get the initial value (the one set with ?=3D), not necess=
arily the one that is redefined by a recipe.
>
> - The OpenGL packageconfigs are handled by a get_opengl_cmdline_list func=
tion in gstreamer1.0-plugins-base_1.16.1.bb . I did this so that a comma-se=
parated list can be generated out of the packageconfigs that are (a) part o=
f PACKAGECONFIG and (b) part of the newly added OPENGL_APIS/OPENGL_PLATFORM=
S/OPENGL_WINSYS lists. I do not know if there's a better approach for this.=
 The intent is that other layers (most notably BSP layers) can add custom p=
ackageconfig names to these lists. One example would be OPENGL_WINSYS +=3D =
"viv-fb" in meta-freescale. Another would be OPENGL_WINSYS +=3D "dispmanx" =
in meta-raspberrypi.
>
> - gstreamer1.0-python_1.16.1.bb currently has a problem in that the gst-p=
ython code tries to load /usr/lib/libpython3.7m.so. But, in a regular insta=
llation, only /usr/lib/libpython3.7m.so.1.0 would be availale. It is possib=
le to adjust the libpython path & name during the build. But - what would i=
t be adjusted to? How would the recipe know that "/usr/lib/libpython3.7m.so=
.1.0" is the correct choice? Or perhaps would it make sense to add the /usr=
/lib/libpython3.7m.so symlink to the regular (as in: non-dev) Python packag=
e?
>
> =3D=3D=3D=3D=3D=3D=3D=3D
>
>
>
> On 18.12.19 22:14, Alexander Kanavin wrote:
>
> Thanks :) Will there be a more refined version, or should these be merged=
 already, with followup fixing as needed?
>
> Alex
>
> On Sun, 15 Dec 2019 at 13:55, Carlos Rafael Giani <crg7475@mailbox.org> w=
rote:
>>
>> * gstreamer1.0-plugins-common.inc
>>   The old gstreamer1.0-plugins.inc file, adapted for meson
>> * gstreamer1.0-plugins-packaging.inc
>>   The old gst-plugins-package.inc file, adapted for meson
>> * gstreamer1.0-ptest.inc
>>   Common code for meson based PTest support; autogenerates the run-ptest
>>   file and is designed to use the gnome-desktop-testing suite runner
>>   (which is why the .inc files inherits from ptest-gnome)
>>
>> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
>> ---
>>  .../gstreamer/gstreamer1.0-plugins-common.inc | 47 +++++++++++++
>>  .../gstreamer1.0-plugins-packaging.inc        | 70 +++++++++++++++++++
>>  .../gstreamer/gstreamer1.0-ptest.inc          | 21 ++++++
>>  3 files changed, 138 insertions(+)
>>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugi=
ns-common.inc
>>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugi=
ns-packaging.inc
>>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest=
.inc
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-comm=
on.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
>> new file mode 100644
>> index 0000000000..ccf55500a9
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
>> @@ -0,0 +1,47 @@
>> +# This .inc file contains the common setup for the gstreamer1.0-plugins=
-*
>> +# plugin set recipes.
>> +
>> +# SUMMARY is set in the actual .bb recipes
>> +HOMEPAGE =3D "https://gstreamer.freedesktop.org/"
>> +BUGTRACKER =3D "https://bugzilla.gnome.org/enter_bug.cgi?product=3DGstr=
eamer"
>> +SECTION =3D "multimedia"
>> +
>> +DEPENDS =3D "gstreamer1.0 glib-2.0-native"
>> +
>> +inherit gettext meson pkgconfig upstream-version-is-even
>> +
>> +require gstreamer1.0-plugins-packaging.inc
>> +
>> +# Orc enables runtime JIT compilation of data processing routines from =
Orc
>> +# bytecode to SIMD instructions for various architectures (currently SS=
E, MMX,
>> +# MIPS, Altivec and NEON are supported).
>> +# This value is used in the PACKAGECONFIG values for each plugin set re=
cipe.
>> +# By modifying it, Orc can be enabled/disabled in all of these recipes =
at once.
>> +GSTREAMER_ORC ?=3D "orc"
>> +
>> +PACKAGECONFIG[orc] =3D "-Dorc=3Denabled,-Dorc=3Ddisabled,orc orc-native=
"
>> +
>> +# TODO: put this in a gettext.bbclass patch (with variables to allow fo=
r
>> +# configuring the option name and the enabled/disabled values).
>> +def gettext_oemeson(d):
>> +    if d.getVar('USE_NLS') =3D=3D 'no':
>> +        return '-Dnls=3Ddisabled'
>> +    # Remove the NLS bits if USE_NLS is no or INHIBIT_DEFAULT_DEPS is s=
et
>> +    if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d, 'c=
ross-canadian'):
>> +        return '-Dnls=3Ddisabled'
>> +    return '-Dnls=3Denabled'
>> +
>> +# Not all plugin sets contain examples, so the -Dexamples
>> +# option needs to be added conditionally.
>> +GST_PLUGIN_SET_HAS_EXAMPLES ?=3D "1"
>> +
>> +EXTRA_OEMESON +=3D " \
>> +    ${@bb.utils.contains('GST_PLUGIN_SET_HAS_EXAMPLES', '1', '-Dexample=
s=3Ddisabled', '', d)} \
>> +    ${@gettext_oemeson(d)} \
>> +"
>> +
>> +GIR_MESON_ENABLE_FLAG =3D "enabled"
>> +GIR_MESON_DISABLE_FLAG =3D "disabled"
>> +
>> +# Dynamically generate packages for all enabled plugins
>> +PACKAGES_DYNAMIC =3D "^${PN}-.*"
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-pack=
aging.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packagin=
g.inc
>> new file mode 100644
>> index 0000000000..9a7a1b6afe
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.i=
nc
>> @@ -0,0 +1,70 @@
>> +# This .inc file contains functionality for automatically splitting
>> +# built plugins into individual packages for each plugin. A -meta
>> +# package is also set up that has no files of its own, but contains
>> +# the names of all plugin packages in its RDEPENDS list.
>> +#
>> +# This is mainly used by the gstreamer1.0-plugins-* plugin set recipes,
>> +# but can be used in any recipe that produces GStreamer plugins.
>> +
>> +PACKAGESPLITFUNCS_prepend =3D " split_gstreamer10_packages "
>> +PACKAGESPLITFUNCS_append =3D " set_gstreamer10_metapkg_rdepends "
>> +
>> +python split_gstreamer10_packages () {
>> +    gst_libdir =3D d.expand('${libdir}/gstreamer-1.0')
>> +    postinst =3D d.getVar('plugin_postinst')
>> +    glibdir =3D d.getVar('libdir')
>> +
>> +    # GStreamer libraries
>> +    do_split_packages(d, glibdir, r'^lib(.*)\.so\.*', 'lib%s', 'GStream=
er 1.0 %s library', extra_depends=3D'', allow_links=3DTrue)
>> +    # GStreamer plugin shared objects
>> +    do_split_packages(d, gst_libdir, r'libgst(.*)\.so$', d.expand('${PN=
}-%s'), 'GStreamer 1.0 plugin for %s', postinst=3Dpostinst, extra_depends=
=3D'')
>> +    # GObject introspection files for GStreamer plugins
>> +    do_split_packages(d, glibdir+'/girepository-1.0', r'Gst(.*)-1.0\.ty=
pelib$', d.expand('${PN}-%s-typelib'), 'GStreamer 1.0 typelib file for %s',=
 postinst=3Dpostinst, extra_depends=3D'')
>> +    # Static GStreamer libraries for development
>> +    do_split_packages(d, gst_libdir, r'libgst(.*)\.a$', d.expand('${PN}=
-%s-staticdev'), 'GStreamer 1.0 plugin for %s (static development files)', =
extra_depends=3D'${PN}-staticdev')
>> +}
>> +
>> +python set_gstreamer10_metapkg_rdepends () {
>> +    import os
>> +    import oe.utils
>> +
>> +    # Go through all generated packages (excluding the main package and
>> +    # the -meta package itself) and add them to the -meta package as RD=
EPENDS.
>> +
>> +    pn =3D d.getVar('PN')
>> +    metapkg =3D  pn + '-meta'
>> +    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
>> +    d.setVar('FILES_' + metapkg, "")
>> +    blacklist =3D [ pn, pn + '-meta' ]
>> +    metapkg_rdepends =3D []
>> +    pkgdest =3D d.getVar('PKGDEST')
>> +    for pkg in oe.utils.packages_filter_out_system(d):
>> +        if pkg not in blacklist and pkg not in metapkg_rdepends:
>> +            # See if the package is empty by looking at the contents of=
 its PKGDEST subdirectory.
>> +            # If this subdirectory is empty, then the package is.
>> +            # Empty packages do not get added to the meta package's RDE=
PENDS
>> +            pkgdir =3D os.path.join(pkgdest, pkg)
>> +            if os.path.exists(pkgdir):
>> +                dir_contents =3D os.listdir(pkgdir) or []
>> +            else:
>> +                dir_contents =3D []
>> +            is_empty =3D len(dir_contents) =3D=3D 0
>> +            if not is_empty:
>> +                metapkg_rdepends.append(pkg)
>> +    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
>> +    d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
>> +}
>> +
>> +# each plugin-dev depends on PN-dev, plugin-staticdev on PN-staticdev
>> +# so we need them even when empty (like in gst-plugins-good case)
>> +ALLOW_EMPTY_${PN} =3D "1"
>> +ALLOW_EMPTY_${PN}-dev =3D "1"
>> +ALLOW_EMPTY_${PN}-staticdev =3D "1"
>> +
>> +PACKAGES +=3D "${PN}-apps ${PN}-meta ${PN}-glib"
>> +
>> +FILES_${PN} =3D ""
>> +FILES_${PN}-apps =3D "${bindir}"
>> +FILES_${PN}-glib =3D "${datadir}/glib-2.0"
>> +
>> +RRECOMMENDS_${PN} +=3D "${PN}-meta"
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc b/=
meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
>> new file mode 100644
>> index 0000000000..74368c4cd8
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
>> @@ -0,0 +1,21 @@
>> +inherit ptest-gnome
>> +
>> +TEST_FILES_PATH =3D "${datadir}/installed-tests/gstreamer-1.0/test-file=
s"
>> +RUN_PTEST_FILE =3D "${D}${PTEST_PATH}/run-ptest"
>> +
>> +EXTRA_OEMESON +=3D "-Dtest-files-path=3D${TEST_FILES_PATH}"
>> +
>> +# Using do_install_ptest_base instead of do_install_ptest, since
>> +# the default do_install_ptest_base is hardcoded to expect Makefiles.
>> +do_install_ptest_base() {
>> +    # Generate run-ptest file
>> +    echo "#!/usr/bin/env sh" > "${RUN_PTEST_FILE}"
>> +    echo "gnome-desktop-testing-runner ${GST_TEST_SUITE_NAME}" >> "${RU=
N_PTEST_FILE}"
>> +    chmod 0755 "${RUN_PTEST_FILE}"
>> +
>> +    # Install additional files required by tests
>> +    if [ -d "${S}/tests/files" ] ; then
>> +        install -d "${D}/${TEST_FILES_PATH}"
>> +        install -m 0644 "${S}/tests/files"/* "${D}/${TEST_FILES_PATH}"
>> +    fi
>> +}
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

