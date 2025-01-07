Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D939AE77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:01:45 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.16405.1736240495358588280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FpqgZkbF;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240495; x=1767776495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/RaVGGiwSJUzOSCWIZG68GpHS3139djuZRzBGrF+iDw=;
  b=FpqgZkbF7j7Fv7GetzYU4raSdMZzHXygbrx7k9VL236eCaEl+1CBXrXV
   dH43R3siRWvBQ4poEjMr+BuevCumlV2c90mME39DsCHyqNs1VwwoRlwbN
   gwHZPsvfk4/GRLyeDia6lXaBGkZ5tmkRn6Gn+eXMOD85q9MeBhY3xgmAI
   frrn2fyVNpBi/fmTE4A0h4z/8yeFaXzzjG0dZaK9Q+rPEQjs6LSlvv6wl
   W/bwCbho8cz2QcNyZ83sPyiEytpHRunzcZeTdlg21YzoWaJxVjGuvwe+G
   8ug97AMxB3MqlSYWvpI94eJC/KtrM/j9muMIgvKdPcvGZDVcAyyV+NIX9
   w==;
X-CSE-ConnectionGUID: WKQNkexfSF6h9j6rwmgyiw==
X-CSE-MsgGUID: Z9LbM9gqRLuRoc4T3nsrnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="186036798"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="186036798"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:33 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E801E8529
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 164BE20A7F
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 88A7341185
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:30 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 42C971A0073;
	Tue,  7 Jan 2025 17:01:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/13] python3-ruamel-yaml: upgrade 0.18.7 -> 0.18.9
Date: Tue,  7 Jan 2025 17:01:19 +0800
Message-Id: <1736240482-5243-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
References: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-1.556000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/ySAWHOR37+ATVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJooXWZSIKVRR3nVTWWiNp+v/kwFzTzcgzhGAN6i+va16uEok
	GD3z/g2egPPok7JOqQIAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz+P7AXHpPXf63Lx
	sVTyXsmIDtCvFYm0IfHKJoIRxz57twFjTlQVVmJjjQQB21DSYv3Gftn9AQU9kgkUsdySJY7yTui
	jLCRq7/iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 09:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209442

From: Wang Mingyu <wangmy@fujitsu.com>

License-Updated: copyright updated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-ruamel-yaml_0.18.7.bb => python3-ruamel-yaml_0.18.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.18.7.bb => python3-ruamel-yaml_0.18.9.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.7.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.9.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.18.7.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.9.bb
index 137b528913..efc07169f7 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.7.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.9.bb
@@ -2,14 +2,14 @@ SUMMARY = "YAML parser/emitter that supports roundtrip preservation of comments,
 HOMEPAGE = "https://pypi.org/project/ruamel.yaml/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=30cbbccd94bf3a2b0285ec35671a1938"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5cc5d45e8a30c81dade6ca1928caa515"
 
 PYPI_PACKAGE = "ruamel.yaml"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "270638acec6659f7bb30f4ea40083c9a0d0d5afdcef5e63d666f11209091531a"
+SRC_URI[sha256sum] = "59d0f8b10c658bd55ecd107e334d4117d766a2b9cc8f5176afcdadcff6f84a5e"
 
 RDEPENDS:${PN} += "\
     python3-shell \
-- 
2.43.0


