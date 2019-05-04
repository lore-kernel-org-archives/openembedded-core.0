Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id C428A7D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:33 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id j26so4221554pgl.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NMLPi5vtJSw3H2E0T5UbdwMpHdAV3DVwd1SizTmJsOY=;
	b=ne1gTQCMMezOV9BtJOT7cYp07od+xbqjTZt5v3tZl27K/I/gBk5Ii3/qfyKz4uEz/L
	qfZKei6Cd1wFAEFxfBqFRE719YkNKrdbVRKd61R+G6PQrm6aRIgI72PXhmEAoSLPJXPR
	kG9TaR3Fy4JfxAB8BoWEbbKPVTEt/C22MlgMTSHq5Z0JjbhgvKMmP2pd5v49Z2WFGRe1
	WZ6ZZpIXYs+KTr35BVtfTQ1/qCg080Q99G4vTwaZjBiuyihneO5mn+dN2dvPDJGptzcU
	P/Em4VlIE1R9LPAI+ergLKu0dwPUXYODGTA20F0lf1TNYiV2nLPX7xEQ5FmkjBKTSHzx
	SF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NMLPi5vtJSw3H2E0T5UbdwMpHdAV3DVwd1SizTmJsOY=;
	b=cWCQ5mAerhyjiMZXHtpAT275kaiqtTiMcPqqBjM/L2BccDU35uu6Kk8wk91ZPswbfs
	BujZq+42veTQgwUF7Oyxxhe6YX+CfNKZv+5Cv1PjNBwcWFpyKvtw4/UHeqB1/4A/AXBm
	2TtGGtdOljmAIoypI8yj0C+RJfx00HFgcaeQCkCbnpvFcPCKcTSNC28yXFVi6VElLZ0Q
	r5vwJDfWCz7Ygas08zE4kEmXoWQgjEl6qYTj8dhD/Z82q8AmcNazrKzAhefL7152coNq
	HBPCyinW5NBhtprSg54ZpQ3UDBQ5BjORdvNA6ZK3sGn5A1BC76jp8pXxSfWeI2+NUS26
	GzVA==
X-Gm-Message-State: APjAAAVStPD85ynNwrqkJnWULoU7pzqoGAQRLwjjpE2TGd322lCgZYcZ
	g10vXY2Ns+c67JcFaToxw6nSnnno
X-Google-Smtp-Source: APXvYqwXZymNbCO5H4IRmu2tnzPLapsNSAwSgamH7IgGLuzXPegp16QEcHscyp5Fxn3j5YUMtgiqTg==
X-Received: by 2002:a62:f245:: with SMTP id y5mr20075592pfl.12.1556983654948; 
	Sat, 04 May 2019 08:27:34 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:45 -0700
Message-Id: <3ac1a1973e546360e4fc5626c9a9fcf506c786e6.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 09/43] core-image-sato-sdk-ptest: Try and keep image below 4GB limit
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
X-List-Received-Date: Sat, 04 May 2019 15:27:33 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index 1027ec0..5739599 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -6,10 +6,10 @@ IMAGE_FEATURES += "ptest-pkgs"
 
 # This image is sufficiently large (~1.8GB) that we need to be careful that it fits in a live
 # image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
-# box) and explicitly add just 1500MB.
+# box) and explicitly add just 1300MB.
 # strace-ptest in particular needs more than 500MB
 IMAGE_OVERHEAD_FACTOR = "1.0"
-IMAGE_ROOTFS_EXTRA_SPACE = "1524288"
+IMAGE_ROOTFS_EXTRA_SPACE = "1324288"
 
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM = "-m 1024"
-- 
2.7.4


