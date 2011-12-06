Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RXnZx-0003oc-Qr
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 06:28:34 +0100
Received: by yenq1 with SMTP id q1so1491765yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2011 21:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=vA4topd2tDaTjWYVML79P/eTotVf7jITWln2Kwjmi3w=;
	b=n/GRAg0U8O6oayIFP5pEPMjKjXMBQfxaKvP450dOn1rkvx+hX8PMG42qbJ18nap0WB
	ntijxpVcOUN56nlAbiG/WQzTswxh+j37zknf0EVdEpPMk3/8XwF3BVWQHGtNLtsKAv3e
	HSZjzbeLOi6MBZxF4+ttxri3b6bC6J0SH2SfY=
Received: by 10.236.131.1 with SMTP id l1mr17037389yhi.82.1323148901258;
	Mon, 05 Dec 2011 21:21:41 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id l19sm57929084anc.14.2011.12.05.21.21.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 21:21:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2011 21:21:19 -0800
Message-Id: <7f16a07bec0dc3c5f0a8ec800cc66430e9010c5e.1323148566.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <2f734b193f63f8fe0625c758bc5c696bf93166ac.1323148566.git.raj.khem@gmail.com>
References: <2f734b193f63f8fe0625c758bc5c696bf93166ac.1323148566.git.raj.khem@gmail.com>
In-Reply-To: <cover.1323148566.git.raj.khem@gmail.com>
References: <cover.1323148566.git.raj.khem@gmail.com>
Subject: [PATCH 4/6] gnutls: Fix fix-gettext-version.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2011 05:28:35 -0000

This patch did not cover all places to remove references
to gettext 0.17 therefore updated it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnutls-2.12.14/fix-gettext-version.patch       |   17 +++++++++++++++--
 meta/recipes-support/gnutls/gnutls_2.12.14.bb      |    2 +-
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls-2.12.14/fix-gettext-version.patch b/meta/recipes-support/gnutls/gnutls-2.12.14/fix-gettext-version.patch
index 7a41120..a0da765 100644
--- a/meta/recipes-support/gnutls/gnutls-2.12.14/fix-gettext-version.patch
+++ b/meta/recipes-support/gnutls/gnutls-2.12.14/fix-gettext-version.patch
@@ -5,8 +5,8 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
 Index: gnutls-2.12.14/lib/po/Makefile.in.in
 ===================================================================
---- gnutls-2.12.14.orig/lib/po/Makefile.in.in	2011-11-28 20:15:56.000000000 -0800
-+++ gnutls-2.12.14/lib/po/Makefile.in.in	2011-11-28 20:17:21.386078977 -0800
+--- gnutls-2.12.14.orig/lib/po/Makefile.in.in	2009-11-01 01:43:00.000000000 -0800
++++ gnutls-2.12.14/lib/po/Makefile.in.in	2011-12-05 12:09:34.349552489 -0800
 @@ -8,8 +8,8 @@
  # Please note that the actual code of GNU gettext is covered by the GNU
  # General Public License and is *not* in the public domain.
@@ -18,3 +18,16 @@ Index: gnutls-2.12.14/lib/po/Makefile.in.in
  
  PACKAGE = @PACKAGE@
  VERSION = @VERSION@
+Index: gnutls-2.12.14/lib/m4/po.m4
+===================================================================
+--- gnutls-2.12.14.orig/lib/m4/po.m4	2011-12-05 12:12:34.000000000 -0800
++++ gnutls-2.12.14/lib/m4/po.m4	2011-12-05 12:12:49.429552465 -0800
+@@ -29,7 +29,7 @@
+ 
+   dnl Release version of the gettext macros. This is used to ensure that
+   dnl the gettext macros and po/Makefile.in.in are in sync.
+-  AC_SUBST([GETTEXT_MACRO_VERSION], [0.17])
++  AC_SUBST([GETTEXT_MACRO_VERSION], [0.18])
+ 
+   dnl Perform the following tests also if --disable-nls has been given,
+   dnl because they are needed for "make dist" to work.
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.14.bb b/meta/recipes-support/gnutls/gnutls_2.12.14.bb
index 385bb2c..f521f1a 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.14.bb
@@ -1,6 +1,6 @@
 require gnutls.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://gnutls-openssl.patch \
             file://configure-fix.patch \
-- 
1.7.5.4



