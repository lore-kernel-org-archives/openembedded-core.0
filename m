Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id E31987916D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:17:29 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id q204-v6so2460970oig.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rIEUN+AOjNZETAQzzOLucEBCSFriE+6z8FiFynfVvmI=;
	b=s2yry5TTN5FYvmz3twGlXdBEHwUPieEk2lpwhjUqyaLot4f6DOoXIXvDjn82cR5Izo
	cePkgoYsN+QnWivD5XVGhqtIPO2mWDALihxTf6JMmBTpG/PBx+TgasZjkPtNig8XUr7+
	zl6Sk0II5HNP3gP51MdvsAxj2EmWX6WTtdpy8DVlSS4WwS0GGvseFObj5RnWOtv5n9if
	wFdC5rFnlWiod2IY+NEleCHhbD4tg2eC808q8OToDROtAdRf6W0r17KGV1wqNAnk5DsR
	gOSgiPZpprd+OAzp8MkuPq3nrQF/oSKdL6Qr7HG+e7rVHS4FMSYmHGutd8Od8YUC+CSb
	u0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rIEUN+AOjNZETAQzzOLucEBCSFriE+6z8FiFynfVvmI=;
	b=LPrrwnAJVsXm0iE/fBw1OkdFje3IwQRKPy3j8w1jX27X18ApjD75Uh6G7lorrmp7Cf
	IAFhPyrkQ05K6ECeD+FD88cn+5Ioxr2e2WCOuXg5eRM+wT0XpfMXvTI3eePbCT5vv7tl
	djhFQQv7NOIqEP4mwfh8VRzCqhNGkSUbYtkk9K2IQAMjsJ1rJtf7EIzaPlMe84YszFn/
	CfMH/07X/hOdIIT9iy/X+40CzHg7p8d04x/7eaM0oC7o5CKzd39cP86RtZ+caNQtBssI
	ArFZVXI72T9k1IgK0ekYy/ceQa+6I/L69S0x5DqarB/2Oh5q0CCojUjwPLf35WZqruJG
	bW8g==
X-Gm-Message-State: APzg51BUWlkGj/vFV9xl/H7VOMOsiecrCGl/fDn70wAV5JZh0tQFi36u
	oMG/EMNbUo3vaDeYQkaWhd5JfVMZFGo=
X-Google-Smtp-Source: ANB0VdY4JYmfZE7CyC4w5vGrFQt5EmAcYp4ZpU4i5Gmr/ZJhxTrHEmZ4HxflVUxa5H06tuEa5ZKUvg==
X-Received: by 2002:aca:5a45:: with SMTP id
	o66-v6mr3485559oib.155.1534936650864; 
	Wed, 22 Aug 2018 04:17:30 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	v5-v6sm694446oix.36.2018.08.22.04.17.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:17:30 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:46:43 +0530
Message-Id: <1534936615-11658-7-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
Cc: Ferret on Shark <shark_admin@mvista.co>
Subject: [SUMO][PATCH 07/19] gnupg: CVE-2018-12020
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
X-List-Received-Date: Wed, 22 Aug 2018 11:17:30 -0000

From: Ferret on Shark <shark_admin@mvista.co>

gpg: Sanitize diagnostic with the original file name.

* g10/mainproc.c (proc_plaintext): Sanitize verbose output.
--

This fixes a forgotten sanitation of user supplied data in a verbose
mode diagnostic.  The mention CVE is about using this to inject
status-fd lines into the stderr output.  Other harm good as well be
done.  Note that GPGME based applications are not affected because
GPGME does not fold status output into stderr.

CVE-id: CVE-2018-12020
GnuPG-bug-id: 4012

Affects gnupg < 2.2.8

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../gnupg/gnupg/CVE-2018-12020.patch               | 47 ++++++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.2.4.bb          |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2018-12020.patch

diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2018-12020.patch b/meta/recipes-support/gnupg/gnupg/CVE-2018-12020.patch
new file mode 100644
index 0000000..14698db
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2018-12020.patch
@@ -0,0 +1,47 @@
+From 13f135c7a252cc46cff96e75968d92b6dc8dce1b Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Fri, 8 Jun 2018 10:45:21 +0200
+Subject: [PATCH] gpg: Sanitize diagnostic with the original file name.
+
+* g10/mainproc.c (proc_plaintext): Sanitize verbose output.
+--
+
+This fixes a forgotten sanitation of user supplied data in a verbose
+mode diagnostic.  The mention CVE is about using this to inject
+status-fd lines into the stderr output.  Other harm good as well be
+done.  Note that GPGME based applications are not affected because
+GPGME does not fold status output into stderr.
+
+CVE-id: CVE-2018-12020
+GnuPG-bug-id: 4012
+
+Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=13f135c7a252cc46cff96e75968d92b6dc8dce1b]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ g10/mainproc.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/g10/mainproc.c b/g10/mainproc.c
+index d2ceec2fd..a9da08f74 100644
+--- a/g10/mainproc.c
++++ b/g10/mainproc.c
+@@ -851,7 +851,14 @@ proc_plaintext( CTX c, PACKET *pkt )
+   if (pt->namelen == 8 && !memcmp( pt->name, "_CONSOLE", 8))
+     log_info (_("Note: sender requested \"for-your-eyes-only\"\n"));
+   else if (opt.verbose)
+-    log_info (_("original file name='%.*s'\n"), pt->namelen, pt->name);
++    {
++      /* We don't use print_utf8_buffer because that would require a
++       * string change which we don't want in 2.2.  It is also not
++       * clear whether the filename is always utf-8 encoded.  */
++      char *tmp = make_printable_string (pt->name, pt->namelen, 0);
++      log_info (_("original file name='%.*s'\n"), (int)strlen (tmp), tmp);
++      xfree (tmp);
++    }
+ 
+   free_md_filter_context (&c->mfx);
+   if (gcry_md_open (&c->mfx.md, 0, 0))
+-- 
+2.13.3
+
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.4.bb b/meta/recipes-support/gnupg/gnupg_2.2.4.bb
index d3f1a8f..d6bfaff 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.4.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0003-dirmngr-uses-libgpg-error.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
+           file://CVE-2018-12020.patch \
           "
 SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch"
 
-- 
2.7.4


