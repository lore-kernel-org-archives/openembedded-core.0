Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 0y55vWUCK6qJnLuQhvs8CJUE6wcW2YodxHVt241paSE9r2PoPqeTk2tAr3898hR0/hRtnjkjqy
 r7alzOdQOcKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247108"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247108"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:30 -0800
IronPort-SDR: kojRTCKFlA4Vsu1B+KfILT8L7HaWJUjVPCFvbQu5pLolBu3+HX+uEZe78IMT5VH4oT022NBpsx
 JiYwYjAURH+A==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825420"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:28 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/27] pigz: upgrade 2.4 -> 2.6
Date: Wed, 17 Feb 2021 13:51:54 +0800
Message-Id: <20210217055210.22019-11-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/pigz/{pigz_2.4.bb => pigz_2.6.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/pigz/{pigz_2.4.bb => pigz_2.6.bb} (91%)

diff --git a/meta/recipes-extended/pigz/pigz_2.4.bb b/meta/recipes-extended/pigz/pigz_2.6.bb
similarity index 91%
rename from meta/recipes-extended/pigz/pigz_2.4.bb
rename to meta/recipes-extended/pigz/pigz_2.6.bb
index 8c65ec34f0..05be9b733f 100644
--- a/meta/recipes-extended/pigz/pigz_2.4.bb
+++ b/meta/recipes-extended/pigz/pigz_2.6.bb
@@ -9,8 +9,7 @@ LICENSE = "Zlib & Apache-2.0"
 LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21"
 
 SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
-SRC_URI[md5sum] = "def2f6e19d9d8231445adc1349d346df"
-SRC_URI[sha256sum] = "a4f816222a7b4269bd232680590b579ccc72591f1bb5adafcd7208ca77e14f73"
+SRC_URI[sha256sum] = "2eed7b0d7449d1d70903f2a62cd6005d262eb3a8c9e98687bc8cbb5809db2a7d"
 PROVIDES_class-native += "gzip-native"
 
 # Point this at the homepage in case /fossils/ isn't updated
-- 
2.29.2

