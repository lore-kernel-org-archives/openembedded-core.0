Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4306A7846B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Sep 2017 00:58:33 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id d8so1511705pgt.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 17:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CbPfs4LPX3JHlWXMQeWaPZSZGSnB+QMSocXoEp/wzk4=;
	b=NxByUl4phAYXpnXs0ZjaYwSOKyqUkumit1dK9TQFimYTfHcxnGoqWVR2ARDZxVIIVy
	yv+/22rplFj/KFnbRVCk7mfJGRn11Et//magzIG3WA/fsPG7JjZNelaiQGWv5h29b9o6
	QByupWT3vmZcEbVp/VlSThel3yxCHHmgkxPI4OU4nuH3/6WmbakeHZ+iy+9w1uM8rm/v
	hlf+zj4hjPgYnvH62qhBZrOgFQEd/zZhivgaGHziDCODoVfvux6SW8Q2Envoe7gekpGc
	3Mh4TVFPcww6hVA3SW2HEHGKC7KYe/0Z2QXzimyqIKp4NjLVFQfRiXf97hevWIWVk5kd
	rvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CbPfs4LPX3JHlWXMQeWaPZSZGSnB+QMSocXoEp/wzk4=;
	b=slZ40A2kiK4D/t0bB4dYdoo4aJrTlt/gzdzU0hPNnHtTJNy1G5isDqFC6JPOLIdKST
	L3RGSrrmWAYWt/bApgTn2LC6J/IRhTiCl5Ob1f1Ymff2oSxZuo0IPEN0SbaYXbGL6KTB
	y/cxRUu/E/W5PoCISMzc4BYryoz2u13GQR8UPTIOjlcb/nzG5y+/Cp7pOY5+jg0W+94Q
	Z0CCjVF48jDCuOfLuYLmyUm4FbFMZ4mJSH/mnkVtlvPxFXtugfwXPE/mFgqJvh0ayupf
	cVnK5BJBCyRb0RTa2q/xjBnO5QyD6S5+6IADXfYagWtSXNJMQDnFU9Y+Pr/2cc17N98A
	jmog==
X-Gm-Message-State: AHPjjUhAy5JTuAcMCAbHBdMiKesA/PO5anIumxH2cTczgzW1fiGaQyzL
	M3ouDLbyAVJSOxvB6Fs0a1DiIA==
X-Google-Smtp-Source: AOwi7QAcYmFqOSDiS1RBPWv2vW3E9VNOQI3HPe2OFFO+KmmhyXieF/Cz6ZNLkOcIvT9nPWczMDY/Ig==
X-Received: by 10.99.106.67 with SMTP id f64mr772603pgc.101.1506128315377;
	Fri, 22 Sep 2017 17:58:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	b66sm1151521pfe.165.2017.09.22.17.58.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 17:58:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Sep 2017 17:58:22 -0700
Message-Id: <20170923005823.10278-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170923005823.10278-1-raj.khem@gmail.com>
References: <20170923005823.10278-1-raj.khem@gmail.com>
Subject: [PATCH 3/4] go_1.9: remove obsolete overrides
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
X-List-Received-Date: Sat, 23 Sep 2017 00:58:34 -0000

From: Matt Madison <matt@madison.systems>

Now that mips and security flags fixes are in place
in the bbclasses, remove the local settings in this
recipe.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go_1.9.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go_1.9.bb b/meta/recipes-devtools/go/go_1.9.bb
index 08ab793f86..c67e2cb050 100644
--- a/meta/recipes-devtools/go/go_1.9.bb
+++ b/meta/recipes-devtools/go/go_1.9.bb
@@ -1,4 +1,2 @@
 require go-${PV}.inc
 require go-target.inc
-TUNE_CCARGS_remove = "-march=mips32r2"
-SECURITY_PIE_CFLAGS_remove = "-fPIE -pie"
-- 
2.14.1


