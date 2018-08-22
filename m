Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id EFB327945E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:09:30 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id b15-v6so3681504oib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q2L8wFEN95FN3pheS7ubAxlMBJZnDiNTkZPnQhphHMw=;
	b=ya5Pn6Z6X2n57YUOcZBKre7U8Or8wROwgBRXqQO8BzlDiJD/XkES1mczcoUEIdGtvk
	rn9eev44bxnnY+jiY4DoDLRimHpapT2UXo60TYtIV9XEyiWOprM9/ZCopXd/0NGOc7zh
	ZDxPrNDO8+04MxY3yeGRdmaCUHItQmV4cSYVHb0ELbXJDguOmWJ4Bt+nMpuGHC1TkBbY
	hK2UvTGikfrZSon2zt9skkx8t0CV9ovtmICWLEpjk8CTxm+TbHo+61w7cvw4+fGT472t
	J6K+fRBFjADIJ2NB8e0WIdmgKSWB7QBe2xClIPBLG9Ubhz1PX4fV+FE/PcTVmGfBNJ8a
	Pgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q2L8wFEN95FN3pheS7ubAxlMBJZnDiNTkZPnQhphHMw=;
	b=JHjj2nWACaVyBQ4zXH/BsptePCWpzSzVC3d2E9tPcbdX7vvliyQpO/aP3RRDKVQ83g
	63DyLIGBeAdDqKWBI4i+Wlqm7GcPw9C9vULt7reTUZPCUw4LhFseZQvK8xnv3IZbaAF0
	sW+6nUlXytRhUKjz98i/6GbB/UER32M2Va8HK40UfR+VEabtyQZuXJktXY35RzQ350aW
	/ku4WtLkPpuSOCWV2in2TNgqm9LY569G1h/sdyzX0AEgSjLy5ZiAqhXAPrn2ojG/3/7G
	ixIGSulQImHS+Q8jBPuEcadR940RdLlCtQ4pgCeBe7KlbfGpK0Mn1VbqqicbnnYZZfbl
	GRxw==
X-Gm-Message-State: APzg51D0MSu2tZEyF99MjDN2zWk8axUH73hSRIfSS57Us7XJz0OHMD4v
	CvScj9qtBIZ6akxEdynpIxJYglt2XCY=
X-Google-Smtp-Source: ANB0Vday7nA5bwVPN1Q1R86kRzcdn/IgChs8dQEprMmWocJ5JHGQKiM3a1bz59MvInFirFAXELW36A==
X-Received: by 2002:aca:3b45:: with SMTP id
	i66-v6mr1449411oia.312.1534950571783; 
	Wed, 22 Aug 2018 08:09:31 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.09.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:09:31 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:32 +0530
Message-Id: <1534950532-23850-14-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 14/34] gnupg: CVE-2018-12020
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
X-List-Received-Date: Wed, 22 Aug 2018 15:09:31 -0000

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


