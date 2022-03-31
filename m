Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0571FC43217
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:47:54 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.7266.1648734472624914593
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 06:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=JfqYXQ/7;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648734473; x=1680270473;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=DNirJCscLZWuYBDn3gpM3LLdX0BYZWeBFkphHGSsGwE=;
  b=JfqYXQ/7JO8NSvcYB/NFV9XqFy07v2vMYnLxnVVfxgxEy2RtE3b7v/Pk
   loeCV695b5RagshxQAj5pUu6FnF+umY6FRxjq4+lblIlahmsabu7Pw4zt
   VTxsUJwkkDOrl0iXKgcsgmgwRr0AxezYitNGz5/wRPWoeqF55YeX8g88q
   3enU1Ck64DJL/TgAEjcuAoTNZu79+XsxZgRNqxY4CGcE5SD/Ax1H8w17P
   lFLgqCidr08I19O7Wb69YBp5mFBPH5ASson024LZu65+ypGgz3GJQbcky
   pndTQDaq0cs7Qh4pco+q1zc2l+xRffCw2ugKt/AxSKxSX+xmekZaDlD7p
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259551794"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="259551794"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="520542125"
Received: from scho7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.39])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:38 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/20] webkitgtk : update to 2.30.6
Date: Thu, 31 Mar 2022 21:47:11 +0800
Message-Id: 
 <5dacf8e494d9c9871629c14cc9d92fb8af861d8c.1648734169.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648734169.git.anuj.mittal@intel.com>
References: <cover.1648734169.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 13:47:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163818

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../webkit/{webkitgtk_2.30.5.bb => webkitgtk_2.30.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.30.5.bb => webkitgtk_2.30.6.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.6.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.30.6.bb
index 93cca20d01..1fdba611ea 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.6.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://CVE-2021-42762.patch \
            "
 
-SRC_URI[sha256sum] = "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f"
+SRC_URI[sha256sum] = "50736ec7a91770b5939d715196e5fe7209b93efcdeef425b24dc51fb8e9d7c1e"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.35.1


