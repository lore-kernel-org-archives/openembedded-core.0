Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04920C0015E
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 08:27:47 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.9746.1691051256633585964
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 01:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KUl/LUpg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A19AF1C0007;
	Thu,  3 Aug 2023 08:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691051254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Wg5lZj/Wyhb3ZQ1K4luE6jo/97MShug7YAq2h3tl418=;
	b=KUl/LUpghRR4NhDtg8Bqb5P2G1N+6Tv3skWi8xbLZPtPjA2DcGX9Y9jI27ABkNU8jqiibL
	T+7srWObugZQvvZaNC5TKQNOHzjq+xRNc3nJ4y5SIy53Lv1oleUTomv9M81xKfvUCK6ZoP
	XVNUS1NDxT7ltl3tFZlXQdYecDV9Y7qhFw4DeufoVZwb6bax4G6GwPEZ/64HN+aDtxC7TQ
	WAu2fUPP0kNHFbbIrShKNrEsYZpO7SS/DxMTezg/BKJVfbnqx+8+8imsxhJ7IJHAgyJ43j
	7Ia8o/kICdqNuX8qY4dF35q8DvBDU6plzn6ExwIxBc3dofxiPW8cWTlPm+rvgw==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] recipes: remove unused AUTHOR variable
Date: Thu,  3 Aug 2023 10:27:18 +0200
Message-Id: <20230803082718.3010083-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 08:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185464

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

No longer used in generating packages
Also creates a possible confusion with the recipe maintainer
name.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/lib/oe/recipeutils.py                                  | 2 +-
 meta/recipes-bsp/setserial/setserial_2.17.bb                | 1 -
 meta/recipes-connectivity/avahi/avahi_0.8.bb                | 1 -
 meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb     | 1 -
 meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb       | 1 -
 meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb | 1 -
 meta/recipes-kernel/kexec/kexec-tools_2.0.26.bb             | 1 -
 meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb     | 1 -
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc           | 1 -
 meta/recipes-support/libdaemon/libdaemon_0.14.bb            | 1 -
 meta/recipes-support/re2c/re2c_3.0.bb                       | 1 -
 meta/recipes-support/rng-tools/rng-tools_6.16.bb            | 2 --
 12 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index b04992c66d..5a902c23f6 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -24,7 +24,7 @@ from collections import OrderedDict, defaultdict
 from bb.utils import vercmp_string
 
 # Help us to find places to insert values
-recipe_progression = ['SUMMARY', 'DESCRIPTION', 'AUTHOR', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRCPV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_OESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'populate_packages()', 'do_package()', 'do_deploy()', 'BBCLASSEXTEND']
+recipe_progression = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRCPV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_OESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'populate_packages()', 'do_package()', 'do_deploy()', 'BBCLASSEXTEND']
 # Variables that sometimes are a bit long but shouldn't be wrapped
 nowrap_vars = ['SUMMARY', 'HOMEPAGE', 'BUGTRACKER', r'SRC_URI\[(.+\.)?md5sum\]', r'SRC_URI\[(.+\.)?sha256sum\]']
 list_vars = ['SRC_URI', 'LIC_FILES_CHKSUM']
diff --git a/meta/recipes-bsp/setserial/setserial_2.17.bb b/meta/recipes-bsp/setserial/setserial_2.17.bb
index e46aeb90cb..8e4bb62b9f 100644
--- a/meta/recipes-bsp/setserial/setserial_2.17.bb
+++ b/meta/recipes-bsp/setserial/setserial_2.17.bb
@@ -1,7 +1,6 @@
 SUMMARY = "Controls the configuration of serial ports"
 DESCRIPTION = "setserial is a program designed to set and/or report the configuration information associated with a serial port"
 HOMEPAGE = "http://setserial.sourceforge.net"
-AUTHOR = "Theodore Ts'o <tytso@mit.edu>"
 SECTION = "console/utils"
 
 LICENSE = "GPL-2.0-only"
diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index d1c6f7f54a..7b0f490768 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -5,7 +5,6 @@ with no specific configuration. This tool implements IPv4LL, "Dynamic Configurat
 IPv4 Link-Local Addresses" (IETF RFC3927), a protocol for automatic IP address \
 configuration from the link-local 169.254.0.0/16 range without the need for a central \
 server.'
-AUTHOR = "Lennart Poettering <lennart@poettering.net>"
 HOMEPAGE = "http://avahi.org"
 BUGTRACKER = "https://github.com/lathiat/avahi/issues"
 SECTION = "network"
diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
index 3f1b75d07d..09a0ab7d27 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
@@ -7,7 +7,6 @@ information."
 SECTION = "console/network"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS:${PN} = "bash sed util-linux-flock"
 
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index d93152cedd..cce2f57363 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -83,7 +83,6 @@
 
 SUMMARY = "Booting sequence and CPU,I/O usage monitor"
 DESCRIPTION = "Monitors where the system spends its time at start, creating a graph of all processes, disk utilization, and wait time."
-AUTHOR = "Wonhong Kwon <wonhong.kwon@lge.com>"
 HOMEPAGE = "https://github.com/mmeeks/bootchart"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=44ac4678311254db62edf8fd39cb8124"
diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb
index b745f349e7..4b5e77e6e3 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb
@@ -1,6 +1,5 @@
 SUMMARY = "YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order."
 HOMEPAGE = "https://pypi.org/project/ruamel.yaml/"
-AUTHOR = "Anthon van der Neut"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e5f41db57c3a8d3584b450d35985ad1"
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.26.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.26.bb
index bc83afb5b6..11a3c4f47e 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.26.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.26.bb
@@ -1,7 +1,6 @@
 
 SUMMARY = "Kexec fast reboot tools"
 DESCRIPTION = "Kexec is a fast reboot feature that lets you reboot to a new Linux kernel"
-AUTHOR = "Eric Biederman"
 HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kexec/"
 SECTION = "kernel/userland"
 LICENSE = "GPL-2.0-only"
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb
index b8001f4618..58eea0baf9 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb
@@ -3,7 +3,6 @@ DESCRIPTION = "Library for reading and writing files containing sampled \
 sound (such as MS Windows WAV and the Apple/SGI AIFF format) through \
 one standard library interface."
 HOMEPAGE = "https://libsndfile.github.io/libsndfile/"
-AUTHOR = "Erik de Castro Lopo"
 DEPENDS = "flac libogg libvorbis"
 SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.1-only"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 6055a9ebad..08a608bab1 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -2,7 +2,6 @@ SUMMARY = "Sound server for Linux and Unix-like operating systems"
 DESCRIPTION = "A general purpose sound server intended to run as a middleware \
 between your applications and your hardware devices, either using ALSA or OSS."
 HOMEPAGE = "http://www.pulseaudio.org"
-AUTHOR = "Lennart Poettering"
 SECTION = "libs/multimedia"
 
 # Most of PulseAudio code is under LGPL-2.1-or-later. There are a few
diff --git a/meta/recipes-support/libdaemon/libdaemon_0.14.bb b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
index de6ac388a3..089f19d1cd 100644
--- a/meta/recipes-support/libdaemon/libdaemon_0.14.bb
+++ b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
@@ -4,7 +4,6 @@ facilities for logging and a signal handler to enable graceful shutdown, \
 as well as file locking to ensure that only a single copy of a given daemon \
 is running at a time."
 SECTION = "libs"
-AUTHOR = "Lennart Poettering <lennart@poettering.net>"
 HOMEPAGE = "http://0pointer.de/lennart/projects/libdaemon/"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
diff --git a/meta/recipes-support/re2c/re2c_3.0.bb b/meta/recipes-support/re2c/re2c_3.0.bb
index f8f85125a3..f3d5ff0789 100644
--- a/meta/recipes-support/re2c/re2c_3.0.bb
+++ b/meta/recipes-support/re2c/re2c_3.0.bb
@@ -2,7 +2,6 @@ SUMMARY = "Tool for writing very fast and very flexible scanners"
 DESCRIPTION = "A free and open-source lexer generator for C, C++ and Go. It compiles regular expressions to determinisitic finite automata and encodes the automata in the form of a program in the target language. Unlike any other such tool, re2c focuses on generating high efficient code for regular expression matching. As a result this allows a much broader range of use than any traditional lexer."
 HOMEPAGE = "http://re2c.org/"
 BUGTRACKER = "https://github.com/skvadrik/re2c/issues"
-AUTHOR = "Marcus Börger <helly@users.sourceforge.net>"
 SECTION = "devel"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.16.bb b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
index b31b2662cf..d23d6be34e 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.16.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
@@ -1,7 +1,5 @@
 SUMMARY = "Random number generator daemon"
 DESCRIPTION = "Check and feed random data from hardware device to kernel"
-AUTHOR = "Philipp Rumpf, Jeff Garzik <jgarzik@pobox.com>, \
-          Henrique de Moraes Holschuh <hmh@debian.org>"
 HOMEPAGE = "https://github.com/nhorman/rng-tools"
 BUGTRACKER = "https://github.com/nhorman/rng-tools/issues"
 LICENSE = "GPL-2.0-only"
-- 
2.34.1


