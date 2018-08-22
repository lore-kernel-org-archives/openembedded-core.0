Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6E079417
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:35 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id y207-v6so3096139oie.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q2L8wFEN95FN3pheS7ubAxlMBJZnDiNTkZPnQhphHMw=;
	b=fgVwJ2KNBO4N2OKi+rVIEgjg0N4S2GAN4p5A0fS63BQhjPxObMlE66wz62t40sqUqS
	H8kfwQKCDBANIA9A/60YqqjmFnAEhHv69oQKEFnYRj+fs4P0iJHTJOshAknNhEQoCOIq
	HRsJmdihUpJ9fwcXN05WQAEfoepmCHfpLxIJRF1ROMMZv3VUsHzf1VedP1JYDA9JvP8i
	rWCXB+X72T43BGGbyrpQoYfJYfUyg3ZY4F0MfLchuaOc/CKy7tlkziZSg0owO31uXERc
	MHNcD6CPza4HB5nVgz00CwsUtRpKbjbifcptBCN6y6C3kLKBWNXS8W/GhytYTVgj5qVu
	6psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q2L8wFEN95FN3pheS7ubAxlMBJZnDiNTkZPnQhphHMw=;
	b=mnlv6FFp2e+nbc/+43/nvzPSYxDWU3UoerLKFluIYf5alowiEr0JZxgkduZzGyeslE
	ReQ1BrK9TXAC91w2xmJ72W8VDygsGC1FO9JVg4h3BFxkJI64SOvUFtvom0Pp6ouVJIEZ
	l2F9BIozvplkaQm7N6zrQttTEZDKGLNz3imwdqOfnP0d+qxVDqoHCJVYB/6tygPmFuJt
	yoJDszbHXT6k623Y/05JbCAa2xYxiOfceyWCp47dKff3F5awl03o2l1EB7yIlWpoE0Gw
	MVHYvC68ln11j0oTMc3uHZgL4MOx2qSi6x8h0xd4q+se6ghC5zRL5LxZjUpkAvc7IVQ8
	VHtw==
X-Gm-Message-State: APzg51ALEiOeay+AWMKxQzBeeWwC/H4hdkD9cYJ59ytgdGvUvEcXxxFw
	PDLzOTJbqzKj3raDHCSpHlqTuPfIUM4=
X-Google-Smtp-Source: ANB0VdZjcv3iflM6l0xP22jAWpCz8whJK/eLULDlkvgqT/F9uloUTk8vEHedLQDrA69jeC1ui40xzw==
X-Received: by 2002:aca:cf97:: with SMTP id
	f145-v6mr4163549oig.131.1534944996045; 
	Wed, 22 Aug 2018 06:36:36 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.36.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:36:35 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:20 +0530
Message-Id: <1534944940-21566-14-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 14/34] gnupg: CVE-2018-12020
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
X-List-Received-Date: Wed, 22 Aug 2018 13:36:35 -0000

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
 meta/recipes-support/gnupg/gnupg_2.2.0.bb          |  1 +
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
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.0.bb b/meta/recipes-support/gnupg/gnupg_2.2.0.bb
index 0176ddd..962ae82 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.0.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0003-dirmngr-uses-libgpg-error.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
+           file://CVE-2018-12020.patch \
           "
 
 SRC_URI[md5sum] = "789f16949fae2d003d387f49e9da4b74"
-- 
2.7.4


