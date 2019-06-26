Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2DB7E692
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:47 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id m4so1501760pgk.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=F9fbS9BYAwTacfw92qzL84BpBcirwOukCTcUSCeaMBU=;
	b=EQf2PoqRfzvouspPrDzp0VOLyxTbt9OttdX7kMqnmx06TfHkJydp2180TEuEez/kSM
	2z4m1XMCBHAUQrNffcuTIBjPW+SvAROa7szFNpqZFhM1GmXTuiDIsjv+v52VxpMa3Pfx
	Lr54XTzwnLjyH2jIWoIpJKmdW+tFY4+z2yKDfAnTjCRhY8+eaiCqRYsTU6NuZonaE4sM
	qqoZ7Z/bOGU3KW48qAWBGXwGBeWlF1pyqFAVuyZ91wkEOCxhWYYezPLjCLYdz97zRJGD
	LQ2D2OaaavqYGLFX8TXzOKijhV5LoWj5JE/4TZZVzpdVJWSWc9/ySJqn1Df2T/cmQKNy
	rniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=F9fbS9BYAwTacfw92qzL84BpBcirwOukCTcUSCeaMBU=;
	b=ToNQoe1jxkHep7yz1svmLAQWTtOZFOqS37NZVkMxjiTFdfk7bcUkd599B3limJtaI6
	pBn7xFmXcodAXNnCItI5CdibRdGso80tyBekJu6emZm+pVH8H5thBMz06i92FgPzMoQi
	YEhSdlgLfIdSJugoMwlkXdc5G2nY4OoX+wuO0qTjgK1pSzV57m6QlPWJhmoc/L1FVc8g
	i+G++wcYjjQEndiTx7lidhg8/+4wOWblyB1/QSMlNZOIeyRIpuk3hKcoLk8XHiDb2oq3
	eXR4EE19ZO4OeuXL8xghudkLErMfWC6UIf+vt8rRatvuhBy2t5KmkH7IDBa1r48ul30X
	xv4w==
X-Gm-Message-State: APjAAAX6Q7KXOYn0hf0gfuJKcXqglvU03CHWk9GANzb1bge6H2UGCCx0
	ik1hRrZeP1n5sAcshUerwvEmWpnj2zw=
X-Google-Smtp-Source: APXvYqzPZQiDpIoz53vDSUP7K6i4sn3A3KLOOuIhAH29GlBrAismIUIyCeEen7ttt/31NeZZusFgkg==
X-Received: by 2002:a17:90a:a397:: with SMTP id
	x23mr48295pjp.118.1561568028148; 
	Wed, 26 Jun 2019 09:53:48 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:14 -0700
Message-Id: <025cd45d4129266d34a919573c02a8504f092c1b.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 13/25] go-crosssdk: PN should use SDK_SYS, not TARGET_ARCH
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
X-List-Received-Date: Wed, 26 Jun 2019 16:53:47 -0000

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


