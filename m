Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 20F4C6B7B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 19:57:03 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id o7so831012lbv.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 12:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=hTGl2Dk3HiY3sTQ1cICOo0DhmSLiEvb6cwsmu44G9uw=;
	b=M24IDuQHvLvqKveKm87OsICOAkqjlnm4B6p3MPsd5Y9od6cM9msr74+QipHGNCY1P0
	ig5L1YQLs8V4uf4W4nt5vGtcXMsjYbK0/fitAkCSNUvzaqrEvL9FksqwSGps54k70rlt
	Y/iHoT1AqsjNwC81qJd+KoLK0m0vZR+9AcsqA7rK5mNPMIbWMbH+lidUf9Ozs7wC/T8u
	JfPoNJZxzVe2DiJNqkFTmwvd/dCRxLELSXeNEIMf1em/x8w5buLInJKbg2N8Z0iM57bj
	d3+JgYpd5NL0YKPr3N1eBR7fekgchQOYDhJO55SmOjDYkwaNMfnDqbPYU5m+8gcs8lYP
	MBsA==
X-Received: by 10.112.28.109 with SMTP id a13mr3963976lbh.3.1377028624200;
	Tue, 20 Aug 2013 12:57:04 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id o1sm1451154lah.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 20 Aug 2013 12:57:03 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VBs33-0001wf-N8; Tue, 20 Aug 2013 22:57:01 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2013 22:56:59 +0300
Message-Id: <ecbb9d4e38ed43399b6155e2b7a71252dbb57a01.1376988152.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1376988152.git.cazfi74@gmail.com>
References: <cover.1376988152.git.cazfi74@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] texinfo: correct dont-depend-on-help2man.patch
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
X-List-Received-Date: Tue, 20 Aug 2013 19:57:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch needed only with automake-1.13 no longer worked as expected
after texinfo has been updated to version 5.1.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../texinfo-5.1/dont-depend-on-help2man.patch      |   43 +++++++++++++++++---
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/texinfo/texinfo-5.1/dont-depend-on-help2man.patch b/meta/recipes-extended/texinfo/texinfo-5.1/dont-depend-on-help2man.patch
index 7502328..6e216da 100644
--- a/meta/recipes-extended/texinfo/texinfo-5.1/dont-depend-on-help2man.patch
+++ b/meta/recipes-extended/texinfo/texinfo-5.1/dont-depend-on-help2man.patch
@@ -1,11 +1,10 @@
 Upstream-Status: Inappropŕiate
 
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-Index: texinfo-5.1/doc/Makefile.am
-===================================================================
---- texinfo-5.1.orig/doc/Makefile.am
-+++ texinfo-5.1/doc/Makefile.am
-@@ -40,7 +40,7 @@ refcard_files = refcard/Makefile refcard
+diff -Nurd texinfo-5.1/doc/Makefile.am texinfo-5.1/doc/Makefile.am
+--- texinfo-5.1/doc/Makefile.am	2013-02-23 02:11:25.000000000 +0200
++++ texinfo-5.1/doc/Makefile.am	2013-08-20 01:43:55.622376198 +0300
+@@ -40,7 +40,7 @@
  # Include our texinfo.tex, not Automake's.
  EXTRA_DIST = epsf.tex texinfo.tex \
               fdl.texi \
@@ -14,3 +13,37 @@ Index: texinfo-5.1/doc/Makefile.am
  	     $(refcard_files)
  
  if INSTALL_WARNINGS
+diff -Nurd texinfo-5.1/man/Makefile.am texinfo-5.1/man/Makefile.am
+--- texinfo-5.1/man/Makefile.am	2013-02-23 02:11:25.000000000 +0200
++++ texinfo-5.1/man/Makefile.am	2013-08-20 01:53:40.542395884 +0300
+@@ -13,24 +13,24 @@
+ # implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+
+ # These are generated using help2man.
+-man_MANS = install-info.1 makeinfo.1 texindex.1 texi2dvi.1
++#man_MANS = install-info.1 makeinfo.1 texindex.1 texi2dvi.1
+
+ # These require the build in info/, thus can't do if we failed to find a
+ # terminal library.
+ if HAVE_TERMLIBS
+-man_MANS += info.1 infokey.1
++#man_MANS += info.1 infokey.1
+ endif
+
+ # These are hand-written.
+-man_MANS += info.5 texinfo.5
++#man_MANS += info.5 texinfo.5
+
+ # This is generated by pod2man, but let's just run it by hand.
+-man_MANS += pod2texi.1
++#man_MANS += pod2texi.1
+
+ # These are just .so's to the common program.
+-man_MANS += texi2any.1 texi2pdf.1 pdftexi2dvi.1
++#man_MANS += texi2any.1 texi2pdf.1 pdftexi2dvi.1
+
+-EXTRA_DIST = $(man_MANS) ginfo.h2m
++EXTRA_DIST = ginfo.h2m
+
+ # Maintainers should be able to regenerate.
+ MAINTAINERCLEANFILES = $(man_MANS)
-- 
1.7.10.4


