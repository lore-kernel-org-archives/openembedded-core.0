Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE53C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:21:23 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.8485.1646749280809201859
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:21:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Wp7zJKFr;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646749282; x=1678285282;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=hKx+HQD3qLUq9SMzDN2sgWrX63aCnFbCdaQHGVmD9LM=;
  b=Wp7zJKFr+Rn6qxUzXVlQy1Av9Bl/Hh7EMNElv9XEMyee+mlSaN+M9dVK
   WKWwe/to7JG2+yC/DkD/i8w6931/CaTEiCSp01AKTp/FxvmoZlWqQ1jS9
   PuRkbrcje4YvrX5Y+x/xZ+ABu/Sq2EMejVDKsaisrLoJEu9BogZo1PvU3
   Hc0WMNQBLziPagdoYBeo6X01PBDZqnJvmcIklKrl1t17ty3WbNE3Bo8yP
   soFjykSiIbKA/u6vyTsWOzEEBD2xt6URri7UAWxVkLqgVdAl39v5sZWHx
   T1CPAK5ABy+pm2P4LAG1QAAHDEiKnEigwhzFLExHXM1aTp51eR3GIWamW
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="242130097"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="242130097"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:50 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="513119951"
Received: from sktoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.225.176])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:48 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 08/15] asciidoc: update git repository
Date: Tue,  8 Mar 2022 22:19:59 +0800
Message-Id: 
 <e5beba08c03fa773e2b4fc4a12662825ac4e2b71.1646748870.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646748869.git.anuj.mittal@intel.com>
References: <cover.1646748869.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 14:21:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162915

From: Ross Burton <ross@burtonini.com>

The asciidoc-py3 repository has been renamed to asciidoc-py.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f78dd3f4c5f0cd738783e75f3796e1da2a2a2ba1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/asciidoc/asciidoc_9.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_9.1.0.bb b/meta/recipes-extended/asciidoc/asciidoc_9.1.0.bb
index 523bf33f42..3869abee59 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_9.1.0.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_9.1.0.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
                     file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
 
-SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https;branch=9.x"
+SRC_URI = "git://github.com/asciidoc/asciidoc-py;protocol=https;branch=9.x"
 SRCREV = "9705d428439530104ce55d0ba12e8ef9d1b57ad1"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
-- 
2.35.1


