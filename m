Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 102F4601F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 23:21:50 +0000 (UTC)
Received: by ioii16 with SMTP id i16so3817772ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 16:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FBYdCz6kC3q2jkNoqqFA16iR5pTL+eShvgXPBZPkSzU=;
	b=e7hTzoGOGw3yhfjZbst1SHsoWT5TACOWkO5qpfNHR+303QjmivOLepr6PRyCXRddOE
	83/TJqAQIFuE/oBMF9svtAFXIsb1Xr3m/+aIX+QL+i6liKisX/IOh82nspAZhMOJ7FQ1
	/T4bPhaW1AB4PuO6PpsO8hcjHuXlqOIHmEk+22YDJnxG0PQf72U5obY1flHENCh43U+z
	yB7fkmPQa2WYHkU6BbCFjeuRWe6PCv3NtDe2mkT+lqdG2os/sPOhTVgpcVOg08Pgx31O
	SuOjRNurQNpC6dRXDX4HC6mpDjfQcM9c3yXowWgYO4PgevRiRcMSRbPOsT3MXT2Qj3jD
	saGA==
X-Received: by 10.107.15.226 with SMTP id 95mr54939677iop.44.1438125710514;
	Tue, 28 Jul 2015 16:21:50 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id i7sm9668533igt.18.2015.07.28.16.21.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Jul 2015 16:21:50 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jul 2015 16:21:05 -0700
Message-Id: <1438125665-14966-9-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
References: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 8/8] busybox: disable volumeid support for exFAT, F2FS and NILFS
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
X-List-Received-Date: Tue, 28 Jul 2015 23:21:50 -0000

These are less common filesystem formats, so disable volumeid support
for them by default.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index ad0c7e1..5122007 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -636,9 +636,9 @@ CONFIG_VOLUMEID=y
 #
 # CONFIG_FEATURE_VOLUMEID_BTRFS is not set
 # CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
-CONFIG_FEATURE_VOLUMEID_EXFAT=y
+# CONFIG_FEATURE_VOLUMEID_EXFAT is not set
 CONFIG_FEATURE_VOLUMEID_EXT=y
-CONFIG_FEATURE_VOLUMEID_F2FS=y
+# CONFIG_FEATURE_VOLUMEID_F2FS is not set
 CONFIG_FEATURE_VOLUMEID_FAT=y
 # CONFIG_FEATURE_VOLUMEID_HFS is not set
 # CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
@@ -646,7 +646,7 @@ CONFIG_FEATURE_VOLUMEID_FAT=y
 # CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
 # CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
 # CONFIG_FEATURE_VOLUMEID_LUKS is not set
-CONFIG_FEATURE_VOLUMEID_NILFS=y
+# CONFIG_FEATURE_VOLUMEID_NILFS is not set
 # CONFIG_FEATURE_VOLUMEID_NTFS is not set
 # CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
 # CONFIG_FEATURE_VOLUMEID_REISERFS is not set
-- 
1.9.1


