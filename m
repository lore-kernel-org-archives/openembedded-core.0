Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 97B4D74C97
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 16:52:32 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n2-v6so8414854wrw.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 09:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=E38yVy3QhHjPbeLoAXYjG3xO4Y5S8sxY2txjTjJ8ajs=;
	b=H1Yg/Q5Bi+zqT8zEqODm9TJbUmBQw7TudSYIjN87l0LKwSRr18jo97UUHJJG1vbo7P
	fNq2WT3KEY4BMOw3meArJoT3JjCCIj+AT5tTgf/VqQ9JW8gDaFbQMb84uUShYu5aLC5l
	zEzSrlTfm3QSgiOkInJixQkJSOMh7ckcvCe9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=E38yVy3QhHjPbeLoAXYjG3xO4Y5S8sxY2txjTjJ8ajs=;
	b=a7LjcOyII+mkpiDOoPziKvwKGGP6vPna4rDzML8PymvumF+sjTbPJ3ghZ+YLgP5/PJ
	QlXsLtdbqFlVR2ogl6PHOVB5T0bXcG62lrMjo7IYG93y5BO3P9wPoDg7cU4gbrnZcH21
	0CbKB49FA9Im4PglRNJ3P/4HA1i0c8fbzQDo+cruDfSa8I2JY5rUNaz54MDFO1zsJoJy
	TOLIDc+cC//Tv2v10VteI/jNIwUbIhYNQbfkMwYvY+Kky+9/furBMgbELsAP2gwXJhOD
	QyHjmtp136AikP+wDkpKrlpzPTRagwkfTdDFjfKQdoYWWBSUOsnmKTzP/+wd7RRTL83f
	LSHA==
X-Gm-Message-State: APzg51Di+KS6qSw8tO+g1h80CcQ1EP7Rd3NYWtSs15pHzlb8dih4Ci03
	WuZgSQZazTk4IZ3RHzdel5NB6Vh2f6w=
X-Google-Smtp-Source: ANB0VdaH2EjGJvZFguxLn+Winl6uL/f60Y2kJtXl1p7WvtBruNEL5Tt6Sj8qcfof6yBJduVBXWhVvA==
X-Received: by 2002:a5d:51cf:: with SMTP id
	n15-v6mr28138859wrv.107.1536166352915; 
	Wed, 05 Sep 2018 09:52:32 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u65-v6sm3476169wmd.31.2018.09.05.09.52.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 09:52:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2018 17:52:22 +0100
Message-Id: <20180905165227.29435-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/8] gcc: Merge two related patches together
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
X-List-Received-Date: Wed, 05 Sep 2018 16:52:33 -0000

These patches may as well be merged together as they affect the same code
and things are clearer this way.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-8.2.inc         |  1 -
 .../0003-gcc-poison-system-directories.patch  |  6 ++-
 .../gcc-8.2/0004-gcc-poison-dir-extend.patch  | 39 -------------------
 3 files changed, 4 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-8.2/0004-gcc-poison-dir-extend.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.2.inc b/meta/recipes-devtools/gcc/gcc-8.2.inc
index 8503a66b074..889187e9c42 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.2.inc
@@ -33,7 +33,6 @@ SRC_URI = "\
            ${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
            file://0003-gcc-poison-system-directories.patch \
-           file://0004-gcc-poison-dir-extend.patch \
            file://0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
            file://0006-64-bit-multilib-hack.patch \
            file://0007-optional-libstdc.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0003-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-8.2/0003-gcc-poison-system-directories.patch
index 1839d4c7b8e..05138976c3b 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0003-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.2/0003-gcc-poison-system-directories.patch
@@ -162,7 +162,7 @@ index b11c6a57939..e3b7a21966f 100644
  
  /* Microsoft Windows does not natively support inodes.
     VMS has non-numeric inodes.  */
-@@ -393,6 +394,24 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
+@@ -393,6 +394,26 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
  	}
        fprintf (stderr, _("End of search list.\n"));
      }
@@ -176,7 +176,9 @@ index b11c6a57939..e3b7a21966f 100644
 +         {
 +          if ((!strncmp (p->name, "/usr/include", 12))
 +              || (!strncmp (p->name, "/usr/local/include", 18))
-+              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
++              || (!strncmp (p->name, "/usr/X11R6/include", 18))
++              || (!strncmp (p->name, "/sw/include", 11))
++              || (!strncmp (p->name, "/opt/include", 12)))
 +            warning (OPT_Wpoison_system_directories,
 +                     "include location \"%s\" is unsafe for "
 +                     "cross-compilation",
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0004-gcc-poison-dir-extend.patch b/meta/recipes-devtools/gcc/gcc-8.2/0004-gcc-poison-dir-extend.patch
deleted file mode 100644
index 1072d5b18fb..00000000000
--- a/meta/recipes-devtools/gcc/gcc-8.2/0004-gcc-poison-dir-extend.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 97370eadcd10da5da529dfb734df56993ce24644 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:00:34 +0400
-Subject: [PATCH 04/39] gcc-poison-dir-extend
-
-Add /sw/include and /opt/include based on the original
-zecke-no-host-includes.patch patch.  The original patch checked for
-/usr/include, /sw/include and /opt/include and then triggered a failure and
-aborted.
-
-Instead, we add the two missing items to the current scan.  If the user
-wants this to be a failure, they can add "-Werror=poison-system-directories".
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- gcc/incpath.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/incpath.c b/gcc/incpath.c
-index e3b7a21966f..9a457e02dd3 100644
---- a/gcc/incpath.c
-+++ b/gcc/incpath.c
-@@ -404,7 +404,9 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
-          {
-           if ((!strncmp (p->name, "/usr/include", 12))
-               || (!strncmp (p->name, "/usr/local/include", 18))
--              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
-+              || (!strncmp (p->name, "/usr/X11R6/include", 18))
-+              || (!strncmp (p->name, "/sw/include", 11))
-+              || (!strncmp (p->name, "/opt/include", 12)))
-             warning (OPT_Wpoison_system_directories,
-                      "include location \"%s\" is unsafe for "
-                      "cross-compilation",
--- 
-2.17.0
-
-- 
2.17.1


