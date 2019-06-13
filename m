Return-Path: <prvs=7067777c77=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 6FAEC7E82E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 20:17:04 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x5DKFmPs001262; Thu, 13 Jun 2019 15:17:05 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2t3e2pav53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 13 Jun 2019 15:17:05 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	x5DKH4ln003105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2019 15:17:04 -0500
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 13 Jun 2019 15:17:04 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 13 Jun 2019 15:17:03 -0500
Received: from delcastillo3.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Thu, 13 Jun 2019 15:17:03 -0500
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jun 2019 15:17:01 -0500
Message-ID: <20190613201701.31014-3-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190613201701.31014-1-alejandro.delcastillo@ni.com>
References: <20190613201701.31014-1-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-13_12:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH 2/2] opkg-utils: upgrade to version 0.4.1
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
X-List-Received-Date: Thu, 13 Jun 2019 20:17:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Drop 0001-opkg-build-do-not-set-mtime-on-data.tar.X.patch
- Drop 0001-opkg-list-fields-fix-to-print-the-fields-again.patch

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ...build-do-not-set-mtime-on-data.tar.X.patch | 33 ---------------
 ...fields-fix-to-print-the-fields-again.patch | 41 -------------------
 ...pkg-utils_0.4.0.bb => opkg-utils_0.4.1.bb} |  6 +--
 3 files changed, 2 insertions(+), 78 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-do-not-set-mtime-on-data.tar.X.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-list-fields-fix-to-print-the-fields-again.patch
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.4.0.bb => opkg-utils_0.4.1.bb} (89%)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-do-not-set-mtime-on-data.tar.X.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-do-not-set-mtime-on-data.tar.X.patch
deleted file mode 100644
index 6c058c71d7..0000000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-do-not-set-mtime-on-data.tar.X.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 42afc1f652d28dce3c5b9915d0cd3087a144e445 Mon Sep 17 00:00:00 2001
-From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-Date: Mon, 18 Feb 2019 11:25:43 -0600
-Subject: [PATCH] opkg-build: do not set mtime on data.tar.X
-
-Opkg should make sure the binaries it creates are created in a
-repoducibe way, but it shouldn't modify the mtime of the binaries it
-consumes. Doing so has side effects, for exmaple, Python pyc files are
-invalidated.
-
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-
-Upstream-Status: Submitted
----
- opkg-build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/opkg-build b/opkg-build
-index 13782ee..363cd01 100755
---- a/opkg-build
-+++ b/opkg-build
-@@ -301,7 +301,7 @@ build_date="${SOURCE_DATE_EPOCH:-$(date +%s)}"
- 
- ( cd $pkg_dir/$CONTROL && find . -type f > $tmp_dir/control_list )
- ( cd $pkg_dir && find . -path ./$CONTROL -prune -o -print > $tmp_dir/file_list )
--( cd $pkg_dir && tar $ogargs $tsortargs --no-recursion --mtime=@$build_date -c $tarformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
-+( cd $pkg_dir && tar $ogargs $tsortargs --no-recursion -c $tarformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
- ( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --no-recursion --mtime=@$build_date -c $tarformat -T $tmp_dir/control_list | gzip $zipargs > $tmp_dir/control.tar.gz )
- rm $tmp_dir/file_list
- rm $tmp_dir/control_list
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-list-fields-fix-to-print-the-fields-again.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-list-fields-fix-to-print-the-fields-again.patch
deleted file mode 100644
index deaf561d1e..0000000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-list-fields-fix-to-print-the-fields-again.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From df675c91f4b33490f0fa831b11162bdb0e2ff550 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 23 May 2019 20:50:45 +0000
-Subject: [PATCH] opkg-list-fields: fix to print the fields again
-
-* printing opkg.Package directly doesn't return anything useful now
-  <opkg.Package object at 0x7fd49e9f2780>
-
-* we need to call Package.print() function and specify which checksums
-  to print, we can include both md5 and sha256 for opkg-list-fields
-
-* it was changed in this commit:
-  commit 601d691dd80ef494aef069017edc5bf80aa883a1
-  Author: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-  Date:   Wed Dec 19 11:40:15 2018 -0600
-
-    opkg-make-index: add sha256sum support
-
-  which replaced the modified __str__ function with print(self, checksum)
-
-Upstream-Status: Backport [http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/commit/?id=5163a74a59d54b2a8374414435ece9d542dbd5e2]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- opkg-list-fields | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/opkg-list-fields b/opkg-list-fields
-index c14a90f..8a5a588 100755
---- a/opkg-list-fields
-+++ b/opkg-list-fields
-@@ -11,5 +11,4 @@ def usage():
- if (len(sys.argv) < 2):
-      usage()
- 
--print(opkg.Package(sys.argv[1]))
--
-+print(opkg.Package(sys.argv[1]).print(('md5','sha256')))
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.0.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
similarity index 89%
rename from meta/recipes-devtools/opkg-utils/opkg-utils_0.4.0.bb
rename to meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
index b2fb760267..4be7b16d8a 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.0.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
@@ -9,14 +9,12 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 
 SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \
            file://0001-Switch-all-scripts-to-use-Python-3.x.patch \
-           file://0001-opkg-build-do-not-set-mtime-on-data.tar.X.patch \
-    file://0001-opkg-list-fields-fix-to-print-the-fields-again.patch \
 "
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
 
-SRC_URI[md5sum] = "6e1c2eae96239520a8eb3d05372773ea"
-SRC_URI[sha256sum] = "8153f4e5dadde422d35feaf86bf595266af9d0037389bc418fa87feb0437efb3"
+SRC_URI[md5sum] = "8c140f835b694a0c27cfb23d2426a02b"
+SRC_URI[sha256sum] = "9ea9efdd9fe13661ad251e3a2860c1c93045adcfaa6659c3e86d9748ecda3b6e"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.21.0


