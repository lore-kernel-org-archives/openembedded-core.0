Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4E3CA5FE5
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:36:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6167.1790926592308443766
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=t8LEM8Q9;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 93E634E4110A
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:36:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69B8C603DC
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:36:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50F581032846C;
	Fri,  2 Oct 2026 09:36:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790926589; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d8ayyHWeWEXfS1vl7nPcPdw4FCltFf6rHxIiYJ6Ro5w=;
	b=t8LEM8Q9+ApYOHGwmw6cpbnMn9yr3V9mJl38GqLkv1qFDghgKnb/zbNPp5E+YrYePmBsbh
	z5G0RxvNIdOLuIgkoFiqZn8YW463KvHJr1ZwJE49jBBdLnDJ5dKsf8gEK2ykKsLDiscymM
	29NcFdCRB+7bikq7nI7C+VmNMzVA5YZ0uAUMWBgUS+Jr9O4e7a/ZK+aIVravfJgihWWONS
	Wl4SQFpoujlfIamWnO4NxhP6ZqeUl9cQUGuPy9WZcUSaajDKhTOPvm3Y1zAPeOVkmM5txt
	LAeBRQ+BWhoJ6p/t7yEz+0Wa+BZGQyWEy8bjipqTX/OXoVWXJ2Xlyl7r8H45dg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 02 Oct 2026 09:36:10 +0200
Subject: [PATCH 7/9] libmd: upgrade 1.2.0 -> 1.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-mathieu-2026-10-01-upgrades-v1-7-3fdeab391403@bootlin.com>
References: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
In-Reply-To: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790926581; l=1103;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=yk53iLcLcsEZ71JreZx3IN/TH9R+izBg2rjfhxNC7Cw=;
 b=dOUkC96lQcU6m5NsgmWl1mMaAEJSpVWbKnwqtxmWJV3X+Xfw05poh4L3CWYiRvf9e2o5viJNf
 33K8LO9rzjZCgtAPMmKrnUw3ooSDe/J1fnifF6IuhsMRn/mWTDjZBR5
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247080

This release adds support for SHA-512/224 functions, improves the
libmd(7) man page, and the project CI.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-support/libmd/{libmd_1.2.0.bb => libmd_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libmd/libmd_1.2.0.bb b/meta/recipes-support/libmd/libmd_1.3.0.bb
similarity index 91%
rename from meta/recipes-support/libmd/libmd_1.2.0.bb
rename to meta/recipes-support/libmd/libmd_1.3.0.bb
index b630708961f7..bed90807f24f 100644
--- a/meta/recipes-support/libmd/libmd_1.2.0.bb
+++ b/meta/recipes-support/libmd/libmd_1.3.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=261bf22602270e2b29c53930d409a3ca"
 SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz \
 	   file://run-ptest \
 "
-SRC_URI[sha256sum] = "ac15ffb8430502fbaccdec66c5a82ee0eab0b0f36220df56710feadfeb13d0a0"
+SRC_URI[sha256sum] = "fc0f1eb6b6766470326f2c014693809190e67dba84274a6fbae9d4912d066706"
 
 inherit autotools ptest
 

-- 
2.47.3


