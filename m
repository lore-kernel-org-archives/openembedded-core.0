Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4319C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 04:09:26 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.27324.1641787762773038697
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 20:09:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=RrGJ1d7V;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641787765; x=1673323765;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=s+3AVthCouc9IPQMPQoo/VPn+3wWnypk21WZV9Tu+Fk=;
  b=RrGJ1d7Vup+tfCTEy7GX1tv7hNoiaLOA0Bh3sNgCS9KRDiIGUWn22iKN
   61DP00UBhGxYz0Ljxs5DwWghc2qRzEUhaO5BWKAYlgQpdGr5GcBy//J1Q
   hsZjLgb4HuTpc8vsivIHSvrRsz9ehF/TgISqFRpTYensbAmSXfY9NbY1r
   w/cN+F935dcU8Y8zu018uosivLeN+F4U/tJkcJZn4CJps4m1SDf3BDpQ9
   APnh5P+5tvewV/T/gU3Uf6+UcuQpDoCBPn2H1uICQwYfkBk70su6OWZC0
   pH24BjQbSvnFadcN4mhWXVy7y0lDWRMWf4NtG4sTvCi0H2VdYw4/ilyG/
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243347349"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="243347349"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="764402193"
Received: from bboox-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.135.82])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:23 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 02/10] xserver-xorg: update CVE_PRODUCT
Date: Mon, 10 Jan 2022 12:09:06 +0800
Message-Id: 
 <ca6c47b533ab38ea9705753a4f2a9e90eadea25b.1641787452.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641787452.git.anuj.mittal@intel.com>
References: <cover.1641787452.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 04:09:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160323

Some of the CVEs have x_server as the product name.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d5d63cf8605515bb659b6b732683d7fe6540728)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index e1fc0a06dc..85d0788eaf 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -19,7 +19,7 @@ SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.xz"
 
 UPSTREAM_CHECK_REGEX = "xorg-server-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
 
-CVE_PRODUCT = "xorg-server"
+CVE_PRODUCT = "xorg-server x_server"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-- 
2.33.1


