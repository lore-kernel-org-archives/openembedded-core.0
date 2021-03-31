Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web12.7410.1617200567945091685
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 07:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FlcXuREJ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617200566; i=@fujitsu.com;
	bh=1IwqC/YON/SPCjtwegIAVwJXBWaGSpVDoVb/ocPuXi0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FlcXuREJZ3mEhswsQtgr8S4xFRPO1UzO2D3BrlTFjRwnAT7heg5CoPusoqxc9zaRO
	 Yo4w2C4bJ4mDyp8+QZ1ayD7kTNIH5pP5UDzDNHJUG/2+OAfUVn5G7WBdkQopjah9DR
	 TnNhmUdzzJWhpSBGf042OFSk8YoHAXLS5J/ElEDxAuZS+HclJp2Ixm1vhAsdw+91u3
	 B4n1K7aQlKvBkhS9gmF9FgdjTORqpa6OutMCUzcKrFRbO+7mydFR6es3Cl10/K7udN
	 JJER1njUzWGWr/tuEdprSZg9GH1Qfci4rCuuoemoANAm0vl/4/QaohefB41relDK4k
	 mWaTmgqoCKvHA==
Received: from [100.113.1.157] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 9F/A1-03420-5B584606; Wed, 31 Mar 2021 14:22:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRoru1NSX
  BYM9PdYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeN8Y1rBRq6KUzP3szQwbuPsYuTiEBLYyiSx
  vvseE4RzglFi59sVrF2MnBxsAmoS02/dALI5OEQE9CSu/hMFCTMLqEi8+N3DDmILC5hLPGxvY
  gSxWQRUJb692M0CYvMKOEnMOfQRLC4hoCAx5eF7ZhCbU8BZ4virBWwgthBQzfQFO9kg6gUlTs
  58wgIxX0Li4IsXzBC9ihKzLzezQNhVEp0fjrNNYOSfhaRlFpKWBYxMqxgtk4oy0zNKchMzc3Q
  NDQx0DQ2NdY11Dc0M9RKrdBP1Ukt1k1PzSooSgbJ6ieXFesWVuck5KXp5qSWbGIHhmFLIvHAH
  44/XH/QOMUpyMCmJ8j6yT0kQ4kvKT6nMSCzOiC8qzUktPsQow8GhJMG7oAUoJ1iUmp5akZaZA
  4wNmLQEB4+SCK8HMD6EeIsLEnOLM9MhUqcYFaXEedVAEgIgiYzSPLg2WDxeYpSVEuZlZGBgEO
  IpSC3KzSxBlX/FKM7BqCTMuxFkO09mXgnc9FdAi5mAFl95lAiyuCQRISXVwBT/fYKVSN8PD9s
  lHL9rmAN/NrZud5jtFtly23iSXntF8FGhY3fMBKYb5DbMeLFgzcpui46jXv3CljkGbHt3hyu8
  c5XgrY4/vm7+R54fhyL/7pLI+dXzdAZflIbG/oXZeT+3Ot1lWOven+HX73+cp2TrnuLsisjjm
  zbb/K5qU+t5vnXZGzdVQ2aNo2tTaz3k5x5dmjpprdIr1qZXwct5pxckWNfdunywcIXm4X37GK
  MO7/eU/3LA3nSBeWbuQZeEC9EKfEfU046a/Ek7NCdr4QL9VYYiDzb/dJv14blp6aMWK6n9f+/
  N6Put+UK0TFRR29dVImTLgpOTzrDp8d+pOL/po4xu+Cb9BZuunOGsKFBiKc5INNRiLipOBABv
  YGxTQgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-226.messagelabs.com!1617200565!1200!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16161 invoked from network); 31 Mar 2021 14:22:45 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Mar 2021 14:22:45 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12VEMdB5031942
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 15:22:44 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 31 Mar 2021 15:22:41 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ccache: upgrade 4.2 -> 4.2.1
Date: Wed, 31 Mar 2021 22:22:25 +0800
Message-ID: <1617200547-62088-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617200547-62088-1-git-send-email-wangmy@fujitsu.com>
References: <1617200547-62088-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

License-Update: add license information of src/third_party/win32/winerror_to_errno.h

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ccache/{ccache_4.2.bb => ccache_4.2.1.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.2.bb => ccache_4.2.1.bb} (78%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.2.bb b/meta/recipes-devtools/ccache/ccache_4.2.1.bb
similarity index 78%
rename from meta/recipes-devtools/ccache/ccache_4.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.2.1.bb
index 9957bc7e65..90b9c6181f 100644
--- a/meta/recipes-devtools/ccache/ccache_4.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.2.1.bb
@@ -7,12 +7,12 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=28afb89f649f309e7ac1aab554564637"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=698a26b57e513d678e1e7727bf56395b"
 
 DEPENDS = "zstd"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "dbf139ff32031b54cb47f2d7983269f328df14b5a427882f89f7721e5c411b7e"
+SRC_URI[sha256sum] = "320d2b17d2f76393e5d4bb28c8dee5ca783248e9cd23dff0654694d60f8a4b62"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
-- 
2.25.1

