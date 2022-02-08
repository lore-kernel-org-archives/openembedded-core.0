Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0B7C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 10:27:15 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.9347.1644316034278978765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 02:27:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=siRpBGhh;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644316031; i=@fujitsu.com;
	bh=0dL3THPgQYblsB2dNJ7bDpSJLYas6e5Nq4gAg45F85E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=siRpBGhhMMuAxHRmyi2dSdkwTo0I5M+hAkT+dxBXEouJLwdfDGltxFxPPxni4CbBc
	 NVgAHRmcEeVEvz8/aJTA34A5P+E7z6gSSmnwWfuHMy0hoMKXbReU942vCFq9aTOfEd
	 Zx4b7w8ehIYc70sHUtGNLf9V1viCH20A1E3s9zpRCO3+N6MydVh+qn2sxDoKPrATbS
	 CgH11UV4/4KMjM59GcVXcTWXDaVt90bvFGW/AYbuYodsD7YQ7znNGaC9QkvvAFIDKZ
	 Xu6NwbQ1h14uLfvx3x929sMmZ6rnxw+UKpQguKesXxUNy43Z9dKOhGR3ffflhWCBzR
	 hrwQOfSXc1aRg==
Received: from [100.115.64.195] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 C9/49-24566-F7542026; Tue, 08 Feb 2022 10:27:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8MxSbfOlSn
  JYMZeI4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPyltdMBUv5Kv7t7GBsYLzL08XIxSEk8JhR
  YtemTaxdjJxAznkmiRV/wyASxxklnr06xw6SYBNQk5h+6wZQEQeHiICexNV/oiBhZgEViRe/e
  9hBwsICDhL/ugxBwixA4dl7N4KN5BVwlFh+Yj0biC0hoCAx5eF7ZhCbU8BJ4v6OZywQax0lPu
  5aCVUvKHFy5hMWiPESEgdfvGCG6FWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyFpX8D
  ItIrRLqkoMz2jJDcxM0fX0MBA19DQVNfMTNfIyEIvsUo3US+1VDc5Na+kKBEorZdYXqyXWlys
  V1yZm5yTopeXWrKJERjIKcVOT3Ywvu77qXeIUZKDSUmUN0mVKUmILyk/pTIjsTgjvqg0J7X4E
  KMMB4eSBK+1C1BOsCg1PbUiLTMHGFUwaQkOHiUR3tUgad7igsTc4sx0iNQpRkUpcV4ZkIQASC
  KjNA+uDRbJlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ87qATOHJzCuBm/4KaDET0OKvi/4
  lAi0uSURISTUwTd//J2zjN7YdjVyrEpaKPsrZFLM1ImzZDblttps5SqfzLHwmF3zHwif4otK0
  i7ubY1/GiLB0z155kuf7h8QJl7dc0dqw4FCceUvvJrFf799nKbRfuXMxM1YicsVUzfLu2g8lf
  FsW88SJH5+37ZdI4K22hqMNAdknptxd95yrKOtzV6pir/PBmxJWtjue+SzeOUvi/MnPdrcmlM
  /qKVxk2V8iI2MZG/Hg/o1g5Tl/6hZoNt99YWX5/OAe40vLHvzb6Z739/7idRd2/1XeZL5Z7sq
  K4CmdkyZ3O624XrOB29lq6r/OW9PrlavOX448sVBR727Q9cV/CnfXvlUyZeVd/fpyuf4zRdc5
  HKzrDBZFrK9RYinOSDTUYi4qTgQA329d/V8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-528.messagelabs.com!1644316030!9734!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6374 invoked from network); 8 Feb 2022 10:27:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 10:27:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 49530100450
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 10:27:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3C3CB100446
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 10:27:10 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 10:26:50 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pip: upgrade 22.0.2 -> 22.0.3
Date: Tue, 8 Feb 2022 18:26:37 +0800
Message-ID: <1644316000-5853-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644316000-5853-1-git-send-email-wangmy@fujitsu.com>
References: <1644316000-5853-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 10:27:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161494

Changelog:
=========
Features
-------
Print the exception via rich.traceback, when running with --debug. (#10791)

Bug Fixes
---------
Only calculate topological installation order, for packages that are going to
be installed/upgraded.

This fixes an AssertionError that occured when determining installation order,
for a very specific combination of upgrading-already-installed-package + change
of dependencies + fetching some packages from a package index. This combination
was especially common in Read the Docs' builds. (#10851)

Use html.parser by default, instead of falling back to html5lib when
--use-deprecated=html5lib is not passed. (#10869)

Improved Documentation
----------------------
Clarify that using per-requirement overrides disables the usage of wheels. (#9674)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pip_22.0.2.bb => python3-pip_22.0.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_22.0.2.bb => python3-pip_22.0.3.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pip_22.0.2.bb b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pip_22.0.2.bb
rename to meta/recipes-devtools/python/python3-pip_22.0.3.bb
index e70a9556e3..889a6bf8ad 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "27b4b70c34ec35f77947f777070d8331adbb1e444842e98e7150c288dc0caea4"
+SRC_URI[sha256sum] = "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c5349d70aa581b333d0"
 
 do_install:append() {
     # Install as pip3 and leave pip2 as default
-- 
2.25.1


