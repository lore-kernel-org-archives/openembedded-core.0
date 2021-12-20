Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78BD0C4332F
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:03:57 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.6288.1640012636310627610
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:03:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gUiUyNBB;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640012633; i=@fujitsu.com;
	bh=8cIUjo9mvmfFk6Ss1IYMtpDakv56d5DcFxRxsmxHY1g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=gUiUyNBBY0B1Qb0RjbPr5ZAByicftU2k3L74JteHvDjD9YUZ9N5AEj2Uq7QwRRVcF
	 bHM/3kL7Ux2z1LFjbZSdZIh0ip+DEUz1veqDwU/AwfG3PhfIkZ4238nbFQoGgPM6+5
	 BsMZmpxKRFMLifrX5VlxfExNja3FtkwFwmrx/gzH0Y3Ke62SHjmfCT0h7NpNmFA/6b
	 lzzS61U9vDYTx0vHZihlGK+3ch2nmGTm9YtwH9dbq8hVtvG8UvL8Tt91FCz5efSwCd
	 iUPvUWCUDgjTOG4OXgIKTcjssDQkYNVSZlZg0SJ/3l6X2Xb6ksZrvt3g1y9eH44zd1
	 eTAzllu8eGqAg==
Received: from [100.115.6.23] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id 7C/7A-30341-95B90C16;
 Mon, 20 Dec 2021 15:03:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxSTdy9oF
  Eg1ftMhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8barROYCubLVkyfPpepgbFHqouRi0NI4DGj
  xNyGVhYI5zyTxJdNj1ghnBOMEv0LXjJ2MXJysAmoSUy/dQMowcEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jATmLNpO9MIDaLgKrEmz//weK8Ao4S8yZ+ZgWxJQQUJKY8fM8MEReUODnzCQvEHAmJgy
  9eMEPUKErMvtzMAmFXSMya1cYEYatJXD23iXkCI/8sJO2zkLQvYGRaxWiVVJSZnlGSm5iZo2t
  oYKBraGiqCyRNTfQSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5NzUvTyUks2MQKDMqWYYdYO
  xll9P/UOMUpyMCmJ8vL7HkgU4kvKT6nMSCzOiC8qzUktPsQow8GhJMH7cwZQTrAoNT21Ii0zB
  xghMGkJDh4lEd4mkDRvcUFibnFmOkTqFKMux+uWnzuYhVjy8vNSpcR542YBFQmAFGWU5sGNgE
  XrJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvOkgU3gy80rgNr0COoIJ6Ail8P0gR5QkIqS
  kGpjS877xq9/Y+HHKFU+epLiJR59/2jm3z/D4UYHqhWL25zclcoUE9r+bGFO6X3Y/V5Dnfp9Z
  B8w3BvftFb06L6vihFCqwfnVd0Q+yU+RXWdgxvU/x73x3w19yzta5utNZ95L+XiyKv06/z253
  DfJJdeErodGiR9SXyyzsnddq0n/vTILkY4NNWbKQj0hpwSXflp36vzJm3PfHtYLcPas/7sp7W
  qgRv8sAYF81xgbtdiP6Z33O22uP7uWu0nn4dKa/veHrCzNZ2js4lIUPX7o14Wrl2wsvLcfU4v
  38tJgi4+q4KrckNGSEyIWVztnotR6pj97FE5ULNRcXSgf33yT/3dFMfsRu3dMX9lXPrU3r1di
  Kc5INNRiLipOBAABGzjrUQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-587.messagelabs.com!1640012633!30007!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2860 invoked from network); 20 Dec 2021 15:03:53 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Dec 2021 15:03:53 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id F30C910045E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:03:52 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id DF5DB10034F
	for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:03:52 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 20 Dec 2021 15:03:46 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxcrypt: upgrade 4.4.26 -> 4.4.27
Date: Mon, 20 Dec 2021 23:03:36 +0800
Message-ID: <1640012619-3685-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:03:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159871

License-Update: directory of copyright file changed.
refresh fix_cflags_handling.patch

Changelog:
===========
Limit the maximum amount of rbytes to 64 bytes (512 bits) for yescrypt,
gost-yescrypt, and scrypt. Also reflect this limit in the documentation
(issue #145).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxcrypt/files/fix_cflags_handling.patch          | 10 +++++-----
 ...ypt-compat_4.4.26.bb => libxcrypt-compat_4.4.27.bb} |  0
 meta/recipes-core/libxcrypt/libxcrypt.inc              |  4 ++--
 .../{libxcrypt_4.4.26.bb => libxcrypt_4.4.27.bb}       |  0
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.26.bb => libxcrypt-compat_4.4.27.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.26.bb => libxcrypt_4.4.27.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
index 0772998c72..26a35560fc 100644
--- a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
+++ b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
@@ -1,4 +1,4 @@
-From fd9a46695594c3cd836ecb7d959f03f605e69a2f Mon Sep 17 00:00:00 2001
+From 0607aae55517e1ac0982f99778fa0df0a3165ff4 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 30 Apr 2021 10:35:02 +0100
 Subject: [PATCH] libxcrypt: Update to 4.4.19 release and fix symbol version
@@ -15,13 +15,13 @@ Upstream-Status: Submitted [https://github.com/besser82/libxcrypt/pull/126]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 ---
- build-aux/compute-symver-floor | 2 ++
+ build-aux/scripts/compute-symver-floor | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/build-aux/compute-symver-floor b/build-aux/compute-symver-floor
+diff --git a/build-aux/scripts/compute-symver-floor b/build-aux/scripts/compute-symver-floor
 index 4ec82e1..8117342 100644
---- a/build-aux/compute-symver-floor
-+++ b/build-aux/compute-symver-floor
+--- a/build-aux/scripts/compute-symver-floor
++++ b/build-aux/scripts/compute-symver-floor
 @@ -36,6 +36,8 @@ sub preprocessor_check {
          die "C compiler not available\n" unless @CC;
  
diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.26.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.27.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.26.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.27.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 9186c45e18..725965e535 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -3,14 +3,14 @@ DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSING;md5=29c5f9af198623cdce52a77f85695164 \
+LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     "
 
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
-SRCREV = "8ff7a8c5019cbd50419f7d0a8cd691eb99d6b086"
+SRCREV = "814e715dd8580ff00344112d7d8383a6a5a5b83d"
 SRCBRANCH ?= "develop"
 
 SRC_URI += "file://fix_cflags_handling.patch"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.26.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.27.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.26.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.27.bb
-- 
2.25.1


