Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1808D74876
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:37 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id x4-v6so11754184pln.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rk8KwGT2wiYbViuYp59Gd+SVBzvGPozUJJkKUpF3oF8=;
	b=OpS7/8O2trTq2NARRZHBOjSHlfysGjLQgLGwITwcC9VTE5wFO9VrKy8l1mGWdG2aYa
	YIqXPt+9Mq8fOlweeYX7RFUJl48utBxNE4yYJyHlXjf5cT2gu+juN6ORDfI6QRLd1Va/
	6LviHRQhhaWnZ79p6P2FwXNZa+cQn3hxSAJ+fH7aylh6qzE++sorr1CzL9vtq13w5GhI
	V3czAZvoom9D5Qhhg3OXIUZh5Ih9c10tB4ys7ObxCL1mQKxrKQgQ7Z2TvUYspmLJwy2S
	1Bo/WdqpMEQ496EGbSL82l+L9DZnXA0OLez5CRH0/JKbIVIyM2DP5yRuPBlMOgY01j1x
	kwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rk8KwGT2wiYbViuYp59Gd+SVBzvGPozUJJkKUpF3oF8=;
	b=Oo0HU549gXYdcyrH0/ZNV7MpQgJFXl+BDY1XXWEpKuqti5+65PbsMN7Ohs/KsbZooh
	UVCVHDJi7RLVOmGzw0Y6I+J1iWrnhSxRyyhaQUMV+zIKGj3MRRynN61DKkHlPxAG0IPr
	PAqV7gd9wF7to5IRC3DWP+NFB+W/CIqc2Iuk8KMLrttRsCP4UdlE+4Cb245OkzGLmIVa
	ETPgwMPl3rfnHMnwT1U0wPXQzx7v7fW1VzpqNS0VbdVwp73ERajSdR3/PBuRLFxMHKs2
	mMDomxTdaZfU54MrsUTP4g6LnSyzkyzebEHkHnVrj65hovrQWs70T9ivPRALnD6vub7R
	Q55Q==
X-Gm-Message-State: AElRT7GWZsS1+ZFF07dcsxZ9P92CAT42IoXyWtjVMw6aYjjukclF6ljT
	bg0lLJ7lzWHunHbr/jYayeVFCA==
X-Google-Smtp-Source: AIpwx4/dP935eg7abUrPsJBiXFTpSoIBRUdCkZc4x23NOM0XPkJQSnBIRNAqqBetEWca8kYVRIfkVw==
X-Received: by 2002:a17:902:aa86:: with SMTP id
	d6-v6mr16832254plr.375.1522806579085; 
	Tue, 03 Apr 2018 18:49:39 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:15 -0700
Message-Id: <bc4d387c465f57fe1e228e8815d232968c6af01f.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 16/21] xf86-video-vesa: update 2.4.0 update
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:38 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../{xf86-video-vesa_2.3.4.bb => xf86-video-vesa_2.4.0.bb}          | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vesa_2.3.4.bb => xf86-video-vesa_2.4.0.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.4.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.4.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb
index fa251b5..5c1356d 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.4.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb
@@ -9,13 +9,11 @@ can drive most VESA-compatible video cards, but only makes use of the \
 basic standard VESA core that is common to these cards. The driver \
 supports depths 8, 15 16 and 24."
 
-PR = "${INC_PR}.0"
-
 DEPENDS += "virtual/libx11 randrproto libpciaccess"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
 RRECOMMENDS_${PN} += "xserver-xorg-module-libint10"
 
-SRC_URI[md5sum] = "a893c37c589f7a31cea929a5d896a0e2"
-SRC_URI[sha256sum] = "7bddf4d879dd6f67088ecb203a31e12334aab980174bd0909930a21f32e251c1"
+SRC_URI[md5sum] = "8134201beaf6f77150c7809c3cc802e6"
+SRC_URI[sha256sum] = "bf443c94d7bf6cd4e248f8a3147f4647be04dc4c80250d9405006263bbdee38c"
-- 
2.7.4


