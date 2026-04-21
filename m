Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE284F89229
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:53 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20399.1776765404177585636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XQY7B1hB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765405; x=1808301405;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XrX5PRxKVST3Wt6BD969yvCtP/w4TbybekdeRMqn+Y0=;
  b=XQY7B1hBP9+VYcRrfTsgI8mnnVO+iIEk1XxaX0nCy7j/MZMocZCsdaNh
   rdRRTwdyNV/97ZP6Ug7Nnc1/m9uCHzmktE+QWkamv/eWZB32qHyQOnyAc
   XQhia/cbScMkxRBWg9ZTXJrkjNd+xrMDdYm/c7Uy41NqndATzzCYuP+yG
   102P7wq5xF+qGon/LHlTSpJMp48FjL7bSPOJadLCsmHWp4IbSt4ojlCtT
   vxiK1BAe1b3ur5cCzSGZELOfqW3csX041kqG/6Kxa89OamribVe81Mxel
   akYZXdWtEHIfMrTGJCpfjsHNonUfa9WRu8nBXjrzs3EhvH9QW3k8Ixh99
   A==;
X-CSE-ConnectionGUID: BZKKFgsvQgCjxaKYnXJVdg==
X-CSE-MsgGUID: CSadbhTpQeGGkHaOp4PauQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="237630066"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="237630066"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:43 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9BC25C00547
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:42 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 5286E140035D
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id E1618140025F;
	Tue, 21 Apr 2026 09:56:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/49] mesa: upgrade 26.0.3 -> 26.0.5
Date: Tue, 21 Apr 2026 17:55:29 +0800
Message-ID: <20260421095559.1856-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235627

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b3ad9d8a54..01f7e3bcea 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,8 +20,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch \
 "
 
-SRC_URI[sha256sum] = "ddb7443d328e89aa45b4b6b80f077bf937f099daeca8ba48cabe32aab769e134"
-PV = "26.0.3"
+SRC_URI[sha256sum] = "d229c9937d9a25ca0a8958c59f425174563d300ec42acbea2dbe84a055023368"
+PV = "26.0.5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


