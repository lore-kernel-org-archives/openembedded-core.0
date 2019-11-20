Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 72B997F881
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:45:15 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id i12so2039019wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 05:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VGs426f1qU3TI1coY3cMP9AzobSJQYdrJs1NtBtCw0A=;
	b=hXSOvLftUKoGOlubHItyYzfVZYV6yYAYYbJQLJyOBGn0kYmEQuQEIZfgmayVt61aRG
	tp6QFTs5hC1kWBGMLsYX+mubcr8h8SG1qhHQK0srz/hPkrgh8Wt7NTRQGVklljrKj+3O
	2zuDJX9QqGZEyUZcnAoyjSr/dRRhWMhj0/TmWd7R2spP0rh3tMICBD1/9s43NTUWsypO
	limQPkAdnoQmUqKA9CGkl14tIO/ZuOcgg6ZP38y9Q9KISMy7kQtKCzERfthvdnTR3sFE
	iwLtTMjjvP1/iy+s7M82PK7CNQvuMv/IWLJmr1sKJW0pbXGkwcQV6PKe+lwshJg+qZl/
	D6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VGs426f1qU3TI1coY3cMP9AzobSJQYdrJs1NtBtCw0A=;
	b=WufIAfLGRFEgw0sthU1heYR88tB0l/q13FAeVwUxE2PwxGgV0EicjVoTufFPuDzi3C
	79XDDSbX4YhG/P7LsYuqjtJb0LEozcPp79RhUkAWUIBI/KsaXZAAqNhDVNOLMEG27k2x
	qn2QcIzLpcT9FmOoyOtCwX5k7nq51s4J8Tq1U4hvLNUzcDboFvrN3YIP6rW8zvO6+V9p
	Jcdj6cFsNPjJtBPxL0NWnybqrte2y975YLBEqb6FPUaqYubDEhE3zj9boB4fEfNS8DHf
	BbNDhm/bJOKpFwS2zHfHHREDzvSFHumgJXQc9IaNe0p7jGNxuMMWSLJgy9MXk82NSBq6
	9+Zg==
X-Gm-Message-State: APjAAAV5joCuDHjKK0lWfH3QDEZpC7xbJmBsR5MJ4l2nUb/fQRRWxuh0
	x+rkRKeB0CslxSPNe63xbLPFd+iQ
X-Google-Smtp-Source: APXvYqyVAOqMQqhQv/aDg3cfW5IJZbHNKkrcbJVbUieV0a3MY8No9HWzHa4W55t4VudvOVmwDsLfzQ==
X-Received: by 2002:a5d:5227:: with SMTP id i7mr3416241wra.277.1574257515258; 
	Wed, 20 Nov 2019 05:45:15 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o189sm7031771wmo.23.2019.11.20.05.45.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 05:45:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 14:44:51 +0100
Message-Id: <20191120134455.125118-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120134455.125118-1-alex.kanavin@gmail.com>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/11] console-tools: remove the recipe
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
X-List-Received-Date: Wed, 20 Nov 2019 13:45:16 -0000

The last release of this was in 2002(!), kbd is the modern,
supported alternative.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../0001-Cover-the-else-with-__GLIBC__.patch  | 51 -------------
 ...ix-format-security-compilation-error.patch | 57 --------------
 ...-sys-types.h-for-u_char-and-u_short-.patch | 44 -----------
 .../console-tools-0.3.2/Makevars              | 41 ----------
 .../console-tools-0.3.2/codepage.patch        | 17 -----
 .../console-tools-0.3.2/compile.patch         | 12 ---
 .../console-tools-0.3.2/configure.patch       | 29 -------
 .../fix-libconsole-linking.patch              | 56 --------------
 .../console-tools-0.3.2/kbdrate.patch         | 75 -------------------
 .../console-tools-0.3.2/lcmessage.m4          | 24 ------
 .../console-tools-0.3.2/no-dep-on-libfl.patch | 19 -----
 .../console-tools-0.3.2/nodocs.patch          | 22 ------
 .../console-tools-0.3.2/uclibc-fileno.patch   | 49 ------------
 .../console-tools/console-tools_0.3.2.bb      | 48 ------------
 15 files changed, 545 deletions(-)
 delete mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/0001-Cover-the-else-with-__GLIBC__.patch
 delete mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/0001-Fix-format-security-compilation-error.patch
 delete mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/0001-kbdtools-Include-sys-types.h-for-u_char-and-u_short-.patch
 delete mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/Makevars
 delete mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/codepage.patch
 delete mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/compile.patch
 delete mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/configure.patch
 delete mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/fix-libconsole-linking.patch
 delete mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/kbdrate.patch
 delete mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/lcmessage.m4
 delete mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/no-dep-on-libfl.patch
 delete mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/nodocs.patch
 delete mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/uclibc-fileno.patch
 delete mode 100644 meta/recipes-core/console-tools/console-tools_0.3.2.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d85e5b697f5..a289008b8c1 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -103,7 +103,6 @@ RECIPE_MAINTAINER_pn-cogl-1.0 = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-connman = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-connman-conf = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-connman-gnome = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-console-tools = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-consolekit = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-core-image-base = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-core-image-minimal = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/0001-Cover-the-else-with-__GLIBC__.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/0001-Cover-the-else-with-__GLIBC__.patch
deleted file mode 100644
index ace4bf0a76b..00000000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/0001-Cover-the-else-with-__GLIBC__.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From b6a59b05f1fa514c6b387c9544bd63b1bfcf2eed Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 13 Jan 2016 05:38:29 +0000
-Subject: [PATCH] Cover the else with __GLIBC__
-
-Fixes build errors on musl/x86
-
-| In file included from
-/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/sysroots/qemux86/usr/include/asm/termios.h:1:0,
-|                  from
-/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/sysroots/qemux86/usr/include/linux/termios.h:5,
-|                  from
-/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/work/i586-oe-linux-musl/console-tools/0.3.2-r8/console-tools-0.3.2/vttools/resizecons.c:86:
-|
-/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/sysroots/qemux86/usr/include/asm-generic/termios.h:14:8:
-error: redefinition of 'struct winsize'
-|  struct winsize {
-|         ^
-| In file included from
-/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/sysroots/qemux86/usr/include/sys/ioctl.h:7:0,
-|                  from
-/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/work/i586-oe-linux-musl/console-tools/0.3.2-r8/console-tools-0.3.2/vttools/resizecons.c:81:
-|
-/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/sysroots/qemux86/usr/include/bits/ioctl.h:90:8:
-note: originally defined here
-|  struct winsize {
-|         ^
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- vttools/resizecons.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/vttools/resizecons.c b/vttools/resizecons.c
-index f0a7055..e8753b1 100644
---- a/vttools/resizecons.c
-+++ b/vttools/resizecons.c
-@@ -81,7 +81,7 @@
- #include <sys/ioctl.h>
- #if (__GNU_LIBRARY__ >= 6)
- # include <sys/perm.h>
--#else
-+#elif defined __GLIBC__
- # include <linux/types.h>
- # include <linux/termios.h>
- #endif
--- 
-2.7.0
-
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/0001-Fix-format-security-compilation-error.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/0001-Fix-format-security-compilation-error.patch
deleted file mode 100644
index 6e72ec665b6..00000000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/0001-Fix-format-security-compilation-error.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Subject: Fix 'format-security' compilation error.
-
-Upstream-Status: Pending
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- kbdtools/kbd_mode.c    | 6 +++---
- kbdtools/setmetamode.c | 2 +-
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/kbdtools/kbd_mode.c b/kbdtools/kbd_mode.c
-index 02dca38..8dbcd39 100644
---- a/kbdtools/kbd_mode.c
-+++ b/kbdtools/kbd_mode.c
-@@ -120,7 +120,7 @@ int main(int argc, char *argv[])
-       /* report mode */
-       if (ioctl(fd, KDGKBMODE, &mode)) 
- 	{
--	  fprintf(stderr, progname);
-+	  fprintf(stderr, "%s", progname);
- 	  perror(_(": error reading keyboard mode\n"));
- 	  exit(1);
- 	}
-@@ -151,7 +151,7 @@ int main(int argc, char *argv[])
-     kbd_rep.period = rate;
-     if (ioctl(fd, KDKBDREP, &kbd_rep))
-       {
--	fprintf(stderr, progname);
-+	fprintf(stderr, "%s", progname);
- 	perror(_(": error setting keyboard repeat mode\n"));
- 	exit(1);
-       }
-@@ -160,7 +160,7 @@ int main(int argc, char *argv[])
-   
-   if (ioctl(fd, KDSKBMODE, mode))
-     {
--      fprintf(stderr, progname);
-+      fprintf(stderr, "%s", progname);
-       perror(_(": error setting keyboard mode\n"));
-       exit(1);
-     }
-diff --git a/kbdtools/setmetamode.c b/kbdtools/setmetamode.c
-index 5bed945..0ba7676 100644
---- a/kbdtools/setmetamode.c
-+++ b/kbdtools/setmetamode.c
-@@ -42,7 +42,7 @@ void report(int meta)
-     default:
-       s = N_("Strange mode for Meta key?\n");
-     }
--  printf(_(s));
-+  printf("%s", _(s));
- }
- 
- struct meta 
--- 
-2.8.3
-
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/0001-kbdtools-Include-sys-types.h-for-u_char-and-u_short-.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/0001-kbdtools-Include-sys-types.h-for-u_char-and-u_short-.patch
deleted file mode 100644
index 64b5b044dd9..00000000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/0001-kbdtools-Include-sys-types.h-for-u_char-and-u_short-.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 0fd5dda51d68e1ec2a87e27b5ed0dff3503b4681 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 31 Dec 2015 08:12:38 +0000
-Subject: [PATCH] kbdtools: Include sys/types.h for u_char and u_short
- definition
-
-on musl this gets exposed since sys/types.h is not
-included via some other indirect inclusion as is the case with glibc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- kbdtools/dumpkeys.c | 1 +
- kbdtools/loadkeys.y | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/kbdtools/dumpkeys.c b/kbdtools/dumpkeys.c
-index 6159d49..c19fb21 100644
---- a/kbdtools/dumpkeys.c
-+++ b/kbdtools/dumpkeys.c
-@@ -26,6 +26,7 @@
- #include <errno.h>
- #include <sysexits.h>
- #include <sys/ioctl.h>
-+#include <sys/types.h>
- #include <linux/types.h>
- #include <linux/kd.h>
- #include <linux/keyboard.h>
-diff --git a/kbdtools/loadkeys.y b/kbdtools/loadkeys.y
-index b6a8e01..4468f77 100644
---- a/kbdtools/loadkeys.y
-+++ b/kbdtools/loadkeys.y
-@@ -71,6 +71,7 @@
- #include <linux/kd.h>
- #include <linux/keyboard.h>
- #include <sys/ioctl.h>
-+#include <sys/types.h>
- #include <ctype.h>
- #include <sysexits.h>
- #include <signal.h>
--- 
-2.6.4
-
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/Makevars b/meta/recipes-core/console-tools/console-tools-0.3.2/Makevars
deleted file mode 100644
index 32692ab4b98..00000000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/Makevars
+++ /dev/null
@@ -1,41 +0,0 @@
-# Makefile variables for PO directory in any package using GNU gettext.
-
-# Usually the message domain is the same as the package name.
-DOMAIN = $(PACKAGE)
-
-# These two variables depend on the location of this directory.
-subdir = po
-top_builddir = ..
-
-# These options get passed to xgettext.
-XGETTEXT_OPTIONS = --keyword=_ --keyword=N_
-
-# This is the copyright holder that gets inserted into the header of the
-# $(DOMAIN).pot file.  Set this to the copyright holder of the surrounding
-# package.  (Note that the msgstr strings, extracted from the package's
-# sources, belong to the copyright holder of the package.)  Translators are
-# expected to transfer the copyright for their translations to this person
-# or entity, or to disclaim their copyright.  The empty string stands for
-# the public domain; in this case the translators are expected to disclaim
-# their copyright.
-COPYRIGHT_HOLDER = Free Software Foundation, Inc.
-
-# This is the email address or URL to which the translators shall report
-# bugs in the untranslated strings:
-# - Strings which are not entire sentences, see the maintainer guidelines
-#   in the GNU gettext documentation, section 'Preparing Strings'.
-# - Strings which use unclear terms or require additional context to be
-#   understood.
-# - Strings which make invalid assumptions about notation of date, time or
-#   money.
-# - Pluralisation problems.
-# - Incorrect English spelling.
-# - Incorrect formatting.
-# It can be your email address, or a mailing list address where translators
-# can write to without being subscribed, or the URL of a web page through
-# which the translators can contact you.
-MSGID_BUGS_ADDRESS =
-
-# This is the list of locale categories, beyond LC_MESSAGES, for which the
-# message catalogs shall be used.  It is usually empty.
-EXTRA_LOCALE_CATEGORIES =
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/codepage.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/codepage.patch
deleted file mode 100644
index c2870147677..00000000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/codepage.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
-
---- console-tools-0.3.2/contrib/codepage.c~codepage
-+++ console-tools-0.3.2/contrib/codepage.c
-@@ -229,7 +229,7 @@
- 	  return 0;
- 
-         fprintf(stderr, "\
--Warning: CP format is a hack!\n
-+Warning: CP format is a hack!\n\
-          The files produced may or may not be usable!\n");
- 
- 	sprintf(outfile, "%d.cp", CPEntryHeader.codepage);
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/compile.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/compile.patch
deleted file mode 100644
index c93f511950e..00000000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/compile.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Upstream-Status: Pending
-
---- console-tools-0.3.2/kbdtools/showkey.c~compile	1999-08-25 17:20:08.000000000 -0400
-+++ console-tools-0.3.2/kbdtools/showkey.c	2004-05-09 03:03:23.000000000 -0400
-@@ -264,7 +264,6 @@
- 	  break;
- 	case cmd_keymap:
- 	  printf(")\n");
--	default:
- 	}
-     }
- 
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/configure.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/configure.patch
deleted file mode 100644
index 15c100c9088..00000000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/configure.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Pending
-
---- console-tools-0.3.2/configure.in~configure
-+++ console-tools-0.3.2/configure.in
-@@ -2,13 +2,14 @@
- dnl Process this file with autoconf to produce a configure script.
- 
- # Initialize
--AC_INIT(kbdtools/loadkeys.y)
-+AC_INIT
-+AC_CONFIG_SRCDIR([kbdtools/loadkeys.y])
- 
- define(ct_unicodedata_default,/usr/share/unidata/UnicodeData-2.txt)
- ct_localdatadir_default=/usr/local/share     # iff --enable-localdatadir without specific dir
- 
- #AC_CONFIG_AUX_DIR(autoconf)
--AC_CANONICAL_SYSTEM
-+AC_CANONICAL_TARGET([])
- AM_INIT_AUTOMAKE(console-tools, 0.3.2)
- 
- # Defaults
-@@ -25,7 +26,6 @@
- # i18n stuff
- ALL_LINGUAS="cs de ru ga fr"
- AM_GNU_GETTEXT
--AC_OUTPUT_COMMANDS([sed -e "/POTFILES =/r po/POTFILES" po/Makefile.in > po/Makefile])
- 
- AC_DEFINE_UNQUOTED(LOCALEDIR, "/usr/share/locale")
- 
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/fix-libconsole-linking.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/fix-libconsole-linking.patch
deleted file mode 100644
index be61eb846bb..00000000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/fix-libconsole-linking.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Fix the following error detected with i586-pokymllib32-linux-gcc (the
-multilib x86-64 lib32 compiler):
-    ../lib/ctutils/.libs/libctutils.so: undefined reference to `get_kernel_sfm'
-    collect2: error: ld returned 1 exit status
-
-It seems that libctutils.so (the library that uses get_kernel_sfm) must
-be stated before libconsole.so (the library that exports the function) when
-using multilib gcc
-
-Upstream-Status: Pending
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-Index: console-tools-0.3.2/fontfiletools/Makefile.am
-===================================================================
---- console-tools-0.3.2.orig/fontfiletools/Makefile.am
-+++ console-tools-0.3.2/fontfiletools/Makefile.am
-@@ -10,5 +10,5 @@ EXTRA_DIST = fonts2virfont.c virfont.h
- 
- # libconsole is needed by ctutils
- LDADD = ../lib/ctlocal/libctlocal.a ../lib/cfont/libcfont.la \
--	../lib/console/libconsole.la \
--	../lib/ctutils/libctutils.la ../lib/generic/libctgeneric.la
-+	../lib/ctutils/libctutils.la \
-+	../lib/console/libconsole.la ../lib/generic/libctgeneric.la
-Index: console-tools-0.3.2/vttools/Makefile.am
-===================================================================
---- console-tools-0.3.2.orig/vttools/Makefile.am
-+++ console-tools-0.3.2/vttools/Makefile.am
-@@ -7,9 +7,9 @@ bin_PROGRAMS = chvt deallocvt writevt fg
- 	vcstime vt-is-UTF8 openvt @RESIZECONS@
- EXTRA_PROGRAMS = resizecons
- 
--LDADD = ../lib/ctlocal/libctlocal.a ../lib/console/libconsole.la \
-+LDADD = ../lib/ctlocal/libctlocal.a ../lib/ctutils/libctutils.la \
- 	../lib/cfont/libcfont.la \
--	../lib/ctutils/libctutils.la ../lib/generic/libctgeneric.la
-+	../lib/console/libconsole.la ../lib/generic/libctgeneric.la
- 
- vcstime_LDADD = ../lib/ctlocal/libctlocal.a
- screendump_LDADD = ../lib/ctlocal/libctlocal.a
-Index: console-tools-0.3.2/kbdtools/Makefile.am
-===================================================================
---- console-tools-0.3.2.orig/kbdtools/Makefile.am
-+++ console-tools-0.3.2/kbdtools/Makefile.am
-@@ -15,9 +15,9 @@ EXTRA_PROGRAMS = getkeycodes setkeycodes
- loadkeys_SOURCES = loadkeys.y analyze.l
- 
- YFLAGS = -d
--LDADD = ../lib/ctlocal/libctlocal.a ../lib/console/libconsole.la \
-+LDADD = ../lib/ctlocal/libctlocal.a ../lib/ctutils/libctutils.la \
- 	../lib/cfont/libcfont.la \
--	../lib/ctutils/libctutils.la ../lib/generic/libctgeneric.la
-+	../lib/console/libconsole.la ../lib/generic/libctgeneric.la
- 
- loadkeys_LDADD = $(LDADD) @LEXLIB@
- 
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/kbdrate.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/kbdrate.patch
deleted file mode 100644
index f370be8592b..00000000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/kbdrate.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-Patch from Matthias Goebl <oe@m.goebl.net>
-Added via OE bugtracker: bug #478
-
-Upstream-Status: Pending
-
---- console-tools-0.3.2/kbdtools/kbd_mode.c.orig
-+++ console-tools-0.3.2/kbdtools/kbd_mode.c
-@@ -29,11 +29,16 @@
-   OPT("-u --unicode  ", _("UTF-8 mode (UNICODE)"));
-   OPT("-s --scancode ", _("scancode mode (RAW)"));
-   OPT("   --mode={8bit,keycode,unicode,scancode} ", _("set mode"));
-+  OPT("-r --rate=RATE ", _("set repeat rate (default: 33)"));
-+  OPT("-d --delay=DELAY ", _("set repeat delay (default: 250)"));
- 
-   OPT("-h --help     ", HELPDESC);
-   OPT("-V --version  ", VERSIONDESC);
- }
- 
-+int rate=-1;
-+int delay=-1;
-+
- static int parse_cmdline (int argc, char *argv[])
- {
-     int mode = -1;
-@@ -46,11 +51,13 @@
-       { "mode"     , required_argument, NULL, 'm' },
-       { "scancode" , no_argument, NULL, 's' },
-       { "unicode"  , no_argument, NULL, 'u' },
-+      { "rate"     , required_argument, NULL, 'r' },
-+      { "delay"    , required_argument, NULL, 'd' },
-       { NULL, 0, NULL, 0 }
-     };
-     int c;
- 
--    while ( (c = getopt_long (argc, argv, "Vhaksu", long_opts, NULL)) != EOF) 
-+    while ( (c = getopt_long (argc, argv, "Vhaksur:d:", long_opts, NULL)) != EOF) 
-       switch (c) {
-       case 'h':
- 	usage ();
-@@ -58,6 +65,14 @@
-       case 'V':
- 	version ();
- 	exit(0);
-+      case 'r':
-+	rate = atoi(optarg);
-+	mode = -2;
-+	break;
-+      case 'd':
-+	delay = atoi(optarg);
-+	mode = -2;
-+	break;
-       case 'a':
- 	mode = K_XLATE;
- 	break;
-@@ -129,6 +144,20 @@
-       exit(0);
-     }
-   
-+  if ( rate != -1 || delay != -1 )
-+    {
-+    struct kbd_repeat kbd_rep;
-+    kbd_rep.delay = delay;
-+    kbd_rep.period = rate;
-+    if (ioctl(fd, KDKBDREP, &kbd_rep))
-+      {
-+	fprintf(stderr, progname);
-+	perror(_(": error setting keyboard repeat mode\n"));
-+	exit(1);
-+      }
-+    if(mode==-2) exit(0);
-+    }
-+  
-   if (ioctl(fd, KDSKBMODE, mode))
-     {
-       fprintf(stderr, progname);
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/lcmessage.m4 b/meta/recipes-core/console-tools/console-tools-0.3.2/lcmessage.m4
deleted file mode 100644
index 18d47a94f7e..00000000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/lcmessage.m4
+++ /dev/null
@@ -1,24 +0,0 @@
-# Check whether LC_MESSAGES is available in <locale.h>.
-# Ulrich Drepper <drepper@cygnus.com>, 1995.
-#
-# This file can be copied and used freely without restrictions.  It can
-# be used in projects which are not available under the GNU General Public
-# License or the GNU Library General Public License but which still want
-# to provide support for the GNU gettext functionality.
-# Please note that the actual code of the GNU gettext library is covered
-# by the GNU Library General Public License, and the rest of the GNU
-# gettext package package is covered by the GNU General Public License.
-# They are *not* in the public domain.
-
-# serial 2
-
-AC_DEFUN([AM_LC_MESSAGES],
-  [if test $ac_cv_header_locale_h = yes; then
-    AC_CACHE_CHECK([for LC_MESSAGES], am_cv_val_LC_MESSAGES,
-      [AC_TRY_LINK([#include <locale.h>], [return LC_MESSAGES],
-       am_cv_val_LC_MESSAGES=yes, am_cv_val_LC_MESSAGES=no)])
-    if test $am_cv_val_LC_MESSAGES = yes; then
-      AC_DEFINE(HAVE_LC_MESSAGES, 1,
-        [Define if your <locale.h> file defines LC_MESSAGES.])
-    fi
-  fi])
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/no-dep-on-libfl.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/no-dep-on-libfl.patch
deleted file mode 100644
index a6735a53ffa..00000000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/no-dep-on-libfl.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-No reason to link with libfl since 'loadkeys' implements
-its own yywrap()/yylex() functions.
-
-Upstream-Status: Pending
-Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
-
-Index: console-tools-0.3.2/kbdtools/Makefile.am
-===================================================================
---- console-tools-0.3.2.orig/kbdtools/Makefile.am
-+++ console-tools-0.3.2/kbdtools/Makefile.am
-@@ -19,8 +19,6 @@ LDADD = ../lib/ctlocal/libctlocal.a ../l
- 	../lib/cfont/libcfont.la \
- 	../lib/console/libconsole.la ../lib/generic/libctgeneric.la
- 
--loadkeys_LDADD = $(LDADD) @LEXLIB@
--
- bin_SCRIPTS = mk_modmap
- 
- noinst_HEADERS = loadkeys.h
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/nodocs.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/nodocs.patch
deleted file mode 100644
index 2ed609219c1..00000000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/nodocs.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-The docs need tools we don't have to build so disable them.
-
-Also remove intl since the Makefile doesn't work with 3.82 and we
-don't want to build libintl anyway.
-
-Upstream-Status: Inappropriate [configuration]
-RP 2012/10/17
-
-Index: console-tools-0.3.2/Makefile.am
-===================================================================
---- console-tools-0.3.2.orig/Makefile.am	1999-04-15 01:33:24.000000000 +0000
-+++ console-tools-0.3.2/Makefile.am	2012-10-17 11:48:14.107069145 +0000
-@@ -1,7 +1,7 @@
- # -*- makefile -*-
- AUTOMAKE_OPTIONS = foreign
- 
--SUBDIRS = lib fontfiletools vttools kbdtools screenfonttools contrib doc \
--	compat include examples po intl
-+SUBDIRS = lib fontfiletools vttools kbdtools screenfonttools contrib \
-+	compat include examples po
- 
- EXTRA_DIST = BUGS RELEASE CREDITS COPYING.kbd local-scripts/* debian/* *.lsm
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/uclibc-fileno.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/uclibc-fileno.patch
deleted file mode 100644
index 0c95068a369..00000000000
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/uclibc-fileno.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Fixing the locale issues isn't enough, console-tools also does a couple of
-other pretty stupid things (like FILE *f; f->_fileno instead of fileno(f)),
-
-Upstream-Status: Pending
-
---- console-tools-0.3.2/lib/cfont/fontstruct.c.ark	2005-05-22 19:12:38.000000000 +0000
-+++ console-tools-0.3.2/lib/cfont/fontstruct.c	2005-05-22 19:13:23.000000000 +0000
-@@ -50,8 +50,7 @@
-    * get filesize
-    */
-   
--  /* FIXME: should not use _fileno ! */
--  if (fstat(fontfile->_fileno, &stbuf) == -1)
-+  if (fstat(fileno(fontfile), &stbuf) == -1)
-     goto rsf_return_error;
-   
-   if (S_ISREG(stbuf.st_mode))
-@@ -211,8 +210,7 @@
-    * get filesize
-    */
-   
--  /* FIXME: should not use _fileno ! */
--  if (fstat(fontfile->_fileno, &stbuf) == -1)
-+  if (fstat(fileno(fontfile), &stbuf) == -1)
-     goto rfg_return_error;
-   
-   if (S_ISREG(stbuf.st_mode))
---- console-tools-0.3.2/lib/console/acm.c.ark	2005-05-22 19:17:15.000000000 +0000
-+++ console-tools-0.3.2/lib/console/acm.c	2005-05-22 19:17:23.000000000 +0000
-@@ -30,7 +30,7 @@
-   lct_boolean parse_failed = False;
-   lct_boolean is_unicode;
- 
--  if (fstat(fp->_fileno, &stbuf)) 
-+  if (fstat(fileno(fp), &stbuf)) 
-     perror(_("Cannot stat ACM file")), exit(1);
- 
-   /* first try a wg15-charmap (glibc) file format */
---- console-tools-0.3.2/include/lct/local.h.ark	2005-05-22 19:08:54.000000000 +0000
-+++ console-tools-0.3.2/include/lct/local.h	2005-05-22 19:09:12.000000000 +0000
-@@ -8,7 +8,7 @@
- #include <locale.h>
- 
- 
--#ifdef HAVE_LOCALE_H
-+#if defined(HAVE_LOCALE_H) && defined(HAVE_LIBINTL_H)
- # include <libintl.h>
- # define _(String) gettext (String)
- # ifdef gettext_noop
diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
deleted file mode 100644
index ba44fbe60f9..00000000000
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-SUMMARY = "Allows you to set-up and manipulate the Linux console"
-DESCRIPTION = "Provides tools that enable the set-up and manipulation of the linux console and console-font files."
-SECTION = "base"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.kbd;md5=9b2d91511d3d80d4d20ac6e6b0137fe9"
-DEPENDS = "flex-native bison-native"
-PR = "r8"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
-           file://codepage.patch \
-           file://configure.patch \
-           file://compile.patch \
-           file://kbdrate.patch \
-           file://uclibc-fileno.patch \
-           file://nodocs.patch \
-           file://fix-libconsole-linking.patch \
-           file://no-dep-on-libfl.patch \
-           file://0001-kbdtools-Include-sys-types.h-for-u_char-and-u_short-.patch \
-           file://0001-Cover-the-else-with-__GLIBC__.patch \
-           file://0001-Fix-format-security-compilation-error.patch \
-           file://lcmessage.m4 \
-           file://Makevars"
-
-SRC_URI[md5sum] = "bf21564fc38b3af853ef724babddbacd"
-SRC_URI[sha256sum] = "eea6b441672dacd251079fc85ed322e196282e0e66c16303ec64c3a2b1c126c2"
-
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lct/files/console-tools-devel/"
-UPSTREAM_CHECK_REGEX = "/console-tools-devel/(?P<pver>(\d\d?\.)+\d\d?)/"
-
-inherit autotools gettext update-alternatives
-
-CFLAGS_append_aarch64 = " -D_USE_TERMIOS "
-
-ASNEEDED = ""
-
-do_configure_prepend () {
-	mkdir -p ${S}/m4
-	cp ${WORKDIR}/lcmessage.m4 ${S}/m4/
-	rm -f ${S}/acinclude.m4
-	cp ${WORKDIR}/Makevars ${S}/po/
-}
-
-ALTERNATIVE_PRIORITY = "30"
-
-bindir_progs = "chvt deallocvt fgconsole openvt"
-ALTERNATIVE_${PN} = "${bindir_progs}"
-
-RDEPENDS_${PN} = "bash"
-- 
2.17.1


