Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: jnUjhJUZRH62D5Y+/cdHQAiTo0Qkwq26DtrI2lIjqQhq+LU46Q1jg970/Pj2RxshGitT7/mf2A
 8cVG5r5myNiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671199"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671199"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:55 -0800
IronPort-SDR: jwqm3i6iD/f+i8B1QWsg7floHKCF/pMU1FYs3pKt4q2MLe0OKgvVSNsZkZfVB4B0HGxTHrHYZg
 YcfVZDX4ARIA==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408129124"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:54 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 42/52] populate_sdk: Add directories to PSEUDO_IGNORE_PATHS
Date: Fri,  5 Mar 2021 12:21:18 +0800
Message-Id: <8735e9ad6f39a2ae5bf3969ece57eae2fbe495c2.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Some paths used in sdk construction shouldn't be tracked under pseudo
so list these.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 21621e09162ff9e8014a1cfba78d0f2c3746202a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 49b1833265..942d3ec091 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -178,7 +178,7 @@ do_populate_sdk[sstate-inputdirs] = "${SDKDEPLOYDIR}"
 do_populate_sdk[sstate-outputdirs] = "${SDK_DEPLOY}"
 do_populate_sdk[stamp-extra-info] = "${MACHINE_ARCH}${SDKMACHINE}"
 
-PSEUDO_IGNORE_PATHS .= ",${SDKDEPLOYDIR}"
+PSEUDO_IGNORE_PATHS .= ",${SDKDEPLOYDIR},${WORKDIR}/oe-sdk-repo,${WORKDIR}/sstate-build-populate_sdk"
 
 fakeroot create_sdk_files() {
 	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
-- 
2.29.2

