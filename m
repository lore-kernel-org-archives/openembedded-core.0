Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.91.1795101860446653509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=oPpbUZE5;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b467581b98so28332765e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101859; x=1795706659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MzxnyjtxcFd1OM1gIjBP4I9HdDkZqUrRumcy47Cx0X4=;
        b=oPpbUZE5tuCQ8py9pZVQvXzQcJy00CwNx9J5U2UoSIJOtEhZ1qTW8V79SUZ06+Rb+m
         /+hV2EXZ8Hh8l3ssqCglIO1iSwQL6ONp/ZecspogEVJ/jr+j1pMdvgBgZdoHaGVqn1DB
         eTLnPewFUXPGg5Vq65Iqb89FdiPC+mg+AZMzuScwn9/eoWLMY5VYsw2rbAFkR0zZXsat
         jYwPUqdJuvf7Pkyf1qe8KVyfuoyCHoBW8GIMriPc5SMrpfhlo7E9J3qKrZ+yuZYV4ewY
         CtNEIKdBaf/75QPq1KD9vqD89R2b3zlZOTMt4tDvUOklUfgALppSWli18oUF+8tF4BOE
         /vhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101859; x=1795706659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MzxnyjtxcFd1OM1gIjBP4I9HdDkZqUrRumcy47Cx0X4=;
        b=xCEAKtt23s/xmsYZHTLZIwHAcZN9RcB/OkdcoY2UMOO0tsRVWK56BovQHHMrcIDrKn
         cjGG02XOLJ7AZAzReZePm/zlMmENqCi5hMv6AS959fCZvqc9IqMDPTZMHf4lQZbMYYpF
         f7/bRL2HXYgVJXF1YFPoUxZIlSkFwsV0Dwnrf5gwIh/fLAss9q8zM20tgfDAOLFbxwIJ
         ThGGhWr+OLrYR4WcCQPyZ9EBV5OhzWzNbHEL6zDCf50peFXBqYy5wx6072pwy5Lq3W4V
         B/M30lWdncDxv3N92gicHB7CibcCQbxfCf1SPm50O1Abj6HVM8jrUgTdiyNV+g1+6is9
         DYaw==
X-Gm-Message-State: APuU4Z8ZaON3ddNPgMnntwJM8vrhLjEgjKp/RFG72HGVSj6xWeiqfZg3
	DSfhmiyfPhSbu2AcCsSks0SmXftghMZhhMXcwKKQrFIknhkI4NpTlRCtApQEMZ35tLUhDd+gAfA
	Y8kk64KI=
X-Gm-Gg: AYBFou3sx9jCteka4nUV2TewKPzrRVppxF30vAqq1e57UN1k07xUNtH9rMQ9YPLsLp3
	a0mIWm17/mh4w2NqiBTLutsl7RjGdSIB+tYMWvAtAV/AKgZb23HzPucEFbv81xmmZrINePMdpr5
	HxV/yX4QOAWmQE6BsP67I8T9sYBry7QFMTmixQKF9Nz5KT6LVsFVAboMNozYQBdV3sNDK44wkvt
	lDfKmNDnP2dsZVSqK0O99pyd1vfVbwNDw4UM552ynbxCgP2oGvTJWFNXYh1RSs99a6A+Ylx+xyc
	BFJTW3iU4B0hulkpqemnnfPu5x9y240YLKLnoi8xcWkjVjGtuDg9ZZKzNb/iA512qgin8PDtgEr
	5iCDS8JMxXK3wQjeD+q94wm8RKSqOk1FcXxtmnMLD9M3pFd8Q45z2wNSxys95TIIeDdzrks1CBf
	Qk8VF60dsahGHDAbQm0Acb+LuRNDtKujCOlL2VkeAT9tGcY8xbQJY4/xZIQAgP2p5OscFYKoPn6
	O6UOiLt6po6QrFgCmgMVU6crFTw+fZ7NErEtsTh9fq/bSjRTZMUuTxWCXiep4RRnbhVo1K2P4Ou
	oc5lVwnXE0zNy19M4pmIKvomJ7QsDj4WRwuZHbM2BpxGK1zKZWcPnkVLD3+ecmdSLFEeUPodHLm
	bxC+cL78yMxwLrY2p+iBpyKyo/gtlXcrHWMbjp8DkJo3vOvsCeJF26Kc=
X-Received: by 2002:a05:600c:8b71:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb7da2c635mr116360935e9.21.1795101858443;
        Thu, 19 Nov 2026 07:24:18 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:18 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/19] nasm: fix CVE-2026-6067
Date: Thu, 19 Nov 2026 16:22:27 +0100
Message-ID: <8d5ed63e0e7bf7d927332d14e857b1c56db919dd.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250684
Content-Type: text/plain; charset="utf-8"

From: Kris Gavvala <kris.gavvala@windriver.com>

When using obj output format, specifying more than 256 segments in
the GROUP directive of the .asm file causes a heap-buffer-overflow.

This patch applies the upstream fix given by the commit in [1]
to address the issue in [2].

[1] https://github.com/netwide-assembler/nasm/commit/8890d723d0aa9ed1a790e2ce1c55eee8dfa0cf94
[2] https://github.com/netwide-assembler/nasm/issues/203
[3] https://nvd.nist.gov/vuln/detail/cve-2026-6067

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../nasm/nasm/CVE-2026-6067.patch             | 36 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.16.03.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch b/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch
new file mode 100644
index 0000000000..f637a688e3
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch
@@ -0,0 +1,36 @@
+From 8bc3400afa0a3e46c890f8887d2f9bb5acc14024 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickclifton@github.com>
+Date: Mon, 29 Jun 2026 13:53:14 -0700
+Subject: [PATCH] outobj: fix buffer overflow when too many segments in a group
+
+The number of entries in a group was hard-coded, but not enforced.
+
+CVE: CVE-2026-6067
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/8890d723d0aa9ed1a790e2ce1c55eee8dfa0cf94]
+
+Reported-by: <BreakingBad6@github.com>
+Fixes: https://github.com/netwide-assembler/nasm/issues/203
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ output/outobj.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/output/outobj.c b/output/outobj.c
+index fc336c194..ad4adb373 100644
+--- a/output/outobj.c
++++ b/output/outobj.c
+@@ -1641,6 +1641,10 @@ obj_directive(enum directive directive, char *value)
+                 /*
+                  * Now p contains a segment name. Find it.
+                  */
++		if (grp->nentries >= GROUP_MAX) {
++                    nasm_nonfatal("too many segments in a group");
++                    return DIRR_ERROR;
++                }
+                 for (seg = seghead; seg; seg = seg->next)
+                     if (!strcmp(seg->name, p))
+                         break;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm_2.16.03.bb b/meta/recipes-devtools/nasm/nasm_2.16.03.bb
index 281f3940e7..729dfe8916 100644
--- a/meta/recipes-devtools/nasm/nasm_2.16.03.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.16.03.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
+           file://CVE-2026-6067.patch \
            "
 
 SRC_URI[sha256sum] = "bef3de159bcd61adf98bb7cc87ee9046e944644ad76b7633f18ab063edb29e57"
