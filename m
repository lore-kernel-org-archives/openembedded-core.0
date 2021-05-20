Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web12.2596.1621474733241053134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 18:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=I2jYxkcI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621474731; i=@fujitsu.com;
	bh=qUCMaiT6GApjy4i9G6/K/rFcPLDmsYm/kvFAlxbjDh0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=I2jYxkcImWHSQniEMXGYQqTzp3hslw3jpR8CU+57MxNL/44Y+4tHP4FHDnhNlzdmM
	 SXAkWde2f+QHQ9hAA+4S10YdosLqm5FJn/UEm9R/PwwcE+7E6rKCV6/SdlkhU8fUsh
	 aT5lZ/NfUwg238JZ+ucZK66wXB4u470dei4aBF4Z5U18yVAbjYfj6xYGCybvE/ij/z
	 ShgYGEasjUuQNNlpXnV8YbtqWYfOHHdKtLA/otqV3BYP3EizaUHdxtJmmi4BEtx1Yt
	 jesbr7c4B0qTYhWlA/toI4hwMD1T6Q9kfmpoDN+qkaau/nl0jOaR4asCw/JJUnh4as
	 yykS82l7yOAXA==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 93/EB-19780-AADB5A06; Thu, 20 May 2021 01:38:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI1V21d2m
  CwY4v/BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a3T84F+0Qrdt34ydTAuEa4i5GLQ0hgFpPE
  njmNjBDOHkaJy68PsXYxcnKwCehKnHu8lr2LkYNDREBP4uo/UZCwsICtRPfW82wgYRYBVYkjs
  11BwrwCnhJvfk9kAbElBBQkpjx8zwwRF5Q4OfMJWJxZQELi4IsXzCCtEgKKErOny0OUV0jMmL
  GNbQIjzywkHbOQdCxgZFrFaJlUlJmeUZKbmJmja2hgoGtoaKxrrGtoaaKXWKWbqJdaqpucmld
  SlAiU1UssL9YrrsxNzknRy0st2cQIDKGUQuZDOxifvP6gd4hRkoNJSZTX7P6iBCG+pPyUyozE
  4oz4otKc1OJDjDIcHEoSvOK7lyYICRalpqdWpGXmAMMZJi3BwaMkwvt/G1Cat7ggMbc4Mx0id
  YpRUUqcl2sPUEIAJJFRmgfXBouhS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeetBtvNk5p
  XATX8FtJgJZHHjIpDFJYkIKakGpp1c6a8XXdErZD5Xxi3YXLIhoGpidHAMP48Wa8SFiA9Rvev
  v/shJKn7s8OpY849+jZisT7PX7up5fMi21ZD9uGWSqqCFnat01R2uz4LRj9UjV6/qfSJ4t7FS
  X6Eh+XBB1Wln1+fPrKKcmL7Y6F/Nb76xcLNxYvUeO5vj1ze8Lrc9rzDn8OMDPbuqH/nOCHm0L
  rp9z9M/e31PnH1w62Qq+4n7OXP4zm5p6Lqgfm8XJ3OgvMC5JzlLzy+bqX8jdDPPCqWnNYb9F1
  ZkzKxtCbc57Rz/PWDC3mdhMpp/v7h4aog7Wh6W5Et7c/3rd4Ovhy++SM7x7FjyfpqpXIm0hR/
  n3LIlT4sTH+i+fy3+UaVbVomlOCPRUIu5qDgRAMh4eakcAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-226.messagelabs.com!1621474729!11585!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27945 invoked from network); 20 May 2021 01:38:50 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-13.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 May 2021 01:38:50 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14K1cn5E015058
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 02:38:49 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 02:38:48 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] rxvt-unicode: upgrade 9.22 -> 9.26
Date: Thu, 20 May 2021 09:38:45 +0800
Message-ID: <1621474725-127656-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0001-libev-remove-deprecated-throw-specification.patch
removed since it is included in 9.26

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...emove-deprecated-throw-specification.patch | 30 -------------------
 ...t-unicode_9.22.bb => rxvt-unicode_9.26.bb} |  4 +--
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-libev-remove-deprecated-throw-specification.patch
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.22.bb => rxvt-unicode_9.26.bb} (57%)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-libev-remove-deprecated-throw-specification.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-libev-remove-deprecated-throw-specification.patch
deleted file mode 100644
index f10dca09d6..0000000000
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-libev-remove-deprecated-throw-specification.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 9a8f1d73e7b7e183768a8379ef32429a84f0e5c2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 26 Feb 2021 18:11:56 -0800
-Subject: [PATCH] libev: remove deprecated throw specification
-
-removes the throw specifications that are deprecated since C++11:
-warning: dynamic exception specifications are deprecated in C++11 [-Wdeprecated]
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libev/ev++.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libev/ev++.h b/libev/ev++.h
-index 4f0a36a..85ddf44 100644
---- a/libev/ev++.h
-+++ b/libev/ev++.h
-@@ -376,7 +376,7 @@ namespace ev {
- 
-   struct default_loop : loop_ref
-   {
--    default_loop (unsigned int flags = AUTO) throw (bad_loop)
-+    default_loop (unsigned int flags = AUTO)
- #if EV_MULTIPLICITY
-     : loop_ref (ev_default_loop (flags))
- #endif
--- 
-2.30.1
-
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.26.bb
similarity index 57%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.26.bb
index 283e8d7751..3fe69a543f 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.26.bb
@@ -4,7 +4,5 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/main.C;beginline=1;endline=31;md5=d3600d7ee1062667fcd1193fbe6485f6"
 
-SRC_URI += "file://0001-libev-remove-deprecated-throw-specification.patch"
-
-SRC_URI[sha256sum] = "e94628e9bcfa0adb1115d83649f898d6edb4baced44f5d5b769c2eeb8b95addd"
+SRC_URI[sha256sum] = "643116b9a25d29ad29f4890131796d42e6d2d21312282a613ef66c80c5b8c98b"
 
-- 
2.25.1

