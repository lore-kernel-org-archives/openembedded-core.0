Return-Path: <tom.rini@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 18A096BA0E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 00:25:52 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id n6so8668544qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Mar 2019 17:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=S31C/B2EpFgQTurobH9FmfyxFkdE+ZtYdlzzGEDHg4E=;
	b=Fv7YcLXowiJ8sFjg8oHissBmfaMTBSyelOsJe9sFMgV3NFaqozS5FB5P3UY7mcflNq
	YMCOcTT1Cho/Kx7IKCwsMDksLM4w+XOv5g8Y3iaEpwIfem19xiQ6hb+H8FXoaUx40g8Q
	XJ6tv4nyjSRtdjXDQx/cMjmzaUrG3MOHWjO5M2rX9PisOevguD1b1YbTBrz8vOpo8v9H
	ueMB2QXV9wD5WeLZfmxz0fshPDLmm2ZX/loiMXBfLMpDOVSWHgclAnGOnHQ/fuvge0Ht
	yUYmQJD87N6kU1Xc++3fzZWvf87YjuEEcepbR76B+7md7vmgjgrgZ3ile51ChuhATQiy
	w+YA==
X-Gm-Message-State: APjAAAV57yKGKSasb47WQe9i5vVuJVbkowZzWLpspGjqPOShVJ2O8NKW
	ymThsJw9pKsu0ivg8YE5xN5e/Jk=
X-Google-Smtp-Source: APXvYqw7JorA5Yc2QU6HzzHLnbVDumVLAoDDLhMpsb2hMCtCeE67LBPFwRRZpbAk4vlBnoUeLuwBKg==
X-Received: by 2002:ae9:e913:: with SMTP id x19mr11095714qkf.45.1552868752864; 
	Sun, 17 Mar 2019 17:25:52 -0700 (PDT)
Received: from bill-the-cat.local (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105]) by smtp.gmail.com with ESMTPSA id
	g65sm5027792qkf.52.2019.03.17.17.25.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Mar 2019 17:25:51 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Mar 2019 20:25:48 -0400
Message-Id: <1552868748-24893-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Cc: Wenzong Fan <wenzong.fan@windriver.com>
Subject: [PATCH 1/1] vim: Update to 8.1.1017
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
X-List-Received-Date: Mon, 18 Mar 2019 00:25:53 -0000

The most current release of vim is now 8.1.1017.  The only problem
currently is that the disable_acl_header patch is still not upstream.

Cc: Wenzong Fan <wenzong.fan@windriver.com>
Cc: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/recipes-support/vim/files/disable_acl_header_check.patch     | 8 ++++----
 .../vim/{vim-tiny_8.1.0347.bb => vim-tiny_8.1.1017.bb}            | 0
 meta/recipes-support/vim/{vim_8.1.0347.bb => vim_8.1.1017.bb}     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/vim/{vim-tiny_8.1.0347.bb => vim-tiny_8.1.1017.bb} (100%)
 rename meta/recipes-support/vim/{vim_8.1.0347.bb => vim_8.1.1017.bb} (98%)

diff --git a/meta/recipes-support/vim/files/disable_acl_header_check.patch b/meta/recipes-support/vim/files/disable_acl_header_check.patch
index 4720003c252a..33089162b4b4 100644
--- a/meta/recipes-support/vim/files/disable_acl_header_check.patch
+++ b/meta/recipes-support/vim/files/disable_acl_header_check.patch
@@ -14,19 +14,19 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/configure.ac b/src/configure.ac
-index 107c170..0ee86ad 100644
+index 2d409b3ca06a..dbcaf6140263 100644
 --- a/src/configure.ac
 +++ b/src/configure.ac
-@@ -3220,7 +3220,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h string.h \
+@@ -3257,7 +3257,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h string.h \
  	sys/systeminfo.h locale.h sys/stream.h termios.h \
  	libc.h sys/statfs.h poll.h sys/poll.h pwd.h \
- 	utime.h sys/param.h libintl.h libgen.h \
+ 	utime.h sys/param.h sys/ptms.h libintl.h libgen.h \
 -	util/debug.h util/msg18n.h frame.h sys/acl.h \
 +	util/debug.h util/msg18n.h frame.h \
  	sys/access.h sys/sysinfo.h wchar.h wctype.h)
  
  dnl sys/ptem.h depends on sys/stream.h on Solaris
-@@ -3848,6 +3848,7 @@ AC_ARG_ENABLE(acl,
+@@ -3886,6 +3886,7 @@ AC_ARG_ENABLE(acl,
  	, [enable_acl="yes"])
  if test "$enable_acl" = "yes"; then
    AC_MSG_RESULT(no)
diff --git a/meta/recipes-support/vim/vim-tiny_8.1.0347.bb b/meta/recipes-support/vim/vim-tiny_8.1.1017.bb
similarity index 100%
rename from meta/recipes-support/vim/vim-tiny_8.1.0347.bb
rename to meta/recipes-support/vim/vim-tiny_8.1.1017.bb
diff --git a/meta/recipes-support/vim/vim_8.1.0347.bb b/meta/recipes-support/vim/vim_8.1.1017.bb
similarity index 98%
rename from meta/recipes-support/vim/vim_8.1.0347.bb
rename to meta/recipes-support/vim/vim_8.1.1017.bb
index 1c41caaf1068..7627d2844b79 100644
--- a/meta/recipes-support/vim/vim_8.1.0347.bb
+++ b/meta/recipes-support/vim/vim_8.1.1017.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
            file://0001-src-Makefile-improve-reproducibility.patch;patchdir=.. \
 "
-SRCREV = "f1c118be93184e8e57e3e80b1b3383f464ed649e"
+SRCREV = "493fbe4abee660d30b4f2aef87b754b0a720213c"
 
 S = "${WORKDIR}/git/src"
 
-- 
2.7.4


