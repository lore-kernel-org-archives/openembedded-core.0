Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id D012A7D9CD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:47 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id t22so4203706pgi.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/nlLs1ngiWdbqDk9OPk2a9jW4K5ScP+fJHO1ouLKYoU=;
	b=KaA0Si0NgXuXB9T4Xyi6hC9khWJ/mONcu3sc3QsRztpsM2UmGs13/vdcz0xGMu5VGf
	gkdJ9pOjro03IXBwoTpz9bJGE0z6zjyxFPYP5uw0RQRG2RMcDq8v4ahrNueXRWsfkAQ8
	bHzteHXdKwvW989711YRwxwR6aLz1UukftRMWvJ1SBUhL5Lxt6tBUzN2b+889LRQibK9
	A6yYewBGg2iC17iwlsDIWbFD26Aky+6XGAkBfX8FOjRTugO4SMxgotCXHAe6KUaqtgpd
	QIPbeqPYhOu9ITCT14ycGHKbAzDkcGCUJo7IiMe6HfUZMLNVuIZrhPmmUQ4GQxI60GB9
	pPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/nlLs1ngiWdbqDk9OPk2a9jW4K5ScP+fJHO1ouLKYoU=;
	b=Ugn5BvsNmu1pEoCs4hmR3AEJxbsOMSYQnTBCyalS+0dPIJvCDAPcnOP4TeXwQ4q5LC
	gNuwmpiF2g47+yvOAu+JXwHgjfEtx4IEF85qQT4wiZwUGhtERJwpcO5HRJv9Vxs6Ed99
	MuPmvm0gNS4LiKicUop2W/xtHcwSqO3IJCh3GDrhKMawFQgLFxLpr5fPploWcR68Q3K6
	hMqvdTud7RSxGD4LgTrA3/qtH7l5Wzz9PyFE0T09JRBGQOU96WzCZ07WCKs4wSw6U8KS
	wJ9BUSKKuiqAy+AxGoeK/2LAuNIvatNS+Eqj9TNQtT+SYsLNIIcmVAWCrprBJptf3BRM
	6HJg==
X-Gm-Message-State: APjAAAUBdpZhMVkUua6BxMCoxRkI+7ERpFHOEeB4ZiqwIqkTVvdoVa80
	QTYTOculdtlwWTA4/Ph0qcD9Z2UD
X-Google-Smtp-Source: APXvYqzTXZMXdWUSN0lqTl8YQxXzvybkUzBuvzD9+VsHIPLn2swnNZkKpFPdTOM/iVwEHsavtTiv3w==
X-Received: by 2002:a65:4589:: with SMTP id o9mr19378688pgq.381.1556983669019; 
	Sat, 04 May 2019 08:27:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:59 -0700
Message-Id: <6ba5f32333e9ed6be980ca2b71b547f795e83497.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 23/43] core-image-rt-sdk: make sure that we append to DEPENDS
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
X-List-Received-Date: Sat, 04 May 2019 15:27:47 -0000

From: Naveen Saini <naveen.kumar.saini@intel.com>

This also fix postinst intercept hook 'update_gio_module_cache' failed warnings
that are now flagged as errors after the recent chagnes at lib/oe/package_manager.py

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-rt/images/core-image-rt-sdk.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-rt/images/core-image-rt-sdk.bb
index 0f7f091..624b7d9 100644
--- a/meta/recipes-rt/images/core-image-rt-sdk.bb
+++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
@@ -11,7 +11,7 @@ python () {
 DESCRIPTION = "Small image capable of booting a device with a test suite and \
 tools for real-time use. It includes the full meta-toolchain, development \
 headers and libraries to form a standalone SDK."
-DEPENDS = "linux-yocto-rt"
+DEPENDS += "linux-yocto-rt"
 
 IMAGE_FEATURES += "dev-pkgs tools-sdk tools-debug eclipse-debug tools-profile tools-testapps debug-tweaks"
 
-- 
2.7.4


