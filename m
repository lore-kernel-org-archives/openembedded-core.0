Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QALwX-0003bg-3M
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Apr 2011 14:46:41 +0200
Received: by eye27 with SMTP id 27so443104eye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2011 05:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=+aUGKE3Wn4z8qqMMPvAqasDgc0RVprtLrInjy8hFrSc=;
	b=HtS1keWajBOqQNIgicqJ/mHEO1r8bs95KPtOxiIg/3lq9T2WKAn3IGMkV2T80V15Wv
	mnY7ZYWl1hiTR6OfNRL3T0IhNvgViQfJD5+Gl8wVeIOPBEm4wxJwBx9PowQzGjAz9zPV
	OL4MoRuKYwRDbAWA7mfNCK6GAj3BsOsgU5LLg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=MareBtX/A7yKdwallWni77lW8vcyAFq50+U5jE/TomHgKYv7BKgkaZHCYPsP9Qhtv0
	64ZY0p3ozZHM2iOgsdjwOy1n+S1A0xmyp2RlsG0G4u1ydVgnWXDNa4MmH3+4PbzsOVx3
	caf9q1pC7QZRzJAUk4NeL3GW4v0i7YdyvLYL8=
Received: by 10.14.9.231 with SMTP id 79mr245713eet.241.1302785060008;
	Thu, 14 Apr 2011 05:44:20 -0700 (PDT)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id r48sm1150342eei.2.2011.04.14.05.44.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Apr 2011 05:44:19 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Apr 2011 14:44:19 +0200
Message-Id: <1302785059-27608-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] util-macros/preferred-xorg-versions: Update to 1.13.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Apr 2011 12:46:41 -0000

* Deps are taken from org.openembedded.dev
* Required by libx11 1.4.3+

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../distro/include/preferred-xorg-versions.inc     |    4 +-
 meta/recipes-graphics/xorg-util/util-macros.inc    |   18 +++++++++++++++
 .../xorg-util/util-macros_1.11.0.bb                |   24 --------------------
 .../xorg-util/util-macros_1.13.0.bb                |    7 +++++
 4 files changed, 27 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-util/util-macros.inc
 delete mode 100644 meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
 create mode 100644 meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb

diff --git a/meta/conf/distro/include/preferred-xorg-versions.inc b/meta/conf/distro/include/preferred-xorg-versions.inc
index b164b77..dd67d95 100644
--- a/meta/conf/distro/include/preferred-xorg-versions.inc
+++ b/meta/conf/distro/include/preferred-xorg-versions.inc
@@ -92,8 +92,8 @@ PREFERRED_VERSION_renderproto-nativesdk ?= "0.11.1"
 PREFERRED_VERSION_resourceproto ?= "1.1.1"
 PREFERRED_VERSION_scrnsaverproto ?= "1.2.1"
 PREFERRED_VERSION_trapproto ?= "3.4.3"
-PREFERRED_VERSION_util-macros ?= "1.11.0"
-PREFERRED_VERSION_util-macros-native ?= "1.11.0"
+PREFERRED_VERSION_util-macros ?= "1.13.0"
+PREFERRED_VERSION_util-macros-native ?= "1.13.0"
 PREFERRED_VERSION_videoproto ?= "2.3.1"
 PREFERRED_VERSION_windowswmproto ?= "1.0.4"
 PREFERRED_VERSION_x11perf ?= "1.5.2"
diff --git a/meta/recipes-graphics/xorg-util/util-macros.inc b/meta/recipes-graphics/xorg-util/util-macros.inc
new file mode 100644
index 0000000..06e3b0f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-util/util-macros.inc
@@ -0,0 +1,18 @@
+require xorg-util-common.inc
+
+SUMMARY = "X autotools macros"
+DESCRIPTION = "M4 autotools macros used by various X.org programs."
+LICENSE = "MIT & MIT-style"
+
+INC_PR = "r2"
+PE = "1"
+
+ALLOW_EMPTY = "1"
+BBCLASSEXTEND = "native nativesdk"
+
+DEPENDS = "libgpg-error"
+DEPENDS_virtclass-native = "gettext"
+DEPENDS_virtclass-nativesdk = "gettext"
+
+RDEPENDS_${PN}-dev = ""
+RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPV})"
diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
deleted file mode 100644
index 765a577..0000000
--- a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "X autotools macros"
-
-DESCRIPTION = "M4 autotools macros used by various X.org programs."
-
-require xorg-util-common.inc
-
-LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1970511fddd439b07a6ba789d28ff662"
-
-PE = "1"
-PR = "r0"
-
-# ${PN} is empty so we need to tweak -dev and -dbg package dependencies
-DEPENDS = "libgpg-error"
-DEPENDS_virtclass-native = "gettext"
-DEPENDS_virtclass-nativesdk = "gettext"
-
-RDEPENDS_${PN}-dev = ""
-RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPV})"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "8580021f3a9e242ab09d23d62e475d53"
-SRC_URI[sha256sum] = "212c3d14474d7cffdbc22437d4896211a5dce6b99b02b96229c9be7d963c90cf"
diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
new file mode 100644
index 0000000..0eff870
--- /dev/null
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
@@ -0,0 +1,7 @@
+require util-macros.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "31e9ddcbc1d8bc8c09ab180443974dd1"
+SRC_URI[archive.sha256sum] = "7bff944fb120192e7fe1706e9c0b7e41666e7983ce3e2bdef0b7734392d9e695"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1970511fddd439b07a6ba789d28ff662"
-- 
1.7.3.4



