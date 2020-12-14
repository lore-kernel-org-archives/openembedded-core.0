Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.29837.1607916928036729184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 9OBYUm1iNSVK8eHJIpuIplCQdJy0BWqDROEB4WWVJgPgWg7LNNJuTBRQsAwRC6XMhC5rMgIOSJ
 T1cEaGe3RLbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752422"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752422"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:46 -0800
IronPort-SDR: mdF8TpY1CBr0Au27b16yFuqhlSwVSS9D3xnYaZugqWMoZOvwJsH9XZ/VL5m/QX4BdiEi0v86+j
 ts6KJsQnqjYQ==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670826"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:45 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 19/19] wireless-regdb: upgrade 2020.04.29 -> 2020.11.20
Date: Mon, 14 Dec 2020 11:35:16 +0800
Message-Id: <18642d02ec492366199cf10c0af7fd70224b3c79.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zangrc <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5461c6b0e21877c58a75834f62324a4798c2000)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ireless-regdb_2020.04.29.bb => wireless-regdb_2020.11.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2020.04.29.bb => wireless-regdb_2020.11.20.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb
index a5827b9ef0..05ab95ed7f 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "89fd031aed5977c219a71501e144375a10e7c90d1005d5d086ea7972886a2c7a"
+SRC_URI[sha256sum] = "b4164490d82ff7b0086e812ac42ab27baf57be24324d4c0ee1c5dd6ba27f2a52"
 
 inherit bin_package allarch
 
-- 
2.29.2

