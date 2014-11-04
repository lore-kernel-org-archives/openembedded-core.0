Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D84B165DEB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 11:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4Bd1vs009475; Tue, 4 Nov 2014 11:39:02 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id V0Z8nr3Hdrdx; Tue,  4 Nov 2014 11:39:02 +0000 (GMT)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4BcePq009425
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 4 Nov 2014 11:38:41 GMT
Received: from richard by ted with local (Exim 4.82)
	(envelope-from <richard@dan.rpsys.net>)
	id 1XlcS6-0000JS-7a; Tue, 04 Nov 2014 11:39:10 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Nov 2014 11:39:06 +0000
Message-Id: <1415101148-1142-6-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1415101148-1142-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1415101148-1142-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/8] kexec-tools: 2.0.7 -> 2.0.8
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
X-List-Received-Date: Tue, 04 Nov 2014 11:39:41 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb | 17 -----------------
 meta/recipes-kernel/kexec/kexec-tools_2.0.8.bb | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools_2.0.8.bb

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb
deleted file mode 100644
index f0ece0d..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.7.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require kexec-tools.inc
-export LDFLAGS = "-L${STAGING_LIBDIR}"
-EXTRA_OECONF = " --with-zlib=yes"
-
-SRC_URI += "file://kexec-tools-Refine-kdump-device_tree-sort.patch"
-
-SRC_URI[md5sum] = "2309ba43981cb6d39d07ac3a9aac30ab"
-SRC_URI[sha256sum] = "dde5c38be39882c6c91f0129647349c4e1943b077d3020af1970b481ee954eb0"
-
-PACKAGES =+ "kexec kdump vmcore-dmesg"
-
-ALLOW_EMPTY_${PN} = "1"
-RRECOMMENDS_${PN} = "kexec kdump vmcore-dmesg"
-
-FILES_kexec = "${sbindir}/kexec"
-FILES_kdump = "${sbindir}/kdump"
-FILES_vmcore-dmesg = "${sbindir}/vmcore-dmesg"
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.8.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.8.bb
new file mode 100644
index 0000000..559bc6a
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.8.bb
@@ -0,0 +1,17 @@
+require kexec-tools.inc
+export LDFLAGS = "-L${STAGING_LIBDIR}"
+EXTRA_OECONF = " --with-zlib=yes"
+
+SRC_URI += "file://kexec-tools-Refine-kdump-device_tree-sort.patch"
+
+SRC_URI[md5sum] = "45bd2bc676ae202579e4c185563126af"
+SRC_URI[sha256sum] = "95083c707577154a2241c5af0985f1eb3412d1ba208ef91813e9158b0a901179"
+
+PACKAGES =+ "kexec kdump vmcore-dmesg"
+
+ALLOW_EMPTY_${PN} = "1"
+RRECOMMENDS_${PN} = "kexec kdump vmcore-dmesg"
+
+FILES_kexec = "${sbindir}/kexec"
+FILES_kdump = "${sbindir}/kdump"
+FILES_vmcore-dmesg = "${sbindir}/vmcore-dmesg"
-- 
2.0.2


