Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id BA25A771DF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 18:53:41 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id a7so6063645pax.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 10:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mcwRbsh2sv2bBs45x8h87XR1fnKC692F/fIAAN/IJdI=;
	b=AhcYz7Mo2VH5oj4J+xHg4sOwZe4thnuVoLpMKBDU0BlCo/z0nVM23cTCaqA/Mir+4K
	zg5+IklMVQrCYLmlnGzfUJ40cnUqRQYHnjw6jLhzlo16lWZhnEElfypQh/+rVAlhUH2s
	AW03l+wGyoHuA1D7y7BY9D7Ilg+YdjWwTWFEWwJg/vjXzKU+eKRLmjZCDwZssPdGY6wO
	7SDTQ6mk9zWGewscBAE/NbVmLh8ub6fOvbA4Ojf0umdniqXra9ZYN2LpDSaE+K85iXof
	4LBq4J4qcbFIWV+YXu3HI10J57RAIWQB0fkWEoT3hP2CDrTx41Mb1cEv9a5rmfEXcNdg
	yOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mcwRbsh2sv2bBs45x8h87XR1fnKC692F/fIAAN/IJdI=;
	b=mzwI68MgNrDgQNkgs4xnATXNfh64tcnAnyh0qNDHOGbz3khQI43E8A+b5JwNuNgyRm
	WlHumBVKVzxtSuRwAX8i+HQjLRsOtgLUv+zW1okP02PwmLwmih181oNa91MGBmpCjOeN
	1x3A2EeT25+/34xvXbWmS5yliyMMT/hQQeyW8CdMPe0r8/lagNxt7W56R3lgcJLL6JdA
	ESFC/kBPzwJ6xI/vFjCIEy+8ynHZViL+QHh4IVNLVqEu0vAJZlu33RSIMZX/IKbfft2l
	WsT/DBRrgIjomaVZLG2lU1uRVYFNdQ8tCcy1YmdgLUkUrpdV2yDOZMNuLd41uGMlcpWE
	PVWA==
X-Gm-Message-State: AD7BkJKPs0iYof2+WfW0nVpK7VMxSUNSIksGxKro4+CBLpR5xNGam1x6IOg0Agl1Pl+OcA==
X-Received: by 10.67.6.72 with SMTP id cs8mr17165109pad.138.1456685622515;
	Sun, 28 Feb 2016 10:53:42 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id r6sm8071829pfi.9.2016.02.28.10.53.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 28 Feb 2016 10:53:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 28 Feb 2016 10:53:32 -0800
Message-Id: <1456685615-901-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [dizzy][PATCH 1/4] glibc: CVE-2015-8777
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
X-List-Received-Date: Sun, 28 Feb 2016 18:53:43 -0000

From: Armin Kuster <akuster@mvista.com>

The process_envvars function in elf/rtld.c in the GNU C Library (aka glibc or
libc6) before 2.23 allows local users to bypass a pointer-guarding protection
mechanism via a zero value of the LD_POINTER_GUARD environment variable.

(From OE-Core rev: 22570ba08d7c6157aec58764c73b1134405b0252)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch | 122 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.20.bb             |   4 +-
 2 files changed, 125 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-8777.patch b/meta/recipes-core/glibc/glibc/CVE-2015-8777.patch
new file mode 100644
index 0000000..780fcb9
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2015-8777.patch
@@ -0,0 +1,122 @@
+From a014cecd82b71b70a6a843e250e06b541ad524f7 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Thu, 15 Oct 2015 09:23:07 +0200
+Subject: [PATCH] Always enable pointer guard [BZ #18928]
+
+Honoring the LD_POINTER_GUARD environment variable in AT_SECURE mode
+has security implications.  This commit enables pointer guard
+unconditionally, and the environment variable is now ignored.
+
+        [BZ #18928]
+        * sysdeps/generic/ldsodefs.h (struct rtld_global_ro): Remove
+        _dl_pointer_guard member.
+        * elf/rtld.c (_rtld_global_ro): Remove _dl_pointer_guard
+        initializer.
+        (security_init): Always set up pointer guard.
+        (process_envvars): Do not process LD_POINTER_GUARD.
+
+Upstream-Status: Backport
+CVE: CVE-2015-8777
+[Yocto # 8980]
+
+https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commit;h=a014cecd82b71b70a6a843e250e06b541ad524f7
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog                  | 10 ++++++++++
+ NEWS                       | 13 ++++++++-----
+ elf/rtld.c                 | 15 ++++-----------
+ sysdeps/generic/ldsodefs.h |  3 ---
+ 4 files changed, 22 insertions(+), 19 deletions(-)
+
+Index: git/elf/rtld.c
+===================================================================
+--- git.orig/elf/rtld.c
++++ git/elf/rtld.c
+@@ -163,7 +163,6 @@ struct rtld_global_ro _rtld_global_ro at
+     ._dl_hwcap_mask = HWCAP_IMPORTANT,
+     ._dl_lazy = 1,
+     ._dl_fpu_control = _FPU_DEFAULT,
+-    ._dl_pointer_guard = 1,
+     ._dl_pagesize = EXEC_PAGESIZE,
+     ._dl_inhibit_cache = 0,
+ 
+@@ -710,15 +709,12 @@ security_init (void)
+ #endif
+ 
+   /* Set up the pointer guard as well, if necessary.  */
+-  if (GLRO(dl_pointer_guard))
+-    {
+-      uintptr_t pointer_chk_guard = _dl_setup_pointer_guard (_dl_random,
+-							     stack_chk_guard);
++  uintptr_t pointer_chk_guard
++    = _dl_setup_pointer_guard (_dl_random, stack_chk_guard);
+ #ifdef THREAD_SET_POINTER_GUARD
+-      THREAD_SET_POINTER_GUARD (pointer_chk_guard);
++  THREAD_SET_POINTER_GUARD (pointer_chk_guard);
+ #endif
+-      __pointer_chk_guard_local = pointer_chk_guard;
+-    }
++  __pointer_chk_guard_local = pointer_chk_guard;
+ 
+   /* We do not need the _dl_random value anymore.  The less
+      information we leave behind, the better, so clear the
+@@ -2476,9 +2472,6 @@ process_envvars (enum mode *modep)
+ 	      GLRO(dl_use_load_bias) = envline[14] == '1' ? -1 : 0;
+ 	      break;
+ 	    }
+-
+-	  if (memcmp (envline, "POINTER_GUARD", 13) == 0)
+-	    GLRO(dl_pointer_guard) = envline[14] != '0';
+ 	  break;
+ 
+ 	case 14:
+Index: git/sysdeps/generic/ldsodefs.h
+===================================================================
+--- git.orig/sysdeps/generic/ldsodefs.h
++++ git/sysdeps/generic/ldsodefs.h
+@@ -590,9 +590,6 @@ struct rtld_global_ro
+   /* List of auditing interfaces.  */
+   struct audit_ifaces *_dl_audit;
+   unsigned int _dl_naudit;
+-
+-  /* 0 if internal pointer values should not be guarded, 1 if they should.  */
+-  EXTERN int _dl_pointer_guard;
+ };
+ # define __rtld_global_attribute__
+ # ifdef IS_IN_rtld
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,13 @@
++2015-10-15  Florian Weimer  <fweimer@redhat.com>
++
++   [BZ #18928]
++   * sysdeps/generic/ldsodefs.h (struct rtld_global_ro): Remove
++   _dl_pointer_guard member.
++   * elf/rtld.c (_rtld_global_ro): Remove _dl_pointer_guard
++   initializer.
++   (security_init): Always set up pointer guard.
++   (process_envvars): Do not process LD_POINTER_GUARD.
++
+ 2015-02-05  Paul Pluzhnikov  <ppluzhnikov@google.com>
+ 
+        [BZ #16618] CVE-2015-1472
+Index: git/NEWS
+===================================================================
+--- git.orig/NEWS
++++ git/NEWS
+@@ -24,7 +24,10 @@ Version 2.20
+   17031, 17042, 17048, 17050, 17058, 17061, 17062, 17069, 17075, 17078,
+   17079, 17084, 17086, 17088, 17092, 17097, 17125, 17135, 17137, 17150,
+   17153, 17187, 17213, 17259, 17261, 17262, 17263, 17319, 17325, 17354,
+-  17625, 17630.
++  17625, 17630, 18928.
++
++* The LD_POINTER_GUARD environment variable can no longer be used to
++  disable the pointer guard feature.  It is always enabled.
+ 
+ * The nss_dns implementation of getnetbyname could run into an infinite loop
+   if the DNS response contained a PTR record of an unexpected format.
diff --git a/meta/recipes-core/glibc/glibc_2.20.bb b/meta/recipes-core/glibc/glibc_2.20.bb
index a928293..5e03570 100644
--- a/meta/recipes-core/glibc/glibc_2.20.bb
+++ b/meta/recipes-core/glibc/glibc_2.20.bb
@@ -48,7 +48,9 @@ CVEPATCHES = "\
         file://CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch \
 	file://CVE-2015-1472-wscanf-allocates-too-little-memory.patch \
         file://CVE-2015-7547.patch \
-    "
+        file://CVE-2015-8777.patch \
+"
+
 LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
-- 
2.3.5


