Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16ACC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 13:08:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.7851.1646140097320844816
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 05:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=P89GX83q;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646140095; i=@fujitsu.com;
	bh=kaS4QI9E9Oa2OZNF1ECt06/BFjcaqNa+Bx+9kDt7+qQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=P89GX83qrkNbZFDBLtrmZmnMzqiXpXKowEFIMLJtFMiDnjYwQrIDw2BNriwA+XVMo
	 s7a2drO0RzItRcXKDOHO49MmkSdm5N2LwPQ/FMTsHmLgl/1zi1DeNI6RZazQRliSbZ
	 Osh7t8lvCG15YFw2pE/ALICLBD7CWqlmN0tWdEStniXAsS3RBgPy1kNslDVCa6pjvP
	 F3ZDXVQTjh5waMRuBYGrhFDRLG8+hLgtjjrMPKJnmtTXXSYN3YN67AdZv+JDLWyIuj
	 1v/PdQNB1VmDyXnKoino+HkAFLIdwNGF/zOdtJCRcTHsoC+O0yezMPf2/t85DYs5I9
	 rAAM/dqO+O4ig==
Received: from [100.115.33.107] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 95/98-02429-FBA1E126;
 Tue, 01 Mar 2022 13:08:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqLtPSi7
  JoGWahcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtH+/jtTwXahig1XO1kaGM8IdDFycggJPGaU
  eDGbt4uRC8g+zySxsWEZK4RznFHi4uQPrCBVbAJqEtNv3QCyOThEBPQkrv4TBQkzC6hIvPjdw
  w5iCwvYSLz8f4gZxGYBii9YdYkRxOYVcJLYs/wZG4gtIaAgMeXhe7AaTgFniWlzXrBBHOEkcW
  nrNCaIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjNZJRZnpGSW5iZk5uoYGBrqGhqa6xqa6hiaWeolVuol6qaW65anFJbpGeonlxXqpxcV6
  xZW5yTkpenmpJZsYgUGcUqw8dQfj6VU/9Q4xSnIwKYnyqt2UTRLiS8pPqcxILM6ILyrNSS0+x
  CjDwaEkwesMjAshwaLU9NSKtMwcYETBpCU4eJREeFPFgdK8xQWJucWZ6RCpU4yKUuK800ESAi
  CJjNI8uDZYFF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy7UBJoCk9mXgnc9FdAi5mAFv8
  NlgJZXJKIkJJqYDJp8VxoUS4+6/eczXd5bopUSHy4x8Vq/UFi768olTbNwp/v1xwT/f9Rv3eN
  oXhpmsqX2r1XVLWKglb/LNSZbnI94b7YrWxrd5aypuS7c+bEft/LXblk+qOIFycc1mmbrQ7Qi
  9FaePO7zL87vNtNdSw+7dnI+FRWfN3rEAs//vQ209Xt5/P77nAUzb7npb3IweEhz4p38W0zv/
  goBl2ds3KGTa/WKb2H4p8juFqs9qqcNGrI2rnJeeG6b9um2b2f+2yNnern6In9fzWnd4TeeK9
  f/Jj9C0v8V4X35RsuM83Y5K3OqG0/bWWXKEcky7ImmUnzvsXtOPrxrH/RyrNfRS3THQw+Lqhz
  OSJ23+oxh5gSS3FGoqEWc1FxIgCN2ElWXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-565.messagelabs.com!1646140094!6843!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12863 invoked from network); 1 Mar 2022 13:08:14 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Mar 2022 13:08:14 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 83A79100181
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 13:08:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6A01810018E
	for <openembedded-core@lists.openembedded.org>;
 Tue,  1 Mar 2022 13:08:14 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 1 Mar 2022 13:08:07 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sqlite3: upgrade 3.37.2 -> 3.38.0
Date: Tue, 1 Mar 2022 21:07:53 +0800
Message-ID: <1646140075-39370-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646140075-39370-1-git-send-email-wangmy@fujitsu.com>
References: <1646140075-39370-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 13:08:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162552

Remove invalid PACKAGECONFIG : json1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/sqlite/sqlite3.inc                        | 3 +--
 .../sqlite/{sqlite3_3.37.2.bb => sqlite3_3.38.0.bb}            | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.37.2.bb => sqlite3_3.38.0.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index aa5dc0974b..b89f509c12 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -23,7 +23,7 @@ CVE_PRODUCT = "sqlite"
 inherit autotools pkgconfig siteinfo
 
 # enable those which are enabled by default in configure
-PACKAGECONFIG ?= "fts4 fts5 json1 rtree dyn_ext"
+PACKAGECONFIG ?= "fts4 fts5 rtree dyn_ext"
 PACKAGECONFIG:class-native ?= "fts4 fts5 json1 rtree dyn_ext"
 
 PACKAGECONFIG[editline] = "--enable-editline,--disable-editline,libedit"
@@ -31,7 +31,6 @@ PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline ncurses
 PACKAGECONFIG[fts3] = "--enable-fts3,--disable-fts3"
 PACKAGECONFIG[fts4] = "--enable-fts4,--disable-fts4"
 PACKAGECONFIG[fts5] = "--enable-fts5,--disable-fts5"
-PACKAGECONFIG[json1] = "--enable-json1,--disable-json1"
 PACKAGECONFIG[rtree] = "--enable-rtree,--disable-rtree"
 PACKAGECONFIG[session] = "--enable-session,--disable-session"
 PACKAGECONFIG[dyn_ext] = "--enable-dynamic-extensions,--disable-dynamic-extensions"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.37.2.bb b/meta/recipes-support/sqlite/sqlite3_3.38.0.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.37.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.38.0.bb
index eb684e0d14..a797679f12 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.37.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.0.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "4089a8d9b467537b3f246f217b84cd76e00b1d1a971fe5aca1e30e230e46b2d8"
+SRC_URI[sha256sum] = "1c76e25dc63d9f3935e0f406aec520a33ee77cf54ea5147dffe1fae8369eff68"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.25.1


