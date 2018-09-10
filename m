Return-Path: <baptiste.durand@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2570D79715
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 15:14:53 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id 207-v6so21755151wme.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 08:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IE8qnCBF7AY8x3yPq1365FDWohuW8VXeF8fgtQAsNaU=;
	b=Cu7fczXrlR5Bte8c3dStGaMHyb8I6jTRLbrq7xkhgJ+yexWNhhR5TquOCbTZ2NUJy9
	i2kO+gNIS4QAnVlYnBCLIBtF0CmFxS1//uJahNqq7cZ2UVDYRPtENrIgUDrZt7+MUCmM
	CHA/7kQ3ZSmCSsp0+ZQXgccu4wT5nATVvBr6rocuB2dNAK75aIrZYJsexw0cmAK8Uwix
	oMMR8+MniLTAlbXshQC2EiwACJ9FUaA3Aa6sbKLT3SR9uWldrq99erCbUl0lSD4YGfGI
	nNBFpAZsW8URu93qJ9nCJJDUrmcK4Q8/i+L8FzRA9lkdlNAye9yHV/SNNm/SmHTBv33U
	olQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IE8qnCBF7AY8x3yPq1365FDWohuW8VXeF8fgtQAsNaU=;
	b=NCzXGiRSoE/Vdc+dd2G8skAv1BXmTJP+W4PS8sPVzFzgFY5oQgrQBjrmZEKi93wjYo
	DSTjLm/zGk8MyGWkWOUuH0OtsI/rns6sW1UgddS6DtmGzbSbdAyuAYNeqMCkQSnw5gXA
	BoWItoCugh3dcicFSZkOuIGghQ6cReX9GfuPlIRQJgDBEBugx4H+xk5pb6du+y8pGpBG
	mpsq6XE/oigDAQFs5dwBFBvNHmURUMtTFQxpOz/1bFP0E+e/Twblh5wHppzi1U5Hy5lU
	oI7H4qe/l+y4sLqwpigxlpEa82D9YVaoqxh2jMthQXHMqIkHAEPYRrAKFX76d7OBNDjY
	XQ+A==
X-Gm-Message-State: APzg51B8IDUsRghaL85VYguDlPukNJdxNwNxPSIwyv6xb3YECuB4f91u
	kTt/hE33DbT3SLx6bVwGM4BqC5U4
X-Google-Smtp-Source: ANB0VdbvoJ6D72a9d/tlxY/lnBPWLUkXquu/bV3+uoPcPLVACYi+pAgDSC001CDj2ckZEXp4NtTVBg==
X-Received: by 2002:a1c:d1c3:: with SMTP id
	i186-v6mr1142213wmg.5.1536592493395; 
	Mon, 10 Sep 2018 08:14:53 -0700 (PDT)
Received: from baba-localdomain.home
	(LFbn-REN-1-585-132.w81-53.abo.wanadoo.fr. [81.53.163.132])
	by smtp.gmail.com with ESMTPSA id
	g129-v6sm18771459wmf.42.2018.09.10.08.14.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 10 Sep 2018 08:14:52 -0700 (PDT)
From: Baptiste Durand <baptiste.durand@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2018 17:14:49 +0200
Message-Id: <20180910151449.9133-1-baptiste.durand@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2] minidlna: restore & fix recipe
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
X-List-Received-Date: Mon, 10 Sep 2018 15:14:53 -0000

Restore minidlna recipe and bump it to v1.2.1

Signed-off-by: Baptiste Durand <baptiste.durand@gmail.com>
---
 .../recipes-multimedia/minidlna/minidlna.inc  | 41 +++++++++++++++++++
 .../0001-Update-Gettext-version.patch         | 34 +++++++++++++++
 .../minidlna/minidlna_1.2.1.bb                |  4 ++
 3 files changed, 79 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna.inc
 create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
 create mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb

diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna.inc b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
new file mode 100644
index 000000000..187ff536a
--- /dev/null
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna.inc
@@ -0,0 +1,41 @@
+DESCRIPTION = "MiniDLNA (aka ReadyDLNA) is server software with the aim of \
+being fully compliant with DLNA/UPnP-AV clients."
+LICENSE = "GPL-2.0|BSD"
+DEPENDS = "ffmpeg flac libav jpeg sqlite3 libexif libogg libid3tag libvorbis"
+
+# because it depends on libav which has commercial flag
+LICENSE_FLAGS = "commercial"
+
+inherit gettext autotools-brokensep update-rc.d systemd
+
+SRC_URI = "git://git.code.sf.net/p/minidlna/git;branch=master;module=git \
+           file://minidlna-daemon.init.d \
+           file://minidlna.service \
+           file://0001-Update-Gettext-version.patch \
+           "
+
+S = "${WORKDIR}/git"
+
+# This remove "--exclude=autopoint" option from autoreconf argument to avoid
+# configure.ac:30: error: required file './ABOUT-NLS' not found
+EXTRA_AUTORECONF = ""
+
+do_install_append(){
+    install -d ${D}${sysconfdir}
+    install -m 0755 minidlna.conf ${D}${sysconfdir}
+
+# Systemd script
+    install -d ${D}${nonarch_base_libdir}/systemd/system
+    install -m 0755 ${WORKDIR}/minidlna.service ${D}${nonarch_base_libdir}/systemd/system
+
+# Sysvinit script
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/minidlna-daemon.init.d ${D}${sysconfdir}/init.d/minidlna
+
+}
+
+SYSTEMD_SERVICE_${PN} = "minidlna.service"
+
+INITSCRIPT_NAME = "minidlna"
+INITSCRIPT_PARAMS = "defaults 90"
+
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch b/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
new file mode 100644
index 000000000..c18095d42
--- /dev/null
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
@@ -0,0 +1,34 @@
+From a4290bf1887f9203288858ca76bdd20b2edf337a Mon Sep 17 00:00:00 2001
+From: Baptiste Durand <baptiste.durand@gmail.com>
+Date: Sun, 9 Sep 2018 20:50:41 +0200
+Subject: [PATCH] Update Gettext version
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Baptiste Durand <baptiste.durand@gmail.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f343d21..a556b33 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -14,7 +14,7 @@
+ # License along with MiniDLNA; if not, write to the Free Software
+ # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
+ # USA.
+-AC_INIT(MiniDLNA,1.1.3,,minidlna)
++AC_INIT(MiniDLNA,1.2.1,,minidlna)
+ #LT_INIT
+ 
+ AC_CANONICAL_TARGET
+@@ -28,7 +28,7 @@ m4_ifdef([AC_USE_SYSTEM_EXTENSIONS], [AC_USE_SYSTEM_EXTENSIONS])
+ 
+ AM_ICONV
+ AM_GNU_GETTEXT([external])
+-AM_GNU_GETTEXT_VERSION(0.18)
++AM_GNU_GETTEXT_VERSION(0.19)
+ 
+ # Checks for programs.
+ AC_PROG_AWK
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb b/meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb
new file mode 100644
index 000000000..fe6bebce2
--- /dev/null
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna_1.2.1.bb
@@ -0,0 +1,4 @@
+require ${BPN}.inc
+
+SRCREV = "v1_2_1"
+LIC_FILES_CHKSUM = "file://LICENCE.miniupnpd;md5=b0dabf9d8e0f871554e309d62ead8d2b"
-- 
2.17.1


