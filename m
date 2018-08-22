Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id E775A793B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:20:37 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id c190-v6so3055096oig.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4tXptQq/bgMceGKQzEwD5c8aV1SKQnTJBbPDfeAfqHg=;
	b=miIrZji965yOq2ran04dElAG/HqFTBFZgxkYNVE3kH1tASIRURZud+joucx7e94uKO
	/Y4PlyRf/f0V5Wo5Jdbuq0yZiVXVt90ZSJZfYkPMoIu0YFxHB6hnjluF7XDkrQjq95wj
	hG1/8voI6bgCoCLAArGqYHAUNKOv+gUEQqr3WrHt6YoSZLm8S+RBP4fZLeic0vOrviSB
	V3BaqvGyAXd6ZhGz/o2Fbxof6v639TR0j02UbdsGhUAkZekmIgp9jG+SylspXQFqaPRv
	KGJFheORz6JoVxhwp49XeHMxN5/SEJi35Z4/usMamQ5GcfW9DjVd+WEY+w2XvQwmtxp2
	3jnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4tXptQq/bgMceGKQzEwD5c8aV1SKQnTJBbPDfeAfqHg=;
	b=ABVmUcQ5V5shvAS6A4LsU8/P7+Od7Uh3uwNmd/7l7DAv3OT7GxfYyadaDOFYmp8TkT
	7e3HCnpkFFXDFbjmsEIEa61S1bVRnnSaNcQq+CvBTdq/23z5RI4wzXQxaAhdr4IykQGg
	lwKCkhQ1mJMbblJrhMOUrMEA940lgM8LMy2uRiXq9SFUwbjUsbdomIlFJddPOMc276Yc
	q2enluBI2obB1p8Kk1ZxWytyuiZEn349y0a4Q8Oy5pQeKsyWuCNLnmguHeE8tR6mfDbw
	CdXMM8cN8AFOj5zWc3cvQ85FRXewNkPyWx+Qmu7UOTpzaK5OHT1o1EWvWK+tD83twRWi
	M5jw==
X-Gm-Message-State: APzg51At44Qy7WVXlaVUYG0InwRrGqZXChatl61ecpJOuTlZ4uwaklk/
	9UIO00JnEG9DDbkv0Z3hEvuK0Nsn+Gs=
X-Google-Smtp-Source: ANB0Vdb7jHH8BNS+T6u6s46u3Anxu0T2BUh2wFrY2B7B/AJQobFscTVraEgziArF1RDNEOo0ZkDOPw==
X-Received: by 2002:aca:5c85:: with SMTP id
	q127-v6mr3642123oib.127.1534944038706; 
	Wed, 22 Aug 2018 06:20:38 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	t141-v6sm2354715oif.18.2018.08.22.06.20.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:20:38 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 18:49:57 +0530
Message-Id: <1534944009-21362-7-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
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
X-List-Received-Date: Wed, 22 Aug 2018 13:20:38 -0000

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


