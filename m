Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id F28E87BFFB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:12 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id v13so3715329wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=E+lDLwps2kExZk1iG7J+myNm00tdEoKk3cf4Vbvrdws=;
	b=fwr11AjwOwGS24dxpdJs+5kqf+BA1+CcYmUcsEfKX/LmTdsyEV/Nmd5OPXaEbbKjae
	pZeHQZIK3hERoXmBtY6B7dkTGCg8Cfa1VtL8qFWHbRTg0exl7b4rwQl1ItD11aGYxUj4
	4QHuV7aeMu+bLVayBBSzDPQpzk+2GGdnB+MNV4xLEBotm5VdzzsijW+mQfUlW1UN14br
	rpkKxMzjKLTnxO2l7QHJ7RZu/5sSSex+5Nu3Y28mStLmwh2zM0ZsaGCWjp4gnyaqU/el
	R6vJUKQx7iyuvr+lT79eVBFIW9YvcHqTKChuB+6cPb1KHb4cUWANF438IPoozdf6xYol
	HnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=E+lDLwps2kExZk1iG7J+myNm00tdEoKk3cf4Vbvrdws=;
	b=lVv2MYn02RsHVXYMAV+hsGliE76sJMTMX8a15sWx71eyBtVZGj4eGCXmcOMOsHeHdx
	EQGuYTxNrSa1Ol++bwG5td+jYLnm1OWQbLf9HYV3IDFVu7To7dBBmoqnqvsxxQdfzGvT
	WiVmzv9yLGOhhqMa6aJFXIrkkcMTbA+2GYZoRVTlZ9a5GcJpC2bdcDq1+dOLRGbqW+3o
	C7UQcA4D+6fPq3aaJHIPqEnrqVSgu370NT8pyO2a7jJj+9OB2txRVOu6Wk1UGN5X7wAl
	SK1f1ymvnCeAyr3LCJvRi2STT0tv0ovuRrgmeLHTVaLtQv/3c1EAVDDPGem3eNPbWZTB
	UNdA==
X-Gm-Message-State: AJcUuke+bo+qZ6VeH2do2e5Peku+5XMU4IkdH8ihFBp32vws1qgCPfrp
	+xdI+Hyovq4XFFaVjGMOn+7ZZiFF7mI=
X-Google-Smtp-Source: ALg8bN63FfT+0p+WvXRSaQvQ0jrHPfmQ2cXdXFbVMQoRblgnlb6Y1Cc/2feJAXPDrCeKxiEzkIMpsg==
X-Received: by 2002:adf:a14d:: with SMTP id r13mr3708193wrr.169.1547570353379; 
	Tue, 15 Jan 2019 08:39:13 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:44 +0100
Message-Id: <6dd6ca4619c4f4f320146d3940531c48c1fcad4e.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 09/22] qemu: enable virglrenderer and glx options for native/nativesdk builds
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:13 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b05c1cee9eb..f943b9ee5a2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -74,8 +74,8 @@ PACKAGECONFIG ??= " \
     fdt sdl kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 "
-PACKAGECONFIG_class-native ??= "fdt alsa kvm"
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
+PACKAGECONFIG_class-native ??= "fdt alsa kvm virglrenderer glx"
+PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
-- 
2.17.1


