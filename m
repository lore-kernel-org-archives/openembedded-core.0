Return-Path: <crg7475@mailbox.org>
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	by mail.openembedded.org (Postfix) with ESMTP id E8B6D7F98F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 11:57:08 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 47dr2s2BJ9zQl8v;
	Thu, 19 Dec 2019 12:57:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-type:content-type:in-reply-to
	:mime-version:date:date:message-id:from:from:references:subject
	:subject:received; s=mail20150812; t=1576756625; bh=SKGn52KIMJyG
	nOiVltN6mPOeABnlwpYXDeReffc39Iw=; b=EYsV8zrZHSVX4bEy4HbdVNqVIr5l
	oGL6GbaKipr5BEnyWkRgjCTWBSj2WAGQAGLzAYJGV9RJPyNgoB6MhxcGJr2NetvY
	ddZtCl0suyHipP8m91Oxzj0Y9fyxOuroxyR+8vnGtii2MLYCozm8ppGzk8TEoyrp
	stDOX4TO7nTEvSc0jQlvmgL63R+izIMy//vIoQ0f6r2C8bdLmUMNudytHoCgFufG
	NzYtKkWhAKqNfcOy1MBuMo1EvhxhWzBqXNSszmPiZQyrK/XPBz35xOwG50uLQa1S
	UCU0BQOZQhD51bg2fgigIqhl707d3IvDNQfxhJIbcxPU5+W8Lj4kpHUSow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1576756627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=Juh3SbaepThDhgs4Vh5UPA4AvyqPSorQiyWL0ABKc6E=;
	b=fqPNaHkl1n4FTww3OVFYm81vDr56UTM9km1EmoPlxhe6BPK6830spCBVew7UgBGTjHIgvD
	BQ4mwJ6jem9AzVDQYBm/l6FiG72GWA992KWjUYTT+HBb4OcNA7tWlyoAoqgudlu+1ltGNk
	YSLaB9xMlsl3hisohhHQiFCbf+rV0+yB/4yJmPCdos0aqF/ccZKBqnxTZ/dxSIvq6k4+jI
	TwJ66T/k+NqO5nJXCxJoFuObJJX1GHheKgVZvJ4m1RzQVKHRdaqkBlu+iLjRFjSHlP5VDy
	RCxIzPv+pWEmWSrM8e3crle5lwjHN8Ok1PRMqk2ef+BckFYhd2YG/bZOO1WEAg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
	[80.241.56.122]) (amavisd-new, port 10030)
	with ESMTP id tNjTF_4qhrwi; Thu, 19 Dec 2019 12:57:05 +0100 (CET)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20191215124910.24946-1-crg7475@mailbox.org>
	<CANNYZj9LUKtJ9JcnyuAktOsco7_4euTVwHz2P5hrpk8Pcj8EBA@mail.gmail.com>
	<8b734103-4339-f188-5cea-1e3d8cec6fcb@mailbox.org>
	<8F1B392E-EDDA-4F6E-ACB2-9CB112FF20BA@gmail.com>
From: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <5c9e71b3-5dbc-5995-c007-7bb5b04538cb@mailbox.org>
Date: Thu, 19 Dec 2019 12:57:04 +0100
MIME-Version: 1.0
In-Reply-To: <8F1B392E-EDDA-4F6E-ACB2-9CB112FF20BA@gmail.com>
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
X-List-Received-Date: Thu, 19 Dec 2019 11:57:09 -0000
Content-Type: multipart/alternative;
	boundary="------------1F486660929682204B3EA4E3"
Content-Language: en-US

--------------1F486660929682204B3EA4E3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Well, alright, then let's merge this. You do have a point in that we are 
not close to a release. Plenty of time left to fix these issues afterwards.

On 19.12.19 12:54, Alexander Kanavin wrote:
> I read them through now, and none of them are actually a big deal that 
> need further discussion in my opinion. I’d rather get meson conversion 
> done, and handle any issues afterwards.
>
> Alex
>
> On 19 Dec 2019, at 12.46, Carlos Rafael Giani <crg7475@mailbox.org 
> <mailto:crg7475@mailbox.org>> wrote:
>
>> First we should discuss the leftover TODOs I think. Since these may 
>> not be trivial issues, it would be better to take a look at them and 
>> then decide on a case-by-case basis whether to fix them now or later.
>>
>> For convenience, I copy-paste these bits from an older RFC email:
>>
>>
>> ========
>>
>> Noteworthy changes:
>>
>> - A lot of autotools/M4 related patches are just gone. Well, 
>> obviously But it is surprising just how much fewer patches there are 
>> now.
>>
>> - gstreamer1.0-libav no longer builds its own FFmpeg copy. This was 
>> done in the past because there were no stable versioned FFmpeg 
>> releases. They do exist now, so in meson based builds, gst-libav just 
>> builds the actual plugin code, meaning that the build time is much 
>> shorter, most of the recipe code (and all of the patches) are gone 
>> (because they were FFmpeg specific), and the libgstlibav.so binary in 
>> /usr/lib/gstreamer-1.0/ is much smaller. This also means that FFmpeg 
>> specials do not have to be added both to the FFmpeg and to the 
>> gstreamer1.0-libav recipe anymore.
>>
>> - gstreamer1.0-plugins.inc was replaced by 
>> gstreamer1.0-plugins-common.inc, and gst-plugins-package.inc by 
>> gstreamer1.0-plugins-packaging.inc . These names are clearer. 
>> gst-plugins-package.inc in particular was named that way because it 
>> used to be shared between GStreamer 0.10 and 1.0 recipes. Since the 
>> former are gone by now, there's no point in keeping that name.
>>
>> - gstreamer1.0 ptest is now done differently. Originally, make was 
>> installed on the target and the Makefile was run by the run-ptest 
>> script. Now, gstreamer is patched to allow for installable tests that 
>> are accompanied by individual shell scripts that set up the necessary 
>> environment variables, along with .test files so that the 
>> gnome-desktop-testing test runner can be used in run-ptest to run the 
>> unit tests. This also makes it possible to inherit from ptest-gnome 
>> in the gstreamer1.0 recipe. The patch against gstreamer is necessary 
>> because by default, one runs the test by executing "meson test". I 
>> don't think installing meson along with all of the necessary 
>> meson.build scripts is a practical approach.
>>
>> - OpenGL packageconfigs now work quite differently in 
>> gstreamer1.0-plugins-base, since the meson options distinguish 
>> between OpenGL APIs, platforms, and windowing systems.
>>
>> - zlib in gstreamer1.0-plugins-base and -good is now required. I 
>> don't think this is a big deal, since it is also a dependency of GLib 
>> itself, so zlib has to be present on the rootfs anyway.
>>
>>
>> There are some TODOs left that I want to bring up here for discussion:
>>
>> - The aforementioned PTest approach needs some review. Also, 
>> initially, I thought I'd have to add PTest support to several 
>> GStreamer recipes, which is why I isolated the ptest code in 
>> gstreamer1.0-ptest.inc . But it turned out that only the gstreamer1.0 
>> recipe needs it. I am unsure if I should just merge that .inc into 
>> that recipe, since there's no reason why the tests from other recipes 
>> shouldn't be "ptest-ified" in the future. And then that .inc would be 
>> useful to have. (Tests from the plugin sets may be partially tough to 
>> run, since some of them create X11 windows etc.)
>>
>> - The code in gstreamer1.0-ptest.inc sets up run-ptest in a rather 
>> uncommon way, since that file has to be autogenerated.
>>
>> - gstreamer1.0_1.16.1.bb and gstreamer1.0-plugins-common.inc both 
>> contain a "gettext_oemeson" function to set up meson NLS options. 
>> Ideally, this functionality would be part of the gettext bbclass 
>> itself. However, my bitbake/OE knowledge does not suffice to do that, 
>> since with meson, you want to be able to configure what the 
>> enable/disable flags should be ("enabled"/"disabled", "true"/"false" 
>> etc.); that's why for example the gtk-doc bbclass defines 
>> GTKDOC_MESON_OPTION, GTKDOC_MESON_ENABLE_FLAG, 
>> GTKDOC_MESON_DISABLE_FLAG. I am not sure how to combine such 
>> variables with this kind of custom python code, and still allow for 
>> customized values in other recipes. In other words, if I first get a 
>> "NLS_MESON_DISABLE_FLAG" value with getValue() in a modified 
>> gettext_oemeson function, then I might not get the value I expect, 
>> since it will get the initial value (the one set with ?=), not 
>> necessarily the one that is redefined by a recipe.
>>
>> - The OpenGL packageconfigs are handled by a get_opengl_cmdline_list 
>> function in gstreamer1.0-plugins-base_1.16.1.bb . I did this so that 
>> a comma-separated list can be generated out of the packageconfigs 
>> that are (a) part of PACKAGECONFIG and (b) part of the newly added 
>> OPENGL_APIS/OPENGL_PLATFORMS/OPENGL_WINSYS lists. I do not know if 
>> there's a better approach for this. The intent is that other layers 
>> (most notably BSP layers) can add custom packageconfig names to these 
>> lists. One example would be OPENGL_WINSYS += "viv-fb" in 
>> meta-freescale. Another would be OPENGL_WINSYS += "dispmanx" in 
>> meta-raspberrypi.
>>
>> - gstreamer1.0-python_1.16.1.bb currently has a problem in that the 
>> gst-python code tries to load /usr/lib/libpython3.7m.so. But, in a 
>> regular installation, only /usr/lib/libpython3.7m.so.1.0 would be 
>> availale. It is possible to adjust the libpython path & name during 
>> the build. But - what would it be adjusted to? How would the recipe 
>> know that "/usr/lib/libpython3.7m.so.1.0" is the correct choice? Or 
>> perhaps would it make sense to add the /usr/lib/libpython3.7m.so 
>> symlink to the regular (as in: non-dev) Python package?
>>
>> ========
>>
>>
>>
>> On 18.12.19 22:14, Alexander Kanavin wrote:
>>> Thanks :) Will there be a more refined version, or should these be 
>>> merged already, with followup fixing as needed?
>>>
>>> Alex
>>>
>>> On Sun, 15 Dec 2019 at 13:55, Carlos Rafael Giani 
>>> <crg7475@mailbox.org <mailto:crg7475@mailbox.org>> wrote:
>>>
>>>     * gstreamer1.0-plugins-common.inc
>>>       The old gstreamer1.0-plugins.inc file, adapted for meson
>>>     * gstreamer1.0-plugins-packaging.inc
>>>       The old gst-plugins-package.inc file, adapted for meson
>>>     * gstreamer1.0-ptest.inc
>>>       Common code for meson based PTest support; autogenerates the
>>>     run-ptest
>>>       file and is designed to use the gnome-desktop-testing suite runner
>>>       (which is why the .inc files inherits from ptest-gnome)
>>>
>>>     Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org
>>>     <mailto:crg7475@mailbox.org>>
>>>     ---
>>>      .../gstreamer/gstreamer1.0-plugins-common.inc | 47 +++++++++++++
>>>      .../gstreamer1.0-plugins-packaging.inc        | 70
>>>     +++++++++++++++++++
>>>      .../gstreamer/gstreamer1.0-ptest.inc          | 21 ++++++
>>>      3 files changed, 138 insertions(+)
>>>      create mode 100644
>>>     meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
>>>      create mode 100644
>>>     meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
>>>      create mode 100644
>>>     meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
>>>
>>>     diff --git
>>>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
>>>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
>>>     new file mode 100644
>>>     index 0000000000..ccf55500a9
>>>     --- /dev/null
>>>     +++
>>>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
>>>     @@ -0,0 +1,47 @@
>>>     +# This .inc file contains the common setup for the
>>>     gstreamer1.0-plugins-*
>>>     +# plugin set recipes.
>>>     +
>>>     +# SUMMARY is set in the actual .bb recipes
>>>     +HOMEPAGE = "https://gstreamer.freedesktop.org/"
>>>     +BUGTRACKER =
>>>     "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
>>>     +SECTION = "multimedia"
>>>     +
>>>     +DEPENDS = "gstreamer1.0 glib-2.0-native"
>>>     +
>>>     +inherit gettext meson pkgconfig upstream-version-is-even
>>>     +
>>>     +require gstreamer1.0-plugins-packaging.inc
>>>     +
>>>     +# Orc enables runtime JIT compilation of data processing
>>>     routines from Orc
>>>     +# bytecode to SIMD instructions for various architectures
>>>     (currently SSE, MMX,
>>>     +# MIPS, Altivec and NEON are supported).
>>>     +# This value is used in the PACKAGECONFIG values for each
>>>     plugin set recipe.
>>>     +# By modifying it, Orc can be enabled/disabled in all of these
>>>     recipes at once.
>>>     +GSTREAMER_ORC ?= "orc"
>>>     +
>>>     +PACKAGECONFIG[orc] = "-Dorc=enabled,-Dorc=disabled,orc orc-native"
>>>     +
>>>     +# TODO: put this in a gettext.bbclass patch (with variables to
>>>     allow for
>>>     +# configuring the option name and the enabled/disabled values).
>>>     +def gettext_oemeson(d):
>>>     +    if d.getVar('USE_NLS') == 'no':
>>>     +        return '-Dnls=disabled'
>>>     +    # Remove the NLS bits if USE_NLS is no or
>>>     INHIBIT_DEFAULT_DEPS is set
>>>     +    if d.getVar('INHIBIT_DEFAULT_DEPS') and not
>>>     oe.utils.inherits(d, 'cross-canadian'):
>>>     +        return '-Dnls=disabled'
>>>     +    return '-Dnls=enabled'
>>>     +
>>>     +# Not all plugin sets contain examples, so the -Dexamples
>>>     +# option needs to be added conditionally.
>>>     +GST_PLUGIN_SET_HAS_EXAMPLES ?= "1"
>>>     +
>>>     +EXTRA_OEMESON += " \
>>>     +    ${@bb.utils.contains('GST_PLUGIN_SET_HAS_EXAMPLES', '1',
>>>     '-Dexamples=disabled', '', d)} \
>>>     +    ${@gettext_oemeson(d)} \
>>>     +"
>>>     +
>>>     +GIR_MESON_ENABLE_FLAG = "enabled"
>>>     +GIR_MESON_DISABLE_FLAG = "disabled"
>>>     +
>>>     +# Dynamically generate packages for all enabled plugins
>>>     +PACKAGES_DYNAMIC = "^${PN}-.*"
>>>     diff --git
>>>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
>>>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
>>>     new file mode 100644
>>>     index 0000000000..9a7a1b6afe
>>>     --- /dev/null
>>>     +++
>>>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
>>>     @@ -0,0 +1,70 @@
>>>     +# This .inc file contains functionality for automatically splitting
>>>     +# built plugins into individual packages for each plugin. A -meta
>>>     +# package is also set up that has no files of its own, but contains
>>>     +# the names of all plugin packages in its RDEPENDS list.
>>>     +#
>>>     +# This is mainly used by the gstreamer1.0-plugins-* plugin set
>>>     recipes,
>>>     +# but can be used in any recipe that produces GStreamer plugins.
>>>     +
>>>     +PACKAGESPLITFUNCS_prepend = " split_gstreamer10_packages "
>>>     +PACKAGESPLITFUNCS_append = " set_gstreamer10_metapkg_rdepends "
>>>     +
>>>     +python split_gstreamer10_packages () {
>>>     +    gst_libdir = d.expand('${libdir}/gstreamer-1.0')
>>>     +    postinst = d.getVar('plugin_postinst')
>>>     +    glibdir = d.getVar('libdir')
>>>     +
>>>     +    # GStreamer libraries
>>>     +    do_split_packages(d, glibdir, r'^lib(.*)\.so\.*', 'lib%s',
>>>     'GStreamer 1.0 %s library', extra_depends='', allow_links=True)
>>>     +    # GStreamer plugin shared objects
>>>     +    do_split_packages(d, gst_libdir, r'libgst(.*)\.so$',
>>>     d.expand('${PN}-%s'), 'GStreamer 1.0 plugin for %s',
>>>     postinst=postinst, extra_depends='')
>>>     +    # GObject introspection files for GStreamer plugins
>>>     +    do_split_packages(d, glibdir+'/girepository-1.0',
>>>     r'Gst(.*)-1.0\.typelib$', d.expand('${PN}-%s-typelib'),
>>>     'GStreamer 1.0 typelib file for %s', postinst=postinst,
>>>     extra_depends='')
>>>     +    # Static GStreamer libraries for development
>>>     +    do_split_packages(d, gst_libdir, r'libgst(.*)\.a$',
>>>     d.expand('${PN}-%s-staticdev'), 'GStreamer 1.0 plugin for %s
>>>     (static development files)', extra_depends='${PN}-staticdev')
>>>     +}
>>>     +
>>>     +python set_gstreamer10_metapkg_rdepends () {
>>>     +    import os
>>>     +    import oe.utils
>>>     +
>>>     +    # Go through all generated packages (excluding the main
>>>     package and
>>>     +    # the -meta package itself) and add them to the -meta
>>>     package as RDEPENDS.
>>>     +
>>>     +    pn = d.getVar('PN')
>>>     +    metapkg =  pn + '-meta'
>>>     +    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
>>>     +    d.setVar('FILES_' + metapkg, "")
>>>     +    blacklist = [ pn, pn + '-meta' ]
>>>     +    metapkg_rdepends = []
>>>     +    pkgdest = d.getVar('PKGDEST')
>>>     +    for pkg in oe.utils.packages_filter_out_system(d):
>>>     +        if pkg not in blacklist and pkg not in metapkg_rdepends:
>>>     +            # See if the package is empty by looking at the
>>>     contents of its PKGDEST subdirectory.
>>>     +            # If this subdirectory is empty, then the package is.
>>>     +            # Empty packages do not get added to the meta
>>>     package's RDEPENDS
>>>     +            pkgdir = os.path.join(pkgdest, pkg)
>>>     +            if os.path.exists(pkgdir):
>>>     +                dir_contents = os.listdir(pkgdir) or []
>>>     +            else:
>>>     +                dir_contents = []
>>>     +            is_empty = len(dir_contents) == 0
>>>     +            if not is_empty:
>>>     +                metapkg_rdepends.append(pkg)
>>>     +    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
>>>     +    d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
>>>     +}
>>>     +
>>>     +# each plugin-dev depends on PN-dev, plugin-staticdev on
>>>     PN-staticdev
>>>     +# so we need them even when empty (like in gst-plugins-good case)
>>>     +ALLOW_EMPTY_${PN} = "1"
>>>     +ALLOW_EMPTY_${PN}-dev = "1"
>>>     +ALLOW_EMPTY_${PN}-staticdev = "1"
>>>     +
>>>     +PACKAGES += "${PN}-apps ${PN}-meta ${PN}-glib"
>>>     +
>>>     +FILES_${PN} = ""
>>>     +FILES_${PN}-apps = "${bindir}"
>>>     +FILES_${PN}-glib = "${datadir}/glib-2.0"
>>>     +
>>>     +RRECOMMENDS_${PN} += "${PN}-meta"
>>>     diff --git
>>>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
>>>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
>>>     new file mode 100644
>>>     index 0000000000..74368c4cd8
>>>     --- /dev/null
>>>     +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
>>>     @@ -0,0 +1,21 @@
>>>     +inherit ptest-gnome
>>>     +
>>>     +TEST_FILES_PATH =
>>>     "${datadir}/installed-tests/gstreamer-1.0/test-files"
>>>     +RUN_PTEST_FILE = "${D}${PTEST_PATH}/run-ptest"
>>>     +
>>>     +EXTRA_OEMESON += "-Dtest-files-path=${TEST_FILES_PATH}"
>>>     +
>>>     +# Using do_install_ptest_base instead of do_install_ptest, since
>>>     +# the default do_install_ptest_base is hardcoded to expect
>>>     Makefiles.
>>>     +do_install_ptest_base() {
>>>     +    # Generate run-ptest file
>>>     +    echo "#!/usr/bin/env sh" > "${RUN_PTEST_FILE}"
>>>     +    echo "gnome-desktop-testing-runner ${GST_TEST_SUITE_NAME}"
>>>     >> "${RUN_PTEST_FILE}"
>>>     +    chmod 0755 "${RUN_PTEST_FILE}"
>>>     +
>>>     +    # Install additional files required by tests
>>>     +    if [ -d "${S}/tests/files" ] ; then
>>>     +        install -d "${D}/${TEST_FILES_PATH}"
>>>     +        install -m 0644 "${S}/tests/files"/*
>>>     "${D}/${TEST_FILES_PATH}"
>>>     +    fi
>>>     +}
>>>     -- 
>>>     2.17.1
>>>
>>>     -- 
>>>     _______________________________________________
>>>     Openembedded-core mailing list
>>>     Openembedded-core@lists.openembedded.org
>>>     <mailto:Openembedded-core@lists.openembedded.org>
>>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>

--------------1F486660929682204B3EA4E3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Well, alright, then let's merge this. You do have a point in that
      we are not close to a release. Plenty of time left to fix these
      issues afterwards.<br>
    </p>
    <div class="moz-cite-prefix">On 19.12.19 12:54, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8F1B392E-EDDA-4F6E-ACB2-9CB112FF20BA@gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      I read them through now, and none of them are actually a big deal
      that need further discussion in my opinion. I’d rather get meson
      conversion done, and handle any issues afterwards.<br>
      <br>
      <div id="AppleMailSignature" dir="ltr">Alex</div>
      <div dir="ltr"><br>
        On 19 Dec 2019, at 12.46, Carlos Rafael Giani &lt;<a
          href="mailto:crg7475@mailbox.org" moz-do-not-send="true">crg7475@mailbox.org</a>&gt;
        wrote:<br>
        <br>
      </div>
      <blockquote type="cite">
        <div dir="ltr">
          <meta http-equiv="Content-Type" content="text/html;
            charset=UTF-8">
          <p>First we should discuss the leftover TODOs I think. Since
            these may not be trivial issues, it would be better to take
            a look at them and then decide on a case-by-case basis
            whether to fix them now or later.<br>
          </p>
          <p>For convenience, I copy-paste these bits from an older RFC
            email:</p>
          <p><br>
          </p>
          <p>========<br>
            <br>
            Noteworthy changes: <br>
            <br>
            - A lot of autotools/M4 related patches are just gone. Well,
            obviously <span class="moz-smiley-s1" title=":)"></span>
            But it is surprising just how much fewer patches there are
            now. <br>
            <br>
            - gstreamer1.0-libav no longer builds its own FFmpeg copy.
            This was done in the past because there were no stable
            versioned FFmpeg releases. They do exist now, so in meson
            based builds, gst-libav just builds the actual plugin code,
            meaning that the build time is much shorter, most of the
            recipe code (and all of the patches) are gone (because they
            were FFmpeg specific), and the libgstlibav.so binary in
            /usr/lib/gstreamer-1.0/ is much smaller. This also means
            that FFmpeg specials do not have to be added both to the
            FFmpeg and to the gstreamer1.0-libav recipe anymore. <br>
            <br>
            - gstreamer1.0-plugins.inc was replaced by
            gstreamer1.0-plugins-common.inc, and gst-plugins-package.inc
            by gstreamer1.0-plugins-packaging.inc . These names are
            clearer. gst-plugins-package.inc in particular was named
            that way because it used to be shared between GStreamer 0.10
            and 1.0 recipes. Since the former are gone by now, there's
            no point in keeping that name. <br>
            <br>
            - gstreamer1.0 ptest is now done differently. Originally,
            make was installed on the target and the Makefile was run by
            the run-ptest script. Now, gstreamer is patched to allow for
            installable tests that are accompanied by individual shell
            scripts that set up the necessary environment variables,
            along with .test files so that the gnome-desktop-testing
            test runner can be used in run-ptest to run the unit tests.
            This also makes it possible to inherit from ptest-gnome in
            the gstreamer1.0 recipe. The patch against gstreamer is
            necessary because by default, one runs the test by executing
            "meson test". I don't think installing meson along with all
            of the necessary meson.build scripts is a practical
            approach. <br>
            <br>
            - OpenGL packageconfigs now work quite differently in
            gstreamer1.0-plugins-base, since the meson options
            distinguish between OpenGL APIs, platforms, and windowing
            systems. <br>
            <br>
            - zlib in gstreamer1.0-plugins-base and -good is now
            required. I don't think this is a big deal, since it is also
            a dependency of GLib itself, so zlib has to be present on
            the rootfs anyway. <br>
            <br>
            <br>
            There are some TODOs left that I want to bring up here for
            discussion: <br>
            <br>
            - The aforementioned PTest approach needs some review. Also,
            initially, I thought I'd have to add PTest support to
            several GStreamer recipes, which is why I isolated the ptest
            code in gstreamer1.0-ptest.inc . But it turned out that only
            the gstreamer1.0 recipe needs it. I am unsure if I should
            just merge that .inc into that recipe, since there's no
            reason why the tests from other recipes shouldn't be
            "ptest-ified" in the future. And then that .inc would be
            useful to have. (Tests from the plugin sets may be partially
            tough to run, since some of them create X11 windows etc.) <br>
            <br>
            - The code in gstreamer1.0-ptest.inc sets up run-ptest in a
            rather uncommon way, since that file has to be
            autogenerated. <br>
            <br>
            - gstreamer1.0_1.16.1.bb and gstreamer1.0-plugins-common.inc
            both contain a "gettext_oemeson" function to set up meson
            NLS options. Ideally, this functionality would be part of
            the gettext bbclass itself. However, my bitbake/OE knowledge
            does not suffice to do that, since with meson, you want to
            be able to configure what the enable/disable flags should be
            ("enabled"/"disabled", "true"/"false" etc.); that's why for
            example the gtk-doc bbclass defines GTKDOC_MESON_OPTION,
            GTKDOC_MESON_ENABLE_FLAG, GTKDOC_MESON_DISABLE_FLAG. I am
            not sure how to combine such variables with this kind of
            custom python code, and still allow for customized values in
            other recipes. In other words, if I first get a
            "NLS_MESON_DISABLE_FLAG" value with getValue() in a modified
            gettext_oemeson function, then I might not get the value I
            expect, since it will get the initial value (the one set
            with ?=), not necessarily the one that is redefined by a
            recipe. <br>
            <br>
            - The OpenGL packageconfigs are handled by a
            get_opengl_cmdline_list function in
            gstreamer1.0-plugins-base_1.16.1.bb . I did this so that a
            comma-separated list can be generated out of the
            packageconfigs that are (a) part of PACKAGECONFIG and (b)
            part of the newly added
            OPENGL_APIS/OPENGL_PLATFORMS/OPENGL_WINSYS lists. I do not
            know if there's a better approach for this. The intent is
            that other layers (most notably BSP layers) can add custom
            packageconfig names to these lists. One example would be
            OPENGL_WINSYS += "viv-fb" in meta-freescale. Another would
            be OPENGL_WINSYS += "dispmanx" in meta-raspberrypi. <br>
            <br>
            - gstreamer1.0-python_1.16.1.bb currently has a problem in
            that the gst-python code tries to load
            /usr/lib/libpython3.7m.so. But, in a regular installation,
            only /usr/lib/libpython3.7m.so.1.0 would be availale. It is
            possible to adjust the libpython path &amp; name during the
            build. But - what would it be adjusted to? How would the
            recipe know that "/usr/lib/libpython3.7m.so.1.0" is the
            correct choice? Or perhaps would it make sense to add the
            /usr/lib/libpython3.7m.so symlink to the regular (as in:
            non-dev) Python package? </p>
          <p>========<br>
          </p>
          <p><br>
          </p>
          <p><br>
          </p>
          On 18.12.19 22:14, Alexander Kanavin wrote:<br>
          <blockquote type="cite"
cite="mid:CANNYZj9LUKtJ9JcnyuAktOsco7_4euTVwHz2P5hrpk8Pcj8EBA@mail.gmail.com">
            <meta http-equiv="content-type" content="text/html;
              charset=UTF-8">
            <div dir="ltr">
              <div>Thanks :) Will there be a more refined version, or
                should these be merged already, with followup fixing as
                needed?</div>
              <div><br>
              </div>
              <div>Alex<br>
              </div>
            </div>
            <br>
            <div class="gmail_quote">
              <div dir="ltr" class="gmail_attr">On Sun, 15 Dec 2019 at
                13:55, Carlos Rafael Giani &lt;<a
                  href="mailto:crg7475@mailbox.org"
                  moz-do-not-send="true">crg7475@mailbox.org</a>&gt;
                wrote:<br>
              </div>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">*
                gstreamer1.0-plugins-common.inc<br>
                  The old gstreamer1.0-plugins.inc file, adapted for
                meson<br>
                * gstreamer1.0-plugins-packaging.inc<br>
                  The old gst-plugins-package.inc file, adapted for
                meson<br>
                * gstreamer1.0-ptest.inc<br>
                  Common code for meson based PTest support;
                autogenerates the run-ptest<br>
                  file and is designed to use the gnome-desktop-testing
                suite runner<br>
                  (which is why the .inc files inherits from
                ptest-gnome)<br>
                <br>
                Signed-off-by: Carlos Rafael Giani &lt;<a
                  href="mailto:crg7475@mailbox.org" target="_blank"
                  moz-do-not-send="true">crg7475@mailbox.org</a>&gt;<br>
                ---<br>
                 .../gstreamer/gstreamer1.0-plugins-common.inc | 47
                +++++++++++++<br>
                 .../gstreamer1.0-plugins-packaging.inc        | 70
                +++++++++++++++++++<br>
                 .../gstreamer/gstreamer1.0-ptest.inc          | 21
                ++++++<br>
                 3 files changed, 138 insertions(+)<br>
                 create mode 100644
                meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc<br>
                 create mode 100644
                meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc<br>
                 create mode 100644
                meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc<br>
                <br>
                diff --git
                a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc<br>
                new file mode 100644<br>
                index 0000000000..ccf55500a9<br>
                --- /dev/null<br>
                +++
                b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc<br>
                @@ -0,0 +1,47 @@<br>
                +# This .inc file contains the common setup for the
                gstreamer1.0-plugins-*<br>
                +# plugin set recipes.<br>
                +<br>
                +# SUMMARY is set in the actual .bb recipes<br>
                +HOMEPAGE = "<a
                  href="https://gstreamer.freedesktop.org/"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">https://gstreamer.freedesktop.org/</a>"<br>
                +BUGTRACKER = "<a
                  href="https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer</a>"<br>
                +SECTION = "multimedia"<br>
                +<br>
                +DEPENDS = "gstreamer1.0 glib-2.0-native"<br>
                +<br>
                +inherit gettext meson pkgconfig
                upstream-version-is-even<br>
                +<br>
                +require gstreamer1.0-plugins-packaging.inc<br>
                +<br>
                +# Orc enables runtime JIT compilation of data
                processing routines from Orc<br>
                +# bytecode to SIMD instructions for various
                architectures (currently SSE, MMX,<br>
                +# MIPS, Altivec and NEON are supported).<br>
                +# This value is used in the PACKAGECONFIG values for
                each plugin set recipe.<br>
                +# By modifying it, Orc can be enabled/disabled in all
                of these recipes at once.<br>
                +GSTREAMER_ORC ?= "orc"<br>
                +<br>
                +PACKAGECONFIG[orc] = "-Dorc=enabled,-Dorc=disabled,orc
                orc-native"<br>
                +<br>
                +# TODO: put this in a gettext.bbclass patch (with
                variables to allow for<br>
                +# configuring the option name and the enabled/disabled
                values).<br>
                +def gettext_oemeson(d):<br>
                +    if d.getVar('USE_NLS') == 'no':<br>
                +        return '-Dnls=disabled'<br>
                +    # Remove the NLS bits if USE_NLS is no or
                INHIBIT_DEFAULT_DEPS is set<br>
                +    if d.getVar('INHIBIT_DEFAULT_DEPS') and not
                oe.utils.inherits(d, 'cross-canadian'):<br>
                +        return '-Dnls=disabled'<br>
                +    return '-Dnls=enabled'<br>
                +<br>
                +# Not all plugin sets contain examples, so the
                -Dexamples<br>
                +# option needs to be added conditionally.<br>
                +GST_PLUGIN_SET_HAS_EXAMPLES ?= "1"<br>
                +<br>
                +EXTRA_OEMESON += " \<br>
                +    ${@bb.utils.contains('GST_PLUGIN_SET_HAS_EXAMPLES',
                '1', '-Dexamples=disabled', '', d)} \<br>
                +    ${@gettext_oemeson(d)} \<br>
                +"<br>
                +<br>
                +GIR_MESON_ENABLE_FLAG = "enabled"<br>
                +GIR_MESON_DISABLE_FLAG = "disabled"<br>
                +<br>
                +# Dynamically generate packages for all enabled plugins<br>
                +PACKAGES_DYNAMIC = "^${PN}-.*"<br>
                diff --git
                a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc<br>
                new file mode 100644<br>
                index 0000000000..9a7a1b6afe<br>
                --- /dev/null<br>
                +++
                b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc<br>
                @@ -0,0 +1,70 @@<br>
                +# This .inc file contains functionality for
                automatically splitting<br>
                +# built plugins into individual packages for each
                plugin. A -meta<br>
                +# package is also set up that has no files of its own,
                but contains<br>
                +# the names of all plugin packages in its RDEPENDS
                list.<br>
                +#<br>
                +# This is mainly used by the gstreamer1.0-plugins-*
                plugin set recipes,<br>
                +# but can be used in any recipe that produces GStreamer
                plugins.<br>
                +<br>
                +PACKAGESPLITFUNCS_prepend = "
                split_gstreamer10_packages "<br>
                +PACKAGESPLITFUNCS_append = "
                set_gstreamer10_metapkg_rdepends "<br>
                +<br>
                +python split_gstreamer10_packages () {<br>
                +    gst_libdir = d.expand('${libdir}/gstreamer-1.0')<br>
                +    postinst = d.getVar('plugin_postinst')<br>
                +    glibdir = d.getVar('libdir')<br>
                +<br>
                +    # GStreamer libraries<br>
                +    do_split_packages(d, glibdir, r'^lib(.*)\.so\.*',
                'lib%s', 'GStreamer 1.0 %s library', extra_depends='',
                allow_links=True)<br>
                +    # GStreamer plugin shared objects<br>
                +    do_split_packages(d, gst_libdir,
                r'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer 1.0
                plugin for %s', postinst=postinst, extra_depends='')<br>
                +    # GObject introspection files for GStreamer plugins<br>
                +    do_split_packages(d, glibdir+'/girepository-1.0',
                r'Gst(.*)-1.0\.typelib$', d.expand('${PN}-%s-typelib'),
                'GStreamer 1.0 typelib file for %s', postinst=postinst,
                extra_depends='')<br>
                +    # Static GStreamer libraries for development<br>
                +    do_split_packages(d, gst_libdir, r'libgst(.*)\.a$',
                d.expand('${PN}-%s-staticdev'), 'GStreamer 1.0 plugin
                for %s (static development files)',
                extra_depends='${PN}-staticdev')<br>
                +}<br>
                +<br>
                +python set_gstreamer10_metapkg_rdepends () {<br>
                +    import os<br>
                +    import oe.utils<br>
                +<br>
                +    # Go through all generated packages (excluding the
                main package and<br>
                +    # the -meta package itself) and add them to the
                -meta package as RDEPENDS.<br>
                +<br>
                +    pn = d.getVar('PN')<br>
                +    metapkg =  pn + '-meta'<br>
                +    d.setVar('ALLOW_EMPTY_' + metapkg, "1")<br>
                +    d.setVar('FILES_' + metapkg, "")<br>
                +    blacklist = [ pn, pn + '-meta' ]<br>
                +    metapkg_rdepends = []<br>
                +    pkgdest = d.getVar('PKGDEST')<br>
                +    for pkg in oe.utils.packages_filter_out_system(d):<br>
                +        if pkg not in blacklist and pkg not in
                metapkg_rdepends:<br>
                +            # See if the package is empty by looking at
                the contents of its PKGDEST subdirectory.<br>
                +            # If this subdirectory is empty, then the
                package is.<br>
                +            # Empty packages do not get added to the
                meta package's RDEPENDS<br>
                +            pkgdir = os.path.join(pkgdest, pkg)<br>
                +            if os.path.exists(pkgdir):<br>
                +                dir_contents = os.listdir(pkgdir) or []<br>
                +            else:<br>
                +                dir_contents = []<br>
                +            is_empty = len(dir_contents) == 0<br>
                +            if not is_empty:<br>
                +                metapkg_rdepends.append(pkg)<br>
                +    d.setVar('RDEPENDS_' + metapkg, '
                '.join(metapkg_rdepends))<br>
                +    d.setVar('DESCRIPTION_' + metapkg, pn + ' meta
                package')<br>
                +}<br>
                +<br>
                +# each plugin-dev depends on PN-dev, plugin-staticdev
                on PN-staticdev<br>
                +# so we need them even when empty (like in
                gst-plugins-good case)<br>
                +ALLOW_EMPTY_${PN} = "1"<br>
                +ALLOW_EMPTY_${PN}-dev = "1"<br>
                +ALLOW_EMPTY_${PN}-staticdev = "1"<br>
                +<br>
                +PACKAGES += "${PN}-apps ${PN}-meta ${PN}-glib"<br>
                +<br>
                +FILES_${PN} = ""<br>
                +FILES_${PN}-apps = "${bindir}"<br>
                +FILES_${PN}-glib = "${datadir}/glib-2.0"<br>
                +<br>
                +RRECOMMENDS_${PN} += "${PN}-meta"<br>
                diff --git
                a/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc<br>
                new file mode 100644<br>
                index 0000000000..74368c4cd8<br>
                --- /dev/null<br>
                +++
                b/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc<br>
                @@ -0,0 +1,21 @@<br>
                +inherit ptest-gnome<br>
                +<br>
                +TEST_FILES_PATH =
                "${datadir}/installed-tests/gstreamer-1.0/test-files"<br>
                +RUN_PTEST_FILE = "${D}${PTEST_PATH}/run-ptest"<br>
                +<br>
                +EXTRA_OEMESON += "-Dtest-files-path=${TEST_FILES_PATH}"<br>
                +<br>
                +# Using do_install_ptest_base instead of
                do_install_ptest, since<br>
                +# the default do_install_ptest_base is hardcoded to
                expect Makefiles.<br>
                +do_install_ptest_base() {<br>
                +    # Generate run-ptest file<br>
                +    echo "#!/usr/bin/env sh" &gt; "${RUN_PTEST_FILE}"<br>
                +    echo "gnome-desktop-testing-runner
                ${GST_TEST_SUITE_NAME}" &gt;&gt; "${RUN_PTEST_FILE}"<br>
                +    chmod 0755 "${RUN_PTEST_FILE}"<br>
                +<br>
                +    # Install additional files required by tests<br>
                +    if [ -d "${S}/tests/files" ] ; then<br>
                +        install -d "${D}/${TEST_FILES_PATH}"<br>
                +        install -m 0644 "${S}/tests/files"/*
                "${D}/${TEST_FILES_PATH}"<br>
                +    fi<br>
                +}<br>
                -- <br>
                2.17.1<br>
                <br>
                -- <br>
                _______________________________________________<br>
                Openembedded-core mailing list<br>
                <a
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
                <a
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
              </blockquote>
            </div>
          </blockquote>
        </div>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------1F486660929682204B3EA4E3--
