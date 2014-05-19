Return-Path: <raj.khem@gmail.com>
X-Greylist: delayed 492 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 19 May 2014 02:20:25 UTC
Received: from mail-pb0-f51.google.com (unknown [209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6C15765E05
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 02:20:25 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id ma3so5186873pbc.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 May 2014 19:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=avw9eDNUOVxoP8T3MRwa6YeBhm9ns6vJahtVbLSezpA=;
	b=m3dfhkJIdHETzhg22OtJFL0CFTHUHnrj5PrcXFcO1pG+m29121jUBQ0th5f+G0IMiU
	1EkydjYqXpZdCLblHIhaYT5IxAa8xf3e/AcF6yu4XNLvNxHbLtrnwLhgubugnRrnRwfW
	C2jlsuqWfUH3oKWs1I/HOctrD+WNvq2tjZhSHaYECqLf57D0WvKLQxmlFetMoARCkiir
	5BFoYwEJCPeOusMeugZhHNIHHXQCqHJnvS7Oqbo6yUyvFZm9TAEhzI5dj4z+wwHyznwg
	jp3Q5tazZO1DiN2EQaY2wuaPmdLudPR2VBk5TPCA/bRDr1S4/cteVulwyDTKx5HZk5VK
	532w==
X-Received: by 10.68.221.42 with SMTP id qb10mr39074823pbc.65.1400465534369;
	Sun, 18 May 2014 19:12:14 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218]) by mx.google.com with ESMTPSA id
	ox3sm26983836pbb.88.2014.05.18.19.12.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 May 2014 19:12:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 May 2014 19:14:32 -0700
Message-Id: <1400465672-30863-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [dora][PATCH] prelink: Fix SRC_URI
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
X-List-Received-Date: Mon, 19 May 2014 02:20:26 -0000

The SHA we use it actually on cross_prelink branch
if you do not use yocto source mirrors then the fetch
for prelink on dora fails due to missing branch in SRC_URI

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/prelink/prelink_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 744a55f..9f6e315 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -26,7 +26,7 @@ FILES_${PN}-cron = "${sysconfdir}/cron.daily ${sysconfdir}/default"
 
 PACKAGES =+ "${PN}-cron"
 
-SRC_URI = "git://git.yoctoproject.org/prelink-cross.git \
+SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;branch=cross_prelink \
            file://prelink.conf \
            file://prelink.cron.daily \
            file://prelink.default \
-- 
1.9.3


