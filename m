Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFCFC3F6B0
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 08:41:02 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.6276.1659516047363765692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 01:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xcjXVRZl;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659516047; i=@fujitsu.com;
	bh=t7PgoIGyfZbouSMLSg022DBXEzx6mMz0ljD+bGyZPZU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xcjXVRZlu/2l2KilSDKQENchoIkDl/Np0LGyIIMHdf8DElLs8tKaRwIhUqO3l521F
	 DMT7LgfLXQWPUHqjLyWhxNZrv6QuHLBvQ4ArCfyNVdFiyHkQ5p4XieY7elvL74MZJO
	 SoH1IyAMGhz/VQweELrXJqND/fjfaurt7ppNpF4LKfyUOz4IDaPjOlCbUa4ELbUamK
	 ImngyH08MbuXssWc6ExCWRHA0UOp3QlfTdvwCrP4X6K9lVQBeOQ54ACygcX7WvUuQ/
	 fEstwpm415vsyjRGLquhnYfkAa4QfcDgRXbcrWrF7+hYbYafOqrjpFLV/xqXup2o0c
	 zoz3ibOUkqwGg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORpNtn8ir
  JYF6zgcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrHzxRPWgjauir1TP7M0ME7j7GLk4hASeMAo
  ceLXZiYI5zKTxJpJhxm7GDmBnN2MEnt7jUFsNgE1iem3brB2MXJwiAjoSVz9JwoSZhZQkXjxu
  4cdJCws4CpxfbETSJgFKPxs2wmwKbwCThL9p06ygdgSAgoSUx6+ZwaxOQWcJfpONbCAtAoB1b
  S8NIUoF5Q4OfMJC8R0CYmDL14wQ7QqSsy+3MwCYVdIzJixDWqkmsTVc5uYJzAKzkLSPgtJ+wJ
  GplWMVklFmekZJbmJmTm6hgYGuoaGprqGukYGxnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWV
  uck5KXp5qSWbGIHhm1LMeHoH46a+n3qHGCU5mJREeZkUXyUJ8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuDN0ALKCRalpqdWpGXmAGMJJi3BwaMkwiusBJTmLS5IzC3OTIdInWLU5Zj5te0AsxBLXn
  5eqpQ4r54xUJEASFFGaR7cCFhcX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzKtqBDSFJzO
  vBG7TK6AjmICO0OF6AXJESSJCSqqBab6Y3Yr3nlvFf/7Yw63bq8BsVO5eHGqs1Hy+Sevyjp9b
  Xj6oOrzybGTHxflz1Jx29Oo23g0IXPqyde3uv/HpKw6bqJ/dccv2+sfmtLcFL7svTLvwhPeGe
  q+mjOnFZt6T89tvXEvkclX9o3XyysZgvrOX/ynfdly2edq/C9VdXKvXNF8tn//hmfT9mQem+9
  6P6lXMruBsuvhz1e/u8LdNjuo+i5b5ti3XtjogrMnH1Kyj8+5F46OAqq8PrZ7ci1kcfCRf6o2
  3ye1jU4/zz5qsXiq9VCsypLHW+UXSnWO67x54fTrTKlxowJce++nMzsZQaYG5XKUpCy/Ncky+
  G9vFY+Fz7KplX53pDN5DCRdn5SqxFGckGmoxFxUnAgCJIfBgZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-591.messagelabs.com!1659516046!134372!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6789 invoked from network); 3 Aug 2022 08:40:46 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Aug 2022 08:40:46 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 665D21AE
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 09:40:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 5A60A1AC
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 09:40:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 3 Aug 2022 09:40:44 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cython: upgrade 0.29.30 -> 0.29.32
Date: Wed, 3 Aug 2022 16:40:28 +0800
Message-ID: <1659516030-31123-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659516030-31123-1-git-send-email-wangmy@fujitsu.com>
References: <1659516030-31123-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 08:41:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168804

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.30.bb => python3-cython_0.29.32.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.30.bb => python3-cython_0.29.32.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index ab8c4d65f3..750ccfd7ae 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "2235b62da8fe6fa8b99422c8e583f2fb95e143867d337b5c75e4b9a1a865f9e3"
+SRC_URI[sha256sum] = "8733cf4758b79304f2a4e39ebfac5e92341bce47bcceb26c1254398b2f8c1af7"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.30.bb b/meta/recipes-devtools/python/python3-cython_0.29.32.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.30.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.32.bb
-- 
2.25.1


