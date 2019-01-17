Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id E4FC47C215
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:37 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id t18-v6so9140147ljd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ub6W4KcDym9ciJ/jQSrDTzt8K56eD9qNdAqAFFEb/SE=;
	b=hHiwP1K+vfSn+IVIO885b/PUKE8/tLSCzYbfyUyo//m14z7Bem2V5EbZPjlZfy6G7A
	K9J7nhtn9ds8x5w5gGVSEFhVk4CssYtLK/wprQLp05XLriS9icLBGi0s/Qa/SSATk1wL
	yn3Lez+bfC+xwdtUEnVOxoU7xeuKGJHV9rEwPKJJczhkF7NmQNuV3EQbWD5tYu2zSBBd
	crweulGuDF6UCbDivOxkka/KItQmTHAkfd72yizjxRU6p3qRvAqqZRiIrTsDjSswr1Ly
	M6EAGWTlyTDQuVw5mEqXISriKyYujivsfhze4I+ctMdkjBWuUCjIYRgmi578RECLkYzm
	XJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ub6W4KcDym9ciJ/jQSrDTzt8K56eD9qNdAqAFFEb/SE=;
	b=AXYT1YaQPCqtFzVX+bXKdmRPE39yS4sZqLoYhKNDI4sub2VUg3/ZOBNIiaCu+CCtH7
	7fkeX6kr2Mx4bxUlqpo7fuJnpH8vUBSFgq9f+Cn3enAHWAnpnM2+r2E+m6er4hZwa+rR
	U6C2uNqkVLSJjO4MuR6S7ZGE05taf3+DFUUQtUe2O23Axsq8iDhkyFoKEwb7OK3kcCZ4
	aIIivWoUgOjUtx9RY8RHYXYkOWDOynyiyI9rpmbYBOR3vs/FCuJ+36w1C29dihM9uysh
	HDvLhNU66XVAd8b6xMQZ41t+r8WQAJ1+yiw66ks57O3Y+u2880BzIbFgUQWFsiBtN9BE
	u9Ng==
X-Gm-Message-State: AJcUukfD+9DMOxMqCUU6QSCRN6fJ+ycI8WJ7RdkXZe7KJS6hlJyMY2wA
	S95TXUyNyM7RABKJl+nxONb5H7Zr
X-Google-Smtp-Source: ALg8bN6IH3fLgvMwze6z2KCwJ1mGSPo2tmZo7Ec/u5RGEtvnv6AhMKwhVMxwyBWO20b9bcasDuD7JQ==
X-Received: by 2002:a2e:9e16:: with SMTP id
	e22-v6mr10083967ljk.4.1547743238177; 
	Thu, 17 Jan 2019 08:40:38 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:39:57 +0100
Message-Id: <e5d29c56ba57c1772ca11b6a4a7eae3f8d6aaeea.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 12/27] local.conf.sample: adjust the qemu config to enable gtk+ instead of sdl
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:38 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-poky/conf/local.conf.sample | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-poky/conf/local.conf.sample b/meta-poky/conf/local.conf.sample
index cf96598819c..961387acbae 100644
--- a/meta-poky/conf/local.conf.sample
+++ b/meta-poky/conf/local.conf.sample
@@ -236,12 +236,9 @@ BB_DISKMON_DIRS ??= "\
 # Qemu configuration
 #
 # By default qemu will build with a builtin VNC server where graphical output can be
-# seen. The two lines below enable the SDL backend too. By default libsdl2-native will
-# be built, if you want to use your host's libSDL instead of the minimal libsdl built
-# by libsdl2-native then uncomment the ASSUME_PROVIDED line below.
-PACKAGECONFIG_append_pn-qemu-native = " sdl"
-PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
-#ASSUME_PROVIDED += "libsdl2-native"
+# seen. The two lines below enable the Gtk UI frontend.
+PACKAGECONFIG_append_pn-qemu-native = " gtk+"
+PACKAGECONFIG_append_pn-nativesdk-qemu = " gtk+"
 
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
 # track the version of this file when it was generated. This can safely be ignored if
-- 
2.17.1


