Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4215C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:04:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.39895.1681117473066737593
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Mg4th6XG;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117471; i=@fujitsu.com;
	bh=Ey+LnxuJmxQJHNdkeNtH+FFXQCoiy42GrvvGYq8rCuE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Mg4th6XGuqQ0AashntIzwvDAbjIL0cWrThB5M6RjFHPuyiLAyfylqVO1HM6LbhVJT
	 mPT5VblQyW+zqj3v1NalIbkPXo+WYlxL5XoyoWG94pKKEg0mjOMhNFNlHogVoNtE0R
	 Wue4EM32JJokrWFeWmIIdzGhYHAVf8JcPzNkr8qOHWEdU6mWdkG44qB8SF7Zd3py9x
	 PZE4Yr1xDvzGTM9bpW6FINKk9TLb0ETD5B5y0Lhb4iNeD7sRWR9fmYNygxHosKS3Ee
	 ZFDlCmv48OOXWPADzqgAMdk8M79ht+i+2EuL1En16ah4KLPgMsjMzu4EzzTWzBLfme
	 6p9lXJA7LlA6g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8ORpCt30Tj
  FoP2rscWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvHyaRtLwTTOigsH3rE0MO7i6GLk4hASeMAo
  cfjzPxYI5zKTxLWJk1khnD2MEg8PbmHvYuTkYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vASoQFPCQeTOtiBLFZBFQlZp/cC2bzCjhJHFw+iQXElhBQkJjy8D0zRFxQ4uTMJywQcyQkDr
  54wQxRoygx+3IzVH2FROP0Q0wQtprE1XObmCcw8s9C0j4LSfsCRqZVjGbFqUVlqUW6lnpJRZn
  pGSW5iZk5eolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIHBmFKcfHYH49G+
  v3qHGCU5mJREebu4jFOE+JLyUyozEosz4otKc1KLDzHKcHAoSfAaXADKCRalpqdWpGXmACMDJ
  i3BwaMkwpt1HijNW1yQmFucmQ6ROsWoy3H1ypW9zEIsefl5qVLivBwgRQIgRRmleXAjYFF6iV
  FWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw77bDQFN4MvNK4Da9AjqCCegILhcDkCNKEhFSUg1
  MSkbzZS6pPcxPjvlaHsJ72z1yS4hEXQN/8oEvv4pXdQc1VvpWnTpz2qtmy+nHtjweS7TfHliZ
  wT353Ko797XWPtq6jmt5mY9goSy/iOKizYar8hIvpXayH/DfycRT9+cTW6vZyt4/njpqtmo1j
  ObKyacjzZh3mU2ujrWWUBUVOJtwOerDi/yNER+u6c1jXPjNrvpLoMrJ+EOrNpkJGmbs2Ww+39
  ZDtDV8dbmN2NILeSGqtoJXHpROkJ9s82ZReMIs5Zcf98yok3y06PS0c9GXcg4c4Pxb+YV1TjS
  3+bUpFQtPu93M27DY/etRe9tWRe3u0CaRkq4Lk3Uild2W7DGfcpG3Pb3twINDL/rzwj8rsRRn
  JBpqMRcVJwIA7sB1NE0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-745.messagelabs.com!1681117470!191046!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30232 invoked from network); 10 Apr 2023 09:04:30 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:04:30 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4B29A1CD
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:04:30 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3F9FA1C8
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:04:30 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:04:28 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] spirv-headers: upgrade 1.3.239.0 -> 1.3.243.0
Date: Mon, 10 Apr 2023 17:04:15 +0800
Message-ID: <1681117459-24898-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179863

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{spirv-headers_1.3.239.0.bb => spirv-headers_1.3.243.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.239.0.bb => spirv-headers_1.3.243.0.bb} (92%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.239.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb
similarity index 92%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.239.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb
index afd59cbcb1..4c39b0c351 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.239.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "d13b52222c39a7e9a401b44646f0ca3a640fbd47"
+SRCREV = "1feaf4414eb2b353764d01d88f8aa4bcc67b60db"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


