Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CBAFA7823B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 21:30:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Aug 2017 14:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,410,1498546800"; d="scan'208";a="1006158341"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.142])
	by orsmga003.jf.intel.com with ESMTP; 21 Aug 2017 14:30:03 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 16:31:15 -0500
Message-Id: <20170821213116.26081-1-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: jagadeesh.krishnanjanappa@caviumnetworks.com
Subject: [PATCH 1/2] apt: Upgrade to 1.2.24
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
X-List-Received-Date: Mon, 21 Aug 2017 21:30:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The LIC_FILES_CHKSUM changed because the license file now has
style changes in the text remains GPLv2+.

The patch Revert-always-run-dpkg-configure-a-at-the-end-of-our
was updated because now the precision fields use floating
point numbers.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../{apt-native_1.2.12.bb => apt-native_1.2.24.bb} |  0
 meta/recipes-devtools/apt/apt.inc                  |  8 ++++----
 ...ys-run-dpkg-configure-a-at-the-end-of-our.patch | 24 +++++++++++-----------
 .../apt/{apt_1.2.12.bb => apt_1.2.24.bb}           |  0
 4 files changed, 16 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/apt/{apt-native_1.2.12.bb => apt-native_1.2.24.bb} (100%)
 rename meta/recipes-devtools/apt/{apt_1.2.12.bb => apt_1.2.24.bb} (100%)

diff --git a/meta/recipes-devtools/apt/apt-native_1.2.12.bb b/meta/recipes-devtools/apt/apt-native_1.2.24.bb
similarity index 100%
rename from meta/recipes-devtools/apt/apt-native_1.2.12.bb
rename to meta/recipes-devtools/apt/apt-native_1.2.24.bb
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 30263708444..f1cde3068da 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -2,7 +2,7 @@ SUMMARY = "Advanced front-end for dpkg"
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160526T162943Z/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
+SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
            file://use-host.patch \
            file://makerace.patch \
            file://no-nls-dpkg.patch \
@@ -14,9 +14,9 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160526T162943Z/pool/main/
            file://0001-environment.mak-musl-based-systems-can-generate-shar.patch \
            file://0001-apt-1.2.12-Fix-musl-build.patch \
            "
-SRC_URI[md5sum] = "80f6f0ef110a45a7e5af8a9d233fb0e7"
-SRC_URI[sha256sum] = "e820d27cba73476df4abcff27dadd1b5847474bfe85f7e9202a9a07526973ea6"
-LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
+SRC_URI[md5sum] = "ce8f9ab11f4fd0a08ec73eaffd75c8f0"
+SRC_URI[sha256sum] = "fa1311a9ce00e72379a0a3bc6d240ba30c0968cfbbb3472859e50b99e24e9598"
+LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
index b3a883bae88..734ba00d4f2 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -22,10 +22,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  3 files changed, 11 insertions(+), 18 deletions(-)
 
 diff --git a/apt-pkg/deb/dpkgpm.cc b/apt-pkg/deb/dpkgpm.cc
-index 834cb0e..84ded3a 100644
+index 533d9b367..6ce81bbd9 100644
 --- a/apt-pkg/deb/dpkgpm.cc
 +++ b/apt-pkg/deb/dpkgpm.cc
-@@ -1037,12 +1037,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
+@@ -1041,12 +1041,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
  	 PackagesTotal++;
        }
     }
@@ -38,7 +38,7 @@ index 834cb0e..84ded3a 100644
  }
                                                                          /*}}}*/
  bool pkgDPkgPM::Go(int StatusFd)
-@@ -1250,8 +1244,9 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
+@@ -1268,8 +1262,9 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
  
     // support subpressing of triggers processing for special
     // cases like d-i that runs the triggers handling manually
@@ -50,7 +50,7 @@ index 834cb0e..84ded3a 100644
  
     // for the progress
 diff --git a/test/integration/test-apt-progress-fd-deb822 b/test/integration/test-apt-progress-fd-deb822
-index 58fd732..3359762 100755
+index a8d59608d..0c6a9bbbf 100755
 --- a/test/integration/test-apt-progress-fd-deb822
 +++ b/test/integration/test-apt-progress-fd-deb822
 @@ -27,36 +27,36 @@ Message: Installing testing (amd64)
@@ -69,19 +69,19 @@ index 58fd732..3359762 100755
  
  Status: progress
  Package: testing:amd64
--Percent: 50
-+Percent: 60
+-Percent: 50.0000
++Percent: 60.0000
  Message: Preparing to configure testing (amd64)
  
  Status: progress
--Percent: 50
-+Percent: 60
+-Percent: 50.0000
++Percent: 60.0000
  Message: Running dpkg
  
  Status: progress
  Package: testing:amd64
--Percent: 50
-+Percent: 60
+-Percent: 50.0000
++Percent: 60.0000
  Message: Configuring testing (amd64)
  
  Status: progress
@@ -98,7 +98,7 @@ index 58fd732..3359762 100755
  
  Status: progress
 diff --git a/test/integration/test-no-fds-leaked-to-maintainer-scripts b/test/integration/test-no-fds-leaked-to-maintainer-scripts
-index d86e638..ef6d23b 100755
+index d86e638cd..ef6d23be2 100755
 --- a/test/integration/test-no-fds-leaked-to-maintainer-scripts
 +++ b/test/integration/test-no-fds-leaked-to-maintainer-scripts
 @@ -59,8 +59,7 @@ startup packages configure
@@ -122,5 +122,5 @@ index d86e638..ef6d23b 100755
  checkpurge
  
 -- 
-2.1.4
+2.11.0
 
diff --git a/meta/recipes-devtools/apt/apt_1.2.12.bb b/meta/recipes-devtools/apt/apt_1.2.24.bb
similarity index 100%
rename from meta/recipes-devtools/apt/apt_1.2.12.bb
rename to meta/recipes-devtools/apt/apt_1.2.24.bb
-- 
2.11.0


