Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78503C433FE
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:52 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.8689.1637163351430492853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fXBjo35m;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso2434920wme.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CQWCuTgrXCs9yuam5dgFGVro8R3JecmWBylcw9pnFGE=;
        b=fXBjo35mYkF9HQQ1lse68a29IXeBo7c1JOGpjdoBwWWfvWvqZc0N0Vgr/n5PDyK3j2
         TRyIG8RIyMebznWtj0CcMn4nP3fukSmGHUm+YY5bsq1JHVvkoT9vjjYBvkaGrrr4NS7W
         iSEcezMW2Le087/Oo/R1I1bnvK+mMXrRzfLvNIbFfw+wd5TrZQLN+UzcV488OA9SMT2I
         nhxCmNbvt5AfwDtzh5pk9jjgDF6O9TnvGgcR2gVHQNxKoxiLG6QFXk7pIOt1plpqb5yu
         Qa59hxuOI7BXM3ALPdlMx8gR5A4n07nP8XWY6gk30F4yBTPrQpoSm7KOxiOhBuegIqjg
         d72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CQWCuTgrXCs9yuam5dgFGVro8R3JecmWBylcw9pnFGE=;
        b=ZdwKrufTyRXnvxQeEURZUcloa3WOEe0HXNXgO5PrFWWuvw11MuFuZk3J/XG6MXRjQk
         ppmIjBhIo3H5xmof1n6xKG1KwtDzbaRVMLFgai0W1Fj0u5DC9Qv7Pq+muDI6P25AzbWK
         dgjfWPmsgzuWUZdwPfW5qJ/LopOGJAxulZt2SqZaZ6o45SDiIVrF3c+cXatBrjnP1Apq
         yy6Psf2n2pBfOC/uXHTslxvDv7EsNVwwc3PV0DAUzZ9Iuja5bi9au7pxTg3rMmK5T/KO
         mOlWIzx0q/yz9N2QiBxL3W4dIsB2isrcL/4VefmppKlPCInkZmJKtju2gzZbjrfyR1d2
         vxvg==
X-Gm-Message-State: AOAM531UbeUBE3oAPHqa4bZvHI4+3jGHE54GjOdelBeLD8IeylnYwAQG
	oPX/dP8pTdeBfQ6XixmBOXa1X3ppsqo=
X-Google-Smtp-Source: 
 ABdhPJzofHKmE3ubO0yiof00Dto76TYWxNOBGkIdFxU68g/pJS1V5426WRDjZrSu7mwcmTV5FZY8pw==
X-Received: by 2002:a1c:5409:: with SMTP id i9mr644588wmb.146.1637163349942;
        Wed, 17 Nov 2021 07:35:49 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 33/36] expect: do not install examples, drop related patch
Date: Wed, 17 Nov 2021 16:35:22 +0100
Message-Id: <20211117153525.257146-33-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158428

There is really no reason to install them; this was done
in the original recipe submission for unexplained reasons.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../expect/expect/01-example-shebang.patch    | 144 ------------------
 meta/recipes-devtools/expect/expect_5.45.4.bb |   2 -
 2 files changed, 146 deletions(-)
 delete mode 100644 meta/recipes-devtools/expect/expect/01-example-shebang.patch

diff --git a/meta/recipes-devtools/expect/expect/01-example-shebang.patch b/meta/recipes-devtools/expect/expect/01-example-shebang.patch
deleted file mode 100644
index 8597f31387..0000000000
--- a/meta/recipes-devtools/expect/expect/01-example-shebang.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-Author: Mike Markley <mike@markley.org>
-Author: Sergei Golovan <sgolovan@debian.org>
-Description: Fixes shebangs in examples (Closes: #152367).
-
-Backported from Debian
-
-Upstream-Status: Pending
-Index: expect5.45/example/beer.exp
-===================================================================
---- expect5.45.orig/example/beer.exp	2006-01-25 13:51:39.000000000 -0800
-+++ expect5.45/example/beer.exp	2013-11-01 17:35:19.817318341 -0700
-@@ -1,4 +1,9 @@
--#!/depot/path/expect -f
-+#!/bin/sh
-+# -*- tcl -*-
-+# The next line is executed by /bin/sh, but not tcl \
-+exec tclsh "$0" ${1+"$@"}
-+
-+package require Expect
- 
- # 99 bottles of beer on the wall, Expect-style
- # Author: Don Libes <libes@nist.gov>
-Index: expect5.45/example/expectd.proto
-===================================================================
---- expect5.45.orig/example/expectd.proto	2010-07-02 09:03:31.000000000 -0700
-+++ expect5.45/example/expectd.proto	2013-11-01 17:35:19.821318341 -0700
-@@ -1,4 +1,10 @@
--#!/depot/tcl/src/expect/e --
-+#!/bin/sh
-+# -*- tcl -*-
-+# The next line is executed by /bin/sh, but not tcl \
-+exec tclsh "$0" ${1+"$@"}
-+
-+package require Expect
-+
- # Description: Simple fragment to begin a telnet daemon
- # For more information, see Chapter 17 of "Exploring Expect"
- # Author: Don Libes, NIST
-Index: expect5.45/example/irsh
-===================================================================
---- expect5.45.orig/example/irsh	2010-07-02 09:03:31.000000000 -0700
-+++ expect5.45/example/irsh	2013-11-01 17:35:19.821318341 -0700
-@@ -1,4 +1,9 @@
--#!/depot/path/expect --
-+#!/bin/sh
-+# -*- tcl -*-
-+# The next line is executed by /bin/sh, but not tcl \
-+exec tclsh "$0" ${1+"$@"}
-+
-+package require Expect
- 
- # Do rsh interactively.  For example, consider the following command:
- #    rsh <remote> ls -l "|" more
-Index: expect5.45/example/passwd.cgi
-===================================================================
---- expect5.45.orig/example/passwd.cgi	2000-01-06 15:22:07.000000000 -0800
-+++ expect5.45/example/passwd.cgi	2013-11-01 17:35:19.821318341 -0700
-@@ -1,4 +1,9 @@
--#!/depot/path/expect --
-+#!/bin/sh
-+# -*- tcl -*-
-+# The next line is executed by /bin/sh, but not tcl \
-+exec tclsh "$0" ${1+"$@"}
-+
-+package require Expect
- 
- # This is a CGI script to process requests created by the accompanying
- # passwd.html form.  This script is pretty basic, although it is
-Index: expect5.45/example/passwdprompt
-===================================================================
---- expect5.45.orig/example/passwdprompt	2003-09-05 12:01:59.000000000 -0700
-+++ expect5.45/example/passwdprompt	2013-11-01 17:35:19.821318341 -0700
-@@ -1,4 +1,9 @@
--#!/depot/path/expect
-+#!/bin/sh
-+# -*- tcl -*-
-+# The next line is executed by /bin/sh, but not tcl \
-+exec tclsh "$0" ${1+"$@"}
-+
-+package require Expect
- 
- # This script prompts for a passwd from stdin while echoing *'s
- 
-Index: expect5.45/example/reprompt
-===================================================================
---- expect5.45.orig/example/reprompt	2000-01-06 15:22:07.000000000 -0800
-+++ expect5.45/example/reprompt	2013-11-01 17:35:19.821318341 -0700
-@@ -1,4 +1,9 @@
--#!/depot/path/expect --
-+#!/bin/sh
-+# -*- tcl -*-
-+# The next line is executed by /bin/sh, but not tcl \
-+exec tclsh "$0" ${1+"$@"}
-+
-+package require Expect
- 
- # Name: reprompt
- # Description: reprompt every so often until user enters something
-Index: expect5.45/example/term_expect
-===================================================================
---- expect5.45.orig/example/term_expect	2005-02-15 10:11:31.000000000 -0800
-+++ expect5.45/example/term_expect	2013-11-01 17:35:19.821318341 -0700
-@@ -1,4 +1,9 @@
--#!/depot/path/expectk
-+#!/bin/sh
-+# -*- tcl -*-
-+# The next line is executed by /bin/sh, but not tcl \
-+exec wish "$0" ${1+"$@"}
-+
-+package require Expect
- 
- # Name: tkterm - terminal emulator using Expect and Tk text widget, v3.0
- # Author: Don Libes, July '94
-Index: expect5.45/example/vrfy
-===================================================================
---- expect5.45.orig/example/vrfy	2010-07-02 09:03:31.000000000 -0700
-+++ expect5.45/example/vrfy	2013-11-01 17:35:19.821318341 -0700
-@@ -1,4 +1,9 @@
--#!/depot/path/expect -f
-+#!/bin/sh
-+# -*- tcl -*-
-+# The next line is executed by /bin/sh, but not tcl \
-+exec tclsh "$0" ${1+"$@"}
-+
-+package require Expect
- 
- 
- # separate address into user and host
-Index: expect5.45/example/xrlogin
-===================================================================
---- expect5.45.orig/example/xrlogin	2000-01-06 15:22:08.000000000 -0800
-+++ expect5.45/example/xrlogin	2013-11-01 17:35:19.821318341 -0700
-@@ -1,4 +1,10 @@
--#!/depot/path/expect --
-+#!/bin/sh
-+# -*- tcl -*-
-+# The next line is executed by /bin/sh, but not tcl \
-+exec tclsh "$0" ${1+"$@"}
-+
-+package require Expect
-+
- # xrlogin - rlogin but with current DISPLAY
- #
- # You can extend this idea to save any arbitrary information across rlogin
diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index e27b0d9d71..4214ab0f27 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -21,7 +21,6 @@ inherit autotools update-alternatives
 SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://0001-configure.in.patch \
            file://0002-tcl.m4.patch \
-           file://01-example-shebang.patch \
            file://0001-expect-install-scripts-without-using-the-fixline1-tc.patch \
            file://0001-Resolve-string-formatting-issues.patch \
            file://0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch \
@@ -39,7 +38,6 @@ do_install:append() {
 	install -d ${D}${libdir}
         install -m 0755 ${D}${libdir}/expect${PV}/libexpect*.so   ${D}${libdir}/
         install -m 0755 ${S}/fixline1           ${D}${libdir}/expect${PV}/
-        install -m 0755 ${S}/example/*          ${D}${libdir}/expect${PV}/
         rm ${D}${libdir}/expect${PV}/libexpect*.so
         sed -e 's|$dir|${libdir}|' -i ${D}${libdir}/expect${PV}/pkgIndex.tcl
 }
-- 
2.20.1


