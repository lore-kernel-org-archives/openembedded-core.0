Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF337708E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 01:26:25 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id a20so3848159pag.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 17:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vB6UItG4wEhIIEeKcas2KfO9uZoHrLr6HkS9LqfSV/U=;
	b=d105xXcfM4LYgaBW4Pl0bJP01//ru8pzGtW7026NJpqH9mHwzfj88ycvuZ/07Gk+hR
	thD83hNy87zKZm2IAYMqcCF7rvL/CLcsUdysOut+3wBuj+rNRJvtJBFTd+S/FLZMbyFD
	1LDnGN2ItSohBB7S9WXdwWWP/MY/iSZU3qvPGifbNMOKmiGFr/oKHVWiGeUshNy1iuQR
	jdNebUzBP7tVpoNlZSPHdDUrJ0NQ0jL4OOuah0M58fBveQZrb24y6JTIEu8wMwSM5ZCX
	ZYuS8pulCTAMiZOewnL9MxkKaCBMuxtWpFEvzkV616egjdyvnnuzSgm9CE5u3l1Tx1ad
	Pn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vB6UItG4wEhIIEeKcas2KfO9uZoHrLr6HkS9LqfSV/U=;
	b=FvRa31E+aAAzYS7JyTMV4zK6qgND0rxnJ5bLvmbduRFLHukp+ANJJvLVtpWtW2HxB+
	0Qv1V89/VZyYajML2gGM1hdrtEozvSRDbpuw6z810jtJX9nnckAOFuJDwNK/PeMz5Tf/
	XNp2Lcnh3zVFvL9TMFni5oKfFlC4W6JefcQLg9HR0eQwj9JXKGRSvL0x1jCi2uyO3x/V
	ZTHG/knx8HcgpUkFe00Cd/rVURlw19yIC7kHO2H1yNCJDdtEdnDOK/4bTXUN1YnhY3fL
	/V5UA3kAtUpHOTDEWaDoCvdiKtRKI73e6sAO8M90S7EVESSkptFydXx/Dtk6NAhzzSJ2
	P+Yg==
X-Gm-Message-State: AG10YOQbSPuLAawDnawe8uthTdmgVMy0YdsChlrQdW3pMmXm1IHAgLYvB5fgOHgDVTrawQ==
X-Received: by 10.66.236.69 with SMTP id us5mr8700112pac.93.1453512386737;
	Fri, 22 Jan 2016 17:26:26 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	qz9sm12302299pab.39.2016.01.22.17.26.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 17:26:25 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2016 17:26:02 -0800
Message-Id: <1453512366-11405-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453512366-11405-1-git-send-email-armccurdy@gmail.com>
References: <1453512366-11405-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/7] sqlite: formatting improvements, move more stuff into sqlite3.inc
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
X-List-Received-Date: Sat, 23 Jan 2016 01:26:26 -0000

Reformatting only, no functional changes.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/sqlite/sqlite3.inc       | 23 +++++++++++++++++++++--
 meta/recipes-support/sqlite/sqlite3_3.10.0.bb | 20 ++------------------
 2 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index ac19be9..540d2b6 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -1,7 +1,21 @@
 SUMMARY = "Embeddable SQL database engine"
 HOMEPAGE = "http://www.sqlite.org"
 SECTION = "libs"
-LICENSE = "PD"
+
+PE = "3"
+
+def sqlite_download_version(d):
+    pvsplit = d.getVar('PV', True).split('.')
+    if len(pvsplit) < 4:
+        pvsplit.append('0')
+    return pvsplit[0] + ''.join([part.rjust(2,'0') for part in pvsplit[1:]])
+
+SQLITE_PV = "${@sqlite_download_version(d)}"
+
+S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
+
+UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
+UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
 
 inherit autotools pkgconfig
 
@@ -16,14 +30,19 @@ EXTRA_OECONF = "--enable-shared --enable-threadsafe --disable-editline"
 BUILD_CFLAGS += "-DUSE_PREAD"
 TARGET_CFLAGS += "-DUSE_PREAD"
 
+# Provide column meta-data API
+BUILD_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
+TARGET_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
+
 PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN}-dbg lib${BPN}-staticdev ${PN}"
 
 FILES_${PN} = "${bindir}/*"
 FILES_lib${BPN} = "${libdir}/*.so.*"
 FILES_lib${BPN}-dev = "${libdir}/*.la ${libdir}/*.so \
-	                	   ${libdir}/pkgconfig ${includedir}"
+                       ${libdir}/pkgconfig ${includedir}"
 FILES_lib${BPN}-doc = "${docdir} ${mandir} ${infodir}"
 FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
+
 AUTO_LIBNAME_PKGS = "${MLPREFIX}lib${BPN}"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.10.0.bb b/meta/recipes-support/sqlite/sqlite3_3.10.0.bb
index 092f782..c183692 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.10.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.10.0.bb
@@ -1,27 +1,11 @@
 require sqlite3.inc
 
+LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
 
-def sqlite_download_version(d):
-    pvsplit = d.getVar('PV', True).split('.')
-    if len(pvsplit) < 4:
-        pvsplit.append('0')
-    return pvsplit[0] + ''.join([part.rjust(2,'0') for part in pvsplit[1:]])
-
-PE = "3"
-SQLITE_PV = "${@sqlite_download_version(d)}"
 SRC_URI = "http://www.sqlite.org/2016/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://parallel.patch \
-          "
+"
 
 SRC_URI[md5sum] = "274364e6ca5c1104d42912f11e61ed26"
 SRC_URI[sha256sum] = "43cc292d70711fa7580250c8a1cd7c64813a4a0a479dbd502cce5f10b5d91042"
-
-UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
-UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
-
-S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
-
-# Provide column meta-data API
-BUILD_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
-TARGET_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
-- 
1.9.1


