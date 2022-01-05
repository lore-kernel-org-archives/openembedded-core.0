Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CDEC433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 15:19:04 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.1720.1641395941760702382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 07:19:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=d+eN5GgU;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641395942; x=1672931942;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2fQAnPoD6hZIjsVlbrbmCXluX3rlu1U29BZwBWI2KJU=;
  b=d+eN5GgUo/gi5u4Qw+IjhGtvCzYTgSN5MZCvIvvoBF18gTtEUyaOva1A
   pvappeW3U5CE541Tcg+l0ut1Go7reGcvSnSVZ1n7nc+zz2K9LpzfLsy7M
   BIZg8AbHwApOayieWtjUyrB5GepmRHI9oNH707S24BR9AOeWFiwFmC9cV
   NTF1fvZL8ldfFPJXxMaeAQeTrlSARfJLaGvc2yGJnL/NCDz7TDPDlliY1
   4+XQ+xnZ3DfwURDlvFFtbo7PxQrTi7Ki11A/XDf7WPH/4tOmRddHyBITL
   IlS5ekeyYqorv0rgg6R1shF/upwC4s4gPvbYfbjoBFFOiD1XRQzJg/Tsv
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="266742720"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="266742720"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="668128551"
Received: from hanwenlx-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.129.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:18:58 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/24] busybox: upgrade 1.33.1 -> 1.33.2
Date: Wed,  5 Jan 2022 23:18:21 +0800
Message-Id: 
 <0b34671cb9a91419216a532954bd2783d3384ba0.1641395036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641395036.git.anuj.mittal@intel.com>
References: <cover.1641395036.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 15:19:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160186

Bug fix release. 1.33.2 has fixes for hush and ash (parsing fixes) and
unlzma (fix a case where we could read before beginning of buffer).

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{busybox-inittab_1.33.0.bb => busybox-inittab_1.33.2.bb}    | 0
 .../busybox/{busybox_1.33.1.bb => busybox_1.33.2.bb}            | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.33.0.bb => busybox-inittab_1.33.2.bb} (100%)
 rename meta/recipes-core/busybox/{busybox_1.33.1.bb => busybox_1.33.2.bb} (95%)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.33.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.33.2.bb
similarity index 100%
rename from meta/recipes-core/busybox/busybox-inittab_1.33.0.bb
rename to meta/recipes-core/busybox/busybox-inittab_1.33.2.bb
diff --git a/meta/recipes-core/busybox/busybox_1.33.1.bb b/meta/recipes-core/busybox/busybox_1.33.2.bb
similarity index 95%
rename from meta/recipes-core/busybox/busybox_1.33.1.bb
rename to meta/recipes-core/busybox/busybox_1.33.2.bb
index 4002d6a5c6..44c83ab83c 100644
--- a/meta/recipes-core/busybox/busybox_1.33.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.33.2.bb
@@ -51,4 +51,4 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.sha256sum] = "12cec6bd2b16d8a9446dd16130f2b92982f1819f6e1c5f5887b6db03f5660d28"
+SRC_URI[tarball.sha256sum] = "6843ba7977081e735fa0fdb05893e3c002c8c5ad7c9c80da206e603cc0ac47e7"
-- 
2.33.1


