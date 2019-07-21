Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id D9E787EEA7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:51 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id f17so12140265pfn.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gMwzFbrQsGmC4I38OAC4LFcMyQhNbXaU1/0EvWKLJ/0=;
	b=lV3371ZPVbnMCuOUxPh0dQqNi7PpZkimTeHCK+9AuPlL42252dUz2Z/7In2usw5YaL
	1gTM01G+Ngqc700a435LfK2N9vz5M91L7+VJEpbmmarKHFJ6nNuZIIcfv3wjvykw3GUc
	LKt2i5JKmdgfUiER0qraS8knPohJ2uOUY/qVKI6NAIqu8uu//51bSARdz5FOeKh9SJOs
	wbzNp5a4VhuVuIWXhn7X4OL7YUbDEYQFyXQY6vRr/NVmyr0yJdJbbyeA6AAvaTkAh2m6
	HQu8Lgkam83rAgfnmXb5RY4w5founKbUA90SspAWGepDcRNULg0Di0/KSf+U1kM8q9Nx
	LDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gMwzFbrQsGmC4I38OAC4LFcMyQhNbXaU1/0EvWKLJ/0=;
	b=iuS/Z1ULvwuDZMR1XwJq+K3XkrZ077dFCwkPaT/yn1xYAWmex+bE3HcMSH2wRqbZvA
	SlWWs20DF6KMiZ+WoFhmnEcCkBbdlETT3TMO9Ckvn7wZVrLcSs/5FuFinF2ug9G6f9l6
	jbFeuHWPhcHyx9MYa2ZKHeBlpHLdgEWj3fPXSrIoSKPtoamXz6YZoLQgQV5k8vFab1Xf
	Bond7MYHh/VzO29XylSuZEDkJpHrZrs8ip54qfi8OSfi6EmVBcfXjJyPefVu3jfpcjv0
	vZZ8xm8IlRlguP4a+M5SpMGhuK0H7bK3WaVn5QM5AWXT1GgNiM6/XX4CNqmpgV/E0tLT
	FaWw==
X-Gm-Message-State: APjAAAU9rGVoMrUh5RrY7s06oYbpUaDrziMy/q/RRv8ek+uASkmALd0h
	iItSTlLIpoVeHMgq/CBEfo9ZamU1
X-Google-Smtp-Source: APXvYqwo0CcQT1D90QXnxWCqJePkJeQ5mmC6NDv1a8+MQd/1ts+MaFjdSHhUKi0hxeh9i+bblrRXoA==
X-Received: by 2002:a17:90a:20c6:: with SMTP id
	f64mr72340229pjg.57.1563719153033; 
	Sun, 21 Jul 2019 07:25:53 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:19 -0700
Message-Id: <2bf6098ac1cbbf7ed28522b7f7dce84c8341ce00.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 30/30] uboot-sign.bbclass: Remove tab indentations in python code
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:52 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Use 4 spaces to replace a tab.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


