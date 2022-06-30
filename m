Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9E3C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 04:26:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.20795.1656563163037435277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 21:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oFpC5xkL;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656563161; i=@fujitsu.com;
	bh=yOvStUa8IwkN5ZZSE1Czw78S2TOfJTS4Wl8i5fGFnEo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oFpC5xkLeZkdFYIsEYcz7LZIVvBv1YoaPn3uN5jwB5VdTBZGyXZ2PsoXUYkbkTeIZ
	 WtH3aoCVCDjN6F4w1nHROr2n98r2rdXmINZyEFFJ8yRPLFFhpF8fBJPr8aCRs/kyiN
	 wq/W8sZtCPp5p615WdgwPH4vrlzJJ4pPv1jLIB8Szqbh1xSooFwNbZH/+GpnGQ/Pva
	 8Q/h8znKT3Cz6A2HFndMTdZYsyUNkLgdWTw2zFoZ93AX9ebF3rvSlTavHZ5cPJfMPK
	 a3PNqDzaulIHIdouNJbNqdcZkegyvAj+om+PmjQzYCdKhJK4nxSivyrb7FkE3WUEiy
	 u5qmKs5/E/UQg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsViZ8ORqHtDdW+
  SwZmbHBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8ac4ysYC15yVOzu28PSwNjI0cXIxSEk8JhR
  4s6Fi4wQzjUmif5FR9ggnD2MEr/f/gVyODnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jARuLYyWZGEJtFQFViwrW7YK28Ak4Sb59eYwWxJQQUJKY8fM8MYnMKOEus3dEKVi8EVH
  Nr3gNWiHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNLBB2hcSMGdvYIGw1iavnNjFPYBSchaR9FpL
  2BYxMqxhtkooy0zNKchMzc3QNDQx0DQ1NgbShrrGBXmKVbqJeaqluXn5RSYauoV5iebFeanGx
  XnFlbnJOil5easkmRmAgpxSnyu1gPLDvl94hRkkOJiVRXkP2vUlCfEn5KZUZicUZ8UWlOanFh
  xhlODiUJHiPKwHlBItS01Mr0jJzgFEFk5bg4FES4Q0FSfMWFyTmFmemQ6ROMVpyTJ39bz8zx3
  IwOfNr2wFmIZa8/LxUKXHeNypADQIgDRmleXDjYJF/iVFWSpiXkYGBQYinILUoN7MEVf4Vozg
  Ho5IwrzbIWp7MvBK4ra+ADmICOmjntD0gB5UkIqSkGphOG7vJ6Cp1pnfKHA7+sind+4OTr5Ea
  89Wejdcqv6zP3xKz4kOL8BlXydwDLdw7nQr3rJxSqlLNorxsus82l5zgPw9EmPeskDEoYr36Y
  2lHQIbkwhWOey6vEI60rStkED41zUXau3bqtpUi7jxr/JoM/kp73XHeZfNylUHXwtbaCUeNbx
  1/lrJmzeTT9i9mvJ5bpsjyc/3x22y3tPc4X3t3/Q+TV8IORr/JmlyBUrvXpszY1H/qscb7WYu
  lVl+QeBBrqnH/se+FhetzApaYrDgly1VnqsEsoCwd1hIh4H3a/rbdhziGh4t3bWYOmmt+X7R3
  U+rksPDze4sfPAlLLnp7iOPAw4VpNSG5nNreZXxKLMUZiYZazEXFiQC2pfTcdwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-732.messagelabs.com!1656563159!55527!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31384 invoked from network); 30 Jun 2022 04:26:00 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 04:26:00 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8C7B610018D
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:25:59 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 804AA100043
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:25:59 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 05:25:58 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sqlite3: upgrade 3.38.5 -> 3.39.0
Date: Thu, 30 Jun 2022 12:25:36 +0800
Message-ID: <1656563137-11471-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656563137-11471-1-git-send-email-wangmy@fujitsu.com>
References: <1656563137-11471-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 04:26:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167399

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sqlite/{sqlite3_3.38.5.bb => sqlite3_3.39.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.38.5.bb => sqlite3_3.39.0.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.39.0.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.38.5.bb
rename to meta/recipes-support/sqlite/sqlite3_3.39.0.bb
index d56a3a0209..a44a752893 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.39.0.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
+SRC_URI[sha256sum] = "e90bcaef6dd5813fcdee4e867f6b65f3c9bfd0aec0f1017f9f3bbce1e4ed09e2"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.25.1


