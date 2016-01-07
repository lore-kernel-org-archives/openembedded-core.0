Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0883E6FF97
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 20:53:30 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id bx1so310191417obb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 12:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VOlzGlx9bdgG1oxKFP7+rtmrDDz4u+Y4DFOT46vTms4=;
	b=B+DU/uZj8mgtutBee23nXJzYMoOcW26clTmY+CQ/4Q7ktW7F4ENHICwbwEC5wIDcyo
	RQ1D692kA9N+h0NurMz+pEnaP1FcRgWR3CUo0jqxL6xBq/oggRtYhBoh/VMYFlddx6RD
	O/JA8PNByGkJucwu4+dhMDyJTxMn2leHXldNRXUFsE63KIJtrY4/q6kjWTEk70vnNLOl
	2u+LCjYH/79EN929vzuHhe3FePd1WhiBYfiDARhE21+SXncufGqUJxv/Sw4ZYag8RoSm
	s59jERfXPBKvIfSgHHeGdfPHF3zzyy70dPOADFb0n38fAXGgkubTa6QkxZEz1QiKuNLe
	uJfA==
X-Received: by 10.182.28.162 with SMTP id c2mr72881175obh.76.1452200011117;
	Thu, 07 Jan 2016 12:53:31 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	mm4sm42079156obb.1.2016.01.07.12.53.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 12:53:30 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 12:53:13 -0800
Message-Id: <1452199993-3885-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452199993-3885-1-git-send-email-armccurdy@gmail.com>
References: <1452199993-3885-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/4] libpostproc: duplicate armv7a over-rides for armv7ve
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
X-List-Received-Date: Thu, 07 Jan 2016 20:53:31 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/libav/libpostproc_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libav/libpostproc_git.bb b/meta/recipes-multimedia/libav/libpostproc_git.bb
index 4aaa50f..911ae86 100644
--- a/meta/recipes-multimedia/libav/libpostproc_git.bb
+++ b/meta/recipes-multimedia/libav/libpostproc_git.bb
@@ -18,9 +18,11 @@ S = "${WORKDIR}/git"
 inherit autotools lib_package pkgconfig
 
 FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
+FULL_OPTIMIZATION_armv7ve = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
 BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 
 EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
+EXTRA_FFCONF_armv7ve = "--cpu=cortex-a8"
 EXTRA_FFCONF ?= ""
 
 EXTRA_OECONF = " \
-- 
1.9.1


