Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id D55C77318B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 06:23:22 +0000 (UTC)
Received: by qgz52 with SMTP id 52so56394683qgz.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Dec 2015 22:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=HpmGBeWfpRmX/DvC1fwmGR+X9sLdcgyLr6uiJdq8/cY=;
	b=tEPj5pV6KZ8FDg9Jrd3EdvyUjCtt9IeKThj27ASExuvzvSEer2tfUYlGWnPSNwnH5+
	NYFa/m/roDhAJbJRQ4/f1O/1qrHWttdU3byudA5sigpD0qzvzKN8Abb9qrTF63Dj2Z5O
	byruLuJA9ALkdmCMZO2zlmpoZWNe6MFIG7seOxJeEhzJ8YNVGvMYy6hJHczmtL2Lc4Xw
	sKL1dcjwJaT4lO97zI4vrI1WWOj+8mAN3NmnaxN6ZrdxtYMN6bGcbjL/r9A9/6fOomJ6
	zYo2j9TWZpo2NM9SHWP00Sq913Fx1dpcrx+xVMcPQWKeI3iDbAWNSOPg8SOB6MZWFdfP
	XTPQ==
X-Received: by 10.140.133.145 with SMTP id 139mr33091309qhf.0.1450074203401;
	Sun, 13 Dec 2015 22:23:23 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	s105sm13252860qge.40.2015.12.13.22.23.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Dec 2015 22:23:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 06:23:13 +0000
Message-Id: <d9f5c0f9918163a8149c6bc155542b101d424e19.1450073907.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <a2dd5384b2607cf7e507cf280addd31ee6df2391.1450073907.git.raj.khem@gmail.com>
References: <a2dd5384b2607cf7e507cf280addd31ee6df2391.1450073907.git.raj.khem@gmail.com>
In-Reply-To: <cover.1450073907.git.raj.khem@gmail.com>
References: <cover.1450073907.git.raj.khem@gmail.com>
Subject: [PATCH 6/6] musl: Update to latest 1.1.12 release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Dec 2015 06:23:23 -0000

point to maintained github mirror in comments

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 1feb436..051d925 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,11 +3,11 @@
 
 require musl.inc
 
-SRCREV = "6c5cad2aa56745302c1d42d2c8baf6424d29c0f3"
+SRCREV = "3abb094d19ca4c7c4adcf373d971fb5aa05c5252"
 
-PV = "1.1.11+git${SRCPV}"
+PV = "1.1.12+git${SRCPV}"
 
-# mirror is at git://github.com/bminor/musl.git
+# mirror is at git://github.com/kraj/musl.git
 
 SRC_URI = "git://git.musl-libc.org/musl \
           "
-- 
2.6.4


