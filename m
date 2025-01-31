Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69254C02192
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 23:02:05 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by mx.groups.io with SMTP id smtpd.web10.27659.1738351534367448143
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 11:25:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@debian.org header.s=smtpauto.stravinsky header.b=jSvERpBn;
 spf=none, err=SPF record not found (domain: debian.org, ip: 82.195.75.108, mailfrom: bage@debian.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RxSRVq8cFssqhKiQdvntX6ZsSBqW8wWItKcJaBqUXgc=; b=jSvERpBn0V6PF8LzfzTvCdnnQc
	Ym7acufPJk70+iVc3zZn0160/ltYhCGwLRXdHlyVDRyRfvrx2QFVlU/2FctHUjBOQXmZzNBpR4Kj7
	iaUpcLV86iScIMKPrBjwBD7ItaCmv63JIzMEKN88F8vo689u4dsmm1rwqXNVsGKxh/VbJJyLZLktM
	S3OOwcY0p/afbvqywREgSSAf5B378AlhsVGx1KFPKCPEB3BbdoBiiUYMiYD+KnyjpkpFQF797sAdg
	AylJsvi+tlNny7iNfGe/pZxBd1Le3cgoLG2EdXKtFOn4ni93HgdaTGsNKjiWr+vaheWdybhha4B1F
	fKcTB7bw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1tdwdw-00FVbH-9p; Fri, 31 Jan 2025 19:25:32 +0000
From: Bastian Germann <bage@debian.org>
To: openembedded-core@lists.openembedded.org
Cc: Bastian Germann <bage@debian.org>
Subject: [PATCH] licenses: Map SGIv1 to SGI-OpenGL
Date: Fri, 31 Jan 2025 20:25:20 +0100
Message-ID: <20250131192527.7449-3-bage@debian.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250131192527.7449-1-bage@debian.org>
References: <20250131192527.7449-1-bage@debian.org>
MIME-Version: 1.0
X-Debian-User: bage
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 23:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210498

SGI-1 is not a SPDX license identifier. However, the SGI-1 license has
the same license text as SGI-OpenGL. Map the old SGIv1 name to SGI-OpenGL.

Signed-off-by: Bastian Germann <bage@debian.org>
---
 meta/conf/licenses.conf                  | 2 +-
 scripts/contrib/convert-spdx-licenses.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 991fb6cc23..dcb499c3f3 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -112,7 +112,7 @@ SPDXLICENSEMAP[tcl] = "TCL"
 SPDXLICENSEMAP[vim] = "Vim"
 
 # Silicon Graphics variations
-SPDXLICENSEMAP[SGIv1] = "SGI-1"
+SPDXLICENSEMAP[SGIv1] = "SGI-OpenGL"
 
 # Additional license directories. Add your custom licenses directories this path.
 # LICENSE_PATH += "${COREBASE}/custom-licenses"
diff --git a/scripts/contrib/convert-spdx-licenses.py b/scripts/contrib/convert-spdx-licenses.py
index 4e194dee3f..13cf12a33f 100755
--- a/scripts/contrib/convert-spdx-licenses.py
+++ b/scripts/contrib/convert-spdx-licenses.py
@@ -93,7 +93,7 @@ license_map = {
 "Nauman" : "Naumen",
 "tcl" : "TCL",
 "vim" : "Vim",
-"SGIv1" : "SGI-1",
+"SGIv1" : "SGI-OpenGL",
 }
 
 def processfile(fn):

