Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
	[209.85.221.177])
	by mail.openembedded.org (Postfix) with ESMTP id 021D590E32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 21:14:22 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id b129so1054040vka.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 13:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5nmgduz1hF0+aG8WTv+GUx4UcnUzYmSEpqCRqLkt5IU=;
	b=ksido1Qm3p4bl0frks+l1Oo8+piP0hF6zArS99Rl5b102qvgw1c5nstMMIdN6hU677
	cqwb4hNfMukvSX4NKGeU8XOMLIoMYo3GPXLM84PhAc4srr9P6T07Nja/F0hgrrHYEu53
	xHzXGYhwdMlWlTm/Jbqz58fEWT6mGM2NB7d3ZaUi3R//521Mia68XD83T4tX14Rye574
	DYBpHd3mjijH7TnDv3/2g4AjmG8IA0QVfiWiqWFg/DCMs4c4QGYwqCXmH6ZAygYWpF2a
	LhPf6FEbY+Bnjcpfbo/KZqmvT2xi4TmsDsIMilyXkbxx93oWVa9/0eOhSMEaVSAONupP
	uHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5nmgduz1hF0+aG8WTv+GUx4UcnUzYmSEpqCRqLkt5IU=;
	b=ABSIYx4hGHvSzTqAlf461AdG90Cp2B9QUVAHE9ap8ob7lRa92yO5szLOhR3qA5eYwk
	bl0Xwshn3uk4HjiUofXKMQzn/82DUIkckQiNHu303IAnjykI4BhMql07EMrXzipY8dQr
	TG7WXUT6X300ollD91GeOgL6IXT55IAYenJ2qY01sXpAW0MQpyhK/HMNe8IQ2mEbhh5k
	t2CHFD4eoW0o+bNAN7s2XWaluoJ99QAWmTTh24ufniVSZf8Jpv/kFDxmjwCZ2ssEOLJ9
	70gBRp3idCgknWLhycp2ydmUoZIFPacmC0RM/AtmlHFq8F3rtpeMJTTHiRYEimRiUPM8
	qB2g==
X-Gm-Message-State: APjAAAWj+bCR0DyBsfCOheAw68FjlT2uycV4KOS9LSppbuPMtZ8fQLpI
	PCh/N3ENhLWwfrqDh0z5KVC/+uIQ8+p1MYynJA0=
X-Google-Smtp-Source: APXvYqx1fCgFOpxSnam39h5gZGmW8QxTwKCmiXGpN2JJLFKVBZMO5UAA1tKwQfxyIxDsm2HYdmDXrejzzcImSHXtCTM=
X-Received: by 2002:a1f:7cc2:: with SMTP id x185mr3425864vkc.1.1576703663786; 
	Wed, 18 Dec 2019 13:14:23 -0800 (PST)
MIME-Version: 1.0
References: <20191215124910.24946-1-crg7475@mailbox.org>
In-Reply-To: <20191215124910.24946-1-crg7475@mailbox.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Dec 2019 22:14:12 +0100
Message-ID: <CANNYZj9LUKtJ9JcnyuAktOsco7_4euTVwHz2P5hrpk8Pcj8EBA@mail.gmail.com>
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
X-List-Received-Date: Wed, 18 Dec 2019 21:14:23 -0000
Content-Type: multipart/alternative; boundary="000000000000cbd0f6059a00ed97"

--000000000000cbd0f6059a00ed97
Content-Type: text/plain; charset="UTF-8"

Thanks :) Will there be a more refined version, or should these be merged
already, with followup fixing as needed?

Alex

On Sun, 15 Dec 2019 at 13:55, Carlos Rafael Giani <crg7475@mailbox.org>
wrote:

> * gstreamer1.0-plugins-common.inc
>   The old gstreamer1.0-plugins.inc file, adapted for meson
> * gstreamer1.0-plugins-packaging.inc
>   The old gst-plugins-package.inc file, adapted for meson
> * gstreamer1.0-ptest.inc
>   Common code for meson based PTest support; autogenerates the run-ptest
>   file and is designed to use the gnome-desktop-testing suite runner
>   (which is why the .inc files inherits from ptest-gnome)
>
> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ---
>  .../gstreamer/gstreamer1.0-plugins-common.inc | 47 +++++++++++++
>  .../gstreamer1.0-plugins-packaging.inc        | 70 +++++++++++++++++++
>  .../gstreamer/gstreamer1.0-ptest.inc          | 21 ++++++
>  3 files changed, 138 insertions(+)
>  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
>  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
>  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
>
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
> new file mode 100644
> index 0000000000..ccf55500a9
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
> @@ -0,0 +1,47 @@
> +# This .inc file contains the common setup for the gstreamer1.0-plugins-*
> +# plugin set recipes.
> +
> +# SUMMARY is set in the actual .bb recipes
> +HOMEPAGE = "https://gstreamer.freedesktop.org/"
> +BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
> +SECTION = "multimedia"
> +
> +DEPENDS = "gstreamer1.0 glib-2.0-native"
> +
> +inherit gettext meson pkgconfig upstream-version-is-even
> +
> +require gstreamer1.0-plugins-packaging.inc
> +
> +# Orc enables runtime JIT compilation of data processing routines from Orc
> +# bytecode to SIMD instructions for various architectures (currently SSE,
> MMX,
> +# MIPS, Altivec and NEON are supported).
> +# This value is used in the PACKAGECONFIG values for each plugin set
> recipe.
> +# By modifying it, Orc can be enabled/disabled in all of these recipes at
> once.
> +GSTREAMER_ORC ?= "orc"
> +
> +PACKAGECONFIG[orc] = "-Dorc=enabled,-Dorc=disabled,orc orc-native"
> +
> +# TODO: put this in a gettext.bbclass patch (with variables to allow for
> +# configuring the option name and the enabled/disabled values).
> +def gettext_oemeson(d):
> +    if d.getVar('USE_NLS') == 'no':
> +        return '-Dnls=disabled'
> +    # Remove the NLS bits if USE_NLS is no or INHIBIT_DEFAULT_DEPS is set
> +    if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d,
> 'cross-canadian'):
> +        return '-Dnls=disabled'
> +    return '-Dnls=enabled'
> +
> +# Not all plugin sets contain examples, so the -Dexamples
> +# option needs to be added conditionally.
> +GST_PLUGIN_SET_HAS_EXAMPLES ?= "1"
> +
> +EXTRA_OEMESON += " \
> +    ${@bb.utils.contains('GST_PLUGIN_SET_HAS_EXAMPLES', '1',
> '-Dexamples=disabled', '', d)} \
> +    ${@gettext_oemeson(d)} \
> +"
> +
> +GIR_MESON_ENABLE_FLAG = "enabled"
> +GIR_MESON_DISABLE_FLAG = "disabled"
> +
> +# Dynamically generate packages for all enabled plugins
> +PACKAGES_DYNAMIC = "^${PN}-.*"
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
> new file mode 100644
> index 0000000000..9a7a1b6afe
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
> @@ -0,0 +1,70 @@
> +# This .inc file contains functionality for automatically splitting
> +# built plugins into individual packages for each plugin. A -meta
> +# package is also set up that has no files of its own, but contains
> +# the names of all plugin packages in its RDEPENDS list.
> +#
> +# This is mainly used by the gstreamer1.0-plugins-* plugin set recipes,
> +# but can be used in any recipe that produces GStreamer plugins.
> +
> +PACKAGESPLITFUNCS_prepend = " split_gstreamer10_packages "
> +PACKAGESPLITFUNCS_append = " set_gstreamer10_metapkg_rdepends "
> +
> +python split_gstreamer10_packages () {
> +    gst_libdir = d.expand('${libdir}/gstreamer-1.0')
> +    postinst = d.getVar('plugin_postinst')
> +    glibdir = d.getVar('libdir')
> +
> +    # GStreamer libraries
> +    do_split_packages(d, glibdir, r'^lib(.*)\.so\.*', 'lib%s', 'GStreamer
> 1.0 %s library', extra_depends='', allow_links=True)
> +    # GStreamer plugin shared objects
> +    do_split_packages(d, gst_libdir, r'libgst(.*)\.so$',
> d.expand('${PN}-%s'), 'GStreamer 1.0 plugin for %s', postinst=postinst,
> extra_depends='')
> +    # GObject introspection files for GStreamer plugins
> +    do_split_packages(d, glibdir+'/girepository-1.0',
> r'Gst(.*)-1.0\.typelib$', d.expand('${PN}-%s-typelib'), 'GStreamer 1.0
> typelib file for %s', postinst=postinst, extra_depends='')
> +    # Static GStreamer libraries for development
> +    do_split_packages(d, gst_libdir, r'libgst(.*)\.a$',
> d.expand('${PN}-%s-staticdev'), 'GStreamer 1.0 plugin for %s (static
> development files)', extra_depends='${PN}-staticdev')
> +}
> +
> +python set_gstreamer10_metapkg_rdepends () {
> +    import os
> +    import oe.utils
> +
> +    # Go through all generated packages (excluding the main package and
> +    # the -meta package itself) and add them to the -meta package as
> RDEPENDS.
> +
> +    pn = d.getVar('PN')
> +    metapkg =  pn + '-meta'
> +    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
> +    d.setVar('FILES_' + metapkg, "")
> +    blacklist = [ pn, pn + '-meta' ]
> +    metapkg_rdepends = []
> +    pkgdest = d.getVar('PKGDEST')
> +    for pkg in oe.utils.packages_filter_out_system(d):
> +        if pkg not in blacklist and pkg not in metapkg_rdepends:
> +            # See if the package is empty by looking at the contents of
> its PKGDEST subdirectory.
> +            # If this subdirectory is empty, then the package is.
> +            # Empty packages do not get added to the meta package's
> RDEPENDS
> +            pkgdir = os.path.join(pkgdest, pkg)
> +            if os.path.exists(pkgdir):
> +                dir_contents = os.listdir(pkgdir) or []
> +            else:
> +                dir_contents = []
> +            is_empty = len(dir_contents) == 0
> +            if not is_empty:
> +                metapkg_rdepends.append(pkg)
> +    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
> +    d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
> +}
> +
> +# each plugin-dev depends on PN-dev, plugin-staticdev on PN-staticdev
> +# so we need them even when empty (like in gst-plugins-good case)
> +ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY_${PN}-dev = "1"
> +ALLOW_EMPTY_${PN}-staticdev = "1"
> +
> +PACKAGES += "${PN}-apps ${PN}-meta ${PN}-glib"
> +
> +FILES_${PN} = ""
> +FILES_${PN}-apps = "${bindir}"
> +FILES_${PN}-glib = "${datadir}/glib-2.0"
> +
> +RRECOMMENDS_${PN} += "${PN}-meta"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
> new file mode 100644
> index 0000000000..74368c4cd8
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
> @@ -0,0 +1,21 @@
> +inherit ptest-gnome
> +
> +TEST_FILES_PATH = "${datadir}/installed-tests/gstreamer-1.0/test-files"
> +RUN_PTEST_FILE = "${D}${PTEST_PATH}/run-ptest"
> +
> +EXTRA_OEMESON += "-Dtest-files-path=${TEST_FILES_PATH}"
> +
> +# Using do_install_ptest_base instead of do_install_ptest, since
> +# the default do_install_ptest_base is hardcoded to expect Makefiles.
> +do_install_ptest_base() {
> +    # Generate run-ptest file
> +    echo "#!/usr/bin/env sh" > "${RUN_PTEST_FILE}"
> +    echo "gnome-desktop-testing-runner ${GST_TEST_SUITE_NAME}" >>
> "${RUN_PTEST_FILE}"
> +    chmod 0755 "${RUN_PTEST_FILE}"
> +
> +    # Install additional files required by tests
> +    if [ -d "${S}/tests/files" ] ; then
> +        install -d "${D}/${TEST_FILES_PATH}"
> +        install -m 0644 "${S}/tests/files"/* "${D}/${TEST_FILES_PATH}"
> +    fi
> +}
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000cbd0f6059a00ed97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks :) Will there be a more refined version, or sh=
ould these be merged already, with followup fixing as needed?</div><div><br=
></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sun, 15 Dec 2019 at 13:55, Carlos Rafael Giani=
 &lt;<a href=3D"mailto:crg7475@mailbox.org">crg7475@mailbox.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* gstreamer1=
.0-plugins-common.inc<br>
=C2=A0 The old gstreamer1.0-plugins.inc file, adapted for meson<br>
* gstreamer1.0-plugins-packaging.inc<br>
=C2=A0 The old gst-plugins-package.inc file, adapted for meson<br>
* gstreamer1.0-ptest.inc<br>
=C2=A0 Common code for meson based PTest support; autogenerates the run-pte=
st<br>
=C2=A0 file and is designed to use the gnome-desktop-testing suite runner<b=
r>
=C2=A0 (which is why the .inc files inherits from ptest-gnome)<br>
<br>
Signed-off-by: Carlos Rafael Giani &lt;<a href=3D"mailto:crg7475@mailbox.or=
g" target=3D"_blank">crg7475@mailbox.org</a>&gt;<br>
---<br>
=C2=A0.../gstreamer/gstreamer1.0-plugins-common.inc | 47 +++++++++++++<br>
=C2=A0.../gstreamer1.0-plugins-packaging.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7=
0 +++++++++++++++++++<br>
=C2=A0.../gstreamer/gstreamer1.0-ptest.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 21 ++++++<br>
=C2=A03 files changed, 138 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plu=
gins-common.inc<br>
=C2=A0create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plu=
gins-packaging.inc<br>
=C2=A0create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-pte=
st.inc<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.=
inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc<br>
new file mode 100644<br>
index 0000000000..ccf55500a9<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc<br>
@@ -0,0 +1,47 @@<br>
+# This .inc file contains the common setup for the gstreamer1.0-plugins-*<=
br>
+# plugin set recipes.<br>
+<br>
+# SUMMARY is set in the actual .bb recipes<br>
+HOMEPAGE =3D &quot;<a href=3D"https://gstreamer.freedesktop.org/" rel=3D"n=
oreferrer" target=3D"_blank">https://gstreamer.freedesktop.org/</a>&quot;<b=
r>
+BUGTRACKER =3D &quot;<a href=3D"https://bugzilla.gnome.org/enter_bug.cgi?p=
roduct=3DGstreamer" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.g=
nome.org/enter_bug.cgi?product=3DGstreamer</a>&quot;<br>
+SECTION =3D &quot;multimedia&quot;<br>
+<br>
+DEPENDS =3D &quot;gstreamer1.0 glib-2.0-native&quot;<br>
+<br>
+inherit gettext meson pkgconfig upstream-version-is-even<br>
+<br>
+require gstreamer1.0-plugins-packaging.inc<br>
+<br>
+# Orc enables runtime JIT compilation of data processing routines from Orc=
<br>
+# bytecode to SIMD instructions for various architectures (currently SSE, =
MMX,<br>
+# MIPS, Altivec and NEON are supported).<br>
+# This value is used in the PACKAGECONFIG values for each plugin set recip=
e.<br>
+# By modifying it, Orc can be enabled/disabled in all of these recipes at =
once.<br>
+GSTREAMER_ORC ?=3D &quot;orc&quot;<br>
+<br>
+PACKAGECONFIG[orc] =3D &quot;-Dorc=3Denabled,-Dorc=3Ddisabled,orc orc-nati=
ve&quot;<br>
+<br>
+# TODO: put this in a gettext.bbclass patch (with variables to allow for<b=
r>
+# configuring the option name and the enabled/disabled values).<br>
+def gettext_oemeson(d):<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;USE_NLS&#39;) =3D=3D &#39;no&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;-Dnls=3Ddisabled&#39;<br>
+=C2=A0 =C2=A0 # Remove the NLS bits if USE_NLS is no or INHIBIT_DEFAULT_DE=
PS is set<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;INHIBIT_DEFAULT_DEPS&#39;) and not oe.utils=
.inherits(d, &#39;cross-canadian&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;-Dnls=3Ddisabled&#39;<br>
+=C2=A0 =C2=A0 return &#39;-Dnls=3Denabled&#39;<br>
+<br>
+# Not all plugin sets contain examples, so the -Dexamples<br>
+# option needs to be added conditionally.<br>
+GST_PLUGIN_SET_HAS_EXAMPLES ?=3D &quot;1&quot;<br>
+<br>
+EXTRA_OEMESON +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;GST_PLUGIN_SET_HAS_EXAMPLES&#39;, =
&#39;1&#39;, &#39;-Dexamples=3Ddisabled&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@gettext_oemeson(d)} \<br>
+&quot;<br>
+<br>
+GIR_MESON_ENABLE_FLAG =3D &quot;enabled&quot;<br>
+GIR_MESON_DISABLE_FLAG =3D &quot;disabled&quot;<br>
+<br>
+# Dynamically generate packages for all enabled plugins<br>
+PACKAGES_DYNAMIC =3D &quot;^${PN}-.*&quot;<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packagi=
ng.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.i=
nc<br>
new file mode 100644<br>
index 0000000000..9a7a1b6afe<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc<=
br>
@@ -0,0 +1,70 @@<br>
+# This .inc file contains functionality for automatically splitting<br>
+# built plugins into individual packages for each plugin. A -meta<br>
+# package is also set up that has no files of its own, but contains<br>
+# the names of all plugin packages in its RDEPENDS list.<br>
+#<br>
+# This is mainly used by the gstreamer1.0-plugins-* plugin set recipes,<br=
>
+# but can be used in any recipe that produces GStreamer plugins.<br>
+<br>
+PACKAGESPLITFUNCS_prepend =3D &quot; split_gstreamer10_packages &quot;<br>
+PACKAGESPLITFUNCS_append =3D &quot; set_gstreamer10_metapkg_rdepends &quot=
;<br>
+<br>
+python split_gstreamer10_packages () {<br>
+=C2=A0 =C2=A0 gst_libdir =3D d.expand(&#39;${libdir}/gstreamer-1.0&#39;)<b=
r>
+=C2=A0 =C2=A0 postinst =3D d.getVar(&#39;plugin_postinst&#39;)<br>
+=C2=A0 =C2=A0 glibdir =3D d.getVar(&#39;libdir&#39;)<br>
+<br>
+=C2=A0 =C2=A0 # GStreamer libraries<br>
+=C2=A0 =C2=A0 do_split_packages(d, glibdir, r&#39;^lib(.*)\.so\.*&#39;, &#=
39;lib%s&#39;, &#39;GStreamer 1.0 %s library&#39;, extra_depends=3D&#39;&#3=
9;, allow_links=3DTrue)<br>
+=C2=A0 =C2=A0 # GStreamer plugin shared objects<br>
+=C2=A0 =C2=A0 do_split_packages(d, gst_libdir, r&#39;libgst(.*)\.so$&#39;,=
 d.expand(&#39;${PN}-%s&#39;), &#39;GStreamer 1.0 plugin for %s&#39;, posti=
nst=3Dpostinst, extra_depends=3D&#39;&#39;)<br>
+=C2=A0 =C2=A0 # GObject introspection files for GStreamer plugins<br>
+=C2=A0 =C2=A0 do_split_packages(d, glibdir+&#39;/girepository-1.0&#39;, r&=
#39;Gst(.*)-1.0\.typelib$&#39;, d.expand(&#39;${PN}-%s-typelib&#39;), &#39;=
GStreamer 1.0 typelib file for %s&#39;, postinst=3Dpostinst, extra_depends=
=3D&#39;&#39;)<br>
+=C2=A0 =C2=A0 # Static GStreamer libraries for development<br>
+=C2=A0 =C2=A0 do_split_packages(d, gst_libdir, r&#39;libgst(.*)\.a$&#39;, =
d.expand(&#39;${PN}-%s-staticdev&#39;), &#39;GStreamer 1.0 plugin for %s (s=
tatic development files)&#39;, extra_depends=3D&#39;${PN}-staticdev&#39;)<b=
r>
+}<br>
+<br>
+python set_gstreamer10_metapkg_rdepends () {<br>
+=C2=A0 =C2=A0 import os<br>
+=C2=A0 =C2=A0 import oe.utils<br>
+<br>
+=C2=A0 =C2=A0 # Go through all generated packages (excluding the main pack=
age and<br>
+=C2=A0 =C2=A0 # the -meta package itself) and add them to the -meta packag=
e as RDEPENDS.<br>
+<br>
+=C2=A0 =C2=A0 pn =3D d.getVar(&#39;PN&#39;)<br>
+=C2=A0 =C2=A0 metapkg =3D=C2=A0 pn + &#39;-meta&#39;<br>
+=C2=A0 =C2=A0 d.setVar(&#39;ALLOW_EMPTY_&#39; + metapkg, &quot;1&quot;)<br=
>
+=C2=A0 =C2=A0 d.setVar(&#39;FILES_&#39; + metapkg, &quot;&quot;)<br>
+=C2=A0 =C2=A0 blacklist =3D [ pn, pn + &#39;-meta&#39; ]<br>
+=C2=A0 =C2=A0 metapkg_rdepends =3D []<br>
+=C2=A0 =C2=A0 pkgdest =3D d.getVar(&#39;PKGDEST&#39;)<br>
+=C2=A0 =C2=A0 for pkg in oe.utils.packages_filter_out_system(d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkg not in blacklist and pkg not in metapkg=
_rdepends:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # See if the package is empty by=
 looking at the contents of its PKGDEST subdirectory.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If this subdirectory is empty,=
 then the package is.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Empty packages do not get adde=
d to the meta package&#39;s RDEPENDS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgdir =3D os.path.join(pkgdest,=
 pkg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(pkgdir):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir_contents =3D o=
s.listdir(pkgdir) or []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dir_contents =3D [=
]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_empty =3D len(dir_contents) =
=3D=3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not is_empty:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 metapkg_rdepends.a=
ppend(pkg)<br>
+=C2=A0 =C2=A0 d.setVar(&#39;RDEPENDS_&#39; + metapkg, &#39; &#39;.join(met=
apkg_rdepends))<br>
+=C2=A0 =C2=A0 d.setVar(&#39;DESCRIPTION_&#39; + metapkg, pn + &#39; meta p=
ackage&#39;)<br>
+}<br>
+<br>
+# each plugin-dev depends on PN-dev, plugin-staticdev on PN-staticdev<br>
+# so we need them even when empty (like in gst-plugins-good case)<br>
+ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
+ALLOW_EMPTY_${PN}-dev =3D &quot;1&quot;<br>
+ALLOW_EMPTY_${PN}-staticdev =3D &quot;1&quot;<br>
+<br>
+PACKAGES +=3D &quot;${PN}-apps ${PN}-meta ${PN}-glib&quot;<br>
+<br>
+FILES_${PN} =3D &quot;&quot;<br>
+FILES_${PN}-apps =3D &quot;${bindir}&quot;<br>
+FILES_${PN}-glib =3D &quot;${datadir}/glib-2.0&quot;<br>
+<br>
+RRECOMMENDS_${PN} +=3D &quot;${PN}-meta&quot;<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc b/met=
a/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc<br>
new file mode 100644<br>
index 0000000000..74368c4cd8<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc<br>
@@ -0,0 +1,21 @@<br>
+inherit ptest-gnome<br>
+<br>
+TEST_FILES_PATH =3D &quot;${datadir}/installed-tests/gstreamer-1.0/test-fi=
les&quot;<br>
+RUN_PTEST_FILE =3D &quot;${D}${PTEST_PATH}/run-ptest&quot;<br>
+<br>
+EXTRA_OEMESON +=3D &quot;-Dtest-files-path=3D${TEST_FILES_PATH}&quot;<br>
+<br>
+# Using do_install_ptest_base instead of do_install_ptest, since<br>
+# the default do_install_ptest_base is hardcoded to expect Makefiles.<br>
+do_install_ptest_base() {<br>
+=C2=A0 =C2=A0 # Generate run-ptest file<br>
+=C2=A0 =C2=A0 echo &quot;#!/usr/bin/env sh&quot; &gt; &quot;${RUN_PTEST_FI=
LE}&quot;<br>
+=C2=A0 =C2=A0 echo &quot;gnome-desktop-testing-runner ${GST_TEST_SUITE_NAM=
E}&quot; &gt;&gt; &quot;${RUN_PTEST_FILE}&quot;<br>
+=C2=A0 =C2=A0 chmod 0755 &quot;${RUN_PTEST_FILE}&quot;<br>
+<br>
+=C2=A0 =C2=A0 # Install additional files required by tests<br>
+=C2=A0 =C2=A0 if [ -d &quot;${S}/tests/files&quot; ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d &quot;${D}/${TEST_FILES_PATH}&quot;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 &quot;${S}/tests/files&quot;/*=
 &quot;${D}/${TEST_FILES_PATH}&quot;<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000cbd0f6059a00ed97--
