Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 45EF36168E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 18:54:14 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v4so3202892wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 10:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FSiJl+9x2u9q69Ri6/RimNhs3zkDc7SbtNMQUkx8L30=;
	b=pyl4gz1v6jgYKtiawexgqTZVigkjeFUyypLF6nnSjAB253uNbtfsPEoVoKZSu/XMoA
	wekOK9NxMuHbQpjg5RvtjreDg8Xil11/tTKZ4hOPBWub4uwNR0XkkNfN7fSTwdK5+XVB
	qSlZE4N0Szp0Fkx1eACbGXtEAizPbSstnSoKamcrymP60M3yDsTLmPUbGIfBBAfzH+Gq
	328mNQhyPnx+EgAfSOckY2N7Bu2Ls73VWdpsbwSYf6xUS0R48eyVLM/6+8pTT2av4zt+
	vWG/qDXGDoBSg2NE3lRLrtbUnvhcU8Bt4kLYCkqEjK2lV19i2BYvC//mKwxdYf8IXraI
	oSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FSiJl+9x2u9q69Ri6/RimNhs3zkDc7SbtNMQUkx8L30=;
	b=TnWNl7EA+a8i5oqXWQaWKHd0MxhZJDvEz+CExDrTstmob/OWhjhoLH4H8qH1AhuQtt
	R1yYZZ5AaLLjRnmvnuYMiI3FMa57usHMQDCp//apnZCMoTp619uH3m9uBqTzoSv9AaPa
	i6TahppcfJ44W6J9CiB9gGto1ipRss0syn/4/s/QrsFFraZHNVuuKoI/iEHBmZL361vH
	9K0Fxx0Hh7KLnh75E7OFs/e+WwDCJR7JewzAn+3nD1XdfjYW2WitUQ7UpunoX1nPSw48
	YcLKoRO4awLJyDvexwzP7MrkSxDcVVVsn+9/tstFpMqoAwA/7vDaEbUfwHGgb9RLYDy5
	LFbg==
X-Gm-Message-State: APjAAAUEEgAy07EwdEldEnIoB8CFcfXV5iHB1t+3GNmx8kpbPci0fcE/
	ixlPry/W40jJrHfMX4maw/KshVZS
X-Google-Smtp-Source: APXvYqzu6Dy9XJl/NBnR5KdAYgZ6BxsCA3sutLzo7kdaMW3fcLnb6ugXIgJX0uxT8FpyYFzmlCfrVA==
X-Received: by 2002:a5d:528e:: with SMTP id c14mr553142wrv.308.1582656854360; 
	Tue, 25 Feb 2020 10:54:14 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	g7sm25730756wrq.21.2020.02.25.10.54.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 10:54:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 19:53:33 +0100
Message-Id: <20200225185335.19326-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225185335.19326-1-alex.kanavin@gmail.com>
References: <20200225185335.19326-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/12] libgpg-error: upgrade 1.36 -> 1.37
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
X-List-Received-Date: Tue, 25 Feb 2020 18:54:14 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libgpg-error-1.36-gawk5-support.patch     | 144 ------------------
 ...gpg-error_1.36.bb => libgpg-error_1.37.bb} |   7 +-
 2 files changed, 3 insertions(+), 148 deletions(-)
 delete mode 100644 meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.36.bb => libgpg-error_1.37.bb} (92%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch b/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch
deleted file mode 100644
index b936d1143b..0000000000
--- a/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-Upstream-Status: Backport [https://dev.gnupg.org/T4459]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-From 7865041c77f4f7005282f10f9b6666b19072fbdf Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Mon, 15 Apr 2019 15:10:44 +0900
-Subject: [PATCH] awk: Prepare for Gawk 5.0.
-
-* src/Makefile.am: Use pkg_namespace (instead of namespace).
-* src/mkerrnos.awk: Likewise.
-* lang/cl/mkerrcodes.awk: Don't escape # in regexp.
-* src/mkerrcodes.awk, src/mkerrcodes1.awk, src/mkerrcodes2.awk: Ditto.
-
---
-
-In Gawk 5.0, regexp routines are replaced by Gnulib implementation,
-which only allows escaping specific characters.
-
-GnuPG-bug-id: 4459
-Reported-by: Marius Schamschula
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
----
- lang/cl/mkerrcodes.awk |  2 +-
- src/Makefile.am        |  2 +-
- src/mkerrcodes.awk     |  2 +-
- src/mkerrcodes1.awk    |  2 +-
- src/mkerrcodes2.awk    |  2 +-
- src/mkerrnos.awk       |  2 +-
- src/mkstrtable.awk     | 10 +++++-----
- 7 files changed, 11 insertions(+), 11 deletions(-)
-
---- a/lang/cl/mkerrcodes.awk
-+++ b/lang/cl/mkerrcodes.awk
-@@ -122,7 +122,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -293,7 +293,7 @@ code-from-errno.h: mkerrcodes$(EXEEXT_FO
- 
- errnos-sym.h: Makefile mkstrtable.awk errnos.in
- 	$(AWK) -f $(srcdir)/mkstrtable.awk -v textidx=2 -v nogettext=1 \
--		-v prefix=GPG_ERR_ -v namespace=errnos_ \
-+		-v prefix=GPG_ERR_ -v pkg_namespace=errnos_ \
- 		$(srcdir)/errnos.in >$@
- 
- 
---- a/src/mkerrcodes.awk
-+++ b/src/mkerrcodes.awk
-@@ -85,7 +85,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
---- a/src/mkerrcodes1.awk
-+++ b/src/mkerrcodes1.awk
-@@ -81,7 +81,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
---- a/src/mkerrcodes2.awk
-+++ b/src/mkerrcodes2.awk
-@@ -91,7 +91,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
---- a/src/mkerrnos.awk
-+++ b/src/mkerrnos.awk
-@@ -83,7 +83,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
---- a/src/mkstrtable.awk
-+++ b/src/mkstrtable.awk
-@@ -77,7 +77,7 @@
- #
- # The variable prefix can be used to prepend a string to each message.
- #
--# The variable namespace can be used to prepend a string to each
-+# The variable pkg_namespace can be used to prepend a string to each
- # variable and macro name.
- 
- BEGIN {
-@@ -102,7 +102,7 @@ header {
-       print "/* The purpose of this complex string table is to produce";
-       print "   optimal code with a minimum of relocations.  */";
-       print "";
--      print "static const char " namespace "msgstr[] = ";
-+      print "static const char " pkg_namespace "msgstr[] = ";
-       header = 0;
-     }
-   else
-@@ -110,7 +110,7 @@ header {
- }
- 
- !header {
--  sub (/\#.+/, "");
-+  sub (/#.+/, "");
-   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
- 
-   if (/^$/)
-@@ -150,7 +150,7 @@ END {
-   else
-     print "  gettext_noop (\"" last_msgstr "\");";
-   print "";
--  print "static const int " namespace "msgidx[] =";
-+  print "static const int " pkg_namespace "msgidx[] =";
-   print "  {";
-   for (i = 0; i < coded_msgs; i++)
-     print "    " pos[i] ",";
-@@ -158,7 +158,7 @@ END {
-   print "  };";
-   print "";
-   print "static GPG_ERR_INLINE int";
--  print namespace "msgidxof (int code)";
-+  print pkg_namespace "msgidxof (int code)";
-   print "{";
-   print "  return (0 ? 0";
- 
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.36.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.37.bb
similarity index 92%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.37.bb
index b11ab0548d..0b691a5eb9 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.37.bb
@@ -14,11 +14,10 @@ SECTION = "libs"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
-           file://libgpg-error-1.36-gawk5-support.patch \
-	  "
+           "
 
-SRC_URI[md5sum] = "eff437f397e858a9127b76c0d87fa5ed"
-SRC_URI[sha256sum] = "babd98437208c163175c29453f8681094bcaf92968a15cafb1a276076b33c97c"
+SRC_URI[md5sum] = "729f22d917494fdc4b54fce5aa6547c7"
+SRC_URI[sha256sum] = "b32d6ff72a73cf79797f7f2d039e95e9c6f92f0c1450215410840ab62aea9763"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.25.0


