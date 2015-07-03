Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A265675D06
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 07:24:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t637OTVr005481
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jul 2015 00:24:29 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 3 Jul 2015 00:24:28 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jul 2015 15:23:49 +0800
Message-ID: <f57c92f90be97fcc5eaa39d994e014af64397fc8.1435908151.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1435908151.git.kai.kang@windriver.com>
References: <cover.1435908151.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/1] Update alternatives of man pages
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
X-List-Received-Date: Fri, 03 Jul 2015 07:24:29 -0000
Content-Type: text/plain

Update alternatives of man pages in several packages.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_8.23.bb       | 7 ++++++-
 meta/recipes-core/util-linux/util-linux.inc         | 8 +++++++-
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 6 ++++++
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb  | 6 +++++-
 meta/recipes-extended/mktemp/mktemp_1.7.bb          | 4 ++++
 meta/recipes-extended/procps/procps_3.3.10.bb       | 4 ++++
 meta/recipes-extended/shadow/shadow.inc             | 3 ++-
 meta/recipes-extended/stat/stat_3.3.bb              | 3 +++
 8 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.23.bb b/meta/recipes-core/coreutils/coreutils_8.23.bb
index 70c04a5..6e98b7b 100644
--- a/meta/recipes-core/coreutils/coreutils_8.23.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.23.bb
@@ -93,7 +93,7 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base64 mktemp df"
-ALTERNATIVE_${PN}-doc = "base64.1 mktemp.1 df.1 lbracket.1"
+ALTERNATIVE_${PN}-doc = "base64.1 mktemp.1 df.1 lbracket.1 groups.1 kill.1 uptime.1 stat.1"
 
 ALTERNATIVE_LINK_NAME[base64] = "${base_bindir}/base64"
 ALTERNATIVE_TARGET[base64] = "${bindir}/base64.${BPN}"
@@ -111,6 +111,11 @@ ALTERNATIVE_LINK_NAME[lbracket] = "${bindir}/["
 ALTERNATIVE_TARGET[lbracket] = "${bindir}/lbracket.${BPN}"
 ALTERNATIVE_LINK_NAME[lbracket.1] = "${mandir}/man1/lbracket.1"
 
+ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
+ALTERNATIVE_LINK_NAME[uptime.1] = "${mandir}/man1/uptime.1"
+ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
+ALTERNATIVE_LINK_NAME[stat.1] = "${mandir}/man1/stat.1"
+
 python __anonymous() {
 	for prog in d.getVar('base_bindir_progs', True).split():
 		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir', True), prog))
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 60309a5..a4072bc 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -187,7 +187,7 @@ ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 
-ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 reset.1"
+ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 reset.1 kill.1 libblkid.3 blkid.8 findfs.8 fsck.8 uuid.3"
 
 ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
 ALTERNATIVE_LINK_NAME[lastb.1] = "${mandir}/man1/lastb.1"
@@ -198,6 +198,12 @@ ALTERNATIVE_LINK_NAME[reset.1] = "${mandir}/man1/reset.1"
 ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
 ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
 ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
+ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
+ALTERNATIVE_LINK_NAME[libblkid.3] = "${mandir}/man3/libblkid.3"
+ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"
+ALTERNATIVE_LINK_NAME[findfs.8] = "${mandir}/man8/findfs.8"
+ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
+ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
 
 ALTERNATIVE_util-linux-hwclock = "hwclock"
 # There seems to be problem, atleast on nslu2, with these, untill they are
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index b354088..70085e3 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -91,6 +91,12 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_LINK_NAME[chattr] = "${base_bindir}/chattr"
 ALTERNATIVE_TARGET[chattr] = "${base_bindir}/chattr.e2fsprogs"
 
+ALTERNATIVE_${PN}-doc = "libblkid.3 blkid.8 findfs.8 fsck.8"
+ALTERNATIVE_LINK_NAME[libblkid.3] = "${mandir}/man3/libblkid.3"
+ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"
+ALTERNATIVE_LINK_NAME[findfs.8] = "${mandir}/man8/findfs.8"
+ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
+
 inherit ptest
 SRC_URI += "file://run-ptest"
 SRC_URI += "file://ptest.patch"
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
index 160990c..33bed75 100644
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
@@ -32,7 +32,7 @@ SRC_URI[sha256sum] = "11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f
 
 S = "${WORKDIR}/uuid-${PV}"
 
-inherit autotools
+inherit autotools update-alternatives
 
 EXTRA_OECONF = "--without-dce --without-cxx --without-perl --without-perl-compat --without-php --without-pgsql"
 EXTRA_OECONF = "--includedir=${includedir}/ossp"
@@ -57,3 +57,7 @@ FILES_${PN} = "${libdir}/libossp-uuid.so.16*"
 FILES_${PN}-dev += "${bindir}/uuid-config"
 
 BBCLASSEXTEND = "native nativesdk"
+
+ALTERNATIVE_${PN}-doc = "uuid.3"
+ALTERNATIVE_PRIORITY_${PN}-doc = "200"
+ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
diff --git a/meta/recipes-extended/mktemp/mktemp_1.7.bb b/meta/recipes-extended/mktemp/mktemp_1.7.bb
index b53fc11..fe238ee 100644
--- a/meta/recipes-extended/mktemp/mktemp_1.7.bb
+++ b/meta/recipes-extended/mktemp/mktemp_1.7.bb
@@ -28,3 +28,7 @@ do_install_append () {
 ALTERNATIVE_${PN} = "mktemp"
 ALTERNATIVE_LINK_NAME[mktemp] = "${base_bindir}/mktemp"
 ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN}-doc = "mktemp.1"
+ALTERNATIVE_PRIORITY_${PN}-doc = "300"
+ALTERNATIVE_LINK_NAME[mktemp.1] = "${mandir}/man1/mktemp.1"
diff --git a/meta/recipes-extended/procps/procps_3.3.10.bb b/meta/recipes-extended/procps/procps_3.3.10.bb
index 621b6dd..65d64ec 100644
--- a/meta/recipes-extended/procps/procps_3.3.10.bb
+++ b/meta/recipes-extended/procps/procps_3.3.10.bb
@@ -52,6 +52,10 @@ ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN} = "${bindir_progs} ${base_bindir_progs} ${base_sbindir_progs}"
 
+ALTERNATIVE_${PN}-doc = "kill.1 uptime.1"
+ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
+ALTERNATIVE_LINK_NAME[uptime.1] = "${mandir}/man1/uptime.1"
+
 python __anonymous() {
     for prog in d.getVar('base_bindir_progs', True).split():
         d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir', True), prog))
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 5451718..4313ffe 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -179,9 +179,10 @@ ALTERNATIVE_${PN}-base = "newgrp groups login su"
 ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
 
-ALTERNATIVE_${PN}-doc = "passwd.5 getspnam.3"
+ALTERNATIVE_${PN}-doc = "passwd.5 getspnam.3 groups.1"
 ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
 ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
+ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
 
 pkg_postinst_${PN} () {
 	if [ "x$D" != "x" ]; then
diff --git a/meta/recipes-extended/stat/stat_3.3.bb b/meta/recipes-extended/stat/stat_3.3.bb
index 8a19b3b..651831e 100644
--- a/meta/recipes-extended/stat/stat_3.3.bb
+++ b/meta/recipes-extended/stat/stat_3.3.bb
@@ -24,5 +24,8 @@ ALTERNATIVE_PRIORITY[stat] = "200"
 ALTERNATIVE_LINK_NAME[stat] = "${base_bindir}/stat"
 ALTERNATIVE_TARGET[stat] = "${base_bindir}/stat.stat"
 
+ALTERNATIVE_${PN}-doc = "stat.1"
+ALTERNATIVE_LINK_NAME[stat.1] = "${mandir}/man1/stat.1"
+
 BBCLASSEXTEND = "native"
 
-- 
1.9.1


