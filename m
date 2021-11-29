Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E828CC4332F
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:01:28 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web08.62070.1638198087701789673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:01:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pXbVF0HC;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638198086; i=@fujitsu.com;
	bh=UIUXQeheTCvIIbL1ofu4NFCW8sIocl1vjj46oHEK9hs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pXbVF0HCyrnKesVGMAqMENYWaUFT1zEBAUvQQ6zMNzL1sf2ErLLY/6BS2CnZM4608
	 ts6j0VA37YXH/ZweRdtCu0ubK3LMMgPwXw3KWR3nA2BKyZYsrLBhQ/HCq8dHXCoWow
	 saP/bmMS/yeVaDNu88O2d2j5rdUlQQ8WCKC1QHsFZs2B5kJliqFvZYVx9Jw0wMLHJR
	 ZuZiVKDfbNj76I5Yfc33ppUSSDx8E4eQP8CQF4+IIJHpnf/qiH0MPVOiMeZFNjcER9
	 mi5oHnOkUELPSD/CXNmnW9Qe21CgNvF2gpNov5RbCtYxzzSSoiW0b4rDp/9tzinCc5
	 V6Y6EsuSYKDrQ==
Received: from [100.113.7.129] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 52/4B-09058-54BE4A16;
 Mon, 29 Nov 2021 15:01:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqOv6ekm
  iwYEPchZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8baM83MBU1iFW+/9rE3MPYIdzFycQgJPGaU
  OLb+FxuEc55JYu3D/4xdjJxAzglGicsHkkBsNgE1iem3brB2MXJwiAjoSVz9JwoSZhZQkXjxu
  4cdxBYWsJE4+O0TE4jNIqAq8ezNOxYQm1fAWeL1/01sILaEgILElIfvmUFsTgEXiQnXbjKDjB
  QCqjnxUhSiXFDi5MwnLBDjJSQOvnjBDNGqKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMgrOQtM9
  C0r6AkWkVo2VSUWZ6RkluYmaOrqGBga6hobGuqa6RsYVeYpVukl5qqW5yal5JUSJQVi+xvFiv
  uDI3OSdFLy+1ZBMjMHxTClnf7WB89vqD3iFGSQ4mJVHerCVLEoX4kvJTKjMSizPii0pzUosPM
  cpwcChJ8Pa/AsoJFqWmp1akZeYAYwkmLcHBoyTCW/wCKM1bXJCYW5yZDpE6xagoJc4rCtInAJ
  LIKM2Da4PF7yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwryvXwJN4cnMK4Gb/gpoMRPQ4rd
  LF4MsLklESEk1MDXP/9q8+8Wtv78u6hvwPK/b61z2M3Ka8Ipz5zYazo9bN+cs43Zx1qhaEdbf
  VmVf99/4HrN3UaUZ66/T0q/W3Hu/IqLrZODx45+5K9cv2vNVp0wj6NVPlbmlrzYIWttua9trJ
  nsh8KusRXW+dsaJPNG4LW9yEi61rsxaXP3gUj3zo/x3m+f3/gx+Z1tttumFxiSfXgWPSS8412
  3baWsxbeP9ysdfur2qL05eGirCVu7drMd47XSDyrcdan/j52fu5znyy2nq/0lzoutOlwtnXSn
  qeuByI/XQd4Y7L1YrnfZtOFRtXcFXPmm52HLB5QsZZm53lp9S98Bn5SHj4ppVm0p9UrWjJfMO
  Z7IseXfxzPYAJZbijERDLeai4kQA8OQik1oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-238.messagelabs.com!1638198085!414190!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20342 invoked from network); 29 Nov 2021 15:01:25 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Nov 2021 15:01:25 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 00FB41009EC
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:01:25 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E7E93100240
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:01:24 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 15:01:11 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sqlite3: upgrade 3.36.0 -> 3.37.0
Date: Mon, 29 Nov 2021 23:00:55 +0800
Message-ID: <1638198055-118993-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638198055-118993-1-git-send-email-wangmy@fujitsu.com>
References: <1638198055-118993-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 15:01:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158946

Changelog:
1.STRICT tables provide a prescriptive style of data type management, for
  developers who prefer that kind of thing.
2.When adding columns that contain a CHECK constraint or a generated column
  containing a NOT NULL constraint, the ALTER TABLE ADD COLUMN now checks new
  constraints against preexisting rows in the database and will only proceed if
  no constraints are violated.
3.Added the PRAGMA table_list statement.
4.CLI enhancements:
  a.Add the .connection command, allowing the CLI to keep multiple database
    connections open at the same time.
  b.Add the --safe command-line option that disables dot-commands and SQL
    statements that might cause side-effects that extend beyond the single
    database file named on the command-line.
  c.Performance improvements when reading SQL statements that span many lines.
5.Added the sqlite3_autovacuum_pages() interface.
6.The sqlite3_deserialize() does not and has never worked for the TEMP database.
  That limitation is now noted in the documentation.
7.The query planner now omits ORDER BY clauses on subqueries and views if
  removing those clauses does not change the semantics of the query.
8.The generate_series table-valued function extension is modified so that the
  first parameter ("START") is now required. This is done as a way to
  demonstrate how to write table-valued functions with required parameters.
  The legacy behavior is available using the -DZERO_ARGUMENT_GENERATE_SERIES
  compile-time option.
9.Added new sqlite3_changes64() and sqlite3_total_changes64() interfaces.
10.Added the SQLITE_OPEN_EXRESCODE flag option to sqlite3_open_v2().
11.Use less memory to hold the database schema.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sqlite/{sqlite3_3.36.0.bb => sqlite3_3.37.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.36.0.bb => sqlite3_3.37.0.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.36.0.bb b/meta/recipes-support/sqlite/sqlite3_3.37.0.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.36.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.37.0.bb
index 30c9445be1..68394c88b0 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.36.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.37.0.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2021/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "bd90c3eb96bee996206b83be7065c9ce19aef38c3f4fb53073ada0d0b69bbce3"
+SRC_URI[sha256sum] = "731a4651d4d4b36fc7d21db586b2de4dd00af31fd54fb5a9a4b7f492057479f7"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_WHITELIST += "CVE-2019-19242"
-- 
2.25.1


