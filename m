Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id CFF7677058
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 01:26:23 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id a20so3848137pag.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 17:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=O0/2riLfXl8dQeYWJkkWSERLTTBfmnBLWGdu7Bw0nRo=;
	b=NaFKPEi6hebCqDAk8WlcPINYRs+NNczMjTZuBNnMioJ5q33E9j23TWc0fmvxqj/E0m
	gvqqWFL5yFE/g7bk5Zqn9ppf24934KFRQwxEpDiV9Ze0KdiQidxxnOWLUGj4n98eQ+mS
	mnGWAeYpJlFX1q+QF8zPbNYKRCzwjbAQ4RgSsSzyOJISuiK6TECeVttQxfb3t39Pvw+F
	wCoRjC79XXVYZqzT+HirjWlZwf/3TLXAAM9rXNfTatou0CAeBf1yzHYFN5YZ08qlusjj
	PkOFmVNMuB3Hjtasw4EUi7+MRbH5FYwYAIm9o/++wtZuMJJiqYczTgiZPGnuaGn8K6BH
	aumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=O0/2riLfXl8dQeYWJkkWSERLTTBfmnBLWGdu7Bw0nRo=;
	b=QBKWAB2KwoRnFw6k0dpS//1H6a4IJSg3VbfxuRwa+xLBSZkX4tmExeiglA3DoXVo9K
	SvyI0yrc1o/g6bniDMUy9wfRwWlUt3yMMhiLFCOGFUEsccYeAyZfJ903esDUj/L0xbFW
	+P47fPEEyK/mQkyMRwbw9bEUhha87sw0dRP9q5mGuov1LyETigqbUyiPQIvSJRQQ8H+r
	jQHHGyTSigBG3QyNJHc82qIXDMmdKhEEFHSME66XHmqiFaWnIB2Yziq6M5H3S0zun7W+
	zNXKAFBUrkpsiIsgU6i38EZxz7VNgD1qh1rfjPoSPP/q/FC5m3jkpNGe/QmC2mrOofhl
	4jxg==
X-Gm-Message-State: AG10YOQwDTBpHqoTNDRzI+/+NStM+363JHHTIq0+9TwNl7tcr7k5rR1oKEtPItv2GmV+kA==
X-Received: by 10.67.1.164 with SMTP id bh4mr8778711pad.118.1453512384598;
	Fri, 22 Jan 2016 17:26:24 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	qz9sm12302299pab.39.2016.01.22.17.26.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 17:26:23 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2016 17:26:01 -0800
Message-Id: <1453512366-11405-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453512366-11405-1-git-send-email-armccurdy@gmail.com>
References: <1453512366-11405-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/7] sqlite3.inc: drop obsolete config_BUILD_CC, etc exports
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
X-List-Received-Date: Sat, 23 Jan 2016 01:26:25 -0000

These exports date back to 2007, when sqlite needed patching
in order to cross compile:

  http://git.openembedded.org/openembedded-core/commit/?id=4ffe8f6b1ff640722880cf2cd88990956de87e30

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/sqlite/sqlite3.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 7245285..ac19be9 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -12,14 +12,6 @@ PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline ncurses
 
 EXTRA_OECONF = "--enable-shared --enable-threadsafe --disable-editline"
 
-export config_BUILD_CC = "${BUILD_CC}"
-export config_BUILD_CFLAGS = "${BUILD_CFLAGS}"
-export config_BUILD_LIBS = "${BUILD_LDFLAGS}"
-export config_TARGET_CC = "${CC}"
-export config_TARGET_LINK = "${CCLD}"
-export config_TARGET_CFLAGS = "${CFLAGS}"
-export config_TARGET_LFLAGS = "${LDFLAGS}"
-
 # pread() is in POSIX.1-2001 so any reasonable system must surely support it
 BUILD_CFLAGS += "-DUSE_PREAD"
 TARGET_CFLAGS += "-DUSE_PREAD"
-- 
1.9.1


