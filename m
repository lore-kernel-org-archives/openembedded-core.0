Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAE4D32D66
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:46 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.82430.1731403532974144968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tSRQUnes;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403535; x=1762939535;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1P1GsX4hexYsugvSHJwr4GaoJECWidQ4NkWgYXbsmfI=;
  b=tSRQUnesbIB8T0mzixEXGw2Cs/PyLoq9PiusvORAPytSmxENJIMHmYxs
   bGlU9b/PkPnRAt6cuClE2XJB74h0lWKGwYzgLyqaWB+RF5twLB4335Ys2
   pGlX/Arn+y2GCnI76Bmzpy5rnbvdJ++/TLYTFAD3yj53LnniT0zdakPeN
   lZX1zK/przibdm5wA6WYzBk5LzqoHhrhe2LZQcWOOfBUYYCJql7h2iKGL
   DhzKlP4+pmssZ9SXovEA7xAq9Gk0HysJvSuMw3526+V6v4U6CqtD/clj2
   Pidh/a0Rw89smWdPWw/AiEkoeVBZ8cD9gaJB1XvEcpUuEifFcCjoay8iW
   g==;
X-CSE-ConnectionGUID: 9+sAa+ZMS1ujlVwFaYPdXw==
X-CSE-MsgGUID: yJ638lQHR9mJROw71ZrTwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="180063514"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="180063514"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:34 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E7D696747
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 13073F31EE
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 911AE20079545
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 40E1A1A000A;
	Tue, 12 Nov 2024 17:25:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/47] python3-dtschema: upgrade 2024.9 -> 2024.11
Date: Tue, 12 Nov 2024 17:24:25 +0800
Message-Id: <1731403483-21399-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10-2.250100-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxRXsXSRyV+gg4p
	J9smbjQFvKMpUEbDmXVKC565Je+gku+c5IL6OTgO7LuOEAY9BqQ3l2plwgrtWMgVyTd/p+/I9Dp
	INHy2DL31MVUQjl2iownxfqppvFLB7VrXqiqnwHXy3h9RQZ4StME5XPQnBzGXhQdoDpg5CiujxY
	yRBa/qJcFwgTvxipFajoczmuoPCq0SdWmJ1i9bDhFhOL8RPFSVkMmF80jj+eqlGoYcAXMxyieo3
	kxCxsW9wewRrxkIJivU8SYc/hZUg4cxslGCY6IO2vu7TF7Me8QdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207015

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- github: Enable python 3.12 and 3.13
- Add a tool to compare schemas for ABI changes
- dt-bindings: u-boot: Add property for LED boot and activity
- validator: Don't crash if the de-aliaser hack fails
- schemas: gpio: Add GPIO nexus node
- schemas: gpio: Remove #gpio-cells dependence on gpio-controller
- fixups: Allow "items" entries to be boolean
- meta-schemas: Allow "not" in "items" list
- meta-schemas: Exclude "adi,channels" from vendor properties
- schemas: Add wakeup-source schema
- schemas: i2c: add optional GPIO binding for SMBALERT# line
- github: Update actions versions
- validator: Warn on multiple schemas with same compatible string
- schemas: root-node: Add 'television' chassis-type
- schemas: core: Introduce "fail-needs-probe" status

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dtschema_2024.9.bb => python3-dtschema_2024.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2024.9.bb => python3-dtschema_2024.11.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2024.9.bb b/meta/recipes-devtools/python/python3-dtschema_2024.11.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2024.9.bb
rename to meta/recipes-devtools/python/python3-dtschema_2024.11.bb
index 5a159297fb..8d052d6910 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2024.9.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2024.11.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "1e5cc422736d5e4167f764478e50093f340bbede95b569ed66d60748dbc39ab2"
+SRC_URI[sha256sum] = "bb7dd36ff9406ec89607b893cfc5e1ffa7ead76fd5c48df77eafc9b4d4196047"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.34.1


