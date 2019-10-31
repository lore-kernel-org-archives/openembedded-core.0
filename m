Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5AA497F8BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:57:37 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p21so5435838wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 03:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BKOG+snQWXYHHj12B/vL3V8QaERjAYzn7SxyWb+BAcg=;
	b=J6M+CYfwvN3EF0gwEylyk6Jez8kdchdaVt8eWqtjUkLwFYipXkeig6MhtQQKARO6Tb
	nQXzk7jO35BDuBNYNhmsdO0GUH7pTrkLwz9EYy39S8XHoP9Je50nfbOTmaaLSQWkhOop
	17AwYlIo3vhVswTwRzKMk/PtyIxnzkSLyqXQ7yqfZqozQfzzhLAJEJUl5SUXokrODCJQ
	FTugnoic54W0YD1+qyN1UhXMeIyyBn9iAEm/9uRGEkY32YpUseODBGnPWreb3i4gLVJP
	UOlekQYO+1CB3cCBnaORpwhOfd2VhVfZPQbaWunO9qip6RIoFtx+QQWTSq0nv1NUr5HG
	BrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BKOG+snQWXYHHj12B/vL3V8QaERjAYzn7SxyWb+BAcg=;
	b=Dsg+vQp0ziKmQAKP3g+0vDvxUNJR3jp26z/c/AFbQvkjdeVDRU13baX+cuUUQ+1tf3
	v9lZsUzEcf8tAq03SsgftCdW8/tX+xWyJ5qeG0kxGcExBz/asB3HjpA9IzRheptGs/h2
	BfPBpcFiBB8B2+jIXCt4RUufi4vL3OEGilT3LoUles9VtzNRSA/Pj6KTZrg3x8r4eMbF
	X3aZfeJoPTovMLH7pashOwjx/ApRrqL9ny3u34SFpJ2OT2QPHv9u0qpTJnzGajD56VmK
	qCs9gN7a/7IKNidFu/2uZx0rLQShihrZGrQt+UuIvqXX8xOapZMO/bNy45i/ZqXALG+F
	oaDA==
X-Gm-Message-State: APjAAAUfqjXx2Ji22Y9ZBdatGhzXRBM82aDgaI9jRoKPnvw93hQ+2D4c
	xlT2TiyPPc93eoLhBnfGG5UJ6xknvlg=
X-Google-Smtp-Source: APXvYqztFVvslVLBWzoBCfK6ofwsnWYS7HjnksOyJ1HakyzzBp9OqRoeEzBws1JAA0Rn/8PENGFVrw==
X-Received: by 2002:a1c:b1c3:: with SMTP id a186mr4609991wmf.10.1572519457896; 
	Thu, 31 Oct 2019 03:57:37 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f13sm3192113wrq.96.2019.10.31.03.57.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 03:57:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 10:57:34 +0000
Message-Id: <20191031105735.8141-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] git: some tools are no longer perl, so move to main recipe
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
X-List-Received-Date: Thu, 31 Oct 2019 10:57:37 -0000
Content-Transfer-Encoding: 8bit

Some tools are not written in Perl anymore, so they should be in PN no PN-perltools.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/git/git.inc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 6e137432f0a..67fc96b7aff 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -94,19 +94,15 @@ do_install_append_class-nativesdk() {
 FILES_${PN} += "${datadir}/git-core ${libexecdir}/git-core/"
 
 PERLTOOLS = " \
+    ${bindir}/git-cvsserver \
     ${libexecdir}/git-core/git-add--interactive \
     ${libexecdir}/git-core/git-archimport \
     ${libexecdir}/git-core/git-cvsexportcommit \
     ${libexecdir}/git-core/git-cvsimport \
     ${libexecdir}/git-core/git-cvsserver \
-    ${bindir}/git-cvsserver \
-    ${libexecdir}/git-core/git-difftool \
     ${libexecdir}/git-core/git-send-email \
     ${libexecdir}/git-core/git-svn \
     ${libexecdir}/git-core/git-instaweb \
-    ${libexecdir}/git-core/git-submodule \
-    ${libexecdir}/git-core/git-am \
-    ${libexecdir}/git-core/git-request-pull \
     ${datadir}/gitweb/gitweb.cgi \
     ${datadir}/git-core/templates/hooks/prepare-commit-msg.sample \
     ${datadir}/git-core/templates/hooks/pre-rebase.sample \
-- 
2.20.1


