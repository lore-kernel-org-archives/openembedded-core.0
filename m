Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D937C3ABD4
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:12 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.45924.1747040648907028522
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dwiR577Y;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040649; x=1778576649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EFTC4KNbIGRZVKKHCtpLnYT9qPqdQzNXpvsVfhOgj7s=;
  b=dwiR577YVAkQTpS9yxlweExOYUer7JyJKEbJ+fwJlN8gDV7CHOrWfdMs
   GVM/dvm2Jz2DaYNfTTRxuN99iAvJjokooes/XUaH3aJ1Fol5fvSxnGT3e
   YwdELKTnNk41rU74oM3Lti0WWnIe6RUYgVrKCWYMchv8jq37Oofe+LzvC
   QwqL9Jtu4GIgcjuYHd2+86/0JzEruAP9ifCl/P5gZzKRYnpN22BHtC2CE
   yTAAnCxndoKR/0Y4vKtphu6IAc8R3PIOZojd+FbjeZx1KMO9bR/aus4ko
   gIuZf0HAP94Aw74lh/fbYzcVeWrJmL2lFsA2spXhZuzqq0yT7Z948KeLu
   Q==;
X-CSE-ConnectionGUID: Gcdgo7suRqiTEObjOxGAew==
X-CSE-MsgGUID: U5viUJfiRBqKdycB2X0mxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="187549324"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="187549324"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:06 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AFF22C68AC
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 72771F1B9
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:04 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 09DFA1A00A0;
	Mon, 12 May 2025 17:04:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 51/56] python3-yamllint: upgrade 1.37.0 -> 1.37.1
Date: Mon, 12 May 2025 17:03:34 +0800
Message-Id: <1747040619-7566-51-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216346

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Rule comments: tell how many spaces are expected
- Rule quoted-strings: Fix only-when-needed on multiline with backslash
- Config: Report if rules is not a dict
- Fix test_codec_built_in_equivalent() test when run with pytest
- CI: Fix TestPyPI "dev0" versions for master commits on tags
- Docs: Add links to GitHub repository and releases
- Docs: Fix GitLab integration example
- Docs: Fix GitLab integration link
- Fix the tests badge link on the README

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-yamllint_1.37.0.bb => python3-yamllint_1.37.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-yamllint_1.37.0.bb => python3-yamllint_1.37.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-yamllint_1.37.0.bb b/meta/recipes-devtools/python/python3-yamllint_1.37.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-yamllint_1.37.0.bb
rename to meta/recipes-devtools/python/python3-yamllint_1.37.1.bb
index 9ba0e8bc6e..1b0ddde873 100644
--- a/meta/recipes-devtools/python/python3-yamllint_1.37.0.bb
+++ b/meta/recipes-devtools/python/python3-yamllint_1.37.1.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "yamllint"
 
-SRC_URI[sha256sum] = "ead81921d4d87216b2528b7a055664708f9fb8267beb0c427cb706ac6ab93580"
+SRC_URI[sha256sum] = "81f7c0c5559becc8049470d86046b36e96113637bcbe4753ecef06977c00245d"
 
 RDEPENDS:${PN} += "python3-pathspec python3-pyyaml"
 
-- 
2.43.0


