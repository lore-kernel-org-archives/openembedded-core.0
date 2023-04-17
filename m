Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4047C77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:57:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.47822.1681714626266723260
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=releq370;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681714624; i=@fujitsu.com;
	bh=rWvooL3a64fuFMZmzQhYA4xSLF5yXuhYxakLz33IBcA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=releq370/Zkb4g2zK3s9S5eNUqgMniESxaJ/T1VMJMCQbGEyGLaDqoTJULOJCrfYf
	 4J3aEYtIS5ey+Wu4bn5zbIIu9JNdihzw6Fse5kJw/lfo6FVp+eURDQc2uP3esYO0IL
	 KR8a9bthDWXSTjpmbGNe5uUOfeykrfBLNSYeotxNvGtunmDwCQyz2/ohEqAJnfxUTH
	 uW6p8xJ/oASiNRVoTCH6g85TMMUchJ/2iVgYN8lDShfBS3jcfblWoFkF5gXNcZyVrz
	 udhNiK6eXz9/Vk6G4id6zJp9R9x2PIzXZRra3NvcxyIXOTMCyX9uBXYb8j0iyVQ2gD
	 x4cVWC0vGkCLg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSffAW5s
  Ug3nfuSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oynN3ezFWzlrliw/yFLA2MzVxcjF4eQwGNG
  iU/LVzBCONeZJDp7+tkhnL2MEmcnX2XpYuTkYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAWuJ3kMzGUFsFgFViZOPfjCB2LwCThLvLnWDjZEQUJCY8vA9M4jNKeAssef7M7AaIa
  CalrdX2SHqBSVOznzCAjFfQuLgixfMEL2KErMvN0PNqZRo/fALylaTuHpuE/MERsFZSNpnIWl
  fwMi0itG0OLWoLLVI10gvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uAQok1herJdaXKxXXJmbnJOi
  l5dasokRGLopxar9OxjX9v7VO8QoycGkJMr7ItU6RYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb
  8NrmxQhwaLU9NSKtMwcYBzBpCU4eJREeI2fAaV5iwsSc4sz0yFSpxgVpcR5698AJQRAEhmleX
  BtsNi9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY99oLoCk8mXklcNNfAS1mAlospwS2uCQ
  RISXVwLS451fWn4j8c1ssXkS/vfnj2yHF6c/zNS1vpeY4nvL5pHpXdtNH7nDHJaq7V90LedIg
  n7/rPovR+on3lbMyrk7Yz57i5aSq95J/h3bzx1/3dzxK4hCdw6Govv74nJvLr+kYVZrfObA/7
  HTHhY41bAYSql67r0kEnfIPjZlhP/PZEZ+6cP1lBnt6olw+H1/lLNVfqHGzLNSl8g6br4JQnP
  yUFvU5Rzb2pl03cgufJBqvrRPeyvfKNmJO+Nap8SX7ZoT/6ihSkls7nXfKRftFG6pXmBzo2P3
  0taMaa2aC96YbTruKGje92+Fm+d/v8WSOVml1p2bpjKzfslbW7/0lAtl4RW0Uj8406inesuSj
  lBJLcUaioRZzUXEiAFB5KSpYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-571.messagelabs.com!1681714624!400373!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17124 invoked from network); 17 Apr 2023 06:57:04 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:57:04 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id DDB4A1000FE
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:57:03 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D20151000FC
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:57:03 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:57:02 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] sip: upgrade 6.7.7 -> 6.7.8
Date: Mon, 17 Apr 2023 14:56:34 +0800
Message-ID: <1681714595-18749-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681714595-18749-1-git-send-email-wangmy@fujitsu.com>
References: <1681714595-18749-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180139

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  - The latest version of ABI v13 is v13.5.0.
  - The latest version of ABI v12 is v12.12.0.
  - The 'wheel-includes' value of the 'tool.sip.project' section of
    pyproject.toml now supports the use of absolute file patterns.
  - Replaced the use of the 'toml' package with the standard library 'tomllib'
    package for Python v3.11 and later, and the 'tomli' package for earlier
    versions of Python.
  - Bug fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.7.7.bb => sip_6.7.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.7.7.bb => sip_6.7.8.bb} (83%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.7.7.bb b/meta-oe/recipes-devtools/sip/sip_6.7.8.bb
similarity index 83%
rename from meta-oe/recipes-devtools/sip/sip_6.7.7.bb
rename to meta-oe/recipes-devtools/sip/sip_6.7.8.bb
index 5e361d972..01000f59c 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.7.7.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.7.8.bb
@@ -11,6 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 inherit pypi setuptools3 python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "dee9c06fa8ae6d441a401f922867fc6196edda274eebd9fbfec54f0769c2a9e2"
+SRC_URI[sha256sum] = "7e7186a36818c9d325c82e59ac5b049d9022c2d5783942c38d49497ac8a94c8f"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


