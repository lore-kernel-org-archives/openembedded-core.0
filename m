Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F38DFF885C
	for <webhook@archiver.kernel.org>; Sat, 25 Apr 2026 22:27:33 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6776.1777156047375638355
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2026 15:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=h0dpVuI7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202604252227254ff4aa90c30002071c-t6xhlu@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202604252227254ff4aa90c30002071c
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 00:27:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Kq/ZUnPs63A6PoXoevO+5DwbHt8XGuHKv8OOBMD0BTI=;
 b=h0dpVuI7ZEGvsnH1Cu+xMINuvCu8l3V9hESMcU2iuOC8IWYG4D28msVj9xPhqJbJtAmCqO
 TXZWBe//W5D++lxuuLySJfROhNkoG2GiNuI0XYE6jZUUM49oFSoR/lEKvAEev+5V6D+bnGw4
 3JI0vAPyWlJ2BLIgoKD2Og6vev/NsJ/PLJbC4M/HDgtyrgXk9b+dLtlyNAAuA2wvSVRPVdig
 mRrZAc9zYlRmRc8OOkOfA0B7IHnY1OLyKtodzIPXmktJ7n6QnXY/7Xlga6rawk0pkb0ZqiEu
 FHhf+UC3Miq/VAMBO0Q2/jmdPzPcCtsviT886mLtNjxmlypJJrYr3Mag==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 3/5] python3-setuptools: set status for CVE-2024-6345
Date: Sun, 26 Apr 2026 00:26:32 +0200
Message-ID: <20260425222634.44171-3-peter.marko@siemens.com>
In-Reply-To: <20260425222634.44171-1-peter.marko@siemens.com>
References: <20260425222634.44171-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2026 22:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235948

From: Peter Marko <peter.marko@siemens.com>

Current version of sbom-cve-check reports this for some reason.
NVD does not have CPE and cvelistV5 ([1]) says "lessThan": "70.0".

[1] https://github.com/CVEProject/cvelistV5/blob/main/cves/2024/6xxx/CVE-2024-6345.json

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3-setuptools_82.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb b/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
index a3943a29c3..c413578faf 100644
--- a/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
@@ -49,3 +49,5 @@ BBCLASSEXTEND = "native nativesdk"
 # This used to use the bootstrap install which didn't compile. Until we bump the
 # tmpdir version we can't compile the native otherwise the sysroot unpack fails
 INSTALL_WHEEL_COMPILE_BYTECODE:class-native = "--no-compile-bytecode"
+
+CVE_STATUS[CVE-2024-6345] = "fixed-version: fixed since 70.0"

