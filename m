Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4736.1792538580419794117
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=mw3bsb8m;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afbd2c386so60275f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538578; x=1793143378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mCBX6lDrj8FySr75U3MGSU57POz83EoRjB4RgNlyXck=;
        b=mw3bsb8mUHsEdiOJe0dp44YKVAiWFCYzbTCwgEVKZwouCMgYg7Vp7wq9xNq8ohcU2q
         fLWNmxZgodFkfCMWRJLUFIajIkGYCnslnKg9QctdJ3+C8cMFFkOlz+1P8oHIOPu5HpUn
         dL9gDdG7NfIKIMEgK0tJk0FPeXVtbnfESFSFXXBoMVZE4Rj56BGVan9R715vnWdOK0Sh
         UvV1B9+UYEzVVBhdO3lxHD2xydokDd45KaJYXHB+2yMSD3w1h3pt+3Xu4O0eEsZKOloA
         P2KfmOyQSZb/NJEn4qFKDPUqp05PFffWjpK8dyMO/O/+Eta0aA8rSmWF/jhGH5bVX8gx
         fi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538578; x=1793143378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mCBX6lDrj8FySr75U3MGSU57POz83EoRjB4RgNlyXck=;
        b=vNtDbdmGiyo51t+uS6qVLSwiFAehZOxO0Yns9Dvof7AmnX1OjHHkHdnmnN4LZubcl1
         HhEKlMtrfi6oLeGoK2Rqm0/AbUHlIUf8WxzTAfccRzH8Ov1anX8AzdqWecdbHOzvgdkf
         eerxoo512Jxzu8Zu2GM+QCAIyPuaXSeXhmJLiqLTnJLSnogB/nbeqfDUxj0SCLidhAfI
         TZ6+vXQqq1msTnUXNYFFoz7hbYDUt8i24vwBknDq1xXkp32viKKms8E/w6CYhb1OqEHz
         bGMlozk+bLFMjFA5HIVjg24DXQNYvluOXtcRWdvt4Vldb3SsxvF+KBNrMnGZnSOtw09B
         wYbw==
X-Gm-Message-State: AFq9FYISFLdVCzTTyAUWO92TU64h8dVeA/PvbWpS2MiXt3V5RoQYbHS5
	kaUjOvV4z4cc6ym7L8DJI73BbSAfcVMk7TbPm2C+PrcOwctUZME8rUkU4fc9UmjOcfGAROR30Bo
	t+8GjNOM=
X-Gm-Gg: AYBFou398zrAp8iXrkfJ3fTtWn0AfpqHxUt1aVOD9IA+xfdFNrXY+oNPT+ViTShM0me
	seMtpiKwz9OICu4BMG1kSO+CLAne/Kl4Om9Sb3H59DV/ttqOCskgCLvEe/9mL21oGgp3NXVXWpn
	LC0TYsxUcODy7QrCuvR0UPoApX9Uxu+axnRzUEgZ3W/sR8ZaFvI1uYVTKLC3EseyT4MUdqqV1Gs
	EoQV5wZE3s12JHTEDbWZJxaapnvnCksWOqEetHiVLPHD+nsT2KkHmxIeCUWmLxhqu/QxV1c/aKl
	pK/vgSEPfYIhE4/RVmanID6Po6ixkrIlGqtpRoJFsKyivDu+yIh5Pf309H0PuYqRP5pp1SCZgJb
	lzb3HRpEpBRPcGttexxn5yJtFNbfY98APk3I20bggHqi6tyGEBB+z0zMEbCLnYTQ5F9bUUZCu8t
	6x/IY9D6wPpU61zpeomAlrM2ExI5A3HEPPXenN5E4eeHOO/sookgyX+LAIo6HJygClMVVG+95Gh
	qs8U0IbHmGrvlBq79YgQMuItRptcJs2BLzi87N/qGFu1sHTO+j66oQLEoiy5Li2OE8PyFwQrw==
X-Received: by 2002:a05:6000:1a8a:b0:48d:dc6f:219a with SMTP id ffacd0b85a97d-48e264ad992mr363349f8f.27.1792538578443;
        Tue, 20 Oct 2026 16:22:58 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.22.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:22:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/25] nasm: fix CVE-2026-6068
Date: Wed, 21 Oct 2026 01:22:22 +0200
Message-ID: <72e1f3638c4f03634de6d288802f78fef16f097e.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248331
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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../nasm/nasm/CVE-2026-6068-1.patch           | 98 +++++++++++++++++++
 .../nasm/nasm/CVE-2026-6068-2.patch           | 80 +++++++++++++++
 .../nasm/nasm/CVE-2026-6068-3.patch           | 51 ++++++++++
 meta/recipes-devtools/nasm/nasm_3.01.bb       |  3 +
 4 files changed, 232 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-2.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-3.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch b/meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch
new file mode 100644
index 00000000000..44f691610a7
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
index 00000000000..4b2334776aa
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
index 00000000000..b25a6de5832
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
diff --git a/meta/recipes-devtools/nasm/nasm_3.01.bb b/meta/recipes-devtools/nasm/nasm_3.01.bb
index e8079732d43..186ae57ce4c 100644
--- a/meta/recipes-devtools/nasm/nasm_3.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_3.01.bb
@@ -10,6 +10,9 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0002-Add-debug-prefix-map-option.patch \
            file://0001-compiler.h-Backport-C23-support.patch \
            file://CVE-2026-6067.patch \
+           file://CVE-2026-6068-1.patch \
+           file://CVE-2026-6068-2.patch \
+           file://CVE-2026-6068-3.patch \
            "
 
 SRC_URI[sha256sum] = "7a7b1ff3b0eef3247862f2fbe4ca605ccef770545d7af7979eba84a9d045c0b1"
