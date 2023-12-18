Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05692C46CCD
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 14:47:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.web11.45511.1702910852353229137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 06:47:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Ki5teQJy;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702910853; x=1734446853;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=rDax/4RH56765zMjmLdn/X0VmVrOsomMJeRaYQAEd0M=;
  b=Ki5teQJyfGDLYEPmhlUNNwkBbjLWG/akiK7Ev/zY+7/ukTfApWbO/COM
   1C7qjjyNwsPioiycvD1hGKc5pj3BPx9UKhOBfIu23hGsf6PqqSDEsHR4U
   5nH04UCcu/aR+QrVvx5IdG8pmWNZLf7KQeW5YnllaWLti6BsjgzTBRXc8
   eO0LgSuGoA1lTx/NDbdUaJFDBxr2sEHnQSw49ncZz79OW1PEMW4kshogm
   MN8C6Gdnf7G/8Rm7IdQqxNA83eO07ON6zxAD8xWs+kxGn3piLlw/uSvTA
   qpDbPyZuszIcCh1NKltoSr57lZlwdW9Ll5mgrTCxMIPrTY0u7A45toIV1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2350866"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="2350866"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 06:47:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="23802877"
Received: from jsuah-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.240.31])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 06:47:33 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] base-passwd: upgrade 3.6.2 -> 3.6.3
Date: Mon, 18 Dec 2023 22:47:17 +0800
Message-ID: <20231218144724.7794-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218144724.7794-1-anuj.mittal@intel.com>
References: <20231218144724.7794-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 14:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192647

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../base-passwd/{base-passwd_3.6.2.bb => base-passwd_3.6.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.2.bb => base-passwd_3.6.3.bb} (98%)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
similarity index 98%
rename from meta/recipes-core/base-passwd/base-passwd_3.6.2.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
index bb4b49e6ab2..9d7703b1c00 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
-SRC_URI[sha256sum] = "06dc78352bf38a8df76ff295e15ab5654cdefe41e62368b15bfcbbab8e4ec2a0"
+SRC_URI[sha256sum] = "83575327d8318a419caf2d543341215c046044073d1afec2acc0ac4d8095ff39"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
2.43.0


