Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id AFA846C10C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 22:59:05 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b85so9673615pfc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 14:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Xblh5L1YIiQ/az5mw7XjGXMu5bxepklJGkyDptX9088=;
	b=PL/NPkgLw91i5foE43+uvi20kkyC1wTZoH3PDoSJZ0Udi8THAk9TfzkQVmMFm6qfHt
	Nk3Pu15YKwjjl3k8YwlgBx8+yYa7N+R/IRfGn+l6IGHgfEbGJKTgGV9k4vT+DfGpKiQB
	Hgu3GuCkyOpmDHEp1A30JlSMS6HshZOibFtwo9ctz1EqvvNzYeiD1zA8AbLxCdGrA36V
	1Ef+4e0PR7FLRdhxPPJbRK98jNakA4HnY3fQk7cQkHAjKumjOnbWJkWZ97qEHGTwZ6Ie
	uVwzrg1f5VHlGkK6+ZZfuEHywiK0WNXz8Ba2mhXtzoVJjqHenHRFMLbciY1O7Kvp+28k
	rkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Xblh5L1YIiQ/az5mw7XjGXMu5bxepklJGkyDptX9088=;
	b=WXWTlyzka1bcFjIv9/XVFq1mdBBCFlMESRJFkmSzH4ac7DSQ5cRUPXPVoeoK0tGVXz
	cTqnPEadoQYu9cAER4u0kA3nN0jRpZEkmo45K0IylCgr8Ohxd3N59JL22F2hDpEvD9Ix
	eGWXzfuJO9wCbmseudTSuhSgIWI7Om7lSpvmbPqjo1ewYlezakye3RQvu+B6TQ6c5yw2
	DMpCRh15vGx3JBrN92jlkN1OjNAiKmwRlLYai5mk7S7YEHVfKRXzdPt845MEakb3xZuw
	FsLJ6yx7qWiDokoIZ3IDyAnYcLrfGgXXHMzrx1o0HuitKCATUY/LI8+ygZdoX9Y4H3k7
	9W8A==
X-Gm-Message-State: AJcUukfnT68fFWXL4g6R7m8YxHIgKT+fHlbcVb7JLw6BcBGnGIy80T+y
	8AIijbZSD+lnYgGfXuo20PLvtFMiyb0=
X-Google-Smtp-Source: ALg8bN4DGgxdyogAeCEyh8Ix8oShrUGHfjk6eYkp4Vm33PxsA41NP/S2QtaYPrUpQk6Jhdhwilho2Q==
X-Received: by 2002:a63:fc05:: with SMTP id j5mr24634448pgi.434.1545951546300; 
	Thu, 27 Dec 2018 14:59:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	([2601:646:877f:9499:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	s79sm63386070pgs.50.2018.12.27.14.59.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Dec 2018 14:59:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Dec 2018 14:58:52 -0800
Message-Id: <20181227225852.32143-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gdb-cross-canadian: Add bison-native for gdb-cross-canadian
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
X-List-Received-Date: Thu, 27 Dec 2018 22:59:05 -0000
Content-Transfer-Encoding: 8bit

From: pino-kim <sungwon.pino@gmail.com>

This fixes RISC-V gdb-cross-canadian cross compile configure failure on missing bison.

Signed-off-by: pino-kim <sungwon.pino@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 475e4f08ef..e54766bbb2 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -6,7 +6,8 @@ PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gdb"
 
 DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext \
-           virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-libc"
+           virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk \
+           virtual/nativesdk-libc bison-native"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 
-- 
2.20.1


