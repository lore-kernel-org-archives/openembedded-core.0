Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B99C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 13:08:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.7246.1645621734861951758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 05:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JOaiUIoP;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645621733; i=@fujitsu.com;
	bh=eC7JAMxPjx7FhxMc3IsU99t/OBplk6+gLAaXBGmYLUQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JOaiUIoPqYNl6Q1lL0AjfsKj9Ljax8ekbVCCoK7Tl/XQKa4Gb/mQU2Ha3c365zNJV
	 7CIqdHVI+2NGv6nLTUAWKk5lH4HtwlWWoTx/IyMErfOH759dpeH1Jjmi2MNhjVQ04y
	 QJYM2s7oY2Xouac+C+VLAj6XMkzielPP1J4qYfCE2XNKlJiUeIOtV9SpitkhLGulQk
	 v1TU8CkSPXD4idhloaYd9yb5wnU898vhVpzqxVbjNNDY6rpHBlihvcsPC9V81kHKpY
	 jdVqxTDlqUl0qbRPPlH2AhsugM+pptJxGNF5+RHvovdgDtQ9QngVjBqdgT2Oe/oSO5
	 MC84qNKJmhHpg==
Received: from [100.115.36.74] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id 86/83-29321-4E136126;
 Wed, 23 Feb 2022 13:08:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORqPvEUCz
  JoPOousWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrH910HGgv+cFdtur2BqYJzA2cXIxSEk8JhR
  YlnXRWYI5zyTxMH+e1DOCUaJq7uus3QxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAg8TRgxPBbBYBVYljEzYzgpTzCjhJvJzKCxKWEFCQmPLwPTOIzSsgKHFy5hMWiDESEg
  dfvGCGqFGUmH25mQXCrpCYNauNCcJWk7h6bhPzBEb+WUjaZyFpX8DItIrROqkoMz2jJDcxM0f
  X0MBA19DQVNfYAsi01Eus0k3USy3VLU8tLtE10kssL9ZLLS7WK67MTc5J0ctLLdnECAzKlGK1
  3B2MU1b+1DvEKMnBpCTKe41HLEmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBG+MDlBOsCg1PbUiL
  TMHGCEwaQkOHiUR3uuqQGne4oLE3OLMdIjUKUZdjg+HruxlFmLJy89LlRLnjTUAKhIAKcoozY
  MbAYvWS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeVtBpvBk5pXAbXoFdAQT0BFTsoRAjih
  JREhJNTDNWViQ6uSpYHlQu4RZwiLq/PGtsR8W3rAVvPf67bFDL/nKFnwuOmBz5mWeQJrh2c0K
  y7dNnHlg/jHemVwOxvd2XXt7dfdi6ZyGE/IGuy5/XJ0678U5m7NK0naMW1PcjsV0z1LvC00Ul
  Lzidq11raz73uJ7bnsc7t2SNUuwjVpz0W3i4v2awgxngq4tfSqSnKz6L9bVxeWc8dG/ivt3by
  w8P3+3QMWspiLFkweyJyz8Ur5/GtfZrpBP7jNmNomytSeX/poxlefeYalLYZMCfSd9/TqtyD7
  /gte+rie/9E+p6r5Tkr0/kX2NnpD13+a9bebh8SLr9aelqrmpaqx/IKrIbD5FtbXnUVyicg9T
  qJyJEktxRqKhFnNRcSIA0yvizVEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-565.messagelabs.com!1645621732!3386!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30896 invoked from network); 23 Feb 2022 13:08:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 13:08:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2060510019A
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 13:08:52 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 12F9D100181
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 13:08:52 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 13:08:17 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libva-utils: upgrade 2.13.0 -> 2.14.0
Date: Wed, 23 Feb 2022 21:08:06 +0800
Message-ID: <1645621688-29191-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 13:08:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162262

Changelog:
=========
* test: Use test suite setup/teardown to reduce test overhead
* ci: fix freebsd build

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libva/{libva-utils_2.13.0.bb => libva-utils_2.14.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.13.0.bb => libva-utils_2.14.0.bb} (90%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.13.0.bb b/meta/recipes-graphics/libva/libva-utils_2.14.0.bb
similarity index 90%
rename from meta/recipes-graphics/libva/libva-utils_2.13.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.14.0.bb
index c93cdb4484..b816b5e96d 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.13.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.14.0.bb
@@ -14,8 +14,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.13-branch;protocol=https"
-SRCREV = "7bad184b2cf2ffaf4fb3cc71d4df63d7b142d592"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.14-branch;protocol=https"
+SRCREV = "9cf21686ad9cacef53ee6b3f13c02b830cf0c7a3"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
-- 
2.25.1


