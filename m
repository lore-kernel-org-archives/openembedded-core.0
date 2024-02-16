Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEEF8C48BF3
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 11:40:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by mx.groups.io with SMTP id smtpd.web10.16724.1708083641400806033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 03:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=NcHT8Zp5;
 spf=pass (domain: intel.com, ip: 192.198.163.16, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708083648; x=1739619648;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Z0BI8mfrK5t4xKVHDCQkisObaVHf1KNJUuZchbvQvns=;
  b=NcHT8Zp5uvPzFHlPEsfCXFPb4ryKd9+/M566cK7p85xlI7FWEoaKke1d
   GTsH0cSY1lmLWINl5fDmpSc0cL/8qRMtLpCKU5G4yVdNMtOxK8LhX63vT
   Xd5FGRfpbaCcADNklSo9cffsZ6Q6Itagk78BKHhYbidKCXj0G6ICAbqzc
   heLyF//XSgcRUHKtH4Aw1yM0cUr+oZHevt4Pj7VvCpEvTVcT/NUJ5xIYt
   Oi5tsN7lJK0BSQTeZn4exaNW3VSOUcJgmadxAxnf9fcTK2GoOeN4/QhRh
   jmHo6gKtTzuPekTLwVBmeqyVQAIAfm53nMNUI6PHHGrHXRB6JO2tSwTjJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2612864"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2612864"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:40:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="912349731"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="912349731"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.118.3])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:40:46 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] stress-ng: upgrade 0.17.04 -> 0.17.05
Date: Fri, 16 Feb 2024 19:40:31 +0800
Message-ID: <20240216114034.109257-6-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240216114034.109257-1-anuj.mittal@intel.com>
References: <20240216114034.109257-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 11:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195753

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../stress-ng/{stress-ng_0.17.04.bb => stress-ng_0.17.05.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.17.04.bb => stress-ng_0.17.05.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.17.04.bb b/meta/recipes-extended/stress-ng/stress-ng_0.17.05.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.17.04.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.17.05.bb
index fde51f67ac8..d4a427f89d6 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.17.04.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.17.05.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "2f22ad595f067aa940cfe4f64107e10872c2f7b5"
+SRCREV = "4e68895f4fe68863b360ab4a6a57e2dfcff85d60"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.43.2


