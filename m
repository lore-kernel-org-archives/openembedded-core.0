Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 77DCF60F43
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:22 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id e8so1791326plt.9
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0mZJ/gya5bfHRPYwEkvNRLaZaNrVGyo3nMGQfx6shlo=;
	b=RUReHdTSXbO1t2DSZ6v4ecEc1uk1sXpWYHCyd6jjLwFMvef/9yVWRsLuirODwpTIjR
	SBi2QRCtTYF9ZZLONGx4K3CTPAjoiE2y4me+H60F5OnfSc7N32N20B1JayOF8lomGP5W
	XY5p6l2wpDIsEjivnYCP05iUtakHBprr8tL3Iefs+gtLA29dunpdi6Z6T42s4kP/gBx3
	u4Xl6ODbzWd4Q38uph4Ue5iKyDIbuqhIR5LQHCTksViku8wzmQda7rr9yINrSzB0y4FC
	XNmph8uhDAvuCadKy3E0+UayRacodyKPHlkqd6x7GUNsU1UJm2aJ4Cl7r8BNRhir9372
	q0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0mZJ/gya5bfHRPYwEkvNRLaZaNrVGyo3nMGQfx6shlo=;
	b=LPQuFN86mwa1Te4BM66JiaQR2P7newNF/OkWk5UYAWx8DuhxIvPbT6WZwX/2Pmuiy5
	3/5hQfrxZG0FZVRr7v+U+pc/q6lA9mcTa4IZ7zjXPMbuZLEbaGp4sDlf5n/H0XysTVwR
	V6V6OUHwSo+1Y5qtFPuCwWM+OagrxvU+0/Y44XNYmkZjXvmruwEOiglkE1XuJwua3HrK
	lDpnTMEFIp/MTbO6a1PwNebkCxVNVjtT+QQzN9lpNisQRcMSycm62k0721Kub4JjFw8M
	123jF1k5DCcOKnXRDRlcGaxV4Ii8GwAcOJWrktChNqb4MvYgTLu2sE2zYUaURwmGKAaU
	w3qg==
X-Gm-Message-State: APjAAAVZpqkJNEasOnZ8DeuL/o4nD0DQtjYcYlD68qEm2rfsVVQOm7O8
	9rxKnQG5RwVd6fTJF72SqR35bouH
X-Google-Smtp-Source: APXvYqxS3KyYkEiguaVSfYZ3fXBcOnIeaaA0fzJ3kg9KwvgK9NWegvw7vkDIPnYvfdcZ1C5KKgaTBQ==
X-Received: by 2002:a17:902:b210:: with SMTP id
	t16mr8577370plr.65.1581264623301; 
	Sun, 09 Feb 2020 08:10:23 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.22
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:52 -0800
Message-Id: <a739556610725df8a011d0eb8a9d72fde2460440.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 24/29] libinput: Fix determinism issue
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:22 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The build was injection git information from the wrong git tree, stop this
to allow reproducible builds.

(From OE-Core rev: c3f6a6113f562ecdb13386c3ff52adb7973980a4)

(From OE-Core rev: 22dc9a3314eef5925241a9a961bd79815d3172b6)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wayland/libinput/determinism.patch        | 21 +++++++++++++++++++
 .../wayland/libinput_1.14.1.bb                |  4 +++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/libinput/determinism.patch

diff --git a/meta/recipes-graphics/wayland/libinput/determinism.patch b/meta/recipes-graphics/wayland/libinput/determinism.patch
new file mode 100644
index 0000000000..cb554030cf
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/determinism.patch
@@ -0,0 +1,21 @@
+This finds our outer git tree and that version information breaks
+determinism of this recipe. Disable it.
+
+RP 2020/2/6
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: libinput-1.14.3/meson.build
+===================================================================
+--- libinput-1.14.3.orig/meson.build
++++ libinput-1.14.3/meson.build
+@@ -387,7 +387,7 @@ pkgconfig.generate(
+ 	libraries : lib_libinput
+ )
+ 
+-git_version_h = vcs_tag(command : ['git', 'describe'],
++git_version_h = vcs_tag(command : ['false'],
+ 			fallback : 'unknown',
+ 			input : 'src/libinput-git-version.h.in',
+ 			output :'libinput-git-version.h')
diff --git a/meta/recipes-graphics/wayland/libinput_1.14.1.bb b/meta/recipes-graphics/wayland/libinput_1.14.1.bb
index 38bc8d2c33..2c5733f33a 100644
--- a/meta/recipes-graphics/wayland/libinput_1.14.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.14.1.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f2ea9ebff3a2c6d458faf58492efb63"
 
 DEPENDS = "libevdev udev mtdev"
 
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
+           file://determinism.patch \
+"
 SRC_URI[md5sum] = "da29a704dc6f7ea2d5aac754db046340"
 SRC_URI[sha256sum] = "e333a3242835c019ca37d2cef8b51a87d3138eb47444119c0153dc7a8656ee70"
 
-- 
2.17.1


