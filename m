Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C740FE77196
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:29:39 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.58720.1735543772874667718
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:29:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X/YE16YA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543773; x=1767079773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JRsp/tAQzE2rF3EzL0CIWRNJmMswBYRWzhZYTL7DyUA=;
  b=X/YE16YAhVd+Wb04TDUzS16glPFBNlMX+cTlBUcfLk09vTHGZP2nG/Zq
   RJetSRfx6CidXj8GligKlraTcNhiEf5bLNWl4b8h8FmVLSmK9j/3eXz0C
   tkACsTZZsEsxgrVaop2GWFx78+UHx21emi8gXLVk6HSQyx9WFSzMbswwL
   gGMEtiGlWr5Gf0/vebIgd1rV6MsyBrpDQE7N2ZtgrS63wFHcTrKo+2IH8
   uCMU+LIExopoM8NXa6oj5xA/JD/6EI+xb2eSDWmWCe3NabGxxwzaWzG1U
   uIyLnR0ZN26fXLNulL8N7C+Ghh0x8DhA2gwetcmx2e/ijwKTy/Dzed6DE
   g==;
X-CSE-ConnectionGUID: 3nU8z6CVSRq8+7x+8R9Z9Q==
X-CSE-MsgGUID: jMckgVhSQQSdNI/FbrQk9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="185308655"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="185308655"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:29:30 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 23628D4C2B
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F0979D753E
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D57420074EB1
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:27 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 379451A0003;
	Mon, 30 Dec 2024 15:29:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 3/6] cracklib: upgrade 2.10.2 -> 2.10.3
Date: Mon, 30 Dec 2024 15:29:17 +0800
Message-Id: <1735543760-2456-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543760-2456-1-git-send-email-wangmy@fujitsu.com>
References: <1735543760-2456-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10-2.520200-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmKVijEpnyRMh6imPM07Al9SaDCzqDR7DPaCjFOVaqYalZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62S2pZ+UK1UanacvYmkUxwzrkWj3DAIKf4G7EnQzTF8G8pEkf
	AdYK3kyOVb+nAwOmkxMo/O3oxYT4V4IW+9CeMjD3yn71r4y5NYS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 07:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209142

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cracklib/{cracklib_2.10.2.bb => cracklib_2.10.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cracklib/{cracklib_2.10.2.bb => cracklib_2.10.3.bb} (93%)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.10.2.bb b/meta/recipes-extended/cracklib/cracklib_2.10.3.bb
similarity index 93%
rename from meta/recipes-extended/cracklib/cracklib_2.10.2.bb
rename to meta/recipes-extended/cracklib/cracklib_2.10.3.bb
index 2c913da152..c3396521ff 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.10.2.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.10.3.bb
@@ -12,7 +12,7 @@ EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=main \
            "
 
-SRCREV = "e5211fc1d2b435884a2bb77001e107489285296d"
+SRCREV = "e73d5db1789d198b5f9ec44b68b9c775c3e6c042"
 S = "${WORKDIR}/git/src"
 
 inherit autotools gettext
-- 
2.43.0


