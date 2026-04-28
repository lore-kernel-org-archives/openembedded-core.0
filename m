Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3B0FF885D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:54:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11588.1777377280478352217
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 04:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0J+mimbO;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E6F8D1A3471
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 11:54:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B649A601D0;
	Tue, 28 Apr 2026 11:54:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DF6F107286F4;
	Tue, 28 Apr 2026 13:54:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777377277; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=z8wz959hoq08eK0T8y19D0NoKMQkzOLLMGeKGfd0WkA=;
	b=0J+mimbOFo/ZBZAcbUz+SNszHa8/V82KNgX7IRaAcvuC0fFdv2RJKcR5TSR25o2aRDuDeU
	sAMLeknXZ6ehmfMiI1h2kLorvZTv4vVQLsTqO2Jdwkz74T/5r2ejqNs51cRTNLbh0zkgLK
	rN8Eec5aDRRZyb7b5hDAutWnKPe0AGmd7590MIVmTuIeIix0faWNmzoONkE5YyB2OJfxxe
	mLaxCeAnDjZ0j/LBpFxg7/LnNsdZzQvfohQl8CjwRAeiuH+7KR7IIDS9UpoCxYaGvN7db6
	kdaBs+Ap9LphMs1nYfXvqgkOscwkym+oK/LhIR+i4oYqG85ZmPwlB85FfDyMVg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 28 Apr 2026 13:54:27 +0200
Subject: [PATCH] mirrors: remove inactive sources.openembedded.org URLs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-remove-sources-openembedded-mirrors-v1-1-dbaea026dcdf@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCMBBG4auUWTvQhlqiVxEXafKrI6QpM7YIp
 Xc36vLbvLeRQQVG52YjxSomZaroDg3FR5juYEnV5Fo3tL3zrMhlBVtZNMK4zJiQR6SExFlUixq
 fMHgXwrH3HaiWZsVN3r/L5fq3LeMT8fVN075/AA5coVyHAAAA
X-Change-ID: 20260428-remove-sources-openembedded-mirrors-9e682aa5481e
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jose Quaresma <quaresma.jose@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=oC1CaSdVHiPparUGMHUpx6/QzAbCeB12PBvxz52oIl8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp8J/8y8+NGg79PVZnGMLlxNCgUg1O8RyYitw7t
 t+T58H6ufyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCafCf/AAKCRDRgEFAKaOo
 NujND/sHr8t6GTGVmK47Ol0CBkFlGEbky0c57EHEZ9O86RFpV1uNYHz86z/FBBb2gRLjS+G3/nu
 vEb3tQRgbrB91QaHRQ1S8dsu/xUHIqZrsL3qI7EPK7cbRmBoKWzltWDlZoAa3YSUcFKm2mXIU4f
 xS0G+w2G2748oKDKl3ArgWSmKIMaBZEaQ7bjN8Nsl9JGEurlXcC01Oy44Rb0gOx+ojyvwg5ydIo
 185P3RJbNKJd/8VfssnsbAZEM77p2F2fGm66vnoTWkiEznvnQ9lYQb0dsY6oxr+gOe5r1D6wIUq
 kyTzwdaJvcJejqojcs99DkkWRTuuq1eHIJO5udjlgDlOfviEv9PBJyieP7cUjYwTsLyT/GnVYC1
 ykOKISlr8uCRc4NeIVMyxwOUkjvoGmD8stUkLRrnSUepN9upMjxzE3xykI9Uh2KKlz11bBVIZO1
 dZJ4YkWyaMHiOW62xLoO6UJC4/ewyBxeZ4zPiJ5Ct0nvZKfGRPc6ND2yWmFrpU7Nzp+H3LiIjj7
 NmuoMhbQzLcm5zPYhZqPe63stpfCMaVMW+u9h7AUkDlHsHwc8xr+VmiaBzILNzBP3lwmtPbtD4V
 JDdQnRYghlJEiiSOaJnzGo6FjThkqHJ/69b9rpiACvN4Y2feCBckYJPCxQoHlQMqEBXvPI5Xv4Q
 f4JrSJ/agIepZHQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 11:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236056

It was confirmed these mirrors were inactive in [1]. Remove them.

[1]: https://lore.kernel.org/r/b9c4ddd5ae72ae21ee0b6e12fb1a1f63661c685c.camel@linuxfoundation.org

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Note: based on current master-next.
---
 meta/classes-global/mirrors.bbclass | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index c6092a6f41f..50db29ae3a2 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -36,13 +36,6 @@ hg://.*/.*      https://downloads.yoctoproject.org/mirror/sources/ \
 https?://.*/.*  https://downloads.yoctoproject.org/mirror/sources/ \
 ftp://.*/.*     https://downloads.yoctoproject.org/mirror/sources/ \
 npm://.*/?.*    https://downloads.yoctoproject.org/mirror/sources/ \
-svn://.*/.*     http://sources.openembedded.org/ \
-git://.*/.*     http://sources.openembedded.org/ \
-gitsm://.*/.*   http://sources.openembedded.org/ \
-hg://.*/.*      http://sources.openembedded.org/ \
-https?://.*/.*  http://sources.openembedded.org/ \
-ftp://.*/.*     http://sources.openembedded.org/ \
-npm://.*/?.*    http://sources.openembedded.org/ \
 ${CPAN_MIRROR}  https://cpan.metacpan.org/ \
 https?://downloads.yoctoproject.org/releases/uninative/ https://mirrors.edge.kernel.org/yocto/uninative/ \
 https?://downloads.yoctoproject.org/mirror/sources/ https://mirrors.edge.kernel.org/yocto-sources/ \

---
base-commit: 04b4e3b64e02cfbb7e2bfce167a0a81329bb7bae
change-id: 20260428-remove-sources-openembedded-mirrors-9e682aa5481e


