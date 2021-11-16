Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A087C433FE
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:24:30 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web08.5113.1637033069755751165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="220822388"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="220822388"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:29 -0800
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="567023920"
Received: from jli90-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.214.145.204])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:27 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/14] linunistring: Add missing gperf-native
 dependency
Date: Tue, 16 Nov 2021 11:24:07 +0800
Message-Id: 
 <3a467c35588cc60c80049758d4bfd57ff4a7678c.1637032974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637032974.git.anuj.mittal@intel.com>
References: <cover.1637032974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 03:24:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158324

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 73d3efbaeb2f412ab8d3491d2da3f3124fc009f3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/libunistring/libunistring_0.9.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libunistring/libunistring_0.9.10.bb b/meta/recipes-support/libunistring/libunistring_0.9.10.bb
index 0a7b18ed08..589faacb05 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.10.bb
+++ b/meta/recipes-support/libunistring/libunistring_0.9.10.bb
@@ -18,6 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
                     file://README;beginline=45;endline=65;md5=08287d16ba8d839faed8d2dc14d7d6a5 \
                     file://doc/libunistring.texi;md5=287fa6075f78a3c85c1a52b0a92547cd \
                    "
+DEPENDS = "gperf-native"
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-- 
2.33.1


