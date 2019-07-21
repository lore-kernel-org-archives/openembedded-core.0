Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4364D7EE6C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:36 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id w24so17894647plp.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=F9fbS9BYAwTacfw92qzL84BpBcirwOukCTcUSCeaMBU=;
	b=QGbqlB2YdqmtA3nbLNc5zQrAk25quH1J+PZ7VTat96HO8+VdIx3ftFBTId0J8H4Sw0
	5y3YkQ1ey2mt728kZoBstNzmC9c0/o2d6LDngB+ZM4suBny//1eP23iNTZvAXftLJdjn
	Q0gdPo+oDNuzKpArbep9EMgM0ApncQ2DTAD90o6jcU69jkGNwWnX+s6qlIxdstZTh2/2
	ZyruoPnXPJ4rO6oDtWMuilwetdEnCWRtrFviHg80jhJj6u62SFQ5DhWUsf452uVCQPL1
	ceB3baoBREAMkaiTuIW9wdTFM8qNDxUPJ5jkrSQK4X3e6l1bMYY9XrFXx5eKLmCRuPb3
	oWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=F9fbS9BYAwTacfw92qzL84BpBcirwOukCTcUSCeaMBU=;
	b=WW+kn3yFN0IJ8yI0ADfr1FsFzh1w0wTrWHawgjS8Z9yc/Fur1Tt6ouq1cwYDpT+9Ad
	HOzYZS2UICiAkyjlG2591nYQaoG+5HRLSbRVo4egGV3SqupqUfKVzRUJa4cHgnOb/E0X
	kuht+7N9WT9BuiFxTIsFtDjga928rMeGRGlIK+CNIbHN/CSCFgdI0Puhxwc2RiZuKimV
	hd+clgQXONAuVdSgXe62WDEaouoW9gKuq7asxu2Ht2N/GRdloi5WZcoC5CsjNWYM15Ao
	uNWBrzNdIsTTBTlFhbSL1HcQenf41Btjn/DNc2PdH+PiLXoVdJ/5Cg5fNkPzIwAaiC/i
	aD+Q==
X-Gm-Message-State: APjAAAWWM8wHQ6yQsioam7Pgf+KBJv3bNnUABi4ryoWhOO+FH/d809WD
	dsXn0oKM2INXB4PSPo29peKVlZle
X-Google-Smtp-Source: APXvYqyRvJCaylQzI9Da1GRgNkox38EyGsswq1b+RUpo5/nWBCnwCYd6MKLtiaX/Nu9lpnweXRmBew==
X-Received: by 2002:a17:902:b603:: with SMTP id
	b3mr71184810pls.9.1563719137451; 
	Sun, 21 Jul 2019 07:25:37 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:02 -0700
Message-Id: <025cd45d4129266d34a919573c02a8504f092c1b.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 13/30] go-crosssdk: PN should use SDK_SYS, not TARGET_ARCH
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:36 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The crosssdk dependencies are handled using the virtual/ namespace so
this name doesn't matter in the general sense. We want to be able to provide
recipe maintainer information through overrides though, so this standardises it
with the behaviour from gcc-crosssdk and ensures the maintainer overrides work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/go/go-crosssdk.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index 4391b32..94f6fb8 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -1,7 +1,7 @@
 inherit crosssdk
 
 DEPENDS = "go-native virtual/${TARGET_PREFIX}gcc-crosssdk virtual/nativesdk-${TARGET_PREFIX}compilerlibs virtual/${TARGET_PREFIX}binutils-crosssdk"
-PN = "go-crosssdk-${TARGET_ARCH}"
+PN = "go-crosssdk-${SDK_SYS}"
 PROVIDES = "virtual/${TARGET_PREFIX}go-crosssdk"
 
 export GOHOSTOS = "${BUILD_GOOS}"
-- 
2.7.4


