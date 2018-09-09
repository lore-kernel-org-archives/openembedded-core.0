Return-Path: <baptiste.durand@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 97CCC6093A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Sep 2018 19:12:06 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q8-v6so19241636wmq.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Sep 2018 12:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gAR8tvChL4gEYK49DJQo8jvsLeo79hbyuVEmlhyAHoc=;
	b=YLumRrt1u3M1NPO7L5a+aTWlXwZVtOMuZuieWJ930Fj9pdH4CQXSRyOOpBiMyAXXQq
	q08eExe792UsZCxQWhPjJtZ5/8xugXlQYjMc7Xk+pUwvuDoiaktim+3jLv3RaQ1yUl6+
	rKAmzvr0V30xtFOfMxrvN6xV/Yp8CIRjhShOAx0ereHtkaBvuYDsOEWKvM2EpauG7hGa
	qA8Cs6DLNyi6/9s3bAZgK1NIQOMUaimz667qOXUBEVBkfDvReb+sbuuLwKsg5C+vIi88
	0bnGHc7EhPJhmBpHwmxo+EVh8ttbYMzPtiL26ZzQSQXfuMiiQgmzZzKFzKTFSVr/cVxQ
	RREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gAR8tvChL4gEYK49DJQo8jvsLeo79hbyuVEmlhyAHoc=;
	b=dBlphl2lgV3fvL3R+A2fszsL+/U4qyRx7J8OpP+INHTDPxS/ybgxDZAuQehSnwQGoK
	F0kyEqyMlRJcexjPfZPm3aCDb+Lx2Rmto54ui28RM4UbNIGVp4ZbUqkf2DtFW9d2cOHx
	cTZhOySOe1uFTPTzCvS7WX2jKTFcCNAX/y6Atd/KqXTAnDYgKxwI0DIZ2wHIF8MA13P6
	F8UAwg27ErCGhQKar0thdvYjXmpQGQJP/bEaYK0FL4C9rajbiPczuc01B9ykqjcf/YXA
	i42XkFEU0I6YpNpjSgmubLq4YL9R6xq+kKlgw/v+3EZGipQOaCzKtdPIRM3joc8RDkpd
	o6+Q==
X-Gm-Message-State: APzg51AnATBLxUxSofCR+vs5WzS/05x92sPeA1kSZouDoim/h/OvjF1m
	cuNF2nX+ouYF3h8NUU2N6adwzZIi
X-Google-Smtp-Source: ANB0VdY3hR/jYzTt/7sE9eKYGA4zmVdVGPiqJ1bIp6oh5x831Rv3rzVQGF9GwRDqkAjJYHIT5qFLKg==
X-Received: by 2002:a1c:2283:: with SMTP id
	i125-v6mr11143789wmi.28.1536520326822; 
	Sun, 09 Sep 2018 12:12:06 -0700 (PDT)
Received: from baba-localdomain.home
	(LFbn-REN-1-585-132.w81-53.abo.wanadoo.fr. [81.53.163.132])
	by smtp.gmail.com with ESMTPSA id
	c12-v6sm10502782wrr.6.2018.09.09.12.12.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 09 Sep 2018 12:12:06 -0700 (PDT)
From: Baptiste Durand <baptiste.durand@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Sep 2018 21:11:14 +0200
Message-Id: <20180909191114.32349-1-baptiste.durand@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] minidlna: restore & fix recipe
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
X-List-Received-Date: Sun, 09 Sep 2018 19:12:06 -0000

Restore minidlna recipe and bump it to v1.2.1

Signed-off-by: Baptiste Durand <baptiste.durand@gmail.com>
---
 .../recipes-multimedia/minidlna/minidlna.inc  | 41 +++++++++++++++++++
 .../0001-Update-Gettext-version.patch         | 32 +++++++++++++++
 .../minidlna/minidlna_1.2.1.bb                |  4 ++
 3 files changed, 77 insertions(+)
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
index 000000000..d6de9f164
--- /dev/null
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna/0001-Update-Gettext-version.patch
@@ -0,0 +1,32 @@
+From a4290bf1887f9203288858ca76bdd20b2edf337a Mon Sep 17 00:00:00 2001
+From: Baptiste Durand <baptiste.durand@gmail.com>
+Date: Sun, 9 Sep 2018 20:50:41 +0200
+Subject: [PATCH] Update Gettext version
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


