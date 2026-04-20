Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F42F36C4B
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 07:44:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14871.1776671091566930171
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 00:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=F1I04wkt;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BAD41C5C98B;
	Mon, 20 Apr 2026 07:45:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 033315FFA5;
	Mon, 20 Apr 2026 07:44:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A849610460890;
	Mon, 20 Apr 2026 09:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776671089; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7igsj3w6RnT081J1ggbE61zMKNj3dVqdfRotoIeosqc=;
	b=F1I04wktxQ+H6vTaHwT7ci3Hj+7k+PegA8EyzV+IR70CMQA1Wz2AaFkPQw5xAFVd9GvKj0
	bTP3cvZIjrdNKgF+nSdVmAWMy5qeKcsymB0cW+Y36SoLfVCAfbA+Lc5r4/6BIJvGRkLoKR
	BzgVA4hWTCv99OOqO1LzselHY03tPK0tBOnHb9hhsWL3xbc50qnjvBlo3mqc4Q4qWDY3J2
	7AhTmHxDcMYjODgLRflh0A6djiXVOsfq3k8cnCBwgh8WvwaOun8pWWPVfuUMhSCjc6H3gT
	eUiD7qwle35bXqJiawt0lwWPk6uVcEo7JJDy7q6u/yBgpTupSwyNSJHqLNxQZw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 20 Apr 2026 09:44:35 +0200
Subject: [PATCH 04/10] oe/spdx30_tasks: Remove unused license_ref_idx
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spdx3-improvements-v1-4-27e0d5edcdbe@bootlin.com>
References: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
In-Reply-To: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, peter.marko@siemens.com, 
 ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 07:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235545

This local variable is never used in the whole code base, so it is
safe to remove it.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 meta/lib/oe/spdx30_tasks.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index cd9672c18e8c..6609784907db 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -39,7 +39,6 @@ def add_license_expression(
 ):
     simple_license_text = {}
     license_text_map = {}
-    license_ref_idx = 0
 
     def add_license_text(name):
         nonlocal objset
@@ -96,7 +95,6 @@ def add_license_expression(
 
     def convert(l):
         nonlocal license_text_map
-        nonlocal license_ref_idx
 
         if l == "(" or l == ")":
             return l

-- 
2.53.0


