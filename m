Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: RXlkPst5sEDCfeQSytNUCuijlLC5nKWdHexXuWe3psD4AEZ2GUkCQxs0dkywD9e/OdtgrsCoIe
 M4u7RglIAlNA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818251"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818251"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:56 -0700
IronPort-SDR: UORtBeOb+m8VP7kGa91b0qrk9ybekI+h9EPFkrcqV8YwU7nVtNyTO56NCBzD15ZPDLx21sSmoF
 G9+j1k4aLRDg==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067490"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:55 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 44/64] packagegroup-core-tools-testapps.bb: Remove kexec for riscv32
Date: Mon, 26 Apr 2021 08:53:15 +0800
Message-Id: <77f2d0be675f7cbb539ef65507bb946ad9b295c7.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

kexec is not yet ported to riscv32.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f1e7da7737b3d6df27cc5af002fd1eb0c202d0b4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../packagegroups/packagegroup-core-tools-testapps.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index a5fc152859..015810cb6b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -16,6 +16,7 @@ KEXECTOOLS_e5500-64b ?= ""
 KEXECTOOLS_microblaze ?= ""
 KEXECTOOLS_nios2 ?= ""
 KEXECTOOLS_riscv64 ?= ""
+KEXECTOOLS_riscv32 ?= ""
 
 GSTEXAMPLES ?= "gst-examples"
 GSTEXAMPLES_riscv64 = ""
-- 
2.30.2

