Return-Path: <jdmason@kudzu.us>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 672B67C702
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 22:32:47 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id p25so10757123qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 14:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9LoUfq3Iz24+j0QWL0o4pT3zhxdl9mPUd9JWM6tIXlE=;
	b=QGJb99L05XbvZZ8cM1JJxSWOGbQGDMRjfYwdKZ0p6JDq9BtNkovd04BpDEUMVs/mnN
	3+YZar+LFZYroFsiPou3nYLHIC653hOLdT+hQg8nXQPr3Sx9BLEKthyUGsCA4lvVyV4c
	bTbX2aaJqwIbt4mBlErKtbnWiy5J0AndYp2CdSbqFQ3+oNicSuc/x+UVE0WW7Vm3+YLT
	b52fHPA+ywAAM8krcLCWrw043VgSspk87XGaxygnsqc20J4qqi6u872+CrZXWyLGvG8x
	wsnrRvTNUO6iXaj1G5GvmVgBQbbN4t+6kfVVoMyrlvv0gXdNrHo5kfOJ4/77ax/JtpWk
	JP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9LoUfq3Iz24+j0QWL0o4pT3zhxdl9mPUd9JWM6tIXlE=;
	b=qVUEVfkAt8Owykw1mzch/S03rpr0GA5e6qwKz44Dk7sXrz+IJ8HYP1S3ToQ1s2jko2
	t0nO1bS3ToPisGLRc9hn8JQU8hgCrbBP6ECoNiIkR0vdo1kNAum5/rH1OV+qnOU4JGzG
	myAL9b6efPtP7SrMVbTJRNXy3mrn5aWPQnwhlXcwGReOGx4S76kueV0Vgu1CdU1hBwd1
	ObvuPvr3tcBBRiEE2RS0SZZz+XUDSkcmsaQ0i3P7+Roth2JS/410OvjLbAGuCeqWp/sX
	0q+aRe8BMw1/iASdbGhBLLfc9Ts2waFp9H0Ky1ayvBw9wujz4Zf/boB4EESeKcf4fbPd
	mgCQ==
X-Gm-Message-State: APjAAAVVKcvmtVOQS3drXm2zcjjxW/s+5RJJAS2JX2bPOgPdp7w/EYqi
	S0Sc3lAy+O7fjgFnrrKR/LAWTSgkPHKjkg==
X-Google-Smtp-Source: APXvYqwFXIR/M8cET8m80BjxNM9UrTQC72B3P73og5fgNAu1Te3kE4gHq2qeLb/wl6eJu/xoo+xu5g==
X-Received: by 2002:a0c:8876:: with SMTP id 51mr3858935qvm.38.1551825168200;
	Tue, 05 Mar 2019 14:32:48 -0800 (PST)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4]) by smtp.gmail.com with ESMTPSA id
	z126sm7480030qkz.8.2019.03.05.14.32.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Mar 2019 14:32:47 -0800 (PST)
Received: by graymalkin (sSMTP sendmail emulation);
	Tue, 05 Mar 2019 17:32:46 -0500
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2019 17:32:17 -0500
Message-Id: <20190305223219.30812-2-jdmason@kudzu.us>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190305223219.30812-1-jdmason@kudzu.us>
References: <20190305223219.30812-1-jdmason@kudzu.us>
Subject: [PATCH v2 1/3] qemuarm64: config cleanups
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
X-List-Received-Date: Tue, 05 Mar 2019 22:32:47 -0000

Add comments describing what is going on, remove an unnecessary space,
remove a duplicate comment, and increase the serial speed.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/qemuarm64.conf | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index ee19385eaf..43078588a8 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -7,20 +7,23 @@ require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "Image"
 
-SERIAL_CONSOLES ?= "38400;ttyAMA0 38400;hvc0"
+SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
 
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-aarch64"
 QB_MEM = "-m 512"
 QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a57"
-QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,38400"
-# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
+# Standard Serial console and graphics (or lack thereof in this instance)
+QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
 QB_OPT_APPEND = "-show-cursor -monitor null"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
+# Virtio Networking support
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
+# Virtio block device
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
+# Virtio serial console
 QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
-QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
-- 
2.17.2


