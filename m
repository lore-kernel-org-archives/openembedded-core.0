Return-Path: <cristiana.voicu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 920646D3D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 07:57:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Oct 2013 00:57:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,560,1378882800"; d="scan'208";a="421820237"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.65])
	by fmsmga002.fm.intel.com with ESMTP; 24 Oct 2013 00:57:11 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2013 11:01:50 +0300
Message-Id: <57bc8f0c4948b0ff7d9076d2c6ab63415442b1b0.1382601179.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1382601179.git.cristiana.voicu@intel.com>
References: <cover.1382601179.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1382601179.git.cristiana.voicu@intel.com>
References: <cover.1382601179.git.cristiana.voicu@intel.com>
Subject: [PATCH 4/4] sudo: upgrade to 1.8.8
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
X-List-Received-Date: Thu, 24 Oct 2013 07:57:10 -0000

License checksum updated to reflect additional Copyright for
file getopt_long.c, owned by The NetBSD Foundation, Inc

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 meta/recipes-extended/sudo/sudo.inc                |    2 +-
 .../sudo/{sudo_1.8.7.bb => sudo_1.8.8.bb}          |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.7.bb => sudo_1.8.8.bb} (83%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index b00f68d..80357eb 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=9b2b7976b2182ee9a146710b32a01c7a \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=47ae0be3bf895c0bb885fae7e1e83a47 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=e2dbb155fc49beea947515300bab99e0 \
                     file://compat/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
                     file://compat/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
diff --git a/meta/recipes-extended/sudo/sudo_1.8.7.bb b/meta/recipes-extended/sudo/sudo_1.8.8.bb
similarity index 83%
rename from meta/recipes-extended/sudo/sudo_1.8.7.bb
rename to meta/recipes-extended/sudo/sudo_1.8.8.bb
index c83e95d..ba7c4ab 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.7.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.8.bb
@@ -5,8 +5,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "a02367090e1dac8d0c1747de1127b6bf"
-SRC_URI[sha256sum] = "39626cf3d48c4fd5a9139a2627d42bfefac7ce47f470bdba3aeb4e3d7c49566a"
+SRC_URI[md5sum] = "fc4f074090afd56d9ff4ff4e97321971"
+SRC_URI[sha256sum] = "9f911c1e9297fb8006deb52fa81197a8d06b9d54e70672f723c467ecae992fc9"
 
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.7.9.5


