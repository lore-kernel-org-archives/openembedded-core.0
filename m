Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6182.1795658877173444455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 18:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JrGLIWGv;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: admardare@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9211bbce3abso51061186d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 18:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795658876; x=1796263676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i/uwIdUJwbBkBKtl6qr14q+Pdm4Rd+B1/6j3b/z0MIg=;
        b=JrGLIWGvL/rUMDlASz6UWhms1zsfDLfcFCcmCORBHuikeRcgAk68s/62+e+kXjldF7
         Iv++LK1cJYJ9XXG6xtNfjRCbKSUMw/+ifa8gfhWTWpiX0uyghX0Rs07PdzkxH2BKi5HG
         twmTdd418l0Rok6tnDfIdyC5NfSdeRWq12L/eLzl68566NdbaevXM3+abfAl8siqFGjB
         pQ9GxSLLIa9dBaqOD5ajXpeiQUIDNV3khwwXKoHdcju3bkogP9VXrAuWhR9+RQIRCE6T
         gnE0RKEueIIGkitTKgM10IA/wHIAw0zan2RMj0R1UVAeqSqJ5A2deuhTi9rXz2Sfn6b7
         mqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658876; x=1796263676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/uwIdUJwbBkBKtl6qr14q+Pdm4Rd+B1/6j3b/z0MIg=;
        b=H+/xioDPgUj99fwGmB7Xr9MVBmmyYhajoS1ounCt2+O3fZhDnRyzop3+X7UMB3EWhG
         Sicy1fM9iiy7kJRVPNrURA7+N/5dxa1hzjQUThCF1HHY2JquBulUHSgpyN7PsDcZOvxZ
         vtXgrz3wUN+l3WuYP/0dee705JFzFxXyfKzBu6MLQPuUNLYxjVOjlt9oCQm2GDxwFS+e
         lkuKPwHJ+UT+sEHJ3bcsOcr/z7fRfYjkuD92DncCXEEslFueolPp+VAfTjcpTUoYzXbh
         osQN36FFMu2iqvWdiMUkOozwmPqh3FbgSAYYkGBLuCHjur+it6P/kmivfIlcDqaJ5mRU
         0I+w==
X-Gm-Message-State: APuU4Z/5nXT0Bv+x7EdFgRZikH8mVsVJJdgWTmC/yAiyg8kgfNEki7Q2
	dCE0wY1sXuztFlIm1tLGZJ92u7E+8smw3iWO/UGy4NijGkshF+xTMo5ATW/OEw==
X-Gm-Gg: AZFdTZe9QDHNF1moWutgwpznOK80mizQSKtjyLWlVoHgbEG775RW4MuJ7GP+s9J9sSE
	VVBm7GK/12t1PTkBWfij8FbHPJ8Ne5hDfNiZluHRq3X5r3Rc1D8OHZ6jRvFPOw4pB8dCh3mv1OR
	dss4WAAiQp5Rt6V5c7jKhWuVTRqDzW6qGMICwTas/NyiHuDuobngoSYW5zOHl3oh3sFBjCzBgjh
	qpS2x1NLsOSSgIXNXE88txqxfjtX0Y3KEb5Hk4TNyvkDJ+iKCUlwPGZZlkACxbWPNRkHffY8RTM
	8bOTq1Pyx59N1987SMCJZPaL6TpX4ohuz+qETTHjUoiJGEdAHpxaSytbRbr4a33tEqX/4PkHR81
	cduESkLgdEB3S7ISyYWBu1MLjGRZwzdTa+isL1Uc382kT5296kI1l0gcv9sd62W9WoWhEnRqRux
	URYm0QAqU/teHWHW5zydhHDZWcmLWjMkqIbzOjVEYOoHz6w6gthzsZH0qjBMoSBJnv4zfZg0iG2
	HEUPBfB8P9GCKW4En132vkFgrEfODU9me5Uhp+J1h4fNv6UIEtqhb+jRWCe3Np5dkote5O3Ow9E
	uai6NRv2Wr9Ba56wWHnS6NkOjSdddvCh7Zr6cbDNICSjULEPfEzXY3Oih7vnRD2XAtm4ailPiHK
	p4rAhralchVPAMO4Ls3un+LE+GZyzEP8PA9lurWfuNp/le8BG8gNtUcQLiMz5fWBHCug0WMYXLo
	c79QMtLQC79uVznfxTIQQMyKY992RS+rDN9+E=
X-Received: by 2002:ad4:5748:0:b0:921:83d4:df78 with SMTP id 6a1803df08f44-92183d4e0femr38139286d6.27.1795658875870;
        Wed, 25 Nov 2026 18:07:55 -0800 (PST)
Return-Path: <admardare@gmail.com>
Received: from localhost.localdomain (pool-174-112-219-186.cpe.net.cable.rogers.com. [174.112.219.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134796288sm175272466d6.6.2026.11.25.18.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:55 -0800 (PST)
From: admardare@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Adrian Mardare <admardare@gmail.com>
Subject: [PATCH] elfutils: Remove patch 0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
Date: Wed, 25 Nov 2026 21:07:48 -0500
Message-Id: <20261126020748.149652-1-admardare@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 07:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251283
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

