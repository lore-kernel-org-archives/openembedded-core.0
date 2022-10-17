Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E651C4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 11:37:43 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.39665.1666006641267001472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 04:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Yo8eohZ2;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666006639; i=@fujitsu.com;
	bh=MYg2buYj8lTi/F3oTHrxLx9TwqeBJFsJF6V550UBS1E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Yo8eohZ2KOoBeHKYdLc46f4xWXNtChSTjb1DzVW7kWRlHCqJIX8BiNQsmdIBVy9FN
	 PpU/wA1filVE6jRnTVsPB9LaQW9AhdcXyCuVdqE/Qq8Vt2D5+wSG4wDcsT+CuX2o0b
	 M+rMMCGApdnHSJtQpO+CvgsefwRERgzyTLrGCylBE2NeFysU+qq/wLk32BkxvKtuvb
	 SsMqYXOBSvmWXJwVL6F+Z+KmDZmKl7U7L9ppxdIP56zO1yUSNtXzEcHvPPuXe6udvm
	 RWw1sshsvIYr4GwO7cfQlKPJvzwAh+AFKid3nxwUfuw4PKWhMKhcq+t0HjhvgRwODW
	 XXKSpGuLa6dHA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8ORqJtn55t
  ssKBLweLOz3fsDowe5zauYAxgjGLNzEvKr0hgzWg9uJO94Cl/Rf+TB6wNjJN5uxi5OIQEHjNK
  /F74kBnCucYkcWPzNBYIZw+jRMO0eexdjJwcbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHid
  w9YibCArcTuRw+YQEpYBFQl7vaClfAKOEpcWDuLBcSWEFCQmPLwPTNEXFDi5MwnLBBjJCQOvn
  jBDFGjKDH7cjNUfYXErFltTBC2msTVc5uYJzDyz0LSPgtJ+wJGplWMZsWpRWWpRbpGeklFmek
  ZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgaGYUpwctoOxd+kf
  vUOMkhxMSqK8e9R8k4X4kvJTKjMSizPii0pzUosPMcpwcChJ8KrbAOUEi1LTUyvSMnOAcQGTl
  uDgURLhrbMGSvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy9VSpw3D2SGAEhRRmke3AhYjF5ilJ
  US5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy70hZoCk9mXgncpldARzABHZGx3wvkiJJEhJRUA1N
  qqWeycdin+fduJtozneNrFtkxx8SkKkz7TktO1Z/amOVuE+t2OSy416bqUfU/zuD1IpOSCF/1
  YHmRFftXBb8sDJ+fMlOgM9NaeNphruB5/QbOaQWXq4V7qyf/ORZdKNM7wXiCDucn46wJwsmnW
  H+d4fC+9nuCt4+p/uXSXRHGXftOzZDI1pgfsdqH0aPp5v6fU8+bWQoGa+ffuRCXnblbXXha8Y
  RdU4Q2v1t6IFI1o//dpItmHYYv+ueFttxu33qy4qjCMX2VENkvz2NvTV6k19ntsDRhe8pBd1F
  fBa3TOuaF6ssXXXww89m6md9fnn/Ely5Vb9/+puDK8v2n7r8+W+IoYdV4/Ozm3BX85kosxRmJ
  hlrMRcWJAFY7VF9MAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-728.messagelabs.com!1666006638!181305!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27739 invoked from network); 17 Oct 2022 11:37:18 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Oct 2022 11:37:18 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id EB926100191
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 12:37:17 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DF7BB100043
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 12:37:17 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 17 Oct 2022 12:37:16 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 5.19.1 -> 6.0
Date: Mon, 17 Oct 2022 19:37:00 +0800
Message-ID: <1666006620-3217-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 11:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171905

Changelog:
==========
  * fi usage: in tabular output, print total size and slack size
   * mkfs:
      * option -O now accepts values from -R to unify the interface (-R will
	continue to work)
      * zone reset and discard is done in parallel on all devices
      * removed option --leafsize, deprecated long time ago
   * corrupt-block: recalculate checksum when changing generation
   * fixes:
      * convert: fix reserved range detection and overlaps
      * mkfs: fix creating files with reserved inode numbers with --rootdir
      * receive: escape filenames in command attributes
      * fix extent buffer leaks after transaction abort
   * experimental:
      * mkfs: support for block-group-tree (kernel 6.1)
      * fsverity in send (protocol v3, WIP)
      * btrfstune -b converts to block-group-tree
   * other:
      * cleanups, refactoring
      * new and updated tests
      * update documentation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_5.19.1.bb => btrfs-tools_6.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.19.1.bb => btrfs-tools_6.0.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.19.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.19.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.bb
index db8026e0f0..887a530a52 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.19.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "e1d9dab326e043696e6648aba4ccf90874d1d3d1"
+SRCREV = "3db756352685f38c1de0aa886d380c733e0f53e7"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.25.1


