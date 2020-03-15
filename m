Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id B037461B97
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 18:12:04 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id ay11so6844000plb.0
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 11:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KMwVBxynH9VeQWhEfML4UHFHi5mU9pwL/+TB69t4RaQ=;
	b=Pi3NTG0z7cYdp1lGRM6UYWJM7G/HRGqvex679SLdCtaP7Q6qdgv9Myd5BLOdEGUSr6
	yq8d+Yfkn3Q0bC0C5BZuGfJxRkFDFvoEckhEb9lxNarENSU7zW3YPGBrcpka/rah7k4W
	5ejP4fl6WSBXsZSoIcumz73WZ4d5f+PUo8myqLvU75Gc8fyCiVKziv50WoOYp70Zp60y
	Pne56gYmkxTIlL9a9V6vmMZxt08LCEspuHnzyLhJNRBMsbEF85r/i3c6xfoy+Wg8Ewle
	xYEZ6kFeGzEAyObUbJDT7xC71qJJgWJyUQ9c0WVkXKHa3wGqd3DMuNV2ByZ9KYh2pjJX
	AN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KMwVBxynH9VeQWhEfML4UHFHi5mU9pwL/+TB69t4RaQ=;
	b=C6rhZ7ZouOXJyoCTA1ERPj9cOMx7s2H+n/eaOXz76qGr1zAc1QBrPHOJgDPND91i2S
	SxWY4R55A8NMLS3/BFLw1sRWztoGY+MgSUpLvj9Id5Ai3zBMR9xpgXb8Tt2YEbOKha4Q
	mCKgYC9ZOY3r7sd7lq7ZfV9eZvlYrhkDfyiidCM6vHSHQ6JGBRNJqYGZRSgZhlwlWTLB
	AmS53hYayWDC+LA/DMio5uKiNnA8habMdgIKcYKtjry4W/SYHIxP5np1GOzlwjaHIJu0
	7AqsHMV1wdxS3mIy3X5Uid/MhDTOwMs9aWeAJaREPgVT1hrz6RnHhbmGfNPrZdy7MKsF
	JWmQ==
X-Gm-Message-State: ANhLgQ0+0+zvlnOhBxb8ATgSQegpAYX1x6210TJAiEunQ6N4eyEf4dzJ
	CHtGrWzVyiUcnt2blQLlJkepiWZT
X-Google-Smtp-Source: ADFU+vu4AK8ZTqE7N9cJUsePkKIhSLFx0y++5p66ax1b4apORe1qqNh1GhRr7Ff/BMrsF1U+SizcEQ==
X-Received: by 2002:a17:90b:1954:: with SMTP id
	nk20mr21377643pjb.69.1584295925576; 
	Sun, 15 Mar 2020 11:12:05 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	n5sm12223816pfq.35.2020.03.15.11.12.04
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 11:12:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 15 Mar 2020 11:11:46 -0700
Message-Id: <a01bf79a35c908d6b072b984608114860b5c1e8f.1584295805.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584295805.git.akuster808@gmail.com>
References: <cover.1584295805.git.akuster808@gmail.com>
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
X-List-Received-Date: Sun, 15 Mar 2020 18:12:04 -0000

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


