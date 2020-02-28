Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6178B60289
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 09:26:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v4so2106012wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 01:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZdZ5+6fj/HnAOuSCDMxzSJA2bqToFRirUyXi36CqKok=;
	b=RSPV3XKsNke20D1/rqd1/kBgM2NQN2I5V1d1TCW58clBVnpziGtTyfnibOh9aGwesG
	x4V/ABBi+rzMpGhLENEjOTVcUeSRNi8cyLAFUApfCZ13N+p0Zr8DHO2v/I6oQUIZJ92p
	7ulc+XwbxBOldux3FFnsq2JkLtjALZs0Umx1WU4cQt+KWFX38sGUA00DDGeDJcfChIMX
	J0fP4XYvkRsTrBbc1/tY0Oj90eM4E1qRx26aY/6ohR8LEqmxUdAdxv2SHo6Zjb3veygA
	VZnGcso753ibclNUpSJpRs3xErdk+iBIE/ssxpm4FIaQAorxgpYZueZIeQqSxgQo4ss7
	+0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZdZ5+6fj/HnAOuSCDMxzSJA2bqToFRirUyXi36CqKok=;
	b=Puz0u04ziBwRP1KBgqpCA+DTNyt/gmFcO50fnbpyVii7q7WBc7KgQ3kGKFZmipDbnU
	nhENLQUuKz3UJ8kq3qul4cuGiihSeUOTF054iXbEVVNqkUDQOVtGdG58wRI4nA6+PQtJ
	rn38E1d1UY9D1bsFwu0tJ370qJQM8XfZFnFnYOjy1czXQbqw9sqhZtRTrWdXOHs/QewL
	JGO/AidM0P7biujt3OGRV1BQ2shpZfwqsccViLcyVEG5dVPnkVgdHUTMUXAjCfKEd1d4
	7mRb3kWOoB5B9C63Fhan96bthDHF92D5jJup+ze8tHtA4OEcThckvSSkonZXi9xrmivt
	PQrA==
X-Gm-Message-State: APjAAAW3B30xbg4tXePqobt1yIex7fRLdBUDrVVmwf3u/lbfvnWxTe/P
	AA6d0iASlT81ZKA82B1Oq+YJPiGs
X-Google-Smtp-Source: APXvYqyAJAt4qQwwrxCSesT3HlOuNM3yWu/5PMOWOAQn8QdIihU6GOQTq1tPoM+Miknw1MlhpwCo0A==
X-Received: by 2002:adf:eb46:: with SMTP id u6mr3964464wrn.239.1582881981163; 
	Fri, 28 Feb 2020 01:26:21 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	o26sm1101906wmc.33.2020.02.28.01.26.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 01:26:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 10:25:54 +0100
Message-Id: <20200228092554.15950-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] libgpg-error: upgrade 1.36 -> 1.37
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
X-List-Received-Date: Fri, 28 Feb 2020 09:26:21 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...not-fail-when-testing-config-scripts.patch |  27 ++++
 .../libgpg-error-1.36-gawk5-support.patch     | 144 ------------------
 ...gpg-error_1.36.bb => libgpg-error_1.37.bb} |   8 +-
 3 files changed, 31 insertions(+), 148 deletions(-)
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
 delete mode 100644 meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.36-gawk5-support.patch
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.36.bb => libgpg-error_1.37.bb} (91%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
new file mode 100644
index 0000000000..a0ab4f23ff
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
@@ -0,0 +1,27 @@
+From 137805890951b6b585c1d23097e0a51e8c7a8a50 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 28 Feb 2020 09:19:56 +0000
+Subject: [PATCH] Do not fail when testing config scripts
+
+In previous versions this was not a hard a failure, and so went
+unnoticed. The test is unsuitable for building with sysroots anyway as the
+failure is due to that.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 9303954..7630540 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -344,7 +344,6 @@ gpg-error-config: gpgrt-config gpg-error-config-old
+ 	else                                                   \
+ 	  echo "no";                                           \
+ 	  echo "***  Please report to <https://bugs.gnupg.org> with gpg-error-config-test.log"; \
+-	  exit 1; \
+ 	fi
+ 	cp gpg-error-config-old $@
+ 
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
similarity index 91%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.37.bb
index b11ab0548d..b9a2b01c20 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.37.bb
@@ -14,11 +14,11 @@ SECTION = "libs"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
-           file://libgpg-error-1.36-gawk5-support.patch \
-	  "
+           file://0001-Do-not-fail-when-testing-config-scripts.patch \
+           "
 
-SRC_URI[md5sum] = "eff437f397e858a9127b76c0d87fa5ed"
-SRC_URI[sha256sum] = "babd98437208c163175c29453f8681094bcaf92968a15cafb1a276076b33c97c"
+SRC_URI[md5sum] = "729f22d917494fdc4b54fce5aa6547c7"
+SRC_URI[sha256sum] = "b32d6ff72a73cf79797f7f2d039e95e9c6f92f0c1450215410840ab62aea9763"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.25.1


