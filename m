Return-Path: <ticotimo@gmail.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id EA93865D33
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 23:54:53 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id db12so2113123veb.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jul 2014 16:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4nGNlOiy89Ubk2xsyp/qBnfavj28vixz6p+4aRbjht8=;
	b=i4YwGpx7cgB/0mb9We+MbgHQHwwoPPqWYFM4wDV2LYi2Jgvw28bwMF0aJa5RLhNznh
	n0NVEAzMpUXT1Ra9RBhTgCk0PuIpMEHZvvlFB+FnkbOF3AkJj3GVXvBtlGAXfs63CVl5
	1qWzyj4mKPNieLvyOdQiYK4TmTXMBBnit8EGVx7nzBCfYn059UA/+zTDsyiYsAcADpJJ
	ZxQ74sjh5N6c9Ot7jC8+NPKUcDQ0lorpRTOOF6smQRhfgpXxth8ruRW5N5EY5wBH2ZxJ
	JyBl3HZs4sJCxrIEwk3TNLHZzykmDARd5DmtTHulYbz+lygbxr89YoFQE+l7aixn0IPx
	cKPA==
X-Received: by 10.58.245.194 with SMTP id xq2mr12049767vec.26.1404518095166;
	Fri, 04 Jul 2014 16:54:55 -0700 (PDT)
Received: from localhost.localdomain.com ([196.40.10.133])
	by mx.google.com with ESMTPSA id f1sm33326187veo.5.2014.07.04.16.54.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Jul 2014 16:54:54 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Jul 2014 16:54:49 -0700
Message-Id: <1404518089-11711-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] cogl-1.0: update to 1.18.2
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
X-List-Received-Date: Fri, 04 Jul 2014 23:54:56 -0000

Announcement:
http://lists.freedesktop.org/archives/cogl/2014-July/001689.html

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta/recipes-graphics/cogl/cogl-1.0_1.18.0.bb | 6 ------
 meta/recipes-graphics/cogl/cogl-1.0_1.18.2.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.18.0.bb
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.18.2.bb

diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.18.0.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.18.0.bb
deleted file mode 100644
index 375b079..0000000
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.18.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require cogl-1.0.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
-
-SRC_URI[archive.md5sum] = "994a29f5c02768367b6f035bfe456ba6"
-SRC_URI[archive.sha256sum] = "a4d91ebf7e7aba362eb5c6e4ffebbf1167ff4ac87fabae104912d879a5390f5e"
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.18.2.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.18.2.bb
new file mode 100644
index 0000000..6700efb
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.18.2.bb
@@ -0,0 +1,6 @@
+require cogl-1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
+
+SRC_URI[archive.md5sum] = "952155d526d35f297737266408e842b5"
+SRC_URI[archive.sha256sum] = "9278e519d5480eb0379efd48db024e8fdbf93f01dff48a7e756b85b508a863aa"
-- 
1.9.3


