Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEABDC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 16:39:09 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.24944.1744735142510371839
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 09:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=VrpADiaw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202504151638591aee80b89a6bdd0e86-v8g34x@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202504151638591aee80b89a6bdd0e86
        for <openembedded-core@lists.openembedded.org>;
        Tue, 15 Apr 2025 18:38:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=+h+miEhWetcPAOP5zKly9cPcOxS1cv3gEemzD+3F3To=;
 b=VrpADiawaIQadvMY5Luu11Pw1f3EZaJY+5lIzM4X4qQIOQTiRv6VOxrCOK+zbu4QsBLs7g
 vimhgXPqUkJBULuzFx2eHNfZ8v2UvgQ3Q4wOlRLzdlGFlVPadRwBDyvpLKS48nQktmbmVPo0
 xGaVlH94AMt3IPozD8wlTmqzWdAAV5nR8+t2hUh2mlIdPTUnqkoM278pjjXfxoWCDwX/cJNM
 UauedbiHhVVdfbJE142tSh0/9B7x16fjtkhJtHd1HIAxPKutCvdR4Khf1zG6sr58LBW2wqif
 paQvgDNmDDCOHsxrXVoVXHFfLlN4XvMixgbmWgplpLmzf+dg3GIMPgUg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] libarchive: upgrade 3.7.8 -> 3.7.9
Date: Tue, 15 Apr 2025 18:38:12 +0200
Message-Id: <20250415163812.2168398-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 16:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214957

From: Peter Marko <peter.marko@siemens.com>

https://github.com/libarchive/libarchive/releases/tag/v3.7.9

Libarchive 3.7.9 is a bugfix release
Important bugfixes:
* a regression in libarchive 3.7.8 regarding GNU sparse entries was fixed (#2558)

Also remove CVE_STATUS which was obsolete already before this upgrade.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libarchive/{libarchive_3.7.8.bb => libarchive_3.7.9.bb}   | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.8.bb => libarchive_3.7.9.bb} (91%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.8.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
similarity index 91%
rename from meta/recipes-extended/libarchive/libarchive_3.7.8.bb
rename to meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index d78b38d3e9..9d134f7d38 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.8.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -33,9 +33,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "a123d87b1bd8adb19e8c187da17ae2d957c7f9596e741b929e6b9ceefea5ad0f"
-
-CVE_STATUS[CVE-2023-30571] = "upstream-wontfix: upstream has documented that reported function is not thread-safe"
+SRC_URI[sha256sum] = "aa90732c5a6bdda52fda2ad468ac98d75be981c15dde263d7b5cf6af66fd009f"
 
 inherit autotools update-alternatives pkgconfig
 

