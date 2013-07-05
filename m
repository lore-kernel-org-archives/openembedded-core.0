Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 27BD46B02E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:08:24 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jul 2013 00:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1000,1363158000"; d="scan'208";a="327059486"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 05 Jul 2013 00:08:24 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 10:10:23 +0300
Message-Id: <05007595562a38350ec7f40f287174e550161c59.1372952884.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
Subject: [PATCH 06/10] libgpg-error: Updated from 1.11 to 1.12
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
X-List-Received-Date: Fri, 05 Jul 2013 07:08:24 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../{libgpg-error-1.11 => libgpg-error-1.12}/pkgconfig.patch      |    0
 .../libgpg-error/{libgpg-error_1.11.bb => libgpg-error_1.12.bb}   |    5 ++---
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error-1.11 => libgpg-error-1.12}/pkgconfig.patch (100%)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.11.bb => libgpg-error_1.12.bb} (85%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error-1.11/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error-1.12/pkgconfig.patch
similarity index 100%
rename from meta/recipes-support/libgpg-error/libgpg-error-1.11/pkgconfig.patch
rename to meta/recipes-support/libgpg-error/libgpg-error-1.12/pkgconfig.patch
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.11.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.12.bb
similarity index 85%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.11.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.12.bb
index 1caa0dd..0b44ea3 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.11.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.12.bb
@@ -10,13 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 SECTION = "libs"
-PR = "r0"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch"
 
-SRC_URI[md5sum] = "b9fa55b71cae73cb2e44254c2acc4e2c"
-SRC_URI[sha256sum] = "ae3376480a073b120c7add08f1e6cfcc08500648ccf22461cd42db6224a218c0"
+SRC_URI[md5sum] = "8f0eb41a344d19ac2aa9bd101dfb9ce6"
+SRC_URI[sha256sum] = "cafc9ed6a87c53a35175d5a1220a96ca386696eef2fa059cc0306211f246e55f"
 
 inherit autotools binconfig pkgconfig gettext
 
-- 
1.7.10.4


