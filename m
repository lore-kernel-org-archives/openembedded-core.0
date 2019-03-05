Return-Path: <jdmason@kudzu.us>
Received: from mail-yw1-f50.google.com (mail-yw1-f50.google.com
	[209.85.161.50])
	by mail.openembedded.org (Postfix) with ESMTP id 367337C6F9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 22:32:49 +0000 (UTC)
Received: by mail-yw1-f50.google.com with SMTP id n12so8306308ywn.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 14:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+p2GyYnmPT46+To14/plZTsC0k977vtT7HbZzDwLCHE=;
	b=M2KmB912jaS/4MWCTqlHTLSDp1tu+ZkWko9GIzKT9D/IxRUuwwG5pKXtFXjR3PHPzk
	+t7lg5Yg6ByR2TI0DxXZ8/5/AnwhpnRv3qK5XVyUMIftiPd5On5GzybjkUYcfUvS8Civ
	9hGRSIEQmkJBCcoN8b1yGz8Fr4wbKfpOK9+DJIHlgpkn/8dD+/TZpUvwicpcDCp5Wz6g
	b4caiSLlJY4lTLEngsjNURuSFOE7wmpmqy1hFqLG1KbONEEn6CoMTZmLI3sbTlaBWXQN
	tWEAtONi699tY/fkXgXJIg7BsOY7CxjQfsLnMaEHFXMCIXFTIfjfw2DRJTem5IRnecAB
	myaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+p2GyYnmPT46+To14/plZTsC0k977vtT7HbZzDwLCHE=;
	b=NqCvIGeYQrvpgQNLMz6/zlb+8VAlZMedw7JlkrNPDtinq1MxbjW+Bpa4A6co7/SPBJ
	40B82sH+IJpHPuswi6eIdkchqy5/1j5EE93C6gxUnQjJNNQeQO5OC0IySv3KLD+O2RAg
	qWF6jHLf4W7VBpx4aQehXNmsjWqRTsW7PBd4W0xpcAtk9b8+TPgud1dZZ7C2H9VZEsDb
	fX9lcOFFdJaYjGmMLfTFMbtAKBCqOB2qyeOPsqFW8t/dNLIOud/q2wTojRpEYJBe19nP
	0w2dfnAUysd6Z13gu5D+9nAVd5u0eefpA86ao1p6nxJ8UNl8TvccLBtxblVaMjGvbL3f
	vUpg==
X-Gm-Message-State: APjAAAWa0hdWFNxJUYp4XzUkFWH9fptXRBdS49N2mNWCSxFir3bhkrZY
	RQ5VjP3IVXMfaua8I/32f0KIWoqaDEzMDQ==
X-Google-Smtp-Source: APXvYqx2MOCpGCeUC92VP/M3A9VjjCY55BBZ3uE+4IpiI75cKYKgXwq0AjVrSuIGiUi1u5vtt0K7FQ==
X-Received: by 2002:a81:a652:: with SMTP id d79mr3050234ywh.472.1551825170308; 
	Tue, 05 Mar 2019 14:32:50 -0800 (PST)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4]) by smtp.gmail.com with ESMTPSA id
	k187sm3729061ywc.47.2019.03.05.14.32.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Mar 2019 14:32:49 -0800 (PST)
Received: by graymalkin (sSMTP sendmail emulation);
	Tue, 05 Mar 2019 17:32:48 -0500
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2019 17:32:18 -0500
Message-Id: <20190305223219.30812-3-jdmason@kudzu.us>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190305223219.30812-1-jdmason@kudzu.us>
References: <20190305223219.30812-1-jdmason@kudzu.us>
Subject: [PATCH v2 2/3] qemuarm64: Add graphics support
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
X-List-Received-Date: Tue, 05 Mar 2019 22:32:51 -0000

Add the necessary parts to qemuarm64.conf for graphics to be shown in
the SDL window, and USB so that it is possible to interact with it.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/qemuarm64.conf | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 43078588a8..e17245a0f7 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -14,9 +14,11 @@ QB_SYSTEM_NAME = "qemu-system-aarch64"
 QB_MEM = "-m 512"
 QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a57"
-# Standard Serial console and graphics (or lack thereof in this instance)
+# Standard Serial console
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
-QB_OPT_APPEND = "-show-cursor -monitor null"
+# For graphics to work we need to define the VGA device as well as the necessary USB devices
+QB_OPT_APPEND = "-show-cursor -device VGA"
+QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 # Virtio Networking support
@@ -27,3 +29,5 @@ QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio
 # Virtio serial console
 QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
 QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+
+PREFERRED_VERSION_linux-yocto ?= "4.19%"
-- 
2.17.2


