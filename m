Return-Path: <khairul.rohaizzat.jamaluddin@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1A7C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 03:05:20 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.4063.1642043119989621866
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 19:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=lIHqgwAF;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642043120; x=1673579120;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GxQPD5CWQajfdhNY4iKTNrCRq3YzZ4fv2rH0fqlWOpM=;
  b=lIHqgwAF8vWtW24XKL8xIfOh85pwjyzge8C3FbYaNwO/h16pe1tab7yE
   0yzYfXCNAnWXV5V6c19soYngQvrpers7ml9LoPvQuIHvJUZ1tnqj8WW4L
   7g8Q/uOO+SnJx4sjh+3WhxHc8EMV1IKCvdL8D7md66wkqRaSyvlGuo9jK
   ybL3tz+n+Q6lCdqGaJ/l995cK5J+pzsT9reji9wJB/xGLApZ5WW19o4+f
   UlqVJr9r2qOkVOd4mQZM2iGwW4eKz7JuOkyvYH8/Yx067MhFoI/rJL3CG
   qSQbcqcaLrG+UCAdEWfw7lnVhgp2SoJ6OohBf4x5l5btDgLC5JM4dMo0c
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="243710606"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600";
   d="scan'208";a="243710606"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 19:05:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600";
   d="scan'208";a="576793353"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga008.fm.intel.com with ESMTP; 12 Jan 2022 19:05:15 -0800
From: khairul.rohaizzat.jamaluddin@intel.com
To: openembedded-core@lists.openembedded.org
Cc: khairul.rohaizzat.jamaluddin@intel.com
Subject: [PATCH][honister] epiphany: Update 40.3 -> 40.6
Date: Thu, 13 Jan 2022 11:05:15 +0800
Message-Id: <20220113030515.20667-1-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 03:05:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160504

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

40.4 Changelogs:
Fix crash when clearing all passwords (#1570)
Fix security indicator disappearing after entering reader mode (#1580)
Fix crash opening PDFs not loaded via HTTP (#1611)
Fix CVE-2021-45085, CVE-2021-45086, CVE-2021-45087, CVE-2021-45088 (#1612)
Fix web applications with non-Latin characters (#1626, #1627)
Disable captive portal helper in Pantheon desktop (!1006, Cassidy James Blaede)
Somewhat improve password manager robustness (!1014)

40.5 Changelogs:
Fix reader mode (!1047)

40.6 Changelogs:
Fix Reload buttons on error pages (!1050)
Fix delete button in about:applications (!1050)

CVE: CVE-2021-45085 CVE-2021-45086 CVE-2021-45087 CVE-2021-45088

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 .../epiphany/{epiphany_40.3.bb => epiphany_40.6.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_40.3.bb => epiphany_40.6.bb} (93%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_40.3.bb b/meta/recipes-gnome/epiphany/epiphany_40.6.bb
similarity index 93%
rename from meta/recipes-gnome/epiphany/epiphany_40.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_40.6.bb
index c5dc0baefa..1f3fab3c4a 100644
--- a/meta/recipes-gnome/epiphany/epiphany_40.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_40.6.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "dad138b9f2d55de271128fca38b61f53fd980c587d29e1ba6b508fff3b19f564"
+SRC_URI[archive.sha256sum] = "a2abf71b165b4302643147d637808847d64df6a97ce460703542dec75e81b5f7"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.33.1


