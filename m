Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6E7D877051
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 15:32:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Sep 2015 08:32:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,462,1437462000"; d="scan'208";a="797539510"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2015 08:32:49 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 18:34:12 +0300
Message-Id: <40470ddc537b1e32f81ece9313f6e5a0ad4c8144.1441293149.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/12] net-tools: update to 1.60-25
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
X-List-Received-Date: Thu, 03 Sep 2015 15:32:49 -0000

This means fetching a newer Debian patchset which adds a few
bug/security fixes.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../net-tools/{net-tools_1.60-25.bb => net-tools_1.60-26.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/net-tools/{net-tools_1.60-25.bb => net-tools_1.60-26.bb} (91%)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-25.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
similarity index 91%
rename from meta/recipes-extended/net-tools/net-tools_1.60-25.bb
rename to meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index c47d69a..aefc1e6 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-25.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://ifconfig.c;beginline=11;endline=15;md5=d1ca372080ad5401e23ca0afc35cf9ba"
 
 SRC_URI = "http://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/n/${BPN}/${BPN}_1.60.orig.tar.gz;name=tarball \
-           http://snapshot.debian.org/archive/debian/20130511T214653Z/pool/main/n/${BPN}/${BPN}_${PV}.diff.gz;apply=no;name=patch \
+           http://snapshot.debian.org/archive/debian//20150831T093342Z/pool/main/n/${BPN}/${BPN}_${PV}.diff.gz;apply=no;name=patch \
            file://net-tools-config.h \
            file://net-tools-config.make \
            file://ifconfig-interface-0-del-IP-will-remove-the-aliased-.patch \
@@ -18,8 +18,8 @@ S = "${WORKDIR}/net-tools-1.60"
 SRC_URI[tarball.md5sum] = "ecaf37acb5b5daff4bdda77785fd916d"
 SRC_URI[tarball.sha256sum] = "ec67967cf7b1a3a3828a84762fbc013ac50ee5dc9aa3095d5c591f302c2de0f5"
 
-SRC_URI[patch.md5sum] = "5ab1e2184d0fa6518031291138f2fc51"
-SRC_URI[patch.sha256sum] = "1bddcd96ac60e794978cb20fb7ea4c2e77258c56c042c9ac8b6ec2b2033bc56f"
+SRC_URI[patch.md5sum] = "ea3592f49ac8380962bc4d9b66c7e7e9"
+SRC_URI[patch.sha256sum] = "aeeeafaff68866a446f01bb639d4e0146a60af34dcd20e31a3e46585022fc76c"
 
 inherit gettext
 
-- 
2.1.4


