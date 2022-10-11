Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E94C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 07:58:58 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.4802.1665475133686808784
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 00:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yyn7Hasc;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665475132; i=@fujitsu.com;
	bh=mOlprNk7uWoly4Mr5fAvN+x1+dqR2OVn+rPgxIUbY1g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yyn7Hasc8hlP33CVCahChwlenhExVBVvXfug4EdSTI26jJjWqO5zionB0M71D0peK
	 r72MOsJ3mTW4AlEmFHetLSjAfP2iQe8fFLhetxjdQFHC9MM569Byp7hMn+orB/w5xL
	 LEqCZcz1inF55phFvzCVN8Mx9i/Lrx4BZ8oIPfbhsBfLZPRU4uM9CX5OgOEuj+iett
	 ga6XIHJLX4m8tQ7DjE/0dwdmtXh//YG6h8qwRVsBUgH8Pz1HnGxLfzJ7ZTn+1xh7t2
	 GqhQssyZ8j+/1rNizSDH7FiD9p4FtqgHaXWbybUzwIRC/RX/sUh3tOnOqjvvYkk/HU
	 iIgWk7uVV0fCA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRWlGSWpSXmKPExsViZ8ORqGut5Jp
  ssO+OmsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvFr8wLGggP8Fe3b3jE3MM7l62Lk4hASeMwo
  caR9LguEc41J4syVfWwQzh5GiVtPzwJlODnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAXGJx4ztGkBIWAVWJU+fTQcK8Ak4S758sZwWxJQQUJKY8fM8MYnMKOEucftMO1ioEVN
  Ox7xozRL2gxMmZT1ggxktIHHzxghmiV1Fi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKkarpKLM9IyS3MTMHF1DAwNdQ0NTXSBpaqKXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdc
  mZuck6KXl1qyiREYwinFDLN2MM7q+6l3iFGSg0lJlPfqc5dkIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8x+Vdk4UEi1LTUyvSMnOA8QSTluDgURLh7ZECSvMWFyTmFmemQ6ROMVpyXL1yZS8zx8
  yvbQeYOdq3dx1gFmLJy89LlRLnlVUEahAAacgozYMbB4v5S4yyUsK8jAwMDEI8BalFuZklqPK
  vGMU5GJWEefPkgKbwZOaVwG19BXQQE9BBJ686gRxUkoiQkmpgOqsUri50T/OtvNO/7GV/5tw+
  uNi+r3h/J9sm37P6GfNuTVR7t3plItMTF687kem3bQ9/OCei1L0+9lbkhkWOa2ymu+b+Wsl1/
  LTeQ0GjQ+uaVNfGbnWXSZgvzrowM/yBvINSvvGs/SvCpmSmc2pxydttbM3U4Xd0ex1yp/boSk
  1j7VP17ix5b9tT10y/7sEi7r9o0Z37/56J9BecDmZ+IfdGsm2m7Cdlt5Bt/N++tS+SC9Z5efc
  Vx/cZp0Is/GN/nq6tcGLom/rnzKQa7mdOqzY1XcrhYd2ubuW/okuOk7WCnU23Ss4tO/BD+eL3
  HSHX3/ZUBua/TdUUbW18JCOeeODO9T9im08ILXXjv8ChxFKckWioxVxUnAgAuA439HQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-591.messagelabs.com!1665475131!412496!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21512 invoked from network); 11 Oct 2022 07:58:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 07:58:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4304F100195
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 08:58:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 40332100043
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 08:58:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 08:58:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libcap: upgrade 2.65 -> 2.66
Date: Tue, 11 Oct 2022 15:58:13 +0800
Message-ID: <1665475094-16329-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665475094-16329-1-git-send-email-wangmy@fujitsu.com>
References: <1665475094-16329-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 07:58:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171598

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...1-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch | 2 +-
 meta/recipes-support/libcap/{libcap_2.65.bb => libcap_2.66.bb}  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.65.bb => libcap_2.66.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
index 3f4c7e57ae..8bd2050ea5 100644
--- a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
+++ b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
@@ -1,4 +1,4 @@
-From 1c234bc39446eb9b23896e85dd67b02976d46c3d Mon Sep 17 00:00:00 2001
+From a3196f3a06e7bbfde30d143c92a4325be323b3d0 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 14 Oct 2021 15:57:36 +0800
 Subject: [PATCH] nativesdk-libcap: Raise the size of arrays containing dl
diff --git a/meta/recipes-support/libcap/libcap_2.65.bb b/meta/recipes-support/libcap/libcap_2.66.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.65.bb
rename to meta/recipes-support/libcap/libcap_2.66.bb
index 8013d40769..c50e9d8cc7 100644
--- a/meta/recipes-support/libcap/libcap_2.65.bb
+++ b/meta/recipes-support/libcap/libcap_2.66.bb
@@ -20,7 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "73e350020cc31fe15360879d19384ffa3395a825f065fcf6bda3a5cdf965bebd"
+SRC_URI[sha256sum] = "15c40ededb3003d70a283fe587a36b7d19c8b3b554e33f86129c059a4bb466b2"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.25.1


