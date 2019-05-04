Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA547DD90
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:28:04 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id n8so4158429plp.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eTMmko3vRRkSQue4G3KM0us8N1esO9CWp5CbrVKEiy0=;
	b=ktnoXMAC98zkjK0dN+vosIT4cxCDUK4A/Y5dsUC5TpC/SYL1Tmit02R0A2PkoNdg2+
	mz5VZeO4PmLfUjxB24UgOjxr0kcq1QruGgjXwJTLxG0a5KU7PJrLcl5OnjAdqc5ZMTgE
	7wJvvHElvd2v9fAVJNyM6p0sl0k69S9sb5qj5hNps2FbkdciRUhqyhuwwWwr1J2Qfz0B
	Wq7gXsJERBPA3hSv9UW6eRy8PfS+z+dVDo4YuDl5Oh1clEqhqIHsW9sA4Zv+c9X/yWX+
	xMtcauNlO5GYtwlnZvKKoMtYKIEdCubFKSouuol0O4nTndRM4tUp4q6X1fwNr7WQoap2
	0WhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eTMmko3vRRkSQue4G3KM0us8N1esO9CWp5CbrVKEiy0=;
	b=Qfhpvnx8uS0Cseyf+viEl5y9WW0ZYd06dcyyMpIoRTd71fwvz1vAsvMj3Htcza5RTb
	lIo4SO1Ujt94hJGBdwWzTiCt6RuncCTbNAmO63Jpt4gWAytCYcH6TPGvMPM3a/poFa3c
	UDc5YR4APgiqTQHO3lhgnRPkfD2xbEjVJHhVnjzFFEzao9B4jxHmxFpY3joNcA1tJjY2
	gwlvrRmx4t05xN6bo1FPJq1WRXwpMmiAgrs2u0xnqEfwHZs5O9362KLZC97cXk9ddlTY
	Jp95VkJcGh/yIv+eQjWyRYxgT59yx9jDxv2ObgLrvFwhCAiDSuh5J9FHEMxtP7q+Tn98
	d7Dg==
X-Gm-Message-State: APjAAAX+83njLMqj5t/CEiVO9pFcEjlySSsKHvBw6omEu3UINEOBTvOb
	Bo6e8Ol+jkayWhDG0Mox1AyRowbQ
X-Google-Smtp-Source: APXvYqxqQYUjnv05iLyEV6SofdPqaawJyq4FykQRL2TicTLdGCiqKvI8SXRtYngo43XCQv2srDwAGg==
X-Received: by 2002:a17:902:5c5:: with SMTP id
	f63mr18779343plf.327.1556983685738; 
	Sat, 04 May 2019 08:28:05 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.28.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:28:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:16 -0700
Message-Id: <6b6aa062a72aa2d50a8318dc03f8d91a32c21e94.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 40/43] waffle: supprt build waffle without x11
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
X-List-Received-Date: Sat, 04 May 2019 15:28:04 -0000

From: Changqing Li <changqing.li@windriver.com>

respect DISTRO_FEATURES to make waffle support different platform,
gbm platform is supported by default.

[YOCTO #6077]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/waffle/waffle_1.5.2.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/waffle/waffle_1.5.2.bb b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
index 43c3edc..31572f2 100644
--- a/meta/recipes-graphics/waffle/waffle_1.5.2.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
@@ -15,10 +15,9 @@ inherit cmake distro_features_check lib_package
 
 # This should be overridden per-machine to reflect the capabilities of the GL
 # stack.
-PACKAGECONFIG ??= "glx"
-
-# libx11 requires x11 in DISTRO_FEATURES.
-REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'glx', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx x11-egl', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
+                   gbm"
 
 # virtual/libgl requires opengl in DISTRO_FEATURES.
 REQUIRED_DISTRO_FEATURES += "${@bb.utils.contains('DEPENDS', 'virtual/${MLPREFIX}libgl', 'opengl', '', d)}"
-- 
2.7.4


