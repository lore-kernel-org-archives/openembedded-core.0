Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.6012.1589860668842217741
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 20:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: H9FGz3E+Ft6iCV/Xewd/48pA2a5uV3aJwkf9MtBkxFuDxihj9kMqpgjUi0v5IMx3h8y2vbCPon
 IQHSE//MNZXw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 20:57:48 -0700
IronPort-SDR: 0ZtIYdZHyvopebul4rigjIauSkBRRniS2RPqFvZ52RrQtenoVL6Zi1qvEb1R9FKb3CwTzZ/l8t
 sz+47R5RJIDQ==
X-IronPort-AV: E=Sophos;i="5.73,408,1583222400"; 
   d="scan'208";a="267749339"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.165.26])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 20:57:42 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] mtools: upgrade 4.0.23 -> 4.0.24
Date: Tue, 19 May 2020 11:57:24 +0800
Message-Id: <20200519035726.405506-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../mtools/mtools/disable-hardcoded-configs.patch           | 6 +++---
 .../mtools/{mtools_4.0.23.bb => mtools_4.0.24.bb}           | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.23.bb => mtools_4.0.24.bb} (90%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 464ccc4ca7..138ff9de76 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 5c24356762bc4274d3ca4930b0bc7754f4ffd19b Mon Sep 17 00:00:00 2001
+From fa6ebd96c7f330edcd74abf61584592eabb9e726 Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -12,10 +12,10 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index f086883..1c3f9bd 100644
+index 265d494..15e64dd 100644
 --- a/config.c
 +++ b/config.c
-@@ -701,14 +701,6 @@ void read_config(void)
+@@ -740,14 +740,6 @@ void read_config(void)
  	memcpy(devices, const_devices,
  	       nr_const_devices*sizeof(struct device));
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.23.bb b/meta/recipes-devtools/mtools/mtools_4.0.24.bb
similarity index 90%
rename from meta/recipes-devtools/mtools/mtools_4.0.23.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.24.bb
index 2093d80dba..d7cc72d172 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.23.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.24.bb
@@ -24,8 +24,8 @@ RRECOMMENDS_${PN}_libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[md5sum] = "1d17b58c53a46b29c7f521d4a55ccef1"
-SRC_URI[sha256sum] = "f188db26751aeb5692a79b2380b440ecc05fd1848a52f869d7ca1193f2ef8ee3"
+SRC_URI[md5sum] = "aeaf34406e9d28922b7c09a35ca5955e"
+SRC_URI[sha256sum] = "24f4a2da9219f98498eb1b340cd96db7ef9b684c067d1bdeb6e85efdd13b2fb9"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.25.4

