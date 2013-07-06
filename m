Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id EA04361642
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 08:39:22 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id d10so1887974eaj.27
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 01:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=MoH2hLM8DpWrfD23faWhx0/uzNhrylqssm/YymYr+f8=;
	b=cZ/fKgNibvgZPcq+GKL4YrYd+/GFeOlsH/SeNgj+nb9wXGnCupvMDGFMxl7oqrrDPe
	eyelwfW+kZvJez+PL2ahmFK/IuFX36jnZk+niYQHltD4A+GdA4wQmrIgN+ZAQdFG9dNL
	vePqqy4pNCePepdIaZllctGUBkadKV8jnrpOodVXy1bV2ErFhqOVfzEiqpDnLJsKLhk0
	aTCycRS/eeqqTamXpEld292OJRYKI/qR02g+z6LyRWEQXmGExbB2u7lV1cfEXaP9F8YE
	IrpjcKfHM++ionkxQgJK7R1C8J3jFAkeC4fWPxQGkgXEX5KFgBUbRWt3dugZTlhfqFZQ
	Tepw==
X-Received: by 10.14.175.5 with SMTP id y5mr16142448eel.21.1373099963098;
	Sat, 06 Jul 2013 01:39:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm21347750eeh.15.2013.07.06.01.39.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 01:39:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Jul 2013 10:39:22 +0200
Message-Id: <1373099962-19854-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1373099962-19854-1-git-send-email-Martin.Jansa@gmail.com>
References: <20130705224311.GA3288@jama>
	<1373099962-19854-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2 2/2] subversion: explicitly disable sasl
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
X-List-Received-Date: Sat, 06 Jul 2013 08:39:23 -0000

* cyrus-sasl is in meta-networking and isn't in subversion DEPENDS

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/subversion/subversion_1.6.15.bb | 1 +
 meta/recipes-devtools/subversion/subversion_1.7.10.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
index 244d7ea..2a072e8 100644
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
@@ -24,6 +24,7 @@ EXTRA_OECONF = " \
                 --without-berkeley-db --without-apxs --without-apache \
                 --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
                 --with-apr-util=${STAGING_BINDIR_CROSS} \
+                --without-sasl \
                 ac_cv_path_RUBY=none"
 
 inherit autotools
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.10.bb b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
index 9d189fe..ded1788 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.10.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
@@ -22,6 +22,7 @@ EXTRA_OECONF = " \
                 --without-berkeley-db --without-apxs \
                 --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
                 --with-apr-util=${STAGING_BINDIR_CROSS} \
+                --without-sasl \
                 ac_cv_path_RUBY=none"
 
 inherit autotools
-- 
1.8.2.1


