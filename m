Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7954.1794464690193981359
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:24:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Wq8glNhY;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10300; q=dns/txt;
  s=iport01; t=1794464690; x=1795674290;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g+I9M3HrwLVSpPVdkxCCC5toMgneuCFZmtd72pzYqqE=;
  b=Wq8glNhYncQEoaDvoJrvGS9CinzccMMIrw51P8VRg4cJFFfEaBqM1NvZ
   QooRoFNR0tfkzFQKOiwDrulZ8JHVky8NBstGRHOcNprqY/zbvDu6LONQ7
   X0b5sriKqAGNIMhq5YIlD/gef0uoiJhCmVIBLEA5+nxy6ifiq+Rx4tosN
   xCussUVoz9rvPR5vCMDbHoHXD3BmXUo2r3YzJOVUGYnIQswDz3YjOILp1
   +4L90mUO0301y/UumhbeSWS5h7zd3bnjcdyEybZuYQY7KLitwkw/5JoSf
   0psLCts+H36cknQkWf4Gk1Gfb/vgJsk9RWtxj2eDXfN9e4+PjZD3wK/Ow
   w==;
X-CSE-ConnectionGUID: B6LsFwaFR9G0GFxhn7EdTA==
X-CSE-MsgGUID: wClb4784REOxmU2ggN8ljw==
X-IPAS-Result: =?us-ascii?q?A0BFAgBEWvVq/5P/Ja1aglmCV3VgQ0mUKoIhi2iSPRSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGCEpETAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASATgBcgMBAk8LIyEagmgBgjoDNwMRuWKCLIEBg1sFCQJDU?=
 =?us-ascii?q?NhMDYJaAQsUAYE4hUKDAIUkXRgBhH0nGxuBcoEVg2qBBYEaQgQYfguHAwSCD?=
 =?us-ascii?q?RV6EoFaHmSCIYlzAoFPhyVIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?QcbBgWBHIEegRKBBV2BKyheIYEIgXUCglGCAAIBSUEOB0VTCSVDEkckIggSC?=
 =?us-ascii?q?QETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCn4YDUgRLDcVG?=
 =?us-ascii?q?QQ+bgeSbIMDEgEsBF0BBwwYBBMxM1IEAyQFCwwMGwIRGJJrCUOCaox6giGBN?=
 =?us-ascii?q?Z0YgSMwcQoog3iMJI8+hXwaM4QEgVeSQ5JUC5h9jgqECpFfaIRqgWg8gVlwF?=
 =?us-ascii?q?TuCZwlKGQ+ODCILC4gFboE9yAsmMgIJMgEBBwIHDgMLgWiQEYFtAQE?=
IronPort-Data: A9a23:4gPiy6kchTxcYwycenh7Bfno5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWDT/XO/+NYmD3Ltgkb4u/p0xS68TVzNZiSwBv+y03E1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsvjb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FadG3v1ZHmhgz
 603cB8jfhCF2M+6/JvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMmbBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTZT/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIeJJIPVHJQOxi50o
 ErZ1GDzXk5KaOay7iqAzyijicmfmSHkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFcCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:Csx7za7c59L9Pk6j8QPXwPjXdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I5+rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfxLqn5SH8ECvj8eMY/6
 Jhf69iTODUNzFB/KPHCM3SKadG/DFBm5rY4dvj8w==
X-Talos-CUID: 9a23:ZcnJOmEdg9eqRnTsqmJNqmoPNN8sXEeM4y//DV+4DzlERIG8HAo=
X-Talos-MUID: 9a23:CDgvJwaNpOijsuBTqBTojm09ZJtSzoO+DX1Xnpog682GKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,209,1787011200"; 
   d="scan'208";a="546771930"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Nov 2026 06:24:49 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id F01E3180008BD
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 06:24:48 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 9690BCC1611; Wed, 11 Nov 2026 22:24:48 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] glibc: fix CVE-2026-84243
Date: Wed, 11 Nov 2026 22:24:48 -0800
Message-Id: <20261112062448.3128219-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 06:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250072
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream fix [1] for the LANGUAGE directory traversal
reported in [2]. Reject locale entries containing path separators or
equal to ".." for all programs, while retaining valid entries in
colon-separated LANGUAGE lists.

Keep the upstream regression test and adapt its Makefile integration
to the 2.43 layout. Omit only the NEWS entry for the later release.

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=03067f3c5e39aec5ec250a44bc1b395a1afd45e8
[2] https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2026-0025

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../glibc/glibc/CVE-2026-84243.patch          | 194 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.43.bb         |   1 +
 2 files changed, 195 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-84243.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2026-84243.patch b/meta/recipes-core/glibc/glibc/CVE-2026-84243.patch
new file mode 100644
index 00000000000..d64c7fea1d7
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2026-84243.patch
@@ -0,0 +1,194 @@
+From 03067f3c5e39aec5ec250a44bc1b395a1afd45e8 Mon Sep 17 00:00:00 2001
+From: Avinal Kumar <avinal.xlvii@gmail.com>
+Date: Mon, 2 Nov 2026 17:18:03 -0300
+Subject: [PATCH] intl: Restrict path traversal when using LANGUAGE env var [BZ
+ #17142, CVE-2026-84243]
+
+The fix for CVE-2014-0475 (Bug 17137) added valid_locale_name() in
+locale/findlocale.c to reject locale names containing ".." path
+components.  However, the LANGUAGE environment variable processing in
+intl/dcigettext.c was not covered by that fix.  An attacker who can
+set LANGUAGE (e.g. via SSH AcceptEnv) can force any gettext-using
+program to load a crafted .mo file from an arbitrary filesystem
+location via directory traversal.  A crafted .mo file can crash the
+program through out-of-range offsets or through format-string
+translations that consume more arguments than the caller passes,
+causing undefined behaviour in *printf.  glibc cannot fully protect
+against the latter at the gettext level.  The safety of .mo files
+normally relies on them being produced by msgmerge and msgfmt -c and
+installed in read-only locations; path traversal bypasses this trust
+model.
+
+Remove the ENABLE_SECURE gate from the IS_PATH_WITH_DIR check so it
+applies to all binaries, not just SUID/SGID ones, and extend it to
+also reject the bare ".." entry which contains no directory separator
+but still names the parent directory.
+
+Add tst-gettext-path-traversal to verify that locale names containing
+path separators or equal to ".." are rejected by the LANGUAGE processing loop.
+
+This fixes bug 17142 and CVE-2026-84243.
+
+CVE: CVE-2026-84243
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=03067f3c5e39aec5ec250a44bc1b395a1afd45e8]
+
+Backport Changes:
+- Omit the NEWS hunk for the later 2.45 release section, which is absent
+  from the 2.43 branch.
+- Adjust intl/Makefile context for the 2.43 layout, retaining the upstream
+  test registration, catalog and locale prerequisites, and OBJPFX flag.
+
+Suggested-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Signed-off-by: Avinal Kumar <avinal.xlvii@gmail.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ intl/Makefile                     |  4 ++
+ intl/dcigettext.c                 |  8 ++--
+ intl/tst-gettext-path-traversal.c | 83 +++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 91 insertions(+), 4 deletions(-)
+
+diff --git a/intl/Makefile b/intl/Makefile
+index 42875eb1a9cf8b7e8c6c5b92c95df3fde113d75a..f17a6dfbd57eac0b3d7fdc96204423f5781b051e 100644
+--- a/intl/Makefile
++++ b/intl/Makefile
+@@ -53,6 +53,7 @@ $(objpfx)plural.o: $(objpfx)plural.c
+ ifeq ($(run-built-tests),yes)
+ ifeq (yes,$(build-shared))
+ ifneq ($(strip $(MSGFMT)),:)
++tests += tst-gettext-path-traversal
+ tests-special += $(objpfx)tst-translit.out $(objpfx)tst-gettext.out \
+ 		 $(objpfx)tst-gettext2.out $(objpfx)tst-codeset.out \
+ 		 $(objpfx)tst-gettext3.out
+@@ -107,6 +108,7 @@ $(objpfx)tst-gettext6.out: tst-gettext6.sh $(objpfx)tst-gettext6
+ $(objpfx)tst-codeset.out: $(codeset_mo)
+ $(objpfx)tst-gettext3.out: $(codeset_mo)
+ $(objpfx)tst-gettext5.out: $(codeset_mo)
++$(objpfx)tst-gettext-path-traversal.out: $(codeset_mo)
+ endif
+ 
+ LOCALES := de_DE.ISO-8859-1 de_DE.UTF-8 en_US.ANSI_X3.4-1968 fr_FR.ISO-8859-1 \
+@@ -121,6 +123,7 @@ $(objpfx)tst-gettext4.out: $(gen-locales)
+ $(objpfx)tst-gettext5.out: $(gen-locales)
+ $(objpfx)tst-gettext6.out: $(gen-locales)
+ $(objpfx)tst-gettext-c-utf8.out: $(gen-locales)
++$(objpfx)tst-gettext-path-traversal.out: $(gen-locales)
+ $(objpfx)tst-translit.out: $(gen-locales)
+ endif
+ 
+@@ -140,6 +143,7 @@ CFLAGS-tst-gettext3.c += -DOBJPFX=\"$(objpfx)\"
+ CFLAGS-tst-gettext4.c += -DOBJPFX=\"$(objpfx)\"
+ CFLAGS-tst-gettext5.c += -DOBJPFX=\"$(objpfx)\"
+ CFLAGS-tst-gettext6.c += -DOBJPFX=\"$(objpfx)\"
++CFLAGS-tst-gettext-path-traversal.c += -DOBJPFX=\"$(objpfx)\"
+ 
+ ifeq ($(have-thread-library),yes)
+ ifeq (yes,$(build-shared))
+diff --git a/intl/dcigettext.c b/intl/dcigettext.c
+index e70c938566b92b70149424d6a5f0ce8303d82893..420180cea1b49e1e6b5e4ce1a3801f9b6f45f73d 100644
+--- a/intl/dcigettext.c
++++ b/intl/dcigettext.c
+@@ -655,10 +655,10 @@ DCIGETTEXT (const char *domainname, const char *msgid1, const char *msgid2,
+ 	    *cp++ = *categoryvalue++;
+ 	  *cp = '\0';
+ 
+-	  /* When this is a SUID binary we must not allow accessing files
+-	     outside the dedicated directories.  */
+-	  if (ENABLE_SECURE && IS_PATH_WITH_DIR (single_locale))
+-	    /* Ignore this entry.  */
++	  /* Do not allow accessing files outside the dedicated
++	     directories.  */
++	  if (IS_PATH_WITH_DIR (single_locale)
++	      || strcmp (single_locale, "..") == 0)
+ 	    continue;
+ 	}
+ 
+diff --git a/intl/tst-gettext-path-traversal.c b/intl/tst-gettext-path-traversal.c
+new file mode 100644
+index 0000000000000000000000000000000000000000..95ad326f6437178d7e5e36437132a85d03959ba6
+--- /dev/null
++++ b/intl/tst-gettext-path-traversal.c
+@@ -0,0 +1,83 @@
++/* Test that LANGUAGE values with path traversal are rejected [BZ #17142].
++   Copyright (C) 2026 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <libintl.h>
++#include <locale.h>
++#include <stdlib.h>
++#include <support/check.h>
++#include <support/support.h>
++
++static const char *const domaindir = OBJPFX "domaindir";
++static const char *const localedir = OBJPFX "domaindir/de_DE";
++static const char *const msgdir = OBJPFX "domaindir/de_DE/LC_MESSAGES";
++
++static int
++do_test (void)
++{
++  unsetenv ("OUTPUT_CHARSET");
++  /* LANGUAGE is only consulted if the locale is not "C" or "C.<codeset>".
++     The catalog is in ISO-8859-1, as is the locale, so no conversion of
++     the translation takes place.  */
++  xsetlocale (LC_ALL, "de_DE.ISO-8859-1");
++  textdomain ("codeset");
++
++  /* Verify that a legitimate LANGUAGE value produces the expected
++     translation.  This exercises the normal lookup path and confirms
++     that the test .mo catalog is in place.  */
++  bindtextdomain ("codeset", domaindir);
++  setenv ("LANGUAGE", "de_DE", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "K\344se");
++
++  /* A bare ".." must be rejected.  Without the fix this would resolve
++     to msgdir/../LC_MESSAGES/codeset.mo, which is the real catalog,
++     so the translation would succeed.  */
++  bindtextdomain ("codeset", msgdir);
++  setenv ("LANGUAGE", "..", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "cheese");
++
++  /* A relative path that leaves and re-enters the catalog directory
++     must be rejected.  Without the fix this would resolve to
++     localedir/../de_DE/LC_MESSAGES/codeset.mo.  */
++  bindtextdomain ("codeset", localedir);
++  setenv ("LANGUAGE", "../de_DE", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "cheese");
++
++  /* Multiple levels of directory traversal must be rejected.  Without
++     the fix this would resolve to
++     msgdir/../../de_DE/LC_MESSAGES/codeset.mo.  */
++  bindtextdomain ("codeset", msgdir);
++  setenv ("LANGUAGE", "../../de_DE", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "cheese");
++
++  /* Invalid entries in a colon-separated LANGUAGE list must be
++     skipped individually; valid entries that follow are still
++     used.  */
++  bindtextdomain ("codeset", domaindir);
++  setenv ("LANGUAGE", "..:../de_DE:de_DE", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "K\344se");
++
++  /* A path containing "/.." must be rejected.  Use localedir so the
++     binding changes, which invalidates the DCIGETTEXT result cache.  */
++  bindtextdomain ("codeset", localedir);
++  setenv ("LANGUAGE", "LC_MESSAGES/..", 1);
++  TEST_COMPARE_STRING (gettext ("cheese"), "cheese");
++
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index c962171cf3a..5c83f45c422 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -60,6 +60,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
            file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
+           file://CVE-2026-84243.patch \
 "
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-- 
2.35.6

