Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.2597.1613622265608276454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 20:24:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: IsEkDpMQkPeNTcdvIj3+XsCRxbtpFG9cRt/L1xAts1Yko3oqDYi1kabwewsjtc812fXoBF7ElR
 fQy98gVMmsyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="163178021"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="163178021"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:38 -0800
IronPort-SDR: NKa9g3Fleg5A98MarRX1rnrG1DPV8DE0ZJBoG4Wvnt+tzdF15nDxvUPdqLvN0hEiezbiIIzFOv
 pPL0nvC/7Pbw==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="378269227"
Received: from zaizam-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.203])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:37 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/12] man-db: upgrade 2.9.3 -> 2.9.4
Date: Thu, 18 Feb 2021 12:24:17 +0800
Message-Id: <20210218042418.281245-11-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210218042418.281245-1-anuj.mittal@intel.com>
References: <20210218042418.281245-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../man-db/{man-db_2.9.3.bb => man-db_2.9.4.bb}            | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.9.3.bb => man-db_2.9.4.bb} (89%)

diff --git a/meta/recipes-extended/man-db/man-db_2.9.3.bb b/meta/recipes-extended/man-db/man-db_2.9.4.bb
similarity index 89%
rename from meta/recipes-extended/man-db/man-db_2.9.3.bb
rename to meta/recipes-extended/man-db/man-db_2.9.4.bb
index e8da92bd19..432953a1bc 100644
--- a/meta/recipes-extended/man-db/man-db_2.9.3.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
-SRC_URI[sha256sum] = "fa5aa11ab0692daf737e76947f45669225db310b2801a5911bceb7551c5597b8"
+SRC_URI[sha256sum] = "b66c99edfad16ad928c889f87cf76380263c1609323c280b3a9e6963fdb16756"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS_${PN} += "base-passwd"
@@ -21,11 +21,6 @@ inherit gettext pkgconfig autotools systemd
 EXTRA_OECONF = "--with-pager=less --with-systemdsystemunitdir=${systemd_unitdir}/system"
 EXTRA_AUTORECONF += "-I ${S}/gl/m4"
 
-# Can be dropped when the output next changes, avoids failures after
-# reproducibility issues
-PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".1"
-
 do_install() {
 	autotools_do_install
 
-- 
2.29.2

