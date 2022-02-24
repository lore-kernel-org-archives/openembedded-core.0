Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52ECEC433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 06:30:43 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web08.7260.1645684241176371553
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 22:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=nfrgPVpE;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645684242; x=1677220242;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Qpbf/5kT+yqy6sUjnzTGiIbnniV9tzjWqBQOsBJDiUA=;
  b=nfrgPVpEBPLPd63Nx5xbxm5g+75j219zvjyLZnUlEqYJqUVXyDp4ebt3
   SQcys92hcJGgidWKvl8XilpvXTz5h8lie6hG9SeSYjXfxXTWG5dEJu1HJ
   jrQhieVEVV7emQRlJ6ZfYwFr2D9upz/DucMSpW9vGC32teRtZ83qym8LF
   mL2eqF+LOUzfRv5djlEtUCYzg/ZUE9VKcqdXFqXwa0bJjI523ZwE/Tn6f
   tPLOoZ2QXMjT/L3yueuEacpnRp9jeTWiyLjasvGd8oGVH8Jx+Ds21yr9d
   2unYa/t/9W8bXeDBHDE9776Tt5bvwoHqA3YsgMDzvi4KHKsWH98z3/ulp
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="338600480"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600";
   d="scan'208";a="338600480"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 22:30:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600";
   d="scan'208";a="574101894"
Received: from cheeyang-desk1.png.intel.com ([10.158.87.104])
  by orsmga001.jf.intel.com with ESMTP; 23 Feb 2022 22:30:41 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][honister 3/4] libarchive: upgrade 3.5.1 -> 3.5.2
Date: Thu, 24 Feb 2022 14:28:55 +0800
Message-Id: <20220224062856.2249762-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224062856.2249762-1-chee.yang.lee@intel.com>
References: <20220224062856.2249762-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 06:30:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162300

From: Alexander Kanavin <alex.kanavin@gmail.com>

(From OE-Core rev: f8f39cd5757907d50444203e0e6e2c5ed0a47152)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
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
2.25.1


