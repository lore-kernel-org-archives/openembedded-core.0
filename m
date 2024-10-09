Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF4FCED262
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:47 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.9174.1728452980575390463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bu6APGXY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452981; x=1759988981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=K4dYDGuoL3a2rN7a6vz5uNP1eaDp5ioPWoPM7Dg4Z8Y=;
  b=bu6APGXYcbSij6JGRrz2K3s14/v+0kBkRR7j7TuZ10wdZjDYw/bLn4s9
   8h7eGOUPaCnnHi3vgT7RBey9ePtERmsvGkP7nfvcPYGpIUQdQaumiaQl/
   xZkmUID0rwzKwbCpI7Dw4ZttcjEaJtiJ82hbrmlPlx1r8pXp68HpUfZJ5
   tkGvykG6CP7DLAwSTdQPtflgOO0Q0Gs/LHYpTw6uMMe3M1sVEfv5tUahG
   VFu1EIQIMwOumjqvb7ceWHsT9B1TB8W4RNmvJxdz3MzNFCt1eDJ3evd23
   9m85BcCAski9T0Y0zcmu9JYDosmUkfAlknPIwC0uE8rDUndO6cIvOr3Wu
   Q==;
X-CSE-ConnectionGUID: OEUxHL78Q2SlbjXPYpituA==
X-CSE-MsgGUID: DlOgONkZQCOcmUPgpf+1OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="178412536"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="178412536"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:38 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 11A7FC9446
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 55EF717D39
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DB3D540B62
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8B0281A000A;
	Wed,  9 Oct 2024 13:49:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/26] ltp: upgrade 20240524 -> 20240930
Date: Wed,  9 Oct 2024 13:49:00 +0800
Message-Id: <1728452955-25051-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--0.747700-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBM+b8yxBqvA9rw
	gWzx6JXjHA3R+07yikHGKIf6hBf7VQE4dbnyjMJaTuctSpiuWyUUi4Ehat054zdlsYL2g/87U6e
	mM+AKrjLhbteqhoOALJ6ne24V5SQSlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2I3a
	djBtsMrDfACKvArA6bqkh5Ix/RrS+kXN1kvxKKyKCP44WOr2u/F6Jrmsnjecpf1igbU0BNF3Df8
	E0ooRaugFP2/PXJXRTs6cPofLESvvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205324

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/linux-test-project/ltp/releases/tag/20240930

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/ltp/{ltp_20240524.bb => ltp_20240930.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ltp/{ltp_20240524.bb => ltp_20240930.bb} (99%)

diff --git a/meta/recipes-extended/ltp/ltp_20240524.bb b/meta/recipes-extended/ltp/ltp_20240930.bb
similarity index 99%
rename from meta/recipes-extended/ltp/ltp_20240524.bb
rename to meta/recipes-extended/ltp/ltp_20240930.bb
index 6b46723478..ac8bea4244 100644
--- a/meta/recipes-extended/ltp/ltp_20240524.bb
+++ b/meta/recipes-extended/ltp/ltp_20240930.bb
@@ -24,7 +24,7 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "8f21ebba42216dbb7e8d44c23b4a977d6823f7a1"
+SRCREV = "60f81419c43f94ec182827ef0b9eb5baeb303419"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-- 
2.34.1


