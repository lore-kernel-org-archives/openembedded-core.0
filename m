Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.9672.1629636678932097756
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EEjZsr1n;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id z9so21723796wrh.10
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1oSJGcvCSdAeFVojFxtK6E9j8yj1p1BiTDlatgmVxEk=;
        b=EEjZsr1nQ6FtI5Ba4Wa9XoNNtCFoVu6fgp1AHK+06KTajOsMdNtoaRuM05wx/1l6gX
         qs9+zUaePnN44uBtxhIhqyc3U2ozT3DTNC3fPUK9d3edKj5IeW/tx6dHSEurSkz9dd6J
         +0nSifMeTMVg/DE53X9dqYFXGyiu9EmuAEFyxjKy3UOOChylxlT38HhAKsZGHEOgADP1
         uHD31Kw0KT1g2dmqOJJm4aveBBVeZi2EjY/f647eFl7rEAbgLYVzY22TPQMiK9jI/seE
         rbrmFYiib173+MhXh7V0k917BrcenrJWbNph+pUOs9wAKyKqgoAPKGThKiCimzfrvegl
         Nodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1oSJGcvCSdAeFVojFxtK6E9j8yj1p1BiTDlatgmVxEk=;
        b=Cz6n8hM9bYC95HTFCftAxuhYFeiw1XpawVNzFqdr2MvBlf5u4W8zQDx3UK0Pzp02Ic
         e3O9eLKN3Hftn95TOyPouPNp12KW16a05AK+FM6+EiP4RRDR3pMNtKeLZi9/MNS5Vpry
         zmeXqd2/W3ST9Vab3/UeJ/ktLyxvHxQVPmPpbtUn6KqwuQjBLSdXYsaB90NLIqOeHdpf
         h7H3QnuV6PR+ZmuRYUs4DKrofWKNI81oyiV6/ISIai+gVJrbLjQ5Y9wA+5dXoZglUvZ8
         fBvoZ7u25MB+UhSCAiUBO9Tbb/vXIJtCt1kAozLSMdURD+/CCjjiPbxaeDjJGvUrlKte
         VWUQ==
X-Gm-Message-State: AOAM531ZwmLANnbxveuhJknM395Jd3OQ/N+3GsaR9pRTEmWAJfBofAxO
	luylfJ63/Ek2z51+SNLDM+OhBE15TRSuPw==
X-Google-Smtp-Source: ABdhPJwn0Hmo121WiqZwRmoBlVIVCQsP8G5uyj1s9Ovd5TRtSS0AaNd3nEG41vxakWl8pmi64hNL7A==
X-Received: by 2002:a5d:6485:: with SMTP id o5mr8533991wri.91.1629636677585;
        Sun, 22 Aug 2021 05:51:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/55] diffutils: update 3.7 -> 3.8
Date: Sun, 22 Aug 2021 14:50:18 +0200
Message-Id: <20210822125103.310416-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop patch as issue fixed upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-c-stack-stop-using-SIGSTKSZ.patch    | 84 -------------------
 .../{diffutils_3.7.bb => diffutils_3.8.bb}    |  9 +-
 2 files changed, 5 insertions(+), 88 deletions(-)
 delete mode 100644 meta/recipes-extended/diffutils/diffutils/0001-c-stack-stop-using-SIGSTKSZ.patch
 rename meta/recipes-extended/diffutils/{diffutils_3.7.bb => diffutils_3.8.bb} (81%)

diff --git a/meta/recipes-extended/diffutils/diffutils/0001-c-stack-stop-using-SIGSTKSZ.patch b/meta/recipes-extended/diffutils/diffutils/0001-c-stack-stop-using-SIGSTKSZ.patch
deleted file mode 100644
index 50e627fa30..0000000000
--- a/meta/recipes-extended/diffutils/diffutils/0001-c-stack-stop-using-SIGSTKSZ.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 87b3a8f9ceb2cf0a5c8b72e460465fb9ff2d62d9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 30 Apr 2021 17:40:36 -0700
-Subject: [PATCH] c-stack: stop using SIGSTKSZ
-
-This patch is required with glibc 2.34+
-based on gnulib [1]
-
-[1] https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=f9e2b20a12a230efa30f1d479563ae07d276a94b
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/c-stack.c | 22 +++++++++++++---------
- 1 file changed, 13 insertions(+), 9 deletions(-)
-
-diff --git a/lib/c-stack.c b/lib/c-stack.c
-index 9bbe6fe..e0874c9 100644
---- a/lib/c-stack.c
-+++ b/lib/c-stack.c
-@@ -51,13 +51,14 @@
- typedef struct sigaltstack stack_t;
- #endif
- #ifndef SIGSTKSZ
--# define SIGSTKSZ 16384
--#elif HAVE_LIBSIGSEGV && SIGSTKSZ < 16384
-+#define get_sigstksz()  (16384)
-+#elif HAVE_LIBSIGSEGV
- /* libsigsegv 2.6 through 2.8 have a bug where some architectures use
-    more than the Linux default of an 8k alternate stack when deciding
-    if a fault was caused by stack overflow.  */
--# undef SIGSTKSZ
--# define SIGSTKSZ 16384
-+#define get_sigstksz() ((SIGSTKSZ) < 16384 ? 16384 : (SIGSTKSZ))
-+#else
-+#define get_sigstksz() ((SIGSTKSZ))
- #endif
- 
- #include <stdlib.h>
-@@ -136,7 +137,8 @@ die (int signo)
- /* Storage for the alternate signal stack.  */
- static union
- {
--  char buffer[SIGSTKSZ];
-+  /* allocate buffer with size from get_sigstksz() */
-+  char *buffer;
- 
-   /* These other members are for proper alignment.  There's no
-      standard way to guarantee stack alignment, but this seems enough
-@@ -208,10 +210,11 @@ c_stack_action (void (*action) (int))
-   program_error_message = _("program error");
-   stack_overflow_message = _("stack overflow");
- 
-+  alternate_signal_stack.buffer = malloc(get_sigstksz());
-   /* Always install the overflow handler.  */
-   if (stackoverflow_install_handler (overflow_handler,
-                                      alternate_signal_stack.buffer,
--                                     sizeof alternate_signal_stack.buffer))
-+                                     get_sigstksz()))
-     {
-       errno = ENOTSUP;
-       return -1;
-@@ -284,14 +287,15 @@ c_stack_action (void (*action) (int))
-   stack_t st;
-   struct sigaction act;
-   st.ss_flags = 0;
-+  alternate_signal_stack.buffer = malloc(get_sigstksz());
- # if SIGALTSTACK_SS_REVERSED
-   /* Irix mistakenly treats ss_sp as the upper bound, rather than
-      lower bound, of the alternate stack.  */
--  st.ss_sp = alternate_signal_stack.buffer + SIGSTKSZ - sizeof (void *);
--  st.ss_size = sizeof alternate_signal_stack.buffer - sizeof (void *);
-+  st.ss_sp = alternate_signal_stack.buffer + get_sigstksz() - sizeof (void *);
-+  st.ss_size = get_sigstksz() - sizeof (void *);
- # else
-   st.ss_sp = alternate_signal_stack.buffer;
--  st.ss_size = sizeof alternate_signal_stack.buffer;
-+  st.ss_size = get_sigstksz();
- # endif
-   r = sigaltstack (&st, NULL);
-   if (r != 0)
--- 
-2.31.1
-
diff --git a/meta/recipes-extended/diffutils/diffutils_3.7.bb b/meta/recipes-extended/diffutils/diffutils_3.8.bb
similarity index 81%
rename from meta/recipes-extended/diffutils/diffutils_3.7.bb
rename to meta/recipes-extended/diffutils/diffutils_3.8.bb
index 7b4ae160f9..a6522967d4 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.7.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.8.bb
@@ -6,14 +6,15 @@ require diffutils.inc
 SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
            file://run-ptest \
            file://0001-Skip-strip-trailing-cr-test-case.patch \
-           file://0001-c-stack-stop-using-SIGSTKSZ.patch \
-"
+           "
 
-SRC_URI[md5sum] = "4824adc0e95dbbf11dfbdfaad6a1e461"
-SRC_URI[sha256sum] = "b3a7a6221c3dc916085f0d205abf6b8e1ba443d4dd965118da364a1dc1cb3a26"
+SRC_URI[sha256sum] = "a6bdd7d1b31266d11c4f4de6c1b748d4607ab0231af5188fc2533d0ae2438fec"
 
 EXTRA_OECONF += "ac_cv_path_PR_PROGRAM=${bindir}/pr --without-libsigsegv-prefix"
 
+# latest gnulib is no longer able to handle this - I dare not try to fix that maze of abstractions and generators
+CFLAGS:mingw32 = " -DSA_RESTART=0"
+
 # Fix "Argument list too long" error when len(TMPDIR) = 410
 acpaths = "-I ./m4"
 
-- 
2.31.1

