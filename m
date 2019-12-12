Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 226937FB36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:14:55 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id j42so3743655wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b0VPTrV9hgW+tqS9g2tNfjDX9ARb7PvoNwsX//W3k1g=;
	b=KcC3v9bcCU+w6glnw3SpEFI+bapf0YUL3pxvow0EqNACnni02Or1WqD9iASmgJvsNk
	Dl43Q30T8Bqqk/4QWnZe99kWz3FXZo9sREF6T4FilKpBgySVWvKyIxlVQJbbGNl5lBjQ
	qurnlUrTP5B01KjYq5nGGXyWX8U2GVcexKbDQgh2RSVdG0GqtMAOKrTdAs5fB6XnbKdl
	8ULfyRR0UT8GYnzn00WXVJu6jz1BN0Xi2byiyw94C1VR8fLQa2HJhOHJms0E/BExwhAt
	+34j8reEy0kpZ17+v8b8SVPK4JGBo113gm8PoKANjO9xw9uCX/6dOKe8yaYEfQSQ8/z6
	TAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=b0VPTrV9hgW+tqS9g2tNfjDX9ARb7PvoNwsX//W3k1g=;
	b=nE+hnMtXivtCWuNtZVDxezx7jDJqyArpIz2CyNINT3ajQy57rl3MiWvV+dRYIS/EJ0
	3XX/OdMb4bzwxJ3WY9i4cduKnF2QPqQeP6+hGkBHmKgAlZPcRJySqE4ynpi9Ygybp8p4
	ZrC1BN6bWaZpxwOJ5dS4E87yg5bFweSF1tf/FS7Z5hIpE6MNmxgNFmdH3YoYux9EATx9
	YcoAJBqeXWxf14c8n+fQT2XdiVwu6+sYPUUppxYCoXP5KxfTpdY+/2Xz1Z58X0AJIgjQ
	ZEltfxNr5bGHagGwn5xcLntITF3VZkQppezV/NgZPjGcpMpxtl9OESV5A+YCjOycS8ut
	Wz9g==
X-Gm-Message-State: APjAAAXra0y3evyFht/zV6/Wb5JW7FWUIFjBojz1jtALKDlNlqCmijaI
	E8JL8KuWSVrL9zg6uHCQTLaBfSPL
X-Google-Smtp-Source: APXvYqzJmbXuM3Hkgk2Fu/0EqFEYKvRxVtR1rSYfb4jW2IkZ3xJY7D5raWy+kPtOCf5Slbxf9N3q9Q==
X-Received: by 2002:a5d:6802:: with SMTP id w2mr7618776wru.353.1576174496390; 
	Thu, 12 Dec 2019 10:14:56 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.14.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:14:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:19 +0100
Message-Id: <20191212181436.1322-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
Subject: [PATCH 13/30] puzzles: update to latest revision
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
X-List-Received-Date: Thu, 12 Dec 2019 18:14:56 -0000

Remove 0001-Use-labs-instead-of-abs.patch as problem is fixed upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../files/0001-Use-labs-instead-of-abs.patch  | 46 -------------------
 ...isade-Fix-warnings-with-clang-on-arm.patch | 24 ++++------
 ...-string-lenght-parameter-to-be-size_.patch | 23 +++++-----
 ...ix-compiling-failure-with-option-g-O.patch | 23 +++++-----
 meta/recipes-sato/puzzles/puzzles_git.bb      |  3 +-
 5 files changed, 35 insertions(+), 84 deletions(-)
 delete mode 100644 meta/recipes-sato/puzzles/files/0001-Use-labs-instead-of-abs.patch

diff --git a/meta/recipes-sato/puzzles/files/0001-Use-labs-instead-of-abs.patch b/meta/recipes-sato/puzzles/files/0001-Use-labs-instead-of-abs.patch
deleted file mode 100644
index f43d1df6cc8..00000000000
--- a/meta/recipes-sato/puzzles/files/0001-Use-labs-instead-of-abs.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 9808dc09e08937c9bffd858d3ded428225a4312a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 7 Sep 2015 09:02:38 +0000
-Subject: [PATCH] Use labs instead of abs
-
-cluevals is array of longs so we have to use labs() instead of abs()
-since abs() returns int
-
-Fixes
-
-keen.c:1458:17: error: absolute value function 'abs' given an argument
-of type 'long' but has parameter of type 'int' which may cause
-truncation of value
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- keen.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/keen.c b/keen.c
-index a6a7238..1631992 100644
---- a/keen.c
-+++ b/keen.c
-@@ -1043,7 +1043,7 @@ done
- 		    cluevals[j] *= grid[i];
- 		    break;
- 		  case C_SUB:
--		    cluevals[j] = abs(cluevals[j] - grid[i]);
-+		    cluevals[j] = labs(cluevals[j] - grid[i]);
- 		    break;
- 		  case C_DIV:
- 		    {
-@@ -1455,7 +1455,7 @@ static int check_errors(const game_state *state, long *errors)
- 		cluevals[j] *= state->grid[i];
- 		break;
- 	      case C_SUB:
--		cluevals[j] = abs(cluevals[j] - state->grid[i]);
-+		cluevals[j] = labs(cluevals[j] - state->grid[i]);
- 		break;
- 	      case C_DIV:
- 		{
--- 
-2.5.1
-
diff --git a/meta/recipes-sato/puzzles/files/0001-palisade-Fix-warnings-with-clang-on-arm.patch b/meta/recipes-sato/puzzles/files/0001-palisade-Fix-warnings-with-clang-on-arm.patch
index 5351f8eb4e0..143e898a513 100644
--- a/meta/recipes-sato/puzzles/files/0001-palisade-Fix-warnings-with-clang-on-arm.patch
+++ b/meta/recipes-sato/puzzles/files/0001-palisade-Fix-warnings-with-clang-on-arm.patch
@@ -1,7 +1,7 @@
-From 6d8326275802a2e6e61d3e99460af6891ae8362f Mon Sep 17 00:00:00 2001
+From 453587d714473b806473b309727f865b673cbc06 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 Jan 2016 23:10:19 -0800
-Subject: [puzzles][PATCH] palisade: Fix warnings with clang on arm
+Subject: [PATCH] palisade: Fix warnings with clang on arm
 
 ARM treats 'char' as unsigned char when 'char' is not qualified with
 'signed' or 'unsigned' explicitly.
@@ -16,17 +16,16 @@ type 'clue' (aka 'char') is always false
 Therefore, typcast the contant to char in such places to be explicit
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Submitted
-
+---
  palisade.c | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/palisade.c b/palisade.c
-index 984e616..2b9c25c 100644
+index 6ffbf2d..8b54d42 100644
 --- a/palisade.c
 +++ b/palisade.c
-@@ -295,11 +295,11 @@ static void solver_connected_clues_versus_region_size(solver_ctx *ctx)
+@@ -304,11 +304,11 @@ static void solver_connected_clues_versus_region_size(solver_ctx *ctx)
       * If p = q = 3 then the region has size exactly 2. */
  
      for (i = 0; i < wh; ++i) {
@@ -40,8 +39,8 @@ index 984e616..2b9c25c 100644
              if ((8 - ctx->clues[i] - ctx->clues[j] > ctx->params->k) ||
                  (ctx->clues[i] == 3 && ctx->clues[j] == 3 &&
                   ctx->params->k != 2))
-@@ -317,7 +317,7 @@ static int solver_number_exhausted(solver_ctx *ctx)
-     int changed = FALSE;
+@@ -326,7 +326,7 @@ static bool solver_number_exhausted(solver_ctx *ctx)
+     bool changed = false;
  
      for (i = 0; i < wh; ++i) {
 -        if (ctx->clues[i] == EMPTY) continue;
@@ -49,16 +48,16 @@ index 984e616..2b9c25c 100644
  
          if (bitcount[(ctx->borders[i] & BORDER_MASK)] == ctx->clues[i]) {
              for (dir = 0; dir < 4; ++dir) {
-@@ -528,7 +528,7 @@ static int is_solved(const game_params *params, clue *clues,
+@@ -538,7 +538,7 @@ static bool is_solved(const game_params *params, clue *clues,
      for (i = 0; i < wh; ++i) {
-         if (dsf[i] == UNVISITED) dfs_dsf(i, params->w, border, dsf, TRUE);
+         if (dsf[i] == UNVISITED) dfs_dsf(i, params->w, border, dsf, true);
          if (dsf_size(dsf, i) != k) goto error;
 -        if (clues[i] == EMPTY) continue;
 +        if (clues[i] == (char)EMPTY) continue;
          if (clues[i] != bitcount[border[i] & BORDER_MASK]) goto error;
      }
  
-@@ -674,7 +674,7 @@ static char *new_game_desc(const game_params *params, random_state *rs,
+@@ -685,7 +685,7 @@ static char *new_game_desc(const game_params *params, random_state *rs,
      p = numbers;
      r = 0;
      for (i = 0; i < wh; ++i) {
@@ -67,6 +66,3 @@ index 984e616..2b9c25c 100644
              while (r) {
                  while (r > 26) {
                      *p++ = 'z';
--- 
-2.7.0
-
diff --git a/meta/recipes-sato/puzzles/files/0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch b/meta/recipes-sato/puzzles/files/0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch
index 9ac62015d8c..7ca582fe5d6 100644
--- a/meta/recipes-sato/puzzles/files/0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch
+++ b/meta/recipes-sato/puzzles/files/0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch
@@ -1,4 +1,4 @@
-From 035467aa0abfbc0de7e5d24543d4aab37301593c Mon Sep 17 00:00:00 2001
+From 3af5a1e579e3324a13ba1f892c7befb3ab32d899 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 7 Mar 2019 21:56:57 -0800
 Subject: [PATCH] pattern.c: Change string lenght parameter to be size_t in
@@ -11,23 +11,24 @@ pattern.c:455:9: error: 'memset' specified size between 18446744071562067968 and
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  pattern.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pattern.c b/pattern.c
-index 45b1b0c..f73a4c2 100644
+index ffadd3f..4e5f187 100644
 --- a/pattern.c
 +++ b/pattern.c
-@@ -428,7 +428,7 @@ static int do_row(unsigned char *known, unsigned char *deduced,
-                   unsigned char *row,
-                   unsigned char *minpos_done, unsigned char *maxpos_done,
- 		  unsigned char *minpos_ok, unsigned char *maxpos_ok,
--                  unsigned char *start, int len, int step, int *data,
-+                  unsigned char *start, size_t len, int step, int *data,
- 		  unsigned int *changed
+@@ -428,7 +428,7 @@ static bool do_row(unsigned char *known, unsigned char *deduced,
+                    unsigned char *row,
+                    unsigned char *minpos_done, unsigned char *maxpos_done,
+                    unsigned char *minpos_ok, unsigned char *maxpos_ok,
+-                   unsigned char *start, int len, int step, int *data,
++                   unsigned char *start, size_t len, int step, int *data,
+                    unsigned int *changed
  #ifdef STANDALONE_SOLVER
- 		  , const char *rowcol, int index, int cluewid
+                    , const char *rowcol, int index, int cluewid
 -- 
-2.21.0
+2.17.1
 
diff --git a/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch b/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch
index c134acde2f2..28040523d4f 100644
--- a/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch
+++ b/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch
@@ -1,4 +1,7 @@
-gtk.c: fix compiling failure with option -g -O
+From 876c6ff1e20f51b0921acda99861f476b6423f26 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 11 Aug 2014 12:39:53 +0800
+Subject: [PATCH] gtk.c: fix compiling failure with option -g -O
 
 There were compiling failure with option -g -O
 ...
@@ -21,23 +24,21 @@ Initialized pointer 'cr' and 'error' with NULL
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
- gtk.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ gtk.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gtk.c b/gtk.c
-index a2eba2c..c54bf63 100644
+index 4565836..5e83b48 100644
 --- a/gtk.c
 +++ b/gtk.c
-@@ -2481,7 +2481,7 @@ char *fgetline(FILE *fp)
+@@ -2944,7 +2944,7 @@ static void list_presets_from_menu(struct preset_menu *menu)
  int main(int argc, char **argv)
  {
      char *pname = argv[0];
 -    char *error;
 +    char *error = NULL;
-     int ngenerate = 0, print = FALSE, px = 1, py = 1;
-     int time_generation = FALSE, test_solve = FALSE, list_presets = FALSE;
-     int soln = FALSE, colour = FALSE;
--- 
-1.9.1
-
+     int ngenerate = 0, px = 1, py = 1;
+     bool print = false;
+     bool time_generation = false, test_solve = false, list_presets = false;
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 5ee9164b85f..57f2af48eb8 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,6 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://fix-compiling-failure-with-option-g-O.patch \
-           file://0001-Use-labs-instead-of-abs.patch \
            file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
            file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
            file://0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch \
@@ -18,7 +17,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "c6e0161dd475415316ed66dc82794d68e52f0025"
+SRCREV = "1c0c49dd5cd8df6ae87f7be5371be84589fa2662"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.17.1


