Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SmTda-0004FM-Vm
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 19:45:15 +0200
Received: by wgbdr1 with SMTP id dr1so6886865wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2012 10:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=cTXGPww4uSetDV5RiKoZfEeby7rUExxMGSzfLAyvyCI=;
	b=0yw6ARbPT+iIY/soLL+6FJ7koIv4Wl3Wr2PQ5WTtiz6lojb/kiwF2Nr77tZVQlFAKi
	wM9Ei6oQQZPFPkyPZhySgefnG9Yb/WTXEPp1cuQFCf4j9VXUM+H3R3bg9XxQmX2l5252
	1XypMeD0FRKsUxzYNsRhXRQ1AW7x2r3MvX49Uq3w6NAFZAS61QZfNnXPhEeIWVvWnz1A
	2pE6E4ulSO2aBfMfVWUMaUXOHz3UpymbGYwzAu6qVqoPg5O773G9gW2PXtnqCsvEwxIr
	slSkMHbWgoyd97sGroKuMXkOORmeSH6gFucOQrmfLZ7BaiB0H7FC1clrCA8b1P9gVCI5
	3HlQ==
Received: by 10.216.131.221 with SMTP id m71mr6614530wei.32.1341423251919;
	Wed, 04 Jul 2012 10:34:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f7sm68304266wiv.2.2012.07.04.10.34.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jul 2012 10:34:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2012 19:33:55 +0200
Message-Id: <1341423235-23153-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120704172715.GH15100@jama.jama.net>
References: <20120704172715.GH15100@jama.jama.net>
Subject: [PATCH] linux-firware: bump PE because git SRC_URI was changed resulting in LOCALCOUNT reset
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
X-List-Received-Date: Wed, 04 Jul 2012 17:45:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../linux-firmware/linux-firmware_git.bb           |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 8aacce4..a7e4ed6 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -20,6 +20,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
                    "
 
 SRCREV = "e98750f0d68d0037ce5a186f7f863a9c13bf773a"
+PE = "1"
 PV = "0.0+git${SRCPV}"
 PR = "r2"
 
-- 
1.7.8.6



