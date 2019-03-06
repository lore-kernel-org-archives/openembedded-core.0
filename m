Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 797C47CC14
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 07:43:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44Dm3P6BMtz4K
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 08:43:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551858226;
	bh=ByPyNA90YZyQdfKidWZHC2sqWTtBNCZiz3bT1Kuhz1o=;
	h=From:To:Subject:Date:From;
	b=bcn242XL5agnmN2oimka4Zpk2ZtOBmCgNnxhg4RZmU682vKMkplxSY9x7r5SGPN6Y
	1lTd7BgZZ3GT4Xn7FoG/RpsV3W3FB3euPrIXqYrxuPgONqAvhm3bkrJSG3MNmXjgvF
	BDJviHwRYB4PxaT+5WiZDVr2cESTiy/ssZYKJYwXd+V+XVKZZHfow+5lEE4La9yNjU
	snZe8s/8x2BAmqVFPgsOJQk8FFhSqW4T64gyA9xPwKt8siUQTAG/2qwf+w+mB8i9CN
	63s4PS+Ud3GdLUex1d4YwrwBz7E9exVzQIbTFm0f2Qd7ij7KyJDBgZbN5+g54a8CcU
	u9dQtolo/D+KCUmc6udWyW516GdNFgBOr1lIP8SyAbrhjfPHROq3aQLfDzc6Qd1JLE
	iys5HwmtV13kBvTjxtItrEsVvG9hMVl2ycrJcnl08PoB7Bh5W0jsvvKRI4jJiSPuzZ
	EHQnY87eToDlQ+omTtWsBh2eKQfS59RPYibWeuXZQni1govzFYQRG0GEXEYwvMwQ8O
	15Lgm1x+YBawG+jAj3JuU7CSK2rvGVw83i9XhgRDX0K3DowfkOgl31Nq0cJ9p/6A2R
	UR2L8Ni+ITYUfnV/WTQqQiE/AY2I2ErSGCEGQZTZ8rDWyuW/JjvCtB6TfIqm5BUYhU
	axxChDAGAWD8p9aDnnNUpAf8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2019 09:43:43 +0200
Message-Id: <20190306074344.11553-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] rng-tools: Don't depend on libgcrypt when the PACKAGECONFIG is disabled
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
X-List-Received-Date: Wed, 06 Mar 2019 07:43:46 -0000

PACKAGECONFIG[libgcrypt] already adds it when necessary.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-support/rng-tools/rng-tools_6.6.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.6.bb b/meta/recipes-support/rng-tools/rng-tools_6.6.bb
index 4d91216e32..d3361ae4e1 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.6.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.6.bb
@@ -21,7 +21,6 @@ DEPENDS = "curl \
            libxml2 \
            openssl \
            sysfsutils \
-           libgcrypt \
           "
 
 PACKAGECONFIG ??= "libgcrypt libjitterentropy"
-- 
2.17.1


