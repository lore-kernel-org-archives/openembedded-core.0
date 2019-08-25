Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0C4937F658
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2019 17:21:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Ghkm4c6bz29
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2019 19:21:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566753696;
	bh=1v0K61ANp3N9l2gFLQ0G00afjsQXJltR9LDSSz4lVQo=;
	h=From:To:Subject:Date:From;
	b=qGEoG4UevHynAyAPTN5WAgpHsa0+R1FaUH00NaCrO5Mqs4XeI7JHkao7wC+mBR/3t
	85oHCUJZi/0Am9Z54x6w1f/1uYx/TbGSV2BzMDk92JQtgn0cOpClfLHde2Vqkh81if
	DqljAidBPp4C3bYwdrRmkL9wNx+WMMh5zdjtrlJdvamc16vp5+Nc66g/YSl//ZYvMu
	6hV4k0G+r8A+HceH7htgYPUMjqqBku8ozOPq2CpvHX1XCUG9V4x3UbW5fGkYeTD4JG
	RIC+phS7+0ehIrrRywqKyFQ0NVyxN2Sy0W1c3IxNVtdqQfLrJViXzsfu5aUZvz3Z17
	d/fg/IiU2XcgPT+XX57ZXVb8PvfrhFWIdd99H3X1wC4z3YcYGlJwIimf6XwP5ubunv
	foNpBzGVzMO1jranGEuQS7Hh6WT9XB4vKSgOU5BhNOaoYel2KmQjv9qs0p34n5LU9j
	ToKwP08ZYQlDXBNgYNmuowQkvw6V414q2faIshi+gFh9mgvhjf+kuQCs2eiW0/ikVI
	zj8tGsAAUNtP1WtRfs5/iuBepmsGj19zJ2fwa/38tomAduswXJcAgvdF89vzABvwYi
	w1R6v78B8eb8xtOqxC/P4w28X5GdRLLvTOqbcLwg1V6NFzZiudynL4aAiWgF3huQXb
	dC29erEmn96yFxGPjrykOQEU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Aug 2019 20:21:35 +0300
Message-Id: <20190825172135.23817-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] meta/recipes.txt: Stop documenting the long removed recipes-lsb4
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
X-List-Received-Date: Sun, 25 Aug 2019 17:21:36 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes.txt b/meta/recipes.txt
index 9e178d6ce8..2439357876 100644
--- a/meta/recipes.txt
+++ b/meta/recipes.txt
@@ -7,7 +7,6 @@ recipes-extended     - Applications which whilst not essential add features comp
 recipes-gnome        - All things related to the GTK+ application framework
 recipes-graphics     - X and other graphically related system libraries  
 recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
-recipes-lsb4         - Recipes added for the sole purpose of supporting the Linux Standard Base (LSB) 4.x
 recipes-multimedia   - Codecs and support utilties for audio, images and video
 recipes-rt           - Provides package and image recipes for using and testing the PREEMPT_RT kernel
 recipes-sato         - The Sato demo/reference UI/UX, its associated apps and configuration 
-- 
2.17.1


