Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.36963.1614009640008517381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:00:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: g4Ca2aSEL2JBQkiWqZJ04u9DwCSHZG4rg4nnVivPJ/qvonc/EoVc7GSnaKCiFmuUEedcMitc8a
 a1IDA0EbUc0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="181049323"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="181049323"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:46 -0800
IronPort-SDR: n/OIquqn8jgeF+dJ8zbUWmqjqi3HKJuX+LNn8MVMZCRHFnZiWaKZZQsVnck66g1F8XpyzE1j6f
 yJ7/ubyg6rsg==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430301833"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:44 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 05/30] connman: update to 1.39
Date: Tue, 23 Feb 2021 00:00:08 +0800
Message-Id: <3d9e9e299bde597ba2d57887ce436a25eed920bc.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: akuster <akuster808@gmail.com>

Bug fix only and includes two security fixes:

CVE-2021-26675
CVE-2021-26676

Changelog:
- Fix issue with scanning state synchronization and iwd.
- Fix issue with invalid key with 4-way handshake offloading.
- Fix issue with DNS proxy length checks to prevent buffer overflow.
- Fix issue with DHCP leaking stack data via uninitialized variable.

[Yocto #14231]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb20fd47d738f469f7bbeb4b8d85040f9163722b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../connman/{connman_1.38.bb => connman_1.39.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.38.bb => connman_1.39.bb} (78%)

diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb b/meta/recipes-connectivity/connman/connman_1.39.bb
similarity index 78%
rename from meta/recipes-connectivity/connman/connman_1.38.bb
rename to meta/recipes-connectivity/connman/connman_1.39.bb
index 027c41e9af..df42e9ffb8 100644
--- a/meta/recipes-connectivity/connman/connman_1.38.bb
+++ b/meta/recipes-connectivity/connman/connman_1.39.bb
@@ -9,8 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
 
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
 
-SRC_URI[md5sum] = "1ed8745354c7254bdfd4def54833ee94"
-SRC_URI[sha256sum] = "cb30aca97c2f79ccaed8802aa2909ac5100a3969de74c0af8a9d73b85fc4932b"
+SRC_URI[sha256sum] = "9f62a7169b7491c670a1ff2e335b0d966308fb2f62e285c781105eb90f181af3"
 
 RRECOMMENDS_${PN} = "connman-conf"
 RCONFLICTS_${PN} = "networkmanager"
-- 
2.29.2

