Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 831D760EE1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 11:09:48 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Sep 2013 04:09:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,897,1371106800"; d="scan'208";a="294447015"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Sep 2013 04:09:48 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2013 14:09:47 +0300
Message-Id: <1379070587-19408-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] adt-installer: fix opkg repo name
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
X-List-Received-Date: Fri, 13 Sep 2013 11:09:48 -0000

I mistakenly named the allarch opkg repo the same as nativesdk one...

This patch fixes it.

[YOCTO #5181]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../adt-installer/opkg/conf/opkg-sdk-i686.conf     |    2 +-
 .../adt-installer/opkg/conf/opkg-sdk-x86_64.conf   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-i686.conf b/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-i686.conf
index ee169f6..ba627b3 100644
--- a/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-i686.conf
+++ b/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-i686.conf
@@ -3,4 +3,4 @@ arch any 6
 arch noarch 11
 arch i686-nativesdk 16
 src yp-i686-nativesdk ADTREPO_URL/adt-ipk/i686-nativesdk
-src yp-i686-nativesdk ADTREPO_URL/adt-ipk/all
+src yp-i686-all ADTREPO_URL/adt-ipk/all
diff --git a/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-x86_64.conf b/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-x86_64.conf
index 199ea50..10504a9 100644
--- a/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-x86_64.conf
+++ b/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-x86_64.conf
@@ -3,4 +3,4 @@ arch any 6
 arch noarch 11
 arch x86_64-nativesdk 16
 src yp-x86_64-nativesdk ADTREPO_URL/adt-ipk/x86_64-nativesdk
-src yp-x86_64-nativesdk ADTREPO_URL/adt-ipk/all
+src yp-x86_64-all ADTREPO_URL/adt-ipk/all
-- 
1.7.9.5


