Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D805C433FE
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 00:12:12 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.621.1643069530703110098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 16:12:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CJDfLexe;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643069528; i=@fujitsu.com;
	bh=f0Zm+wTD9zIMD/rT+mfGiJ1ANcdO7SP7v6n39wZF8jo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CJDfLexeEdFmHs+W24z0LJa7Eb2KZt6cnuvVWLchEsGVyO9uaemK+OOuHpkAbkFLd
	 cVycqqwZ5H33D+p2EatW86PupOgtFIT1p5ilo8+Q1FaSqQbGqBuDzX26hhJJQVzGbp
	 PA35TqE8EdlpsmmfowzZPckmrhG9RJUfrz0RbQn3Qw8Q4kywedglH1buJJFfkBhlWO
	 JGj3gLVLEPZRFLG1yCXgdZ+lmmCjDAZIe4OG0ln5X7hUKnHMyFjFv6O0lBicuLX3A8
	 6aUd5tddt5sc0hzQj8+8cCcoEfKu3VglC5P2V+kHoO4a6RMKZR7KnfhG58e1Fim4/b
	 52POMKcQvnPdg==
Received: from [100.115.70.120] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 D3/AC-07811-8504FE16; Tue, 25 Jan 2022 00:12:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8MxSTfC4X2
  iwfdHghZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8ask/8ZCy4JVfx4vo65gXGFQBcjF4eQwGNG
  iddrjzNCOOeZJObcnc4K4ZxglLh0Zw2Qw8nBJqAmMf3WDSCbg0NEQE/i6j9RkDCzgIrEi9897
  CBhYQFniSUtZiBhFgFViSX3pzOC2LwCjhKrfz9iArElBBQkpjx8zwxicwo4SRyd0A42XQioZs
  uMqWwQ9YISJ2c+YYEYLyFx8MULZoheRYnZl5tZIOwKiVmz2qBmqklcPbeJeQKj4Cwk7bOQtC9
  gZFrFaJtUlJmeUZKbmJmja2hgoGtoaKprZqFrZKKXWKWbqJdaqpucmldSlAiU1UssL9ZLLS7W
  K67MTc5J0ctLLdnECAzklGIXiR2MN/t+6h1ilORgUhLlNbZ6nyjEl5SfUpmRWJwRX1Sak1p8i
  FGGg0NJgve4DVBOsCg1PbUiLTMHGFUwaQkOHiUR3pN2QGne4oLE3OLMdIjUKUZFKXHeLkOghA
  BIIqM0D64NFsmXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzcoCM58nMK4Gb/gpoMRPQ4t/
  n34EsLklESEk1MMlGrLJl8N6mHsDrsUvslPetuRMmK/PdTo8Rnn74hX914MPZVx513OnZ++r6
  tN8/Ljz/0a14V40x/FnPHdnQKLFriY25OzJfnFJg5N5yNELo4Y2d136v3Sjm32qdLnLr7wZhm
  f+VHHsfzU6a0i41y2vDgtP873i37r/ybXaA3omkdw7T0l6fb+9SSnyyPUq35cevdQWSjitnOq
  +ebMGw61dA5+OJnW+ZjBk8pjJ8bjc4Vf9AfvOneU3NfTrim2f5iLy0sInWu9ByVLPkQQPPHYH
  oK1Nd33x4HRZwXi7fVFy8x8bbfsWrMkd9jblnD3x+82jSHzFTq/aYsMp6v5YOxoztW/d3tSce
  D9yvqzN9v70SS3FGoqEWc1FxIgBq2yX9XwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-545.messagelabs.com!1643069528!34273!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31272 invoked from network); 25 Jan 2022 00:12:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Jan 2022 00:12:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id CDB5D100440
	for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 00:12:07 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A7A0610034F
	for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 00:12:07 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 25 Jan 2022 00:11:53 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-libarchive-c: upgrade 3.2 -> 4.0
Date: Tue, 25 Jan 2022 08:11:36 +0800
Message-ID: <1643069496-5684-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643069496-5684-1-git-send-email-wangmy@fujitsu.com>
References: <1643069496-5684-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 00:12:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160904

Changelog:
=========
-BREAKING & SECURITY: The archive extraction functions now pass 3 security flags
 (SECURE_NODOTDOT, SECURE_NOABSOLUTEPATHS and SECURE_SYMLINKS) to libarchive by
 default, unless the current directory is the root.
-BREAKING: The ArchiveEntry properties atime, mtime, ctime, birthtime and size
 now have the value None instead of 0 when they're unset.
-BREAKING: The ArchiveEntry.pathname property now attempts to decode bytes using
 UTF-8. This breaks reading archives that contain file names which look like
 UTF-8 but aren't, if such a thing exists. Proper support of encodings will
 probably be added in the next version.
-Multiple entries from the same archive can now be kept in memory, however only
 the current entry's content can be read.
-The filetype, linkpath, size, mode, redvmajor, redvminor, uid and gid
 attributes of an archive entry can now be modified.
-The four time properties of archive entries now have setters, so for example
 entry.set_mtime(0, 0) can be replaced by entry.mtime = 0.
-Archive entries have 4 new properties: perm, rdev, uname and gname.
-When adding files to an archive, a destination path can now be specified.
-The ArchiveRead class now has a bytes_read property.
-The ArchiveWrite class now has a bytes_written property.
-Python 3.6 is no longer tested.
-The documentation has been improved.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-libarchive-c_3.2.bb => python3-libarchive-c_4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-libarchive-c_3.2.bb => python3-libarchive-c_4.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_3.2.bb b/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-libarchive-c_3.2.bb
rename to meta/recipes-devtools/python/python3-libarchive-c_4.0.bb
index cc04210e72..3c6bc1e1ca 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_3.2.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "libarchive-c"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "21ad493f4628972fc82440bff54c834a9fbe13be3893037a4bad332b9ee741e5"
+SRC_URI[sha256sum] = "a5b41ade94ba58b198d778e68000f6b7de41da768de7140c984f71d7fa8416e5"
 
 RDEPENDS:${PN} += "\
   libarchive \
-- 
2.25.1


