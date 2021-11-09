Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C6FC433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:38:29 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.12976.1636468691816879860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 06:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="229915926"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="229915926"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:28 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="641956902"
Received: from chinboon-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.207])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:27 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 14/26] libpcre/libpcre2: correct SRC_URI
Date: Tue,  9 Nov 2021 22:37:49 +0800
Message-Id: 
 <1be81f77e3c479a1c11d1d5ea06653b596cbd00b.1636467986.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636467986.git.anuj.mittal@intel.com>
References: <cover.1636467986.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 14:38:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158035

From: Alexander Kanavin <alex.kanavin@gmail.com>

http://ftp.pcre.org is down, take sources according to links on
http://www.pcre.org

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 81ba0ba3e8d9c08b8dc69c24fb1d91446739229b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/libpcre/libpcre2_10.37.bb | 4 +++-
 meta/recipes-support/libpcre/libpcre_8.45.bb   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.37.bb b/meta/recipes-support/libpcre/libpcre2_10.37.bb
index e0ead59da6..ccedf688d7 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.37.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.37.bb
@@ -10,7 +10,9 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=6b3022283c9a79238d521848ea9dcb4d"
 
-SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2"
+SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
+
+UPSTREAM_CHECK_URI = "https://github.com/PhilipHazel/pcre2/releases"
 
 SRC_URI[sha256sum] = "4d95a96e8b80529893b4562be12648d798b957b1ba1aae39606bbc2ab956d270"
 
diff --git a/meta/recipes-support/libpcre/libpcre_8.45.bb b/meta/recipes-support/libpcre/libpcre_8.45.bb
index 76b20f5f08..46fedbae48 100644
--- a/meta/recipes-support/libpcre/libpcre_8.45.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.45.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b5d5d1a69a24ea2718263f1ff85a1c58"
-SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
+SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
            file://run-ptest \
            file://Makefile \
            "
-- 
2.31.1


