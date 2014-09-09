Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id F103D71081
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 01:53:14 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id lj1so5119966pab.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 18:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tGpsBHFZGe4NRWK5XIOSVFyYGddGxI6pV6EVnG/CMg4=;
	b=rZ37YJUyBCFzXp99xqURc8SyaeZ5pAfXDX5JFGEgHmBMVbr+nXIMKFKsT6V2LK5j0z
	GwDfyPy2Rqgp82kyDY0YrTBfwbZXbN4qpvaYUATB0/w/kqS8IZ2UOlIbeUYIBdXlkqR/
	TsDrP/SJtcnSwzbuq2ZmIIODhgfyFuGfrZfaMhThM52UyZb28/OdcEmiOTUnSvYeWKP/
	fCrdAJmFYNTXRzpnyUkKS5NNY1aS/BUBPUmqgbUWYpPlX2rJoy/V7rOrnG3VgK5QaRP+
	REetGic95ySL4mvRaHxBI4s/XFPITdX3lQxWxGaEyY24kkNJ+9xkRxDsXtQe1Sj0irwm
	ZUQw==
X-Received: by 10.69.31.139 with SMTP id km11mr20445pbd.67.1410227596474;
	Mon, 08 Sep 2014 18:53:16 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id dm7sm3140760pdb.72.2014.09.08.18.53.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Sep 2014 18:53:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 18:53:10 -0700
Message-Id: <1410227590-14190-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1410227590-14190-1-git-send-email-akuster808@gmail.com>
References: <1410227590-14190-1-git-send-email-akuster808@gmail.com>
Subject: [[PATCH] qemuppc64: add machine
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
X-List-Received-Date: Tue, 09 Sep 2014 01:53:16 -0000

override USER_CLASSES as prelink does not currently
work on ppc64
---
 meta/conf/machine/qemuppc64.conf | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/conf/machine/qemuppc64.conf

diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
new file mode 100644
index 0000000..86916e5
--- /dev/null
+++ b/meta/conf/machine/qemuppc64.conf
@@ -0,0 +1,16 @@
+#@TYPE: Machine
+#@NAME: qemu PPC 64 Emulator setup
+#@DESCRIPTION: Machine configuration for running an PPC system under qemu emulation
+
+require conf/machine/include/qemu.inc
+DEFAULTTUNE ?= "ppc64p6"
+require conf/machine/include/tune-power6.inc
+
+#prelink broken
+USER_CLASSES = "buildstats image-mklibs "
+
+KERNEL_IMAGETYPE = "vmlinux"
+
+IMAGE_FSTYPES = "ext2 ext3"
+
+SERIAL_CONSOLE ?= "ttyS0"
-- 
1.9.1


