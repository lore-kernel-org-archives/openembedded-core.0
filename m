Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9D74E7719E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 13:26:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 01 Jun 2016 06:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,401,1459839600"; d="scan'208";a="988860474"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 01 Jun 2016 06:26:10 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 6C3236A4007;
	Wed,  1 Jun 2016 07:13:37 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 16:25:56 +0300
Message-Id: <1464787556-5848-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1464787556-5848-1-git-send-email-maxin.john@intel.com>
References: <1464787556-5848-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] libpam: update dependency list
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
X-List-Received-Date: Wed, 01 Jun 2016 13:26:09 -0000

Depend only on bison-native as configure script is checking
only for bison binary and libpam itself doesn't need target bison.

Add libxml2-native for deterministic build (it detects xmlcatalog
and xmllint)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/pam/libpam_1.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb b/meta/recipes-extended/pam/libpam_1.3.0.bb
index 966947c..bb5a4bd 100644
--- a/meta/recipes-extended/pam/libpam_1.3.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
@@ -34,7 +34,7 @@ SRC_URI_append_libc-musl = " file://0001-Add-support-for-defining-missing-funcit
                              file://include_paths_header.patch \
                            "
 
-DEPENDS = "bison flex flex-native cracklib"
+DEPENDS = "bison-native flex flex-native cracklib libxml2-native"
 
 EXTRA_OECONF = "--with-db-uniquename=_pam \
                 --includedir=${includedir}/security \
-- 
2.4.0


