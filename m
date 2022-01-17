Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9C8C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 02:10:41 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.6039.1642385439848259298
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 18:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=LHgsp7Sv;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642385439; x=1673921439;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=OA4SfIyGL8i6we8sdQbeKRKPoYnvSawOCnDvbdvO41k=;
  b=LHgsp7SvYoGXdxUsaK4ZEFP78snFtgblJJxmOMCcRsNzMijQgwRC8qED
   FoeUtXL46rMhrYyZdyPW17I6dvg2j9kIie7knKyokTVsQV3PX/nxRIWY3
   UlYRNet7XrmDIBGiCxOJykNNlUa8x2oMcYjlktzpsczmn7S5RkVnULNY0
   Mf26Sk1IflvRTAdt7CbuBm+W3VAdFOSJ1BPgnHnw+9s8hTCM7Yec/0Exp
   YlD/RM4sTq6xaIvwyZa/xRBkRahUiqva7Jyniyw7srbGEin0/FwYf4sC0
   GJoj1Zb2rMkJQdyENvackS6yTOlTBLvu+kHMo9DS/YupNW7/ny/fYXmJ/
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="242094187"
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="242094187"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="492220682"
Received: from khershix-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.230.190])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:38 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 01/12] epiphany: Update 40.3 -> 40.6
Date: Mon, 17 Jan 2022 10:10:21 +0800
Message-Id: 
 <25b1c078dfa15fd7760c6bd2f5908d9373cca5dc.1642385249.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642385249.git.anuj.mittal@intel.com>
References: <cover.1642385249.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 02:10:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160620

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
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.34.1


