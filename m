Return-Path: <jdmason@kudzu.us>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id E33967CCCA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 04:15:48 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id y13so15525340iop.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 20:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bqRXHhzrSYgEi2D6lAR4QXMedu0GhNh8H1gexAMCaSg=;
	b=xr/IV1MFk4RMjkp6+KlpK9kPNB4OrkEUoAu61zvMQUjpcWPWxNcEtbNbK9RiWvR3jx
	Kq4VG4WpSwWkkfD1Kz8S3eBkvhs/g7r8M9UbQ25pxZMMlp5yY8SZ7+g9iINtCzKSL2LD
	j42XfZWnYWyFjCTjoabA7vw2ykpjvk+rQIMRdOA7hwoYE9nNyEZdc8xjb1WPMJ03bOGJ
	up2uwYzz9XuNFNQ0phvaPa9jCCVOU27MECO5FO0O7HFMcH/nDMtmK5GOGz7Co0OtQ69i
	UgpWU2EW/FImZx7JNg49oH+sty4lsVy+z+38YuI0jnVtHabJrFhQ56BBuBvwjPv9XAAh
	NPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bqRXHhzrSYgEi2D6lAR4QXMedu0GhNh8H1gexAMCaSg=;
	b=hWsZiJgcRwHmKLoYCyc+GoZw7CEwGcoo1Oczp5N6PD6wxCHp7TrU7e5VsDbLqVUKSU
	iyb1QSlY8fLNC1AuyOrPDKUl3TogErLmSqW1W7cJuiw/jCkXdaAwZlAbiMm4fFNnUDfc
	8ksGGIiAHbh1fgO5L+6kuOZGiN5g7WniKXgj9NlYuBcnaxPGAi3agoi3jWGL0M/u7kFO
	1wc5QS7XQbNQYpdVCOcfn2q+zpUUgOvHtZypoMehDnVk+9DvTPWYMTa8Kp8Cps/aqQwU
	LvjsP1s7tv0xgF8aHml8a2RsZRxwGeB+WQBjUvLPsdtGrm9swZVMKf/XCfw2tWMORpQc
	oP9Q==
X-Gm-Message-State: APjAAAV7HlqPKjzJ5UlfZ5ReL7NhhY2ag/HaVJrqFgc5kbUQsTAXrDwh
	6Jvi04rsOIKW04YS5/8e7MmaQEtPOXhljA==
X-Google-Smtp-Source: APXvYqxDhQrgq/6vnU1PRoEMjqTHrSFDZSViD/XGjM0RhMxpHS/aAm32Dp1WAYoDcbcMRxvGtDb5/A==
X-Received: by 2002:a6b:c30d:: with SMTP id t13mr4560753iof.66.1551327348453; 
	Wed, 27 Feb 2019 20:15:48 -0800 (PST)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4]) by smtp.gmail.com with ESMTPSA id
	g10sm6874508ioa.67.2019.02.27.20.15.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Feb 2019 20:15:47 -0800 (PST)
Received: by graymalkin (sSMTP sendmail emulation);
	Wed, 27 Feb 2019 23:15:46 -0500
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 23:15:41 -0500
Message-Id: <20190228041541.14628-3-jdmason@kudzu.us>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190228041541.14628-1-jdmason@kudzu.us>
References: <20190228041541.14628-1-jdmason@kudzu.us>
Subject: [RFC 2/2] qemuarm64: Add graphics support
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
X-List-Received-Date: Thu, 28 Feb 2019 04:15:49 -0000

Add the necessary parts to qemuarm64.conf for graphics to be shown in
the SDL window, and USB so that it is possible to interact with it.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/qemuarm64.conf | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 8d4a482fec..e8362260b9 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -16,7 +16,9 @@ QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a57"
 # We need both ttyAMA0 and tty1 to allow for this to work in the stdio mode or the normal mode
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0 console=tty1"
-QB_OPT_APPEND = "-show-cursor -monitor null"
+# For graphics to work we need to define the VGA device as well as the necessary USB devices
+QB_OPT_APPEND = "-show-cursor -device VGA"
+QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
 # Virtio Networking support
@@ -27,3 +29,5 @@ QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio
 # Virtio serial console
 QB_SERIAL_OPT = "-device virtio-serial-device -chardev vc,id=virtcon -device virtconsole,chardev=virtcon"
 QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+
+PREFERRED_VERSION_linux-yocto ?= "4.19%"
-- 
2.17.2


