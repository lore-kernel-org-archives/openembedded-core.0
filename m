Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Rt3JZ-0005Hf-IH
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 21:31:29 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so529166eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 12:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=uaLqFXVYOwzzurG5opsKU+KncSm9Xet3nYEiVbEoydk=;
	b=XQIx+vqTEv+UqtZu6U4mI1v+58YFfvmvGgcNEcN3K7gEg6udx1FeA3tp96utbzH+TN
	0cA0tsBD6mNAzJFHFLhDf4b3nXIJaa+DhwIBFfY6vKaPf7m9PSZtP5VUQr5oWanzrwrb
	4w3tNisKKO6yypQhBAaGcsd8yH18WdKHM1Z1E=
Received: by 10.213.31.204 with SMTP id z12mr722120ebc.94.1328214215171;
	Thu, 02 Feb 2012 12:23:35 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id o49sm13023251eeb.7.2012.02.02.12.23.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Feb 2012 12:23:34 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 21:21:26 +0100
Message-Id: <1328214086-6824-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] busybox: Add flock utility to default configuration.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Feb 2012 20:31:29 -0000

Flock is required by by pm-utils package to function properly
(/usr/lib/pm-utils/functions). It's shipped in both busybox and
util-linux. Both versions work fine with pm-utils. Enabling it
in busybox seems like simpliest solution for the problem.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
index b474ad4..fa9c078 100644
--- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
@@ -540,7 +540,7 @@ CONFIG_FEATURE_FDISK_WRITABLE=y
 # CONFIG_FEATURE_GPT_LABEL is not set
 # CONFIG_FEATURE_FDISK_ADVANCED is not set
 # CONFIG_FINDFS is not set
-# CONFIG_FLOCK is not set
+CONFIG_FLOCK=y
 # CONFIG_FREERAMDISK is not set
 CONFIG_FSCK_MINIX=y
 # CONFIG_MKFS_EXT2 is not set
-- 
1.7.3.4



