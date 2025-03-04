Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B4FC282DE
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.18199.1741079368646739157
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FZ7uCT/r;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079371; x=1772615371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QPNs+Cv9btP/Eh9C+PyQAwtoaQsacXN75YfN9gGO5+c=;
  b=FZ7uCT/rFzBUiH4xymrxjmEjKyDZHIR9K0yxgef3c2kzXXOq2OU5uAE/
   w6pdU7m3aMpx+WcWOMY0wTEq/PaiQX+7FoC2J9ZGtLDvUVRPwAIOlwk3T
   q+gZrul1Xdpl4vSh8NAsxZNDf2LIRsiroitGRkcLk4KgQr6zoXrYeRwMt
   4m/cGgifQvA/RcDNW4+88gV276pQPn4kcC5+Q5XLXgovEG7VOAVXbxvTU
   tUUO87GFm1hFD9u4xPV8ddU1wK0Bhh08ndGhL3HhrGVwt96CKnoRLbHO3
   NylHPclxclwUWVcYFZd7t/uJ2clnvHDeuYw0SE2oAF1KeWjzH44c9kzTI
   g==;
X-CSE-ConnectionGUID: jju3JfPxQgyXV3ebw1A69A==
X-CSE-MsgGUID: 67CYj1r8Sp+DeDh+btgK9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="180271627"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="180271627"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:29 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id ADBEA276A5
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 701D7D8B83
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:27 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 308151A0071;
	Tue,  4 Mar 2025 17:09:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/31] openssh: upgrade 9.9p1 -> 9.9p2
Date: Tue,  4 Mar 2025 17:09:01 +0800
Message-Id: <1741079356-13445-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212239

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openssh/{openssh_9.9p1.bb => openssh_9.9p2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.9p1.bb => openssh_9.9p2.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.9p1.bb b/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_9.9p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.9p2.bb
index cb47ae7c07..5191725796 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
            "
-SRC_URI[sha256sum] = "b343fbcdbff87f15b1986e6e15d6d4fc9a7d36066be6b7fb507087ba8f966c02"
+SRC_URI[sha256sum] = "91aadb603e08cc285eddf965e1199d02585fa94d994d6cae5b41e1721e215673"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.43.0


