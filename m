Return-Path: <kergoth@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id BEB126A990
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 17:14:03 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id 10so6880700ied.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 10:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=SuB1qs+6o5P9hz9vGUraIy9FT/4dBAisfEmYKkb8oAI=;
	b=R+aQq6KMKXyo2duqzWWQ7h3HCC/81DWwXjPufCkU4juXg/bhSappJ579M3a/LIEoPP
	FBW500NEfM5JypCk6aAZm5FzsfHYftDqyoFVfvsc0WVsv+Fe/tUUdPImfC8mackL/baG
	OEDJLJ+x9FNk0++yd+/0/5oInRkOCr7rOTFpfD0pCbL6o+++yUL9O04P4V6vOzgCAbNv
	DNDdOVLtSGTDfbxD4fCbCy/Qh4Tf/5cF2fI+f+F86pmkf7y6l1cjndlRFVPkcScxCccJ
	jmU9aHZ9bJnPNVvqGWCg2D/hP+M/+vnMO9WHB85L5zk5qAswboBEBG6WbHZKRBVtKR6w
	qMzQ==
X-Received: by 10.42.26.12 with SMTP id d12mr6120126icc.1.1370970844822;
	Tue, 11 Jun 2013 10:14:04 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id l9sm4860014igt.5.2013.06.11.10.14.02
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 10:14:03 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2013 10:14:01 -0700
Message-Id: <1370970841-12764-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] packagegroup-base: s/dosfsprogs/dosfstools/
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
X-List-Received-Date: Tue, 11 Jun 2013 17:14:04 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 061c1a7..1c0c757 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -180,7 +180,7 @@ RRECOMMENDS_packagegroup-base-vfat = "\
     kernel-module-vfat \
     kernel-module-nls-iso8859-1 \
     kernel-module-nls-cp437 \
-    dosfsprogs"
+    dosfstools"
 
 SUMMARY_packagegroup-base-alsa = "ALSA sound support"
 RDEPENDS_packagegroup-base-alsa = "\
-- 
1.8.3


