Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.3973.1613541234297592813
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:53:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: zbjqZA1ix56MOvlyaXuCyjRqvTumOecOjAiPPGHSxW7ZXKBI48NtF4vzIWIXJb6URYmdoeq6E0
 /FmzaaBFJJJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247210"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247210"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:52 -0800
IronPort-SDR: 3OwkXGh8FuEN75a8EzPRA2cFL4L6jvFpfF5x08CH+2G/0bexW5eZ7xY37OUSByw50rH+35y6pb
 5h6NyR+vy5EQ==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825487"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:51 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 27/27] libxt: upgrade 1.2.0 -> 1.2.1
Date: Wed, 17 Feb 2021 13:52:10 +0800
Message-Id: <20210217055210.22019-27-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../xorg-lib/{libxt_1.2.0.bb => libxt_1.2.1.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxt_1.2.0.bb => libxt_1.2.1.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb b/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb
rename to meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb
index 54384521c8..8f2cded1df 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb
@@ -24,8 +24,7 @@ XORG_PN = "libXt"
 
 SRC_URI += "file://libxt_fix_for_x32.patch"
 
-SRC_URI[md5sum] = "a9019421d3ee8b4937b6afd9025f018a"
-SRC_URI[sha256sum] = "b31df531dabed9f4611fc8980bc51d7782967e2aff44c4105251a1acb5a77831"
+SRC_URI[sha256sum] = "679cc08f1646dbd27f5e48ffe8dd49406102937109130caab02ca32c083a3d60"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.29.2

