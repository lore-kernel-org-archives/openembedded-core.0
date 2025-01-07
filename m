Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB54C3DA4A
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:01:45 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.16404.1736240494288149787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UpM68MUZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240496; x=1767776496;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AwiDiqhQhZZWj0P3UwBhWQAX56GWL9pPpaptaliWabg=;
  b=UpM68MUZTjB/ICxbfms43kyFT+AV2ihnAVVR7uF7w8Zjo7KZhXSPwUad
   ywnuLxygz8hLQFPRkSxoM2FEujSOIAlmvbUPha7cznlRcqEqykG806tvG
   /HugbhKgbsqbyVLWVkHhAmO1GqWUdDt/X21bm6s1G5Gmae2D1B9fw+zSr
   1Ji1epDS/FLKYy4lAaClqSFM5QKOyzVZVdaxVV3j973IDKpaQRQuEA3mY
   raDernD/r+Av9UMTrZSmDWX/kz975Lf/d7bNdR3LmnP+LwU/Ld07omTJu
   0mxtqUBibANcztf2HE+srhYnj1S8FkdXsP0/OBc+mZHMTAis/xtyzVoxs
   Q==;
X-CSE-ConnectionGUID: S3bm9SFeR7q1LKaDRSyBrg==
X-CSE-MsgGUID: uIFFW5vbTDmzwHR/0bAIbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="174177453"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="174177453"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:33 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9505CE8523
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BD2BCF7DC
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EDE65E293A
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C52DC1A0073;
	Tue,  7 Jan 2025 17:01:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/13] python3-poetry-core: upgrade 1.9.1 -> 2.0.0
Date: Tue,  7 Jan 2025 17:01:17 +0800
Message-Id: <1736240482-5243-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
References: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10--1.271000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrblIr0TBlJdauId/Rz3CLXE89
	3SeL1XuD4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uBqd
	FRjHdIbiGOq73doEniIAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzjVIA+X3yn8hHnB
	H/n4MKF6AK02h1eLZ010pDdh+AtYzu8yqr7jDfYb3Ws5iejC56uc875ZcT9VDeiN6AAJ6RF8C3F
	LyFgL/ziB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 09:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209445

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/python-poetry/poetry-core/releases/tag/2.0.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-poetry-core_1.9.1.bb => python3-poetry-core_2.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_1.9.1.bb => python3-poetry-core_2.0.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb b/meta/recipes-devtools/python/python3-poetry-core_2.0.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.0.0.bb
index 25c2aeb1e7..09b1a2340d 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.0.0.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "7a2d49214bf58b4f17f99d6891d947a9836c9899a67a5069f52d7b67217f61b8"
+SRC_URI[sha256sum] = "3317a3cc3932011a61114236b2d49883f4fb1403d2f5e97771ac0d077cfa396f"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


