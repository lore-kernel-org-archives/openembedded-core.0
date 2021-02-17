Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 4oTIP7/HMN3NxHdf6INqgOLo8CIS+Vij56XBq4XG7YzvxoBtsT+DWaTStSGIli6qOkAc2bRI+l
 AST1xLYGtnjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247194"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247194"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:46 -0800
IronPort-SDR: zS3v1cjcuHNqH6sVGvEH+NMOP3DnX7XaujsAJks0DLG9SSUfgowZsAr0lIDIbMn+2nuGYX585d
 8A8FhrUBq1Wg==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825466"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:45 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 23/27] gtk+3: upgrade 3.24.24 -> 3.24.25
Date: Wed, 17 Feb 2021 13:52:06 +0800
Message-Id: <20210217055210.22019-23-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.24.bb => gtk+3_3.24.25.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.24.bb => gtk+3_3.24.25.bb} (89%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb
index 01a2a94ce3..8c5426f22b 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.25.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
            "
-SRC_URI[sha256sum] = "cc9d4367c55b724832f6b09ab85481738ea456871f0381768a6a99335a98378a"
+SRC_URI[sha256sum] = "87e26b111d3b8a85ff218980a56f3e814257b8dd11e5c4d9a2803b423b08297c"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.29.2

