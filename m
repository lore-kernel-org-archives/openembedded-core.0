Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id D83AD6C0C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:31 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 196so1484346pgc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=f8F5t1fxjZbpdCZEDpSQhbYzAVgvLDy3RxWpO5z5Uto=;
	b=sHkY8dljuKUuM1jRH1ldOFvS30oheUKx8pgKwU+3GcR9is2jjIKvGnlNrsdeW8krsl
	wnT7lKAPtCPaT4BQkZuGqC6RiCqyYjlbpRiVBnF3Jp/O/wgOO4tO/AtevEQlAybhnBld
	jwebULZxoypxrfqg5xerXSHRolHTf3TlV2B+7GLDP1qTz46UN6H2Ol1io69K2Njt0tFh
	2t861cDo2sDqUz0wsR2zMF7ByxfMkeMAJ6k45jvxp4W45IuhliV+P2zm/uCvCNSvwQQ3
	Qb3GNXX1tVKjaE9psVR/Vd0YoEUuYqYWrJTH7IwRiY0YD7ip4pStYiqO5K5wa8FeXTaq
	I/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=f8F5t1fxjZbpdCZEDpSQhbYzAVgvLDy3RxWpO5z5Uto=;
	b=rtDdEwrEWyfRhsL60IFpS8dbCf2ko0eLPJhc87orwwjExSwmdAGgQqu/MUo2vXHCjY
	GBSr15iURE3o3qIx5NOIsXLaEmhgUEmrFlZ6gomJDFxreknnEO2rAWo95bjzqPFxFDVV
	uUOE73TlgTPnMVuXa+J5XL03yY2XtjNSLQg/olZE0GBiR0AFlrWMuDM3E7N+g+EwP4s8
	4rnqsBkwjRChLHVZ70LWvd2qtHmN9bq0K8xt4W1yrwea/WeVjsxwukP897dxTlr3MFae
	3KrX3r6XepP+GbYxmqHBE+vBB4u8E5I7i/LqQFMDiWihpG29ffdOWYWmxG3xyjhwKBLo
	MFoQ==
X-Gm-Message-State: APjAAAUX/gq9XUvFR60ONcTnM3Gh4n3j1EReJ5tES7IYB/ZEVD1cRj2l
	egU+HNvHPM1DakBQpxqvduP1TVdTA70=
X-Google-Smtp-Source: APXvYqw7Yl8xQ88Lgr9OtAraUtamlnv2EuudLkwCvMPSUSjZ2k4czC1+t4rVJsOCHqzL18fQZGPrIQ==
X-Received: by 2002:a17:90a:2506:: with SMTP id
	j6mr6046637pje.129.1561568012779; 
	Wed, 26 Jun 2019 09:53:32 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:02 -0700
Message-Id: <3103f407ff0c579c7e5887fd925d52d5c92c83f9.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 01/25] glibc: Security fix CVE-2019-9169
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
X-List-Received-Date: Wed, 26 Jun 2019 16:53:32 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch | 63 +++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.28.bb             |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
new file mode 100644
index 0000000..14cfaa3
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
@@ -0,0 +1,63 @@
+From 583dd860d5b833037175247230a328f0050dbfe9 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Mon, 21 Jan 2019 11:08:13 -0800
+Subject: [PATCH] regex: fix read overrun [BZ #24114]
+
+Problem found by AddressSanitizer, reported by Hongxu Chen in:
+https://debbugs.gnu.org/34140
+* posix/regexec.c (proceed_next_node):
+Do not read past end of input buffer.
+
+Upstream-Status: Backport 
+https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commit;h=583dd860d5b833037175247230a328f0050dbfe9
+
+CVE: CVE-2019-9169
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ChangeLog       | 10 +++++++++-
+ posix/regexec.c |  6 ++++--
+ 2 files changed, 13 insertions(+), 3 deletions(-)
+
+Index: git/ChangeLog
+===================================================================
+--- git.orig/ChangeLog
++++ git/ChangeLog
+@@ -1,3 +1,11 @@
++2019-01-31  Paul Eggert  <eggert@cs.ucla.edu>
++
++       regex: fix read overrun [BZ #24114]
++       Problem found by AddressSanitizer, reported by Hongxu Chen in:
++       https://debbugs.gnu.org/34140
++       * posix/regexec.c (proceed_next_node):
++       Do not read past end of input buffer.
++
+ 2018-09-30  Martin Jansa  <Martin.Jansa@gmail.com>
+ 	Partial fix for [BZ #23716]
+ 	* locale/weight.h: Fix build with -Os.
+@@ -10917,7 +10925,7 @@
+ 	(CFLAGS-wcstof_l.c): Likewise.
+ 	(CPPFLAGS-tst-wchar-h.c): Likewise.
+ 	(CPPFLAGS-wcstold_l.c): Likewise.
+----
++
+ 2017-12-11  Paul A. Clarke  <pc@us.ibm.com>
+ 
+ 	* sysdeps/ieee754/flt-32/s_cosf.c: New implementation.
+Index: git/posix/regexec.c
+===================================================================
+--- git.orig/posix/regexec.c
++++ git/posix/regexec.c
+@@ -1289,8 +1289,10 @@ proceed_next_node (const re_match_contex
+ 	      else if (naccepted)
+ 		{
+ 		  char *buf = (char *) re_string_get_buffer (&mctx->input);
+-		  if (memcmp (buf + regs[subexp_idx].rm_so, buf + *pidx,
+-			      naccepted) != 0)
++		  if (mctx->input.valid_len - *pidx < naccepted
++		      || (memcmp (buf + regs[subexp_idx].rm_so, buf + *pidx,
++				  naccepted)
++			  != 0))
+ 		    return -1;
+ 		}
+ 	    }
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
index 72cee04..1bcec3e 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -47,6 +47,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0032-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch \
            file://0033-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://0034-inject-file-assembly-directives.patch \
+           file://CVE-2019-9169.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.7.4


