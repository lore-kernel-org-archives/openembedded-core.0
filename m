Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAE6F44869
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 13:11:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156114.1775826668380847405
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 06:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QT+RFLf5;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D8E901A325A;
	Fri, 10 Apr 2026 13:11:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B005B603F0;
	Fri, 10 Apr 2026 13:11:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 564F21045001A;
	Fri, 10 Apr 2026 15:11:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775826666; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=18Podp2LLi4Gx5nsEog4+6cfoh4+OtK+2C6wCDoygfc=;
	b=QT+RFLf5rjLIh5Ye8SnKUGs4AbU/BqbZXUD3BGFf1f6Uklk0YTDo1nGnZh2NeDqApWmibw
	N5tCEnqrjA96zu7d592L/AAtlK7HoxhsxoFiggCLvB1OfvKY+oMNGG6aO10YKgqrHtKl9a
	ZMBXxe/JiE4qAzPfKTwnYmNgTQb3UyagQWmbiio6shL2dQSv5ECx4+3W6VU2C11yzT16E4
	zSpya2NkRqQE6j8R7OrVvhqVuNON7XuLey6nUyuktVmmgrerG4m8Ix/Smnxr+obiG4eORF
	bHREQZU0o+dJNKDMhJTb2vav8/MyCdv9ohEAlQBzQsbzUDaC1wU/p4JtGdV/lg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Fri, 10 Apr 2026 15:10:46 +0200
Subject: [PATCH 4/4] webkitgtk: Remove escaping of the plus sign in
 `CVE_PRODUCT`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-fix-cpe-escaping-v1-4-ed63c2477f46@bootlin.com>
References: <20260410-fix-cpe-escaping-v1-0-ed63c2477f46@bootlin.com>
In-Reply-To: <20260410-fix-cpe-escaping-v1-0-ed63c2477f46@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
 peter.marko@siemens.com, stefano.tondo.ext@siemens.com, 
 jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 13:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235028

The `+` character is now properly escaped by `cve_check.cpe_escape()`

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.50.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb
index 941cbe930416..5d2c970b29e3 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb
@@ -25,7 +25,7 @@ inherit cmake pkgconfig gobject-introspection perlnative features_check upstream
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-CVE_PRODUCT = "webkitgtk webkitgtk\+"
+CVE_PRODUCT = "webkitgtk webkitgtk+"
 
 DEPENDS += " \
           ruby-native \

-- 
2.53.0


