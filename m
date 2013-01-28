Received: from mail-pa0-f51.google.com ([209.85.220.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tzv5w-0005rD-67
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 21:14:24 +0100
Received: by mail-pa0-f51.google.com with SMTP id fb11so1723129pad.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 11:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=y/YfoBnGxayWo8Uwim8hr30f4UTVvSXTZZ1ohAGUOWs=;
	b=v/JyaG3wyUKF5FqIR5tTOC48mlgbX2D6tdOAveBG7fesRAzXOIjxb4nA6ch4BHw7iE
	9z81HrlDpRDA2W43pVtMZv61qio6nDuAprAoylGDqQia1u5qoI/3+rZKWSQnduWnEzSE
	LxJ96w7/J2ACdfVIHXMM7a+71Rr4dtB74UEDbS0LG1zBZTFjvbWY+fH0oc3qcARu5JJB
	S1kCHSll0AXbhcPZJzPVxEXN7smcU0jBaCjTFsd3FBprZ3dkczOBI7+5M/5nCP3kRywX
	nPhZO6iMehMogQnUfmHnOvompzR5zmOW7exaod3fku+YghZYRSmeOWROO6PqB429FHp5
	QChg==
X-Received: by 10.68.204.103 with SMTP id kx7mr40612172pbc.33.1359403120806;
	Mon, 28 Jan 2013 11:58:40 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id bg6sm7306579pab.33.2013.01.28.11.58.39
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 11:58:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 11:58:27 -0800
Message-Id: <25339fa58dfb08985df8f6b602e00df5d9d576c9.1359402980.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <9496d315c6d89dd6e4147cbdfd7b974fa4ed1d43.1359402980.git.raj.khem@gmail.com>
References: <9496d315c6d89dd6e4147cbdfd7b974fa4ed1d43.1359402980.git.raj.khem@gmail.com>
In-Reply-To: <cover.1359402980.git.raj.khem@gmail.com>
References: <cover.1359402980.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] systemd: Drop ppc build breakage patch for test-unit-file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 20:14:33 -0000

its been fixed differently upstream in 197

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...it-file-Add-libsystemd-daemon.la-to-LDADD.patch |   32 --------------------
 meta/recipes-core/systemd/systemd_197.bb           |    3 --
 2 files changed, 35 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-test-unit-file-Add-libsystemd-daemon.la-to-LDADD.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-test-unit-file-Add-libsystemd-daemon.la-to-LDADD.patch b/meta/recipes-core/systemd/systemd/0001-test-unit-file-Add-libsystemd-daemon.la-to-LDADD.patch
deleted file mode 100644
index 4cd2ee6..0000000
--- a/meta/recipes-core/systemd/systemd/0001-test-unit-file-Add-libsystemd-daemon.la-to-LDADD.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Submitted
-
-From f3e0a95b6b3fe516e43ec72045c2fad239184392 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 22 Jan 2013 18:25:46 -0800
-Subject: [PATCH] test-unit-file: Add libsystemd-daemon.la to LDADD
-
-test-unit-file links with libsystemd-core which needs
-sd_* symbols from libsystemd-daemon
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.am |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 7d5bd5a..884227a 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1270,7 +1270,8 @@ test_unit_file_CFLAGS = \
- 	$(DBUS_CFLAGS)
- 
- test_unit_file_LDADD = \
--	libsystemd-core.la
-+	libsystemd-core.la \
-+	libsystemd-daemon.la
- 
- test_log_SOURCES = \
- 	src/test/test-log.c
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 500c3ec..d4fee45 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -8,8 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 PROVIDES = "udev"
 
-PR = "r1"
-
 DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 libgcrypt"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
@@ -24,7 +22,6 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            ${UCLIBCPATCHES} \
            file://00-create-volatile.conf \
            file://0001-systemd-analyze-rewrite-in-C.patch \
-           file://0001-test-unit-file-Add-libsystemd-daemon.la-to-LDADD.patch \
           "
 SRC_URI[md5sum] = "56a860dceadfafe59f40141eb5223743"
 SRC_URI[sha256sum] = "e6857ea21ae24d7056e7b0f4c2aaaba73b8bf57025b8949c0a8af0c1bc9774b5"
-- 
1.7.9.5



