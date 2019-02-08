Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id EA7E97C5C0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 14:46:02 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d15so3687364wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 06:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ub6W4KcDym9ciJ/jQSrDTzt8K56eD9qNdAqAFFEb/SE=;
	b=ivsIE3qrcZ4VkXn/kCm1qrVpF1zsCH4WXMSRSNoDN+SpWMM7JzcE4irqhpz4XcEJGp
	O9sLNFq4b8BtTT44KBu+/IhJGjxawEwcG7DlBV3+0ASgYSCBS+FMYpNF6x7oyWOseq+9
	8nf6sP5X/MvqBMesMI/QKzhZ4+HeiLBWklR/QxeIacBKoxhxgBXQ8qqAt7Vd5wSgZtZV
	H1cqlK7PyY0uH+L6+iP+8k8pGc4JZiiTbLb1UGgOlSt0QlPXFX00icq1C9tIwXSJFuwM
	ancHRgdS6JZ5PO+jYa+XfwzRdkOZqeoXRXGsO20pkpKyXsYFfPFjfnzGH1FziEBKmMYJ
	zVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ub6W4KcDym9ciJ/jQSrDTzt8K56eD9qNdAqAFFEb/SE=;
	b=Chtlgu5lTU3uslGzQWmU3i1czxLsZTwTOiOjrxWH4S8WQQZU+0Tn4cUddspsPjrfp4
	ylKEq/pPAjrKuaysi7NPmG0J5zOg/znHLcAL6fhy1ktrV8rRgjaEciQB5aBdatw9sxvM
	mZBSVT1SW7pQx7i/XwFpjQrTeI1yEYzspiWHMZ8AGRZPB7jpD5Y6NGtGI2O2uJh5V5G0
	3smPyrBGe/epMdu35a51jTMghfQQEMmgmFyyBIbZeBoIDmLyR1fgBqQXY1Y/0dq8j51o
	cVMx7ErJGv1BtiyagkZedNoKoq0EYRGAoMr/ejGUB58FVlw3d1uQR2HP5+OaqwJJ+cLO
	RZ2Q==
X-Gm-Message-State: AHQUAuY4c2jvsL/ZeBRCoqDajeSRGqq/sLNlDqUh4XLPy0n4jNaANna3
	5DXkn6YzeNUlP74aM1mCVXpViHO4
X-Google-Smtp-Source: AHgI3IbzVwf0nQWbmc7lTCXws1XYX1HCNT9wvVIh6Rd+y2s4V5jbrdHZZ6VbIoFdFoBaNhhKfaYUvg==
X-Received: by 2002:a7b:c5d1:: with SMTP id n17mr11960314wmk.152.1549637163359;
	Fri, 08 Feb 2019 06:46:03 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id j3sm3365709wmb.39.2019.02.08.06.46.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 06:46:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 15:45:44 +0100
Message-Id: <e1cfbbc1b6ff942ca13ed464904d98496d1d0ff4.1549637121.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1549637121.git.alex.kanavin@gmail.com>
References: <cover.1549637121.git.alex.kanavin@gmail.com>
Subject: [PATCH 03/12] local.conf.sample: adjust the qemu config to enable gtk+ instead of sdl
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
X-List-Received-Date: Fri, 08 Feb 2019 14:46:03 -0000

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


