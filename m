Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 33756774FC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:34:01 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id u36so465447pgn.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=leVaudeD9Jqcjo2efPXofvQeqHjuwhreJH3HDnkpfxg=;
	b=WFmMDLe9Tgn7FBbHnf+IwXEi5EiZsyOJB87EH8p3clGr0maKTGCAjrZbeBwVXKd1wI
	ETnZYjCLwkWVcwGR4yHkSGle4Pr3szz6Jz2Iv2N90vVZnnNrYkuA22p9MlBxnrMz3D66
	xzbds64LYwBsn9ahUEUxFHZA8u8bXHT2/MnzmGca/tghumdmbdHxdkiQS6ogx/eWfupH
	dcBA8Hp4FxXCOAOp5lkFn/qZEpqUNrNUiVKpDMf4NUDf+zhMN7RFpYFVazIimX/w7pkw
	wvVYBvDfyx496MxOMEZHsonzoCM/hFgIPZPbhI/uE1HtrrpUH3svJrO1A1COP3nfTKZ9
	ayDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=leVaudeD9Jqcjo2efPXofvQeqHjuwhreJH3HDnkpfxg=;
	b=W/0QJVq5E6S6lSqER2pQhBsIsqJ9h9Za7URa01SGUIhtWjfkyOOM0XYCiLCV+bxzAZ
	piJbCn+Udh+7pNZ9u1x7gf2cmPRC3PgXOaHoSnNJFRN5PkePRST6uRejGPhr01H3LgUd
	Ie2tLY/7JGtXpnz24HnPjoCTc7YGTUCL4L7Wxvwdxw16tmwDRl69j9xfJDUqf4aVcAaY
	lUjpnVaMjnQnxMkQBvP0pTrXs+qzwN9MA1ONVRuSUkf9Mig8/fy2y4wxUVAiNFcsghVr
	Utx1CF8/EPEg0Dm7sOF74qFhb5+tGEOrl0Bx2HDQSz91NKqpRoPDJqEMZgT6d0Qx7Dmr
	vhkQ==
X-Gm-Message-State: AIVw1112+ocMZM1ou9SjI1B6KEkijICXRCw/jAEGk9KW5WsIQJzwsX5h
	KqQ2GopL15/Lyjhk
X-Received: by 10.84.130.40 with SMTP id 37mr27389902plc.291.1499351642559;
	Thu, 06 Jul 2017 07:34:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.34.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:34:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:19 -0700
Message-Id: <d69de21e9a0cb388bfd924779f4455b56be6585a.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
Subject: [PATCH 18/22] world-broken.inc: Remove packages which are now buildable on musl
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
X-List-Received-Date: Thu, 06 Jul 2017 14:34:01 -0000

Delete the pinnings which are no longer required during world builds
becasue they have been fixed to build on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/world-broken.inc | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/meta/conf/distro/include/world-broken.inc b/meta/conf/distro/include/world-broken.inc
index d4bdddfcfe..49e9516d53 100644
--- a/meta/conf/distro/include/world-broken.inc
+++ b/meta/conf/distro/include/world-broken.inc
@@ -7,28 +7,14 @@ EXCLUDE_FROM_WORLD_pn-rt-tests_libc-musl = "1"
 
 # error: no member named 'sin_port' in 'struct sockaddr_in6'
 # this is due to libtirpc using ipv6 but portmap rpc expecting ipv4
-EXCLUDE_FROM_WORLD_pn-portmap_libc-musl = "1"
 EXCLUDE_FROM_WORLD_pn-unfs3_libc-musl = "1"
 
 # error: use of undeclared identifier '_STAT_VER'
 EXCLUDE_FROM_WORLD_pn-pseudo_libc-musl = "1"
 
-# error: Need to implement custom I/O
-EXCLUDE_FROM_WORLD_pn-libsolv_libc-musl = "1"
-
-# undefined reference to `pthread_tryjoin_np'
-EXCLUDE_FROM_WORLD_pn-btrfs-tools_libc-musl = "1"
-
 # error: error.h: No such file or directory
 EXCLUDE_FROM_WORLD_pn-prelink_libc-musl = "1"
 
-# error: use of undeclared identifier 'O_CREAT'
-EXCLUDE_FROM_WORLD_pn-libbsd_libc-musl = "1"
-
-# error: expected declaration specifiers before '__nonnull'
-EXCLUDE_FROM_WORLD_pn-lttng-ust_libc-musl = "1"
-EXCLUDE_FROM_WORLD_pn-lttng-tools_libc-musl = "1"
-
 # error: obstack.h: No such file or directory
 EXCLUDE_FROM_WORLD_pn-systemtap_libc-musl = "1"
 EXCLUDE_FROM_WORLD_pn-systemtap-uprobes_libc-musl = "1"
@@ -37,20 +23,9 @@ EXCLUDE_FROM_WORLD_pn-systemtap-uprobes_libc-musl = "1"
 #            void (*_function)(sigval_t);
 EXCLUDE_FROM_WORLD_pn-qemu_libc-musl = "1"
 
-# glibc specific funcrions
-# error: storage size of 'mi' isn't known struct mallinfo mi
-EXCLUDE_FROM_WORLD_pn-valgrind_libc-musl = "1"
-
 # error: format '%s' expects argument of type 'char *', but argument 4 has type 'int' [-Werror=format=]
 #   snprintf(buf, size, "%s", strerror_r(err, sbuf, sizeof(sbuf)));
 EXCLUDE_FROM_WORLD_pn-perf_libc-musl = "1"
 
 # error: 'RTLD_NEXT' was not declared in this scope
 EXCLUDE_FROM_WORLD_pn-gcc-sanitizers_libc-musl = "1"
-
-# gcc fails to build when libuwind is staged before building gcc since
-# it then finds the unwind.h header from libunwind and not from libgcc
-# and on arm specially they are different since libgcc defines some functions
-# as macros which are functions in libunwind and it fails during linking
-# libbacktrace/backtrace.c:76: undefined reference to `_Unwind_GetIP'
-EXCLUDE_FROM_WORLD_pn-libunwind_libc-musl_arm = "1"
-- 
2.13.2


