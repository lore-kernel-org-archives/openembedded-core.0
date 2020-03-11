Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id F24B96100D
	for <openembedded-core@openembedded.org>;
	Wed, 11 Mar 2020 02:26:23 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id 2so395018pfg.12
	for <openembedded-core@openembedded.org>;
	Tue, 10 Mar 2020 19:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KMwVBxynH9VeQWhEfML4UHFHi5mU9pwL/+TB69t4RaQ=;
	b=bTmt3nIXaDdTqGOJFFzZ08U3mgWOZodVhH6oS06aC2XX5HjBgvWFFlvNAMF07qNFkj
	7Nn9s6zGw10+MOVgAXJnuMeI7OleJhy/3pcBwisaN8U5kJSzOWnuX9w7fVZaM5al56D5
	18vstDuyteo2veX0pyIW5e/jQ1wwf+tXyDWFNQQa/TXeYEQGDjd92AfOUJi+7S+87Ym7
	wawfhg6IXPxke4oYOxCbV/6hboA/XWrFjKUvJH+SlImd4oTXYLzwMbROw5MCUySbGqTW
	6rjEOu89npP99hAN0Ni4JyCP9bdF/utIdJ7+G6fIFGoUqynCj+jZlVV++5HrY3zEaWYp
	+kUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KMwVBxynH9VeQWhEfML4UHFHi5mU9pwL/+TB69t4RaQ=;
	b=SzuKH1hFkZvVHKYjKzDTLhAtutEv681PZx364rSj1O5XT0uOuWL98qjz1hfF+xiYSA
	HMK6MCGPbIapMbdByLmcOE9sErqM5jlzfmIoHCDC8LqAj+T+vqv9wK6Y4hOZYGTnNC/8
	zaivz6hOwnH/HbPO4vWcpk5e4B9Vwc18uu2X7S4cWCC2KKmxIn2i1Bo5ov3bTkiWAW+J
	FM1OV0eGWonjyv/zt7+Ks/C+0wrM6RMNWscUPd1sNg1NscjY1/6LRuXQIwHi969c2CCh
	lxRoXbYi9jdwHBqPM+47MbMMu2EkgDviptflOYiu2UDt+2J9ReABeJEyEEdLaxR2Jtcl
	y5dw==
X-Gm-Message-State: ANhLgQ017Knw7uus2hpOI4BwE7DswpshaUB9ScUhzoQDciwKUtI8IZ+a
	/tL+MFp0gdec0Cr+lW1CIWESgurX
X-Google-Smtp-Source: ADFU+vu8b5J38zjllcnSjCEKBOb3aLXMwEqSSx4/DBFFFmhV0pwNzGTIUvz3P60kt4KprK3X0nYsWA==
X-Received: by 2002:a63:2cd6:: with SMTP id s205mr711137pgs.112.1583893584813; 
	Tue, 10 Mar 2020 19:26:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:a4a4:c739:7769:e9ed])
	by smtp.gmail.com with ESMTPSA id
	o11sm1461661pjb.18.2020.03.10.19.26.23
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 19:26:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 10 Mar 2020 19:26:05 -0700
Message-Id: <a01bf79a35c908d6b072b984608114860b5c1e8f.1583893499.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583893499.git.akuster808@gmail.com>
References: <cover.1583893499.git.akuster808@gmail.com>
Subject: [zeus 04/16] dummy-sdk-package: Add DUMMYPROVIDES_PACKAGES
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
X-List-Received-Date: Wed, 11 Mar 2020 02:26:24 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're about to need to use this variable in the main include file so
restructure the users of it to all set it appropriately.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4a247e7c961286cbed73b6dc0f4074ecf856402a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/meta/dummy-sdk-package.inc              | 3 +++
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 5 ++++-
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb    | 5 ++++-
 meta/recipes-core/meta/target-sdk-provides-dummy.bb       | 1 -
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index 4d653706b1..0d15a37c35 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -17,6 +17,9 @@ ALLOW_EMPTY_${PN} = "1"
 
 PR[vardeps] += "DUMMYPROVIDES"
 
+DUMMYPROVIDES_PACKAGES ??= ""
+DUMMYPROVIDES += "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"
+
 python populate_packages_prepend() {
     p = d.getVar("PN")
     d.appendVar("RPROVIDES_%s" % p, "${DUMMYPROVIDES}")
diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index 6a8748acdf..5bc11b9daf 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -1,6 +1,6 @@
 DUMMYARCH = "buildtools-dummy-${SDKPKGSUFFIX}"
 
-DUMMYPROVIDES = "\
+DUMMYPROVIDES_PACKAGES = "\
     nativesdk-perl \
     nativesdk-libxml-parser-perl \
     nativesdk-perl-module-bytes \
@@ -21,6 +21,9 @@ DUMMYPROVIDES = "\
     nativesdk-perl-module-posix \
     nativesdk-perl-module-thread-queue \
     nativesdk-perl-module-threads \
+"
+
+DUMMYPROVIDES = "\
     /usr/bin/perl \
     "
 
diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index b891efa5ef..29f4dd3633 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -1,10 +1,13 @@
 DUMMYARCH = "sdk-provides-dummy-${SDKPKGSUFFIX}"
 
+DUMMYPROVIDES_PACKAGES = "\
+    pkgconfig \
+"
+
 # Add /bin/sh?
 DUMMYPROVIDES = "\
     /bin/bash \
     /usr/bin/env \
-    pkgconfig \
     libGL.so()(64bit) \
     libGL.so \
 "
diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 87b8bfab9c..e3beeb796c 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -48,7 +48,6 @@ DUMMYPROVIDES_PACKAGES = "\
 "
 
 DUMMYPROVIDES = "\
-    ${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split()])} \
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
-- 
2.17.1


