Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B902C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:20:49 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web11.8477.1646749237171537025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Gn9cgOkR;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646749248; x=1678285248;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ua//UHUKgtA32sSRqrFC4poj7I/C8yA6J0xp7ZuttGU=;
  b=Gn9cgOkRGLCElRJ1CS1AJq65KMZKm6NeH899dJTs7fVYeHJTqJpNhgGq
   e+Rejq/KYuo6jm2QkVfO1Kr8q7cnRep5ndSqLHpTYg4ZX1Pi8yWNrYaoY
   dXmjkzD9NEW0HtL3OrsItQ+uoxzBR1Vcu2MCJps9Mjordnu8WO+mL+Sc4
   0de6ClKvuH1MoOoQqJUBGH6KHDc4mDIccSJdnAKw8mg+ktHSSVeMobjvZ
   4NmrhcYhWgF703gV9PpdMvww+ORWOD19RR0jN7yDBsn0z98khLdIkFkhg
   jt6quZLHK3joLvSs7uYWoV1mZbLTNB6W2Sd6EjI2QY5C8wDFU3TNUmPXM
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="253519515"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="253519515"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:43 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="513119908"
Received: from sktoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.225.176])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:42 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/15] libgcrypt: Upgrade 1.9.3 -> 1.9.4
Date: Tue,  8 Mar 2022 22:19:55 +0800
Message-Id: 
 <11b20e30251f11d5a35be548be51c937565260f8.1646748870.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646748869.git.anuj.mittal@intel.com>
References: <cover.1646748869.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 14:20:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162911

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes a fix for CVE-2021-40528.

(From OE-Core rev: 24664297abd3844902fa40c21e4e975d89f40383)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.35.1


