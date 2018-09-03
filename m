Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8417A78F67
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 04:06:01 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id s7-v6so963381pgc.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Sep 2018 21:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/jYVlNZP/LCcZTCiMHNdL8jSJHTRhelyQV+BkhQyKN4=;
	b=PnQRLqt58Un8KX/bLyibphPTiSnjqRkafdIfyupMSVkYqal2CJY53upfzQHWQVjINl
	aQ9rkLaR9SB3ocZfSuI1wjr+eYzERLWtPC4DSxp9Xv7jwlVU3N0AOnKQGwjpdrlLRC92
	KrUC5mViqiopJuNGeOBYGt5q9cBTXmWdeoPIqpdgstDlP7MOYDnzi5BHt42xV1wVKvvM
	7vRVgPxK0rQg2TTe7d5TDIiLusdj7BEITWd8TzRXYPDipW2AxFhCVddeIQ0BE7aFq9h3
	2znLJI4fiJr6Gm95TxgpWFy35f3r2Skk8ls0C1OKqMDZxSG5cT10nJNrL0EQQkBTZpBV
	dkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/jYVlNZP/LCcZTCiMHNdL8jSJHTRhelyQV+BkhQyKN4=;
	b=IRdVgzDMmM9B68TTOvv5n5lnI8Hf9CmkCZ0q/OruFL53EoMugnuD3+Hq04I6lQ/ney
	Ojh5NnynkkzIYSthU+C/mo6kd3gJjDf5azqv3Gj91y3KKLEUQy+PYl8Z4grpr+ah9H4k
	chY5P5ZdXm+21GMCnnegcgKkrChy3SkffoyAkjCS69TA79s2OxBrweXCNAhkA5/821At
	gNfBGe9lfnlfVLvaP9W8aO8OZG3HBJuEVRelG6sBmDI07/r8MnDjLD2/EU41stVfUK4i
	bviBli9w0gOLR5YF4olCUNtOSHXLoVHKf1Ilbk4trmXPw9Fold/ZMOcfJmuHZ/FknkAA
	FYhg==
X-Gm-Message-State: APzg51C7FopoPe3BKHS8bVGpyi4RTT6GhbX4Aw0SJYJORj9Z2cOZYOeY
	dDt4XUyoH2N4OshbWGmnp0hf5vbg
X-Google-Smtp-Source: ANB0Vdb11yIQzt+FWnYyAUL80JJyVlKfFsMGLMBHQkdvIQVgK6y+QlhUz1+a/21dyZarwhTvbReUMg==
X-Received: by 2002:a65:5284:: with SMTP id
	y4-v6mr24498791pgp.283.1535947562222; 
	Sun, 02 Sep 2018 21:06:02 -0700 (PDT)
Received: from ip-172-31-26-116.ap-northeast-2.compute.internal
	(ec2-52-79-39-246.ap-northeast-2.compute.amazonaws.com.
	[52.79.39.246]) by smtp.gmail.com with ESMTPSA id
	u184-v6sm24118720pgd.46.2018.09.02.21.06.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Sep 2018 21:06:01 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2018 04:05:53 +0000
Message-Id: <1535947553-14966-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] iproute2: Upgrade 4.17.0 -> 4.18.0
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
X-List-Received-Date: Mon, 03 Sep 2018 04:06:01 -0000

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iproute2/{iproute2_4.17.0.bb => iproute2_4.18.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_4.17.0.bb => iproute2_4.18.0.bb} (72%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.17.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.18.0.bb
similarity index 72%
rename from meta/recipes-connectivity/iproute2/iproute2_4.17.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.18.0.bb
index 12812b0..8eed377 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.17.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.18.0.bb
@@ -6,8 +6,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-ip-Remove-unneed-header.patch \
           "
 
-SRC_URI[md5sum] = "6f3a87fe2d97c28214fc2faab2c257d6"
-SRC_URI[sha256sum] = "6fa991b092315887775b9e47dc6a89af7ae09dd3ad4ccff754d055c566b4be6e"
+SRC_URI[md5sum] = "8b8680e91390c57cab788fbf8e929479"
+SRC_URI[sha256sum] = "a9e6c70c95f513871c5e1f4e452c04fcb3c4d8a05be651bd794cd994a52daa45"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.7.4


