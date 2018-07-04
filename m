Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC5F745AB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 20:06:57 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p11-v6so7587358wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 13:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=X3ccuJyjXzg9guKusPbsZRizadKuwlF4ixO3U1IOoE4=;
	b=Uxdjb5xEbtLtjSdrirrK8GwjsOEJEk7nvr90M7/+l6Gef7YsXeFC9kfuvGBJP3SRT8
	jM1UETwiiCgFraUrPqmeOI/fN1p1wS8Zj/0Ymth7Txtv8iKAt/XpnieCj9A5lUsfy3hq
	8uTmYX5E9gxSBHA/j30crOk/VPSOFXYLc3IbYNIqiyb6nGwxh2mr0S8dbHXMTQoDFxHK
	gTLC8bpmf+oJ5keBFStciDjA61F5y6xe9X/wWiYZt15BweP+ZuyoV23SY9dsqXT5gPpn
	IWmVlVXy1OPAxoyRMo9LGyFXOee/vRKPAuqEmLmFRN69t+uXp146XcNJ5ytbtpkN2rR2
	VBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=X3ccuJyjXzg9guKusPbsZRizadKuwlF4ixO3U1IOoE4=;
	b=MpebCpaS27G2ckj4YEhJoWWOI6wVwxMoVxz3Qe05INmoREWwX55MSaXaI8QvQmuQJq
	ij9+fHXR6gzH0SZ7lmj7IYlyEob+FXsmRiPlTBjNQQ4WukpYBgOWJ8ZtruQxLm3bZrTB
	kKtr7QuvYG6n8jZoKG1Bl1BAs51STbgjpl9YaRpyG1kwrhdXkW8bVf/1R+YaEZ5N6dH/
	MJtuatngVcm+fesHEnUzntJkgIxk0b7U0Tba09GTHALskde/lifg4LmWANkWm/zLo4zG
	aDQUf8sYBBLOtm+7MDQc/wjmIR591F+C+vl6gHF7C91wN6Zwq79RMHkiOptVgn1xEav4
	xUlA==
X-Gm-Message-State: APt69E2s5WqkFOs+0wDtl/vqC7Ee3elg5dPKauRPVmBSFX/L4XpbD6gE
	Q87loxFFfaHIvPXUQNW/PPQTbQ==
X-Google-Smtp-Source: AAOMgpcrwG/SZSZkgwy+pzkno2PGofUL3c21xlUvpobeMy2lN2oXuGIjZjuhynGU8zO4/vZuvx/D0w==
X-Received: by 2002:a1c:eb08:: with SMTP id
	j8-v6mr2655093wmh.160.1530734818065; 
	Wed, 04 Jul 2018 13:06:58 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	h2-v6sm4916800wmd.0.2018.07.04.13.06.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Jul 2018 13:06:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2018 20:06:54 +0000
Message-Id: <20180704200654.285-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
References: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
Subject: [PATCH] Revert "kernel-devicetree: Corrected normalize_dtb"
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
X-List-Received-Date: Wed, 04 Jul 2018 20:06:57 -0000

This reverts commit 2e7f3b2b9318d1e5395ad58131eafb873f614326.

It was breaking quite common use case that the dtb files are in
some subdirectory and then kernel build fails to build them.

As reported by khem:
http://lists.openembedded.org/pipermail/openembedded-core/2018-July/152578.html
me:
http://lists.openembedded.org/pipermail/openembedded-core/2018-July/152579.html
on raspberrypi3 build:

make[3]: *** No rule to make target 'arch/arm/boot/dts/dwc2.dtbo'.  Stop.
arch/arm/Makefile:345: recipe for target 'dwc2.dtbo' failed
make[2]: *** [dwc2.dtbo] Error 2
Makefile:146: recipe for target 'sub-make' failed

and trevor on the IRC:
20:35:49 < tlwoerner> the recent 2e7f3b2b9318d1e5395ad58131eafb873f614326 commit in oe-core seems to cause dragonboard-410c's kernel to fail to build
20:36:26 < tlwoerner> for the dragonboard-410c, KERNEL_DEVICETREE is set to "qcom/apq8016-sbc.dtb" but the build failure is:
20:36:37 < tlwoerner> *** No rule to make target 'arch/arm64/boot/dts/dts/qcom/apq8016-sbc.dtb'.  Stop.
20:36:44 < tlwoerner> i.e. the "qcom/" is getting removed
20:37:08 < tlwoerner> oops!!
20:37:33 < tlwoerner> wrong copy&paste, the actual error is:
20:37:36 < tlwoerner> *** No rule to make target 'arch/arm64/boot/dts/apq8016-sbc.dtb'.  Stop.
20:37:53 < tlwoerner> i.e., the "qcom/" is being stripped out

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-devicetree.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 7faa869493..9c5e125981 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -13,8 +13,8 @@ normalize_dtb () {
 	dtb="$1"
 	if echo $dtb | grep -q '/dts/'; then
 		bbwarn "$dtb contains the full path to the the dts file, but only the dtb name should be used."
+		dtb=`basename $dtb | sed 's,\.dts$,.dtb,g'`
 	fi
-	dtb=`basename $dtb | sed 's,\.dts$,.dtb,g'`
 	echo "$dtb"
 }
 
-- 
2.17.1


