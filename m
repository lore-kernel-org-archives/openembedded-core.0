Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96BAC47089
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7190.1649169707422558639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=I0gFOAh6;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649169735; x=1680705735;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=e4Jtc430Fh0lyOHUNQTxtXVPaaRlHIqT12M8s3JP3F0=;
  b=I0gFOAh6Cav+p9z7xATCmeGyVF8dMuCaKxM7D1hDwwr+I/IPwAR+8rEN
   PNmtgEycL7sIrc5oKvSKXofmAQhPRazqF32unp/DaW17jGfxI6nQORLsn
   kQFCbEfrRq2gey6RJWVvEQlpvK6W7PseyCNT85M9hCZLYfLlBqC0idVNn
   jE2reNzYl8RfiJMdndZ41mB+7zN80j0I0V5WigxE71CpFrONU8WLFaIGp
   HO+lLgKzXRh6PRRLwuqQOo7soDYKMmRLyjzijU3MxOcuiNoD3KsIQxL6I
   UUEEgAG+3oCjoqxfZQlDOPYBXGVIRpSGA4HwZtl5Oqjb810h4ZSjR7UXr
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258348967"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="258348967"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="696953666"
Received: from ntabdull-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.226.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:14 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 19/22] grub: ignore CVE-2021-46705
Date: Tue,  5 Apr 2022 22:41:38 +0800
Message-Id: 
 <9c1d5229ba994bf100bf3f9371085dceacfaa518.1649169646.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649169646.git.anuj.mittal@intel.com>
References: <cover.1649169646.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164037

From: Ross Burton <ross@burtonini.com>

This is specific to SUSE Linux.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 594baef3b08d40fbbf1899f4cadeb9931c035c1a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index a72a562c5a..bdb3e2d999 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -27,6 +27,8 @@ SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae
 
 # Applies only to RHEL
 CVE_CHECK_WHITELIST += "CVE-2019-14865"
+# Applies only to SUSE
+CVE_CHECK_WHITELIST += "CVE-2021-46705"
 
 DEPENDS = "flex-native bison-native gettext-native"
 
-- 
2.35.1


