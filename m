Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 02ADC71DD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 05:01:42 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r123so1836967wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jul 2017 22:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lScTmoiPiQNlklyXww5cImHJwSFJsRukZePgcfvSJ90=;
	b=kaDSh2U6Yn1N3Xh0M2GAsr3x4z3n3LLLWmRfMb6i6xy2JHZolkb5rEmAemaJZRWh9D
	Df0UStzSCKb2D5wFPZvicCf4FBhyLGqFfod5u2iZIechbgLNdPED8VxiR5d4+uG5eT4M
	QIrvqQ0QxqiqabD58Gb7b+9A9pQrJLsAEbN9u6m/6+QygsgoWuHY3itaMg7MyF/Sqk5y
	lepbfhlyud4DMKkmWDj6BJtzrjf7o3GXsi9bHVhhThgLwjCl6OllruHLWYjnHRTB43BZ
	wZOxGfWkYMDmV1AuXY8raZzGdQdBHEk0GUd4FM8do07En81SXmpWPzVTijlrYokvm1cI
	N4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lScTmoiPiQNlklyXww5cImHJwSFJsRukZePgcfvSJ90=;
	b=LU/Fvi/1HvUP6mnbPPLb2cAcjTPrlirseHINQqRK/udjePS+Bx8UqclnneLJVBaoPy
	REpVAqyds3D58K91ZLX6c/etlJ73iAsMODMUXX952cfBAV7HU5Lf9+YUdweltzCQSYuX
	C9vHEkGHxHjUJxZKk+WOA42sPstWjBfN1PfSQ8rbVdweAk6KtSkA4HjzObygeJLL99SH
	LwA0TAWi8bo2BIASflSvjpEg7Po8PGCaytPegFV5yGs5FuWivtRsyest9sVZ5afthhSp
	6sdghtUGQje4B0fceKVQux9x/+qiWvmUkdasTy3QD9GPew5YjT171GR5dU/3oi+XH+o4
	trhw==
X-Gm-Message-State: AIVw1131vyp902Gu/uBWNFu0DDUp+G2Fp4r6OwTiC7D/wJR8JbaEI9lb
	Dd3sVCOTqMTS8IIK
X-Received: by 10.80.174.186 with SMTP id e55mr3082193edd.166.1500872503658;
	Sun, 23 Jul 2017 22:01:43 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.192.124]) by smtp.gmail.com with ESMTPSA id
	m59sm4277838ede.94.2017.07.23.22.01.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jul 2017 22:01:43 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jul 2017 07:01:25 +0200
Message-Id: <1500872485-6130-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] buildtools-tarball: drop deltask package/packagedata
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
X-List-Received-Date: Mon, 24 Jul 2017 05:01:43 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

They are redundant since nopackages are being inherited.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index abdc7fe..be37c44 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -46,8 +46,6 @@ inherit toolchain-scripts-base
 inherit nopackages
 
 deltask install
-deltask package
-deltask packagedata
 deltask populate_sysroot
 
 do_populate_sdk[stamp-extra-info] = "${PACKAGE_ARCH}"
-- 
2.7.4


