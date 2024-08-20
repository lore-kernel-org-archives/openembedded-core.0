Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC73C54731
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:29 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.12719.1724136740218882517
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hqTIWU2C;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136740; x=1755672740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rm4+p5TrbcSZByaf5w+Uw0MvsicvLI2VxLBv9lw8L6I=;
  b=hqTIWU2CaXBpCESsCdGkfYvpGf37tOPKGnGYYLq1Em/cHTIRNaIon0e+
   R+7EuFY9KBdPAGcLRxXVNBXPGOwxOPDKv+Yhov4HO1/UPOJA9fW/eNncK
   y8f8l03epBV3FVHRdgmlKWaZr/+MIRjyuOE1wDTF+NMn5pgEP88JOs+jb
   VVkW5oAruGYpeEyMHGOKiHTcOnTEPnogvPpq+piwXXkNFlVNzzVaZrVcB
   8nPSiuIYclQKEQ8AdvICUGwBk6W5BIgLrFoCjnvhKB7YFptzYTiJVuSjG
   t+deECSbxZWOfR+/Y+vztOy24su0BdsKHbARJ6VeEzgKMBr9KukB3lhSa
   w==;
X-CSE-ConnectionGUID: MIZKlSZmTNWzwmqQUxxAlg==
X-CSE-MsgGUID: fYWXj9fkSlyZ9Exqcq4u7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="158462957"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="158462957"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:17 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6CD07D801D
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A0491D4C39
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C166216766
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CB1811A000D;
	Tue, 20 Aug 2024 14:52:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/24] python3-babel: upgrade 2.15.0 -> 2.16.0
Date: Tue, 20 Aug 2024 14:51:35 +0800
Message-Id: <1724136703-20023-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.005
X-TMASE-Result: 10--3.051600-10.000000
X-TMASE-MatchedRID: AFiVwG0qm0+jz0nOeth/yUIIxwDaU5mrRUYppGmT91clzg+7nCkWyPzx
	fg6IZlFle0wUcH160FSKVLmcMQtuqTy6RjICuq8gbpd/2mNSG6bb4QM/D7zGt2ONwuoLObkfwSO
	gWCbsQUqMUjx0fM8cmwhBeNJICtc+5FmazwMilg99SSAOK4bGf03yuY9BGW8rv10rEDVrQngSkx
	jSj8Gsp3n6gyjUGyMo5arhUFL3qGXO+bXN3tyGOKqHmm/V4M/PIF9l7eKb2JGc2m5O3udcdC4Xe
	pmu1hPLpPkgFEQ0YZl0ZufGdriPne1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0K
	7bkUDKIbfXru69VeWeuLFZZYlisfHxPMjOKY7A8WeMpVNhsMwMRB0bsfrpPIcSqbxBgG0w5Rxzz
	By3SN1ZXaX95XqPl12ap8ArwVZ3Vhwai+NWLGC2amnXfuEIw8k2vgj54EHETJ/yCwh5bPhcZvnm
	2MxrXJlpLdknnxdZSCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203539

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- CLDR: Upgrade to CLDR 45
- Lists: Support list format fallbacks
- Messages: Initial support for reading mapping configuration as TOML
- CLDR: Do not allow substituting alternates or drafts in derived locales
- Core: Allow falling back to modifier-less locale data
- Core: Allow use of importlib.metadata for finding entrypoints
- Dates: Avoid crashing on importing localtime when TZ is malformed
- Messages: Allow parsing .po files that have an extant but empty Language
  header
- Messages: Fix --ignore-dirs being incorrectly read
- Messages: Make pgettext search plurals when translation is not found
- Replace deprecated ast.Str with ast.Constant
- Test on Python 3.13 beta releases
- Normalize package name to lower-case in setup.py
- Add a mention to the docs that format_skeleton(..., fuzzy=True) may
  raise
- Two hyperlinks (to CLDR) and some typos

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-babel_2.15.0.bb => python3-babel_2.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-babel_2.15.0.bb => python3-babel_2.16.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-babel_2.15.0.bb b/meta/recipes-devtools/python/python3-babel_2.16.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-babel_2.15.0.bb
rename to meta/recipes-devtools/python/python3-babel_2.16.0.bb
index c8a0d23100..929d7e9983 100644
--- a/meta/recipes-devtools/python/python3-babel_2.15.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.16.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e7ebed8cd9f4ff11f547e3afd024a28c"
 
-SRC_URI[sha256sum] = "8daf0e265d05768bc6c7a314cf1321e9a123afc328cc635c18622a2f30a04413"
+SRC_URI[sha256sum] = "d1f3554ca26605fe173f3de0c65f750f5a42f924499bf134de6423582298e316"
 
 inherit pypi setuptools3
 
-- 
2.34.1


