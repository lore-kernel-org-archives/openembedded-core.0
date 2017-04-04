Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE176FFED
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 08:02:03 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id t20so1502714wra.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Apr 2017 01:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4BGD2oeECuXRyeFcGJCAoRkhSUsFl6x17QG/zm2xrE4=;
	b=vYpU8wTxA4IxaaSx90JBHd0SjpwFc7poM/J2C+jDgVZk3HrENLoTxVrMY2eSKwhNWF
	wTxsNDWyp+2tzWL6mWyJWopj0j3nQd/fX4iJdq4cQFTKoH1TUeAWUCsZE6YgOtfQlzq/
	kIhrEq6wlqoytZ1d+RVwdNVTti37Kb17T01vdwiuXCz4ycSQqsOnu7pPqgAKv6CoESLj
	pUAVwYgjk360Us1Qp8c3Yq0v75D18/GpVDguAsSexPFl6M4ZQrFHrXCzOhWbNoJWzEkD
	l3nqa4FD6ywBSPZswbNRXZs5+V67AqhqJX97jP57JbYsoYriqygX1RzuCViHbZqbcju4
	mY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4BGD2oeECuXRyeFcGJCAoRkhSUsFl6x17QG/zm2xrE4=;
	b=leSfpGp1yOcACFLKNlS+qFD9LQQlgeGccg48nVJYqUy4SzgfQF5X2LcpWUngl+x1oK
	ZQFE0IknmJbpKyJwJsFpPDv5hkDPwTHfKifwfZLWM32EAq4AiaBPMgAgHVrq9ybpqGxr
	lwBWChSiL/hvIX++u1Jr3vDgcnIMePvuXuQrJQHzkECVJefIXaPrl7nYQPQYaCxaux64
	D5SFISehRRnlhwGsU2f8L8a0rNsPbwbQ0kIY3lRr9+fdQ99ztGAVEJbUwFyic0J1xXWw
	6F53RM/5MlJrv9cYvMflmHVY1rJajwdae1oL04j3Eh7NlfhtVvKGY2pOGLNSZMYfFn+2
	4sxw==
X-Gm-Message-State: AFeK/H1DmxKAQR52fn62nA0/t3ogta3LdLLYxB8fY3+dw0ilnIXBUiQpG+0wyy7Cux6TEQ==
X-Received: by 10.223.144.8 with SMTP id h8mr17611001wrh.45.1491292924796;
	Tue, 04 Apr 2017 01:02:04 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b199sm17364974wmb.13.2017.04.04.01.02.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Apr 2017 01:02:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 10:02:02 +0200
Message-Id: <20170404080203.6985-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <1d818d62-704e-61f4-1f0c-a3980a09b502@windriver.com>
References: <1d818d62-704e-61f4-1f0c-a3980a09b502@windriver.com>
Subject: [PATCH] x86-base.inc, qemuarm.conf: prefer 4.10 version of linux-yocto
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
X-List-Received-Date: Tue, 04 Apr 2017 08:02:04 -0000

* 4.8 version was removed in:
  commit 466e6e45ca04a07ebe1b1f52de747f077b362d54
  Author: Bruce Ashfield <bruce.ashfield@windriver.com>
  Date:   Tue Mar 28 08:58:07 2017 -0400

    linux-yocto: drop 4.8 recipes

    We have 4.1 (LTSI), 4.4 (LTS), 4.9 (LTS/LTSI) and 4.10 available in
    master. 4.8 is no longer required, so we drop the recipe to keep
    the version selection under control.
* causing each build to start with 188 lines of this stuff:
  NOTE: preferred version 4.8% of linux-yocto not available (for item virtual/kernel)
  NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a
  NOTE: preferred version 4.8% of linux-yocto not available (for item kernel-module-raid456)
  NOTE: versions of linux-yocto available: 4.1.38+gitAUTOINC+7140ddb86e_4d2c95e78c 4.10.5+gitAUTOINC+01f18cba44_b97dcd4f06 4.4.56+gitAUTOINC+271b0c8d51_01aaede0a2 4.9.17+gitAUTOINC+8b97a445fa_3ff3760c2a

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/x86-base.inc | 2 +-
 meta/conf/machine/qemuarm.conf         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index 40d59577fd..7365953ca8 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -20,7 +20,7 @@ SERIAL_CONSOLE ?= "115200 ttyS0"
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ??= "4.8%"
+PREFERRED_VERSION_linux-yocto ??= "4.10%"
 
 #
 # XSERVER subcomponents, used to build the XSERVER variable
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index f9d6dd7e36..6b875e415c 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -16,5 +16,5 @@ QB_MACHINE = "-machine versatilepb"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
-PREFERRED_VERSION_linux-yocto ??= "4.8%"
+PREFERRED_VERSION_linux-yocto ??= "4.10%"
 QB_DTB = "${@base_version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
-- 
2.12.2


