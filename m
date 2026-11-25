Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.588.1795637615490730943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 12:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SAFFoVI+;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: admardare@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2761c69fbso7888725c88.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 12:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637615; x=1796242415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i/uwIdUJwbBkBKtl6qr14q+Pdm4Rd+B1/6j3b/z0MIg=;
        b=SAFFoVI+Bjt9tNE7Sx8uu95XrS8X6raRYl4z1PDuQret7/PsrTtP0V3MTaVtDqh5J2
         T6ZpNT+uZAqx7RLv+5f19DHxnNGIh9reOwLElcD60JkEVEMg4k8JXP14/YvkjL2OEmh/
         p6PxoRt1ONmtshvbgxnwDoNqhsEMRGryr1xnC33MqGzUASXx6eIdxXfieqJoc3Ilptft
         dG43gGe93vidn8XtZiWFBzXWQ/ZlHVF6Qb+rvhKDcSmTEqqDVfs2lVbnShy4LokGYFMa
         xwhvJaeJSdl7hL8Gh8SWNHIGEMqW3PMzFiy6QtssDaWGjUAfeh9pS8tx0hIgY9egzaBO
         A0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637615; x=1796242415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/uwIdUJwbBkBKtl6qr14q+Pdm4Rd+B1/6j3b/z0MIg=;
        b=PXEEMl8elq6h4sDVC9cqeff4bpnGTw8I1Ve+BryBwmqJuDEIEmMUgg84v196lUzRXb
         B93qPsnVOMbNXdTjbZDH65lMq72+hfT5yaM46YsCQb/APfM8LhhbpqxU+lP3wrqK9SSy
         h2oS+Qr6tb0ZoKmoaBTXRP6PHk4vRgwpaf5H2Kojnr2OYoUERkvjYDNhuKg7V+Jo8tIO
         POXipxx53jAm8PaSPhbRrZ02VO+0N/TRAb1WA7TMtiZUyddaiOdt9C3tYdQrMw3JJs5i
         z6tN6XMKnfTyjmfd8B+R7hoR8zJ/Aq1s3A9weThYN6rQSVFZvMIJNXvye5f2xts5uPmc
         tjSw==
X-Gm-Message-State: APuU4Z8+B5RedUHsYd72cBhxdp1rlbJuCd+aDFUe3cdiCYsE9PkYB+12
	EYcoDIaGkC7LpO6iMrgqCCxCnStpBEGemJxEX/7bt2F5T5r2ApTSWXXy/admrw==
X-Gm-Gg: AZFdTZcxNuu73AUB+rZ6FJkqAf6ZipVnydeumChXBLGomysetuJCwVP8J4cyxrok91w
	9JvR2JFoY1KaP/+PqMy/e83b211aC+dkYmCjA83irOxmRF5CCPzLtEjBR3a+L/nnvbQinQIqI+z
	ctJpgtI6RFAX/GxsErVi64NuvC1WwWd36KngpOCV4uraoGu+Pygnkj83Q260R60Dxlu6ZVhGGvC
	/iwXrH2+1gMcbi1M5h1yaBJdxRQ+3PeuL9Oy9+HkJQtIYDyN8ExGeIlCH42Ym8d7xTqa0NzjwWw
	scG0FcMTub9tx+pZ7WfRCWRo0YMKPGjH/BKVvQ4ISVOjcIkbeLa7J6WnA4O14mBFjSFUCv8YW12
	x1pYV/NYPbCbT0xcgA9dl9cCPd1zaMb0loVFVWhqfkDRHCQfr0JSI7NW5RBuhTL2ijp4ytdE1Og
	dLzEOG7UVw5GTazx2IPRV/rUTQMjliapGFiJHvfRBfuj+4NEEycNOE4ReMVOoA4F1CWobXGs+EP
	uS6gPQr/zTWEEzwe+JI+jYv92XLNEsU+YssBr9e6o11Y2V7XsQPQtGC/RZ8zEypNvn7htfY2/zn
	/rHWDSEHLtxyFDwZ2+IRBz67+5EFz/QPquFKgHJV4OwH1Mv5UkAEW7u1hYsNt664ZAgvQOwAwcw
	HgN2mP8NLG2p2MrzmhrG8rsx1L5knLgzTukOtGRl4kI7l3LHwwzVjxcdqEP6Cp3gZRQdMm6NGci
	5Yn9sDXGHCfFD2rknD6UHu8vZQtRhTdqR/5yo=
X-Received: by 2002:a05:6214:808d:b0:921:19a:e11e with SMTP id 6a1803df08f44-92134b1cdafmr293319036d6.25.1795637207785;
        Wed, 25 Nov 2026 12:06:47 -0800 (PST)
Return-Path: <admardare@gmail.com>
Received: from localhost.localdomain (pool-174-112-219-186.cpe.net.cable.rogers.com. [174.112.219.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b79sm169721636d6.5.2026.11.25.12.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:06:47 -0800 (PST)
From: admardare@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Adrian Mardare <admardare@gmail.com>
Subject: [PATCH] Remove elfutils patch
Date: Wed, 25 Nov 2026 15:04:36 -0500
Message-Id: <20261125200436.131071-1-admardare@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 20:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251246
Content-Type: text/plain; charset="utf-8"

From: Adrian Mardare <admardare@gmail.com>

The changes in patch 0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch are wrong
and the patch should be removed ( ** also see Note1 below ** )

In particular this change in elf_end():

                /* The section data is allocated if we couldn't mmap
                   the file.  Or if we had to decompress.  */
-               if (elf->map_address == NULL
+               if ((elf->map_address == NULL
                    || scn->rawdata_base == scn->zdata_base
                    || (scn->flags & ELF_F_MALLOCED) != 0)
+                   && (scn->data_list.data.d.d_buf != NULL))
                  free (scn->rawdata_base);

is now conditioning the free (scn->rawdata_base) by scn->data_list.data.d.d_buf!=NULL
While the allocation itself uses "scn->rawdata.d.d_buf"
Line 333 does the allocation:   scn->rawdata_base = scn->rawdata.d.d_buf = malloc (size);

The patch introduces memory leaks for the allocation at Line 333 elfutils-0.191/libelf/elf_getdata.c:333
Two such leaks are detected / shown below:

When run under a leak detection one can see:

Direct leak of 626 byte(s) in 1 object(s) allocated from:
    #0 0x7f282d2716bf in ___interceptor_malloc (/auto/compiler-migration/22/10/llvm-cisco/compiler-rt/lib/lsan/lsan_interceptors.cpp:74)
    #1 0x7f282bf8a9df in __libelf_set_rawdata_wrlock (../../elfutils-0.191/libelf/elf_getdata.c:333)
    #2 0x7f282bf8a586 in elf_strptr (../../elfutils-0.191/libelf/elf_strptr.c:163)
    #3 0x7f282c55d404 in elf_sym_str (libbpf.c:3557)
    #4 0x7f282c559564 in bpf_object__elf_collect (libbpf.c:3849)
    #5 0x7f282c548a8e in bpf_object_open (libbpf.c:7978)
    #6 0x7f282c548b43 in bpf_object__open_file (libbpf.c:8001)

Direct leak of 321 byte(s) in 1 object(s) allocated from:
    #0 0x7f282d2716bf in ___interceptor_malloc (/auto/compiler-migration/22/10/llvm-cisco/compiler-rt/lib/lsan/lsan_interceptors.cpp:74)
    #1 0x7f282bf8a9df in __libelf_set_rawdata_wrlock (../../elfutils-0.191/libelf/elf_getdata.c:333)
    #2 0x7f282bf8a718 in elf_rawdata (../../elfutils-0.191/libelf/elf_rawdata.c:68)
    #3 0x7f282c558d7c in bpf_object__elf_init (libbpf.c:1556)
    #4 0x7f282c548a6f in bpf_object_open (libbpf.c:7976)
    #5 0x7f282c548b43 in bpf_object__open_file (libbpf.c:8001)

In both cases the cleanup is done correctly in libbpf by calling bpf_object__elf_finish() -> elf_end() however
the bogus check in elf_end() skips the free (scn->rawdata_base)

After removing the 0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
the leak output is clean.

** Note1 **: The patch 0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch was never accepted by the elfutils upstream community.
The problem it tries to solve is a prelink bug ( double free in prelink )
Quote from libelf upstream community comment:
"I think that prelink is preparing the ELF file, but then half way
through encounters an error. It then frees all the ELF section data it
believed it created itself. But because of the error it probably didn't
(yet) do that. And so frees some data that it got directly from
elf_getdata () and didn't create itself. Then it calls elf_end () and
libelf also thinks it owns that data and frees it again."

Signed-off-by: Adrian Mardare <admardare@gmail.com>
---
 .../elfutils/elfutils_0.197.bb                |  1 -
 ...-check-data_list.data.d.d_buf-before.patch | 43 -------------------
 2 files changed, 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.197.bb b/meta/recipes-devtools/elfutils/elfutils_0.197.bb
index 253e1a65f0..deca3dae90 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.197.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.197.bb
@@ -14,7 +14,6 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://run-ptest \
            file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch \
            file://0003-fixheadercheck.patch \
-           file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
deleted file mode 100644
index 47f28885a9..0000000000
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 6305e20927bc39367009efd1ecb71ce20a006ed6 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 16 Aug 2018 09:58:26 +0800
-Subject: [PATCH] libelf/elf_end.c: check data_list.data.d.d_buf before free it
-
-The one which actually saves the data is data_list.data.d.d_buf, so check it
-before free rawdata_base.
-
-This can fix a segmentation fault when prelink libqb_1.0.3:
-prelink: /usr/lib/libqb.so.0.18.2: Symbol section index outside of section numbers
-
-The segmentation fault happens when prelink call elf_end().
-
-Upstream-Status: Submitted [https://sourceware.org/ml/elfutils-devel/2018-q3/msg00085.html]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- libelf/elf_end.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/libelf/elf_end.c b/libelf/elf_end.c
-index 9df2e16..339d7ed 100644
---- a/libelf/elf_end.c
-+++ b/libelf/elf_end.c
-@@ -176,14 +176,16 @@ elf_end (Elf *elf)
- 		   architecture doesn't require overly stringent
- 		   alignment the raw data buffer is the same as the
- 		   one used for presenting to the caller.  */
--		if (scn->data_base != scn->rawdata_base)
-+		if ((scn->data_base != scn->rawdata_base)
-+		    && (scn->data_list.data.d.d_buf != NULL))
- 		  free (scn->data_base);
- 
- 		/* The section data is allocated if we couldn't mmap
- 		   the file.  Or if we had to decompress.  */
--		if (elf->map_address == NULL
-+		if ((elf->map_address == NULL
- 		    || scn->rawdata_base == scn->zdata_base
- 		    || (scn->flags & ELF_F_MALLOCED) != 0)
-+		    && (scn->data_list.data.d.d_buf != NULL))
- 		  free (scn->rawdata_base);
- 
- 		/* Free the list of data buffers for the section.
-- 
2.34.1

