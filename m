Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1B160111
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jul 2016 18:16:11 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id us13so13966072pab.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Jul 2016 11:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=sN/VO5I/vdEsgWEMCaPK6dxQaxFVDbayMov9DVhozrE=;
	b=JBKygPZACSgT4evJNs7qtlaPtbzt4drbwXahyZY3Ld87ZZgt3kVoGMV8S2mUpMs3tG
	dWpC3jan+7aZC1UvOySRngYwf+Cq/XcZrcnTgXneTM/ckOPd//pTiGZSt8GC2ZFGoRY9
	qK7OBt4g7350T1A4GGbv6Q2Sw2KlaFwfE7XF++vrZJ+4SVNiDRbxQ96zHcI4bKkGG5Bt
	9gNC8vlxCXCaTqh4Vzh9hoX5gYoMStav2RkrjPK2aehNlC7bNUOCzXMaCX/Z5AeQ6DBL
	ALhXhnSpATpnZmskM/2Y9+D4Qrd1P0IobOee+8Pj50qBuYg9vvYXFv+UZuj9JHpdlf6n
	EBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=sN/VO5I/vdEsgWEMCaPK6dxQaxFVDbayMov9DVhozrE=;
	b=S6vJpu9hVHEtFRhGFEam+mioTYALHfhFpTVtWQMIo95oDCAwHXfqElH9NXTIbN7qp4
	1K6Ll2UejSLoEGRg/x7+f0GXTjm2grHAiy23vsNNhmJBRSkLkqGIkUvSIfpO3GQl4qHr
	fOFRmqp4Q6OPOSdGWBWG0Gr3an3UT0ZQJJ7L53PmWa0RU6iUBFBPIY11EJeE3EF67MHY
	7R5g4CFw3HJljTNGRdcpkghRgDifIGd30rSrF78fkAvdvs+Bo4wViDEJdWwAnKcP6e+Z
	EK3k0NgibaegcUkn9ToNuI8ncWiW5Xlqfo9x3bTvHhrTFl2X51i5gNyO9CUdD+68LHzp
	5Z4w==
X-Gm-Message-State: ALyK8tJhuKnHCWujW3C7FWzdc3BaF2PXu03kciRGpBYUxftotBgniKtr0S2LXeXpkypDxQ==
X-Received: by 10.66.13.68 with SMTP id f4mr14320017pac.102.1467569771837;
	Sun, 03 Jul 2016 11:16:11 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id 77sm4822770pfp.66.2016.07.03.11.16.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jul 2016 11:16:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Sun,  3 Jul 2016 11:15:44 -0700
Message-Id: <206c2c06e3acc3a07f1c09a7272a5d46c2347a0e.1467569369.git.akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1467569369.git.akuster@mvista.com>
References: <cover.1467569369.git.akuster@mvista.com>
In-Reply-To: <cover.1467569369.git.akuster@mvista.com>
References: <cover.1467569369.git.akuster@mvista.com>
Subject: [PATCH 1/5] machine: add qemuppc64 machine
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
X-List-Received-Date: Sun, 03 Jul 2016 18:16:11 -0000

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/conf/machine/qemuppc64.conf | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/conf/machine/qemuppc64.conf

diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
new file mode 100644
index 0000000..5501101
--- /dev/null
+++ b/meta/conf/machine/qemuppc64.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: qemu PPC 64 Emulator setup
+#@DESCRIPTION: Machine configuration for running an PPC system under qemu emulation
+
+require conf/machine/include/qemu.inc
+DEFAULTTUNE ?= "ppc64p6"
+require conf/machine/include/tune-power6.inc
+
+KERNEL_IMAGETYPE = "vmlinux"
+
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
+
+MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
-- 
1.9.1


