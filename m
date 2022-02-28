Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4612BC4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 03:40:36 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.16230.1646019633714561008
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 19:40:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=inxfjBPE;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646019635; x=1677555635;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZnM6gZ7/VAQO5lmDRUa+E99X6DVSMTOeNHancMzEjQU=;
  b=inxfjBPEkHOadW46Nev2/QVEOiKcLgQF9tkRsfo0D43tBSHhRqhU7YNq
   ON9VQCCh71MZ0OG0SnOaxobI9ho9VDdCDHj73AE1dQ7SBxFOqcY8F4VR6
   P70aazhSRWUyXewXPf+nle2/H9sb9r28rv+MJwM8OqrGEa0QjUQwEnIh+
   7mHcMnc/mBFR2gGDlkWHKNfJF9eCo3VZX9ozrWN+StTctti27CDp5dSUq
   vVC0EjRRpbn1/yQF/BN/WeBy0L9NsEktTHy/g/2E0SKltRPusf/5dsgdl
   vt9HyXqCRDGewO+D7q/O/H3QnrBhPtqNkMtFvAFbbA1NbsxhDQdGvZMAP
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="252988324"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="252988324"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 19:40:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="509942100"
Received: from cheeyang-desk1.png.intel.com ([10.158.87.104])
  by orsmga006.jf.intel.com with ESMTP; 27 Feb 2022 19:40:33 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][hardknott 3/3] libgcrypt: Upgrade 1.9.3 -> 1.9.4
Date: Mon, 28 Feb 2022 11:38:39 +0800
Message-Id: <20220228033839.2386940-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228033839.2386940-1-chee.yang.lee@intel.com>
References: <20220228033839.2386940-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 03:40:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162450

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes a fix for CVE-2021-40528.

(From OE-Core rev: 24664297abd3844902fa40c21e4e975d89f40383)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../libgcrypt/{libgcrypt_1.9.3.bb => libgcrypt_1.9.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.9.3.bb => libgcrypt_1.9.4.bb} (96%)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb
similarity index 96%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb
index fd3d8e09f2..c212d02651 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb
@@ -27,7 +27,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
            file://0001-Makefile.am-add-a-missing-space.patch \
            "
-SRC_URI[sha256sum] = "97ebe4f94e2f7e35b752194ce15a0f3c66324e0ff6af26659bbfb5ff2ec328fd"
+SRC_URI[sha256sum] = "ea849c83a72454e3ed4267697e8ca03390aee972ab421e7df69dfe42b65caaf7"
 
 # Below whitelisted CVEs are disputed and not affecting crypto libraries for any distro.
 CVE_CHECK_WHITELIST += "CVE-2018-12433 CVE-2018-12438"
-- 
2.25.1


