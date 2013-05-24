Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 427346A453
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 09:16:20 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 May 2013 02:16:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,734,1363158000"; d="scan'208";a="246063887"
Received: from work.rb.intel.com ([10.237.105.51])
	by AZSMGA002.ch.intel.com with ESMTP; 24 May 2013 02:16:20 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2013 12:18:07 +0300
Message-Id: <b93824e44f2df285a89c86c20fba461e8642432c.1369386157.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369386157.git.ionutx.radu@intel.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1369386157.git.ionutx.radu@intel.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
Subject: [PATCH 3/7] libtasn1: Updated from 2.14 to 3.3
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
X-List-Received-Date: Fri, 24 May 2013 09:16:20 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../recipes-support/gnutls/{libtasn1_2.14.bb => libtasn1_3.3.bb} |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_2.14.bb => libtasn1_3.3.bb} (81%)

diff --git a/meta/recipes-support/gnutls/libtasn1_2.14.bb b/meta/recipes-support/gnutls/libtasn1_3.3.bb
similarity index 81%
rename from meta/recipes-support/gnutls/libtasn1_2.14.bb
rename to meta/recipes-support/gnutls/libtasn1_3.3.bb
index 68d5ddf..53de118 100644
--- a/meta/recipes-support/gnutls/libtasn1_2.14.bb
+++ b/meta/recipes-support/gnutls/libtasn1_3.3.bb
@@ -8,15 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://README;endline=8;md5=c3803a3e8ca5ab5eb1e5912faa405351"
 
-PR = "r1"
-
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://libtasn1_fix_for_automake_1.12.patch \
            file://dont-depend-on-help2man.patch \
            "
 
-SRC_URI[md5sum] = "a08c5936f9672da9b05691785499bcc3"
-SRC_URI[sha256sum] = "bc2936cd20267859278145e563427c274d27aaae30ecdf50a04cdd4ec0153d54"
+SRC_URI[md5sum] = "2bdd687f487c50a0382b99553866a6e0"
+SRC_URI[sha256sum] = "92652a2cd10f63c56984b5e5cee46ecadf2292e2262fff99278f7ee46ff93ac0"
 
 inherit autotools binconfig lib_package
 
-- 
1.7.10.4


