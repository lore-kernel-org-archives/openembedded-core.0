Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2101.1792684180967186817
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 08:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P1aLzyMQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-156cbe59524so1615361c88.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 08:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792684180; x=1793288980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=svleNHfR0Ymj/xpnUbTcAbJqPvNsvqaBi5gcrkGg9Eo=;
        b=P1aLzyMQDXkqvZxu5eJ5Os37CMRrZbIr5EmOgdnaRF+MwrYlxLzb3dzYNUpEfwmoOC
         S0HQKLDpmrKMHzMkS65uZg/VNEnsiKGKXIGlJ0ePw943LE3qWHdt8eIWfSlOuI7tD0mn
         97aQXXWX13IlJ7XVNxUKNigxIb+62HFMQOlv45vHfkhTMvGvGPsgvHjyaGW9J8EtSd/n
         M12tXZLlCu+QzdozODQCDMmdXU88fpiO47Fwi2cliwQQMjii7YGLZrILjeB7+sPlOhMk
         0T7/40wu6TbqIghC4bCnjByY1gTDEbRRT4pUAzWEy9FPqsK+1YTQ8kIzHtiRsK7DsQRS
         PkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684180; x=1793288980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svleNHfR0Ymj/xpnUbTcAbJqPvNsvqaBi5gcrkGg9Eo=;
        b=BL+R6yyDrftjGUtpuV7qWNoY1UdDociCtN7nJN2fy9Jpzd3oMk1tc+rgE6BbMpdTLv
         wct72U7t/ZHG385bXHV7q/hZpOXZrS3e/nWn6DOpbkLRCytA5k4sAuSMweI+upDerUay
         TX+ZPgxekwbb8eMt07hHqtrNMmxsa+uQG9j9JtOJKdS8JwBCI3vLb7lAyFeEyu0o8L5K
         rF0prv9SS4YpkkNSgr12IkHc35LP0FTlOuTvYxDBvmF9l1TMw7vc9S8GSGtUWv0kKJk+
         EyeLyxBcg5xvG+iJ46ULgWwpXQ0MXBV/1wSkT+70BkGMoxp662zbPkdoWtMG4jEzqp2Q
         yYfw==
X-Gm-Message-State: AFq9FYLK5XAi+QW4jyKbQfQk28QS5M6JS1B23dSblw0aF7ziEcSUV/mp
	0zAI/x1ITN4Kh0rYkUUMvUTt6lPdd+QwqRBHjkZct81dSjG9wnVmOrJyJH19/gLPdIg=
X-Gm-Gg: AYBFou1WXIjIajdgVSOfIQSAFhED+CJ1HueHAAV+uLjRhY7krA0wI7EvwsgjDLZFd2Q
	lqryAzW2QxS3F99H+xO5O/9kDnHwgmO+DZF7mFoYXe3/yXgdlHna3X6WGsYmbLSTDx5mVUGI4jV
	PLF4mU2j8x6wo0rbuOVXjoVXGO/NqsyNALJ2DHLpux+HQJrc+sgOaICsiVAnmRLv7RvLzixybXY
	CaVMNWCNvkZ2Xdal7u6lbA3KUwLe49rEykPMMsJu5xwanV7Gb8MpTqzj8D1lVahsL7nzmoN3Qio
	eHjNIC4T+ACiQaa1fKcEHaeUOH1FJvzQGdvvsWJsxnwojwdcwvsDcolPWvYjUwN3TghL7DTGOOk
	zFHg+pEC8S626+zlw/a5VxOoHhcH9VfbMdFyh0GQ8/c31TJ1MpDSBjXZWRqR7wkOVGyVQcy7G0o
	7LgjpSNN1wt0usG7w4lp8EVmpV5byugaJnQe85BytLwcviTVCT902JF1DTbcsfSZLGYzGGkVoNr
	spCyTMILKi4QEjH3QI/lsG6JD/cIVjbYVbIN2cZpgz/uKaWK2P3oI6ZLF/N6vtTXO+8Rencg768
	fMT+RYQyvJssJYu5zH0WSlNssz50ZIXUV1Uq9/OHHqSewndcxDKb3eRwhttJwuVk3J4OdAOHUZY
	YL3QAWgPjruXQXa9V1Ygi9TF5YVhPYnUZLeAThlFNbcHhqM42nXE7ei6otO7Ldm4JxvfTaIP2nE
	vyhnIxFRZ1WsLJfiT6h1lct0VCvqkBmDhgFAv+N1Xzr0ODUcEKZI/pUPDrGUTm5xcY+3YZhP0EH
	OHhLWKW1SiUyRZhxfZW0bQzVd1FQdM=
X-Received: by 2002:a05:7022:3f08:b0:164:4e36:f956 with SMTP id a92af1059eb24-190a4c2035emr7252197c88.16.1792684180034;
        Thu, 22 Oct 2026 08:49:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d61csm15685226c88.15.2026.10.22.08.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:49:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] elfutils: Fix backtrace ptests on musl
Date: Thu, 22 Oct 2026 08:49:37 -0700
Message-ID: <20261022154937.1328672-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 15:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248451
Content-Type: text/plain; charset="utf-8"

musl is built with -fno-asynchronous-unwind-tables, so libc.so carries
almost no .eh_frame and its CFI only lives in .debug_frame. Without it the
unwinder cannot get out of abort () and run-backtrace-dwarf.sh fails with
"No DWARF information found". Add musl-dbg to the ptest dependencies, like
glibc-dbg for glibc.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.197.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.197.bb b/meta/recipes-devtools/elfutils/elfutils_0.197.bb
index 6e58afb274..b06505d520 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.197.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.197.bb
@@ -52,6 +52,7 @@ EXTRA_OECONF:append:class-target = " --disable-tests-rpath"
 EXTRA_OECONF:append:class-target:microblaze = " --disable-symbol-versioning"
 
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils glibc-dbg glibc-dev"
+RDEPENDS:${PN}-ptest:append:libc-musl = " musl-dbg"
 INSANE_SKIP:${PN}-ptest = "debug-deps dev-deps"
 
 do_compile_ptest() {
