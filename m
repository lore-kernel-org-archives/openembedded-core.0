Return-Path: <liu.ming50@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 72CCE7835C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 17:14:46 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id u207so1656881ywc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 10:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kX7pL2DSZoCefyLDeRLYymPbsFZYsM6+KlG/OxOsYHk=;
	b=kU8rHWD2clgc1pvxweLSJNJMtkKKbiI2cf+ZI3Fct3tF/cOdHfATlfVHSfBarqUcgH
	tOCCVjcz19/N2VhggGgnV18jhA2nDj97XaikNV3r0KjLharGuQEaSFgPIMuCPNXUhgv5
	wTMOtT2JlQqjBOUia1dqPrCBWgkdc9DxrxAzJfJbwdMJXwrSfGxXzO+wy8IO3U4ekdOV
	Hsz7yez+3NRvWReOFzxwZ4obZ+5cYDjA8VCHptMevjinYL31UElSYKxCBi+0r1TALcil
	6LQIF1ZoGS67wV4jc2/a8AFc1GTmNyiE6jqkpZv3CmAyoXAUXXDxh82lMk3mqog1z+nX
	TSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kX7pL2DSZoCefyLDeRLYymPbsFZYsM6+KlG/OxOsYHk=;
	b=adWcFAIDV8iff6cQB4APK8Uq6v1p43HhFr3WXG9QcQeaI1PNWrK2eLtZDBnmVUFUpE
	WQ3tGyB3b81/vhRtbytnRBlMRiUfK7uwzDbhqZhtdw/7WJoKNv8uIIGUKsh0maiFM6IT
	kjsNmcTUeWihjx+jxLxTSrcJ2Op7i/avGgUkC1wxgek6nQgh3XUbwBbwQbT5h3GbjO7T
	gAmwa9+7YCjrffXLH7enTEQFwno71iIHbiCXa95DVaaTjw8CUJiUR+GJKduR7cTt2+D4
	XMNX/UEtr5aA4EwmxxlJIm583GnlrXmLH90vQZrAGTFgv74VnTcpnJJcBk1E6LMLrZ++
	gk6A==
X-Gm-Message-State: AIVw110P2aM3NzbBT8mm1d06x5mV6Kro0gU2+umd4gqiUHwPEhByRhdE
	1MbthHvuap5g7bqu
X-Received: by 10.37.123.2 with SMTP id w2mr16467882ybc.3.1501607687368;
	Tue, 01 Aug 2017 10:14:47 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.186]) by smtp.gmail.com with ESMTPSA id
	r64sm10946066ywd.107.2017.08.01.10.14.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Aug 2017 10:14:47 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Aug 2017 19:13:50 +0200
Message-Id: <1501607630-30241-5-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501607630-30241-1-git-send-email-liu.ming50@gmail.com>
References: <1501607630-30241-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 4/4] qemux86-64.conf: drop do_image_wic task dependencies
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
X-List-Received-Date: Tue, 01 Aug 2017 17:14:46 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

They are being controlled by WKS_FILE_DEPENDS_DEFAULT, the code here
is redundant and incomplete as well.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/conf/machine/qemux86-64.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 10189cb..9f55aaa 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -30,4 +30,3 @@ MACHINE_FEATURES += "x86"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
 WKS_FILE ?= "directdisk.wks"
-do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
-- 
2.7.4


