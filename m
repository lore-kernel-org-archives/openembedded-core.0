Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57D3C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 14:29:19 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.34124.1644848958836396724
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 06:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=drQG1cUv;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644848956; i=@fujitsu.com;
	bh=OIBlxYyCNjI0Yz8n+0RsuaxlsRxEo/NuDM/Zk3y8VGY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=drQG1cUvjFXhsFZCRj3LsvrhXxwmti485iP4iVS0Zlso22gPIge2S7JgeCsYXgUQC
	 6N8Rx/sqxlfD+3+PY+ZQbH1SfXK4pP3SXT5NaeMKjKOjpAPNv3st5RFwlWJdg4T0bb
	 ri95ey1hppaWUkhNp1Qt9f6YODcGTk3icmYesa8tIspemJOuZQovx4B9nMlFls0Z2c
	 Xcdez3LabvDIBDvqGQ8LUv3g5ZUa7BJhqBIjzrsAiqpVt/e6jX7TFQJaDg6R7PEYbU
	 BR8a6IdxMT+yickiGJUp2IwdLmlibCggeGjtW+/oZt7BqC8hGVZm1w1gJcgyO74S5U
	 Q9qINy0B+PgTA==
Received: from [100.115.7.136] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 18/EA-13236-C376A026;
 Mon, 14 Feb 2022 14:29:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqGuTzpV
  k0LZezuLOz3fsDowe5zauYAxgjGLNzEvKr0hgzdi48TNjwU+uih3/f7E2MH7h7GLk4hASeMwo
  cfPgMyYI5zyTxJzTe1khnBOMEnMbZgBlODnYBNQkpt+6AZTg4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLOAs0TvtHiOIzSKgKtH0di0biM0r4CjxrPkCmC0hoCAx5eF7ZpAxnAJOEqvfWoOEhYBK1h
  zbA1UuKHFy5hMWiPESEgdfvGCGaFWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyFpX8D
  ItIrRMqkoMz2jJDcxM0fX0MBA19DQVNdY19BCL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMIBTipmFdjCu7/upd4hRkoNJSZS3254rSYgvKT+lMiOxOCO+qDQntfgQowwHh
  5IE744UoJxgUWp6akVaZg4wmmDSEhw8SiK8qaFAad7igsTc4sx0iNQpRkUpcd73qUAJAZBERm
  keXBssgi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEub9DjKFJzOvBG76K6DFTECL03rYQBa
  XJCKkpBqYhGYH3vYrOe6pbMez+4v4waoTfKXPe28yXcl/2lgl4/Nr9ufk3bK78mdYRxg8SIrO
  7pbtLTjyVUhH5LbJP6Ylv49XihVZtIay6b2byaml3fR9r5KQ5+LczVPLDfde3/3H/u3KiJRaj
  5KFM9Scj9y5N3/LDf7PeUfzDnrx5z9n9Npm233ZxfDguYDUexv3tAdLP5OfnH7SIPW12PUzaf
  unHUpZPyNq1eGeYKevxzWuTAzTlwi9YH0y/P2Fu//PxRb7JdUXWW0si0/7v7z0hnig+rJz72+
  /+23Zr+SxOL0uds60Beun7I2e+nlrzekbO6Zlye1uncCiN3eVb9Rm/tS5TtwHUt39FXVPzLur
  4Wg6QYmlOCPRUIu5qDgRAMtKqsVbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-585.messagelabs.com!1644848956!15304!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21444 invoked from network); 14 Feb 2022 14:29:16 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Feb 2022 14:29:16 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E2699100195
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 14:29:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D5E13100189
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 14:29:15 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 14 Feb 2022 14:28:53 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pathlib2: upgrade 2.3.6 -> 2.3.7
Date: Mon, 14 Feb 2022 22:28:42 +0800
Message-ID: <1644848923-3406-2-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 14:29:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161711

Changelog:
=========
This version will be the last release to support Python 2.7.
Fix bug in samefile on Windows when file does not exist.
Add newline parameter for write_text (see issue #64).
Add many more type annotations.
Continuous integration migrated to github actions.
Project migrated to jazzband.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pathlib2_2.3.6.bb => python3-pathlib2_2.3.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pathlib2_2.3.6.bb => python3-pathlib2_2.3.7.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-pathlib2_2.3.6.bb b/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-pathlib2_2.3.6.bb
rename to meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb
index 1f1cf1ab28..673b5c7ef0 100644
--- a/meta/recipes-devtools/python/python3-pathlib2_2.3.6.bb
+++ b/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mcmtroffaes/pathlib2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2dc08586cce3ab91bfa091b655c0e440"
 
-SRC_URI[sha256sum] = "7d8bcb5555003cdf4a8d2872c538faa3a0f5d20630cb360e518ca3b981795e5f"
+SRC_URI[sha256sum] = "7a4329d67beff9a712e1d3ae147e4e3e108b0bfd284ffdea03a635126c76b3c0"
 
 inherit pypi setuptools3
 
-- 
2.25.1


