Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD1E76312
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 08:11:34 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so13908488wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=YFnX5up5nQ6ThSEnlXrl09qDWRYnrLea6CbNqAKMYJw=;
	b=in09CfEPGXEE8QwEoc+uaxKh4PYAqh0wYUMlHACwPY/I0MAogBevX6gPkZ9z6C3T7N
	JArAFFayQCFRtK+DHffnmH9Qx4Vfq4bj5RkYBmpDlw5jdPvlbWhIqySN0fMl5p5uPaJV
	E0CnML0TSlvM7PDaln/v+5TfHDTbnjQskQPNdNbclcZ+eZLhD+h9i5uchKkmNi8S/8Ix
	ZxRpA3OuAsz1pel/EzDVNZ0ak3o7ccKYY8/Tg65Gnqq1mNt1V7Evf47uYFLa+/aygAg2
	jz9fMMnm7DzmdI0rfcSwtDvFDevJog9cX1C4zvFcDau57AHDenwc2Oifth6Pd05bkbF+
	i8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YFnX5up5nQ6ThSEnlXrl09qDWRYnrLea6CbNqAKMYJw=;
	b=NOIR9lqCQ31yBRf1pgBM41dZmUBJx/mAtV2eNKWZ4GB5aEc4ewZNAjQ3KUy041nKCQ
	jsiv9u3zWtTtm1Q5LDphKgxCFQF8+jSPA22ozxcRt2VelWjW4PGNmR6d+rBYfFerPWJV
	vrqFbv3uEkaTH++Cl84pWcqZUVrm1PoV8mpHPByhEgArlITbEvFOk+FbfynAhEeEszzW
	Fvj7robk43tuWnIFShlYGt0hl/fJMtJTx4nnV6rujmZ38RflSDzxbvxke4E+j0m0l3os
	yE09/+JWSWY4+56f3pEhHgUVQPuq+XdYyJ1YHA5TliyAbubPq02Y5TJth75h4Ge9aepb
	5Ovw==
X-Gm-Message-State: AEkoouv/vf82rYuJ1vF4atSrPYek5dCVycTkio+HQuB2NV48L7dkvuvSLMsmGkq3eG+04Q==
X-Received: by 10.46.9.216 with SMTP id 207mr24162619ljj.62.1470643894679;
	Mon, 08 Aug 2016 01:11:34 -0700 (PDT)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	g42sm5550176lji.40.2016.08.08.01.11.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Aug 2016 01:11:34 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 10:11:24 +0200
Message-Id: <917684eb0fc505f6b575ac815188baa7f685cdaf.1470643735.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] ca-certificates: remove -- separator
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
X-List-Received-Date: Mon, 08 Aug 2016 08:11:36 -0000

Options and directory separator -- slipped past the patch removing
Debianims, thus resulting in failures on hosts running Fedora.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 .../0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
index 4b4b287d4e6ce92fc38e4e19fbf87b152236c0e2..4a8ae5f4b5ef235d9bdfa7b947bbe2f0e415b50e 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
@@ -6,9 +6,13 @@ This solves errors such as
 
 | Running hooks in [...]/rootfs/etc/ca-certificates/update.d...
 | [...]/usr/sbin/update-ca-certificates: line 194: Not: command not found
+| [...]/usr/sbin/update-ca-certificates: line 230: Not a directory: --: command not found
+| E: Not a directory: -- exited with code 127.
+
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
 ---
  sbin/update-ca-certificates | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
@@ -24,7 +28,7 @@ Index: git/sbin/update-ca-certificates
 -  VERBOSE_ARG=
 -  [ "$verbose" = 0 ] || VERBOSE_ARG="--verbose"
 -  eval run-parts "$VERBOSE_ARG" --test -- "$HOOKSDIR" | while read hook
-+  eval run-parts --test -- "$HOOKSDIR" | while read hook
++  eval run-parts --test "$HOOKSDIR" | while read hook
    do
      ( cat "$ADDED"
        cat "$REMOVED" ) | "$hook" || echo "E: $hook exited with code $?."
-- 
2.5.0


