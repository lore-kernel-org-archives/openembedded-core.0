Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42DEC3DA4A
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:01:35 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.16404.1736240494288149787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QFRAsgcD;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240495; x=1767776495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NnrpZERJFRV22wLaFSvyBry+yYy+hdXTVGWx0zXfM44=;
  b=QFRAsgcD/mf63/oTaogmtMai+4xReJWSU5fxtWuzZTXNVrRQc++NlyhH
   ncVX4hJ/VgJ5rAv5qspC/yM8/Xo5AxObhsy1r0BS78EHYq1JZRRbY27Pt
   cHcF72Jr1yt3IL7jQ1Izz+G0NGL8la+6S1mnU446aEyVrFDPYt4+cX3ID
   2OFPCA+PNO+eeJLWDaA+tOu08GGvfE/Jm5A9kCrb6grUa9u1qrSkhSz3E
   AljEE78zHakOCet5+bC9TpcIDpUAQg35Cawaf4HB9sum7G/OAKQL49KAQ
   klu8b74eIhOVMEhWTKNGjAv+lgXuB0+kppa6nKyeVSlTO32+9Zj0pXvdU
   A==;
X-CSE-ConnectionGUID: PpT3F/lLTX+1TNUqYXVA2g==
X-CSE-MsgGUID: vD9sARefTleT4ng0EJnhZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="174177452"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="174177452"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:32 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 64DD5D6EAA
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3CE7DD9698
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BBFEF200930C7
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 92C101A0003;
	Tue,  7 Jan 2025 17:01:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/13] python3-gitdb: upgrade 4.0.11 -> 4.0.12
Date: Tue,  7 Jan 2025 17:01:16 +0800
Message-Id: <1736240482-5243-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
References: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10--7.441800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqycpGufbGiAqFM5
	jt/5Nt4zZ8Tfltge2PoCABdcsis79eDLvvVL3eB4KsurITpSv+PVy4hHC3/gyNIKCpHnRRSFilv
	Ab18i4hMILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNbEr7W2UZfO2eGJoMYKtQJtLqXNBEL6J2Y60c2yRyGQXtcE/6i7mqSI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 09:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209440

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Never add a vendored smmap directory to sys.path
- Revise and update the readme
- Set Dependabot submodule update cadence to weekly
- Add missing asserts in test_base.py
- Use contextlib.suppress instead of except: pass
- Add support for Python 3.13
- Potential Race Condition Fix - OS Rename & Chmod - PermissionError
- Bump gitdb/ext/smmap from 256c5a2 to 04dd210
- Bump actions/setup-python from 4 to 5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gitdb_4.0.11.bb => python3-gitdb_4.0.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-gitdb_4.0.11.bb => python3-gitdb_4.0.12.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-gitdb_4.0.11.bb b/meta/recipes-devtools/python/python3-gitdb_4.0.12.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-gitdb_4.0.11.bb
rename to meta/recipes-devtools/python/python3-gitdb_4.0.12.bb
index 25e1a2df7e..0b7eec876f 100644
--- a/meta/recipes-devtools/python/python3-gitdb_4.0.11.bb
+++ b/meta/recipes-devtools/python/python3-gitdb_4.0.12.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "gitdb"
 
-SRC_URI[sha256sum] = "bf5421126136d6d0af55bc1e7c1af1c397a34f5b7bd79e776cd3e89785c2b04b"
+SRC_URI[sha256sum] = "5ef71f855d191a3326fcfbc0d5da835f26b13fbcba60c32c21091c349ffdb571"
 
 RDEPENDS:${PN} += "python3-compression \
                    python3-crypt \
-- 
2.43.0


