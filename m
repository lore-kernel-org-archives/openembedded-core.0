Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C047FC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 16:01:21 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.508.1787846479783337874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 09:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=WbXn9LQ8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260827160117872bada3d9000207c3-diskui@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260827160117872bada3d9000207c3
        for <openembedded-core@lists.openembedded.org>;
        Thu, 27 Aug 2026 18:01:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8y12XDD9CAkXS5JSfUctP9p0knxTgQ/p/1rOQgSMK2Y=;
 b=WbXn9LQ8M1RvsJqdYGqkeIdwIqv9/oX1A8N+PM7s5o9yW8XRzVsDXDFPYcwOJS/NcX8rf5
 a/zcBfMp2Q+b8ZJ0QDOVqbVVGdkgjLGYPhFcuWMhR/YPEW+Os8/CIwHPbyCJcaj9pybKT9t4
 P+CXTL9H8lc2sJt1LmN7AJ2mXJQHy9gYbZ1S5epuclBvoJaUEnt5cJjbIanaBhJP7fbQW+DT
 lXc2FnOrRnkhop41gMRstt8iZ9MtRLmHjxQZMurox6yGHoaQrfHynPUr+GHhFIoNEyLZlfsP
 MLYb/68xSlKvNcqfEGZNmIecWvNzJ71Gsi9YrrlFeP0u/e/EPOnSi3ig==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/2] python3-certifi: fix homepage
Date: Thu, 27 Aug 2026 18:00:43 +0200
Message-ID: <20260827160044.12262-2-peter.marko@siemens.com>
In-Reply-To: <20260827160044.12262-1-peter.marko@siemens.com>
References: <20260827160044.12262-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 16:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244502

From: Peter Marko <peter.marko@siemens.com>

Leading space leads to SPDX document validation errors in some tools.

Example:
SchemaError: \" http://certifi.io/\" is not valid under any of the
schemas listed in the 'anyOf' keyword
(components -> ... -> externalReferences -> 0 -> url)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3-certifi_2026.7.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb b/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
index 41b282800b..8f1ba3aa9d 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python package for providing Mozilla's CA Bundle."
 DESCRIPTION = "This installable Python package contains a CA Bundle that you can reference in your \
 Python code. This is useful for verifying HTTP requests, for example.  This is the same CA Bundle \
 which ships with the Requests codebase, and is derived from Mozilla Firefox's canonical set."
-HOMEPAGE = " http://certifi.io/"
+HOMEPAGE = "http://certifi.io/"
 
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"

