Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 86D477990B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 00:40:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="46232908"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Oct 2018 08:40:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 44BDD4B6ED70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 08:40:03 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 17 Oct 2018 08:40:03 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Oct 2018 08:40:15 +0800
Message-ID: <20181017004016.7897-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20181017004016.7897-1-hongl.fnst@cn.fujitsu.com>
References: <20181017004016.7897-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 44BDD4B6ED70.AF84C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] geoipupdate:2.5.0->3.1.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2018 00:40:08 -0000
Content-Type: text/plain

1.Upgrade geoipupdate from 2.5.0 to 3.1.1.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../geoip/{geoipupdate-2.5.0 => geoipupdate-3.1.1}/GeoIP.conf     | 0
 .../{geoipupdate-2.5.0 => geoipupdate-3.1.1}/geoipupdate.cron     | 0
 .../geoip/{geoipupdate_2.5.0.bb => geoipupdate_3.1.1.bb}          | 8 ++++----
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/geoip/{geoipupdate-2.5.0 => geoipupdate-3.1.1}/GeoIP.conf (100%)
 rename meta-networking/recipes-support/geoip/{geoipupdate-2.5.0 => geoipupdate-3.1.1}/geoipupdate.cron (100%)
 rename meta-networking/recipes-support/geoip/{geoipupdate_2.5.0.bb => geoipupdate_3.1.1.bb} (76%)

diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.5.0/GeoIP.conf b/meta-networking/recipes-support/geoip/geoipupdate-3.1.1/GeoIP.conf
similarity index 100%
rename from meta-networking/recipes-support/geoip/geoipupdate-2.5.0/GeoIP.conf
rename to meta-networking/recipes-support/geoip/geoipupdate-3.1.1/GeoIP.conf
diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.5.0/geoipupdate.cron b/meta-networking/recipes-support/geoip/geoipupdate-3.1.1/geoipupdate.cron
similarity index 100%
rename from meta-networking/recipes-support/geoip/geoipupdate-2.5.0/geoipupdate.cron
rename to meta-networking/recipes-support/geoip/geoipupdate-3.1.1/geoipupdate.cron
diff --git a/meta-networking/recipes-support/geoip/geoipupdate_2.5.0.bb b/meta-networking/recipes-support/geoip/geoipupdate_3.1.1.bb
similarity index 76%
rename from meta-networking/recipes-support/geoip/geoipupdate_2.5.0.bb
rename to meta-networking/recipes-support/geoip/geoipupdate_3.1.1.bb
index f4eb2b7..8eb71c5 100644
--- a/meta-networking/recipes-support/geoip/geoipupdate_2.5.0.bb
+++ b/meta-networking/recipes-support/geoip/geoipupdate_3.1.1.bb
@@ -6,17 +6,17 @@ SECTION = "net"
 
 DEPENDS = "zlib curl"
 
-SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v2.5.0/geoipupdate-2.5.0.tar.gz \
+SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v3.1.1/geoipupdate-3.1.1.tar.gz \
            file://GeoIP.conf \
            file://geoipupdate.cron \
           "
-SRC_URI[md5sum] = "28f633c49ec87ab01ad3c0fb0228a696"
-SRC_URI[sha256sum] = "5119fd0e338cd083e886228b26679c64bcbaade8a815be092aecf865a610ab26"
+SRC_URI[md5sum] = "e4b9bb0b60748e2f49c8ed07ea330fbd"
+SRC_URI[sha256sum] = "3de22e3fe3282024288a00807bbea9a1ffa2d1e8fe9c611f4b14a5b4d8ebe08a"
 
 LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "\
-file://ChangeLog.md;md5=11d2e31df0de2be3ccc3e2286c4dafcb \
+file://ChangeLog.md;md5=30029632df335cb696f68ecc2a428987 \
 "
 FILES_${PN} = "/usr/share/GeoIP \
               /etc/GeoIP.conf \
-- 
2.7.4




