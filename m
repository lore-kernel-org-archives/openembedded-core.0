Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 955AA71975
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2016 21:12:45 +0000 (UTC)
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	uBRKo46G025570
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2016 14:50:04 -0600
Received: from us-aus-exch5.ni.corp.natinst.com (130.164.68.15) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 27 Dec 2016 14:50:03 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch5.ni.corp.natinst.com (130.164.68.15) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 27 Dec 2016 14:50:03 -0600
Received: from delcastillo2.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Tue, 27 Dec 2016 14:50:03 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Dec 2016 14:50:01 -0600
Message-ID: <1482871801-4357-3-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1482871801-4357-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1482871801-4357-1-git-send-email-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-27_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1612270333
Subject: [PATCH 2/2] opkg-utils: bump SRCREV to 0.3.4 tag
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
X-List-Received-Date: Tue, 27 Dec 2016 21:12:45 -0000
Content-Type: text/plain

* Add patch that removes hardcoded installation directories.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ...e-defined-bindir-and-mandir-as-installati.patch | 30 ++++++++++++++++++++++
 .../opkg-utils/opkg-utils/tar_ignore_error.patch   |  2 +-
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  8 +++---
 3 files changed, 36 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-Makefile-use-defined-bindir-and-mandir-as-installati.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Makefile-use-defined-bindir-and-mandir-as-installati.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Makefile-use-defined-bindir-and-mandir-as-installati.patch
new file mode 100644
index 0000000..6259f00
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Makefile-use-defined-bindir-and-mandir-as-installati.patch
@@ -0,0 +1,30 @@
+From af4a6e4666264661769e32874e9654e02e5eb019 Mon Sep 17 00:00:00 2001
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Date: Thu, 22 Dec 2016 16:15:56 -0600
+Subject: [opkg-utils PATCH] Makefile: use defined bindir and mandir as
+ installation dirs
+
+Upstream-Status: Pending
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+---
+ Makefile | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 92b45f1..9f0531c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -5,9 +5,6 @@ UTILS = opkg-build opkg-unbuild opkg-make-index opkg.py opkg-list-fields \
+ MANPAGES = opkg-build.1
+ 
+ DESTDIR=
+-PREFIX=/usr/local
+-bindir=$(PREFIX)/bin
+-mandir=$(PREFIX)/man
+ 
+ .SUFFIXES: .1
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
index 4dddb08..3824eb3 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
@@ -25,7 +25,7 @@ Index: git/opkg-build
  mkdir $tmp_dir
  
  echo $CONTROL > $tmp_dir/tarX
--( cd $pkg_dir && tar $ogargs -X $tmp_dir/tarX -cz $tarformat -f $tmp_dir/data.tar.gz . )
+-( cd $pkg_dir && tar $ogargs -X $tmp_dir/tarX -c --$compressor $tarformat -f $tmp_dir/data.tar.$cext . )
 -( cd $pkg_dir/$CONTROL && tar $ogargs -cz $tarformat -f $tmp_dir/control.tar.gz . )
 +
 +
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 19a852e..457405a 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -7,10 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
 
-SRCREV = "3ffece9bf19a844edacc563aa092fd1fbfcffeee"
-PV = "0.3.2+git${SRCPV}"
+SRCREV = "9228b38a81c94bd95ada3a6334404923d67bea66"
+PV = "0.3.4+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/opkg-utils"
+SRC_URI = "git://git.yoctoproject.org/opkg-utils \
+           file://0001-Makefile-use-defined-bindir-and-mandir-as-installati.patch \
+"
 SRC_URI_append_class-native = " file://tar_ignore_error.patch"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


