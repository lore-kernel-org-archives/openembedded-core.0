Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f53.google.com (unknown [209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3EF1A6FC79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 06:58:30 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id md12so12508575pbc.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 23:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=02ZwxMAXmp9V9pQmJkBsZwrGucpTSqBrh2wQHznw9C8=;
	b=sQmZvQ5mBphtxi5/Cxgrew1yGVotS8vsDhE/Z9lJBFZqQVebxZsU7SDGqrhztFOxpI
	QtME7G8S/yAfvu3ZPOMP3xSXmvZspuC6dXifcNfdUZi/zQTIs0hD7HhE/zjo4SCtEPJ/
	pPH/y5v+JWHlswRWnUuFLh5l9+3c0m/B07xLgAYHS86fE8Hh8Kv/wgC0VCGx0j0R3d/F
	J7ycDyGDoy7WGzmRSVSckPIo4PYATeiBl1DfJ5FAfExPXG9mSgFzJog9Z3dIjG2Sperc
	yjEN9lLmXNp0G/e8kiKWwW/lZbOV9awv+c7QU2IE0pFuS2m+sg6HzbzsFr0k92HOGxRi
	kfIA==
X-Received: by 10.66.122.208 with SMTP id lu16mr5811067pab.129.1401346712201; 
	Wed, 28 May 2014 23:58:32 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218]) by mx.google.com with ESMTPSA id
	sh5sm31748177pbc.21.2014.05.28.23.58.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 23:58:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2014 00:01:07 -0700
Message-Id: <c3c90c0c5be3118ca8521712cfa84b86d8863a74.1401346650.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <195e0373341bceca90bf6d114a4569756d5a4905.1401346650.git.raj.khem@gmail.com>
References: <195e0373341bceca90bf6d114a4569756d5a4905.1401346650.git.raj.khem@gmail.com>
In-Reply-To: <cover.1401346650.git.raj.khem@gmail.com>
References: <cover.1401346650.git.raj.khem@gmail.com>
Subject: [PATCH 7/7] layer.conf: Add musl to safe recipes for exclusion
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
X-List-Received-Date: Thu, 29 May 2014 06:58:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index dbcb653..75ca232 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -34,6 +34,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   gcc-cross-${TARGET_ARCH}->eglibc \
+  gcc-cross-${TARGET_ARCH}->musl \
   gcc-cross-${TARGET_ARCH}->uclibc \
   gcc-cross-${TARGET_ARCH}->linux-libc-headers \
 "
-- 
1.9.3


