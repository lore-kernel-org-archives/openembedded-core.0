Return-Path: <liu.ming50@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8A0526004D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 03:49:45 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id k21so2142214edq.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 20:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=cxiDE+rhilHiUjUXQtDrMVO7GFfbuTdTtTj6oYfqnCM=;
	b=iVP8/CQY67SRmfC66HtPfr5t77UvrhRBnx2J0+sF9X4/Z3Jv1yIi5Ctnio5Cwvm8pH
	iSTL+MDnLJare84cx0Yt8xFATr2lilPvPs4n2bAakDPseS50E/qiApwKQvYatnHfQePT
	6CHfbThPB1o//e1Rm94Zo8nPqfTT5xpKvdOAOqEvzpk8JB6CR+ixxldH5yqxPJKv9NHF
	S30lt07y1xhluoeY6uyXsT50JsRjdM7giK+wl6BggrkDjFFpHaP85JfyptswFlBzZpgQ
	CEEmJVmUuaIgh+Ac2NmlcDZ94DRebYmx6leA2W8vNWcvX3meVnm8pkTjx6FX8nwkDvNd
	PdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cxiDE+rhilHiUjUXQtDrMVO7GFfbuTdTtTj6oYfqnCM=;
	b=QSXjDCm+Uats7hqIdn1/1AgI0EdMkQGtgFEe4RN0NqLywbYiNzKh4MoazNmX+9yS5e
	O4WjDeXxMdZEVelJpfk7IVxK2ZR6AFe2Fyb/xlPy5LrvgsTku+EDyneNZjXE6MK3EVmN
	1ZKXlVyFydy5ieh79/hl4ww6SxTNYQtgS/uiNtzucIuov71HktmTbKQ6t4yNm9Piqjcm
	2Y5CJulOIKFoWjpgvth5BoLlr+nBPGYZW5xl2GbKcKokj5h9IvCd/odGIRIa5RWpY6nK
	c1j9pM44EsHLb6gFTVBP5bLs0AEJ7mzyFHOp2i2MmXkzhS2i6PkX0a6FxFbla2Oj13tQ
	4Dog==
X-Gm-Message-State: APjAAAWBKQ8dJx+bjrk1W2SK744/UGJq7N1eJ/IgdGnTQbDoGR2X0LwW
	ah13s/ykRxt3j3Xo23O8ajs5JMVfcCQ=
X-Google-Smtp-Source: APXvYqxxW1tmXaFEyiWK2/tjWMrNL/4xqBUY1dw33+ot02VL1SUGXD0s/ZoHf4Dp3a5vqSHSl2hWoQ==
X-Received: by 2002:a50:9646:: with SMTP id y64mr26401192eda.111.1561952985979;
	Sun, 30 Jun 2019 20:49:45 -0700 (PDT)
Received: from peterliu-Precision-7530.toradex.int ([27.191.202.62])
	by smtp.gmail.com with ESMTPSA id a3sm3138184edr.48.2019.06.30.20.49.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 30 Jun 2019 20:49:45 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 11:49:36 +0800
Message-Id: <1561952977-22702-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: stefan.agner@toradex.com, max.krummenacher@toradex.com,
	luka.pivk@toradex.com
Subject: [thud][PATCH] uboot-sign.bbclass: Remove tab indentations in python code
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
X-List-Received-Date: Mon, 01 Jul 2019 03:49:45 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Use 4 spaces to replace a tab.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/uboot-sign.bbclass | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 8ee904e..afaf46f 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -80,16 +80,16 @@ do_concat_dtb () {
 }
 
 python () {
-	uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
-	if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') == uboot_pn:
-		kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
+    uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
+    if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') == uboot_pn:
+        kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
 
-		# u-boot.dtb and u-boot-nodtb.bin are deployed _before_ do_deploy
-		# Thus, do_deploy_setscene will also populate them in DEPLOY_IMAGE_DIR
-		bb.build.addtask('do_deploy_dtb', 'do_deploy', 'do_compile', d)
+        # u-boot.dtb and u-boot-nodtb.bin are deployed _before_ do_deploy
+        # Thus, do_deploy_setscene will also populate them in DEPLOY_IMAGE_DIR
+        bb.build.addtask('do_deploy_dtb', 'do_deploy', 'do_compile', d)
 
-		# do_concat_dtb is scheduled _before_ do_install as it overwrite the
-		# u-boot.bin in both DEPLOYDIR and DEPLOY_IMAGE_DIR.
-		bb.build.addtask('do_concat_dtb', 'do_install', None, d)
-		d.appendVarFlag('do_concat_dtb', 'depends', ' %s:do_assemble_fitimage' % kernel_pn)
+        # do_concat_dtb is scheduled _before_ do_install as it overwrite the
+        # u-boot.bin in both DEPLOYDIR and DEPLOY_IMAGE_DIR.
+        bb.build.addtask('do_concat_dtb', 'do_install', None, d)
+        d.appendVarFlag('do_concat_dtb', 'depends', ' %s:do_assemble_fitimage' % kernel_pn)
 }
-- 
2.7.4


