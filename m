Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F88FC433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:55 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.13729.1645542530232186642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Z6BWoW+B;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542534; x=1677078534;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=seeMgeTCQDauEaDo27Ddhnh2I9RsuAPHHjZZj94Z6Tw=;
  b=Z6BWoW+BMj1itVUMCT4JvuQfLM9exF+eV4gpxdQhd+nv/dapoIIIFjEV
   8nHceTVSe/Oc2tHPAd9dFSFVR7yMsNvZbxkTQV9cQ9/MGebnFiszHXtBz
   4KBhwnVsdSf7KuayMASbIe3dmYLY2YequbJPUoZ3a4dQFGc7AwUk++PYl
   hySKqkFpxbwe2ymEMHJnOMLMQxVizcqKzhjnIH+/06xSS0ZmJTQH0fG5/
   jtL8b+B5OgH6C80Zxz/RRsxhojhBs4CAdXHuTve5aDEKmq6RA/hCQ3kOG
   SAakQZ8GX7sDLtM/pTkKh6/lqa9y4d4YcuxfBZT7Z5Wu7uTIccw1uLqnr
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305334"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305334"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258841"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:38 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 34/38] expat: Upgrade 2.4.4 -> 2.4.5
Date: Tue, 22 Feb 2022 23:07:35 +0800
Message-Id: 
 <b7d19a0a36325ec652f9fe40d0a3b90d489ec088.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162170

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This is a security fix release containing fixes for CVE-2022-25235, CVE-2022-25236,
CVE-2022-25313, CVE-2022-25314 and CVE-2022-25315.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b71344dacb71cfc452b335a6f2fb9cb74e2e1ff8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/expat/{expat_2.4.4.bb => expat_2.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.4.bb => expat_2.4.5.bb} (91%)

diff --git a/meta/recipes-core/expat/expat_2.4.4.bb b/meta/recipes-core/expat/expat_2.4.5.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.4.bb
rename to meta/recipes-core/expat/expat_2.4.5.bb
index 63d291ed40..2d9894a057 100644
--- a/meta/recipes-core/expat/expat_2.4.4.bb
+++ b/meta/recipes-core/expat/expat_2.4.5.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "14c58c2a0b5b8b31836514dfab41bd191836db7aa7b84ae5c47bc0327a20d64a"
+SRC_URI[sha256sum] = "fbb430f964c7a2db2626452b6769e6a8d5d23593a453ccbc21701b74deabedff"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.35.1


