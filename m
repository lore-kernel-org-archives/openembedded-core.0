Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 37A3778650
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 17:59:56 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id c194so5272369pga.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 09:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=YzR76dmBN3hFhx5Dz+7uz15DBa+4qT8ujJ2kfwodvBw=;
	b=JxnDmAyXi4eLjALgfy3sAwR+qZ/r9+0GX8GZ62XtCrvc/QC9fvO5Ging9TyOUY2fOX
	b743ZmX6+kW2rfnM2Vh+Cn0Uzz4b7b37GPMWkyUE3+VEtI241s0LaBUAeVkJrsEPrhyv
	MnGjXcz8UsxfecmFUrEQciGP/wcEBrjRCZnWs8hrXUPXo1s2TbPbPfkzRQ/so87yEltn
	GawTMOE887HvrxdBixH81DEJ6oEzHT0GK0iP+ri+egQmRxRI4JTA2L7Fuud2MWBA7HS+
	0BVix8D5xrv8hQupUidNYfgITjD/tHIZepmLrm/VcvFqI2rxIHJkxMcEgevMHWUxclfc
	ZpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YzR76dmBN3hFhx5Dz+7uz15DBa+4qT8ujJ2kfwodvBw=;
	b=lQ0MpK3p6S/kTwUx5MRLpJomtq/J8KHXFLF9PvbLSR2TBgUGEmblKsS1eqKXJH9Dyv
	J86gIpxSe0Mmkq1MEOMhsx/oS5BvRjL6TV3xavlYuVvDgGqwTt+ZMbzwvTkxySjrKTAp
	7MWgQpCz48c0/6R4KjBahLlVWmN+vFe7iNxvnMHbAA9CWXNbNQamyKtU80HC7rXcn9MM
	drpK2FvAjQteJoVbnUMxpjlEHmwIfTqOCIj1WfU9hONeKAEPey6i61bDkBGa8bKiLg+J
	7tdlXKYNavrEygaZwTptutLE2dScPrklVdt6Bo9UlC8YZ/d6Bvq7jXS5pPhqybJEdKCW
	G8zQ==
X-Gm-Message-State: AKwxyteZBU17Xene+wM6YgUBnuO1d/aWU9es3KBVpJ2U4miJ6FTUvViV
	fdV8CRmClEJn3lY5bx1yxW8=
X-Google-Smtp-Source: AH8x227BfN8qUzJr4kntufgxYzNyVyvY3QN5FaQXTCf61R/2EklhWoD4Bxjmmw64ODUFz/rf70+Mhg==
X-Received: by 10.98.158.89 with SMTP id s86mr5884807pfd.203.1516557598230;
	Sun, 21 Jan 2018 09:59:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:a4cf:fc1a:2afa:5e49])
	by smtp.gmail.com with ESMTPSA id
	w83sm29167645pfi.56.2018.01.21.09.59.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jan 2018 09:59:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 21 Jan 2018 09:59:55 -0800
Message-Id: <1516557595-17124-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516557595-17124-1-git-send-email-akuster808@gmail.com>
References: <1516557595-17124-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] glibc: Security Fix CVE-2017-16997
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
X-List-Received-Date: Sun, 21 Jan 2018 17:59:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Affect glibc < 2.27
including current master glibc hash: 77f921dac17c5fa99bd9e926d926c327982895f7

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc/CVE-2017-16997.patch | 151 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.26.bb              |   1 +
 2 files changed, 152 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2017-16997.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2017-16997.patch b/meta/recipes-core/glibc/glibc/CVE-2017-16997.patch
new file mode 100644
index 0000000..d9bde7f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2017-16997.patch
@@ -0,0 +1,151 @@
+From 4ebd0c4191c6073cc8a7c5fdcf1d182c4719bcbb Mon Sep 17 00:00:00 2001
+From: Aurelien Jarno <aurelien@aurel32.net>
+Date: Sat, 30 Dec 2017 10:54:23 +0100
+Subject: [PATCH] elf: Check for empty tokens before dynamic string token
+ expansion [BZ #22625]
+
+The fillin_rpath function in elf/dl-load.c loops over each RPATH or
+RUNPATH tokens and interprets empty tokens as the current directory
+("./"). In practice the check for empty token is done *after* the
+dynamic string token expansion. The expansion process can return an
+empty string for the $ORIGIN token if __libc_enable_secure is set
+or if the path of the binary can not be determined (/proc not mounted).
+
+Fix that by moving the check for empty tokens before the dynamic string
+token expansion. In addition, check for NULL pointer or empty strings
+return by expand_dynamic_string_token.
+
+The above changes highlighted a bug in decompose_rpath, an empty array
+is represented by the first element being NULL at the fillin_rpath
+level, but by using a -1 pointer in decompose_rpath and other functions.
+
+Changelog:
+	[BZ #22625]
+	* elf/dl-load.c (fillin_rpath): Check for empty tokens before dynamic
+	string token expansion. Check for NULL pointer or empty string possibly
+	returned by expand_dynamic_string_token.
+	(decompose_rpath): Check for empty path after dynamic string
+	token expansion.
+(cherry picked from commit 3e3c904daef69b8bf7d5cc07f793c9f07c3553ef)
+
+Upstream-Status: Backport
+CVE: CVE-2017-16997
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog     | 10 ++++++++++
+ NEWS          |  4 ++++
+ elf/dl-load.c | 49 +++++++++++++++++++++++++++++++++----------------
+ 3 files changed, 47 insertions(+), 16 deletions(-)
+
+Index: git/NEWS
+===================================================================
+--- git.orig/NEWS
++++ git/NEWS
+@@ -211,6 +211,10 @@ Security related changes:
+   on the stack or the heap, depending on the length of the user name).
+   Reported by Tim Rühsen.
+ 
++  CVE-2017-16997: Incorrect handling of RPATH or RUNPATH containing $ORIGIN
++  for AT_SECURE or SUID binaries could be used to load libraries from the
++  current directory.
++
+ The following bugs are resolved with this release:
+ 
+   [984] network: Respond to changed resolv.conf in gethostbyname
+Index: git/elf/dl-load.c
+===================================================================
+--- git.orig/elf/dl-load.c
++++ git/elf/dl-load.c
+@@ -433,32 +433,41 @@ fillin_rpath (char *rpath, struct r_sear
+ {
+   char *cp;
+   size_t nelems = 0;
+-  char *to_free;
+ 
+   while ((cp = __strsep (&rpath, sep)) != NULL)
+     {
+       struct r_search_path_elem *dirp;
++      char *to_free = NULL;
++      size_t len = 0;
+ 
+-      to_free = cp = expand_dynamic_string_token (l, cp, 1);
++      /* `strsep' can pass an empty string.  */
++      if (*cp != '\0')
++	{
++	  to_free = cp = expand_dynamic_string_token (l, cp, 1);
+ 
+-      size_t len = strlen (cp);
++	  /* expand_dynamic_string_token can return NULL in case of empty
++	     path or memory allocation failure.  */
++	  if (cp == NULL)
++	    continue;
++
++	  /* Compute the length after dynamic string token expansion and
++	     ignore empty paths.  */
++	  len = strlen (cp);
++	  if (len == 0)
++	    {
++	      free (to_free);
++	      continue;
++	    }
+ 
+-      /* `strsep' can pass an empty string.  This has to be
+-	 interpreted as `use the current directory'. */
+-      if (len == 0)
+-	{
+-	  static const char curwd[] = "./";
+-	  cp = (char *) curwd;
++	  /* Remove trailing slashes (except for "/").  */
++	  while (len > 1 && cp[len - 1] == '/')
++	    --len;
++
++	  /* Now add one if there is none so far.  */
++	  if (len > 0 && cp[len - 1] != '/')
++	    cp[len++] = '/';
+ 	}
+ 
+-      /* Remove trailing slashes (except for "/").  */
+-      while (len > 1 && cp[len - 1] == '/')
+-	--len;
+-
+-      /* Now add one if there is none so far.  */
+-      if (len > 0 && cp[len - 1] != '/')
+-	cp[len++] = '/';
+-
+       /* Make sure we don't use untrusted directories if we run SUID.  */
+       if (__glibc_unlikely (check_trusted) && !is_trusted_path (cp, len))
+ 	{
+@@ -621,6 +630,14 @@ decompose_rpath (struct r_search_path_st
+      necessary.  */
+   free (copy);
+ 
++  /* There is no path after expansion.  */
++  if (result[0] == NULL)
++    {
++      free (result);
++      sps->dirs = (struct r_search_path_elem **) -1;
++      return false;
++    }
++
+   sps->dirs = result;
+   /* The caller will change this value if we haven't used a real malloc.  */
+   sps->malloced = 1;
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,13 @@
++2017-12-30  Aurelien Jarno  <aurelien@aurel32.net>
++           Dmitry V. Levin  <ldv@altlinux.org>
++
++       [BZ #22625]
++       * elf/dl-load.c (fillin_rpath): Check for empty tokens before dynamic
++       string token expansion. Check for NULL pointer or empty string possibly
++       returned by expand_dynamic_string_token.
++       (decompose_rpath): Check for empty path after dynamic string
++       token expansion.
++
+ 2017-10-22  Paul Eggert <eggert@cs.ucla.edu>
+ 
+        [BZ #22332]
diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index 0ba29e4..456ce12 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -44,6 +44,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
            file://0029-malloc-add-missing-arena-lock-in-malloc-info.patch \
            file://CVE-2017-15671.patch \
+           file://CVE-2017-16997.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.7.4


