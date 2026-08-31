Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F85C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:04:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25548.1788167055595870426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=At1SwOcp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DAE034E41466
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B028660231
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B741111C78AD2;
	Mon, 31 Aug 2026 11:04:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788167053; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xj5+R3nyX/pZ7uA+wqp9gkaQCmldcbKOE9SeazIabh4=;
	b=At1SwOcpTmNAfDUxy4CxNJmPigNiBfmxcTF9zvA3Ygl7ixuao9impNEihj+fWObsIpg3fw
	b0bpINTe5TiXMR2LjtHxWS8ZYCd0uV/xE9SiDp8HG3BITXUTBVwAImWFR0gL7g/342bCof
	ASoleBE9CcSDlCiJ668Y3OyHzkPrAhrCjrYnOfUOwqK/YrRVfVaBH1Tm1G+9g68MLiPMqP
	yFV+U4ZF0iojAjLhyr12LhmW4EOVT7258G/NJUHgF4yixs0aQu3vGhcGxynkjzGORTCzS9
	P+qBvxOnyzvh14ya2/ZMXjPkiTllypheBfZK74bJyjWyJvJHgUPUcDsd8fgqSA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 31 Aug 2026 11:03:34 +0200
Subject: [PATCH 2/9] python3-wcwidth: upgrade 0.8.2 -> 0.8.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-mathieu-updates-2026-08-31-v1-2-58b54db72860@bootlin.com>
References: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
In-Reply-To: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788167050; l=1287;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=Lx2uWliaaSOhEShMhkp60Y7y7cQ1pfD08yshvHfXoqw=;
 b=vAqyH/sjETa83J107l28ivwa4XfyfKqpmzCAPySRFPveGA9QNa1Mt2IhRft0ZHsDfDxZ3pbLT
 qkLncUdViGJDE00jGTZLfpmtIsf6ZFCp3G3l51L77Hfw8bNCId1cLVL
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244744

Changelog:
- Bugfix Do not hang on wrap() calls of width 1 with text containing OSC8 hyperlinks and wide characters, PR #231.
- Bugfix clip() with propagate_sgr=True, should match behavior of propagate_sgr(), PR #235.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../python/{python3-wcwidth_0.8.2.bb => python3-wcwidth_0.8.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.8.2.bb b/meta/recipes-devtools/python/python3-wcwidth_0.8.3.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-wcwidth_0.8.2.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.8.3.bb
index d5867ef9b85c..3ba5b5b29b1f 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.8.2.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.8.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "91fbef97204b96a3d4d421609b80340b760cf33e26da123ff243d76b1fda8dda"
+SRC_URI[sha256sum] = "d128512515fbf4612e0ff21fd6380399210318b7b54a9af59dff8454cf9730eb"
 
 inherit pypi python_hatchling ptest-python-pytest
 

-- 
2.47.3


