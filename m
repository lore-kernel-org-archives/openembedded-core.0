Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32480C67861
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:39 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.11716.1749026735210979061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Fx56KE0W;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026735; x=1780562735;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JDHc/VQ2nsgb86DIfFdDogyoBrq92Ry+LoJymEvkZSE=;
  b=Fx56KE0WrpxfmwSGsRuuCwzRq/d8I/XagJhfKaSaDh4zmVdv478jC+uR
   2PM9xXKrZ2blOomGYTL26ToUSO/+/E1AxEIqYX7xS87EsbGbbKhgyRSZ9
   TY6BrxgHJmcwg223hEziRFzQw3Oe8OnwOkrKnYklkbzBj7qQf74nJynsq
   myZONjgFSv1eaC8WlYvb67KFyfVHVw49rZLAY9Leh+3ztFW9Ik2OatrvL
   I2IdpJKFo6sXNfKCy50D9kEizgde0Q6mqWUbTOFlSmhIvynMTyLFZ2JQk
   di6KEb0uzzbVikhS6C8tDNM6Z4gaTO8wmKyjpjGZwm5a6es7jV6cKPV1/
   A==;
X-CSE-ConnectionGUID: lc1ziwjDSaK+MVxieRjDzQ==
X-CSE-MsgGUID: utSyRTe1Qt+9jMtWgYeQVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="189666622"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="189666622"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:32 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A7892AB73
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C09C8D7734
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:29 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3A8FD1A009B;
	Wed,  4 Jun 2025 16:45:29 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/45] gpgme: upgrade 1.24.2 -> 1.24.3
Date: Wed,  4 Jun 2025 16:44:43 +0800
Message-ID: <20250604084524.864-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217854

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/gpgme/{gpgme_1.24.2.bb => gpgme_1.24.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gpgme/{gpgme_1.24.2.bb => gpgme_1.24.3.bb} (97%)

diff --git a/meta/recipes-support/gpgme/gpgme_1.24.2.bb b/meta/recipes-support/gpgme/gpgme_1.24.3.bb
similarity index 97%
rename from meta/recipes-support/gpgme/gpgme_1.24.2.bb
rename to meta/recipes-support/gpgme/gpgme_1.24.3.bb
index bc661429e7..64e3c6635a 100644
--- a/meta/recipes-support/gpgme/gpgme_1.24.2.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.24.3.bb
@@ -29,7 +29,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "e11b1a0e361777e9e55f48a03d89096e2abf08c63d84b7017cfe1dce06639581"
+SRC_URI[sha256sum] = "bfc17f5bd1b178c8649fdd918956d277080f33df006a2dc40acdecdce68c50dd"
 
 PYTHON_DEPS = "${@bb.utils.contains('LANGUAGES', 'python', 'swig-native', '', d)}"
 
-- 
2.43.0


