Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RBqgi-0008V4-B3
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 18:20:48 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Oct 2011 09:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,496,1312182000"; d="scan'208";a="59495953"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.197])
	by azsmga001.ch.intel.com with ESMTP; 06 Oct 2011 09:15:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 09:14:59 -0700
Message-Id: <1b41379e5232701f7d96ea78c673d34aa4132c2f.1317917297.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
Subject: [PATCH 20/21] apt: Update to 0.8.15.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Oct 2011 16:20:49 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../includes-fix.patch                             |    0
 .../no-ko-translation.patch                        |    0
 .../{apt-0.7.14 => apt-0.8.15.8}/noconfigure.patch |    0
 .../apt/{apt-0.7.14 => apt-0.8.15.8}/nodoc.patch   |    0
 .../{apt-0.7.14 => apt-0.8.15.8}/use-host.patch    |    0
 ...apt-native_0.7.14.bb => apt-native_0.8.15.8.bb} |    6 +++---
 .../apt/{apt_0.7.14.bb => apt_0.8.15.8.bb}         |    6 +++---
 7 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt-0.8.15.8}/includes-fix.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt-0.8.15.8}/no-ko-translation.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt-0.8.15.8}/noconfigure.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt-0.8.15.8}/nodoc.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt-0.8.15.8}/use-host.patch (100%)
 rename meta/recipes-devtools/apt/{apt-native_0.7.14.bb => apt-native_0.8.15.8.bb} (60%)
 rename meta/recipes-devtools/apt/{apt_0.7.14.bb => apt_0.8.15.8.bb} (67%)

diff --git a/meta/recipes-devtools/apt/apt-0.7.14/includes-fix.patch b/meta/recipes-devtools/apt/apt-0.8.15.8/includes-fix.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.7.14/includes-fix.patch
rename to meta/recipes-devtools/apt/apt-0.8.15.8/includes-fix.patch
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/no-ko-translation.patch b/meta/recipes-devtools/apt/apt-0.8.15.8/no-ko-translation.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.7.14/no-ko-translation.patch
rename to meta/recipes-devtools/apt/apt-0.8.15.8/no-ko-translation.patch
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/noconfigure.patch b/meta/recipes-devtools/apt/apt-0.8.15.8/noconfigure.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.7.14/noconfigure.patch
rename to meta/recipes-devtools/apt/apt-0.8.15.8/noconfigure.patch
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/nodoc.patch b/meta/recipes-devtools/apt/apt-0.8.15.8/nodoc.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.7.14/nodoc.patch
rename to meta/recipes-devtools/apt/apt-0.8.15.8/nodoc.patch
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/use-host.patch b/meta/recipes-devtools/apt/apt-0.8.15.8/use-host.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.7.14/use-host.patch
rename to meta/recipes-devtools/apt/apt-0.8.15.8/use-host.patch
diff --git a/meta/recipes-devtools/apt/apt-native_0.7.14.bb b/meta/recipes-devtools/apt/apt-native_0.8.15.8.bb
similarity index 60%
rename from meta/recipes-devtools/apt/apt-native_0.7.14.bb
rename to meta/recipes-devtools/apt/apt-native_0.8.15.8.bb
index c82d606..0c532c7 100644
--- a/meta/recipes-devtools/apt/apt-native_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt-native_0.8.15.8.bb
@@ -1,13 +1,13 @@
 require apt-native.inc
 
-PR = "r5"
+PR = "r0"
 
 SRC_URI += "file://nodoc.patch \
             file://noconfigure.patch \
 	    file://no-curl.patch \
 	    file://includes-fix.patch"
 
-SRC_URI[md5sum] = "19efa18fb1ef20c58b9b44e94258b814"
-SRC_URI[sha256sum] = "8fc06effaf8a4e4333308eedcdc6840f1c8056f2e924210f151dfc076bcd4045"
+SRC_URI[md5sum] = "9727845eaeff0d1191403f4d8b8d1e35"
+SRC_URI[sha256sum] = "d19efceb04b927a1c6cdac01fd29b7f0f927c8e168c1e722ddf7808438262742"
 
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
diff --git a/meta/recipes-devtools/apt/apt_0.7.14.bb b/meta/recipes-devtools/apt/apt_0.8.15.8.bb
similarity index 67%
rename from meta/recipes-devtools/apt/apt_0.7.14.bb
rename to meta/recipes-devtools/apt/apt_0.8.15.8.bb
index 93eebe9..37ca85b 100644
--- a/meta/recipes-devtools/apt/apt_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt_0.8.15.8.bb
@@ -3,13 +3,13 @@ RDEPENDS_${PN} = "dpkg"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-PR = "r8"
+PR = "r0"
 
 SRC_URI += "file://nodoc.patch \
             file://includes-fix.patch "
 
-SRC_URI[md5sum] = "19efa18fb1ef20c58b9b44e94258b814"
-SRC_URI[sha256sum] = "8fc06effaf8a4e4333308eedcdc6840f1c8056f2e924210f151dfc076bcd4045"
+SRC_URI[md5sum] = "9727845eaeff0d1191403f4d8b8d1e35"
+SRC_URI[sha256sum] = "d19efceb04b927a1c6cdac01fd29b7f0f927c8e168c1e722ddf7808438262742"
 
 require apt-package.inc
 
-- 
1.7.6.2



