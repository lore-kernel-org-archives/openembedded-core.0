Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TEO5n-0002qd-3f
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 19:29:43 +0200
Received: by wgbdq11 with SMTP id dq11so847624wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 10:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=aLvJTW8X1/ta5g5R+8Hral2loVG2bFJwcCRHipAYWrM=;
	b=udjVPlfU2sqComc+KF156AyET2ojzV4choJEZegwzJbbJMyGGNR8FHb1s+qSH7/T2S
	DI0wQGZpOdae2tYpqYqg2pXzRT6YHIhFsCeEejs/M/GJ7Fr9RUyo/iPKRVTemUXHeCAb
	vqhPe3ZaCRb1w6QGTRH2LqWu8OohvNNBW96TQDVnSR8Roa7PK7gsXKFbwRcdbEoE1Uhl
	t9L/VQMoQMzmBhnvFLw3QyjSc15LFIA1UzaO8hV1h4EYRw68N5fCHqGCzrShJnYCEFvB
	pd4K5Ac+Q4P0PG6Fgd9LMAW5CIDvOSLEFJ8cX78Ggshtc3GBEYDO6a2xBHtyrSzWMbBz
	cyDw==
Received: by 10.216.243.203 with SMTP id k53mr2105185wer.91.1348075021870;
	Wed, 19 Sep 2012 10:17:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm5944676wiy.4.2012.09.19.10.17.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Sep 2012 10:17:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 19:16:31 +0200
Message-Id: <90f3fc3aeffac6451faf9ceddcfb9b6458d50e64.1348074403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348074403.git.Martin.Jansa@gmail.com>
References: <cover.1348074403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348074403.git.Martin.Jansa@gmail.com>
References: <cover.1348074403.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] opkg-nogpg: drop SRCREV
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 17:29:43 -0000

* use SRCREV from opkg_svn.bb, because with 596 patches we have won't apply

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/opkg/opkg-nogpg_svn.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg-nogpg_svn.bb b/meta/recipes-devtools/opkg/opkg-nogpg_svn.bb
index 35f0581..e1b9f24 100644
--- a/meta/recipes-devtools/opkg/opkg-nogpg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg-nogpg_svn.bb
@@ -3,8 +3,6 @@ require opkg_svn.bb
 DEPENDS = "curl"
 PROVIDES += "opkg"
 
-SRCREV = "596"
-
 EXTRA_OECONF += "--disable-gpg"
 
 DEFAULT_PREFERENCE = "-1"
-- 
1.7.12



