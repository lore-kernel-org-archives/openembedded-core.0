Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764E4D32D75
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:26:06 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.82747.1731403556554476026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fV0cgYNo;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403557; x=1762939557;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OrG+bCoyQbYU57sZit1Iw47qBQGX9r/VeLAPz4bAfGo=;
  b=fV0cgYNo1BGrkM+gUToihRsqXJcZP/8YmaGcvTn70TbKcF8oCIMDx5vP
   YdF/zkzdMjDYFe4R5WWklnwFXdefZnZb9cv7GBWSI4D5zd6bKTiBvNpG2
   4XBFFf6NKu144ONeVI1VDVzSGuOnqKZEXLafF2SjAJ3oISO58J9jn8eu4
   BAIA0qFKgx7TrnsjbKxoEnjRIGGJXOd9MxZYn/Q45cWjF/xSjPbQYxYG3
   LNd/qVfEI4zPsim5iR/2lCDoGBaTXokOstw6/yyAVr/cD19kto/g4+sBD
   F/j1SdYRSd6T5tQNeB+Crw8PpJegsBqQH7Ay+srdmMf4fPskBXZGkV2MO
   A==;
X-CSE-ConnectionGUID: IKMJXdTwSEKNyB3ZZbgIxA==
X-CSE-MsgGUID: 81cyIsHBS8KPfkDJm+fJ0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="180266535"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="180266535"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:54 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E6B91D2AB6
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 78740BCB83
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 136D16BF78
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B7A111A000A;
	Tue, 12 Nov 2024 17:25:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 39/47] python3-wheel: upgrade 0.44.0 -> 0.45.0
Date: Tue, 12 Nov 2024 17:24:35 +0800
Message-Id: <1731403483-21399-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--0.540600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrlKvhkP88iXT+RaR64jcCBcLc
	MUuTFJzBfHkstaG42/l3aWU5jdY62O1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3oWm/gAtjCd7AYUFsN5WfiFlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2I3a
	djBtsMrD5hJBiL6owLM9iO+pX+qO1TjISVqpUYcTedbZiL3YeIen4YBnqLlDj2LDsXcVFPzLh2n
	ovBZl8CeYKOkW2woQDRCv/wL/cAsfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207026

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Refactored the convert command to not need setuptools to be installed
- Don't configure setuptools logging unless running bdist_wheel
- Added a redirection from wheel.bdist_wheel.bdist_wheel to
  setuptools.command.bdist_wheel.bdist_wheel to improve compatibility with
  setuptools' latest fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-wheel_0.44.0.bb => python3-wheel_0.45.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.44.0.bb => python3-wheel_0.45.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.44.0.bb b/meta/recipes-devtools/python/python3-wheel_0.45.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-wheel_0.44.0.bb
rename to meta/recipes-devtools/python/python3-wheel_0.45.0.bb
index 1e7e0f27c6..5b7f600557 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.44.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.45.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "a29c3f2817e95ab89aa4660681ad547c0e9547f20e75b0562fe7723c9a2a9d49"
+SRC_URI[sha256sum] = "a57353941a3183b3d5365346b567a260a0602a0f8a635926a7dede41b94c674a"
 
 inherit python_flit_core pypi
 
-- 
2.34.1


