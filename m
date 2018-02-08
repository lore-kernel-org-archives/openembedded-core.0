Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id E6E317842F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Feb 2018 16:55:23 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id o1so1806475pgn.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Feb 2018 08:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=sCw2Z1lv35thaQdlpK9WqEBEQq+1MP45UVzi56Xjd9k=;
	b=fF9FeQbBkbM2hyJaBEUNIA/Et7Vwbl+tPqV2pPOGsjDaq9VjmR7bIAlyUW+LXi+PcL
	6DUFsH8umB242hNoyRww7SwRC5xc4k8Bva4radCGhUNMMHBpB96295lD674Sd28UpyiP
	ESXYvoauVJu1HbmRIH0NJIq93MpWRiiNxGmG+ZhiWNWgavJ6BeYmYB1H2fdaYqM2uW2a
	FloBxYIz26STvRJNcR1ugCDLLsZlv6Rl0Tfi6HQ66e9QDqdkibtDX3H2IgW3cS2+OeJT
	l/9DJ83/CegoMnMOh4mjnsoW411U1cP4NG+yYnNrLyzFM7dG0TQR53hEcmHSMJInhHBI
	1Aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sCw2Z1lv35thaQdlpK9WqEBEQq+1MP45UVzi56Xjd9k=;
	b=JnCQlhtysynt9TTQkQmwkHjazTb+0Va+JV217dI+a5fBaJWK35VmDjHco9RZJIvQ4H
	WFRz/G1dYzwEykXPv8d1XAr2ugWo9tWGHUtmGNgxz2e/M14BGsUcqbsglQ28g9jxuoc7
	FQB/T/irYVikdYU47hoIOHGpDz56tmdT61+gj6Ww87U/Vj+qZoEjE0ra5CNPcnKVIL07
	1dB2WDM43KsF4uaJKHRWkYOy+m3eDFl7gdjQ1X4Un9Da9B5tltp+eG1CKXwEpnd8KgIf
	SnCsDL/fbKRKg0k0AYT8bny+khi9s6qRsFJKXzhviTV8/iAFLWuFV7kzWw6ei+NNrzP9
	b/ZQ==
X-Gm-Message-State: APf1xPD2c6Vl0D5c5I/qNbD7oEwItCo64RY9cm6kj8FLFR/YqcV3Da2I
	qPvWcFWFgw5VbbR0IoaHYncK0Q==
X-Google-Smtp-Source: AH8x224WHumiMr+xM4zqXkFotZdD4sxIYAp2LaPc6Z6J/GaDIdLqakty5MUofhbjkpG7pFdEnRyg5g==
X-Received: by 10.98.144.213 with SMTP id q82mr1319894pfk.37.1518108924706;
	Thu, 08 Feb 2018 08:55:24 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::5193])
	by smtp.gmail.com with ESMTPSA id
	s67sm2411957pfe.37.2018.02.08.08.55.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Feb 2018 08:55:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Feb 2018 08:55:14 -0800
Message-Id: <20180208165514.33745-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH] puzzles: Fix warnings seen with clang 6.0
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
X-List-Received-Date: Thu, 08 Feb 2018 16:55:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-paranthesis-to-remove-doubt-about-prece.patch | 47 ++++++++++++++++++++++
 meta/recipes-sato/puzzles/puzzles_git.bb           |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-sato/puzzles/files/0001-signpost-Add-paranthesis-to-remove-doubt-about-prece.patch

diff --git a/meta/recipes-sato/puzzles/files/0001-signpost-Add-paranthesis-to-remove-doubt-about-prece.patch b/meta/recipes-sato/puzzles/files/0001-signpost-Add-paranthesis-to-remove-doubt-about-prece.patch
new file mode 100644
index 0000000000..19abdd5f35
--- /dev/null
+++ b/meta/recipes-sato/puzzles/files/0001-signpost-Add-paranthesis-to-remove-doubt-about-prece.patch
@@ -0,0 +1,47 @@
+From 7b2949c48a178861f6568a18c8f45e841e36f89e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 7 Feb 2018 23:57:12 -0800
+Subject: [PATCH] signpost: Add paranthesis to remove doubt about precendence
+
+Clang complains e.g.
+
+error: logical not is only applied to the left hand side of
+      this bitwise operator [-Werror,-Wlogical-not-parentheses]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ signpost.c | 2 +-
+ tracks.c   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/signpost.c b/signpost.c
+index aa2e13a..2e2dff2 100644
+--- a/signpost.c
++++ b/signpost.c
+@@ -284,7 +284,7 @@ static int check_nums(game_state *orig, game_state *copy, int only_immutable)
+     int i, ret = 1;
+     assert(copy->n == orig->n);
+     for (i = 0; i < copy->n; i++) {
+-        if (only_immutable && !copy->flags[i] & FLAG_IMMUTABLE) continue;
++        if (only_immutable && !(copy->flags[i] & FLAG_IMMUTABLE)) continue;
+         assert(copy->nums[i] >= 0);
+         assert(copy->nums[i] <= copy->n);
+         if (copy->nums[i] != orig->nums[i]) {
+diff --git a/tracks.c b/tracks.c
+index 5b27350..ca44ce1 100644
+--- a/tracks.c
++++ b/tracks.c
+@@ -1072,7 +1072,7 @@ static int solve_check_single_sub(game_state *state, int si, int id, int n,
+         x = i%w;
+         y = i/w;
+         if (abs(ox-x) > 1 || abs(oy-y) > 1) {
+-            if (!state->sflags[i] & S_TRACK)
++            if (!(state->sflags[i] & S_TRACK))
+                 did += solve_set_sflag(state, x, y, S_NOTRACK, what);
+         }
+     }
+-- 
+2.16.1
+
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 6574e1dba4..4fe6298cba 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://0001-Use-labs-instead-of-abs.patch \
            file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
            file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
+           file://0001-signpost-Add-paranthesis-to-remove-doubt-about-prece.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 SRCREV = "8dfe5cec31e784e4ece2955ecc8cc35ee7e8fbb3"
-- 
2.16.1


