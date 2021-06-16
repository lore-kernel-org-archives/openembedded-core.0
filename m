Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.895.1623887675578769291
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 16:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hacnGLs/;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623887673; i=@fujitsu.com;
	bh=4hLc2kv+hsXHPK3LULu/wO4fdoc0SqU9mgyTNcDN3Ps=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hacnGLs/NdnmdLnLBJB631gH1zwPpVfMKBKoSyw6hXfGP83y1vNvQ9qrJtGV6dW19
	 8M6D62qsS22Erb3lp6OZhbEUPpzh2gNZ/RjPpM5MUXzTYCyvmMYW1y9zKNEcLrJG4S
	 0WEUUCFWRR1qPk7OnyAtPvQSuYNEsh8Hy08gKwlnBdOap+nebeir8WGCAji5PVITt1
	 1F4wpOpcazBwKaJvf9V4ME6qu9pjodNxy6L4tlpqHMekbYEOtIB1/F5k6oLvz2tX2m
	 ed7QWSGWQnQMvAIDVJvfNpEudTS7ZKa3EN1wanXY/FIkxsIHEIVW+EY+AV/j3aKaXn
	 LnE5UXcTwtpSw==
Received: from [100.112.198.210] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 20/17-36719-83F8AC06; Wed, 16 Jun 2021 23:54:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxVde8/1S
  CweUX1hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8be++uYCmZzVqxZOJO5gXEfRxcjF4eQwCwm
  iXs7ZjNBOCcYJRqWbAZyODnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvHnaQsLCAk8T1N
  /YgYRYBVYmz098xgti8QOGPi7aygNgSAgoSUx6+ZwaxOQWcJfbt+M0GYgsB1Uz++Z4dol5Q4u
  TMJywQ4yUkDr54wQzRqygx+3Iz1JwKideHLzFPYOSfhaRlFpKWBYxMqxgtkooy0zNKchMzc3Q
  NDQx0DQ2NdA0tLXQNjQ30Eqt0k/RSS3XLU4tLdA31EsuL9Yorc5NzUvTyUks2MQKDMaXgWNMO
  xpOvP+gdYpTkYFIS5W3uPJUgxJeUn1KZkVicEV9UmpNafIhRhoNDSYI3rRcoJ1iUmp5akZaZA
  4wMmLQEB4+SCG9HH1Cat7ggMbc4Mx0idYpRUUqc92sPUEIAJJFRmgfXBovGS4yyUsK8jAwMDE
  I8BalFuZklqPKvGMU5GJWEea+DbOfJzCuBm/4KaDET0OI2IbDFJYkIKakGpi1hsavZAwO9uud
  3J6TcWLh34/4e/8V/+psq3SMMkzhEvOcpVcd6MjL/3rHkZMGH8DCu65fvhLzfzxd97NG2HycY
  5UU/yy+Mto7xiJa4P1Nt0p9zq7lWlhZpMZmttV9q+6Jqgf3F++yLGMI1mF8yS6xmmDZtRd22V
  74VP++2cLL/3tD4JXzS/zM2Igm/I05utBE0fXEjofy4UGvtyvur9kYzXvyuvPmHzMSD7pNPnO
  Od8vned4vwk3Fnrs14kRb5/MCr+kTd7na9x68i2K257VNK5LoeFfz0Lt+ved87rsN5OscrIyv
  b1l7+n+5P9N+XCqgmSolM3M/62VnOlunE7olPD3z3sZ/Q3xDc+XmijBJLcUaioRZzUXEiAIXf
  TKBBAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-285.messagelabs.com!1623887671!225897!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12727 invoked from network); 16 Jun 2021 23:54:31 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-9.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Jun 2021 23:54:31 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15GNsRi6022915
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 00:54:31 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 17 Jun 2021 00:54:26 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] alsa-ucm-conf: upgrade 1.2.5 -> 1.2.5.1
Date: Thu, 17 Jun 2021 07:53:59 +0800
Message-ID: <1623887640-63499-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623887640-63499-1-git-send-email-wangmy@fujitsu.com>
References: <1623887640-63499-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../alsa/{alsa-ucm-conf_1.2.5.bb => alsa-ucm-conf_1.2.5.1.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.5.bb => alsa-ucm-conf_1.2.5.1.bb} (85%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.1.bb
similarity index 85%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.1.bb
index 5de7185895..4d5f3742f0 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.1.bb
@@ -8,9 +8,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "093ae3d85a5e6fd2cd1cc27feda400d7191382fb8b5e5e23497286c87c1507a5"
+SRC_URI[sha256sum] = "5841a444166dcbf479db751303dbc3556f685085ac7e00f0c9e7755676195d97"
 # Something went wrong at upstream tarballing
-S = "${WORKDIR}/${BPN}-1.2.4.81.g4884e"
 
 inherit allarch
 
-- 
2.25.1

