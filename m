Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5FA4CF34A1
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 12:43:56 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5997.1763556231265233764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 04:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JzpBWccp;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b3ad51fecso4927226f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 04:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763556229; x=1764161029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jaGoKD1vI7nvP1WxKPcu7FtEZN09PWhKBQPiu58Vhu0=;
        b=JzpBWccpkdjdfV/ozaqfjnbbGRcySvFVbYousPMz02X4Oom6GO+LM2M/8g8Y8fXFkT
         MF6updvoSP+fPanDM2g6X0LXkmClGY5AmzoaPA3F+dsTEnnMBWFgq6xPoMP+JRhHkaa0
         0HxbVoFPjMNmrd3AZtAFRBJ7M4zg3I/eNkeOvtucnZ8IWUejSbXo/eKtbJf0wkvWuLMe
         w47m5PPVNJF5/wRFDOf/kUGdfpNyPT61UoHqB0l6+A0sllaaVgnZikbYaYLVMoYB8tgv
         Uf+nqESysDsf7rL86p9JqBZVdM22euN/ZVE6xdAe/23I7UIt7ZskJHpOucWLSAUhfM6T
         IZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763556229; x=1764161029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jaGoKD1vI7nvP1WxKPcu7FtEZN09PWhKBQPiu58Vhu0=;
        b=WJAlJLav6snJ2wRKpzwSsprNOGVjKiiz+WQXDOOxKn/Zk20XPvYyYRe4EWfvD6+BwM
         haJDon3pil8H1Tzd/eWVnhGKSJl0vQHWEXb4rUT55W+X7wH8QoyGM3INZvzAorkwylwj
         q7oxNXSLypHabdS+YmTiLC3+svi6ItVE0s3+lr+oikSC6id2WJvN6tmr/7ZL5k144wfL
         H2qkQPSqhbY9edYadi57AAwqK+jcpB8d4mQUEt2JTua6gjaEHIzWi99JmLthWOyXETpc
         N56psRBfg7lSYPhqSTkLL0T6wdATOYnBTQ2yROWalJwCrRaSplIZSexZmuT9gDHfjZAQ
         A/2Q==
X-Gm-Message-State: AOJu0YzldnCcJerPimkboVXlOpRM5XKi0efK0sMWo7ueZJ1APYg/ChCD
	RoOHEjTQL9fujImfwZfrX1pigzzchC2skikzYM9XuaJsbaqgveRMkPg3WH0piQ7O
X-Gm-Gg: ASbGncvjwaO01UaCC/ftU9DC59pPUvtZWD2d57NgaR+Yn5QPlXqXLDPsJAkPJalAa3i
	L5oygUnS1ZiPrF3wxptA9BYCUHbHnf84pJKUNkjCypZiv/9nLwDIX1qy4PQ50bWRRbxfBkfn21K
	q+TAQOqvogGSk7BJlVg/h5mTbTzUJhOXQemuRumgKLo2Hyy8DmtP3RJn3Auq/Emj3D4dYBVtTeX
	JOiUn3te4N7hfQjY8E36+NHF+1hT+tXW7Rd3jq0gS6RXKrW1HSJ8pIPpuBN0n2l7tlbc6sVoKIv
	Awffn8ZJznulVdMKm1VTa4PbQgcGoM+gsZmw7Zkf6J/q2vAkXy3/O7jqB3e1rAA8xTpTwPRv+3x
	vBd9Nfvy6GMhJgggOJMx594RtGqw5DG839vPo1iNTPM+bG1sW8FpCdE6cQNKa2UCdgKyDG4moqC
	3V/DIxiXxeeZFZH1ycqfM=
X-Google-Smtp-Source: AGHT+IE/ponvut5rVbEC0+sE7kkqkgr+KQJXzMFFrqqPpyI0S+PBngNF8cS4utmN8JHqpcugNidypQ==
X-Received: by 2002:a05:6000:144a:b0:42b:38b1:e32e with SMTP id ffacd0b85a97d-42b5938fddamr19727177f8f.46.1763556229456;
        Wed, 19 Nov 2025 04:43:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b12asm37463263f8f.10.2025.11.19.04.43.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:43:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] musl: patch CVE-2025-26519
Date: Wed, 19 Nov 2025 13:43:48 +0100
Message-ID: <20251119124348.164169-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 12:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226553

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-26519

Pick the patches that are attached to the musl advisory:
https://www.openwall.com/lists/musl/2025/02/13/1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../musl/musl/CVE-2025-26519-1.patch          | 39 +++++++++++++++++++
 .../musl/musl/CVE-2025-26519-2.patch          | 38 ++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  4 +-
 3 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/musl/musl/CVE-2025-26519-1.patch
 create mode 100644 meta/recipes-core/musl/musl/CVE-2025-26519-2.patch

diff --git a/meta/recipes-core/musl/musl/CVE-2025-26519-1.patch b/meta/recipes-core/musl/musl/CVE-2025-26519-1.patch
new file mode 100644
index 00000000000..5583c5f6cc1
--- /dev/null
+++ b/meta/recipes-core/musl/musl/CVE-2025-26519-1.patch
@@ -0,0 +1,39 @@
+From 8ebb2a68dfac02e7a83885587a9a5a203147ebbe Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Wed, 19 Nov 2025 13:23:38 +0100
+Subject: [PATCH] iconv: fix erroneous input validation in EUC-KR decoder
+
+as a result of incorrect bounds checking on the lead byte being
+decoded, certain invalid inputs which should produce an encoding
+error, such as "\xc8\x41", instead produced out-of-bounds loads from
+the ksc table.
+
+in a worst case, the loaded value may not be a valid unicode scalar
+value, in which case, if the output encoding was UTF-8, wctomb would
+return (size_t)-1, causing an overflow in the output pointer and
+remaining buffer size which could clobber memory outside of the output
+buffer.
+
+bug report was submitted in private by Nick Wellnhofer on account of
+potential security implications.
+
+CVE: CVE-2025-26519
+Upstream-Status: Backport [https://git.musl-libc.org/cgit/musl/commit/?id=e5adcd97b5196e29991b524237381a0202a60659]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/locale/iconv.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/locale/iconv.c b/src/locale/iconv.c
+index 3047c27b..1fb66bc8 100644
+--- a/src/locale/iconv.c
++++ b/src/locale/iconv.c
+@@ -495,7 +495,7 @@ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restri
+ 			if (c >= 93 || d >= 94) {
+ 				c += (0xa1-0x81);
+ 				d += 0xa1;
+-				if (c >= 93 || c>=0xc6-0x81 && d>0x52)
++				if (c > 0xc6-0x81 || c==0xc6-0x81 && d>0x52)
+ 					goto ilseq;
+ 				if (d-'A'<26) d = d-'A';
+ 				else if (d-'a'<26) d = d-'a'+26;
diff --git a/meta/recipes-core/musl/musl/CVE-2025-26519-2.patch b/meta/recipes-core/musl/musl/CVE-2025-26519-2.patch
new file mode 100644
index 00000000000..7d193ab2411
--- /dev/null
+++ b/meta/recipes-core/musl/musl/CVE-2025-26519-2.patch
@@ -0,0 +1,38 @@
+From 7e7052e17e900194a588d337ff4a8e646133afed Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Wed, 19 Nov 2025 13:27:15 +0100
+Subject: [PATCH] iconv: harden UTF-8 output code path against input decoder
+ bugs
+
+the UTF-8 output code was written assuming an invariant that iconv's
+decoders only emit valid Unicode Scalar Values which wctomb can encode
+successfully, thereby always returning a value between 1 and 4.
+
+if this invariant is not satisfied, wctomb returns (size_t)-1, and the
+subsequent adjustments to the output buffer pointer and remaining
+output byte count overflow, moving the output position backwards,
+potentially past the beginning of the buffer, without storing any
+bytes.
+
+CVE: CVE-2025-26519
+Upstream-Status: Backport [https://git.musl-libc.org/cgit/musl/commit/?id=c47ad25ea3b484e10326f933e927c0bc8cded3da]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/locale/iconv.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/locale/iconv.c b/src/locale/iconv.c
+index 1fb66bc8..fb1d3217 100644
+--- a/src/locale/iconv.c
++++ b/src/locale/iconv.c
+@@ -538,6 +538,10 @@ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restri
+ 				if (*outb < k) goto toobig;
+ 				memcpy(*out, tmp, k);
+ 			} else k = wctomb_utf8(*out, c);
++			/* This failure condition should be unreachable, but
++			 * is included to prevent decoder bugs from translating
++			 * into advancement outside the output buffer range. */
++			if (k>4) goto ilseq;
+ 			*out += k;
+ 			*outb -= k;
+ 			break;
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 324269a9687..bc516b61834 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -14,7 +14,9 @@ SRC_URI = "git://git.etalabs.net/git/musl;branch=master;protocol=https \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
            file://0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.patch \
-          "
+           file://CVE-2025-26519-1.patch \
+           file://CVE-2025-26519-2.patch \
+           "
 
 S = "${WORKDIR}/git"
 

