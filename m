Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C44CF9C7C
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.9330.1727246991880331349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Py+5p5WI;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246992; x=1758782992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4tiqvX/GR+WDCHYU0yR2pf6qjE6mhVStSrxslt0mnEg=;
  b=Py+5p5WI1yRgwS0QXEMQbGPdX75Qu3uEW0/WVObNZgrX9WWBwxDuO7kO
   uyUY91/SKXHVQflD6ZoXK/8u5DV6DQO1/RA4Cn00tLOWfEQF6jmUjffpt
   9q+/1IVMj1gsaPkgi/xGrbia/mkaiwyhaSHbqHnsxaJTu9oXUdWNv17xf
   uQ/kttb/ODFhqgEpvJbIXnWwJu4FQdhjN9MDrOlrwD+NZDljf0pad7IsP
   F9GFhLpopo7mlxISPjzUv1m5+kgFFd/BZUVrJDm3eld885vSNs5h5985Z
   dqTnj7sapcSaOiKQPCtExFrpXJQu8JSDI27+xwSEANrz3RsIyZt/8rqYz
   g==;
X-CSE-ConnectionGUID: 6ELl/X/0R0WJ1f5Ec0+igw==
X-CSE-MsgGUID: FQZOitE6QJW8f9fTu6aJPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="153715159"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="153715159"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:50 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 014EBD923B
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:48 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A888D746A
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D01636B5C3
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 80A7A1A01E9;
	Wed, 25 Sep 2024 14:49:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 37/47] python3-websockets: upgrade 13.0.1 -> 13.1
Date: Wed, 25 Sep 2024 14:49:10 +0800
Message-Id: <1727246960-20665-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--11.231200-10.000000
X-TMASE-MatchedRID: 242WXRytjV6jz0nOeth/yUIIxwDaU5mraXmdXF2Ym8dlioXfon9vxguv
	xVBYgUGLQhNrmhWV/jz7mSaLAkDFP3ph13BzduJ3EzEoOqAAVLOlLADMASK8x/4DDXoaCqk73ro
	OiomK7pWH9EbPfTAvIMLP2G/cz/Vfu8YSZxcdcCaDpW5ZeDjLZCEWM+1axeene/eKgB30qtLlIe
	IqE6XcN3ay0ExTjtBSLj+2lKW/5AhJsyjYmmAr9PCW/PNRRp/ZRUYppGmT91dYC5LPd7BvbRjsL
	eG/lxTCvkEchFodM1VDZvktvJg/p00HnCJfuh4HA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqfo
	MGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRmeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8h+ICq
	uNi0WJOm8urmnBTo1a84Bw/rjK/Sf2qBXOXVVw0I1MGZW+a9QftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204930

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Clarify comment.
- Wait until state is CLOSED to acces close_exc.
- Improve exception handling during handshake.
- Standard spelling on "an HTTP".
- Run handler only when opening handshake succeeds.
- Run spellcheck.
- Add dedicated ConcurrencyError exception.
- Improve isolation of tests of sync implementation.
- Fix typo in convenience imports.
- Add changelog for previous commits.
- Improve error messages on HTTP parsing errors.
- Log error when server receives bad request.
- Close connection when client receives bad response.
- Simplify handling of connection close during handshake.
- Proof-read upgrade guide.
- The new asyncio implementation has reached parity.
- Follow redirects in the new asyncio implementation.
- Switch from black to ruff for code formatting.
- Prevent false positives with latest ruff.
- Update FAQ after implementing reconnection.
- Make make build the C extension by default.
- Prevent a warning in twine upload.
- Add automatic reconnection to the new asyncio implementation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-websockets_13.0.1.bb => python3-websockets_13.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_13.0.1.bb => python3-websockets_13.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_13.0.1.bb b/meta/recipes-devtools/python/python3-websockets_13.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_13.0.1.bb
rename to meta/recipes-devtools/python/python3-websockets_13.1.bb
index 6a66375cdf..36838745ca 100644
--- a/meta/recipes-devtools/python/python3-websockets_13.0.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_13.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4d6ece65099411cfd9a48d13701d7438d9c34f479046b34c50ff60bb8834e43e"
+SRC_URI[sha256sum] = "a3b3366087c1bc0a2795111edcadddb8b3b59509d5db5d7ea3fdd69f954a8878"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


