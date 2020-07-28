Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8237.1595926357616374658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: vtOfFchcqgbFgKEG5uQzZp+AalHPPL814DPvr4kq4Gz+TCl4bt9r7DSvIL9UTHKiqq61kq8kp8
 FRmmgkcJ74Qg==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699655"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699655"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:40 -0700
IronPort-SDR: TjipAPnQ/bDdldDm6kEpDNyZj8ELLwQ58DsWsa9738go1cBnEVncDTY6FTqsN2+78Vo1Fap8MA
 abokhTACgZxA==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245701"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:39 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 02/32] timezone: upgrade 2019c -> 2020a
Date: Tue, 28 Jul 2020 16:51:03 +0800
Message-Id: <9a75b44244b42cdd341ee38a253b2d935ae05ee1.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pierre-Jean Texier <pjtexier@koncepto.io>

See full changelog https://github.com/eggert/tz/blob/master/NEWS#L11

(From OE-Core rev: 9d74b048e3a160d7a9a20e85817e9eb3a558af63)

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/timezone/timezone.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index f6bab1acb4..e542290c3c 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2019c"
+PV = "2020a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -12,7 +12,7 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "195a17454c5db05cab96595380650391"
-SRC_URI[tzcode.sha256sum] = "f6ebd3668e02d5ed223d3b7b1947561bf2d2da2f4bd1db61efefd9e06c167ed4"
-SRC_URI[tzdata.md5sum] = "f6987e6dfdb2eb83a1b5076a50b80894"
-SRC_URI[tzdata.sha256sum] = "79c7806dab09072308da0e3d22c37d3b245015a591891ea147d3b133b60ffc7c"
+SRC_URI[tzcode.md5sum] = "f87c3477e85a5c4b00df0def6c6a0055"
+SRC_URI[tzcode.sha256sum] = "7d2af7120ee03df71fbca24031ccaf42404752e639196fe93c79a41b38a6d669"
+SRC_URI[tzdata.md5sum] = "96a985bb8eeab535fb8aa2132296763a"
+SRC_URI[tzdata.sha256sum] = "547161eca24d344e0b5f96aff6a76b454da295dc14ed4ca50c2355043fb899a2"
-- 
2.25.4

