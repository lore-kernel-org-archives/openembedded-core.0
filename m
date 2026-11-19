Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80.1795101861260811340
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=NVKmjWeL;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso9080455e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101859; x=1795706659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZwRaXj4o+I3S08WSc1Cqboxjy7Z3l6pZB2aLUpSSWjk=;
        b=NVKmjWeLb6y6LbtylgjX84gvkhtHm7LlC5Z566lDPSBjvAaLckTnz3yHZ2ZpWcq4Am
         JTZ7tTwvxAuyJKiJvHKk7UlFsCHKidjWdJtBCPEU4S+/B2lBP76OcUzUMT3+3K2tC5jy
         w3TWih2rIHBX1dnqNUPthNWCo/kib0KLCgbNR4TKwKOtVmRSE5IgYq7oq8e18+Wp/Ilu
         14nh/pvxPn2SKax1QIfkwJO/PG6H72U6d/0px/e9flHzbKPq24wZIViM6peyoArvt50F
         0aLy0tE6TURMIkylB1usWDY59PsqC+QZMoNHHo2HyGdHGGmedD3qY093sXwAgKcoxuhL
         wozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101859; x=1795706659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZwRaXj4o+I3S08WSc1Cqboxjy7Z3l6pZB2aLUpSSWjk=;
        b=EUz+e5B6mnDczrkzncHLn5QCt6NZFfpXjZMh9Gqg4ieaEWH2eRpjPBnVYtJdu2CrqG
         Acgx6S2V8Lfh4SDs0eMclZknwx3nVHYOohFNvdaZKctWoqhl3hzm20OwT6bHIlqzDEgN
         AiLSY2HcycHgkhgwAfa0q+4E5yGVXU5gpZEZGrtMdxb9nQAeh8pXnYLmnqNsaDoZBk12
         UaOEq7lzZz1elLFFxR4/u6IRWXyFB/odMbGvhhTFtJZVgvk3msd0DJPtLavTaDCqM0eQ
         vA6DRFiFtYy3rvuJuEMNmhjNrTt+2nbnb697JcpcxDBnxgvp1NUA1UBQTFu1hka33sIp
         nDdw==
X-Gm-Message-State: APuU4Z9QEf0gyom+cLYDYsTJXftIjyZ5vt/PuuI03Hu2KeNcZtWWihly
	gdBBrf+rCy/CJLUoQaRwf5daMSf61ZcSdWui1EFyUnsVtgbZFXygZQoBQaI+qHf3lalpaT3DRc8
	mosxGoww=
X-Gm-Gg: AYBFou1fRhV6UtaipUSeHsqAooFwx5sqEKZOA65hjjL4oW36jgV6pFZ5RJB/wdEKqVA
	xnJvAFH26DPQM8X+r60yT17CPLfpFzd3j7GI6nacjhzRuRqa7I1GlToz3F06r8euP+zsqvDluDg
	AhXUFQVVoYjyLmFP3HBSDJJpAgCSna/rSrGIdkcQ5zg2jcgAMHzyVsnB3snLibyseDteEU+Qq+M
	jnttTZR12VKRcdyJVAn8oQbFrB5d6DjcHuC7PXPcEmW12kU0R54tRH+cSIDNAr8WIJmS7TrDuKt
	qwrBlyrhg1WDcLgAn+B0qlZMUMb6TtbrVYcjgikMNQctfmCT7sNS5UA3ZxVHC7b4pc3PzqMV2hF
	PfDQ4MxjPqqTE9zTgUrH55BDAgB6XV05cN0VHrBzRwlobJGDvNFTOBDl5PdIQg5G/MF66JcpRCl
	eBesSCBU/HIQRGZwHTclIY9VSC3ODqnZruQKvTTVYNDleoN1KNtf655QnZtbT9PLlZG3MOjQPMY
	L4VPtOxHVfJ/hUmOzBNHvJ6e3np+O/Y08cOuS0vrevXFoeKlDIsrmcStO3jCo3NQUGDpvFitl9k
	ZIh6aE4RNZUNvEZWAIdTIk8Z9445oE0klXi6neQdXozHfoZvNbCingTjVzbPqO/pNN1qbE8JYvw
	0MdFsu0FivPjKfZLxt320Kw/yfvvKXW3MlPVJVup8/xsWGtFdzi9BTfA=
X-Received: by 2002:a05:600c:468b:b0:4bb:5fd1:92aa with SMTP id 5b1f17b1804b1-4bb8612334cmr32388355e9.15.1795101859062;
        Thu, 19 Nov 2026 07:24:19 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:18 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/19] nasm: fix CVE-2026-6068
Date: Thu, 19 Nov 2026 16:22:28 +0100
Message-ID: <6a925592ce2eef44f568f08a8669e612a47e4da4.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250685
Content-Type: text/plain; charset="utf-8"

From: Kris Gavvala <kris.gavvala@windriver.com>

- CVE-2026-6068-1.patch applies the upstream fix in [2],
  addressing the issue in [1].

- CVE-2026-6068-2.patch applies [3],
  adding helper functions used in [2].

- CVE-2026-6068-3.patch applies [4],
  which prevents the compilation warning:
  assignment discards 'const' qualifier

[1] https://github.com/netwide-assembler/nasm/issues/222
[2] https://github.com/netwide-assembler/nasm/commit/7bc82e7daf4cceb6a8af7ad2876485c9b4b01a56
[3] https://github.com/netwide-assembler/nasm/commit/44245e4684be1fac6c2fb7ac67dce8a55a574956
[4] https://github.com/netwide-assembler/nasm/commit/7b4e77dae29156a283d31fe707939ce21bf3eb3e

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../nasm/nasm/CVE-2026-6068-1.patch           | 98 +++++++++++++++++++
 .../nasm/nasm/CVE-2026-6068-2.patch           | 80 +++++++++++++++
 .../nasm/nasm/CVE-2026-6068-3.patch           | 51 ++++++++++
 meta/recipes-devtools/nasm/nasm_2.16.03.bb    |  3 +
 4 files changed, 232 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-2.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-3.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch
new file mode 100644
index 0000000000..44f691610a
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch
@@ -0,0 +1,98 @@
+From e3a3fb40d21edb638f8191465574aaaaaacb336d Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
+Date: Fri, 26 Jun 2026 17:27:47 -0700
+Subject: [PATCH 2/3] asm/nasm.c: fix use-after-free for -M* options in -@
+ files
+
+-M* options in response files would hold on to a pointer to the new
+value, but in response files that is not a persistent buffer. Make
+sure to make a copy instead.
+
+This uses the new nasm_str[dup]to() helpers.
+
+(Note that calling nasm_free() on a NULL pointer is guaranteed safe.)
+
+CVE: CVE-2026-6068
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/7bc82e7daf4cceb6a8af7ad2876485c9b4b01a56]
+
+Reported-by: <BreakingBad6@github.com>
+Fixes: https://github.com/netwide-assembler/nasm/issues/222
+Fixes: CVE-2026-6068
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ asm/nasm.c | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/asm/nasm.c b/asm/nasm.c
+index 49fa00eb7..98bde83cb 100644
+--- a/asm/nasm.c
++++ b/asm/nasm.c
+@@ -121,8 +121,8 @@ static unsigned int operating_mode;
+ /* Dependency flags */
+ static bool depend_emit_phony = false;
+ static bool depend_missing_ok = false;
+-static const char *depend_target = NULL;
+-static const char *depend_file = NULL;
++static char *depend_target = NULL;
++static char *depend_file = NULL;
+ struct strlist *depend_list;
+ 
+ static bool want_usage;
+@@ -709,6 +709,8 @@ int main(int argc, char **argv)
+     stdscan_cleanup();
+     src_free();
+     strlist_free(&include_path);
++    nasm_free(depend_file);
++    nasm_free(depend_target);
+ 
+     return terminate_after_phase;
+ }
+@@ -750,7 +752,8 @@ static void copy_filename(const char **dst, const char *src, const char *what)
+ }
+ 
+ /*
+- * Convert a string to a POSIX make-safe form
++ * Convert a string to a POSIX make-safe form; returns a newly allocated
++ * string.
+  */
+ static char *quote_for_pmake(const char *str)
+ {
+@@ -830,7 +833,8 @@ static char *quote_for_pmake(const char *str)
+ }
+ 
+ /*
+- * Convert a string to a Watcom make-safe form
++ * Convert a string to a Watcom make-safe form; returns a newly allocated
++ * string.
+  */
+ static char *quote_for_wmake(const char *str)
+ {
+@@ -1188,20 +1192,20 @@ static bool process_arg(char *p, char *q, int pass)
+                 case 'D':
+                     operating_mode |= OP_DEPEND;
+                     if (q && (q[0] != '-' || q[1] == '\0')) {
+-                        depend_file = q;
++                        nasm_strdupto(&depend_file, q);
+                         advance = true;
+                     }
+                     break;
+                 case 'F':
+-                    depend_file = q;
++                    nasm_strdupto(&depend_file, q);
+                     advance = true;
+                     break;
+                 case 'T':
+-                    depend_target = q;
++                    nasm_strdupto(&depend_target, q);
+                     advance = true;
+                     break;
+                 case 'Q':
+-                    depend_target = quote_for_make(q);
++                    nasm_strto(&depend_target, quote_for_make(q));
+                     advance = true;
+                     break;
+                 case 'W':
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-2.patch b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-2.patch
new file mode 100644
index 0000000000..4b2334776a
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-2.patch
@@ -0,0 +1,80 @@
+From 4dfcfe9b333230788be7328e8fe943bda1610011 Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
+Date: Fri, 26 Jun 2026 17:25:23 -0700
+Subject: [PATCH 1/3] Add nasm_strdupto() and nasm_strto(), to replace a string
+ variable
+
+It is common enough that one wants to set a string pointer to a newly
+allocated string, freeing the old one if it is not NULL.
+
+Add specific helper functions for this.
+
+CVE: CVE-2026-6068
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/44245e4684be1fac6c2fb7ac67dce8a55a574956]
+
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ include/nasmlib.h | 23 +++++++++++++++++++++++
+ nasmlib/alloc.c   | 11 +++++++++++
+ 2 files changed, 34 insertions(+)
+
+diff --git a/include/nasmlib.h b/include/nasmlib.h
+index ed4222b11..fae86d3cd 100644
+--- a/include/nasmlib.h
++++ b/include/nasmlib.h
+@@ -102,6 +102,29 @@ char * safe_alloc nasm_strndup(const char *, size_t);
+ char * safe_alloc nasm_strcat(const char *one, const char *two);
+ char * safe_alloc end_with_null nasm_strcatn(const char *one, ...);
+ 
++/*
++ * Replace a string in a string pointer variable with a nasm_strdup()
++ * copy of the argument on the right, freeing the contents of the
++ * previous contents of the variable if non-NULL.
++ *
++ * If *str is NULL, simply return the old value of *ptrp.
++ */
++char *nasm_strdupto(char **ptrp, const char *str);
++
++/*
++ * Similar, but the new pointer must already have been heap allocated
++ * by the creating function.
++ */
++static inline char *nasm_strto(char **ptrp, char *str)
++{
++    char *ptr = *ptrp;
++    if (!str)
++        return ptr;
++    if (ptr)
++        nasm_free(ptr);
++    return *ptrp = str;
++}
++
+ /*
+  * nasm_[v]asprintf() are variants of the semi-standard [v]asprintf()
+  * functions, except that we return the pointer instead of a count.
+diff --git a/nasmlib/alloc.c b/nasmlib/alloc.c
+index b77d48217..fa3e9e996 100644
+--- a/nasmlib/alloc.c
++++ b/nasmlib/alloc.c
+@@ -101,6 +101,17 @@ char *nasm_strndup(const char *s, size_t len)
+     return memcpy(p, s, len);
+ }
+ 
++char *nasm_strdupto(char **ptrp, const char *str)
++{
++    char *ptr = *ptrp;
++    if (str) {
++        if (ptr)
++            nasm_free(ptr);
++        *ptrp = ptr = nasm_strdup(str);
++    }
++    return ptr;
++}
++
+ char *nasm_strcat(const char *one, const char *two)
+ {
+     char *rslt;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-3.patch b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-3.patch
new file mode 100644
index 0000000000..b25a6de583
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-3.patch
@@ -0,0 +1,51 @@
+From db6cbdf6244ddb729b7c6331f62f42334bc00550 Mon Sep 17 00:00:00 2001
+From: Kris Gavvala <kris.gavvala@windriver.com>
+Date: Wed, 23 Sep 2026 00:57:12 -0500
+Subject: [PATCH] Drop const return type of filename_set_extension()
+
+filename_set_extension() always returns a newly allocated string
+buffer, drop the "const" from the return type.
+
+CVE: CVE-2026-6068
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/7b4e77dae2]
+
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ include/nasmlib.h  | 5 +++--
+ nasmlib/filename.c | 2 +-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/include/nasmlib.h b/include/nasmlib.h
+index 494d7842e..2771c5951 100644
+--- a/include/nasmlib.h
++++ b/include/nasmlib.h
+@@ -366,9 +366,10 @@ struct debug_prefix_list {
+ extern struct debug_prefix_list *debug_prefixes;
+ 
+ /*
+- * Add/replace or remove an extension to the end of a filename
++ * Add/replace or remove an extension to the end of a filename;
++ * returns a newly allocated buffer with the modified filename.
+  */
+-const char *filename_set_extension(const char *inname, const char *extension);
++char *filename_set_extension(const char *inname, const char *extension);
+ char *filename_debug_remap(char *dest, char const *inname, size_t len);
+ 
+ /*
+diff --git a/nasmlib/filename.c b/nasmlib/filename.c
+index 0e27f69e2..85c42a21c 100644
+--- a/nasmlib/filename.c
++++ b/nasmlib/filename.c
+@@ -16,7 +16,7 @@ struct debug_prefix_list *debug_prefixes = NULL;
+  * field at the very end of the filename.  Returns a newly allocated
+  * string buffer.
+  */
+-const char *filename_set_extension(const char *inname, const char *extension)
++char *filename_set_extension(const char *inname, const char *extension)
+ {
+     const char *q = inname;
+     char *p;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm_2.16.03.bb b/meta/recipes-devtools/nasm/nasm_2.16.03.bb
index 729dfe8916..d2608e3e20 100644
--- a/meta/recipes-devtools/nasm/nasm_2.16.03.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.16.03.bb
@@ -9,6 +9,9 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
            file://CVE-2026-6067.patch \
+           file://CVE-2026-6068-1.patch \
+           file://CVE-2026-6068-2.patch \
+           file://CVE-2026-6068-3.patch \
            "
 
 SRC_URI[sha256sum] = "bef3de159bcd61adf98bb7cc87ee9046e944644ad76b7633f18ab063edb29e57"
