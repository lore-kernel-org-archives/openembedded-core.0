Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE9AC4345F
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 07:47:03 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.15486.1714981609878731349
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 00:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=KRiuEIMT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2024050607464677d5b95bbc3e6dc594-rwuchg@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2024050607464677d5b95bbc3e6dc594
        for <openembedded-core@lists.openembedded.org>;
        Mon, 06 May 2024 09:46:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=KyjLtmCKXdBz5YbnGayMTeqyzBpl7D1jzZNPc+Sa1Hc=;
 b=KRiuEIMT28Dptg2XKVKkz7thTl4w1erPEdxpMcV2TGBAiLY/WaWP1zvAsGojYnUpkYsBad
 4f8LmMdIlgV971mitnAAbn8Yqh9m7OCvN0Ktz45WVWB1jSJWiAJf16rTsqozRtrvgAQ+dcYy
 E6p6EvqhItFerwdfZHGzi/wApUawM=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2] glibc: correct license
Date: Mon,  6 May 2024 09:45:48 +0200
Message-Id: <20240506074548.16296-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 07:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199036

From: Peter Marko <peter.marko@siemens.com>

The license per [1] is LGPL-2.1-or-later and
[2] converted last LGPL-2.1-only references.

License-Update: corrected from LGPL-2.1-only to LGPL-2.1-or-later based on [1] and [2]

[1] https://www.gnu.org/software/libc/
[2] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=273a835fe7c685cc54266bb8b502787bad5e9bae

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index b9516e77f0..91a3f5bcd5 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -2,7 +2,7 @@ SUMMARY = "GLIBC (GNU C Library)"
 DESCRIPTION = "The GNU C Library is used as the system C library in most systems with the Linux kernel."
 HOMEPAGE = "http://www.gnu.org/software/libc/libc.html"
 SECTION = "libs"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only & LGPL-2.1-or-later"
 
 LIC_FILES_CHKSUM ?= "file://LICENSES;md5=f77e878d320e99e94ae9a4aea7f491d1 \
       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-- 
2.30.2


