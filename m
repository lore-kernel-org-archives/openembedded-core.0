Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18212C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:21:52 +0000 (UTC)
Received: from mail1.bemta32.sdw.messagelabs.com
 (mail1.bemta32.sdw.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.52987.1638804111259176266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:21:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UIcGy5WP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638804109; i=@fujitsu.com;
	bh=4AfFUq0xTe5sG9BsRqZjYx6eQHhFIO7D9Zmdd+kGN5o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UIcGy5WPcZEeWu9O+eNnVzgTAobWL0DtA6T5qO53FsDYvOfGorFBil7YAlEY3YTY7
	 Ja1uK8telAP/OwJYIaIzbk7w1nOFxXDFKtqIaL/jvCCVFyhGaf5GKiFKzWX6j0DsHL
	 bLtkjFa9yZPhBaAJ+K/xAOFXVLNqDqgc+OrBsHHrCfdgIxlvTE5hVyKwmrA2gI8Zr4
	 MTF0wuYuCbjdzCljUmbcR0k9wrImhsC8nfyjuLL0sMH+HRUDkNNHtsN5FDPVp9F/qX
	 9/Grao0NCtjdpEz1ffOKkcEGoL07dU227fvEmZY1CXlfHkUa7H2QVALfwI00hjyzBP
	 ppJw0Bl/+HnrQ==
Received: from [100.115.2.64] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id FF/38-28795-D8A2EA16;
 Mon, 06 Dec 2021 15:21:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8ORqNurtS7
  R4OB/Nos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePJzSamgn/sFasPTGFrYJzO3sXIxSEk8JhR
  4sSzrWwQznkmiS9rrwJlOIGc44wSx7dKgdhsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3D
  1i5sIC1xNJtn5lAbBag+IxHm5lBbF4BR4lNm26B2RICChJTHr6HigtKnJz5hAVijoTEwRcvoG
  oUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1itEwqykzPKMlNzMzRNTQw0DU
  0NNU11rUw00us0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAzIlGLmsB2Mf3p/
  6h1ilORgUhLl9RBblyjEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgrdRAygnWJSanlqRlpkDjA6Yt
  AQHj5II70FNoDRvcUFibnFmOkTqFKOilDhvM0hCACSRUZoH1waLyEuMslLCvIwMDAxCPAWpRb
  mZJajyrxjFORiVhHlng0zhycwrgZv+CmgxE9DimP7VIItLEhFSUg1MvD6nXM/P+xfmuWGe/60
  P2gW94m2rt0baGLudW//WwSSdn12B/9xEg0mKshFtU1+6ZfKsecPx3PNUtXzbacskxQ8ci+q3
  rp0WdvjPxrKOP2XXviYqsLDNcnVnW+L+sm7ly61rFvslTL7T/UDX5UYrwxrBGH8LM5m9FRZuH
  fr2/E/eTdjiX2nVI8i1giGh/mbUoqakI88Us2yNItQsnjysUZijnXHwBeuETZFVqfP5UouUmb
  gfbf/KEH6ho0HYYdp6ga2BkrKuBxgWK7V9vrRiy6mSS5LXAlMavtTO+JsQY3jgwIqnqmc62c5
  uvFaWo7B0QUH6nlvudUu+rir4dL+85eRP1evP9fYk+Huy92grsRRnJBpqMRcVJwIAYmCRwkMD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-591.messagelabs.com!1638804108!6220!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7794 invoked from network); 6 Dec 2021 15:21:49 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Dec 2021 15:21:49 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A79801009E7
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 15:21:48 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9CB2C10023C
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 15:21:48 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 6 Dec 2021 15:21:26 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] pango: upgrade 1.48.10 -> 1.50.0
Date: Mon, 6 Dec 2021 23:21:15 +0800
Message-ID: <1638804078-8183-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:21:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159238

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pango/{pango_1.48.10.bb => pango_1.50.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.48.10.bb => pango_1.50.0.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.48.10.bb b/meta/recipes-graphics/pango/pango_1.50.0.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.48.10.bb
rename to meta/recipes-graphics/pango/pango_1.50.0.bb
index 40df7042e6..db17158d20 100644
--- a/meta/recipes-graphics/pango/pango_1.48.10.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.0.bb
@@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[archive.sha256sum] = "21e1f5798bcdfda75eabc4280514b0896ab56f656d4e7e66030b9a2535ecdc98"
+SRC_URI[archive.sha256sum] = "dba8b62ddf86e10f73f93c3d2256b73238b2bcaf87037ca229b40bdc040eb3f3"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.25.1


