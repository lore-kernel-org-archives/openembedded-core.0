Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB433C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 14:29:20 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web12.34515.1644848958891023729
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 06:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oqChyk25;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644848956; i=@fujitsu.com;
	bh=Mhm+JEgXP5VAItp4vWFn1rWdsW31MTFQ6aO+IXf9IVs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oqChyk25etVd7DH8SBkF9+RGXSMMJ9uoYfav7BO+0pNWt38LpieUDDMTTfGSrMNWB
	 GmAyewTdnaEZbKXOiy/oZh5Fgy7/c7au7XoHp4KzkiLUXslPWDPlhB/712VGskEwx2
	 QwprEfV7e862ojxPO6Y0apZCY6frsm2zYOKFPas/P4jiw0lnN2b5w2V8b3xVs0e9jy
	 wBFs8SeyLiLInqETY/loOWv1ebj+usSQZoPYbEHdJMWqHWZ4ukxk3HH7B9Adgu99J5
	 ZMTvmUv6NkDWfcLbP+Wiy9331itK/cQKwW6aIdk0NgYcz6LMNMTjg01LluuOAsXHj1
	 RDgWWdObF5Ijg==
Received: from [100.115.7.136] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id D7/53-12986-C376A026;
 Mon, 14 Feb 2022 14:29:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqGuTzpV
  kcG2/tMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrH4/gKmgkbOip23lrM0MC7n6GLk4hASeMwo
  sfjAcTYI5zyTxKllJ5kgnBOMEodX7mHsYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhATuJzua/YDaLgKrE+rv3mUDKeQUcJebMBiuXEFCQmPLwPTNImFPASWL1W2uQsBBQxZ
  pje9hAbF4BQYmTM5+wQEyXkDj44gUzRKuixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgt
  J+wJGplWMVklFmekZJbmJmTm6hgYGuoaGprpmukaGBnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXF
  esWVuck5KXp5qSWbGIEBnFLMdmkH49y+n3qHGCU5mJREebvtuZKE+JLyUyozEosz4otKc1KLD
  zHKcHAoSfDuSAHKCRalpqdWpGXmAKMJJi3BwaMkwpsaCpTmLS5IzC3OTIdInWJUlBLnfZ8KlB
  AASWSU5sG1wSL4EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3u8gU3gy80rgpr8CWswEtDi
  thw1kcUkiQkqqgSn6gB5TyMlzM9SWrYy6ZrP+ntk5m/5/K7pEpyTeke/VlPC/sPdd1vn3uTa2
  UpvzWGMXbWOd2J3UWzHvPNMb/8rP4e8rt8n3OyVMXXQm90qouPOa5Z2beSbtfph2b2fBjGk9b
  /vKr55s2xY5dabu8dKd23okSiX3LJjeKfNey71ga6hES1Df5l23O+90r17CzKxfy5c36aDf9u
  /FnMy7n/xxZjysvOFFQcEzufkG5zOfvD18YM+dDwdSXlbNrFBZ9u8CW9ikaL/lDOIsTN0RUkG
  1sjnXHr9PzJvmfXDupaykc7P+OclsP7LypFrK4Tt12cU8PJ9NLu0xzrV4F7U7adOEI2cOLvu9
  /Rb3EYPiTId5SizFGYmGWsxFxYkAvIilWVsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-585.messagelabs.com!1644848956!1154!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20252 invoked from network); 14 Feb 2022 14:29:16 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-19.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Feb 2022 14:29:16 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E3206100196
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 14:29:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D7068100190
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 14:29:15 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 14 Feb 2022 14:28:56 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pbr: upgrade 5.8.0 -> 5.8.1
Date: Mon, 14 Feb 2022 22:28:43 +0800
Message-ID: <1644848923-3406-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644848923-3406-1-git-send-email-wangmy@fujitsu.com>
References: <1644848923-3406-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 14:29:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161712

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python3-pbr_5.8.0.bb | 4 ----
 meta/recipes-devtools/python/python3-pbr_5.8.1.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.8.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.8.1.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.8.0.bb b/meta/recipes-devtools/python/python3-pbr_5.8.0.bb
deleted file mode 100644
index b74fc16754..0000000000
--- a/meta/recipes-devtools/python/python3-pbr_5.8.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-
-SRC_URI[sha256sum] = "672d8ebee84921862110f23fcec2acea191ef58543d34dfe9ef3d9f13c31cddf"
diff --git a/meta/recipes-devtools/python/python3-pbr_5.8.1.bb b/meta/recipes-devtools/python/python3-pbr_5.8.1.bb
new file mode 100644
index 0000000000..c8664018fa
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.8.1.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-pbr.inc
+
+SRC_URI[sha256sum] = "66bc5a34912f408bb3925bf21231cb6f59206267b7f63f3503ef865c1a292e25"
-- 
2.25.1


