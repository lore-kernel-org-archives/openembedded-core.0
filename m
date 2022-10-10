Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74942C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:52:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.4080.1665391969460552540
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rgXlNn+q;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391967; i=@fujitsu.com;
	bh=yvHATOaOH8SgwUtl+dBRYbazNWqlye+xfsNfcztY1lE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rgXlNn+qLA1BKC5IZb9F5sKft7+3PUJTc1kbDg+FyG/cH2vLJU3T/64/XPfJh/aEh
	 QJm3bayTK7Xds8shz+CK1yWw+7d0pPY82j/yCuFbD23GX5gZF0IEWwE802SPFlNHUW
	 xKhs+1QvPnG9iLRpevwm+C8S3i/GKcTQMYQWEPGR0H3t8h45FjuEWLDZFKmv4M1oOj
	 xYnE+JUiB4A4Bm89SfJZsxZPxW5m1HjHvHKsmhvoiZWvnQm/5IrZEyDAhQzLpqBRHb
	 DGDse33HhoPIuvsfNGG2hp0nXCZ5Ihs53wcqhpOB3aQdjeo+qM49oGM1u3APeZn5YW
	 s92cPypkPQzzQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORqBt/1zn
  ZYP1aVos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPCw8SCPq6K8wva2BsY13N2MXJxCAk8ZpRo
  Pb+cDcK5xiTx/1oLI4Szh1Fiyrd7QBlODjYBNYnpt26wdjFycIgI6Elc/ScKEmYWUJF48buHH
  cQWFvCT2P5zJyOIzSKgKnHj8xYWEJtXwFGid8JbsDESAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1itEoqykzPKMlNzMzRNTQ
  w0DU0NNU1ttS1MNJLrNJN1Est1S1PLS7RBXLLi/VSi4v1iitzk3NS9PJSSzYxAkMypVg9aAfj
  txU/9Q4xSnIwKYnyGhxyThbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwfvkBlBOsCg1PbUiLTMHG
  B8waQkOHiUR3gcXgdK8xQWJucWZ6RCpU4y6HDO/th1gFmLJy89LlRLnPXIHqEgApCijNA9uBC
  xWLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5n1/C2gKT2ZeCdymV0BHMAEdcfKqE8gRJYk
  IKakGpgerKxm5j5dnvXlVOHPfsx9BK7dMMze9M/uc2hEBnmCtFOOJWpXJmqrHGpJ0TC4sPsIy
  oYhj53mtZ+0O179rHGLZ1asr/N85c1vpZZN7u2pFOHs8OmYkLTq8dWEQh/Udnqvv7sR+l5nAy
  68mtvzl5RADl44p/zKz57NsW2248l3rP84DSnEZBVcOf7Ce5jOJXzmj/cTczrp3PPFhuw0f/c
  45YVPzPeRFEi/H0elvup2sj+1x7ZJfsEZ0wToBLvsrXnwJPccfb5dvPD7HoiTzWNL/gILr8zb
  2//3S0yx6bEoe076k59eySyR2Gy4//9tW+aPiTf9NN7yq0jt43qSejuVz/iPRfPjc2WtJ9VLl
  z5RYijMSDbWYi4oTAdYsVnNQAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1665391966!4527!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22221 invoked from network); 10 Oct 2022 08:52:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:52:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C9683100191
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:52:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BD8CF100043
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:52:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:52:45 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-importlib-metadata: upgrade 4.12.0 -> 5.0.0
Date: Mon, 10 Oct 2022 16:52:28 +0800
Message-ID: <1665391949-8225-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 08:52:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171569

Changelog:
#97, #284, #300: Removed compatibility shims for deprecated entry point interfaces.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...b-metadata_4.12.0.bb => python3-importlib-metadata_5.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.12.0.bb => python3-importlib-metadata_5.0.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb
index c00e42cb1c..f0623669d7 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "637245b8bab2b6502fcbc752cc4b7a6f6243bb02b31c5c26156ad103d3d45670"
+SRC_URI[sha256sum] = "da31db32b304314d044d3c12c79bd59e307889b287ad12ff387b3500835fc2ab"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.25.1


