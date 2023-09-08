Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65505EE8016
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 15:19:19 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.41996.1694186355632802627
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 08:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout10.t-online.de (Postfix) with SMTP id D2D752749E
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Sep 2023 17:19:12 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.164.221]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qedGH-1pUWUS0; Fri, 8 Sep 2023 17:19:10 +0200
Date: Fri, 08 Sep 2023 17:19:07 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv3] RFC: import libxmlb and appstream from meta-oe
To: openembedded-core@lists.openembedded.org
Message-Id: <VJAO0S.6ARLWPXBYLMS@t-online.de>
In-Reply-To: <1782F56A6EAE9A60.4793@lists.openembedded.org>
References: <1782F56A6EAE9A60.4793@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-oEpd51lRLjG3FafxTcH1"
X-TOI-EXPURGATEID: 150726::1694186350-EFFF0670-A69CEC82/0/0 CLEAN NORMAL
X-TOI-MSGID: 25a0183e-21ea-4013-8c66-a2dabe37ba65
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 15:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187439

--=-oEpd51lRLjG3FafxTcH1
Content-Type: text/plain; charset=us-ascii; format=flowed

v3 removes the :append from SRC_URI because we dont need to differ 
between native/target anymore

On Fri, Sep 8 2023 at 05:15:41 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> The upcoming libadwaita update will have a required dependency on 
> appstream,
> so these will be required in oe-core.
> 
> In order to be able to use snowball for appstream by default, also 
> libstemmer
> would need to be moved.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/conf/distro/include/maintainers.inc      |  2 +
>  .../0001-remove-hardcoded-path.patch          | 31 +++++++++++++
>  .../appstream/appstream_0.16.3.bb             | 44 
> +++++++++++++++++++
>  .../recipes-support/libxmlb/libxmlb/run-ptest |  3 ++
>  .../recipes-support/libxmlb/libxmlb_0.3.14.bb | 24 ++++++++++
>  5 files changed, 104 insertions(+)
>  create mode 100644 
> meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
>  create mode 100644 meta/recipes-support/appstream/appstream_0.16.3.bb
>  create mode 100644 meta/recipes-support/libxmlb/libxmlb/run-ptest
>  create mode 100644 meta/recipes-support/libxmlb/libxmlb_0.3.14.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc 
> b/meta/conf/distro/include/maintainers.inc
> index 3619588ae6..18977fd671 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -40,6 +40,7 @@ RECIPE_MAINTAINER:pn-alsa-ucm-conf = "Michael 
> Opdenacker <michael.opdenacker@boo
>  RECIPE_MAINTAINER:pn-alsa-utils = "Michael Opdenacker 
> <michael.opdenacker@bootlin.com 
> <mailto:michael.opdenacker@bootlin.com>>"
>  RECIPE_MAINTAINER:pn-apr = "Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>>"
>  RECIPE_MAINTAINER:pn-apr-util = "Hongxu Jia 
> <hongxu.jia@windriver.com <mailto:hongxu.jia@windriver.com>>"
> +RECIPE_MAINTAINER:pn-appstream = "Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>"
>  RECIPE_MAINTAINER:pn-apt = "Unassigned <unassigned@yoctoproject.org 
> <mailto:unassigned@yoctoproject.org>>"
>  RECIPE_MAINTAINER:pn-argp-standalone = "Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>"
>  RECIPE_MAINTAINER:pn-asciidoc = "Yi Zhao <yi.zhao@windriver.com 
> <mailto:yi.zhao@windriver.com>>"
> @@ -447,6 +448,7 @@ RECIPE_MAINTAINER:pn-libxml-sax-base-perl = "Tim 
> Orling <tim.orling@konsulko.com
>  RECIPE_MAINTAINER:pn-libxml-sax-perl = "Tim Orling 
> <tim.orling@konsulko.com <mailto:tim.orling@konsulko.com>>"
>  RECIPE_MAINTAINER:pn-libxml-simple-perl = "Tim Orling 
> <tim.orling@konsulko.com <mailto:tim.orling@konsulko.com>>"
>  RECIPE_MAINTAINER:pn-libxml2 = "Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>>"
> +RECIPE_MAINTAINER:pn-libxmlb = "Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>"
>  RECIPE_MAINTAINER:pn-libxmu = "Unassigned 
> <unassigned@yoctoproject.org <mailto:unassigned@yoctoproject.org>>"
>  RECIPE_MAINTAINER:pn-libxpm = "Unassigned 
> <unassigned@yoctoproject.org <mailto:unassigned@yoctoproject.org>>"
>  RECIPE_MAINTAINER:pn-libxrandr = "Unassigned 
> <unassigned@yoctoproject.org <mailto:unassigned@yoctoproject.org>>"
> diff --git 
> a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch 
> b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
> new file mode 100644
> index 0000000000..9cbfaca82f
> --- /dev/null
> +++ 
> b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
> @@ -0,0 +1,31 @@
> +From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Mon, 12 Dec 2022 15:42:42 +0100
> +Subject: [PATCH] remove hardcoded path
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> +
> +Dont include hardcoded path. This fixes:
> +| cc1: error: include location "/usr/include" is unsafe for 
> cross-compilation [-Werror=poison-system-directories]
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +---
> + meson.build       | 2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index fd0e3373..2f273ada 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -124,7 +124,7 @@ if get_option ('gir')
> +     dependency('gobject-introspection-1.0', version: '>=1.56')
> + endif
> +
> +-stemmer_inc_dirs = include_directories(['/usr/include'])
> ++stemmer_inc_dirs = include_directories([''])
> + if get_option('stemming')
> +     stemmer_lib = cc.find_library('stemmer', required: true)
> +     if not cc.has_header('libstemmer.h')
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/appstream/appstream_0.16.3.bb 
> b/meta/recipes-support/appstream/appstream_0.16.3.bb
> new file mode 100644
> index 0000000000..7fbe51fc87
> --- /dev/null
> +++ b/meta/recipes-support/appstream/appstream_0.16.3.bb
> @@ -0,0 +1,44 @@
> +SUMMARY = "AppStream is a collaborative effort for making 
> machine-readable software metadata easily available."
> +HOMEPAGE = "<https://github.com/ximion/appstream>"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=435ed639f84d4585d93824e7da3d85da" 
> <file://copying;md5=435ed639f84d4585d93824e7da3d85da/>
> +
> +DEPENDS = " \
> +    appstream-native \
> +    curl-native \
> +    curl \
> +    docbook-xml-dtd4-native \
> +    gperf-native \
> +    glib-2.0 \
> +    libyaml \
> +    libxml2 \
> +    libxmlb \
> +    libxslt-native \
> +    itstool-native \
> +    docbook-xsl-stylesheets-native \
> +    python3-pygments-native \
> +"
> +
> +inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
> +
> +GIR_MESON_OPTION = "gir"
> +GTKDOC_MESON_OPTION = "apidocs"
> +
> +SRC_URI = " \
> +	https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz 
> <https://www.freedesktop.org/software/appstream/releases/AppStream-$%7BPV%7D.tar.xz> 
> \
> +	file://0001-remove-hardcoded-path.patch 
> <file://0001-remove-hardcoded-path.patch/> \
> +"
> +SRC_URI[sha256sum] = 
> "081c917646e94d7221c9e4aae54dacda95a27c607fa93cd8e6344a2b318b98b1"
> +
> +S = "${WORKDIR}/AppStream-${PV}"
> +
> +PACKAGECONFIG ?= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'systemd', d)}"
> +
> +PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
> +PACKAGECONFIG[stemming] = 
> "-Dstemming=true,-Dstemming=false,libstemmer"
> +
> +FILES:${PN} += "${datadir}"
> +
> +EXTRA_OEMESON += "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('GI_DATA_ENABLED', 'True', 
> '-Dvapi=true', '-Dvapi=false', d)}"
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-support/libxmlb/libxmlb/run-ptest 
> b/meta/recipes-support/libxmlb/libxmlb/run-ptest
> new file mode 100644
> index 0000000000..6d0bb95d3a
> --- /dev/null
> +++ b/meta/recipes-support/libxmlb/libxmlb/run-ptest
> @@ -0,0 +1,3 @@
> +#! /bin/sh
> +
> +gnome-desktop-testing-runner libxmlb
> diff --git a/meta/recipes-support/libxmlb/libxmlb_0.3.14.bb 
> b/meta/recipes-support/libxmlb/libxmlb_0.3.14.bb
> new file mode 100644
> index 0000000000..90f8844051
> --- /dev/null
> +++ b/meta/recipes-support/libxmlb/libxmlb_0.3.14.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "A library to help create and query binary XML blobs"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742" 
> <file://license;md5=1803fa9c2c3ce8cb06b4861d75310742/>
> +
> +SRC_URI = 
> "git://github.com/hughsie/libxmlb.git;branch=main;protocol=https \
> +           file://run-ptest <file://run-ptest/> \
> +           "
> +SRCREV = "aa577b276adc66564f5777f9a522ca3bf0bfa65e"
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "glib-2.0 xz zstd"
> +
> +inherit gobject-introspection gtk-doc meson ptest-gnome lib_package 
> pkgconfig
> +
> +PACKAGECONFIG ??= "\
> +    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('PTEST_ENABLED', '1', 'tests', '', d)} \
> +"
> +PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false"
> +
> +GTKDOC_MESON_OPTION = "gtkdoc"
> +
> +FILES:${PN}-bin += "${libexecdir}"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.41.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187438): 
> <https://lists.openembedded.org/g/openembedded-core/message/187438>
> Mute This Topic: <https://lists.openembedded.org/mt/101238702/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-oEpd51lRLjG3FafxTcH1
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v3 removes the :append from SRC_URI because we dont need to differ between native/target anymore</div></div><div id="geary-quote" dir="auto"><br>On Fri, Sep 8 2023 at 05:15:41 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">The upcoming libadwaita update will have a required dependency on appstream,
so these will be required in oe-core.

In order to be able to use snowball for appstream by default, also libstemmer
would need to be moved.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta/conf/distro/include/maintainers.inc      |  2 +
 .../0001-remove-hardcoded-path.patch          | 31 +++++++++++++
 .../appstream/appstream_0.16.3.bb             | 44 +++++++++++++++++++
 .../recipes-support/libxmlb/libxmlb/run-ptest |  3 ++
 .../recipes-support/libxmlb/libxmlb_0.3.14.bb | 24 ++++++++++
 5 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
 create mode 100644 meta/recipes-support/appstream/appstream_0.16.3.bb
 create mode 100644 meta/recipes-support/libxmlb/libxmlb/run-ptest
 create mode 100644 meta/recipes-support/libxmlb/libxmlb_0.3.14.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3619588ae6..18977fd671 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -40,6 +40,7 @@ RECIPE_MAINTAINER:pn-alsa-ucm-conf = "Michael Opdenacker &lt;michael.opdenacker@boo
 RECIPE_MAINTAINER:pn-alsa-utils = "Michael Opdenacker &lt;<a href="mailto:michael.opdenacker@bootlin.com">michael.opdenacker@bootlin.com</a>&gt;"
 RECIPE_MAINTAINER:pn-apr = "Hongxu Jia &lt;<a href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;"
 RECIPE_MAINTAINER:pn-apr-util = "Hongxu Jia &lt;<a href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;"
+RECIPE_MAINTAINER:pn-appstream = "Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;"
 RECIPE_MAINTAINER:pn-apt = "Unassigned &lt;<a href="mailto:unassigned@yoctoproject.org">unassigned@yoctoproject.org</a>&gt;"
 RECIPE_MAINTAINER:pn-argp-standalone = "Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;"
 RECIPE_MAINTAINER:pn-asciidoc = "Yi Zhao &lt;<a href="mailto:yi.zhao@windriver.com">yi.zhao@windriver.com</a>&gt;"
@@ -447,6 +448,7 @@ RECIPE_MAINTAINER:pn-libxml-sax-base-perl = "Tim Orling &lt;tim.orling@konsulko.com
 RECIPE_MAINTAINER:pn-libxml-sax-perl = "Tim Orling &lt;<a href="mailto:tim.orling@konsulko.com">tim.orling@konsulko.com</a>&gt;"
 RECIPE_MAINTAINER:pn-libxml-simple-perl = "Tim Orling &lt;<a href="mailto:tim.orling@konsulko.com">tim.orling@konsulko.com</a>&gt;"
 RECIPE_MAINTAINER:pn-libxml2 = "Hongxu Jia &lt;<a href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;"
+RECIPE_MAINTAINER:pn-libxmlb = "Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;"
 RECIPE_MAINTAINER:pn-libxmu = "Unassigned &lt;<a href="mailto:unassigned@yoctoproject.org">unassigned@yoctoproject.org</a>&gt;"
 RECIPE_MAINTAINER:pn-libxpm = "Unassigned &lt;<a href="mailto:unassigned@yoctoproject.org">unassigned@yoctoproject.org</a>&gt;"
 RECIPE_MAINTAINER:pn-libxrandr = "Unassigned &lt;<a href="mailto:unassigned@yoctoproject.org">unassigned@yoctoproject.org</a>&gt;"
diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
new file mode 100644
index 0000000000..9cbfaca82f
--- /dev/null
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -0,0 +1,31 @@
+From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+Date: Mon, 12 Dec 2022 15:42:42 +0100
+Subject: [PATCH] remove hardcoded path
+
+Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+
+Dont include hardcoded path. This fixes:
+| cc1: error: include location "/usr/include" is unsafe for cross-compilation [-Werror=poison-system-directories]
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ meson.build       | 2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index fd0e3373..2f273ada 100644
+--- a/meson.build
++++ b/meson.build
+@@ -124,7 +124,7 @@ if get_option ('gir')
+     dependency('gobject-introspection-1.0', version: '&gt;=1.56')
+ endif
+ 
+-stemmer_inc_dirs = include_directories(['/usr/include'])
++stemmer_inc_dirs = include_directories([''])
+ if get_option('stemming')
+     stemmer_lib = cc.find_library('stemmer', required: true)
+     if not cc.has_header('libstemmer.h')
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/appstream/appstream_0.16.3.bb b/meta/recipes-support/appstream/appstream_0.16.3.bb
new file mode 100644
index 0000000000..7fbe51fc87
--- /dev/null
+++ b/meta/recipes-support/appstream/appstream_0.16.3.bb
@@ -0,0 +1,44 @@
+SUMMARY = "AppStream is a collaborative effort for making machine-readable software metadata easily available."
+HOMEPAGE = "<a href="https://github.com/ximion/appstream">https://github.com/ximion/appstream</a>"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=435ed639f84d4585d93824e7da3d85da" "="">file://COPYING;md5=435ed639f84d4585d93824e7da3d85da"</a>
+
+DEPENDS = " \
+    appstream-native \
+    curl-native \
+    curl \
+    docbook-xml-dtd4-native \
+    gperf-native \
+    glib-2.0 \
+    libyaml \
+    libxml2 \
+    libxmlb \
+    libxslt-native \
+    itstool-native \
+    docbook-xsl-stylesheets-native \
+    python3-pygments-native \
+"
+
+inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
+
+GIR_MESON_OPTION = "gir"
+GTKDOC_MESON_OPTION = "apidocs"
+
+SRC_URI = " \
+	<a href="https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz">https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz</a> \
+	<a href="file://0001-remove-hardcoded-path.patch">file://0001-remove-hardcoded-path.patch</a> \
+"
+SRC_URI[sha256sum] = "081c917646e94d7221c9e4aae54dacda95a27c607fa93cd8e6344a2b318b98b1"
+
+S = "${WORKDIR}/AppStream-${PV}"
+
+PACKAGECONFIG ?= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'systemd', d)}"
+
+PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
+PACKAGECONFIG[stemming] = "-Dstemming=true,-Dstemming=false,libstemmer"
+
+FILES:${PN} += "${datadir}"
+
+EXTRA_OEMESON += "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)}"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/libxmlb/libxmlb/run-ptest b/meta/recipes-support/libxmlb/libxmlb/run-ptest
new file mode 100644
index 0000000000..6d0bb95d3a
--- /dev/null
+++ b/meta/recipes-support/libxmlb/libxmlb/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+gnome-desktop-testing-runner libxmlb
diff --git a/meta/recipes-support/libxmlb/libxmlb_0.3.14.bb b/meta/recipes-support/libxmlb/libxmlb_0.3.14.bb
new file mode 100644
index 0000000000..90f8844051
--- /dev/null
+++ b/meta/recipes-support/libxmlb/libxmlb_0.3.14.bb
@@ -0,0 +1,24 @@
+SUMMARY = "A library to help create and query binary XML blobs"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742" "="">file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"</a>
+
+SRC_URI = "git://github.com/hughsie/libxmlb.git;branch=main;protocol=https \
+           <a href="file://run-ptest">file://run-ptest</a> \
+           "
+SRCREV = "aa577b276adc66564f5777f9a522ca3bf0bfa65e"
+S = "${WORKDIR}/git"
+
+DEPENDS = "glib-2.0 xz zstd"
+
+inherit gobject-introspection gtk-doc meson ptest-gnome lib_package pkgconfig
+
+PACKAGECONFIG ??= "\
+    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PTEST_ENABLED', '1', 'tests', '', d)} \
+"
+PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false"
+
+GTKDOC_MESON_OPTION = "gtkdoc"
+
+FILES:${PN}-bin += "${libexecdir}"
+
+BBCLASSEXTEND = "native"
<div>-- 
</div>2.41.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#187438): <a href="https://lists.openembedded.org/g/openembedded-core/message/187438">https://lists.openembedded.org/g/openembedded-core/message/187438</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/101238702/3618223">https://lists.openembedded.org/mt/101238702/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-oEpd51lRLjG3FafxTcH1--


