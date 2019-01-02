Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 061D76BC15
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 16:36:22 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id a14so14690201plm.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 08:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/i/KyNjA52d3jC0Mswwxp8JO4lyggHjoR8HoWW+k1/8=;
	b=SRZG0+E8GxpO2L4I9WSNvaXFyfudxBT4jM7BnEZ8ZOpBQ2j3izer22WDMxyq6ZVSP5
	L/PcPaQs4SJ+t2MukJzf0+ub1w6u/GDThH1Cs7+A7WgEayvvDTAGmDnhBsAgk5X63RV1
	MlKwUl/rtT55hLDMRZvlOfEZLcBaFz6mgozvaqdTUKBRW0i/DqbnLah4I9uweQpQ0YMf
	XW5Dvt7ekP2rbKgL61DvB1qAtCH18T8Acn5vm60NE9HPxrCTvtUicDdF5ENuW6yYl2kH
	lnjLO707iASZSY6n8rDDY7NkATDIlARNZOdCQtmuG63X0GZk8dO4/hO1x24qBSZ42Faf
	/JeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/i/KyNjA52d3jC0Mswwxp8JO4lyggHjoR8HoWW+k1/8=;
	b=FbcIhVDvn/eymGUHDji/+EOCV4eHwAQhYBKRqdOYaWZlGcmVfJvA6WcV/Fu+fNHIzO
	PEPoC8HIknnn6iJFqoNwZwbaj2CUy0X/4NWvTwDAd2JIjT518yRVo21wPAFd4yTsRTDe
	xO0smWhD1td1L1ijA5r/+7CchfWTzFb6E94XxqtyKAFXfz9zIZuBB/51Bf9DHRfCamDi
	xWLnCW2eov1osJfqsD2RWVSQ4d0hcCUdxHdHs0nsE5mS4fMbGfxb/7sum4nL7/T22BIP
	qIiuxbHUtBY4mVB5kYJx3cmefBW0FYu7aul2WHIvOMhWVUspCh18nEBKO+573BWlEwGN
	Or0Q==
X-Gm-Message-State: AJcUukfyiaQ84AoD+OYSHseFgP29Y03e6kOp1jNhmVmLE/e+bxWPQBS3
	hv+XHCbJ5p/IVap3UwKookrioSYh
X-Google-Smtp-Source: ALg8bN5/E1EiqET7rlBnFqBcG1L2bvxlmALSqz/pAcmwo+/jqA4Oj7uI7ANAHJlzmvLL8EDc2z2y0Q==
X-Received: by 2002:a17:902:b406:: with SMTP id
	x6mr42182447plr.329.1546446983725; 
	Wed, 02 Jan 2019 08:36:23 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:b176:14d6:5577:24f])
	by smtp.gmail.com with ESMTPSA id
	v89sm62973472pfj.164.2019.01.02.08.36.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Jan 2019 08:36:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 08:36:15 -0800
Message-Id: <1546446977-27510-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
References: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 6/8] libgpg-error: Update to 1.33
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
X-List-Received-Date: Wed, 02 Jan 2019 16:36:23 -0000

Drop patches now included in the update
refactoered pkgconfig.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...port-ARC-CPUs-and-simplify-aliasing-table.patch | 298 ---------------------
 ...cfg-Add-support-for-arc-unknown-linux-gnu.patch |  35 ---
 .../libgpg-error/libgpg-error/pkgconfig.patch      | 178 ++++++------
 .../{libgpg-error_1.32.bb => libgpg-error_1.33.bb} |   7 +-
 4 files changed, 101 insertions(+), 417 deletions(-)
 delete mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-syscfg-Support-ARC-CPUs-and-simplify-aliasing-table.patch
 delete mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0002-syscfg-Add-support-for-arc-unknown-linux-gnu.patch
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.32.bb => libgpg-error_1.33.bb} (88%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-syscfg-Support-ARC-CPUs-and-simplify-aliasing-table.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-syscfg-Support-ARC-CPUs-and-simplify-aliasing-table.patch
deleted file mode 100644
index 03b0ce7..0000000
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-syscfg-Support-ARC-CPUs-and-simplify-aliasing-table.patch
+++ /dev/null
@@ -1,298 +0,0 @@
-From d4fd6975671477721936060771aa4d7d07fb0910 Mon Sep 17 00:00:00 2001
-From: Werner Koch <wk@gnupg.org>
-Date: Tue, 18 Sep 2018 14:54:08 +0200
-Subject: [PATCH libgpg-error] syscfg: Support ARC CPUs and simplify aliasing
- table.
-
-* src/mkheader.c (xmalloc): New.
-(xstrdup): Implement using xmalloc.
-(canon_host_triplet): Add supporr for arc CPU.  Adjust alias table to
-also alias *-pc-*.  Rename ibm to unknown. Add internal arg.  Add
-unknown vendor hack.
-(main): New mode to just print the canonicalized form.
-* src/Makefile.am (lock_obj_pub): s/-(pc|ibm)-/-unknown/.  Also rename
-files accordingly.
---
-
-config.sub does no real aliasing and thus we would need to add several
-vendors to the alising tables despite that this has no technical
-meanding.  Instead we now replace the vendor with "unknown" for the
-4-part-"triplets".  This change will make maintenace easier.
-
-Signed-off-by: Werner Koch <wk@gnupg.org>
-
-Upstream-Status: Backport [ http://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commit;h=48c8f8ddfc80 ]
----
- src/Makefile.am                               | 16 ++--
- src/mkheader.c                                | 92 ++++++++++++++++---
- ...-gnu.h => lock-obj-pub.i686-unknown-gnu.h} |  0
- ... lock-obj-pub.i686-unknown-kfreebsd-gnu.h} |  0
- ... => lock-obj-pub.i686-unknown-linux-gnu.h} |  0
- ...=> lock-obj-pub.s390x-unknown-linux-gnu.h} |  0
- ...ock-obj-pub.x86_64-unknown-kfreebsd-gnu.h} |  0
- ...> lock-obj-pub.x86_64-unknown-linux-gnu.h} |  0
- ...ock-obj-pub.x86_64-unknown-linux-gnux32.h} |  0
- ... lock-obj-pub.x86_64-unknown-linux-musl.h} |  0
- 10 files changed, 85 insertions(+), 23 deletions(-)
- rename src/syscfg/{lock-obj-pub.i686-pc-gnu.h => lock-obj-pub.i686-unknown-gnu.h} (100%)
- rename src/syscfg/{lock-obj-pub.i686-pc-kfreebsd-gnu.h => lock-obj-pub.i686-unknown-kfreebsd-gnu.h} (100%)
- rename src/syscfg/{lock-obj-pub.i686-pc-linux-gnu.h => lock-obj-pub.i686-unknown-linux-gnu.h} (100%)
- rename src/syscfg/{lock-obj-pub.s390x-ibm-linux-gnu.h => lock-obj-pub.s390x-unknown-linux-gnu.h} (100%)
- rename src/syscfg/{lock-obj-pub.x86_64-pc-kfreebsd-gnu.h => lock-obj-pub.x86_64-unknown-kfreebsd-gnu.h} (100%)
- rename src/syscfg/{lock-obj-pub.x86_64-pc-linux-gnu.h => lock-obj-pub.x86_64-unknown-linux-gnu.h} (100%)
- rename src/syscfg/{lock-obj-pub.x86_64-pc-linux-gnux32.h => lock-obj-pub.x86_64-unknown-linux-gnux32.h} (100%)
- rename src/syscfg/{lock-obj-pub.x86_64-pc-linux-musl.h => lock-obj-pub.x86_64-unknown-linux-musl.h} (100%)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 42998e46a3bc..8ec582ef99fb 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -52,9 +52,9 @@ lock_obj_pub = \
- 	syscfg/lock-obj-pub.arm-apple-darwin.h              \
-         syscfg/lock-obj-pub.hppa-unknown-linux-gnu.h        \
- 	syscfg/lock-obj-pub.i386-apple-darwin.h             \
--        syscfg/lock-obj-pub.i686-pc-gnu.h                   \
--        syscfg/lock-obj-pub.i686-pc-kfreebsd-gnu.h          \
--        syscfg/lock-obj-pub.i686-pc-linux-gnu.h             \
-+        syscfg/lock-obj-pub.i686-unknown-gnu.h              \
-+        syscfg/lock-obj-pub.i686-unknown-kfreebsd-gnu.h     \
-+        syscfg/lock-obj-pub.i686-unknown-linux-gnu.h        \
-         syscfg/lock-obj-pub.m68k-unknown-linux-gnu.h        \
-         syscfg/lock-obj-pub.mips-unknown-linux-gnu.h        \
-         syscfg/lock-obj-pub.mips64el-unknown-linux-gnuabi64.h \
-@@ -66,16 +66,16 @@ lock_obj_pub = \
- 	syscfg/lock-obj-pub.powerpc64le-unknown-linux-gnu.h \
- 	syscfg/lock-obj-pub.powerpc-unknown-linux-gnuspe.h  \
- 	syscfg/lock-obj-pub.riscv64-unknown-linux-gnu.h     \
--        syscfg/lock-obj-pub.s390x-ibm-linux-gnu.h           \
-+        syscfg/lock-obj-pub.s390x-unknown-linux-gnu.h       \
-         syscfg/lock-obj-pub.sh3-unknown-linux-gnu.h         \
-         syscfg/lock-obj-pub.sh4-unknown-linux-gnu.h         \
-         syscfg/lock-obj-pub.sparc-unknown-linux-gnu.h       \
-         syscfg/lock-obj-pub.sparc64-unknown-linux-gnu.h     \
- 	syscfg/lock-obj-pub.x86_64-apple-darwin.h           \
--        syscfg/lock-obj-pub.x86_64-pc-kfreebsd-gnu.h        \
--        syscfg/lock-obj-pub.x86_64-pc-linux-gnu.h           \
--        syscfg/lock-obj-pub.x86_64-pc-linux-gnux32.h        \
--        syscfg/lock-obj-pub.x86_64-pc-linux-musl.h          \
-+        syscfg/lock-obj-pub.x86_64-unknown-kfreebsd-gnu.h   \
-+        syscfg/lock-obj-pub.x86_64-unknown-linux-gnu.h      \
-+        syscfg/lock-obj-pub.x86_64-unknown-linux-gnux32.h   \
-+        syscfg/lock-obj-pub.x86_64-unknown-linux-musl.h     \
- 	syscfg/lock-obj-pub.tilegx-unknown-linux-gnu.h      \
- 	syscfg/lock-obj-pub.ia64-unknown-linux-gnu.h        \
- 	syscfg/lock-obj-pub.mingw32.h
-diff --git a/src/mkheader.c b/src/mkheader.c
-index 2fc5fada66a4..7a38a1bec1a4 100644
---- a/src/mkheader.c
-+++ b/src/mkheader.c
-@@ -51,17 +51,27 @@ xfree (void *a)
- 
- 
- static char *
--xstrdup (const char *string)
-+xmalloc (size_t n)
- {
-   char *p;
--  size_t len = strlen (string) + 1;
- 
--  p = malloc (len);
-+  p = malloc (n);
-   if (!p)
-     {
-       fputs (PGM ": out of core\n", stderr);
-       exit (1);
-     }
-+  return p;
-+}
-+
-+
-+static char *
-+xstrdup (const char *string)
-+{
-+  char *p;
-+  size_t len = strlen (string) + 1;
-+
-+  p = xmalloc (len);
-   memcpy (p, string, len);
-   return p;
- }
-@@ -69,23 +79,31 @@ xstrdup (const char *string)
- 
- /* Return a malloced string with TRIPLET.  If TRIPLET has an alias
-    return that instead.  In general build-aux/config.sub should do the
--   aliasing but some returned triplets are anyway identical and thus we
--   use this function to map it to the canonical form.  */
-+   aliasing but some returned triplets are anyway identical and thus
-+   we use this function to map it to the canonical form.
-+   NO_VENDOR_HACK is for internal use; caller must call with 0. */
- static char *
--canon_host_triplet (const char *triplet)
-+canon_host_triplet (const char *triplet, int no_vendor_hack)
- {
-   struct {
-     const char *name;
-     const char *alias;
-   } tbl[] = {
--    {"i486-pc-linux-gnu", "i686-pc-linux-gnu" },
-+    {"i486-pc-linux-gnu", "i686-unknown-linux-gnu" },
-     {"i586-pc-linux-gnu" },
--    {"i486-pc-gnu", "i686-pc-gnu"},
-+    {"i686-pc-linux-gnu" },
-+    {"arc-oe-linux-uclibc" }, /* Other CPU but same struct.  */
-+
-+    {"i486-pc-gnu", "i686-unknown-gnu"},
-     {"i586-pc-gnu"},
--    {"i486-pc-kfreebsd-gnu", "i686-pc-kfreebsd-gnu"},
-+    {"i686-pc-gnu"},
-+
-+    {"i486-pc-kfreebsd-gnu", "i686-unknown-kfreebsd-gnu"},
-     {"i586-pc-kfreebsd-gnu"},
-+    {"i686-pc-kfreebsd-gnu"},
- 
--    {"x86_64-pc-linux-gnuhardened1", "x86_64-pc-linux-gnu" },
-+    {"x86_64-pc-linux-gnuhardened1", "x86_64-unknown-linux-gnu" },
-+    {"x86_64-pc-linux-gnu" },
- 
-     {"powerpc-unknown-linux-gnuspe", "powerpc-unknown-linux-gnu" },
- 
-@@ -98,6 +116,7 @@ canon_host_triplet (const char *triplet)
-   };
-   int i;
-   const char *lastalias = NULL;
-+  const char *s;
- 
-   for (i=0; tbl[i].name; i++)
-     {
-@@ -110,6 +129,36 @@ canon_host_triplet (const char *triplet)
-           return xstrdup (lastalias);
-         }
-     }
-+  for (i=0, s=triplet; *s; s++)
-+    if (*s == '-')
-+      i++;
-+  if (i > 2 && !no_vendor_hack)
-+    {
-+      /* We have a 4 part "triplet": CPU-VENDOR-KERNEL-SYSTEM where
-+       * the last two parts replace the OS part of a real triplet.
-+       * The VENDOR part is then in general useless because
-+       * KERNEL-SYSTEM is specific enough.  We now do a second pass by
-+       * replacing VENDOR with "unknown".  */
-+      char *p;
-+      char *buf = xmalloc (strlen (triplet) + 7 + 1);
-+
-+      for (p=buf,s=triplet,i=0; *s; s++)
-+        {
-+          *p++ = *s;
-+          if (*s == '-' && ++i == 1)
-+            {
-+              memcpy (p, "unknown-",8);
-+              p += 8;
-+              for (s++; *s != '-'; s++)
-+                ;
-+            }
-+        }
-+      *p = 0;
-+      p = canon_host_triplet (buf, 1);
-+      xfree (buf);
-+      return p;
-+    }
-+
-   return xstrdup (triplet);
- }
- 
-@@ -558,7 +607,7 @@ write_special (const char *fname, int lnr, const char *tag)
- int
- main (int argc, char **argv)
- {
--  FILE *fp;
-+  FILE *fp = NULL;
-   char line[LINESIZE];
-   int lnr = 0;
-   const char *fname, *s;
-@@ -571,11 +620,22 @@ main (int argc, char **argv)
-       argc--; argv++;
-     }
- 
--  if (argc != 6)
-+  if (argc == 1)
-+    {
-+      /* Print just the canonicalized host triplet.  */
-+      host_triplet = canon_host_triplet (argv[0], 0);
-+      printf ("%s\n", host_triplet);
-+      goto leave;
-+    }
-+  else if (argc == 6)
-+    ; /* Standard operation.  */
-+  else
-     {
-       fputs ("usage: " PGM
-              " host_os host_triplet template.h config.h"
--             " version version_number\n",
-+             " version version_number\n"
-+             "       " PGM
-+             " host_triplet\n",
-              stderr);
-       return 1;
-     }
-@@ -586,7 +646,7 @@ main (int argc, char **argv)
-   hdr_version = argv[4];
-   hdr_version_number = argv[5];
- 
--  host_triplet = canon_host_triplet (host_triplet_raw);
-+  host_triplet = canon_host_triplet (host_triplet_raw, 0);
- 
-   srcdir = malloc (strlen (fname) + 2 + 1);
-   if (!srcdir)
-@@ -677,13 +737,15 @@ main (int argc, char **argv)
-          "End:\n"
-          "*/\n", stdout);
- 
-+ leave:
-   if (ferror (stdout))
-     {
-       fprintf (stderr, PGM ": error writing to stdout: %s\n", strerror (errno));
-       return 1;
-     }
- 
--  fclose (fp);
-+  if (fp)
-+    fclose (fp);
- 
-   xfree (host_triplet);
-   return 0;
-diff --git a/src/syscfg/lock-obj-pub.i686-pc-gnu.h b/src/syscfg/lock-obj-pub.i686-unknown-gnu.h
-similarity index 100%
-rename from src/syscfg/lock-obj-pub.i686-pc-gnu.h
-rename to src/syscfg/lock-obj-pub.i686-unknown-gnu.h
-diff --git a/src/syscfg/lock-obj-pub.i686-pc-kfreebsd-gnu.h b/src/syscfg/lock-obj-pub.i686-unknown-kfreebsd-gnu.h
-similarity index 100%
-rename from src/syscfg/lock-obj-pub.i686-pc-kfreebsd-gnu.h
-rename to src/syscfg/lock-obj-pub.i686-unknown-kfreebsd-gnu.h
-diff --git a/src/syscfg/lock-obj-pub.i686-pc-linux-gnu.h b/src/syscfg/lock-obj-pub.i686-unknown-linux-gnu.h
-similarity index 100%
-rename from src/syscfg/lock-obj-pub.i686-pc-linux-gnu.h
-rename to src/syscfg/lock-obj-pub.i686-unknown-linux-gnu.h
-diff --git a/src/syscfg/lock-obj-pub.s390x-ibm-linux-gnu.h b/src/syscfg/lock-obj-pub.s390x-unknown-linux-gnu.h
-similarity index 100%
-rename from src/syscfg/lock-obj-pub.s390x-ibm-linux-gnu.h
-rename to src/syscfg/lock-obj-pub.s390x-unknown-linux-gnu.h
-diff --git a/src/syscfg/lock-obj-pub.x86_64-pc-kfreebsd-gnu.h b/src/syscfg/lock-obj-pub.x86_64-unknown-kfreebsd-gnu.h
-similarity index 100%
-rename from src/syscfg/lock-obj-pub.x86_64-pc-kfreebsd-gnu.h
-rename to src/syscfg/lock-obj-pub.x86_64-unknown-kfreebsd-gnu.h
-diff --git a/src/syscfg/lock-obj-pub.x86_64-pc-linux-gnu.h b/src/syscfg/lock-obj-pub.x86_64-unknown-linux-gnu.h
-similarity index 100%
-rename from src/syscfg/lock-obj-pub.x86_64-pc-linux-gnu.h
-rename to src/syscfg/lock-obj-pub.x86_64-unknown-linux-gnu.h
-diff --git a/src/syscfg/lock-obj-pub.x86_64-pc-linux-gnux32.h b/src/syscfg/lock-obj-pub.x86_64-unknown-linux-gnux32.h
-similarity index 100%
-rename from src/syscfg/lock-obj-pub.x86_64-pc-linux-gnux32.h
-rename to src/syscfg/lock-obj-pub.x86_64-unknown-linux-gnux32.h
-diff --git a/src/syscfg/lock-obj-pub.x86_64-pc-linux-musl.h b/src/syscfg/lock-obj-pub.x86_64-unknown-linux-musl.h
-similarity index 100%
-rename from src/syscfg/lock-obj-pub.x86_64-pc-linux-musl.h
-rename to src/syscfg/lock-obj-pub.x86_64-unknown-linux-musl.h
--- 
-2.17.1
-
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0002-syscfg-Add-support-for-arc-unknown-linux-gnu.patch b/meta/recipes-support/libgpg-error/libgpg-error/0002-syscfg-Add-support-for-arc-unknown-linux-gnu.patch
deleted file mode 100644
index 197652f..0000000
--- a/meta/recipes-support/libgpg-error/libgpg-error/0002-syscfg-Add-support-for-arc-unknown-linux-gnu.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ae6a3f20345dac4b9daab8c39ac2d3fb3f2c21e3 Mon Sep 17 00:00:00 2001
-From: Werner Koch <wk@gnupg.org>
-Date: Fri, 21 Sep 2018 14:37:21 +0200
-Subject: [PATCH Libgpg-error] syscfg: Add support for arc-unknown-linux-gnu
-
-* src/mkheader.c (canon_host_triplet): Add to table.
---
-
-Note that unknown in the above triplet is actually a wildcard for 4
-part triplets.
-
-Signed-off-by: Werner Koch <wk@gnupg.org>
-
-Upstream-Status: Backport [http://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commit;h=f4f0da74f526d7e35cedbc2e93454df6440dbfa5]
----
- src/mkheader.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/mkheader.c b/src/mkheader.c
-index 7a38a1bec1a4..a4866e96ef43 100644
---- a/src/mkheader.c
-+++ b/src/mkheader.c
-@@ -92,7 +92,8 @@ canon_host_triplet (const char *triplet, int no_vendor_hack)
-     {"i486-pc-linux-gnu", "i686-unknown-linux-gnu" },
-     {"i586-pc-linux-gnu" },
-     {"i686-pc-linux-gnu" },
--    {"arc-oe-linux-uclibc" }, /* Other CPU but same struct.  */
-+    {"arc-oe-linux-gnu"    }, /* Other CPU but same struct.  */
-+    {"arc-oe-linux-uclibc" }, /* and uclibc is also the same.  */
- 
-     {"i486-pc-gnu", "i686-unknown-gnu"},
-     {"i586-pc-gnu"},
--- 
-2.17.1
-
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 3066613..ca5f6b5 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -8,53 +8,21 @@ Upstream-Status: Pending
 Rebase to 1.28
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Refactored for 1.33
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
 ---
  configure.ac        |  1 +
- src/Makefile.am     |  4 ++-
  src/gpg-error.m4    | 71 +++--------------------------------------------------
- src/gpg-error.pc.in | 11 +++++++++
  4 files changed, 18 insertions(+), 69 deletions(-)
  create mode 100644 src/gpg-error.pc.in
 
-diff --git a/configure.ac b/configure.ac
-index aca9300..f7794e9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -621,6 +621,7 @@ AC_CONFIG_FILES([src/Makefile tests/Makefile])
- AC_CONFIG_FILES([lang/Makefile lang/cl/Makefile lang/cl/gpg-error.asd])
- AC_CONFIG_FILES([src/versioninfo.rc src/gpg-error.w32-manifest])
- AC_CONFIG_FILES([src/gpg-error-config], [chmod +x src/gpg-error-config])
-+AC_CONFIG_FILES([src/gpg-error.pc])
- 
- AC_OUTPUT
- 
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 268c2ab..95f8459 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -87,6 +87,8 @@ bin_SCRIPTS = gpg-error-config
- nodist_bin_SCRIPTS = gpgrt-config
- m4datadir = $(datadir)/aclocal
- m4data_DATA = gpg-error.m4 gpgrt.m4
-+pkgconfigdir = $(libdir)/pkgconfig
-+pkgconfig_DATA = gpg-error.pc
- 
- EXTRA_DIST = mkstrtable.awk err-sources.h.in err-codes.h.in \
- 	mkerrnos.awk errnos.in README \
-@@ -94,7 +96,7 @@ EXTRA_DIST = mkstrtable.awk err-sources.h.in err-codes.h.in \
- 	mkheader.c gpg-error.h.in mkw32errmap.c w32-add.h w32ce-add.h \
- 	err-sources.h err-codes.h gpg-error-config.in gpg-error.m4 gpgrt.m4 \
- 	gpg-error.vers gpg-error.def.in \
--        versioninfo.rc.in gpg-error.w32-manifest.in \
-+        versioninfo.rc.in gpg-error.w32-manifest.in gpg-error.pc \
- 	$(lock_obj_pub)
- 
- BUILT_SOURCES = err-sources.h err-codes.h code-to-errno.h code-from-errno.h \
-diff --git a/src/gpg-error.m4 b/src/gpg-error.m4
-index 60c88d8..2ef7e3e 100644
---- a/src/gpg-error.m4
-+++ b/src/gpg-error.m4
-@@ -26,73 +26,13 @@ dnl is added to the gpg_config_script_warn variable.
+Index: libgpg-error-1.33/src/gpg-error.m4
+===================================================================
+--- libgpg-error-1.33.orig/src/gpg-error.m4
++++ libgpg-error-1.33/src/gpg-error.m4
+@@ -26,139 +26,13 @@ dnl is added to the gpg_config_script_wa
  dnl
  AC_DEFUN([AM_PATH_GPG_ERROR],
  [ AC_REQUIRE([AC_CANONICAL_HOST])
@@ -66,14 +34,15 @@ index 60c88d8..2ef7e3e 100644
 -              AC_HELP_STRING([--with-libgpg-error-prefix=PFX],
 -                             [prefix where GPG Error is installed (optional)]),
 -              [gpg_error_config_prefix="$withval"])
--
++  min_gpg_error_version=ifelse([$1], ,0.0,$1)
++  PKG_CHECK_MODULES(GPG_ERROR, [gpg-error >= $min_gpg_error_version], [ok=yes], [ok=no])
+ 
 -  dnl Accept --with-gpg-error-prefix and make it work the same as
 -  dnl --with-libgpg-error-prefix above, for backwards compatibility,
 -  dnl but do not document this old, inconsistently-named option.
 -  AC_ARG_WITH(gpg-error-prefix,,
 -              [gpg_error_config_prefix="$withval"])
-+  min_gpg_error_version=ifelse([$1], ,0.0,$1)
- 
+-
 -  if test x"${GPG_ERROR_CONFIG}" = x ; then
 -     if test x"${gpg_error_config_prefix}" != x ; then
 -        GPG_ERROR_CONFIG="${gpg_error_config_prefix}/bin/gpg-error-config"
@@ -92,19 +61,57 @@ index 60c88d8..2ef7e3e 100644
 -       esac
 -     fi
 -  fi
-+  PKG_CHECK_MODULES(GPG_ERROR, [gpg-error >= $min_gpg_error_version], [ok=yes], [ok=no])
- 
+-
 -  AC_PATH_PROG(GPG_ERROR_CONFIG, gpg-error-config, no)
--  min_gpg_error_version=ifelse([$1], ,0.0,$1)
--  AC_MSG_CHECKING(for GPG Error - version >= $min_gpg_error_version)
+-  min_gpg_error_version=ifelse([$1], ,1.33,$1)
 -  ok=no
--  if test "$GPG_ERROR_CONFIG" != "no" \
--     && test -f "$GPG_ERROR_CONFIG" ; then
+-
+-  if test "$prefix" = NONE ; then
+-    prefix_option_expanded=/usr/local
+-  else
+-    prefix_option_expanded="$prefix"
+-  fi
+-  if test "$exec_prefix" = NONE ; then
+-    exec_prefix_option_expanded=$prefix_option_expanded
+-  else
+-    exec_prefix_option_expanded=$(prefix=$prefix_option_expanded eval echo $exec_prefix)
+-  fi
+-  libdir_option_expanded=$(prefix=$prefix_option_expanded exec_prefix=$exec_prefix_option_expanded eval echo $libdir)
+-
+-  if test -f $libdir_option_expanded/pkgconfig/gpg-error.pc; then
+-    gpgrt_libdir=$libdir_option_expanded
+-  else
+-    if crt1_path=$(${CC:-cc} -print-file-name=crt1.o 2>/dev/null); then
+-      if possible_libdir=$(cd ${crt1_path%/*} && pwd 2>/dev/null); then
+-        if test -f $possible_libdir/pkgconfig/gpg-error.pc; then
+-          gpgrt_libdir=$possible_libdir
+-        fi
+-      fi
+-    fi
+-  fi
+-
+-  if test "$GPG_ERROR_CONFIG" = "no" -a -n "$gpgrt_libdir"; then
+-    AC_PATH_PROG(GPGRT_CONFIG, gpgrt-config, no)
+-    if test "$GPGRT_CONFIG" = "no"; then
+-      unset GPGRT_CONFIG
+-    else
+-      GPGRT_CONFIG="$GPGRT_CONFIG --libdir=$gpgrt_libdir"
+-      if $GPGRT_CONFIG gpg-error >/dev/null 2>&1; then
+-        GPG_ERROR_CONFIG="$GPGRT_CONFIG gpg-error"
+-        AC_MSG_NOTICE([Use gpgrt-config with $gpgrt_libdir as gpg-error-config])
+-        gpg_error_config_version=`$GPG_ERROR_CONFIG --modversion`
+-      else
+-        unset GPGRT_CONFIG
+-      fi
+-    fi
+-  else
+-    gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
+-  fi
+-  if test "$GPG_ERROR_CONFIG" != "no"; then
 -    req_major=`echo $min_gpg_error_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
 -    req_minor=`echo $min_gpg_error_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
--    gpg_error_config_version=`$GPG_ERROR_CONFIG $gpg_error_config_args --version`
 -    major=`echo $gpg_error_config_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
 -    minor=`echo $gpg_error_config_version | \
@@ -118,20 +125,47 @@ index 60c88d8..2ef7e3e 100644
 -            fi
 -        fi
 -    fi
+-    if test -z "$GPGRT_CONFIG" -a -n "$gpgrt_libdir"; then
+-      if test "$major" -gt 1 -o "$major" -eq 1 -a "$minor" -ge 33; then
+-        AC_PATH_PROG(GPGRT_CONFIG, gpgrt-config, no)
+-        if test "$GPGRT_CONFIG" = "no"; then
+-          unset GPGRT_CONFIG
+-        else
+-          GPGRT_CONFIG="$GPGRT_CONFIG --libdir=$gpgrt_libdir"
+-          if $GPGRT_CONFIG gpg-error >/dev/null 2>&1; then
+-            GPG_ERROR_CONFIG="$GPGRT_CONFIG gpg-error"
+-            AC_MSG_NOTICE([Use gpgrt-config with $gpgrt_libdir as gpg-error-config])
+-          else
+-            unset GPGRT_CONFIG
+-          fi
+-        fi
+-      fi
+-    fi
 -  fi
+-  AC_MSG_CHECKING(for GPG Error - version >= $min_gpg_error_version)
    if test $ok = yes; then
--    GPG_ERROR_CFLAGS=`$GPG_ERROR_CONFIG $gpg_error_config_args --cflags`
--    GPG_ERROR_LIBS=`$GPG_ERROR_CONFIG $gpg_error_config_args --libs`
--    GPG_ERROR_MT_CFLAGS=`$GPG_ERROR_CONFIG $gpg_error_config_args --mt --cflags 2>/dev/null`
--    GPG_ERROR_MT_LIBS=`$GPG_ERROR_CONFIG $gpg_error_config_args --mt --libs 2>/dev/null`
+-    GPG_ERROR_CFLAGS=`$GPG_ERROR_CONFIG --cflags`
+-    GPG_ERROR_LIBS=`$GPG_ERROR_CONFIG --libs`
+-    if test -z "$GPGRT_CONFIG"; then
+-      GPG_ERROR_MT_CFLAGS=`$GPG_ERROR_CONFIG --mt --cflags 2>/dev/null`
+-      GPG_ERROR_MT_LIBS=`$GPG_ERROR_CONFIG --mt --libs 2>/dev/null`
+-    else
+-      GPG_ERROR_MT_CFLAGS=`$GPG_ERROR_CONFIG --variable=mtcflags 2>/dev/null`
+-      GPG_ERROR_MT_CFLAGS="$GPG_ERROR_CFLAGS${GPG_ERROR_CFLAGS:+ }$GPG_ERROR_MT_CFLAGS"
+-      GPG_ERROR_MT_LIBS=`$GPG_ERROR_CONFIG --variable=mtlibs 2>/dev/null`
+-      GPG_ERROR_MT_LIBS="$GPG_ERROR_LIBS${GPG_ERROR_LIBS:+ }$GPG_ERROR_MT_LIBS"
+-    fi
 -    AC_MSG_RESULT([yes ($gpg_error_config_version)])
      ifelse([$2], , :, [$2])
--    gpg_error_config_host=`$GPG_ERROR_CONFIG $gpg_error_config_args --host 2>/dev/null || echo none`
-+    gpg_error_config_host=`$PKG_CONFIG --variable=host gpg-error`
+     if test -z "$GPGRT_CONFIG"; then
+-      gpg_error_config_host=`$GPG_ERROR_CONFIG --host 2>/dev/null || echo none`
+-    else
+-      gpg_error_config_host=`$GPG_ERROR_CONFIG --variable=host 2>/dev/null || echo none`
++      gpg_error_config_host=`$PKG_CONFIG --variable=host gpg-error`
+     fi
      if test x"$gpg_error_config_host" != xnone ; then
        if test x"$gpg_error_config_host" != x"$host" ; then
-   AC_MSG_WARN([[
-@@ -107,11 +47,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
+@@ -174,15 +48,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
        fi
      fi
    else
@@ -142,24 +176,8 @@ index 60c88d8..2ef7e3e 100644
 -    AC_MSG_RESULT(no)
      ifelse([$3], , :, [$3])
    fi
-   AC_SUBST(GPG_ERROR_CFLAGS)
-diff --git a/src/gpg-error.pc.in b/src/gpg-error.pc.in
-new file mode 100644
-index 0000000..bc0b174
---- /dev/null
-+++ b/src/gpg-error.pc.in
-@@ -0,0 +1,11 @@
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+libdir=@libdir@
-+includedir=@includedir@
-+host=@GPG_ERROR_CONFIG_HOST@
-+
-+Name: gpg-error
-+Description: a library that defines common error values for all GnuPG components
-+Version: @VERSION@
-+Libs: -L${libdir} -lgpg-error
-+Cflags: -I${includedir}
--- 
-1.8.3.1
-
+-  AC_SUBST(GPG_ERROR_CFLAGS)
+-  AC_SUBST(GPG_ERROR_LIBS)
+-  AC_SUBST(GPG_ERROR_MT_CFLAGS)
+-  AC_SUBST(GPG_ERROR_MT_LIBS)
+ ])
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
similarity index 88%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
index e552001..325529d 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
@@ -14,11 +14,10 @@ SECTION = "libs"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
-           file://0001-syscfg-Support-ARC-CPUs-and-simplify-aliasing-table.patch \
-           file://0002-syscfg-Add-support-for-arc-unknown-linux-gnu.patch \
 	  "
-SRC_URI[md5sum] = "ef3d928a5a453fa701ecc3bb22be1c64"
-SRC_URI[sha256sum] = "c345c5e73cc2332f8d50db84a2280abfb1d8f6d4f1858b9daa30404db44540ca"
+
+SRC_URI[md5sum] = "680495572d5d4c700ea73a2f793ce531"
+SRC_URI[sha256sum] = "5d38826656e746c936e7742d9cde072b50baa3c4c49daa168a56813612bf03ff"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.7.4


