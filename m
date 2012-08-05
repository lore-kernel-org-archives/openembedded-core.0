Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SxxGE-0000rc-Dz
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 11:36:34 +0200
Received: by wgbdr1 with SMTP id dr1so1609597wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 02:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KodsOOzWhj3Xb6LqIYHmwdNpmm78lzFN+mcxh+1CFDc=;
	b=abCPH/nkJQ0Ny9X1peWS6V8/ZGYJ4FiL9XMDC4yV9hiERM5MJEZR9PaJ/kYNAtfjH/
	0NlawnLSPAw+T1T4jkwXhmeKOkc920LzqDRWrGJobHhHsm4RSNX8kczBdmhYtufWa7xx
	iVU7POJ/mrvJSBHmYx4/vcNdcp7/dL5DpI4axvF3ysLgT5QsA8yaqkjyjkUTkV1xOm7+
	JUgamVh8AkaubivG+gvU0f5aQZ9lCNLpln9MCip6QAIY/iMFfzdaYJxhmBcUwNy//+ib
	W6igIArmBg1MGwVclPzc6A6oHk4AG2etKPp10plJqjkrpGbF46BdcWlTK4ZCDoXNu4Y1
	bzHw==
Received: by 10.217.3.7 with SMTP id q7mr4085088wes.47.1344158691329;
	Sun, 05 Aug 2012 02:24:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h9sm8401218wiz.1.2012.08.05.02.24.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 02:24:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Aug 2012 11:24:44 +0200
Message-Id: <1344158684-4745-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] eglibc-locale: bump PR after fc4b138948656d482603b80f8c8e86fdbb185df4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Aug 2012 09:36:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-locale.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index c08e38d..d6bdcb5 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -27,7 +27,7 @@ BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips mips64"
 # set "0" for qemu emulation of native localedef for locale generation
 LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
 
-PR = "r21"
+PR = "r22"
 
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
-- 
1.7.8.6



