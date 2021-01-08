Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3706.1610079500392423505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 0i6m9AmN5LbT1+QHIwYuCp9JidYEkLXN3x5y7ooh/qpJcTs9FJrj2cZBv7AHfCp7qsxPCj0I0A
 7JQADlzIa5pQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613682"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613682"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:37 -0800
IronPort-SDR: eg9K2nZMl0aoDxk6E/40ru8RGinrwulO0aZdR6c5ouNCvjQkqzl644ISfrf4tomc5seFF7ZxxB
 9uNFs1whyfRg==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209442"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:36 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 14/30] timezone: upgrade to 2020f
Date: Fri,  8 Jan 2021 12:17:56 +0800
Message-Id: <7f9c55651c47ad4b62f504c4725393f03ea7b1d3.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Release 2020f - 2020-12-29 00:17:46 -0800

  Change to build procedure

    'make rearguard_tarballs' no longer generates a bad rearguard.zi,
    fixing a 2020e bug.  (Problem reported by Deborah Goldsmith.)

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c7efa4d28d632d415ca574140586570ca376caf6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index d175f0d4a0..9a19093e24 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2020e"
+PV = "2020f"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "3e10308976b09305d15cb4a32ff75483421f2063bfa24a9be366a027e7cd2902"
-SRC_URI[tzdata.sha256sum] = "0be1ba329eae29ae1b54057c3547b3e672f73b3ae7643aa87dac85122bec037e"
+SRC_URI[tzcode.sha256sum] = "cfeeea2a7745164f64bd9f6d76e47916f4ac820c4434493674adbbd4324329c5"
+SRC_URI[tzdata.sha256sum] = "121131918c3ae6dc5d40f0eb87563a2be920b71a76e2392c09519a5e4a666881"
-- 
2.29.2

