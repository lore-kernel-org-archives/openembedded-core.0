Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F00D0C834
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:31 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56086.1768299926785611643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G/6vg42S;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299927; x=1799835927;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KpoRblH3U7+j6PQ/zu2ANnm7N22pRL04V+kidooyPoE=;
  b=G/6vg42SMc01aQ8HVmamqRtrim7w+zsUkwnRduj/yCTjRrqSpQpRxH5c
   v6kTQjVS9vFeXO/axUjup8VK3BEGTp1yAas+1q3Ix+aCAGbEH5oeYKwOS
   lrddAFboS9mBeN2jZEAQNorDleOJPifVRafKkaI8FGSZMBjhBBwXVsdzl
   N2sEL/M3MlfQhBg5fpILyxo4igFMHjmA+Zkv+RKaaP9WGFsD/1dFUxnL7
   FUomc5hHOPe90RUjiHxkR0YZde87pUdjc/JyL7l05ux+1s4RzLNKLtrNl
   UfXiouW5alSxApQFwXJS9c/fTa1uSGnEgS9Vj0P/t8yF3vWvJ4N/TsCtR
   w==;
X-CSE-ConnectionGUID: 0PDjVn+eQM2ucI+V3YiisQ==
X-CSE-MsgGUID: AQqRJ/MHTdW/jDnm8j/lKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="229630023"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="229630023"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:25 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 2939F1C1C721
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:25 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D20621801FF2
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 0D021826FF9;
	Tue, 13 Jan 2026 10:25:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/18] curl: upgrade 8.17.0 -> 8.18.0
Date: Tue, 13 Jan 2026 18:24:54 +0800
Message-ID: <20260113102509.728-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102509.728-1-wangmy@fujitsu.com>
References: <20260113102509.728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229243

From: Wang Mingyu <wangmy@fujitsu.com>

no-test-timeout.patch
refreshed for 8.18.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/curl/curl/no-test-timeout.patch      | 8 ++++----
 .../curl/{curl_8.17.0.bb => curl_8.18.0.bb}               | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/curl/{curl_8.17.0.bb => curl_8.18.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index 34e46fed6d..ac3a788d26 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -1,4 +1,4 @@
-From 42cddb52e821cfc2f09f1974742714e5f2f1856e Mon Sep 17 00:00:00 2001
+From 9b7b6dbf1d08eddda8e89b6a6ed09f0c1c87d474 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 15 Mar 2024 14:37:37 +0000
 Subject: [PATCH] Set the max-time timeout to 600 so the timeout is 10 minutes
@@ -11,12 +11,12 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/servers.pm b/tests/servers.pm
-index d4472d5..9999938 100644
+index 5d5d98b..442cfaf 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
-@@ -125,7 +125,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
+@@ -124,7 +124,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
  my $sshderror;   # for socks server, ssh daemon version error
- my %doesntrun;    # servers that don't work, identified by pidfile
+ my %doesntrun;    # servers that do not work, identified by pidfile
  my %PORT = (nolisten => 47); # port we use for a local non-listening service
 -my $server_response_maxtime=13;
 +my $server_response_maxtime=600;
diff --git a/meta/recipes-support/curl/curl_8.17.0.bb b/meta/recipes-support/curl/curl_8.18.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.17.0.bb
rename to meta/recipes-support/curl/curl_8.18.0.bb
index 315364902e..b94da348b7 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.18.0.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-curl.sh \
 "
 
-SRC_URI[sha256sum] = "955f6e729ad6b3566260e8fef68620e76ba3c31acf0a18524416a185acf77992"
+SRC_URI[sha256sum] = "40df79166e74aa20149365e11ee4c798a46ad57c34e4f68fd13100e2c9a91946"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.43.0


