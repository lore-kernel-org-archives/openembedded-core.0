Return-Path: <prvs=18989725c3=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 100C26C14B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 01:04:05 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	wBQNqd6o026370; Wed, 26 Dec 2018 17:57:32 -0600
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2pm55x9mhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 26 Dec 2018 17:57:32 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	wBQNvVYq004263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 26 Dec 2018 17:57:31 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 26 Dec 2018 17:57:31 -0600
Received: from delcastillo3.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Wed, 26 Dec 2018 17:57:31 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Dec 2018 17:59:05 -0600
Message-ID: <20181226235906.22007-3-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181226235906.22007-1-alejandro.delcastillo@ni.com>
References: <20181226235906.22007-1-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-12-26_13:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Cc: Michael Hansen <michael.j.hansen@hp.com>, Mike Crowe <mac@mcrowe.com>,
	Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Subject: [PATCH 2/3] opkg-utils: upgrade to version 0.4.0
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
X-List-Received-Date: Thu, 27 Dec 2018 01:04:06 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Drop patches already merged upstream.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ...me-on-versions-of-tar-which-support-.patch | 51 -------------------
 ...Switch-all-scripts-to-use-Python-3.x.patch |  5 +-
 ...rnatives-Fix-link-relocation-support.patch | 40 ---------------
 ...ocal-time-for-build_date-since-opkg-.patch | 44 ----------------
 .../opkg-utils/opkg-utils/pigz.patch          | 51 -------------------
 .../opkg-utils/tar_ignore_error.patch         | 48 -----------------
 .../opkg-utils/opkg-utils/threaded-xz.patch   | 18 -------
 ...pkg-utils_0.3.6.bb => opkg-utils_0.4.0.bb} | 10 +---
 8 files changed, 5 insertions(+), 262 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-Fix-link-relocation-support.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/pigz.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/threaded-xz.patch
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.3.6.bb => opkg-utils_0.4.0.bb} (82%)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch
deleted file mode 100644
index 6b7ca7da3e..0000000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From ef5db062b7d25e6070acc6922ea48f50491313b5 Mon Sep 17 00:00:00 2001
-From: Michael Hansen <michael.j.hansen@hp.com>
-Date: Mon, 26 Feb 2018 09:42:56 -0800
-Subject: [PATCH 1/2] Only use --sort=name on versions of tar which support it.
- This fixes compatibility with bsdtar and old versions of GNU tar (e.g.
- RHEL6).
-
-Signed-off-by: Michael Hansen <michael.j.hansen@hp.com>
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-Upstream-Status: Backport
-
----
- opkg-build | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-Index: opkg-utils-0.3.6/opkg-build
-===================================================================
---- opkg-utils-0.3.6.orig/opkg-build
-+++ opkg-utils-0.3.6/opkg-build
-@@ -232,6 +232,11 @@ if [ $compressor = "gzip" ] ; then
- 	compressorargs=$zipargs
- fi
- 
-+tsortargs=
-+if tar --help 2>&1 | grep -- "--sort=" > /dev/null; then
-+	tsortargs="--sort=name"
-+fi
-+
- shift $(($OPTIND - 1))
- 
- # continue on to process additional arguments
-@@ -280,8 +285,8 @@ mkdir $tmp_dir
- build_date="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%d)"
- 
- echo $CONTROL > $tmp_dir/tarX
--( cd $pkg_dir && tar $ogargs --sort=name --mtime=$build_date -X $tmp_dir/tarX -c $tarformat . | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
--( cd $pkg_dir/$CONTROL && tar $ogargs --sort=name --mtime=$build_date -c $tarformat . | gzip $zipargs > $tmp_dir/control.tar.gz )
-+( cd $pkg_dir && tar $ogargs $tsortargs --mtime=$build_date -X $tmp_dir/tarX -c $tarformat . | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
-+( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --mtime=$build_date -c $tarformat . | gzip $zipargs > $tmp_dir/control.tar.gz )
- rm $tmp_dir/tarX
- 
- echo "2.0" > $tmp_dir/debian-binary
-@@ -296,7 +301,7 @@ rm -f $pkg_file
- if [ "$outer" = "ar" ] ; then
-   ( cd $tmp_dir && ar -crf $pkg_file ./debian-binary ./control.tar.gz ./data.tar.$cext )
- else
--  ( cd $tmp_dir && tar -c --sort=name --mtime=$build_date $tarformat ./debian-binary ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file )
-+  ( cd $tmp_dir && tar -c $tsortargs --mtime=$build_date $tarformat ./debian-binary ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file )
- fi
- 
- rm $tmp_dir/debian-binary $tmp_dir/data.tar.$cext $tmp_dir/control.tar.gz
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Switch-all-scripts-to-use-Python-3.x.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Switch-all-scripts-to-use-Python-3.x.patch
index c36ae2ffda..691ed50c2b 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Switch-all-scripts-to-use-Python-3.x.patch
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-Switch-all-scripts-to-use-Python-3.x.patch
@@ -64,8 +64,9 @@ index 3f757f6..2988f9f 100755
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- from __future__ import absolute_import
- from __future__ import print_function
+ """
+    Utility to create opkg compatible indexes
+ """
  
 diff --git a/opkg-show-deps b/opkg-show-deps
 index 153f21e..4e18b4f 100755
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-Fix-link-relocation-support.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-Fix-link-relocation-support.patch
deleted file mode 100644
index 9dc488b7aa..0000000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-Fix-link-relocation-support.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 18562ccae6996431d37767653b061d4e9e1b9424 Mon Sep 17 00:00:00 2001
-From: Niko Mauno <niko.mauno@iki.fi>
-Date: Sun, 11 Nov 2018 15:50:22 +0200
-Subject: [opkg-utils PATCH] update-alternatives: Fix link relocation support
-
-Commit fcb26339000021eb9bb711aa264247aebcfdd4ae which added Debian-style
-support for link relocation tries to relocate symbolic link on host OS,
-resulting in following-like error when two alternative packages have
-symbolic link source located in different directories (/bin/rev ->
-/bin/busybox.nosuid and /usr/bin/rev -> /usr/bin/rev.util-linux):
-
-  update-alternatives: renaming rev link from /bin/rev to /usr/bin/rev
-  mv: cannot stat '/bin/rev': No such file or directory
-
-Fix the issue by prefixing 'olink' and 'link' variable references with
-path to targeted root filesystem's root directory.
-
-Upstream-Status: Submitted [opkg-utils]
-
-Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
----
- update-alternatives | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/update-alternatives b/update-alternatives
-index 89a440b..d4fa7eb 100644
---- a/update-alternatives
-+++ b/update-alternatives
-@@ -58,7 +58,7 @@ register_alt() {
- 			local link_str=`echo $link | protect_slashes`
- 			sed -e "1s/.*/$link_str/" $ad/$name > $ad/$name.new
- 			mv $ad/$name.new $ad/$name
--			mv $olink $link
-+			mv $OPKG_OFFLINE_ROOT$olink $OPKG_OFFLINE_ROOT$link
- 		fi
- 	else
- 		echo "$link" > "$ad/$name"
--- 
-2.19.1
-
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch
deleted file mode 100644
index e338914b09..0000000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 5727826b51cf99feaff3483a9df8af2043e7efc1 Mon Sep 17 00:00:00 2001
-From: Michael Hansen <michael.j.hansen@hp.com>
-Date: Mon, 26 Feb 2018 10:17:01 -0800
-Subject: [PATCH 2/2] opkg-build: Use local time for build_date, since opkg
- extracts files assuming local time rather than UTC. Also increase resolution
- of build date down to the second, rather than clamping to midnight of the
- current date.
-
-Signed-off-by: Michael Hansen <michael.j.hansen@hp.com>
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-Upstream-Status: Backport
-
----
- opkg-build | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-Index: opkg-utils-0.3.6/opkg-build
-===================================================================
---- opkg-utils-0.3.6.orig/opkg-build
-+++ opkg-utils-0.3.6/opkg-build
-@@ -282,11 +282,11 @@ fi
- tmp_dir=$dest_dir/IPKG_BUILD.$$
- mkdir $tmp_dir
- 
--build_date="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%d)"
-+build_date="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" "+%Y-%m-%d %H:%M:%S")"
- 
- echo $CONTROL > $tmp_dir/tarX
--( cd $pkg_dir && tar $ogargs $tsortargs --mtime=$build_date -X $tmp_dir/tarX -c $tarformat . | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
--( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --mtime=$build_date -c $tarformat . | gzip $zipargs > $tmp_dir/control.tar.gz )
-+( cd $pkg_dir && tar $ogargs $tsortargs --mtime="$build_date" -X $tmp_dir/tarX -c $tarformat . | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
-+( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --mtime="$build_date" -c $tarformat . | gzip $zipargs > $tmp_dir/control.tar.gz )
- rm $tmp_dir/tarX
- 
- echo "2.0" > $tmp_dir/debian-binary
-@@ -301,7 +301,7 @@ rm -f $pkg_file
- if [ "$outer" = "ar" ] ; then
-   ( cd $tmp_dir && ar -crf $pkg_file ./debian-binary ./control.tar.gz ./data.tar.$cext )
- else
--  ( cd $tmp_dir && tar -c $tsortargs --mtime=$build_date $tarformat ./debian-binary ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file )
-+  ( cd $tmp_dir && tar -c $tsortargs --mtime="$build_date" $tarformat ./debian-binary ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file )
- fi
- 
- rm $tmp_dir/debian-binary $tmp_dir/data.tar.$cext $tmp_dir/control.tar.gz
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/pigz.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/pigz.patch
deleted file mode 100644
index dd433e8eb9..0000000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/pigz.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From ab1436927b47badcd219a5f075dfc848020e061d Mon Sep 17 00:00:00 2001
-From: Mike Crowe <mac@mcrowe.com>
-Date: Thu, 4 Oct 2018 17:54:19 +0100
-Subject: [opkg-utils PATCH] opkg-build: Add support for explicit use of pigz
-To: opkg-devel@googlegroups.com,
-    yocto@yoctoproject.org
-
-oe-core has stopped[1] installing pigz as gzip. This means that in
-order to persuade opkg-build to use pigz it must be specified
-explicitly. Let's teach opkg-build to deal with being passed pigz as a
-compressor.
-
-We can't combine the check for whether -T is required with the one for
-gzip because opkg-build needs to call $compressor and gzip separately
-to construct the package.
-
-[1] http://lists.openembedded.org/pipermail/openembedded-commits/2018-February/218767.html
-
-Upstream-Status: Submitted [opkg-devel@googlegroups.com https://groups.google.com/forum/#!topic/opkg-devel/E0WVOhjK61w]
-Signed-off-by: Mike Crowe <mac@mcrowe.com>
----
- opkg-build | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/opkg-build b/opkg-build
-index 93a7956..f8403ea 100755
---- a/opkg-build
-+++ b/opkg-build
-@@ -170,7 +170,7 @@ fi
- 
- compressor_ext() {
-     case $1 in
--	gzip)
-+	gzip|pigz)
- 	    echo gz
- 	    ;;
- 	bzip2)
-@@ -232,6 +232,10 @@ if [ $compressor = "gzip" ] ; then
- 	compressorargs=$zipargs
- elif [ $compressor = "xz" ] ; then
- 	compressorargs="--threads 0"
-+elif [ $compressor = "pigz" ] ; then
-+	if $compressor --help 2>&1 | grep -- "-T" > /dev/null; then
-+		compressorargs="-9nT"
-+	fi
- fi
- 
- tsortargs=
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
deleted file mode 100644
index d8931b281f..0000000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-If a the number of hard links decreases or increases while creating
-the tar files used for an ipk package, tar fails with error code 1:
-
-| DEBUG: Executing python function do_package_ipk
-| tar: ./usr/src/debug/gperf/3.0.4-r0/gperf-3.0.4/src/main.cc: file changed as we read it
-NOTE: recipe gperf-3.0.4-r0: task do_package_write_ipk: Failed
-ERROR: Task 6539 (recipes-extended/gperf/gperf_3.0.4.bb, do_package_write_ipk) failed with exit code '1'
-
-
-We detect if the error code produced by tar is 1 and in this case ignore it.
-
-This a similar behavior to the one on dpkg:
-http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=40731942515ec8d80c727ad561174986d4f05818
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
-
-
-Index: git/opkg-build
-
-===================================================================
---- git.orig/opkg-build
-+++ git/opkg-build
-@@ -285,8 +285,21 @@ mkdir $tmp_dir
- build_date="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" "+%Y-%m-%d %H:%M:%S")"
- 
- echo $CONTROL > $tmp_dir/tarX
--( cd $pkg_dir && tar $ogargs $tsortargs --mtime="$build_date" -X $tmp_dir/tarX -c $tarformat . | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
--( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --mtime="$build_date" -c $tarformat . | gzip $zipargs > $tmp_dir/control.tar.gz )
-+
-+
-+# Ignore error code 1, caused by modifying the number of hard links while creating the tar file
-+rc=0
-+( cd $pkg_dir && tar $ogargs $tsortargs --mtime="$build_date" -X $tmp_dir/tarX -c $tarformat . | $compressor $compressorargs > $tmp_dir/data.tar.$cext ) || rc=$?
-+if [ $rc -ne 1 ] && [ $rc -ne 0 ]; then
-+        exit $rc 
-+fi
-+
-+rc=0
-+( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --mtime="$build_date" -c $tarformat . | gzip $zipargs > $tmp_dir/control.tar.gz ) || rc=$?
-+if [ $rc -ne 1 ] && [ $rc -ne 0 ]; then
-+        exit $rc
-+fi
-+
- rm $tmp_dir/tarX
- 
- echo "2.0" > $tmp_dir/debian-binary
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/threaded-xz.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/threaded-xz.patch
deleted file mode 100644
index 13a49f9170..0000000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/threaded-xz.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Pass --threads=0 to xz so that it will use as many threads as there are cores to compress the packages.  This makes qemu's do_package_ipk run in 34s instead of 275s on my machine.
-
-Upstream-Status: Inappropriate (ugly but works, discussing with upstream now)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/opkg-build b/opkg-build
-index 0050c2b..93a7956 100755
---- a/opkg-build
-+++ b/opkg-build
-@@ -230,6 +230,8 @@ if gzip --help 2>&1 | grep -- "-T" > /dev/null; then
- fi
- if [ $compressor = "gzip" ] ; then
- 	compressorargs=$zipargs
-+elif [ $compressor = "xz" ] ; then
-+	compressorargs="--threads 0"
- fi
- 
- tsortargs=
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.0.bb
similarity index 82%
rename from meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
rename to meta/recipes-devtools/opkg-utils/opkg-utils_0.4.0.bb
index 4c41774c39..eab74eabd6 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.0.bb
@@ -9,18 +9,12 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 
 SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \
            file://0001-Switch-all-scripts-to-use-Python-3.x.patch \
-           file://0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch \
-           file://0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch \
-           file://threaded-xz.patch \
-           file://pigz.patch \
-           file://0001-update-alternatives-Fix-link-relocation-support.patch \
 "
-SRC_URI_append_class-native = " file://tar_ignore_error.patch"
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
 
-SRC_URI[md5sum] = "391c1c80aca26961375dd22e1d2d0cbf"
-SRC_URI[sha256sum] = "26b3f4dd1c1ef65f519d4cddfb35ebea41ae8af989aea2699a39783598c33769"
+SRC_URI[md5sum] = "6e1c2eae96239520a8eb3d05372773ea"
+SRC_URI[sha256sum] = "8153f4e5dadde422d35feaf86bf595266af9d0037389bc418fa87feb0437efb3"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.20.1


