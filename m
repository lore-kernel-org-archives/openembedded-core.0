Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82B0C433F5
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 00:20:04 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.5707.1640910003444994118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 16:20:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=mZSS3Plw;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640910003; x=1672446003;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=o+1rJg+c8vfki5bVVbG4OP1TvpAS9e3CSkZwU0nuy7U=;
  b=mZSS3PlwSUysC6ae8/z0aoVo4SchvTNqbyaHq6QsnPa3iSvcH9JmCzod
   d5tQomy+UaGH2o/mUbgAjgqNuML/6Znvuab548QBoxrbZ4Ngug6x+RZwC
   7CsL2tS1TDjstoOxPI7Hq4NY2x7BMRMtktUWENhf7YgDHbjlUBijXgPj9
   8Mq+Du8NTS2GVFU7aCvmqN5diABn1J185DUXWLmwNYCipXjklMhU5Qnmf
   14VKUHB4IBQE4iZmm+PYenj+4U2lYWH82lhhfP9pt+x3y93Guqr1o3VQz
   g+4OiWuRLpZgNi06UN7Cw9yBDNA/wGsNGisCPFzIglnSK+iq8FPOTDYiM
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="228573130"
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600";
   d="scan'208";a="228573130"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 16:19:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600";
   d="scan'208";a="619502345"
Received: from jiayingk-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.231.141])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 16:19:42 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 08/11] linux-firmware: upgrade 20211027 -> 20211216
Date: Fri, 31 Dec 2021 08:19:21 +0800
Message-Id: 
 <5170d6e0be3775376d08bd5129686ec53661786e.1640909776.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1640909776.git.anuj.mittal@intel.com>
References: <cover.1640909776.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 00:20:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160076

From: wangmy <wangmy@fujitsu.com>

License-Update: version of license file updated.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 07dc668ddc50de14821aff1b6850d8b4999702bd)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...{linux-firmware_20211027.bb => linux-firmware_20211216.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20211027.bb => linux-firmware_20211216.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
index 97d42e98e2..65bfda1d9f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20211027.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=d627873bd934d7c52b2c8191304a8eb7 \
+                    file://WHENCE;md5=79f477f9d53eedee5a65b45193785963 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "bc2657dd8eb82386a9a7ec6df9ccf31c32c7e9073c05d37786c1edc273f9440a"
+SRC_URI[sha256sum] = "eeddb4e6bef31fd1a3757f12ccc324929bbad97855c0b9ec5ed780f74de1837d"
 
 inherit allarch
 
-- 
2.33.1


