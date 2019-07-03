Return-Path: <anibal.limon@linaro.org>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2C8697E7BF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 17:01:41 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id c13so1555817pgg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 10:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=n3Sf3uxt+HVkwYjGYPFKZ+tUCFFCpaw2GHwQqGsPFPs=;
	b=Psswu6OvPEqGTZAmIgvCyHvyzN9UoagI2dinuvZAyf5WglNFiXeEGUggRb3cqqbmn/
	HJYWfnCvjUiRvXEu3CLMis6sWWxjGWyNMozal2wrLR/zvjEkXJH5aIExvo+EoUO9gk/m
	p+la7UuCwDbAC1XaGHrlbKQcLOFSe7a+DYDiE/Bk/2Kd4uEVWKyNh9S1qiqk9EMQLQ79
	nIKM84UDs6JetkIgIagBFX9qNA/OP4IiUkPDnHMjXnfzRDEIIbyi+zSJUyGF5V/dqUkl
	oshNJwKbwuyOw7UaxEJiCenNb50t0Tqi7c5Cc5R92q7uhr2quQovLNWcNIi9PMIe/aXr
	FOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=n3Sf3uxt+HVkwYjGYPFKZ+tUCFFCpaw2GHwQqGsPFPs=;
	b=RHcJI1QF7qvpJbnlmd0q77hE+rRTKbJUhNpHHCMpbx2EMhC35mSfDw8s3xbk57BUUM
	up2VUBAsQOAn0yX2qWn8e/fChnrpag1pvfR+Tpe1eyKPRn0QeoVdo0chWymyePP89h6Y
	qigtsIV377/tEH0dALBcDdVuTx43psKS3yNfoGxJ7DuJhcZQIFuc3shZsxveOoCvmjyr
	nLzgZE6K0/CvKv44XjFssSrAthgzpUymYlR49Nase4jEYGTkB0T5Te8LQybrOGHql3m1
	lWAv2zysZ8be8ivSj4Bwt7K7iYFdy4uYxD1XgCinkZWoVqwgYkYhKka3+BLz0cgB5lfV
	+Rcw==
X-Gm-Message-State: APjAAAXf/qfdS40++PU+yRRV3I0e5AuZIZoxLReH8kDhWcsDUdFH9xAr
	ZIqlvR8qk4WekhSzlVZBIEyQ0Pu9LLEHLw==
X-Google-Smtp-Source: APXvYqwN06MNSHtgbnNDC4epEGxfWim/Y9sLYJkuq0PN4DzT/Bysjguf4yRPkF3qMOAsbBevZOp8pA==
X-Received: by 2002:a17:90a:a410:: with SMTP id
	y16mr14094019pjp.62.1562173302220; 
	Wed, 03 Jul 2019 10:01:42 -0700 (PDT)
Received: from blackbox.Home ([200.68.141.206])
	by smtp.gmail.com with ESMTPSA id
	o16sm8417666pgi.36.2019.07.03.10.01.40
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 03 Jul 2019 10:01:41 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2019 12:02:23 -0500
Message-Id: <20190703170223.6228-3-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703170223.6228-1-anibal.limon@linaro.org>
References: <20190703170223.6228-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Subject: [PATCHv4 3/3] runqemu: Add QB_KERNEL_NO_NETWORK_CONFIG variable
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
X-List-Received-Date: Wed, 03 Jul 2019 17:01:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To let user choice if wants to have network configured via Kernel
cmdline.

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/classes/qemuboot.bbclass |  3 +++
 scripts/runqemu               | 24 +++++++++++++-----------
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 15a9e63f2b..5df63a6a61 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -41,6 +41,8 @@
 #             "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 #              Note, runqemu will replace "@TAP@" with the one which is used, such as tap0, tap1 ...
 #
+# QB_KERNEL_NO_NETWORK_CONFIG: disable auto network configuration via kernel cmdline possible values 'True' and 'False'
+#
 # QB_SLIRP_OPT: network option for SLIRP mode, e.g., -netdev user,id=net0"
 #
 # QB_ROOTFS_OPT: used as rootfs, e.g.,
@@ -63,6 +65,7 @@ QB_DEFAULT_KERNEL ?= "${KERNEL_IMAGETYPE}"
 QB_DEFAULT_FSTYPE ?= "ext4"
 QB_OPT_APPEND ?= "-show-cursor"
 QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
+QB_KERNEL_NO_NETWORK_CONFIG ?= "False"
 
 # This should be kept align with ROOT_VM
 QB_DRIVE_TYPE ?= "/dev/sd"
diff --git a/scripts/runqemu b/scripts/runqemu
index 0134f86b4c..10f7296c91 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1069,17 +1069,19 @@ class BaseConfig(object):
             gateway = tapnum * 2 + 1
             client = gateway + 1
 
-            # XXX: Linux qemuarm and qemuppc dosen't configure the interface 
-            # if device is specified in ip (ethN), so if only one tap device is
-            # requested don't specify ethN.
-            if tap_no == 1:
-                netconf = "192.168.7.%s::192.168.7.%s:255.255.255.0" % (client, gateway)
-                logger.info("Network configuration: %s", netconf)
-                self.kernel_cmdline_script += " ip=%s" % netconf
-            elif tap_idx == 0:
-                netconf = "192.168.7.%s::192.168.7.%s:255.255.255.0::eth%d" % (client, gateway, tap_idx)
-                logger.info("Network configuration: %s", netconf)
-                self.kernel_cmdline_script += " ip=%s" % netconf
+            no_network = self.get('QB_KERNEL_NO_NETWORK_CONFIG')
+            if no_network and not no_network.lower() == 'true':
+                # XXX: Linux qemuarm and qemuppc dosen't configure the interface 
+                # if device is specified in ip (ethN), so if only one tap device is
+                # requested don't specify ethN.
+                if tap_no == 1:
+                    netconf = "192.168.7.%s::192.168.7.%s:255.255.255.0" % (client, gateway)
+                    logger.info("Network configuration: %s", netconf)
+                    self.kernel_cmdline_script += " ip=%s" % netconf
+                elif tap_idx == 0:
+                    netconf = "192.168.7.%s::192.168.7.%s:255.255.255.0::eth%d" % (client, gateway, tap_idx)
+                    logger.info("Network configuration: %s", netconf)
+                    self.kernel_cmdline_script += " ip=%s" % netconf
 
             mac = "%s%02x" % (self.mac_tap, client)
             qemu_tap_opt = qemu_tap_opt.replace('@TAP@', tap, 1)
-- 
2.20.1


