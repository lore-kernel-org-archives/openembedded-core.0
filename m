Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0FECD8CA7
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 21:57:44 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66419.1780955857279868106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 14:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=JuEf5qrE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260608215735f137c6e0fb000207ba-zwqp_1@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260608215735f137c6e0fb000207ba
        for <openembedded-core@lists.openembedded.org>;
        Mon, 08 Jun 2026 23:57:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6dJ5/eJMaDroq1nptacssvhhwHxGObFYPx+fN2sGBJ0=;
 b=JuEf5qrEqLDcoY3BRXt3xo0XBzGQzyQeb2SNKTtxn7uxMZhZlIcsWLlu7e58CCoJuYEXz3
 7mte0nAe/QovcJ0vOL9t2yCWyRn55rJNmM4bd0gRkIyDxOtoSUeeVgaK5T+0MeMuKoHSjO0a
 Ck1EsdXhxPgXa9X+GZJSrZCM5kYLd2/PuVCNstzSJPhXgRAFEd5nAtmxRigq7yRn0uEjIJqe
 qQrX4wjEpkLAlGNG7z+hIojjik460Nbbd/Ep622dSAS11ljwCMxeLdPDhdj34OLUaA7xNPVU
 AktwpqptrTeCje4yG9ZqSqzjwPjdppDIXxUMuN4kAP1ngFRM1l0rs+GA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 6/6] python3: reference upstream ticket in a test skip
Date: Mon,  8 Jun 2026 23:56:52 +0200
Message-ID: <20260608215654.3664494-5-peter.marko@siemens.com>
In-Reply-To: <20260608215654.3664494-1-peter.marko@siemens.com>
References: <20260608215354.3664441-1-peter.marko@siemens.com>
 <20260608215654.3664494-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 21:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238264

From: Ross Burton <ross.burton@arm.com>

I've filed a ticket upstream for the libedit-related test failure in
test_bang_completion_without_do_shell(), add a reference to the comment.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: b5c24e1491dcb9ab0f782df6be6582fbd2151724)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3_3.14.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipes-devtools/python/python3_3.14.5.bb
index 919cfde9ae..02bda8ddcf 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -271,6 +271,7 @@ SKIPPED_TESTS = " \
 # but not bang completion. test_bang_completion_without_do_shell() passes if
 # building with readline, but we don't want to change the default, so skip the
 # test.
+# https://github.com/python/cpython/issues/150922
 SKIPPED_TESTS += " \
     --ignore test_bang_completion_without_do_shell \
 "

