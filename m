Return-Path: <george.mccollister@gmail.com>
Received: from mail-ig0-f193.google.com (mail-ig0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id BD8F5731E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 20:58:42 +0000 (UTC)
Received: by mail-ig0-f193.google.com with SMTP id h5so6482466igh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gPboiCax9GOQYpcN0w4gVXd/k1uXUolxhfFmM7zdU4k=;
	b=jFI92USRExh490qYrFntI+TQ3zz3131YZbvSry7j+9tIWwRzkXyhHtdvG6cEU73gZ9
	CH4DlXuInmT8y7cilwhvC2exPB0Xl5+lMpzATpF8BqowQameIcCZyR0YhfMpsaV+lZOl
	T8yluogcuu76KXqum+Q9WBa3cyiWL140t9+xaJaFTus7CDY0PPWNdVKHpS1YGgHcd9VZ
	PgYAi6ps6RBSg9RgOs8CDwpjXvj4ETFNS323mrdeKUp7Me5WNQ18Gz4Nbl36aMjNHAIH
	Tn5tpK6AO3BYEL9csWJY29a+aBHSI7f8OK6PGLXOsFI6M+FDt7+fFNxtOeffa11pOT9u
	lRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gPboiCax9GOQYpcN0w4gVXd/k1uXUolxhfFmM7zdU4k=;
	b=Y1RD7cS1TEC3CrdeNE8MJsQZdV6eBguzNyctMLpf/3QBarWdvkONq5Ix2csB2zrVM1
	EwdrRApqLlHnBrSxmp9citffZiYlk5AHzzrJbrAn7E9mdgLEvEajyKooEz/nBC2JmpuB
	n+J320RVuxqgv/HJQDt7I3htMPPivxBrB/PFsqWunKTcTVkKFXwJVosvamp/7qMw+68t
	xlntEH5fJM42/BO/X7geErNaWHAJ3NuAmfk/95xF0mQIlQWL65NmcBvjzb39VALCuxsz
	vuRP28awIQt1BYnfDu3la+JJyBimmlexG8jU6yw/Az0L56KGl2E+JjY3baudyg9kNOC6
	bsuA==
X-Gm-Message-State: ALoCoQmyivD9AZ0tGJRJ3vHZtXcKJBqUlEUj5rukZlkNa1V2RqQ8pv9PnFrJ12m2MFQL6l7+z9VtOjxDd1orEAJFdZI2NI1Ubw==
X-Received: by 10.50.61.209 with SMTP id s17mr31251826igr.40.1452805123176;
	Thu, 14 Jan 2016 12:58:43 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	204sm3203278iob.44.2016.01.14.12.58.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jan 2016 12:58:42 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:56:35 -0600
Message-Id: <1452804997-20926-8-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
References: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
Subject: [RFC][PATCH 7/9] git: use bash-completion.bbclass
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
X-List-Received-Date: Thu, 14 Jan 2016 20:58:42 -0000

Use bash-completion.bbclass to package bash completions.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/recipes-devtools/git/git.inc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index d9770e6..c19e0d4 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -17,7 +17,7 @@ EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
 		--without-tcltk \
 "
 
-inherit autotools-brokensep perlnative
+inherit autotools-brokensep perlnative bash-completion
 
 EXTRA_OEMAKE = "NO_PYTHON=1 CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
 EXTRA_OEMAKE += "'PERL_PATH=/usr/bin/env perl'"
@@ -96,10 +96,6 @@ PERLTOOLS = " \
     ${datadir}/git-core/templates/hooks/pre-rebase.sample \
 "
 
-# Basic tab completion support
-PACKAGES =+ "${PN}-bash-completion"
-FILES_${PN}-bash-completion = "${datadir}/bash-completion/completions/*"
-
 # Git tools requiring perl
 PACKAGES =+ "${PN}-perltools"
 FILES_${PN}-perltools += " \
-- 
2.4.5


