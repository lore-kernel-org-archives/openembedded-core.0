Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0A63E7C6FA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 00:19:27 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 196so6830000pgf.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 16:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+08MePgoorZ8BiPDXxxdjyvulPi7j0GOxWzoLG8KE9U=;
	b=vVXw7rPsQJrfti8PYyn9Ifb2JzqMha62+8w5xFfRaVuhS5m+NQcF1pvnFwvr7qNjz1
	tCojqqeoka0uVGbITwAafuLqrK03dptMdDkLs8ZZ9PmTk3vS5kRZJQTVEEpq2ZDSPazl
	OzOgDWrI8Y4ldSWKYKSn4LX6HJduc7BbKhep9BUtWvCqh2xwBq3Q5rT3bZxSiFZudEWV
	UF3RnNLU1JJnBmNVTZR6aj1paXNJFK4PMwtFEqhEzKXqBkhK1/zyeDiEsSAJ3/Zrcgwy
	7VORySotRgGo38Clh5oJXSgQAdlSbpofGfABygnqNWHwRmZksjd1Q+L4yjU3zDYAlmnl
	kkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+08MePgoorZ8BiPDXxxdjyvulPi7j0GOxWzoLG8KE9U=;
	b=PBdyG/qeb8Gtp8pG32nFWN3yBQMVV5ELNd0JovKPJzOor5bF7eCZ7yeM6o9xRKmDUI
	zjMn+Jx13PN0/0qH7HVluav5QP63hsf4BYYh1k5QT2N0jMSq6tINdZSbpqrxtcAUTW4+
	Z6WVbucTrVWkXRWviTji+gXlXmG3HG15sz3/pk7jgdnw6iYQovctdl+57vHaSOLHHElt
	XzLdNvMDKOBdAmsaURo4SCDOVDWzln3Fdc/qzQGS51+08f+A0ixenWMFKexroe2HBegA
	WZZBAD+nnf3pkVlq4RfrwpzW83b8jK6nvxOaAgn3odfasfmT2zUiSV0tetgFuGKUq0EH
	jb8Q==
X-Gm-Message-State: APjAAAUJX7AO/nVISpUVMqoCUhwIk/6wZ9vGbx8cTjujOZHCfbzcoNiT
	LxI+DMY6S4kVDfSnrcrbp1Ein4zS
X-Google-Smtp-Source: APXvYqxS1B6u8pzKhPycBSkrxDg+B7TnkCnc7exfvF4Dvrn5TaFVCJ4N/uK3zrs9RhLEDwnnx1iHsg==
X-Received: by 2002:a17:902:b902:: with SMTP id
	bf2mr4064047plb.286.1551831568386; 
	Tue, 05 Mar 2019 16:19:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id u28sm112655pgn.32.2019.03.05.16.19.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 16:19:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2019 16:19:19 -0800
Message-Id: <20190306001919.8404-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Yuanjie Huang <yuanjie.huang@windriver.com>,
	Damodar Sonone <damodar.sonone@kpit.com>,
	Raghunath Lolur <Raghunath.Lolur@kpit.com>
Subject: [PATCH] glibc: Drop upstream rejected patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2019 00:19:28 -0000
Content-Transfer-Encoding: 8bit

These patches were applied, hoping that they will eventually be accepted
upstream but they have been rejected, I think its best that they are
dropped so we can avoid novel unintended behaviours that no other
distros will be seeing

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...set-dl_load_write_lock-after-forking.patch | 40 -----------
 ...ck-before-switching-to-malloc_atfork.patch | 68 -------------------
 meta/recipes-core/glibc/glibc_2.29.bb         |  2 -
 3 files changed, 110 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch b/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
deleted file mode 100644
index 70696b8d3c..0000000000
--- a/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e6e6e5011611fa22186508a3ff8ed4215a529f1f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Jan 2018 10:05:07 -0800
-Subject: [PATCH 26/30] reset dl_load_write_lock after forking
-
-The patch in this Bugzilla entry was requested by a customer:
-
-  https://www.sourceware.org/bugzilla/show_bug.cgi?id=19282
-
-The __libc_fork() code reset dl_load_lock, but it also needed to reset
-dl_load_write_lock.  The patch has not yet been integrated upstream.
-
-Upstream-Status: Pending [ No Author See bugzilla]
-
-Signed-off-by: Damodar Sonone <damodar.sonone@kpit.com>
-Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- sysdeps/nptl/fork.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/sysdeps/nptl/fork.c b/sysdeps/nptl/fork.c
-index bd68f18b45..5c9bb44372 100644
---- a/sysdeps/nptl/fork.c
-+++ b/sysdeps/nptl/fork.c
-@@ -130,9 +130,9 @@ __libc_fork (void)
- 	  _IO_list_resetlock ();
- 	}
- 
--      /* Reset the lock the dynamic loader uses to protect its data.  */
-+      /* Reset the locks the dynamic loader uses to protect its data.  */
-       __rtld_lock_initialize (GL(dl_load_lock));
--
-+      __rtld_lock_initialize (GL(dl_load_write_lock));
-       /* Run the handlers registered for the child.  */
-       __run_fork_handlers (atfork_run_child);
-     }
--- 
-2.20.1
-
diff --git a/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch b/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
deleted file mode 100644
index 5bc813a900..0000000000
--- a/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From eb43af9afba3c2b499be6e71b69687d4e7c6272a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Jan 2018 10:08:04 -0800
-Subject: [PATCH 27/30] Acquire ld.so lock before switching to malloc_atfork
-
-The patch is from
-  https://sourceware.org/bugzilla/show_bug.cgi?id=4578
-
-If a thread happens to hold dl_load_lock and have r_state set to RT_ADD or
-RT_DELETE at the time another thread calls fork(), then the child exit code
-from fork (in nptl/sysdeps/unix/sysv/linux/fork.c in our case) re-initializes
-dl_load_lock but does not restore r_state to RT_CONSISTENT. If the child
-subsequently requires ld.so functionality before calling exec(), then the
-assertion will fire.
-
-The patch acquires dl_load_lock on entry to fork() and releases it on exit
-from the parent path.  The child path is initialized as currently done.
-This is essentially pthreads_atfork, but forced to be first because the
-acquisition of dl_load_lock must happen before malloc_atfork is active
-to avoid a deadlock.
-
-The patch has not yet been integrated upstream.
-
-Upstream-Status: Pending [ Not Author See bugzilla]
-
-Signed-off-by: Raghunath Lolur <Raghunath.Lolur@kpit.com>
-Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- sysdeps/nptl/fork.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/sysdeps/nptl/fork.c b/sysdeps/nptl/fork.c
-index 5c9bb44372..84a1a404b3 100644
---- a/sysdeps/nptl/fork.c
-+++ b/sysdeps/nptl/fork.c
-@@ -25,6 +25,7 @@
- #include <tls.h>
- #include <hp-timing.h>
- #include <ldsodefs.h>
-+#include <libc-lock.h>
- #include <stdio-lock.h>
- #include <atomic.h>
- #include <nptl/pthreadP.h>
-@@ -56,6 +57,9 @@ __libc_fork (void)
-   bool multiple_threads = THREAD_GETMEM (THREAD_SELF, header.multiple_threads);
- 
-   __run_fork_handlers (atfork_run_prepare);
-+  /* grab ld.so lock BEFORE switching to malloc_atfork */
-+  __rtld_lock_lock_recursive (GL(dl_load_lock));
-+  __rtld_lock_lock_recursive (GL(dl_load_write_lock));
- 
-   /* If we are not running multiple threads, we do not have to
-      preserve lock state.  If fork runs from a signal handler, only
-@@ -150,6 +154,9 @@ __libc_fork (void)
- 
-       /* Run the handlers registered for the parent.  */
-       __run_fork_handlers (atfork_run_parent);
-+      /* unlock ld.so last, because we locked it first */
-+      __rtld_lock_unlock_recursive (GL(dl_load_write_lock));
-+      __rtld_lock_unlock_recursive (GL(dl_load_lock));
-     }
- 
-   return pid;
--- 
-2.20.1
-
diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
index 4577350eae..db856c70ad 100644
--- a/meta/recipes-core/glibc/glibc_2.29.bb
+++ b/meta/recipes-core/glibc/glibc_2.29.bb
@@ -51,8 +51,6 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
            file://0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
-           file://0026-reset-dl_load_write_lock-after-forking.patch \
-           file://0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch \
            file://0028-intl-Emit-no-lines-in-bison-generated-files.patch \
            file://0029-inject-file-assembly-directives.patch \
            file://0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
-- 
2.21.0


