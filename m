Return-Path: <bogdan.a.marinescu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 83DE36A5BC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 12:57:08 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Jun 2013 05:57:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,792,1363158000"; d="scan'208";a="249990844"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jun 2013 05:57:08 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2013 15:56:53 +0300
Message-Id: <0e4ee3fadf43f9be61ecaac720d1d166c89878b8.1370264032.git.bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370264032.git.bogdan.a.marinescu@intel.com>
References: <cover.1370264032.git.bogdan.a.marinescu@intel.com>
In-Reply-To: <cover.1370264032.git.bogdan.a.marinescu@intel.com>
References: <cover.1370264032.git.bogdan.a.marinescu@intel.com>
Subject: [PATCH 2/3] libpcre: upgraded to 8.33
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
X-List-Received-Date: Mon, 03 Jun 2013 12:57:08 -0000

The license didn't modify, just the license years (2012->2013).

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../libpcre/{libpcre_8.32.bb => libpcre_8.33.bb}                |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.32.bb => libpcre_8.33.bb} (90%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.32.bb b/meta/recipes-support/libpcre/libpcre_8.33.bb
similarity index 90%
rename from meta/recipes-support/libpcre/libpcre_8.32.bb
rename to meta/recipes-support/libpcre/libpcre_8.33.bb
index a2a8d80..50930b4 100644
--- a/meta/recipes-support/libpcre/libpcre_8.32.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.33.bb
@@ -5,15 +5,14 @@ to the POSIX regular expression API."
 SUMMARY = "Perl Compatible Regular Expressions"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
-PR = "r1"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=115e2bee152e2e23e838a29136094877"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=0920cc1a9f7ba95464491fa83c86afd8"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch"
 
-SRC_URI[md5sum] = "62f02a76bb57a40bc66681760ed511d5"
-SRC_URI[sha256sum] = "a913fb9bd058ef380a2d91847c3c23fcf98e92dc3b47cd08a53c021c5cde0f55"
+SRC_URI[md5sum] = "21514018448ac10062ece7a668fca949"
+SRC_URI[sha256sum] = "c603957a4966811c04af5f6048c71cfb4966ec93312d7b3118116ed9f3bc0478"
 
 S = "${WORKDIR}/pcre-${PV}"
 
-- 
1.7.10.4


