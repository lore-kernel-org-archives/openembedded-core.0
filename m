Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f195.google.com (mail-ig0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5F9417652D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 20:56:47 +0000 (UTC)
Received: by igbij6 with SMTP id ij6so492534igb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2pjKiFCb+sh6C7QZuFW6ns6WhvP3IDV2tXA0APlTBMk=;
	b=MwoVM0KCq/Bjk79r2j9w94kM0++q+Wsupn3U2CWjVK3VG6JEsN9qLia9IhoyUAtUed
	IkA75WzenboldRTdyCIF+8kbmZBKslNCpReNttSqwuZXahsUeq+PHgXgsN0JAVN2FWTI
	TO711zzOqbj7tgUKJ1I9C+NgqEnjHdgz5AguogH0zwLTVH7GcQfY7MobuB/C0VtkoSrN
	TvFaQIMqVPpRbstERsTCikzSEMX3JM2phHLXtYa0coxMeSZ7QpBbJ0z74yrjNpzyC9rz
	xLdkV5XLQL7TjrwJzRSmRjJQErQCNgx2JIVYry2dmCM9ThiKk43D1yjRMU2/O7Y+pHME
	uu7w==
X-Received: by 10.50.7.68 with SMTP id h4mr70860iga.40.1438289808216;
	Thu, 30 Jul 2015 13:56:48 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id a6sm1530978ioj.1.2015.07.30.13.56.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jul 2015 13:56:47 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 13:56:22 -0700
Message-Id: <1438289788-23120-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438289788-23120-1-git-send-email-armccurdy@gmail.com>
References: <1438289788-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/7] busybox: remove CONFIG_FEATURE_VI_OPTIMIZE_CURSOR from defconfig
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
X-List-Received-Date: Thu, 30 Jul 2015 20:56:50 -0000

CONFIG_FEATURE_VI_OPTIMIZE_CURSOR is obsolete and removed
from busybox v1.21.0 onwards:

  http://git.busybox.net/busybox/commit/?id=04b52892ed5d9d8a4cf5d887c221a8b50c71274e

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 468c40e..aa7b782 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -375,7 +375,6 @@ CONFIG_FEATURE_VI_USE_SIGNALS=y
 # CONFIG_FEATURE_VI_SET is not set
 CONFIG_FEATURE_VI_WIN_RESIZE=y
 # CONFIG_FEATURE_VI_ASK_TERMINAL is not set
-CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
 CONFIG_AWK=y
 CONFIG_FEATURE_AWK_LIBM=y
 CONFIG_CMP=y
-- 
1.9.1


