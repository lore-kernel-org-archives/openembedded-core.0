Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 57B477F17B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 19:28:59 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id s21so1960567ioa.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 12:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tlf8W1z5uJ4pvogSs1HUI46Rv4YiIx5z5SYk9OjX0Rc=;
	b=LTrBBuzJYJPrDD1BcqSnej68geP0Jnj32409XVbB2mHkQoqmD/aePAOnNThSnt2TR9
	wSz0ZrIqmYymxzeV8pqZ/7pG2WcEsfR5psHAr8ehnOZqpI2HLcTxLmCZk/uf9SoLCMcI
	T8QRUnKSju9enGRcm+b+fnDyNVVjFzKUCBi8Er6d/WSJerM3boRRk19TSaCdLmFB2a7i
	AxaYlGcUmslk/9vRZZJ06ELT0hZhMN7z8AP5BpAiF0RSOcbyzSlG0G2QqE0386pe4UYy
	PCTNo6WWWh2BldS/aQArqUhMteVyVYwl5cFwBHhHrnyahZYE1meFbHGJi4XwCfjc5RU2
	ricw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tlf8W1z5uJ4pvogSs1HUI46Rv4YiIx5z5SYk9OjX0Rc=;
	b=uD5yaeMQpTa5673//ru6j2lE2ScXrpXgk8jhj6BoyhTcer4mato99I9ANNI8OMYEYz
	+h2KUjdz1rTrt80578DGyeUgRGOzQQRpnT0VsIwGifDhfPsa3lTpJTiPjfRJSgW+qumU
	K5zNI8H6Spht4DJ5/hTQvOo4l9jjmht/ZYa2UFvp8SHQ9bMKPQAFmrq31AgFoQbyX949
	pdHDOGJydArgganMVH9zqvCIOvLkTc0XihQPmnQoAcF9PMK+lL0rUcX93/NoTRqZWH6s
	5v6Yol45PPIkA4FY/6wZT1nHA9M1doTh0uA09RbyAVFQNhEGweXq4zsW8B2cNdeapHil
	4iqg==
X-Gm-Message-State: APjAAAXqJiBtnKgEw1BKTDa5CJgsTjMyRHBSU5ttdlsh2S7b1HPPn9H1
	BTy5mJ08XBlS+Uzs1g2Gf38=
X-Google-Smtp-Source: APXvYqx8XZe3IGn5jmTUrcZs1bBEDcIm9nsOHqb2mgoaZJ7P30Nrf4pkiSH1n60SdxVcTI463E30Pg==
X-Received: by 2002:a5e:9e4c:: with SMTP id j12mr3641192ioq.13.1567020540393; 
	Wed, 28 Aug 2019 12:29:00 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id d6sm4454375iod.17.2019.08.28.12.28.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 12:28:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 28 Aug 2019 15:28:42 -0400
Message-Id: <a40e9089a646d2bba4859d5d9f0113b2b7fa8005.1567019771.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1567019771.git.bruce.ashfield@gmail.com>
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] qemu: bump linux-yocto preferred version to 5.2
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
X-List-Received-Date: Wed, 28 Aug 2019 19:28:59 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/machine/include/x86-base.inc | 2 +-
 meta/conf/machine/qemuarmv5.conf       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index 686f938233..0227f3c289 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -18,7 +18,7 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ??= "5.0%"
+PREFERRED_VERSION_linux-yocto ??= "5.2%"
 
 #
 # XSERVER subcomponents, used to build the XSERVER variable
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index 1c21d3342d..fb4789fdac 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -17,7 +17,7 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
 QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
-PREFERRED_VERSION_linux-yocto ??= "5.0%"
+PREFERRED_VERSION_linux-yocto ??= "5.2%"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
 KMACHINE_qemuarmv5 = "qemuarm"
-- 
2.19.1


