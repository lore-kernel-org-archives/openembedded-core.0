Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4A75473198
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 22:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBFMRmrJ020536 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 22:27:48 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PBJxSPVjubOz
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 22:27:48 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBFMRkqi020531
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 22:27:47 GMT
Message-ID: <1450218466.13505.95.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Dec 2015 22:27:46 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] m4: Drop unused/unreferenced patch
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
X-List-Received-Date: Tue, 15 Dec 2015 22:27:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/m4/m4/make.patch b/meta/recipes-devtools/m4/m4/make.patch
deleted file mode 100644
index 79fb415..0000000
--- a/meta/recipes-devtools/m4/m4/make.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- m4-1.4.2/doc/Makefile.in~make
-+++ m4-1.4.2/doc/Makefile.in
-@@ -57,9 +57,9 @@
- 	date > $(srcdir)/stamp-vti
- 
- install: all
--	$(srcdir)/../mkinstalldirs $(infodir)
-+	$(srcdir)/../mkinstalldirs $(DESTDIR)$(infodir)
- 	cd $(srcdir) && for file in m4.info*; do \
--	  $(INSTALL_DATA) $$file $(infodir)/$$file; \
-+	  $(INSTALL_DATA) $$file $(DESTDIR)$(infodir)/$$file; \
- 	done
- 
- uninstall:
---- m4-1.4.2/src/Makefile.in~make
-+++ m4-1.4.2/src/Makefile.in
-@@ -35,7 +35,7 @@
- prefix = @prefix@
- exec_prefix = @exec_prefix@
- transform = @program_transform_name@
--bindir = $(exec_prefix)/bin
-+bindir = @bindir@
- 
- COMPILE = $(CC) -c $(DEFS) $(INCLUDES) $(CPPFLAGS) $(CFLAGS)
- LINK = $(CC) $(LDFLAGS) -o $@
-@@ -84,8 +84,8 @@
- 	$(LINK) ansi2knr.o $(LIBS)
- 
- install: all
--	$(srcdir)/../mkinstalldirs $(bindir)
--	$(INSTALL_PROGRAM) m4 $(bindir)/`echo m4 | sed '$(transform)'`
-+	$(srcdir)/../mkinstalldirs $(DESTDIR)$(bindir)
-+	$(INSTALL_PROGRAM) m4 $(DESTDIR)$(bindir)/`echo m4 | sed '$(transform)'`
- 
- uninstall:
- 	rm -f $(bindir)/`echo m4 | sed '$(transform)'`



