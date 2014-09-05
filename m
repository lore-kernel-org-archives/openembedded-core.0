Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A1F8771403
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 20:06:30 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 05 Sep 2014 13:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="382099470"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.5])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Sep 2014 13:01:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Sep 2014 13:06:25 -0700
Message-Id: <c5f696925d5c8506451ec60f181b6ce173afe154.1409947480.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1409947480.git.sgw@linux.intel.com>
References: <cover.1409947480.git.sgw@linux.intel.com>
In-Reply-To: <cover.1409947480.git.sgw@linux.intel.com>
References: <cover.1409947480.git.sgw@linux.intel.com>
Subject: [PATCH 1/4] vala: Update to 0.24.0
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
X-List-Received-Date: Fri, 05 Sep 2014 20:06:31 -0000

Remove un-needed PR and INC_PR
Rename vala-0.16 to more geneic vala

Now correctly supports seperate build/source directorys so drop -sepbuild tag

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/vala/vala.inc                               | 3 +--
 ...001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch | 0
 meta/recipes-devtools/vala/vala_0.16.0.bb                         | 8 --------
 meta/recipes-devtools/vala/vala_0.24.0.bb                         | 6 ++++++
 4 files changed, 7 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/vala/{vala-0.16.0 => vala}/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch (100%)
 delete mode 100644 meta/recipes-devtools/vala/vala_0.16.0.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.24.0.bb

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 64e7daf..cac8728 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -7,12 +7,11 @@ BBCLASSEXTEND = "native"
 HOMEPAGE = "http://vala-project.org"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-INC_PR = "r1"
 
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
-inherit autotools-brokensep pkgconfig
+inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-vapigen"
 
diff --git a/meta/recipes-devtools/vala/vala-0.16.0/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch b/meta/recipes-devtools/vala/vala/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
similarity index 100%
rename from meta/recipes-devtools/vala/vala-0.16.0/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
rename to meta/recipes-devtools/vala/vala/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
diff --git a/meta/recipes-devtools/vala/vala_0.16.0.bb b/meta/recipes-devtools/vala/vala_0.16.0.bb
deleted file mode 100644
index 92120b4..0000000
--- a/meta/recipes-devtools/vala/vala_0.16.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch"
-
-SRC_URI[md5sum] = "84b742e9cca4c90fde3026c3793c03c1"
-SRC_URI[sha256sum] = "3adb37aa2b35e2e2daed47552e85dbcbf752c0f7768b269d856993620073a657"
diff --git a/meta/recipes-devtools/vala/vala_0.24.0.bb b/meta/recipes-devtools/vala/vala_0.24.0.bb
new file mode 100644
index 0000000..342a875
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.24.0.bb
@@ -0,0 +1,6 @@
+require ${BPN}.inc
+
+SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch"
+
+SRC_URI[md5sum] = "beddeff9c06d3c278988b237da0e7401"
+SRC_URI[sha256sum] = "22a37c977512c19cd29c373eaaef96cb2c994795d491106f32387f3f9d1e899c"
-- 
1.8.3.1


