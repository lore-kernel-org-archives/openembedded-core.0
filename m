Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 444EB600BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 04:59:28 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 201so1351513wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jul 2017 21:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Y5F67+zP16aUdK1Gyt3ZXELt763clV/tpyhmw8vDayM=;
	b=BXVt/Sdsqa52KYSja0QdrI+36rkInHZlj8/kzdmWlKJQp9I5y7VB0rw1z3sWZgZKtY
	62AEFDVwlm2l5hLUBIE1wbv0laWmzI+P2TCMmRU7FFBM7xE+fbgcG2dVRbG+l0mXMJrQ
	Af+5Qt7jknmzjoxbrMGt4u1akDgMjNUgb2nj6IVXU8phi5FKn+2XFQ+QgUUoAUba3iyS
	3j8FywsOob+PU9UuDo6YQf5c/1e7LJEn2hMYdKwDKP91muQ3awzB2dklx7SAxoPVCZMS
	yLIgBcHRXT0q7pohx990Pn+nwSNoRbj8j5z4dBNPECc7MLVyZEqNxOvh6oxClXOEZWY5
	4aEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y5F67+zP16aUdK1Gyt3ZXELt763clV/tpyhmw8vDayM=;
	b=oNPKTCSpK4+B8Kweuap3WcwlzVToU/SAJ6o4vHfR36IHE04iTxTAB7XAg5e2klt1li
	2V2azLBRjR1HecgqYraEqUjZ4sDHhnJKjGuDWIBPzUS6EvcK/+0jhGyclnx/x3KYXwW0
	EUcCtevrIiIn6aewwMF/FLi9LQKPXs1RXN+BCBYDMVYHdsa3uMsu+8IxM7fV/h/48mmv
	8IAB8X3PACIv9r7P8ZiOIBKMX5uemuzUBnid4vUC6rID+smzwPLlfcjQAnrWmGVzVQXV
	LuwL+nhK+tfBZ5ub/Pjo2iLkd4WEqwJBkAPAtv8yVEzIL5DUI/PgkQL5M+p8AI3hrzG/
	8TSg==
X-Gm-Message-State: AIVw113X3qBL48GhQDR0KLCNGQgmrOMekfctQkdaqaQRdcUM508hop3N
	UTKFcTjOp3FGKVR2
X-Received: by 10.80.151.157 with SMTP id e29mr4680906edb.61.1500872369147;
	Sun, 23 Jul 2017 21:59:29 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.192.124]) by smtp.gmail.com with ESMTPSA id
	m53sm6030953edc.29.2017.07.23.21.59.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jul 2017 21:59:28 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jul 2017 06:59:12 +0200
Message-Id: <1500872352-30616-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] uninative-tarball: drop deltask package/packagedata
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
X-List-Received-Date: Mon, 24 Jul 2017 04:59:28 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

They are redundant since nopackages are being inherited.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-core/meta/uninative-tarball.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index f3fc1eb..5fabf7f 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -34,8 +34,6 @@ inherit populate_sdk
 inherit nopackages
 
 deltask install
-deltask package
-deltask packagedata
 deltask populate_sysroot
 
 do_populate_sdk[stamp-extra-info] = "${PACKAGE_ARCH}"
-- 
2.7.4


