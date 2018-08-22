Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD4B79292
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:42:10 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id p84-v6so2595496oic.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eeNaqUGraspbBoKxHwLXIij9/wD3UZSS+PNXGa6jWMs=;
	b=lHr1XAAQrsoeSSKmDsBp2PvbSfWZzUMrmDl9t/2XgfDZLjkp1Pu5uBbOB9O+COds1J
	sAv3qdADlOfslFdFiaw5K93V6CAXX+qtUOkEf9D51QgJRhHxbW296yeIhYUQmPT+9ySf
	ESnxr272t01L4IWoMHpl88UITI3Xi5qOu43/k1Gj0nuKRczqB368e2+iYBbpgkF5G9RQ
	/JTIRpcUqhlvI2XHv6sbmM4Z377iYrzt2YyjsPuNXXIjJdTNdFQWSHDHDU4M2XwKVoxr
	lRo23eFt4t95jdXdPusYyUcM5puqSQnRdlK39wrperDskxRBwDrFoaOmGp1KXfi/yR2Y
	nQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eeNaqUGraspbBoKxHwLXIij9/wD3UZSS+PNXGa6jWMs=;
	b=j836ggB8xZqGH8WlCYolcxwnazRbRfDVf2OD77KBR0xSnSI8wY0RIS5wUrLgPuoiZL
	YkiOoW1/vlES9+MFjsRrQTO+78ik+FhORDOsx6NWewX+c4tU6kgDPsTT2sIB8BcspLjz
	XoQbdy7PTE0r4ri9LTT+aqOfRdSkt1BQU52dFpOnxf/2evBQXDoqljfMc/I2o9G3Oz1L
	IdmUK/kuGsjJedu/C5GTRhljv/SfVPrndydRGYJ+60Gurwp6UJPxlaXLuPYDmt72t+BH
	yOCypfqhdd4SG7W44CpR4pPciovKFKGvigAod7oa2QCXGnnWTbQOE3D+Qp5rKsaVzeKV
	An2Q==
X-Gm-Message-State: APzg51D01qrZQgYHoA94tYESthdQ2725c4qIvLdcOfgs+JEqRlQ6F2+Y
	rjeOmj3WuwyfXGFTY/MmuRYw7zqLNkw=
X-Google-Smtp-Source: ANB0VdbeEzHVIyLxyomDbQhqF3FF++BUskdfROgi6gxZWwCy/sxPis5NWHKmitEHUk+AN6FO4a2vhQ==
X-Received: by 2002:aca:b541:: with SMTP id
	e62-v6mr3840386oif.136.1534938131944; 
	Wed, 22 Aug 2018 04:42:11 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	f144-v6sm1323750oib.39.2018.08.22.04.42.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:42:11 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 17:11:45 +0530
Message-Id: <1534938113-12197-5-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534938113-12197-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534938113-12197-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [SUMO][PATCH V2] gnupg: CVE-2018-12020
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
X-List-Received-Date: Wed, 22 Aug 2018 11:42:11 -0000

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
v2:
  Corrected "From:" address

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


