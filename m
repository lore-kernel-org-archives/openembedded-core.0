Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id F42306E630
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 05:29:48 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so10939396wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 22:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sqvnG6yqCxXP9YBEoW9yPDFGTxcSetCApdwJxWRHj3g=;
	b=fEgOe65WUnEqFHVwsCS1RA0PTTosvTe5/m4CJU+U86ityV+JIG3afmLAbaK9yhDTwM
	CMVeiPRrMu6Ty3fCXIy0un/dk8i8hBBpGlaNpHXqJ2frt5otjvVHXc/ZonvDMZ4YzLR0
	YADtG3sWTpaZrtSDsmXurgs82OVotxgcb3TF1UTXaT5nH0ikTM00D0IwjWkoBVNQj33y
	mFYdguF1q+9iQs16PUBOgjWz9aQw1usqCDQ8Z5168vuWeoJaX6bCthTeSa1T5y/6WR4d
	w63r7h9Gcs1e6kCrnAKgU7Bkmwi2lW+VGhmMzqqRYd3pau1GFwsgiV4UURVyU46lbYsB
	YuKg==
X-Received: by 10.194.10.165 with SMTP id j5mr38018789wjb.147.1442294988452;
	Mon, 14 Sep 2015 22:29:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	p8sm18976281wjr.39.2015.09.14.22.29.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Sep 2015 22:29:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 07:29:51 +0200
Message-Id: <1442294991-12427-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <20150910160557.GD2387@jama>
References: <20150910160557.GD2387@jama>
Subject: [PATCH][master][fido][dizzy] Revert "perf: fix for rebuilding"
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
X-List-Received-Date: Tue, 15 Sep 2015 05:29:51 -0000

* This reverts commit 9dafa571ed0a40d21a886dec7704c31150b21942.

* The "fix" is causing more issues then it's fixing and there was no
  feedback in many months.
* More info:
  http://lists.openembedded.org/pipermail/openembedded-core/2015-June/105684.html
  http://lists.openembedded.org/pipermail/openembedded-core/2015-September/109870.html
  http://lists.openembedded.org/pipermail/openembedded-core/2015-September/110338.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index adb3a2c..f1d7894 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -118,10 +118,6 @@ do_install() {
 }
 
 do_configure_prepend () {
-    # Fix for rebuilding
-    rm -rf ${B}/
-    mkdir ${B}/
-
     # If building a multlib based perf, the incorrect library path will be
     # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a 32 bit
     # build, with a 64 bit multilib, the arch won't match and the detection of a 
-- 
2.5.1


