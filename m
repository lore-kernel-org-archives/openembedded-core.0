Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14F4E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:45 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.77351.1734425921582527654
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aRiQktj1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425922; x=1765961922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=J7MTh6vFs1OhrjmDyrg/Mo2+4bzEYgdJQrMB5Qr1EWg=;
  b=aRiQktj1VSYJbr+n2AIMbkJ1LRv13sNwZAFsTrSGi3y4vvRSjPauog9B
   Z3k4tcatWOq849ctxzxTpPLPLPlA4bBdWIpW25lSjdNeqn0Reyzz2+VuO
   c11byqgoPyFi7JxU0OfDNKabLor1orf/SumAwzWjC6IkAEzO/itNgbMxz
   vmr5G9uVRxpdDLzZ0qEDG8QCTBOqauJ3U1Mfk2FELBY3cI7HypxkMqyBu
   UInMe3M2NSRKH9ukEpPPHOzz4UoVNz94ardSW9KwZ2AD6VoAESGMqFERD
   dwLJNhXZS1hGJZS3kTh/FKa1VbGih2zpTIVRyE/yIGdlanMxxnM6E+QOF
   Q==;
X-CSE-ConnectionGUID: xt+27nhbQt6oh93vnzdl2w==
X-CSE-MsgGUID: rUMbltN+S2aCnQWfiq+I0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="184047870"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="184047870"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:40 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 755D1D4807
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E7C1D9004
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 026E5E8C4
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:36 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 93AEB1A000B;
	Tue, 17 Dec 2024 16:58:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 19/21] re2c: upgrade 4.0.1 -> 4.0.2
Date: Tue, 17 Dec 2024 16:58:05 +0800
Message-Id: <1734425887-18069-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--7.192300-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mr5sPqcQkI8psR34ro7k23nYCn
	q9qtGcvV6VM/pjOULS9FEIX7L7Q9Jp2vh8iOQK5zFDuTLTe6zcM3l2plwgrtWDBwx50fHFECIUt
	KH5AJM9ki+t+0AiFaYvL3NxFKQpq1iCsqewnUZGA7Cl8sx4HBGwK0ZgbTOeKUvGsAbY6bunYrGb
	ISEEw4TOLzNWBegCW24nmFeyfGnuMLbigRnpKlKSPzRlrdFGDwEPTFlS47Y+qoDorbwj1whB7GV
	qZ6oLLZEpLpdDQEb3oh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208825

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- CMake build system: fixed bug
  `#515 <https://github.com/skvadrik/re2c/issues/515>`_ where language-specific
  binaries erroneously defaulted to generating code for C.
- Playground: address bar now reflects navigation between examples, editors use
  a more high-contrast CSS theme.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-support/re2c/{re2c_4.0.1.bb => re2c_4.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.0.1.bb => re2c_4.0.2.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.0.1.bb b/meta/recipes-support/re2c/re2c_4.0.2.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.0.1.bb
rename to meta/recipes-support/re2c/re2c_4.0.2.bb
index b876d2b844..2a0fb197ff 100644
--- a/meta/recipes-support/re2c/re2c_4.0.1.bb
+++ b/meta/recipes-support/re2c/re2c_4.0.2.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7c35d54fdf2c4b5981b80362d1c742aec4d011589673e02f2e9566f7e66c44af"
+SRC_URI[sha256sum] = "5e52ce0e26326115e41bc45d34dc2d5e10f2e44ed3a413fa2a826aa3500c8d56"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


