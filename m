Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 64807745D4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Jul 2018 14:45:42 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id bi1-v6so4875594plb.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2018 07:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=zVPWdAMYkc/qsEXVyGhDKdHvU3+46d7qRTusmHIshOc=;
	b=a8tE10x5ZS0FNEMEnPoPGw54x2uJKcV2xCgdORbSl+840aC0iTl9PIUEUpQ3NdKvLC
	VECLbUEMdHrIqYcSLZbjqH59CHawOF1L/l9rxl/zuJqEZsxwStiF53ZPue/nrsNZH6Pe
	UVVoiycDooYo0BVf3NjYrDSreI/GF7PtBTqWwcR2HucafStP6pVyiyzzOBydLRhFgJGd
	bT4PnGSkjyxlOsvBJVP7gUkZbGrXrm8sD+7TIln4fnI9zh8oQ72/crWnzQPsclDtADpv
	UCdwZiPBV6/vqA+CT8r46gZjR9/0gh4M2qxowono8aavuHJrbk8CZJTt+k/saKvAw6rI
	HZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zVPWdAMYkc/qsEXVyGhDKdHvU3+46d7qRTusmHIshOc=;
	b=HlSSRn1WYMSVbK2LoVWWy7Zh7ch3AxkpvFKpiouZecOU2WNNv1jXTVK0mni+eB0fAl
	00UrDePTNub5EZxn4N2pZAIFCnvDyJp/tcxpDWgI3unrFTPICK7xkyDb9YVwRBN101MH
	pSlzmV65z+bDXYNeZ8Vpwz1B7Zhp6oxXNKA1h2b/BL2v9rnvVWanMXRVMIiS+igbyUU0
	dmVCA7F22MQ175LTlx3go8cAEiErAjW9WFPgDX323mR4vJFwHSPrRKFdGLPhi3aDmx3e
	ZhD/q5lalei1CKuUNWTMa2AF7f9P0QWHGa1FtVjX3oeThE/e7Lixly+nKwA5ei1Q1wzB
	PqWA==
X-Gm-Message-State: APt69E22K6dvOBFqZNzRMObESced8bo4PqxnM8BWCl5YbenV2rEQBIZo
	t6cGm6SuFcxTjwduz9syCvM=
X-Google-Smtp-Source: AAOMgpexkQ6Pxe1FSomhKBHUH0qoEFZKu580mpwVCLnX65JHPrMYgQv3HVAnbwtZPAYjbyJioFallw==
X-Received: by 2002:a17:902:422:: with SMTP id
	31-v6mr17053543ple.320.1531061143593; 
	Sun, 08 Jul 2018 07:45:43 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:3c1b:9cfb:14ee:ef7a])
	by smtp.gmail.com with ESMTPSA id
	e186-v6sm25076064pfc.13.2018.07.08.07.45.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Jul 2018 07:45:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2018 07:45:39 -0700
Message-Id: <1531061139-14602-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531061139-14602-1-git-send-email-akuster808@gmail.com>
References: <1531061139-14602-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 4/4] libxxf86misc: update to 1.0.4
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
X-List-Received-Date: Sun, 08 Jul 2018 14:45:42 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-lib/{libxxf86misc_1.0.3.bb => libxxf86misc_1.0.4.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxxf86misc_1.0.3.bb => libxxf86misc_1.0.4.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.3.bb b/meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.4.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.3.bb
rename to meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.4.bb
index 04fe962..45b0673 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86misc_1.0.4.bb
@@ -15,6 +15,5 @@ PE = "1"
 
 XORG_PN = "libXxf86misc"
 
-SRC_URI[md5sum] = "6bc0bf78909fd71021c466c793d4385c"
-SRC_URI[sha256sum] = "563f4200862efd3334c33a669e0a0aae5bab31f3998db75b87a99a697cc26b5b"
-
+SRC_URI[md5sum] = "37ad70f8b53b94b550f9290be97fbe2d"
+SRC_URI[sha256sum] = "a89c03e2b0f16239d67a2031b9003f31b5a686106bbdb3c797fb88ae472af380"
-- 
2.7.4


