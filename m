Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57742C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 08:26:00 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.8815.1644308757988117699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 00:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=G7ITn81n;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644308756; i=@fujitsu.com;
	bh=kXxYe2znY41x+62SOrGTYFNqbcqj+accbibi0wcxsPI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=G7ITn81nTYeRHG+EGLzG5JjDCeXSA3KDPX3U04ZARDsA7sFRM6f8TrNHjN+sC7kml
	 1uJxfWmi/tBtqdsiILWnOdULyND7dP/D6nTk3d4yy8fXx3GBuml7BgPWofe7zKW9p7
	 KQshFUiOiSzPQdV8Ghti5Mr/MrNYxVSrKw4d6BAA+Yz2n7sZUPjGC2O9rFCWDDjFAW
	 YJhUoCws1vMKGk3QzxJKPHiueAA1bRu65Bqu/S5qHUExype0OZmxfs9DW/6RRBI38S
	 rtH5kbwyoZAK8vSy3wLBFcJlJBsbHvC04Xl+NkMm+LfLyoyZgMQ+qkjPAcPG4OKxcC
	 JolvECNF8pzGA==
Received: from [100.115.34.36] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id 0F/93-29321-31922026;
 Tue, 08 Feb 2022 08:25:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqCusyZR
  ksOOpisWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjFlwUymgk+cFSdnzGBvYGzm7GLk5BASeMwo
  8eWMcxcjF5B9nkmivX0pM4RznFHiwvI9jCBVbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHid
  w87SFhYwFri3PwSkDALUPjuw7MsIDavgKPEoTtLWEFsCQEFiSkP3zOD2JwCThKH/l1lgbjBUa
  LrEsQmXgFBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n
  7AkamVYzWSUWZ6RkluYmZObqGBga6hoamusbmuoZmRnqJVbqJeqmluuWpxSW6QG55sV5qcbFe
  cWVuck6KXl5qySZGYAinFKsu2sG4f9VPvUOMkhxMSqK8SapMSUJ8SfkplRmJxRnxRaU5qcWHG
  GU4OJQkeM+IA+UEi1LTUyvSMnOA8QSTluDgURLhPa4OlOYtLkjMLc5Mh0idYlSUEudNBkkIgC
  QySvPg2mAxfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO9NkCk8mXklcNNfAS1mAlr8ddG
  /RKDFJYkIKakGJq36udc9IqWrdm2bfDrHdm+Vr1DMVacFjZWZ2gXFNeKPXi7c1nHArfacH5fc
  QVdhpfXq0xYfVGuX+C70//rfpbEepxRl/+5cP1Wcf9WVa9xx6wP/uTaY1l7qFCjPPPp2Si9vg
  fHjYpY58yO/T812XzC7sPJZTlPQfMa7hRscF6V+uC64xodT/iTjvPcXHh56ceBat7VYt1dbyL
  w0Fv/VmmF2U/r4p5dyr+S8p7xz49wnFn4KnvsNnn7usA/MXXl6zYRUmVBnOZZKyz8+D+zX9M/
  6tu6a6qLGso1L0tv85RPnNv+Vf5HV8PN0xnN/Axf94NMGJp7ZN3fqddzJmDxldbbdj+ksD9zz
  xNPnNv58qcRSnJFoqMVcVJwIAMuqKk1cAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-548.messagelabs.com!1644308755!1557!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19462 invoked from network); 8 Feb 2022 08:25:55 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 08:25:55 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2BBCE10018E
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:25:55 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 121C710019C
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:25:55 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 08:25:51 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] harfbuzz: upgrade 3.3.1 -> 3.3.2
Date: Tue, 8 Feb 2022 16:25:25 +0800
Message-ID: <1644308725-5262-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644308725-5262-1-git-send-email-wangmy@fujitsu.com>
References: <1644308725-5262-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 08:26:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161479

Changelog:
=========
Revert splitting of pair positioning values introduced in 3.3.0 as it proved problematic

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_3.3.1.bb => harfbuzz_3.3.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_3.3.1.bb => harfbuzz_3.3.2.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_3.3.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_3.3.2.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_3.3.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_3.3.2.bb
index 656b556d29..9eaa14c56f 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_3.3.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_3.3.2.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8c083384838f39f4a4856a6584def595b10cc071754a08d5e999293462b34296"
+SRC_URI[sha256sum] = "1c13bca136c4f66658059853e2c1253f34c88f4b5c5aba6050aba7b5e0ce2503"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.25.1


