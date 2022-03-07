Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0607CC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:13:42 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.26505.1646662420742202043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=KstIdRgq;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662420; x=1678198420;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oS6fSvh75+ebqVefIfW3O3IUksGBblJNt5TbS4YoXzQ=;
  b=KstIdRgqbbl6OiixxqrnWtzDjvZDGBwTsIyquP2OkZ+9JOF3g5Ld+yr7
   /hqjcfalOejqtNtfkYeWdNyHmZQXXpYhxi5hX2jKQgR80rREdEnk7E5yX
   d3kJdqXhRHuFCHlxaeHAeCbI11rHV7rMK8Wa/s9qAf3fiBrX8WLzPHNRc
   ORTGNrKTfEI4idUmxntjc/41+v2bqBXmu53MohtuWgDrTL0+EReSVRxie
   I9votivt4nkbXnPhqmg6VncQ84AH/x3L86mlIBHuJ0n0ewWdoS5HQK8f8
   Nlrra3TKgvRrM1NGDV7YAp20vMmx6BE8s/PHoq+OvvHLGsxtd3WK7IUBF
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112434"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112434"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:12 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070780"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:10 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 03/25] libarchive: upgrade 3.5.1 -> 3.5.2
Date: Mon,  7 Mar 2022 22:09:39 +0800
Message-Id: 
 <d2e9f293a719cd612c667877735d1de08454e3ac.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:13:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162824

From: Alexander Kanavin <alex.kanavin@gmail.com>

(From OE-Core rev: f8f39cd5757907d50444203e0e6e2c5ed0a47152)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libarchive/{libarchive_3.5.1.bb => libarchive_3.5.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.5.1.bb => libarchive_3.5.2.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.5.1.bb b/meta/recipes-extended/libarchive/libarchive_3.5.2.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.5.1.bb
rename to meta/recipes-extended/libarchive/libarchive_3.5.2.bb
index 7d98e573b8..385bcef6e9 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.5.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.5.2.bb
@@ -34,7 +34,7 @@ EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "9015d109ec00bb9ae1a384b172bf2fc1dff41e2c66e5a9eeddf933af9db37f5a"
+SRC_URI[sha256sum] = "5f245bd5176bc5f67428eb0aa497e09979264a153a074d35416521a5b8e86189"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.35.1


