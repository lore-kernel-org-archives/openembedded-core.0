Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7E039617A2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 18:30:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QYfB1QvNz3K
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 19:30:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582482626;
	bh=OoF+1kqF+cU7yYQDs6lVP9sgV348rKTXmfkEdtyM9oI=;
	h=From:To:Subject:Date:From;
	b=OpFATZlVciJbc4q3lrHFNFJzDJGawSduNGwoGSD6iBuEMicubloiZdKgojYitXCWB
	flLZziaSAEEXCrq40oHN07FeIYWRrXG/Jnsvdd1r9iV3Pab0+Z8M3KkPEzNbP398XX
	EciPoy7iRkf9igdHwfvdWWOn3XLQtHWWV4qNF+rxooJHzyTLSfx13Zeiony2FvlD5Y
	O/CdmD8nJ8yuJVkw1nOIR6D+FVwJei9FLSjQH76an0Ta8eKhm5LcVg1FsowpifdPAc
	wj4p5gOgNoTOuh9WnLFzLyi0QBgDdfZx7V3Wip7EokpJgDFO/edY0EVdAKshs3ezft
	EfVt47D0VoV9nZfqv8fpIW07mn0yKODKc7DHchjxOL0Tj8K5n7qlp2KqJtYifWfYfv
	jQlz3Jfg5FrOr7HxrF+ytqy6lVp+WJDXpkHPw5IYO/Dx4m2McLXfoOOwbBotKqjhTK
	OFIddiBq6Cxs40bhRsiQi8tx5x6wKcSbAnVb5L7xomg4lx+T6wn09pEpDZ/ow7QpEe
	BilzfwBkpCNwPAE8NI35sbKuz/vkRlIjr8iB9fXgKa9x7LoV10gVIjHKgxqJXAX5Qa
	KozfaVQv1nhflsp+aaGPeoYm6GnBYYqHD1yeEfqowabtXhMLUTbq7HDnaEmZMX0aQ8
	2WGfohZ2aF3y2bs+tSch225o=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 20:30:25 +0200
Message-Id: <20200223183025.6310-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Revert "psmisc: Fix dependency for USE_NLS=no"
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
X-List-Received-Date: Sun, 23 Feb 2020 18:30:25 -0000

This reverts commit 52971eeaaf0adcf859ab04853e9ab2e551e4998f.

The original problem was later fix by
  psmisc: revert to default autopoint exclusion

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-extended/psmisc/psmisc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index a75b04702c..6ab1288152 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -7,7 +7,7 @@ command sends a specified signal (SIGTERM if nothing is specified) to \
 processes identified by name.  The fuser command identifies the PIDs \
 of processes that are using specified files or filesystems."
 SECTION = "base"
-DEPENDS = "ncurses virtual/libintl gettext-native"
+DEPENDS = "ncurses virtual/libintl"
 LICENSE = "GPLv2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz"
-- 
2.17.1


