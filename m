Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72129EB28E0
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 07:57:10 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6632.1770364617737362840
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 23:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BJq0Ej/Q;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770364617; x=1801900617;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f6/nOmOSi2jdeK3hEh9091eWrGcQt2pFLgKgmUKe9RI=;
  b=BJq0Ej/QK40vAOLNP/GgvlMVkzqcgmYfTNh3L8L2s76l1OfspXV06jwm
   +CRm6IPFe93mUQOXYtc7EvtFGIp85/dV3BaM/osKvGweRRQmxghKAijTn
   O6YpNN49PRoL4LWUvJHd7j2BAcBJd355vbKOQSVR8R857vO1zsJs37DPP
   1bE6pX399gXzkH4qc6jmwTDkFe/E6m753dUpPj7VMdxqnBSm29q2YspQb
   YzmEaXNHUO6cJVvCzZr0iw++HauG81zyB/2I7JmDW/WVn02YvY5LIIpPu
   rI4WIFopPLZsumyNRMtxFkYWepBpyAAeTHxxiDVlNYJVOU0IGZwG3bU74
   A==;
X-CSE-ConnectionGUID: VyfGxqK4S6yHCm9VPhxqbQ==
X-CSE-MsgGUID: MbNhNL1eSQmVyedqUMEuzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="229426436"
X-IronPort-AV: E=Sophos;i="6.21,276,1763391600"; 
   d="scan'208";a="229426436"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 16:56:55 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id E5E1342A325
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Feb 2026 07:56:55 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 886A7861273
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Feb 2026 07:56:55 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 49DDC14001CC
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Feb 2026 07:56:53 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-wcwidth: upgrade 0.3.1 -> 0.5.3
Date: Fri,  6 Feb 2026 15:56:49 +0800
Message-ID: <20260206075649.5668-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 07:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230597

Changelog:
https://github.com/jquast/wcwidth/releases/tag/0.5.3

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{python3-wcwidth_0.3.1.bb => python3-wcwidth_0.5.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.3.1.bb => python3-wcwidth_0.5.3.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.3.1.bb b/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-wcwidth_0.3.1.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb
index beee5f352c..8dd0584dcd 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.3.1.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.5.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "5aedb626a9c0d941b990cfebda848d538d45c9493a3384d080aff809143bd3be"
+SRC_URI[sha256sum] = "53123b7af053c74e9fe2e92ac810301f6139e64379031f7124574212fb3b4091"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0

