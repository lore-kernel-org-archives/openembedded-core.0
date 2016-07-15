Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DDA3373197
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 16:36:35 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i5so2841971wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 09:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1Cc/cNpwefcWOPH2/b6AisCL/2ztABiyEXuoAIHDH88=;
	b=kv06B9VhGbDNmoIxI4g7qjC6hueQWdLxauFpNXDc7fSO4tMOepLrN8dPSKBIFLX2YU
	Iw+zxxGmlblhem74D4Jvd0nd90GrBz8egk4ALad4WFP2gD7TXphXyVGL9V5PWqv6Dcyx
	l2v6sNawBaIU05GyeCIaqNsAGhL5eQ3KUvG5EJhysIxq0Gf5Fm6e/YYEdLsW+eRIBWZJ
	U/M+BcMeAeL49RhfcGsVLRWKoFgX6dhsQ26S/za5fEwv13ES9OmqHuL4rJWlLNDIbYKn
	U5Op+kYixqyBdeCnprc3qFNV6kxGAWh3S+4rBKRAKa09B1HH/M8q76azd9/83mBLhKq/
	uE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1Cc/cNpwefcWOPH2/b6AisCL/2ztABiyEXuoAIHDH88=;
	b=Gq9i0N3udcdboI9KTE7khcnVC28hijAqcqvj930z3kPn1ZsvPgRQGdEONt6kpCeVhw
	hEuW9wmkoE6IDWIZloz33L2/TEyZMF3NmWmuojzGXuRN1HLqVw/ocBvOJR6gBjfbpw7G
	OW82hrQYLorG5R9LR/OwGKHaivFfkp3KsDWFLGjo35AvfJ4SPrgCTdOdRIOZcCuR9hDn
	sAbnzrNKKMNWjustOVRB6YKJTp3YyOKajbYXvSOQyOrf8hlEzdtqQFdDhfLubkV0Wn5G
	rPSHX7xmv37l+YQ+l1wOyW2gL1FbFUORrHIDtLSdiRktOd6WdhsYWWYc3ekuURvpnKtq
	kadA==
X-Gm-Message-State: ALyK8tLJ8zuRpz9OBwVUux4f+2rFXRHrZvjq8hn47fSix2Mw7UVKNmMb/QGm3zVC27Qoxw==
X-Received: by 10.194.134.231 with SMTP id pn7mr1815052wjb.36.1468600595973;
	Fri, 15 Jul 2016 09:36:35 -0700 (PDT)
Received: from localhost.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id
	um3sm1546807wjb.44.2016.07.15.09.36.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 09:36:35 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 17:36:33 +0100
Message-Id: <20160715163633.6854-3-eu@felipetonello.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160715163633.6854-1-eu@felipetonello.com>
References: <20160715163633.6854-1-eu@felipetonello.com>
Subject: [PATCH 2/2] juce: Added support for JUCE framework
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
X-List-Received-Date: Fri, 15 Jul 2016 16:36:36 -0000

See below for the official README from JUCE.

For TL;DRs: JUCE is a well known and widely used C++ Framework for audio
applications. It has good support for Linux and ARM.

A typical JUCE application recipe will only contain this skeleton:

inherit juce

SRC_URI = "..."

JUCE_JUCERS = "${B}/Embedded/equator-embedded.jucer"

do_compile() {
  CONFIG=Release oe_runmake
}

do_install() {
  install ...
}

======

From the README:

JUCE (Jules' Utility Class Extensions) is an all-encompassing
C++ framework for developing cross-platform software.

It contains pretty much everything you're likely to need to create
most applications, and is particularly well-suited for building
highly-customised GUIs, and for handling graphics and sound.

Most JUCE modules are shared under the GNU Public Licence
(GPLv2, v3, and the AGPLv3). This means that the code can
be freely copied and distributed, and costs nothing to use
in other GPL applications. One module (the juce_core module)
is permissively licensed under the ISC.

For more information, visit the website:
http://www.juce.com)

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/classes/juce.bbclass                  | 37 +++++++++++++++++++++++++++
 meta/recipes-devtools/juce/projucer_git.bb | 41 ++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 meta/classes/juce.bbclass
 create mode 100644 meta/recipes-devtools/juce/projucer_git.bb

diff --git a/meta/classes/juce.bbclass b/meta/classes/juce.bbclass
new file mode 100644
index 000000000000..8fba23863f2d
--- /dev/null
+++ b/meta/classes/juce.bbclass
@@ -0,0 +1,37 @@
+inherit pkgconfig
+
+JUCE_X11_DEPS = "libx11 libxext libxinerama libxinerama libxrandr libxcursor freetype"
+JUCE_DEPS = " \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${JUCE_X11_DEPS}', '', d)} \
+  alsa-lib \
+  curl \
+"
+DEPENDS_prepend = "projucer-native ${JUCE_DEPS} "
+
+export OE_JUCE_INTROJUCER = "${STAGING_BINDIR_NATIVE}/Projucer"
+
+juce_do_configure() {
+  if [ -z "${JUCE_JUCERS}" ]; then
+    JUCERS=`find . -type f -iname "*.jucer"` && IFS=$'\n'
+  else
+    JUCERS="${JUCE_JUCERS}"
+  fi
+
+  if [ -z "$JUCERS" ]; then
+    die "JUCE_JUCERS not set and no profiles found in $PWD"
+  fi
+
+  # XXX: Hack for Projucer, since it requires a X Display even when running in
+  # console mode. This will be fixed in future. Most cases DISPLAY=:0 will just work,
+  # the only case why we have JUCE_DISPLAY variable, is in case of a build system,
+  # such as jenkins, that can have multiple virtual X server running for each build.
+  test -z "${JUCE_DISPLAY}" && export DISPLAY=:0 || export DISPLAY=${JUCE_DISPLAY}
+
+  for i in $JUCERS; do
+    ${OE_JUCE_PROJUCER} --resave $i
+  done
+}
+
+EXPORT_FUNCTIONS do_configure
+
+addtask configure after do_unpack do_patch before do_compile
diff --git a/meta/recipes-devtools/juce/projucer_git.bb b/meta/recipes-devtools/juce/projucer_git.bb
new file mode 100644
index 000000000000..74389d477ada
--- /dev/null
+++ b/meta/recipes-devtools/juce/projucer_git.bb
@@ -0,0 +1,41 @@
+SUMMARY = "JUCE's Projucer"
+DESCRIPTION = "Projucer is used to build and generate support files and build infrastructure for all \
+JUCE supported platforms, including Linux and Embedded Linux."
+SECTION = "utils"
+HOMEPAGE = "http://juce.com/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://README.txt;md5=9ab765ccda8890efc753f287911a1958"
+
+inherit pkgconfig
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-git:"
+
+DEPENDS = "libx11 libxext libxinerama libxrandr libxcursor freetype alsa-lib curl"
+
+SRCREV = "a8a7fa28e2e9cb19db6a27fcccb567a8ccfe6109"
+BRANCH = "develop"
+SRC_URI = "git://github.com/julianstorer/JUCE.git;protocol=https;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+PV = "4.2.3+git${SRCPV}"
+
+JUCE_PROJUCER_BUILD_PATH = "${B}/extras/Projucer/Builds"
+JUCE_PROJUCER_MAKEFILE_PATH = "${JUCE_PROJUCER_BUILD_PATH}/LinuxMakefile"
+JUCE_PROJUCER = "${JUCE_PROJUCER_MAKEFILE_PATH}/build/Projucer"
+
+do_configure() {
+  cd ${JUCE_PROJUCER_MAKEFILE_PATH}
+  CONFIG=Release oe_runmake clean
+}
+
+do_compile() {
+  cd ${JUCE_PROJUCER_MAKEFILE_PATH}
+  CONFIG=Release oe_runmake
+}
+
+do_install() {
+  install -d ${D}${bindir}
+  install -m 0755 ${JUCE_PROJUCER} ${D}${bindir}
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.9.0


