Return-Path: <nobuta.keiya@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8045DC4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 11:08:22 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web09.6524.1666177693555061103
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 04:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: nobuta.keiya@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="72325154"
X-IronPort-AV: E=Sophos;i="5.95,196,1661785200"; 
   d="scan'208";a="72325154"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP; 19 Oct 2022 20:08:09 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CBC08E8525
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 20:08:09 +0900 (JST)
Received: from yto-om1.fujitsu.com (yto-om1.o.css.fujitsu.com [10.128.89.162])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2787FD35E9
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 20:08:09 +0900 (JST)
Received: from localhost.localdomain (bakeccha.fct.css.fujitsu.com [10.126.195.136])
	by yto-om1.fujitsu.com (Postfix) with ESMTP id 1BA35405F794A
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 20:08:09 +0900 (JST)
From: Keiya Nobuta <nobuta.keiya@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] gnutls: Unified pakcage names to lower-case
Date: Wed, 19 Oct 2022 19:57:39 +0900
Message-Id: <20221019105739.2279010-3-nobuta.keiya@fujitsu.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019105739.2279010-1-nobuta.keiya@fujitsu.com>
References: <20221019105739.2279010-1-nobuta.keiya@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 11:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171966

create-spdx can't detect the license properly if the case doesn't
match, so fix it.

Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>
---
 meta/recipes-support/gnutls/gnutls_3.7.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.7.bb b/meta/recipes-support/gnutls/gnutls_3.7.7.bb
index 01fd4dba3d..c7d782e4eb 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.7.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.7.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-3.0-or-later & LGPL-2.1-or-later"
 LICENSE:${PN} = "LGPL-2.1-or-later"
 LICENSE:${PN}-xx = "LGPL-2.1-or-later"
 LICENSE:${PN}-bin = "GPL-3.0-or-later"
-LICENSE:${PN}-OpenSSL = "GPL-3.0-or-later"
+LICENSE:${PN}-openssl = "GPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
                     file://doc/COPYING;md5=c678957b0c8e964aa6c70fd77641a71e \
-- 
2.25.1


