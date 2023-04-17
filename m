Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 403B9C77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 08:08:41 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.48778.1681718915871326740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 01:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vKvbiW8P;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681718914; i=@fujitsu.com;
	bh=uxDWnuALLYBEQEzMZ8TLJhwS6RDn4YahN81uvHFzrPM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vKvbiW8Pva0qQyhHJtG8Zk41dlmlnt11cs6x8ZHUd+TGhdvSEgCZZKZjncZ5eJDXL
	 IQgdiR0M+vo5UbDb5Lp9ZAUcrkb+JdHX5Xof9XoZvbkguq0Dg1rtuGmo/7/aWCNm4e
	 Qs88xoIaSyQpiZPfqorUVZZtnx4R79FRUTZ0mWqyaoXhA6gC5CbnSu6ysL6RdWrdnL
	 FWdDVubKFgMFZ/LhlOK3IDkISjuwzNjm7JXAJK5r9fmLC9xJrU9xHo+vneUuZtxpKI
	 dYBKPoTzi9qCOuUVaqPw7qE9ohNrRkIBbnF4yw4TyT02mUS996FqP+Zb3MLj/X0n0m
	 faskpE4KiJjaQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8OxWbfxn02
  KwclDhhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b7sxMZC/5yV6w+foy5gfExVxcjF4eQwANG
  iZuX/zB2MXICOVeYJBoOikPYexkllnzPB7HZBKQkbtz/z9bFyMEhIqAncfWfKEiYWUBF4sXvH
  naQsLCAk8SzLZkgYRYBVYkD1+aygti8QOGOWe0sILaEgILElIfvmUFsTgFniQdv2lggNjlJzF
  10hRmiXlDi5MwnLBDjJSQOvnjBDNGrKDH7cjPUnEqJ1g+/oGw1iavnNjFPYBSchaR9FpL2BYx
  MqxhNi1OLylKLdC30kooy0zNKchMzc/QSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5NzUvTy
  Uks2MQKDNqWY9c0Oxm19f/UOMUpyMCmJ8r5ItU4R4kvKT6nMSCzOiC8qzUktPsQow8GhJMH78
  qdNipBgUWp6akVaZg4wgmDSEhw8SiK8xs+A0rzFBYm5xZnpEKlTjIpS4ryv/wAlBEASGaV5cG
  2wqL3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZiX/S/QFJ7MvBK46a+AFjMBLZZTAltckoi
  Qkmpgiv1SUmVyd2GlbfKxf/0S8172vKrd6yOpkblUZ/326EsV2xMWzShgSpjlmMQT81g5K/fJ
  qUWei+epcPz4/urDFUmFlY8KFzw7wRlw/+Txiqn9p/UlLhfLtV+N0J95Rz85IdjdVKTvWo/i7
  O21y+O6g63q203nbp7anSJtOLEpf8JrWbni+oD3sWahH5eyHb+/weWNT9fuR9d+3Dp3/2Hzyu
  2Jvk8jTOp/Re39KTonZtW9vV9mX/ozITPSmHV1w7e/Ol4igkK8nV42hRfKZdR2eHk2aE2YUT1
  jIrvkD5XbiSvnxfVe5d3MvcV4tm9jtsnXk8fSVabsrrl3KZw3TOVbdILQh5Vb7Zbbzlp/b0f4
  PiWW4oxEQy3mouJEAFwxKU1VAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-587.messagelabs.com!1681718913!484225!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15669 invoked from network); 17 Apr 2023 08:08:33 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 08:08:33 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 6AACA158
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:08:33 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5D359155
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:08:33 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 09:08:32 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-packaging: upgrade 23.0 -> 23.1
Date: Mon, 17 Apr 2023 16:07:55 +0800
Message-ID: <1681718877-19480-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681718877-19480-1-git-send-email-wangmy@fujitsu.com>
References: <1681718877-19480-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 08:08:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180154

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Parse raw metadata
 Import underlying parser functions as an underscored variable
 Improve error for local version label with unsupported operators
 Add dedicated error for specifiers with incorrect .* suffix
 Replace spaces in platform names with underscores
 Relax typing of _key on _BaseVersion
 Handle prefix match with zeros at end of prefix correctly

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-packaging_23.0.bb => python3-packaging_23.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_23.0.bb => python3-packaging_23.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-packaging_23.0.bb b/meta/recipes-devtools/python/python3-packaging_23.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-packaging_23.0.bb
rename to meta/recipes-devtools/python/python3-packaging_23.1.bb
index bda124e32c..53d3522dd7 100644
--- a/meta/recipes-devtools/python/python3-packaging_23.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_23.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "b6ad297f8907de0fa2fe1ccbd26fdaf387f5f47c7275fedf8cce89f99446cf97"
+SRC_URI[sha256sum] = "a392980d2b6cffa644431898be54b0045151319d1e7ec34f0cfed48767dd334f"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


