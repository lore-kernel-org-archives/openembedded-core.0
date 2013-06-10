Return-Path: <kergoth@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 17DF06A9D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:47:45 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id n10so27156oag.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=S6u9LjyrFAHTSMWMD0K1eprlP0ris5FGwdx8DiHG3VM=;
	b=fWnTvWGKyhBJtCCcUH+eVxp6GqZW9gDXhWji2pT5773Ax2JiF/OSQu2T3jdDW/d5Wk
	Q2kMYAMZgRdRvWPxJv4I/vQJpXxZvWNd8N84bzEJEb9t9zJmPTT1h5XqMhO6gKZbWDs8
	ZOBsVRUWIITLlGPxhcv3JOUQcsPZJdSsB5EFEizLU/XrjVINzk5en1c49zd8RMZ064Ib
	eNKRcIrpN1AA+Q1BzKTl2fprCbw6cmI9zwciZTWvLShMTucmChyJ/BDeZd437nk9oKCm
	8pNYAxDfZqDpY8ix3EnTUNuznemjNsyAc76iFKEfHx/c/Bg86wyabVi5GSrqCDi7rLbd
	hEUw==
X-Received: by 10.60.97.34 with SMTP id dx2mr8828868oeb.9.1370897266118;
	Mon, 10 Jun 2013 13:47:46 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id kz3sm24258712obb.6.2013.06.10.13.47.44
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 13:47:45 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 13:47:06 -0700
Message-Id: <25d34eb31411dbe5f5d050878591ce260d9bb240.1370896990.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370896990.git.chris_larson@mentor.com>
References: <cover.1370896990.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370896990.git.chris_larson@mentor.com>
References: <cover.1370896990.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/4] packagegroup-base-vfat: include dosfsprogs
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
X-List-Received-Date: Mon, 10 Jun 2013 20:47:45 -0000

From: Christopher Larson <chris_larson@mentor.com>

The ext2 group includes e2fsprogs, so this is consistent and should be
appropriate, I think.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 799e12a..061c1a7 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -179,7 +179,8 @@ RRECOMMENDS_packagegroup-base-vfat = "\
     kernel-module-msdos \
     kernel-module-vfat \
     kernel-module-nls-iso8859-1 \
-    kernel-module-nls-cp437"
+    kernel-module-nls-cp437 \
+    dosfsprogs"
 
 SUMMARY_packagegroup-base-alsa = "ALSA sound support"
 RDEPENDS_packagegroup-base-alsa = "\
-- 
1.8.3


