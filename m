Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CE2C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:13:50 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.26505.1646662420742202043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:13:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=dTmxyTen;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662429; x=1678198429;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=dMIkjJzLJfAM+MQeU5GTpJR1hIrY7t1v+kGe8fbnmLs=;
  b=dTmxyTenM6atbh/sOxAPpudSF1P+HkzF6TfaWNKs2QbUAiXn3DtINIh/
   asS27sDusVK/9Bi5Uay/us09Ods1Ca9DQrMpdk1N/m5VG8T/pfyhtlzj6
   IbzXIlHq9wtYQtpbSoAJDAlPW3o9GTKqZyyrPkNWYcnBo7GvyLz13nb/i
   lMluEi6VyXfdKngdywNDGsAhFM/b7Rxqu91ujimgzIfq052202DG8FNV3
   zQ9MUYNV3QoS4JScDLW95pckBvhMPLx1zOuEqsHDsKVtxm+2ziETjD63c
   /CjBgWDRoc2aNEwzUoKuIoybTLmscjmbPizZU5YF3mvCEK//dzjz8xKQB
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112478"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112478"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:19 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070801"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:18 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 07/25] libxml-parser-perl: Add missing RDEPENDS
Date: Mon,  7 Mar 2022 22:09:43 +0800
Message-Id: 
 <6bec1320e20c4e996ec068c99be2e4273b2df899.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:13:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162829

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Running the ptest package in an image alone highlighted missing module
dependencies. Add them to fix those errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3859f49db2d694c7b63fdbe25be0018afba5c738)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
index 3b9206e984..7e72b70418 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
@@ -53,6 +53,7 @@ do_install_ptest() {
 	chown -R root:root ${D}${PTEST_PATH}/samples
 }
 
+RDEPENDS:${PN} += "perl-module-carp perl-module-file-spec"
 RDEPENDS:${PN}-ptest += "perl-module-filehandle perl-module-if perl-module-test perl-module-test-more"
 
 BBCLASSEXTEND="native nativesdk"
-- 
2.35.1


