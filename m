Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D238DD277E4
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 12:28:33 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7684.1768048096047825145
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 04:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=VXpfWRyp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260110122812e4026bd3ae0002078f-6xoqpb@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260110122812e4026bd3ae0002078f
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 13:28:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=r5ukVPOLtbjrrT4nYY9StwjliwJU+hRW1/snAc7womk=;
 b=VXpfWRypXRF3WZlpXLQfY7gcvw3x3UW58y5ejqZPH1eM9NsQG2Fj82nEEwgy8sBzfBl2Wz
 6ATKkt93C307gvtPXot4NIiP6iE/jFXGh5kSlqeTLeteMB9+Cy1uD53AG10X6Ev53Pc1bz2z
 1ju1QxDOEGO6Epj2RgKQ1EvmR1uMR94ym+IKmWZHFPaEy19sNYmX912Raj/XeT5F+37rtNvd
 jsib7kyA067oDTGFvegYWmdaaPdLCWBTQOTjEy6BtGopwumYxzqLYhz0FrrAlIhNCwu1IeiV
 XI+grKPTXjeJGjFyvJN1Yy48xlh6QJZlHKaWBC8GPfRhrmbPUHCXg3hQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] libarchive: upgrade 3.8.4 -> 3.8.5
Date: Sat, 10 Jan 2026 13:27:53 +0100
Message-Id: <20260110122753.381844-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 12:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229147

From: Peter Marko <peter.marko@siemens.com>

Fixes regression of fix for CVE-2025-60753

Release notes [1]:
Libarchive 3.8.5 is a bugfix release.
Notable bugxies:
* bsdtar: fix regression from 3.8.4 zero-length pattern issue bugfix (#2809)
* various small bugfixes in code and documentation

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.5

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libarchive/{libarchive_3.8.4.bb => libarchive_3.8.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.4.bb => libarchive_3.8.5.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.4.bb b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.8.4.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.5.bb
index e89638f5c6..fcfaf5d231 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.4.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "b2c75b132a0ec43274d2867221befcb425034cd038e465afbfad09911abb1abb"
+SRC_URI[sha256sum] = "8a60f3a7bfd59c54ce82ae805a93dba65defd04148c3333b7eaa2102f03b7ffd"
 
 inherit autotools update-alternatives pkgconfig
 

