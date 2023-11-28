Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF7AC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 07:42:14 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.27774.1701157331047898971
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 23:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm1 header.b=BCytUoYE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-456497-20231128074208923fd331e156a4c517-jg_t43@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20231128074208923fd331e156a4c517
        for <openembedded-core@lists.openembedded.org>;
        Tue, 28 Nov 2023 08:42:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=jkipNKTccBSTNnA9nyKtQKtz8r1aWFRcY3R85BfTiTk=;
 b=BCytUoYEVF4UMPybQDOav08INRoiCnOqy6R1mdPUQFaca+g8Qwlxt1+i96H7dEqvZMvIYY
 Tm5XhdfJbjXd4h1G8cwWggPrRhGs3Atm+U/3Ec8oduMM46rqZGYrYIekD5D1GHmSMlhMDBjL
 Rh9PuVe+9jOIDNYx7ZwRbufy197rA=;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [meta-oe][PATCH] rdfind: remove (move to oe-core)
Date: Tue, 28 Nov 2023 08:41:59 +0100
Message-ID: <20231128074201.40056-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 07:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191336

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Newer linux-firmware (oe-core) requires rdfind-native, move the new
dependency to oe-core as well.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 meta-oe/recipes-support/rdfind/rdfind_1.6.0.bb | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-oe/recipes-support/rdfind/rdfind_1.6.0.bb

diff --git a/meta-oe/recipes-support/rdfind/rdfind_1.6.0.bb b/meta-oe/recipes-support/rdfind/rdfind_1.6.0.bb
deleted file mode 100644
index 3a15fe6c9..000000000
--- a/meta-oe/recipes-support/rdfind/rdfind_1.6.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Rdfind is a program that finds duplicate files"
-HOMEPAGE = "https://rdfind.pauldreik.se/"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fa22e16ebbe6638b2bd253338fbded9f"
-
-DEPENDS = "nettle autoconf-archive"
-
-SRC_URI = "https://rdfind.pauldreik.se/${BP}.tar.gz"
-SRC_URI[sha256sum] = "7a406e8ef1886a5869655604618dd98f672f12c6a6be4926d053be65070f3279"
-
-inherit autotools
-
-BBCLASSEXTEND = "native"
-- 
2.43.0


