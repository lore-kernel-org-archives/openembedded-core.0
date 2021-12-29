Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86900C433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Dec 2021 01:35:07 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.46407.1640741706413209419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Dec 2021 17:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=eYHmVRFc;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640741706; x=1672277706;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CQe/c6fygPEPS7jfE1YD1VZsOjXAF++ovgxU4qQHxIY=;
  b=eYHmVRFcZrQkpHOEkXuBICr1DuReWE3WOBkfRSlJW+zGRumAJx7SOamt
   z+6tRpsH82yvXuHDxXWg5+2ky2dvnf6Fd72YJzRWVRcP/JYn+Gt33o+ed
   RRKcEKZcixEP12bEkQK8TZvp+RtPL04tJ9CnCQ7kZspxo06tOFRDitO2W
   7Dt4U5UwxkscQ6Nzb2Iz7RJfD+0DjaxD+z+3N9J7WFNQRHfU1DlIECrsB
   dkt7hfztVIW5+wRrBOmfhzmExUW/Ifb/kQo4jtK/oeH64cJa0YcO5ODNG
   LsqY5PQ79n/zAM9Gcao1f7WIzmFm9wSSWlDFMLmIWTgCRdPJxdsyftA3H
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="238987980"
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600";
   d="scan'208";a="238987980"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2021 17:35:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600";
   d="scan'208";a="554382693"
Received: from ruizhonx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.253])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2021 17:35:04 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xserver-xorg: update CVE_PRODUCT
Date: Wed, 29 Dec 2021 09:34:56 +0800
Message-Id: <20211229013456.474188-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Dec 2021 01:35:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160045

Some of the CVEs have x_server as the product name.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 7d1f17e7777..4e88cf26f72 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -19,7 +19,7 @@ SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.xz"
 
 UPSTREAM_CHECK_REGEX = "xorg-server-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
 
-CVE_PRODUCT = "xorg-server"
+CVE_PRODUCT = "xorg-server x_server"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-- 
2.33.1


