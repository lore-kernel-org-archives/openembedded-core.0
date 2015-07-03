Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2766D75CF5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 01:46:05 +0000 (UTC)
Received: by iebmu5 with SMTP id mu5so68192945ieb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 18:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=e+5mro+LKQrS0jOZDB9+wYF85mRl6TW3XbQSI1BBvKU=;
	b=prE3zOTRfo81XMwLiqQCm2NfTUaGnVgdSrtn46B0/SncbkblT4IB6aJsgT1wmrfxpU
	7m48jH5bkaUnp7PUL1uJcoX15bOB/LRL/ac0GB+yeo9KjSXlPL+zri/LAVfXVhKMlio4
	SAGatfF7VG1EhWob8yx/BbMylyWeJPWXOYBbRH7AwaGgyFKXzXAm+w9bhdecA+pzp9t0
	dUUdcjLm1WH7ihxWT2YdBh5VDm0RLZyCw8M6knx/S/YOlUeayoldhRoxDi546S/NqXgI
	XI4jlTq642QZelih/hDWqPawt3FmMBIVN19Ve5abwHW4NN4SOhZ/DSNzVyIXSPOElrYH
	TKiQ==
X-Received: by 10.42.48.9 with SMTP id q9mr16413110icf.21.1435887965860;
	Thu, 02 Jul 2015 18:46:05 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id x4sm5233578iod.26.2015.07.02.18.46.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Jul 2015 18:46:05 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jul 2015 18:45:41 -0700
Message-Id: <1435887942-20254-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1435887942-20254-1-git-send-email-armccurdy@gmail.com>
References: <1435887942-20254-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/4] busybox: remove CONFIG_FEATURE_VI_OPTIMIZE_CURSOR from defconfig
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
X-List-Received-Date: Fri, 03 Jul 2015 01:46:06 -0000

CONFIG_FEATURE_VI_OPTIMIZE_CURSOR is obsolete and removed from busybox
v1.21.0 onwards:

  http://git.busybox.net/busybox/commit/?id=04b52892ed5d9d8a4cf5d887c221a8b50c71274e

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 6535755..4b8a51b 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -384,7 +384,6 @@ CONFIG_FEATURE_VI_USE_SIGNALS=y
 # CONFIG_FEATURE_VI_SET is not set
 CONFIG_FEATURE_VI_WIN_RESIZE=y
 # CONFIG_FEATURE_VI_ASK_TERMINAL is not set
-CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
 CONFIG_FEATURE_ALLOW_EXEC=y
 
 #
-- 
1.9.1


