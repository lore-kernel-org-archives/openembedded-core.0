Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 97A487CD25
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 03:21:22 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id k2so10758557plt.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 19:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=D6fqh/fIl4r0ULGQ24EfCxZlOQPyOqC0KWFun4/Orsc=;
	b=t0l+97u8JNJSxComV4C0YjeS014ougvppHTSS/ubky9PSL/TPqr/GsmFnizGf+0N5i
	B/ft3wDObapZ/FXc7jgy2i2yI9BZ9+DoKxb8iuXicIY7DZnSm8UJ/NsdfJESOr2EisJ6
	veXE0GEligZHptYC8Z5kZ4eUypXGKNIA/Usps2hmVkzGXUhIHmStHXsIO8rYL1PYjd3l
	crFhjxpiaLpveo9FIOYu5c30+ouC0E7fhMG8Zyd2tAj5ZfgJnYgBCzCWuUSBP9Km7xWN
	U9QsFxvpINoS+k7C6wcZwI38uGAfZ1zwhRzkByYvup7BU1g5JG1QAVt04uJB68cbrRIY
	cn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=D6fqh/fIl4r0ULGQ24EfCxZlOQPyOqC0KWFun4/Orsc=;
	b=RosHOvEm+fupCkNE6nyg8qHycGTy+4jzX4QS7eRKDjZ9KvvsD7TKLr6m2fi048If46
	xViqNN55E6PHFrUf5vYtnOoG9t5vfz/1fnXapgsEb02cPyPzNabciqTgUn7q7BuumYHE
	wIzBJ9AFAMFTOSMipAuNkM6d7Te/TZBwenu6WQ1CuI5CHyL4YHg1QUMncviKBbSZkVj1
	SY9ZwBWGB25TEPHT15w+qmXYpBnXg7/PpMoTuiit/AumG3e6NKKjl4ApM1HFJW/7W7qd
	1rw9giDWZgtcz4Qw3Fch8sIas932oQcG3Qymttd+n2aO4okpeeAIIZQcQOGok/7cUIS3
	QWqw==
X-Gm-Message-State: APjAAAVhXQ8AXmUTUMttQPTCiLUNMRL15RV/7gpbRt0wFCvNCEWdEwzI
	74Q0cdc++CfBicAimZjN6qGADtic
X-Google-Smtp-Source: APXvYqwBXjxAE4KxEPa5bkvmQQH2JqSA+xa8wNTqsSQOdr6Y1+6bOtuRwORfdFD/5Az9EU2dt/OeGQ==
X-Received: by 2002:a17:902:6686:: with SMTP id
	e6mr3099625plk.208.1551410483318; 
	Thu, 28 Feb 2019 19:21:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5fa3])
	by smtp.gmail.com with ESMTPSA id
	z127sm37612096pfb.80.2019.02.28.19.21.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 19:21:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 19:21:10 -0800
Message-Id: <20190301032112.38191-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190301032112.38191-1-raj.khem@gmail.com>
References: <20190301032112.38191-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] bitbake.conf: Drop -fno-omit-frame-pointer
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
X-List-Received-Date: Fri, 01 Mar 2019 03:21:22 -0000
Content-Transfer-Encoding: 8bit

Let -Og decide the best debugging experience

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf       | 4 ++--
 meta/conf/documentation.conf | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 85aab98462..f1540a0acf 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -610,10 +610,10 @@ DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
 
 # Disabled until the option works properly -feliminate-dwarf2-dups
 FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
-DEBUG_OPTIMIZATION = "-Og -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
+DEBUG_OPTIMIZATION = "-Og ${DEBUG_FLAGS} -pipe"
 SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
 SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
-BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g -feliminate-unused-debug-types -fno-omit-frame-pointer', '-O2', d)} -pipe"
+BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g -feliminate-unused-debug-types', '-O2', d)} -pipe"
 BUILD_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
 
 ##################################################################
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index c2c96ecf1e..550df20b0f 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -125,7 +125,7 @@ D[doc] = "The destination directory."
 DATE[doc] = "The date the build was started using YMD format."
 DATETIME[doc] = "The date and time the build was started."
 DEBUG_BUILD[doc] = "Specifies to build packages with debugging information. This influences the value of the SELECTED_OPTIMIZATION variable."
-DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-Og -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe'."
+DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-Og ${DEBUG_FLAGS} -pipe'."
 DEFAULT_PREFERENCE[doc] = "Specifies a weak bias for recipe selection priority."
 DEPENDS[doc] = "Lists a recipe's build-time dependencies (i.e. other recipe files)."
 DEPLOY_DIR[doc] = "Points to the general area that the OpenEmbedded build system uses to place images, packages, SDKs and other output files that are ready to be used outside of the build system."
-- 
2.21.0


