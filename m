Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF7A61604
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 02:02:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2020 18:02:03 -0800
X-IronPort-AV: E=Sophos;i="5.70,466,1574150400"; d="scan'208";a="225067407"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	20 Feb 2020 18:02:02 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 10:01:27 +0800
Message-Id: <1582250488-79398-12-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582250488-79398-1-git-send-email-anuj.mittal@intel.com>
References: <1582250488-79398-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH 12/13] screen: upgrade 4.7.0 -> 4.8.0
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
X-List-Received-Date: Fri, 21 Feb 2020 02:02:02 -0000

License-Update: Change http to https in license text.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/screen/{screen_4.7.0.bb => screen_4.8.0.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/screen/{screen_4.7.0.bb => screen_4.8.0.bb} (87%)

diff --git a/meta/recipes-extended/screen/screen_4.7.0.bb b/meta/recipes-extended/screen/screen_4.8.0.bb
similarity index 87%
rename from meta/recipes-extended/screen/screen_4.7.0.bb
rename to meta/recipes-extended/screen/screen_4.8.0.bb
index 67aa5f1..4772eb6 100644
--- a/meta/recipes-extended/screen/screen_4.7.0.bb
+++ b/meta/recipes-extended/screen/screen_4.8.0.bb
@@ -9,7 +9,8 @@ SECTION = "console/utils"
 
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://screen.h;endline=26;md5=3971142989289a8198a544220703c2bf"
+                    file://screen.h;endline=26;md5=b8dc717c9a3dba842ae6c44ca0f73f52 \
+                    "
 
 DEPENDS = "ncurses virtual/crypt \
           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -22,8 +23,8 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0001-Remove-more-compatibility-stuff.patch \
           "
 
-SRC_URI[md5sum] = "b8971ebd68d046f2814d1040cb8e6641"
-SRC_URI[sha256sum] = "da775328fa783bd2a787d722014dbd99c6093effc11f337827604c2efc5d20c1"
+SRC_URI[md5sum] = "d276213d3acd10339cd37848b8c4ab1e"
+SRC_URI[sha256sum] = "6e11b13d8489925fde25dfb0935bf6ed71f9eb47eff233a181e078fde5655aa1"
 
 inherit autotools texinfo
 
-- 
2.7.4


