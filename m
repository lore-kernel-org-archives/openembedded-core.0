Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691B2D59D98
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 01:30:28 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.35694.1732584624788699001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 17:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nt1jHuL5;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732584624; x=1764120624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uqHT0fxf/K1L9GuJlxKGIhNpqiMcflq6gWOCg+DLGUo=;
  b=nt1jHuL5Lbk5orEcIhxePX+TZHD5dqZNnYHiI1ApZx8DBqaq+emcHASg
   ZJ2wDZt1ReaqD61ZpuvP4nIwRp1P7btbQbg8WlAGYO4S87AekdK2e5J0k
   uwOnpgdYDuRkCmSuEMS59aRRN5MyawQX+IjUUsCgkJivBTEy4cwoUF4Y0
   Ll4McBdULaXPfoqxIMKKqyMki/dtlyJHNF21+PvxPJJnu+WYAhDgBb/n5
   14iyvxOPxNGKQl5NkdA9oo3KvLyjr6PkJVhSFwnWyJ9UtY1zkpeKcBzSY
   NCavEkmAN3Tq8IRZzZFWiXZk2+FaCDvj3zd/LR9JbqCwhAee3y54Kbr90
   A==;
X-CSE-ConnectionGUID: 2eE2aitEREmB5qfRdK2HxQ==
X-CSE-MsgGUID: 6eF7zBwPTgK+B84Dj1b4XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="160510135"
X-IronPort-AV: E=Sophos;i="6.12,184,1728918000"; 
   d="scan'208";a="160510135"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:30:22 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B35FFDBB84
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 442FCD9CA3
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D7C602007B73D
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 872851A006C;
	Tue, 26 Nov 2024 09:30:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/16] python3-wheel: upgrade 0.45.0 -> 0.45.1
Date: Tue, 26 Nov 2024 09:29:59 +0800
Message-Id: <1732584602-4785-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28820.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28820.003
X-TMASE-Result: 10--1.166800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhxLGwMotcUD5co
	M/Bi+iTP4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2UgxSQxzSLAbaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFPUjiD88+wDBFvz+U36OHxqwp4
	NtUw7WrlwyuUr3TSrubI+LoKH4na4jhPiSt7tbWvwnClCqUqk7xU5BCT/nnkmRWi80uzUcSex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 01:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207821

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Fixed pure Python wheels converted from eggs and wininst files having the ABI tag in the file name

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-wheel_0.45.0.bb => python3-wheel_0.45.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.45.0.bb => python3-wheel_0.45.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.45.0.bb b/meta/recipes-devtools/python/python3-wheel_0.45.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-wheel_0.45.0.bb
rename to meta/recipes-devtools/python/python3-wheel_0.45.1.bb
index 5b7f600557..8274e83747 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.45.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.45.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "a57353941a3183b3d5365346b567a260a0602a0f8a635926a7dede41b94c674a"
+SRC_URI[sha256sum] = "661e1abd9198507b1409a20c02106d9670b2576e916d58f520316666abca6729"
 
 inherit python_flit_core pypi
 
-- 
2.34.1


