Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4762.1792538575560379128
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=YNJ58Ctl;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so468765e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538574; x=1793143374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9ji2/fNo3Y6Uf0I0b3XUE6Ztzvc+6SMqmJGILOTb/zs=;
        b=YNJ58Ctlcx4vMjwdg5Us9NfwZ+inTQs0wOolNNV4oMZdieIz42Hcw6kuMQ2CE/al81
         5jGwf+OUo/+oW8LZNZzOx5mQdqipMqEeBoKxOQOBDh2YQyRlnpa0JcjPAWrgfJC3TUhg
         SGnhKHogiZ29QM5zvS20u8Vib6/z37FrydxKKhtTNZku+T13NtOTOd9cpG6kCOPhCrw9
         7ClwNlUgoTGBghcCCEVyA0nRrFEG8E/pZ9/vgQDf/kFxe4di/I09BzQYaIE8DoOrdBkV
         K7A/rAxhcAzd00Uae/lLwNkrUjdJBH3ucBW1OaAzyB43BGuEBFI0DLxQVrRWp3AIRrbm
         34oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538574; x=1793143374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9ji2/fNo3Y6Uf0I0b3XUE6Ztzvc+6SMqmJGILOTb/zs=;
        b=C3l8tSBmaSWovbuRoVfpq7iQaR0J0qoKP8Vqe6HuXi9I8U+LtZCu/sTIqmtu3mj0BR
         4TGGQheU5LZdfhZyXgpVPZdplBU2gKjlxs36ARCmylITD9MaoKzT/FB20Wo+oIlIRp4c
         rvtfp1rIPUH+MZmBc93+hrIcrIPltMdkckAPO7v9NOvk+6ePiNlzOpLoFaWzPBLLVTqt
         w3aR6E11bin9ibaBnCpiZEXf62usHCma+XGAuyT3yaWPU/P0L1D/ZHaoIySxeXHC7iSJ
         YFPS3+8zyrkqY0nnZMb8cFUBVEUVxqTPREhr7L92X3URfAQ35XNKEfRgdHM3mfMrtVWa
         n7bA==
X-Gm-Message-State: AFq9FYLUBaF/RU8EMMybH6thA78ndEZSEvNNUR8huGtQSjrHD/6HvXpZ
	0Q6t9+JdcTZe4JQ1fPWxhMpId5H0zxutM9GxzXEYCZqsvWO1DSNIib5gK3J1lTPvkNvtdhH+yHC
	hzT0RsRw=
X-Gm-Gg: AYBFou1xQfnMy6kx+ZBNJbnTVN0U/Ko5i8ecHThC2AEswMiaA/uMftwCP7SHDSoLap/
	tv5riArhum2jRyu3YpidqUCSIwPQjnx/eTaK+azDsCY5gB347/nSWmm+9TCk/qokE3s73icVz7R
	VnFIJA+bNTXjlQlVWOdJmfdTmXYkANaKKXl4nDfTB+9jbhvJRzbaixVOw2TPAStyKzl/quWVXbI
	6fNRvj8FjdQSwRInVARXRVTLhLipwaP/qZ+/nfvewjMf8vFpO80Pi967D17Tv/ide2CkjgMvWzB
	OP1IhFpyBka9vz+b9McbDheKrluTIZKgAvTNDhE+E+aYefCB1i1D1HzLS4F8MMAElcglEnJQy+f
	rbCpqyyAASVbJEssC8cfVBcuQ7LSNl4eheraNGRy/YiiaqGUorsoL1XOL44wFXh7zivtGftEhlN
	TVXj10BZyQpdBdbz1uVZ7UsyqaKoyIivYQrCNZy+k9tsYhUV8AWmW0Vuu31mNU7tmDCIYkO50k7
	i3NIzcdyJen7x8EyAF7zdhWt/6OU1j+HNu7AJ5G8DORSkP2ajo5BMpDs5Fm49MhPa9aVINQ2iS9
	+976b6GsKSCz93o3LPxaTvCPvs6lwnCxKoF6muofuoStv/2WFpCSMKTB
X-Received: by 2002:a05:600c:630e:b0:4a1:dfaf:f43e with SMTP id 5b1f17b1804b1-4a1fd8a7d87mr4948815e9.1.1792538573712;
        Tue, 20 Oct 2026 16:22:53 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.22.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:22:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/25] popt: patch CVE-2026-18743
Date: Wed, 21 Oct 2026 01:22:13 +0200
Message-ID: <4ced139b3e3fce64cec9bf50474ae7eb5a86ccce.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248321
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
index 525bf553b10..3e9137c156a 100644
--- a/meta/recipes-support/popt/popt_1.19.bb
+++ b/meta/recipes-support/popt/popt_1.19.bb
@@ -10,6 +10,7 @@ DEPENDS = "virtual/libiconv"
 
 SRC_URI = "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-18743.patch \
            "
 SRC_URI[sha256sum] = "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9"
 
