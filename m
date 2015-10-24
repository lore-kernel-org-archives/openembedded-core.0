Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 92C0A608B7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Oct 2015 23:39:50 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so157330050pac.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Oct 2015 16:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=STOmsQwrZbqPZ2Hw1QiTTMqXQdBz5XR+d0C5WMGuCXY=;
	b=APY26P85BLrJcpFOhzZzWG4duz1LQLWtdO9LMR9mTadSIJOT4X/Cwc1YbBTQAr0jkP
	3vFgq4kZZ+7i1ppgzWntR5Dw3Xmaupio7D4l/ak7HcXNywrEySSKRYh97nliVKG32Eor
	9ad6NWH0XFvrByz90k7lJuu57DjxJOsT/6Fu1bY11v0tbXPN+a31iyi75VAaD8wN1Uah
	P/VufKwV6XzM9MicC8SkHzVsOZpfPRQZaNntIfRkL8KYAHXwX/zrLxEw0WT0ojYbHP3C
	efbBJhoyB+/6pLkrposFKfZi4OsnZlKGqpXcItPHpCu1WXGNPZuS8KrnYM6oyYh/Q2pu
	ajqw==
X-Received: by 10.66.122.33 with SMTP id lp1mr4190008pab.12.1445729990934;
	Sat, 24 Oct 2015 16:39:50 -0700 (PDT)
Received: from arch.hsd1.ca.comcast.net (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by smtp.gmail.com with ESMTPSA id
	of1sm26046372pbc.11.2015.10.24.16.39.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 24 Oct 2015 16:39:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Oct 2015 16:39:38 -0700
Message-Id: <1445729978-29103-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] toasterconf.json: Set default distro to nodistro
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
X-List-Received-Date: Sat, 24 Oct 2015 23:39:53 -0000

This makes it self-sufficient with OE-Core
Generate ext4 instead of ext3, most of Qemu
targets in oe-core now use ext4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/toasterconf.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
index c8e42ef..1ee6d29 100644
--- a/meta/conf/toasterconf.json
+++ b/meta/conf/toasterconf.json
@@ -1,8 +1,8 @@
 {
     "config": {
         "MACHINE"      : "qemux86",
-        "DISTRO"       : "poky",
-        "IMAGE_FSTYPES": "ext3 jffs2 tar.bz2",
+        "DISTRO"       : "nodistro",
+        "IMAGE_FSTYPES": "ext4 jffs2 tar.bz2",
         "IMAGE_INSTALL_append": "",
         "PACKAGE_CLASSES": "package_rpm",
         "SDKMACHINE"   : "x86_64"
-- 
2.6.2


