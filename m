Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2185C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:50:18 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.8964.1648461017649640633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fTAv2pdd;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648461016; i=@fujitsu.com;
	bh=VmpBA91x/Vbuoj98AiObiMXUnurb776NQtbzW1BelYo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fTAv2pddsW4BPWqW4NBspuW/3iARknPhdLfKKoavMiDr3dDuG3sPJ15yfEKD/mEOP
	 TX8XF1jwnUjsuLt4+YJx3xEHCxfc7yZHVjNpLzL4CBgx1vGWZ6rc416uHSHEE0oXQL
	 Gwu7rYAidrVe9BR8GI3IN9Q4lNSEtfcs4WjAKuLLb8mt11Wed3YO8wgQaomThk7Zsr
	 bP661jyB2eSgTAgxIhvW2pJWMoKB9NzQFMhoNnGE0BgpSvmGtzi4xkwuf4VEe1WHS7
	 8f8AFPvp/B0GdAXS21zySVQGLN5NqEO+JgvRpctsRcW58qhGm/g5BEFdR4vxjGp3we
	 oxuI5eG9UVr2A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRonu9xTH
  J4P9fdYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWP36bfsBavZK+bN38DWwHiHrYuRi0NIYBaT
  xNb1B1m7GDmBnD2MEtNbOUBsNgE1iem3bgDFOThEBPQkrv4TBQkzC6hIvPjdww5iCwtYSlydc
  YENxGYRUJVovbqBDaScV8BJ4vBieZCwhICCxJSH75lBbE4BZ4nzTxeyQ2xykni19yYTiM0rIC
  hxcuYTFojxEhIHX7xghuhVlJh9uZkFwq6QmDWrjWkCI/8sJC2zkLQsYGRaxWiVVJSZnlGSm5i
  Zo2toYKBraGiqa6xraGmpl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGI4p
  xczHdzBO6fupd4hRkoNJSZTXKNMxSYgvKT+lMiOxOCO+qDQntfgQowwHh5IE761moJxgUWp6a
  kVaZg4wNmDSEhw8SiK8pk1Aad7igsTc4sx0iNQpRkUpcd4bIH0CIImM0jy4Nlg8XmKUlRLmZW
  RgYBDiKUgtys0sQZV/xSjOwagkzHsLZDxPZl4J3PRXQIuZgBavfWcLsrgkESEl1cB0oHP5iS3
  8BkvaVh+ITD2rptKqlhp+zE1sU0Tltwsnz/+efW9yUvPy7pvff3W97/F81PYqbSfnoa9xv8+6
  3P6376BO50NDX4MZQtyqsxuCDy7e3r5W90zDFCGbKW+XTtnv+Uq2e/OGNTb5NtahOZ7O5rfk2
  h8qKX20uLa4Ltl0cypPbMmhFfFaHcv5324wt1Lb9c0z3eXtpSlbo96KHTy3tPzdxhuGS4tsO4
  5yHCsJLTVcLJwsHD7d0l+IJTP0rJX/jNsdNc+P2sT81FywXf7KdvFgM4bjQguKfdYvjBOPFSh
  +x6C98vBmic08v7cW8Yjf55v+jN+XW+OWaL6MqX/YtntffyzZ2L52Q3Dx80RlJZbijERDLeai
  4kQAkokuQ0IDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1648461015!6091!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4812 invoked from network); 28 Mar 2022 09:50:15 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:50:15 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22S9o7L8026477
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:50:15 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:50:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dpkg: upgrade 1.21.2 -> 1.21.4
Date: Mon, 28 Mar 2022 17:49:41 +0800
Message-ID: <1648460981-15712-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648460981-15712-1-git-send-email-wangmy@fujitsu.com>
References: <1648460981-15712-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 09:50:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163694

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/dpkg/{dpkg_1.21.2.bb => dpkg_1.21.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.2.bb => dpkg_1.21.4.bb} (95%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.2.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
similarity index 95%
rename from meta/recipes-devtools/dpkg/dpkg_1.21.2.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
index ef2e06ee4a..681909f0bf 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.2.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "a9580d3aec5f487a81664a462ec70ec1993f19f8"
+SRCREV = "5563bdb608b3413639b69f1c76567cb66ff1a961"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


