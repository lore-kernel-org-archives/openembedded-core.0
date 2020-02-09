Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2FC0C60CC9
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:03 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id i6so2432187pfc.1
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yckrYuro85b9wmQN+yiYulXLMyY+pNbdn26bTetNTsc=;
	b=EKAw1/aKuvk9QKCfVKP+ItaIuBz1Z8lwOp4eZvf6T7LYMxw2g2mqiq8tg54SE3dZc0
	80OjCt7YqQXOXhEDhTGWjyad5C/d+0PRo29mg8OEJ13PbZndCIqpjRoKg/J4HQAIBkPa
	BGPdBuHqulXbmYT2pHD490RqTSVAf29zdyajBlWNo6EGJnvQpOr9fEZ5vwqp/tcnmpb+
	034texF4pz5eEj0k0Y8YPF1mRF0WjhrooUy9kbq8w3yIhJ02hPBNJkgvuXz2Pkp+EDEb
	SBvRCQleEUb0f5p9LTYgPg6sCGKE1L1AUiBhFOFkQBb8pApeiBsSVrUqzWwk2jaukess
	Jbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yckrYuro85b9wmQN+yiYulXLMyY+pNbdn26bTetNTsc=;
	b=t5i34sItLKMS7OIMnR5XttA/vkxZa8nSw4qCv/M+pdQhT3yHIUAGuB3f9IcaaKiahG
	FrTYT6GqThww4+hQHvoWelY9qnh+vBw+O8GmqhF4XaqLznxnEM1kedZnmETyXg2t0AYA
	P+8llcgc0oE/+bxstAKJenvFpEebR/1/rG2OFLryEIFkH0R0rEbRjPsYSZmNJvPeKbFe
	vWoUYTfZlbuGnN0s+iHBf5ERJKeMbj+tn5VKv0BSrao5GKS/dm2ANTAEvhXXl3H4Gmjj
	92D5lW1DPEt0C8pmGR5qRehGQFIpLGP8cIt+gLhaIj1pmkEvBpEuLv0tjRZmKL2K+UbI
	lo1A==
X-Gm-Message-State: APjAAAWFsJrX4nKmZsGz7UtUvO8aigTeiJBvhPghfQD+Y+GQebd2a3+v
	6yPYlGUogFZJEyas1aWBEYnJFwFN
X-Google-Smtp-Source: APXvYqxHrIkjx3Dhn+i/Q/P7LaV//7tPQML0mTqjO+XbiD8iNrHyUwzU8qWcNZrHhFIw7lBCgn1MLw==
X-Received: by 2002:a63:1f54:: with SMTP id q20mr9250551pgm.400.1581264604094; 
	Sun, 09 Feb 2020 08:10:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.03
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:29 -0800
Message-Id: <f447b996e3369ad03647c45fab183d764a9e892c.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 01/29] Revert "bzip2: Fix CVE-2019-12900"
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:03 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

This reverts commit 175e6cb75ce328d51a9d4ad18c7e09d9fb92c2e1.

This change is already in bzip2 1.0.7. The change fixing a regression
caused by this change is in 1.0.8 which is the current version in zeus.

This isn't resulting in failures because the patch file isn't included
in SRC_URI.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch    | 36 -------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch

diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
deleted file mode 100644
index 9859d9d1a2..0000000000
--- a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc Mon Sep 17 00:00:00 2001
-From: Albert Astals Cid <aacid@kde.org>
-Date: Tue, 28 May 2019 19:35:18 +0200
-Subject: [PATCH] Make sure nSelectors is not out of range
-
-nSelectors is used in a loop from 0 to nSelectors to access selectorMtf
-which is
-UChar    selectorMtf[BZ_MAX_SELECTORS];
-so if nSelectors is bigger than BZ_MAX_SELECTORS it'll do an invalid memory
-access
-Fixes out of bounds access discovered while fuzzying karchive
-
-Link: https://gitlab.com/federicomenaquintero/bzip2/commit/74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc.patch
-
-Upstream-Status: Backport
-CVE: CVE-2019-12900.patch
-Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
----
- decompress.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/decompress.c b/decompress.c
-index ab6a624..f3db91d 100644
---- a/decompress.c
-+++ b/decompress.c
-@@ -287,7 +287,7 @@ Int32 BZ2_decompress ( DState* s )
-       GET_BITS(BZ_X_SELECTOR_1, nGroups, 3);
-       if (nGroups < 2 || nGroups > 6) RETURN(BZ_DATA_ERROR);
-       GET_BITS(BZ_X_SELECTOR_2, nSelectors, 15);
--      if (nSelectors < 1) RETURN(BZ_DATA_ERROR);
-+      if (nSelectors < 1 || nSelectors > BZ_MAX_SELECTORS) RETURN(BZ_DATA_ERROR);
-       for (i = 0; i < nSelectors; i++) {
-          j = 0;
-          while (True) {
---
-2.22.0
-- 
2.17.1


