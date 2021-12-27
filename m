Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D35C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 14:18:21 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web08.26745.1640614700002694471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 06:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nlzPK6/i;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640614697; i=@fujitsu.com;
	bh=a1zkfEvY9lqPGdG6z1+ivAJyZZ4wVqk8r6fxAPLzDoU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=nlzPK6/iJoHrxlmRYnTha7Cd5Fx8shWAQaTXxK36dhMkhJRoTOIL/J6SnHpxlUGD2
	 gEyPRL8D1TNeiCFa6hu6knUefsoetEd0456hD3G7PQOjLYXAa6EAwU9H7rJ1YmYIGX
	 2hpylVjyiAlKJ1XBun+gSQff0sLq8xOjK3UytDcq7326puCajbyNsJhDwMjzy2FgWS
	 1l/3BbsAFinkeXfwm4fEMiUANaFp4vqCQvPZrRmA31SzRNbsYp4yo7eh9vX6KZqK/N
	 slANetbqJP9pLMYEm5rQ/uK2oGwVWP44qMgWt+vaJKFOknOYkobjDlEzgg+Ca7EDmf
	 PN0rNuzkSNoSw==
Received: from [100.115.4.164] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 45/EB-13695-92BC9C16;
 Mon, 27 Dec 2021 14:18:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORqKtx+mS
  iwYNeY4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePJ/W1sBfuiKqYvNm1g3OfXxcjJISTwmFFi
  88K6LkYuIPs8k8T0LY3MEM4eRokVvbPYQarYBHQlzj1eC2RzcIgI6Elc/ScKEhYWMJNY93EnI
  4jNIqAqse7uZTCbV8Bd4uflLawgtoSAgsSUh++ZIeKCEidnPmEBsZkFJCQOvnjBDDJSQkBRYv
  Z0eYjyConXhy8xQ9hqElfPbWKewMg3C0n3LCTdCxiZVjFaJRVlpmeU5CZm5ugaGhjoGhqa6hr
  oGpkY6yVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBIZdSjHD5x2MC/p+6h1i
  lORgUhLl/T7hZKIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6G40A5waLU9NSKtMwcYAzApCU4e
  JREeKceA0rzFhck5hZnpkOkTjHqcrxu+bmDWYglLz8vVUqct/okUJEASFFGaR7cCFg8XmKUlR
  LmZWRgYBDiKUgtys0sQZV/xSjOwagkzNsIMoUnM68EbtMroCOYgI6Y6XAc5IiSRISUVAPThBv
  /Zl+5dqI55JHnMtbv3fX7p3/kCmH6csYv6xr3v9OCQccuW/4KfSu2/7TripX8q7WWu3AvfRnA
  fMuhNjbv75HUbSLS4hUvV8iuYz3zYclB9S3CC74vEP74XfCKQbGfpPr3G43MeVde9cfFi/Fsl
  zxwNP3dWm4zu1NfDNz3TFtg3f77aZZIbWq8kI14DqNkeXJVjWyQkpNnl1ehh/8fmU/98lc2X9
  UNK+uU2rdB+Z5wGPuRCcf9pVcz3ZzWbdsneubIR6k9ng+tRGRFnxYXW1Ye52tVOjW3d16M+kH
  fbQFcnYGMR0PLv/0UNohZlbCr3l909dzpUf8aOpo4Jx+L/6VzS1Kx5cb6M1xVAjOUWIozEg21
  mIuKEwHKHFgsQgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-585.messagelabs.com!1640614696!243782!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15973 invoked from network); 27 Dec 2021 14:18:16 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Dec 2021 14:18:16 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 479CB100199
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 14:18:16 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 37BC0100196
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 14:18:16 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 27 Dec 2021 14:18:00 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] shadow: upgrade 4.9 -> 4.10
Date: Tue, 28 Dec 2021 07:17:49 +0800
Message-ID: <1640647069-3511-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 14:18:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160026

0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch
0001-libmisc-fix-default-value-in-SHA_get_salt_rounds.patch
0001-libsubid-link-to-PAM-libraries.patch
removed since they're included in 4.10

License-Update: Delete the space at the end of the sentence.

Changelog:
==========
* libsubid fixes
* Rename the test program list_subid_ranges to getsubids, write
a manpage, so distros can ship it. (Iker Pedrosa)
* Add libeconf dep for new*idmap
* Allow all group types with usermod -G
* Avoid useradd generating empty subid range
* Handle NULL pw_passwd
* Fix default value SHA_get_salt_rounds
* Use https where possible in README
* Update content and format of README
* Translation updates
* Switch from xml2po to itstool in 'make dist'
* Fix double frees
* Add LOG_INIT configurable to useradd
* Add CREATE_MAIL_SPOOL documentation
* Create a security.md
* Fix su never being SIGKILLd when trapping TERM
* Fix wrong SELinux labels in several possible cases
* Fix missing chmod in chadowtb_move
* Handle malformed hushlogins entries
* Fix groupdel segv when passwd does not exist
* Fix covscan-found newgrp segfault
* Remove trailing slash on hoedir
* Fix passwd -l message - it does not change expirey
* Fix SIGCHLD handling bugs in su and vipw
* Remove special case for "" in usermod
* Implement usermod -rG to remove a specific group
* call pam_end() after fork in child path for su and login
* useradd: In absence of /etc/passwd, assume 0 == root
* lib: check NULL before freeing data
* Fix pwck segfault

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...builds-with-respect-to-libsubid-incl.patch | 114 ------------------
 ...default-value-in-SHA_get_salt_rounds.patch |  64 ----------
 .../0001-libsubid-link-to-PAM-libraries.patch |  31 -----
 meta/recipes-extended/shadow/shadow.inc       |  10 +-
 .../shadow/{shadow_4.9.bb => shadow_4.10.bb}  |   0
 5 files changed, 4 insertions(+), 215 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0001-libmisc-fix-default-value-in-SHA_get_salt_rounds.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch
 rename meta/recipes-extended/shadow/{shadow_4.9.bb => shadow_4.10.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch b/meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch
deleted file mode 100644
index c577be6505..0000000000
--- a/meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From eced8077b57946fe0b723e7c6c510e8f344ce89b Mon Sep 17 00:00:00 2001
-From: Serge Hallyn <serge@hallyn.com>
-Date: Fri, 23 Jul 2021 17:51:13 -0500
-Subject: [PATCH] Fix out of tree builds with respect to libsubid includes
-
-There's a better way to do this, and I hope to clean that up,
-but this fixes out of tree builds for me right now.
-
-Closes #386
-
-Signed-off-by: Serge Hallyn <serge@hallyn.com>
-Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/537b8cd90be7b47b45c45cfd27765ef85eb0ebf1]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- lib/Makefile.am      | 2 ++
- libmisc/Makefile.am  | 2 +-
- libsubid/Makefile.am | 4 ++--
- src/Makefile.am      | 6 ++++++
- 4 files changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/lib/Makefile.am b/lib/Makefile.am
-index ecf3ee25..5ac2e111 100644
---- a/lib/Makefile.am
-+++ b/lib/Makefile.am
-@@ -10,6 +10,8 @@ if HAVE_VENDORDIR
- libshadow_la_CPPFLAGS += -DVENDORDIR=\"$(VENDORDIR)\"
- endif
- 
-+libshadow_la_CPPFLAGS += -I$(top_srcdir)
-+
- libshadow_la_SOURCES = \
- 	commonio.c \
- 	commonio.h \
-diff --git a/libmisc/Makefile.am b/libmisc/Makefile.am
-index 9766a7ec..9f237e0d 100644
---- a/libmisc/Makefile.am
-+++ b/libmisc/Makefile.am
-@@ -1,7 +1,7 @@
- 
- EXTRA_DIST = .indent.pro xgetXXbyYY.c
- 
--AM_CPPFLAGS = -I$(top_srcdir)/lib $(ECONF_CPPFLAGS)
-+AM_CPPFLAGS = -I$(top_srcdir)/lib -I$(top_srcdir) $(ECONF_CPPFLAGS)
- 
- noinst_LTLIBRARIES = libmisc.la
- 
-diff --git a/libsubid/Makefile.am b/libsubid/Makefile.am
-index 189165b0..cdc41fe6 100644
---- a/libsubid/Makefile.am
-+++ b/libsubid/Makefile.am
-@@ -19,8 +19,8 @@ MISCLIBS = \
- 	$(LIBTCB)
- 
- libsubid_la_LIBADD = \
--	$(top_srcdir)/lib/libshadow.la \
--	$(top_srcdir)/libmisc/libmisc.la \
-+	$(top_builddir)/lib/libshadow.la \
-+	$(top_builddir)/libmisc/libmisc.la \
- 	$(MISCLIBS) -ldl
- 
- AM_CPPFLAGS = \
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 35027013..7c1a3491 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -10,6 +10,7 @@ sgidperms = 2755
- AM_CPPFLAGS = \
- 	-I${top_srcdir}/lib \
- 	-I$(top_srcdir)/libmisc \
-+	-I$(top_srcdir) \
- 	-DLOCALEDIR=\"$(datadir)/locale\"
- 
- # XXX why are login and su in /bin anyway (other than for
-@@ -183,6 +184,7 @@ list_subid_ranges_LDADD = \
- list_subid_ranges_CPPFLAGS = \
- 	-I$(top_srcdir)/lib \
- 	-I$(top_srcdir)/libmisc \
-+	-I$(top_srcdir) \
- 	-I$(top_srcdir)/libsubid
- 
- get_subid_owners_LDADD = \
-@@ -194,11 +196,13 @@ get_subid_owners_LDADD = \
- get_subid_owners_CPPFLAGS = \
- 	-I$(top_srcdir)/lib \
- 	-I$(top_srcdir)/libmisc \
-+	-I$(top_srcdir) \
- 	-I$(top_srcdir)/libsubid
- 
- new_subid_range_CPPFLAGS = \
- 	-I$(top_srcdir)/lib \
- 	-I$(top_srcdir)/libmisc \
-+	-I$(top_srcdir) \
- 	-I$(top_srcdir)/libsubid
- 
- new_subid_range_LDADD = \
-@@ -210,6 +214,7 @@ new_subid_range_LDADD = \
- free_subid_range_CPPFLAGS = \
- 	-I$(top_srcdir)/lib \
- 	-I$(top_srcdir)/libmisc \
-+	-I$(top_srcdir) \
- 	-I$(top_srcdir)/libsubid
- 
- free_subid_range_LDADD = \
-@@ -220,6 +225,7 @@ free_subid_range_LDADD = \
- 
- check_subid_range_CPPFLAGS = \
- 	-I$(top_srcdir)/lib \
-+	-I$(top_srcdir) \
- 	-I$(top_srcdir)/libmisc
- 
- check_subid_range_LDADD = \
--- 
-2.31.1
-
diff --git a/meta/recipes-extended/shadow/files/0001-libmisc-fix-default-value-in-SHA_get_salt_rounds.patch b/meta/recipes-extended/shadow/files/0001-libmisc-fix-default-value-in-SHA_get_salt_rounds.patch
deleted file mode 100644
index 2c9b1d06cd..0000000000
--- a/meta/recipes-extended/shadow/files/0001-libmisc-fix-default-value-in-SHA_get_salt_rounds.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 234e8fa7b134d1ebabfdad980a3ae5b63c046c62 Mon Sep 17 00:00:00 2001
-From: Mike Gilbert <floppym@gentoo.org>
-Date: Sat, 14 Aug 2021 13:24:34 -0400
-Subject: [PATCH] libmisc: fix default value in SHA_get_salt_rounds()
-
-If SHA_CRYPT_MIN_ROUNDS and SHA_CRYPT_MAX_ROUNDS are both unspecified,
-use SHA_ROUNDS_DEFAULT.
-
-Previously, the code fell through, calling shadow_random(-1, -1). This
-ultimately set rounds = (unsigned long) -1, which ends up being a very
-large number! This then got capped to SHA_ROUNDS_MAX later in the
-function.
-
-The new behavior matches BCRYPT_get_salt_rounds().
-
-Bug: https://bugs.gentoo.org/808195
-Fixes: https://github.com/shadow-maint/shadow/issues/393
-
-Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/234e8fa7b134d1ebabfdad980a3ae5b63c046c62]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- libmisc/salt.c | 21 +++++++++++----------
- 1 file changed, 11 insertions(+), 10 deletions(-)
-
-diff --git a/libmisc/salt.c b/libmisc/salt.c
-index 91d528fd..30eefb9c 100644
---- a/libmisc/salt.c
-+++ b/libmisc/salt.c
-@@ -223,20 +223,21 @@ static /*@observer@*/const unsigned long SHA_get_salt_rounds (/*@null@*/int *pre
- 		if ((-1 == min_rounds) && (-1 == max_rounds)) {
- 			rounds = SHA_ROUNDS_DEFAULT;
- 		}
-+		else {
-+			if (-1 == min_rounds) {
-+				min_rounds = max_rounds;
-+			}
- 
--		if (-1 == min_rounds) {
--			min_rounds = max_rounds;
--		}
-+			if (-1 == max_rounds) {
-+				max_rounds = min_rounds;
-+			}
- 
--		if (-1 == max_rounds) {
--			max_rounds = min_rounds;
--		}
-+			if (min_rounds > max_rounds) {
-+				max_rounds = min_rounds;
-+			}
- 
--		if (min_rounds > max_rounds) {
--			max_rounds = min_rounds;
-+			rounds = (unsigned long) shadow_random (min_rounds, max_rounds);
- 		}
--
--		rounds = (unsigned long) shadow_random (min_rounds, max_rounds);
- 	} else if (0 == *prefered_rounds) {
- 		rounds = SHA_ROUNDS_DEFAULT;
- 	} else {
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch b/meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch
deleted file mode 100644
index ea7a99dbf7..0000000000
--- a/meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 4f44617af3a0c59be267ac5fcc33586e3783f5e6 Mon Sep 17 00:00:00 2001
-From: Xi Ruoyao <xry111@mengyan1223.wang>
-Date: Fri, 23 Jul 2021 14:38:08 +0800
-Subject: [PATCH] libsubid: link to PAM libraries
-
-libsubid.so links to libmisc.a, which contains several routines referring to
-PAM functions.
-
-Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/f4a84efb468b8be21be124700ce35159c444e9d6]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- libsubid/Makefile.am | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libsubid/Makefile.am b/libsubid/Makefile.am
-index cdc41fe6..99308c1f 100644
---- a/libsubid/Makefile.am
-+++ b/libsubid/Makefile.am
-@@ -16,7 +16,8 @@ MISCLIBS = \
- 	$(LIBCRYPT) \
- 	$(LIBACL) \
- 	$(LIBATTR) \
--	$(LIBTCB)
-+	$(LIBTCB) \
-+	$(LIBPAM)
- 
- libsubid_la_LIBADD = \
- 	$(top_builddir)/lib/libshadow.la \
--- 
-2.31.1
-
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index c91f2739cf..6d4a77caed 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -4,8 +4,9 @@ DESCRIPTION = "${SUMMARY}"
 BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
 SECTION = "base/utils"
 LICENSE = "BSD-3-Clause | Artistic-1.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ed80ff1c2b40843cf5768e5229cf16e5 \
-                    file://src/passwd.c;beginline=2;endline=30;md5=5720ff729a6ff39ecc9f64555d75f4af"
+LIC_FILES_CHKSUM = "file://COPYING;md5=24f172951acb1904c9273a6a016b0b36 \
+                    file://src/passwd.c;beginline=2;endline=30;md5=5720ff729a6ff39ecc9f64555d75f4af \
+                    "
 
 DEPENDS = "virtual/crypt"
 
@@ -14,9 +15,6 @@ SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}
            file://shadow-4.1.3-dots-in-usernames.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://shadow-relaxed-usernames.patch \
-           file://0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch \
-           file://0001-libsubid-link-to-PAM-libraries.patch \
-           file://0001-libmisc-fix-default-value-in-SHA_get_salt_rounds.patch \
            file://useradd \
            "
 
@@ -33,7 +31,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
            "
 
-SRC_URI[sha256sum] = "6c4627ff9c9422b96664517ae753c944f2902e92809d0698b65f5fef11985212"
+SRC_URI[sha256sum] = "efa9b89b5901644890dbf230b8e9e3dbcdb51ffb6be145afc57f3012861aeddf"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
diff --git a/meta/recipes-extended/shadow/shadow_4.9.bb b/meta/recipes-extended/shadow/shadow_4.10.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.9.bb
rename to meta/recipes-extended/shadow/shadow_4.10.bb
-- 
2.25.1


