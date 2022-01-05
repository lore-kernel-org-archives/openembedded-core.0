Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED15BC4332F
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 15:19:34 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web12.1733.1641395973368105348
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 07:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=UPhaXLn7;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641395974; x=1672931974;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Klu0vJlr7j9sLLEfbixFn9/ZEfqAfbR4OAw+Y2gMUWc=;
  b=UPhaXLn74Eyy7Q3z66GJ6XcgdfvvdwX4Vtjne0uH5wlKSw3eMQgSdmP+
   H4IB6QbnQNyC+a61gzJnCbnOJa8QRDXTk7qHTI6H/xZr1FK+1/GAtLHZi
   anEUFDsTWBJJRxbaNC54Uv200gA/EuVEuW+37gjSUYAQv1iongOVU4vl+
   2851NiaITM8edO/CHpl6q3WMbm4pqO6xRWezPoHp8WtKogocrblvJfGlN
   fkAaChfxCk8UyZuSOb7mfcpsmUfkZNLeTfxCRZEwZzveE04DFo3VpVKVg
   YZ6N2wie6zbU2crhhRgSXiYaxQv/nd2W4roe1xxUftevLrDNQLBRA7VnT
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="223147030"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="223147030"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="668128713"
Received: from hanwenlx-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.129.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:32 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 22/24] xserver-xorg: update CVE_PRODUCT
Date: Wed,  5 Jan 2022 23:18:42 +0800
Message-Id: 
 <1f86315f5993ddaafddb99da536bb1a51786fe59.1641395036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641395036.git.anuj.mittal@intel.com>
References: <cover.1641395036.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 15:19:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160206

Some of the CVEs have x_server as the product name.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d5d63cf8605515bb659b6b732683d7fe6540728)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index b3e03744c0..497515a04a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -17,7 +17,7 @@ PE = "2"
 XORG_PN = "xorg-server"
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
 
-CVE_PRODUCT = "xorg-server"
+CVE_PRODUCT = "xorg-server x_server"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-- 
2.33.1


