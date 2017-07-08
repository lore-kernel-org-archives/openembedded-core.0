Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id CCC8577FA6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jul 2017 13:34:47 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id q85so8249864pfq.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jul 2017 06:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=leVaudeD9Jqcjo2efPXofvQeqHjuwhreJH3HDnkpfxg=;
	b=nubTUVI7oTZ9WVGp4OHQYieTT6H9G/mW0Oc/abPN2iWMd3e5CVfbAEONlLN2e8a1lu
	/sXXuM6ZWpJ27ejGiKicgfMA3kWB5msidEUmOkmxaGVPlWE9TlSvb55IKq5p+t8/sbLI
	COXYURk5Qts4aPbp7FX9sxlaqrcl9R0oC+mIAC6ufvdi5ZeCNnO/RNziIkhM7jxjK74G
	Tp+A7qZEWRZTfhY2QGItXn9eu2Pl2+ORi2AG7M7H1H4DCCjVCpeJsteZUHQqbb5AiLki
	1R1zTsrNmPiiQgsJLvPkSWO0St6bpqn2u4+Pjn6K769MM+j8LVyknHHapek6Pk7sdu/1
	3YNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=leVaudeD9Jqcjo2efPXofvQeqHjuwhreJH3HDnkpfxg=;
	b=coki74IKHtUMkDS3D2dqB1nFT3wvKjVjcMJ2RRfs+wfq/bX+EG3pZ6O4nWRneYVLcN
	0ptTNa8GCSDiwUyzdG1LZ/OxC7m3DcbcdSsxqJlPqWKRIiK4sOpQDbSKZ+xz3EwGjwAm
	ydHHagP9o07o0sqq5AeAf2pCjwDUaneRTItAQUDpEcMMax58OnG6EKe6DhZSuXe/rlic
	I2eQRDIX9LRrE+giHEx66Juqb3bYNVkMOu2+6w9cqUOJ6dxY1rHj+CD7YHJkMPyLH2Ri
	SjYboXM3rfMRK3zgL4LyOg+mA4MHT9afLor1stX1aHQrFYTCdQKwXLTPqC4A/FOmXbE0
	AarQ==
X-Gm-Message-State: AIVw1114uHj4hFOMmxJOa2FGRmoyrFcjlkyq8IA6HlO7huOJc/hmEuyH
	e7pFsnSUEU/uJR+b
X-Received: by 10.98.158.29 with SMTP id s29mr37128597pfd.126.1499520889140;
	Sat, 08 Jul 2017 06:34:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	i27sm15575561pfi.82.2017.07.08.06.34.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 06:34:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Jul 2017 06:34:27 -0700
Message-Id: <b594dfe5f67cf82c42c8625cbee5abc455657c61.1499520469.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499520469.git.raj.khem@gmail.com>
References: <cover.1499520469.git.raj.khem@gmail.com>
Subject: [PATCH 08/10] world-broken.inc: Remove packages which are now buildable on musl
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
X-List-Received-Date: Sat, 08 Jul 2017 13:34:47 -0000

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


