Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5819B7769F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 21:42:47 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id b5so7391855pgg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 14:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Vbis2g26e8t2c5js9i4pnZLvSNUax4Myr7WW2lDMAdY=;
	b=emjYCCxemXBOCXzHlWiXni3ae5QdaUdAcJkCrL1eZmoR+9xeIHMkK9yyEQthia1DS8
	enY8JOZqyTgB1Be7UluY+cMmoKUWViG2nAMAiJTKIFn8aiWOe4vEcAxH6Zqwd+RPOi26
	WjDDCkEtG1Iq+6/2la1PWbI1+3847rP5dJGZqu/f1TUh1UR90M+iP4PTQtjJr4DrUBYw
	S7jZmlaSvSr7CEZL83UKuAhl/XyYG9Au9pZvhhzvA2H299LLTsbRrB9g19+Ie8EFMfJ/
	ZXJ3JpubWr4UZo5YAtJN5yf9G+pJ+phUOOieOpjFoI7+X/762vVdg9N9MnuSEkUFgEI3
	nq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Vbis2g26e8t2c5js9i4pnZLvSNUax4Myr7WW2lDMAdY=;
	b=rkid3Eo0OrTTu7sRzCQaQAFupwMY0rThHPOcx7yzIvtiA0le6MQcw1EiGiPSo85M54
	Y61Peg8I5et/ZScBLS6nHZ8i1PwDF//4x/GEoNHOicw7HfFqnYyvgMTdSJ9R38bnxcPt
	OYGKdbYZxEr2OfY0vl7KM3d/mvTEFdMnilK3V4OeKN68lbp+wrYYXf/0MJJ1EnzbPUay
	Ct09RZr1qZCKuy2RRdNZ2vEz4EanzIQvBMkRfby0DY5P/RoddhO5UZt7XcnL9Op13R4f
	fDP8urLM7hPv+Mfslh02oJ1Ga5pCYElq5lPQ+YmiRFoTBK28ztNt6Ow0B12x6yGAiziG
	U9Bg==
X-Gm-Message-State: AFeK/H0jMgdnOVhQkELKAULOn4FUUlLwH8PEoqZWKPahSxvBsiT5cUx9Oh5g0R4C0efsoA==
X-Received: by 10.98.150.87 with SMTP id c84mr12776198pfe.186.1489700568610;
	Thu, 16 Mar 2017 14:42:48 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a78sm12357493pfc.25.2017.03.16.14.42.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Mar 2017 14:42:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 14:42:39 -0700
Message-Id: <20170316214239.16243-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] go: Remove mips32r2 from mips
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
X-List-Received-Date: Thu, 16 Mar 2017 21:42:50 -0000

mips32r1 is only one supported for mips32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go_1.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go_1.8.bb b/meta/recipes-devtools/go/go_1.8.bb
index e7a6ab277e..091b1318af 100644
--- a/meta/recipes-devtools/go/go_1.8.bb
+++ b/meta/recipes-devtools/go/go_1.8.bb
@@ -1,2 +1,3 @@
 require go-${PV}.inc
 require go.inc
+TUNE_CCARGS_remove = "-march=mips32r2"
-- 
2.12.0


