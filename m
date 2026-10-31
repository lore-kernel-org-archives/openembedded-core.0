Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3733.1793405752125027417
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=W/my40IE;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so16511205e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405750; x=1794010550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WFUCCkJ+WrFn64N6EEYyu9HXsGp2pxBjsaOLKyo/Yks=;
        b=W/my40IE+h/3d7lTS4jNm+wlHYea19ByCWeg8D1Y9bzXVe52i4NbBrcj28HchDqFVt
         iYidZoQuR2HwqiAjda4EVDDuMtuml8VvWhwaHEhBkvJbhDo9TjoPaqU5ElYBLfNdt1MJ
         Ktg51ebUgIUi+rs+Rg0UOz9TutudGSXyQCKUPwZ31hzdwzIC31Hm6Nx/QGMUI+MuA8Gu
         /f5QdFaBQMjQhOUlFW3E0oAdtWwpyj6e4HLGf/QrQeyqMD1jMwOVsu0XgljeqQJaqwfN
         8jaLwonxxgooh0jsnG7RDUmF4QjT4/inn7iK+ILoKh6umfzWxDZpLhuCQtkdDY69+9dE
         1q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405750; x=1794010550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WFUCCkJ+WrFn64N6EEYyu9HXsGp2pxBjsaOLKyo/Yks=;
        b=PZGX0+XqFdUOxAHlbqPqBxFZqi7/fHiNkPnN+S2/bCJ+78ycaIFlRdrLRUXicfBvw0
         MedP4T/SERv1Mx/qyC7rkqET0AYwb2TtZwxVWzCbuMx7jU8eyEf8bMrw5geuMej7nyZu
         ALiJBB9JE1bu6c1AO1Fh+A5pVdh7OERqBCLIdSIVBJPKK6Wn9rUIH7crw1oln1ZAer1M
         v1UeZq+Q13nBWiHQ22eM4Ttem8c5+M2IJOk9LR4SwDI6z+t1NMwmM/iT+NKwcTp1wSw7
         INd9G5FNsYJn3Mh1rnRxMDK3VCrrdzU06eBXP9fifPra1i6n+LStgZ9AfsSexDCCJgJE
         IyQQ==
X-Gm-Message-State: AFq9FYJnrCfvYu6ZaKGK6pvBWP+RFlm9CXLVViNJc5UH4b7uXx3eIR5w
	5WGUmLbyfWS7arUhYdXmnTbI7bUc08qt5sAlyKKdpc5RpcNteBW+WYcvnjDsOyV67O5/dQ8AK5U
	EsVTXtgs=
X-Gm-Gg: AYBFou3MFu1Iv4HrZ1XpWYO9gnHtjQIMzgwrypHS55dvZNgjWHFjQe+t1a5DFgdHQom
	H4Jswg2RniWeA63nUe7f1ICsq3fcv0otfLpz2akRi217LWSVZe6o/k5nAS44Gwm4D+2q5Qm8QlF
	EfgbZqxW6aShTnnq2ptfZhkTkH2wuUhH+cg4h0xD5MGj7j9kNViiPZa70WvZHVTzmoSVIweOmWQ
	xOA0X45keZ/R+bIsKcvw+NTb6aPuGwA9v37OBg9wLK+zIrGjIm+SVjBAUsnHXLNbD4yT80b+X8z
	YC7JmPrFCXW32U6mRvfSEin7cI+2D4j+WTI7g747OuST7yX1Y0Vxrk538dH4SORvuaW8/n1Gw5U
	NeBe5DghYfhh0kfWUTUo77DV3TXEyYiUkKgJfkbfxnGHyWyt4FdCPA9qk4DjUyQr1+4KJqK2pbw
	kgdtyhmTC4sqSBtMC2qH4Ym/sqVC/jSO2S3S4o3b5MpgWh91ZTQJsSJ16oMefErpgH3FgidTtRa
	5BZldkQrZmhmJDL0VcS4d3JMq86L1vbK/3Obbgq88q2o0gsRSr4wOeU4LF6r7Wpm/Jmi9zSNqiW
	MAnm2SOJCjEN5sxNm99oWK6JM5B19P4wkvjsBep6oyafrHkiY09/JmYf6wsAlU1JcwgJRFJ7ftV
	O8OgGdtuL8hlI3qUnFlLqEL4/K9PN
X-Received: by 2002:a05:600c:3554:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4ac14ec66d9mr92532505e9.2.1793405750318;
        Fri, 30 Oct 2026 17:15:50 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/55] popt: patch CVE-2026-18743
Date: Sat, 31 Oct 2026 01:14:33 +0100
Message-ID: <51ba6c6a2d4a602f540f2335793161696acb8c45.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249087
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a47df77d4dda066f6c3651480546a79fd445ae6)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../popt/popt/CVE-2026-18743.patch            | 97 +++++++++++++++++++
 meta/recipes-support/popt/popt_1.19.bb        |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18743.patch

diff --git a/meta/recipes-support/popt/popt/CVE-2026-18743.patch b/meta/recipes-support/popt/popt/CVE-2026-18743.patch
new file mode 100644
index 00000000000..d57a39b4705
--- /dev/null
+++ b/meta/recipes-support/popt/popt/CVE-2026-18743.patch
@@ -0,0 +1,97 @@
+From ea2092edba8d6c1a9acd60d9fd7a587c624d6ffe Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Tue, 11 Aug 2026 11:45:44 +0300
+Subject: [PATCH] Fix CVE-2026-18743: buffer overflow(s) in
+ poptConfigFileToString()
+
+Fix the reallocation logic thinko, repeated twice in the function:
+if we need to reallocate, the current maximum value is not interesting
+in any way. Just allocate double the required size instead.
+
+The reproducer test is obviously closely tied to the initial buffer
+size of 480 and wouldn't work with other sizes, but with the current
+default this reliably crashes popt under ASAN prior to this fix.
+Also , the reproducer only exercises the first of these flaws.
+
+Fixes: CVE-2026-18743
+
+CVE: CVE-2026-18743
+Upstream-Status: Backport [https://github.com/rpm-software-management/popt/commit/ea2092edba8d6c1a9acd60d9fd7a587c624d6ffe]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/poptparse.c            | 10 ++++------
+ tests/test3-data/05.answer |  5 +++++
+ tests/test3-data/05.input  |  2 ++
+ tests/testit.sh            |  1 +
+ 4 files changed, 12 insertions(+), 6 deletions(-)
+ create mode 100644 tests/test3-data/05.answer
+ create mode 100644 tests/test3-data/05.input
+
+diff --git a/src/poptparse.c b/src/poptparse.c
+index f405081..c2a5435 100644
+--- a/src/poptparse.c
++++ b/src/poptparse.c
+@@ -139,7 +139,6 @@ int poptConfigFileToString(FILE *fp, char ** argstrp,
+     char * p;
+     char * q;
+     char * x;
+-    size_t t;
+     size_t argvlen = 0;
+     size_t maxlinelen = sizeof(line);
+     size_t linelen;
+@@ -186,9 +185,9 @@ int poptConfigFileToString(FILE *fp, char ** argstrp,
+ 	if (*q == '\0') {
+ 	    /* single command line option (ie, no name=val, just name) */
+ 	    q[-1] = '\0';		/* kill off newline from fgets() call */
+-	    argvlen += (t = (size_t)(q - p)) + (sizeof(" --")-1);
++	    argvlen += ((size_t)(q - p)) + (sizeof(" --")-1);
+ 	    if (argvlen >= maxargvlen) {
+-		maxargvlen = (t > maxargvlen) ? t*2 : maxargvlen*2;
++		maxargvlen = argvlen * 2;
+ 		argstr_tmp = realloc(argstr, maxargvlen);
+ 		if (argstr_tmp == NULL) {
+ 		    free(argstr);
+@@ -218,10 +217,9 @@ int poptConfigFileToString(FILE *fp, char ** argstrp,
+ 	    *x = '\0';	/* null out last char if space (including fgets() NL) */
+ 
+ 	/* rest of line accept */
+-	t = (size_t)(x - p);
+-	argvlen += t + (sizeof("' --='")-1);
++	argvlen += ((size_t)(x - p) + sizeof("' --='")-1);
+ 	if (argvlen >= maxargvlen) {
+-	    maxargvlen = (t > maxargvlen) ? t*2 : maxargvlen*2;
++	    maxargvlen = argvlen * 2;
+ 	    argstr_tmp = realloc(argstr, maxargvlen);
+ 	    if (argstr_tmp == NULL) {
+ 		free(argstr);
+diff --git a/tests/test3-data/05.answer b/tests/test3-data/05.answer
+new file mode 100644
+index 0000000..37b7fb8
+--- /dev/null
++++ b/tests/test3-data/05.answer
+@@ -0,0 +1,5 @@
++single string: ' --aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa --bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
++popt array: size=2
++'--aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
++'--bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'
++
+diff --git a/tests/test3-data/05.input b/tests/test3-data/05.input
+new file mode 100644
+index 0000000..2508292
+--- /dev/null
++++ b/tests/test3-data/05.input
+@@ -0,0 +1,2 @@
++aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
++bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
+diff --git a/tests/testit.sh b/tests/testit.sh
+index 26724d6..4078f51 100755
+--- a/tests/testit.sh
++++ b/tests/testit.sh
+@@ -179,6 +179,7 @@ fi
+ run_diff test3 "test3 - 1" test3-data/01.input test3-data/01.answer
+ run_diff test3 "test3 - 2" test3-data/02.input test3-data/02.answer
+ run_diff test3 "test3 - 3" test3-data/03.input test3-data/03.answer
++run_diff test3 "test3 - 5" test3-data/05.input test3-data/05.answer
+ 
+ echo ""
+ echo "Passed."
diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-support/popt/popt_1.19.bb
index b1d8bea790e..c8b4875c1b7 100644
--- a/meta/recipes-support/popt/popt_1.19.bb
+++ b/meta/recipes-support/popt/popt_1.19.bb
@@ -10,6 +10,7 @@ DEPENDS = "virtual/libiconv"
 
 SRC_URI = "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-18743.patch \
            "
 SRC_URI[sha256sum] = "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9"
 
