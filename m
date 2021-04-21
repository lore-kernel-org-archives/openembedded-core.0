Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.8491.1618985193802685644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 23:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Ln5H5umCM4azWYzUJwdvuYDW0/pJNd6c4MGhookjSvFgThNoGsqP0bYMwnQPI5PRtn8Sl05c1b
 HQmgoY/jvVnQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="195671493"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="195671493"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 23:06:33 -0700
IronPort-SDR: eMVVdXhedv3T7m0NdFakq6fiqyj6TEuI3Y7juLSjoHmqmc+HKSd/yUYf2HVPk4MyjaKOy6XGCX
 Utql2Pscgb7A==
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="385684403"
Received: from slow4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.70.252])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 23:06:32 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 1/8] pseudo: Upgrade to add trailing slashes ignore path fix
Date: Wed, 21 Apr 2021 14:06:13 +0800
Message-Id: <9408daa28ffa9cbbcf5c989783b9f190ca8bb62c.1618984878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618984878.git.anuj.mittal@intel.com>
References: <cover.1618984878.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pull in:
  client: strip trailing slashes when opening an ignored path

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9fb92bc13b8a78ef98798f14e728058feb180ba6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 17bd02c27c..4eab133128 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "60e25a36558f1f07dcce1a044fe976b475bec42b"
+SRCREV = "ee24ebec9e5a11dd5208c9be2870f35eab3b9e20"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.30.2

