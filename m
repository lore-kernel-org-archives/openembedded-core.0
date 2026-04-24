Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3D1FF8843
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:01 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31975.1777064214460526693
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YUTqgDSy;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4891f625344so70029125e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064213; x=1777669013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DofcECmFw24VOklyYm97DOu/2rdzDm0DeI5TPdy+O9w=;
        b=YUTqgDSyWQlPsiLuxUct6MILD+Du/0kK3MKjkAQWO9Kw9/Jhq5TZERs1eqLtXTqqmA
         GgFllNSFLxWg+RsTuvtV3qz1vfzR7G4zxgbRRlkcCZWtvJFoea0qZYoJ4KqE7LX2xg1W
         mcmJzfRkCng+FkTozDGe0l8BbOZOBh3ya2e9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064213; x=1777669013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DofcECmFw24VOklyYm97DOu/2rdzDm0DeI5TPdy+O9w=;
        b=BRechFB9mdX5x44ljIvh1eDPCPXFqWF6LLmyoaokAI7FXTgshc8kwg9/5gJNyQiUDN
         8RyI7lRnr0AfCqVI+/Y+6XM34dib2Y1ON2eM20C3Q2duoneXhIxY0oLsVXYBAXJjOE07
         nQjxH5BGP5/hf0kq7m8/2+ujjqUubjSvtLysrWDsmh020F9lin1SfnybdRdC+uoFqmz/
         rKFBNhvl8X/PPfvBtsnfHhuJu1g8yKYQJua8/uZIFjS7rOydlFWpscgwpiW0IQ/MnqTi
         JayHNNpe7oZU4ofJdr35FjX4+4cf94ZlNFOiwGIlY/p9MhMRX8zm+COx1PcFmv56Awfb
         nn9g==
X-Gm-Message-State: AOJu0YxXj9avAtNTUTQX9RsCffX3i8S9qJTx2Pkag+DnJHSm6Ywrz8t1
	jO0OuPbXiEc0IMZzGycBLRRCiuGkt9/4lStFOhg+HmIp9qCWhZxgH1xTLYBqtz51s7Kn6TgDm/Z
	QjnCYqYWGLrpd
X-Gm-Gg: AeBDiesqBHHtv4OpvclXcHzGcau4GwawlqVMMGjwXzxu22lljMGalwP3RsDHUd8hJD5
	tbLO6WWtnlY6BW04XA7TKtfRhz6cjbvmfggx5u0uOIcEh7QRdfgwqdSwdmmcJg1guIivwR1Xpwd
	yQFSDR+B/w4Y5xaOYl88Hb5NtYvy85qpSoJU/x9J1DggOHHdeEnafLlGT3HRVl9zKPzWoFb2nAo
	x7s7IIklwnIj9F7ex6JW1+ozxjvZBtQoyD4kaqIiRw6VvbqwfM8Z53aGvfqT16BEH0lN6qh7M7V
	x7V0u81TIJq1mL6GEtlKtjSWXXB9UmGCvfoheKOqh3nyRs3gP/FMk7lJ1Qqman/hyCFpEiplTqt
	EonbT9UUnUxKs49fH1JNtVHIkmn1VbqGCPpx8Bn9evHhHuXWvOCaJPcsx82lWKCzLg7TMGeURD8
	4vVgJBRluJE2XZQk9hSxJHRSPfaTQBfT8INDhQf3VVp4E4wyRb69WIAu1QBGjtRQb+GOu/PFVFK
	XQd44+qYtdH2OofvGYrN6bJtp1bq8SVWu54yFilqiQRoict
X-Received: by 2002:a05:600c:1d05:b0:489:1baf:8c03 with SMTP id 5b1f17b1804b1-4891baf8d2cmr320510345e9.11.1777064212548;
        Fri, 24 Apr 2026 13:56:52 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 27/66] base-passwd: upgrade 3.6.3 -> 3.6.8
Date: Fri, 24 Apr 2026 22:55:26 +0200
Message-ID: <9b90dbf36fe8fb766f30e3f6c96d5c286b58e6d0.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235900

From: Daniel Turull <daniel.turull@ericsson.com>

Changelog for base-passwd: 3.6.3 -> 3.6.8
============================================================

base-passwd (3.6.8) unstable; urgency=medium

  * Debconf translations:
    - Turkish (thanks, Nuri KÜÇÜKLER; closes: #1102464).
  * update-passwd(8) translations:
    - French (thanks, Baptiste Jammet; closes: #1119914).

 -- Colin Watson <cjwatson@debian.org>  Mon, 03 Nov 2025 11:03:53 +0000

base-passwd (3.6.7) unstable; urgency=medium

  [ Marc Haber ]
  * Add myself to Uploaders.

  [ Colin Watson ]
  * Debconf translations:
    - Catalan (thanks, Carles Pina i Estany; closes: #1101110).

 -- Colin Watson <cjwatson@debian.org>  Sun, 23 Mar 2025 15:30:08 +0000

base-passwd (3.6.6) unstable; urgency=medium

  * Move to team maintenance under pkg-shadow-devel.

 -- Colin Watson <cjwatson@debian.org>  Sun, 29 Dec 2024 13:43:54 +0000

base-passwd (3.6.5) unstable; urgency=medium

  [ Colin Watson ]
  * Apply X-Style: black.
  * Add Romanian translation of update-passwd(8) (thanks, Remus-Gabriel
    Chelu; closes: #1055383).

  [ Maks Mishin ]
  * Fix potential descriptor leaks.

 -- Colin Watson <cjwatson@debian.org>  Mon, 21 Oct 2024 18:26:50 +0100

base-passwd (3.6.4) unstable; urgency=medium

  [ Chris Hofstaedtler ]
  * Ensure that /etc/subuid and /etc/subgid exist (closes: #1074121).

 -- Colin Watson <cjwatson@debian.org>  Mon, 01 Jul 2024 12:20:04 +0100

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0001-Add-a-shutdown-group.patch            |  6 +++---
 .../0001-base-passwd-Add-the-sgx-group.patch   |  4 ++--
 ...instead-of-bin-bash-for-the-root-user.patch |  4 ++--
 ...ot-since-we-do-not-have-an-etc-shadow.patch |  4 ++--
 ...input-group-for-the-dev-input-devices.patch |  4 ++--
 .../base-passwd/0005-Add-kvm-group.patch       |  6 +++---
 .../base-passwd/0007-Add-wheel-group.patch     | 18 +++++++++++++-----
 ...se-passwd_3.6.3.bb => base-passwd_3.6.8.bb} |  2 +-
 8 files changed, 28 insertions(+), 20 deletions(-)
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.3.bb => base-passwd_3.6.8.bb} (98%)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
index e50efc9623f..f0e1539ca7f 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.patch
@@ -1,4 +1,4 @@
-From 8f3ace87df3aaad85946c22cae240532ea3e73b8 Mon Sep 17 00:00:00 2001
+From 6f714635792a14fd3ee8d2ce0318c0185add5c00 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Fri, 29 Apr 2022 13:32:27 +0000
 Subject: [PATCH] Add a shutdown group
@@ -14,10 +14,10 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/group.master b/group.master
-index ad1dd2d..1b5e2fb 100644
+index 3e7bf1c..72108a8 100644
 --- a/group.master
 +++ b/group.master
-@@ -35,5 +35,6 @@ sasl:*:45:
+@@ -34,5 +34,6 @@ sasl:*:45:
  plugdev:*:46:
  staff:*:50:
  games:*:60:
diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
index e1340e1b70c..d50136b24e1 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
@@ -1,4 +1,4 @@
-From 9e57771d138ac423d5139b984b8c869122ce4976 Mon Sep 17 00:00:00 2001
+From ff622d69e9c06c00dacdffc163a383f8d2903475 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alexk@zuma.ai>
 Date: Fri, 28 Jul 2023 10:28:57 +0100
 Subject: [PATCH] base-passwd: Add the sgx group
@@ -17,7 +17,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/group.master b/group.master
-index d34d2b832d43..e54fd1d2c6dc 100644
+index d34d2b8..e54fd1d 100644
 --- a/group.master
 +++ b/group.master
 @@ -34,6 +34,7 @@ video:*:44:
diff --git a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
index 09f8cfea9c6..0fa6b8138d0 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
@@ -1,4 +1,4 @@
-From 4411fc0df77566d52bee11ec0bad4be30a96e99e Mon Sep 17 00:00:00 2001
+From c30862c6892d17ae2f4578101dcb050250956cec Mon Sep 17 00:00:00 2001
 From: Scott Garman <scott.a.garman@intel.com>
 Date: Fri, 29 Apr 2022 13:32:27 +0000
 Subject: [PATCH] Use /bin/sh instead of /bin/bash for the root user
@@ -12,7 +12,7 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/passwd.master b/passwd.master
-index 7cd4e24..041685a 100644
+index 90514a5..bd3efc2 100644
 --- a/passwd.master
 +++ b/passwd.master
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
index 06222ab04ce..4be487cc3f5 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
@@ -1,4 +1,4 @@
-From 13a1a284a134d18a454625a5b4485c0d99079ae9 Mon Sep 17 00:00:00 2001
+From 0d35229f01e3a38a27338320e67c4cb5652a3249 Mon Sep 17 00:00:00 2001
 From: Scott Garman <scott.a.garman@intel.com>
 Date: Fri, 29 Apr 2022 13:32:28 +0000
 Subject: [PATCH] Remove "*" for root since we do not have an /etc/shadow
@@ -10,7 +10,7 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/passwd.master b/passwd.master
-index 041685a..31a84d4 100644
+index bd3efc2..66e9033 100644
 --- a/passwd.master
 +++ b/passwd.master
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch b/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
index 394a0f01d32..a3502c3d861 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for-the-dev-input-devices.patch
@@ -1,4 +1,4 @@
-From c5f012750f8102ff54af73ccc2d2b7bfa1f26db4 Mon Sep 17 00:00:00 2001
+From d2cdd4c8d7332d05ac86fb0625e8c2b3c7bf7728 Mon Sep 17 00:00:00 2001
 From: Darren Hart <dvhart@linux.intel.com>
 Date: Fri, 29 Apr 2022 13:32:28 +0000
 Subject: [PATCH] Add an input group for the /dev/input/* devices
@@ -10,7 +10,7 @@ Signed-off-by: Darren Hart <dvhart@linux.intel.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/group.master b/group.master
-index 1b5e2fb..cea9d60 100644
+index 72108a8..7d794b2 100644
 --- a/group.master
 +++ b/group.master
 @@ -12,6 +12,7 @@ uucp:*:10:
diff --git a/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
index 72e6ee333c9..4f8278e5cd1 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
@@ -1,4 +1,4 @@
-From 6cf19461fb31d7a7a3010629aae9aab49c26a01b Mon Sep 17 00:00:00 2001
+From 07af34abb10b1455e065cfb1ce7ce766614da7e8 Mon Sep 17 00:00:00 2001
 From: Jacob Kroon <jacob.kroon@gmail.com>
 Date: Wed, 30 Jan 2019 04:53:48 +0000
 Subject: [PATCH] Add kvm group
@@ -10,10 +10,10 @@ Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/group.master b/group.master
-index cea9d60..5b62284 100644
+index 7d794b2..7fdd8bf 100644
 --- a/group.master
 +++ b/group.master
-@@ -34,6 +34,7 @@ utmp:*:43:
+@@ -33,6 +33,7 @@ utmp:*:43:
  video:*:44:
  sasl:*:45:
  plugdev:*:46:
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
index d77122789d5..91bbb453e32 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
@@ -1,3 +1,7 @@
+From 3c88afb923de603d126f89f2979b2cd232a180c8 Mon Sep 17 00:00:00 2001
+From: Louis Rannou <lrannou@baylibre.com>
+Date: Thu, 15 Jun 2023 13:43:55 +0200
+Subject: [PATCH] base-passwd: add the wheel group
 
 We need to have a wheel group which has some system privileges to consult the
 systemd journal or manage printers with cups.
@@ -7,11 +11,15 @@ Upstream says the group does not exist by default.
 Upstream-Status: Inappropriate [enable feature]
 
 Signed-off-by: Louis Rannou <lrannou@baylibre.com>
-Index: base-passwd-3.5.26/group.master
-===================================================================
---- base-passwd-3.5.29.orig/group.master
-+++ base-passwd-3.5.29/group.master
-@@ -38,5 +38,6 @@
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index 7fdd8bf..d34d2b8 100644
+--- a/group.master
++++ b/group.master
+@@ -37,5 +37,6 @@ kvm:*:47:
  staff:*:50:
  games:*:60:
  shutdown:*:70:
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb
similarity index 98%
rename from meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.8.bb
index bf50b01fd5a..a072791dcf1 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
-SRC_URI[sha256sum] = "83575327d8318a419caf2d543341215c046044073d1afec2acc0ac4d8095ff39"
+SRC_URI[sha256sum] = "fab3d0e6e8b641e116bda9bd5f7a7ed24482384c1513f6a369b506327fbc8dde"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated

