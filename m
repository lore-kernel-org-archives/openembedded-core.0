Return-Path: <anibal.limon@linaro.org>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF4C7EA5F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 03:37:58 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id 9so1648403ple.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 20:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7Vfg9h33wB7wYrWh5CS3qJmltO09MmuyBAYOIuEZJec=;
	b=EMOFORpNA/TWQegB0oArQ+ZFhdP0T5w2eiwIrkmUrJjhmXv6b12KTPib7PcmfLeWKS
	RsPGz+qdpLcQ8vpYfycl+bquhlye0Zebuj85i2zLsuepczhqunDzUEVc3YrQzOwcogG3
	v61H3FELog6+3eD7KBrhdn6a+lGOaDCcPBQ1eaWhzMe8ofoBZjtmudnofifEf8P74LQK
	4Yx4DWIjqdCZnGkTi6rY+xbsvH4dK0rBEgWWnugH0BqZIBiJpN3GTHV7iG6hWNbVTRa9
	joRUZ6G2YQ6K63xFhEKqpT2X6ij4642QHOsGSVcIsU2qwMAakPCz+5zvCfcoocSOC2zP
	OsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7Vfg9h33wB7wYrWh5CS3qJmltO09MmuyBAYOIuEZJec=;
	b=RFT0W52IDKNS7e5QVUEpTc9uZelO6sCm9CqrLFGKKaesEJUWxsb+58OX2cuuKkxakH
	lapEQiDOzh5Cv8XrRZqjG0RHUMYMq8B4ofMSHRjWx1bA+G13jiEjsQnF4yvQfyRZvcQo
	i9DE+4LU2NSI2H2H/8vlYOlj9CBTiZwPYl0fINZps2k2bfG8LFKKKvKpw46qPR00R79l
	nMXPqmHDeSDCpTp6YMUHZmKXs5Ep9s/ugUDIjzEDch6wTbzfyt95EBEI4XEEIz2muy0T
	pz7Sf+j2mH+k0at33tDpTuWcA0S1CgWoeluDrFSsZKqwf+A/D39QQm3xsD7aAIn8yKHk
	+G9w==
X-Gm-Message-State: APjAAAVXrX0tONRw1MM/axjbrY2KjK9VBr9/Qswx5tYaLJAmrvnX0Ltg
	04baogw2T1hzW45oaK2/6S0mCK9+VAj5W44B
X-Google-Smtp-Source: APXvYqxfSBKSi1OsqH+j73boNw2hWNiv1Mp24iMK6XjA/1tqjsXji+gjlrXbVwU+uvIvE6w0nDMPkg==
X-Received: by 2002:a17:902:8c98:: with SMTP id
	t24mr9026952plo.320.1561693079203; 
	Thu, 27 Jun 2019 20:37:59 -0700 (PDT)
Received: from blackbox.Home ([200.68.140.5]) by smtp.gmail.com with ESMTPSA id
	e184sm566027pfa.169.2019.06.27.20.37.57
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 20:37:58 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 22:38:30 -0500
Message-Id: <20190628033830.27713-3-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628033830.27713-1-anibal.limon@linaro.org>
References: <20190628033830.27713-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Subject: [PATCH 3/3] runqemu: Add QB_KERNEL_NO_NETWORK_CONFIG variable
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
X-List-Received-Date: Fri, 28 Jun 2019 03:37:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To let user choice if wants to have network configured via Kernel
cmdline.

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/classes/qemuboot.bbclass |  3 +++
 scripts/runqemu               | 10 ++++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

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
index e1a78c8910..5d6804233f 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1067,10 +1067,12 @@ class BaseConfig(object):
             gateway = tapnum * 2 + 1
             client = gateway + 1
 
-            if tap_idx == 0:
-                netconf = "192.168.7.%s::192.168.7.%s:255.255.255.0::eth%d" % (client, gateway, tap_idx)
-                logger.info("Network configuration: %s", netconf)
-                self.kernel_cmdline_script += " ip=%s" % netconf
+            no_network = self.get('QB_KERNEL_NO_NETWORK_CONFIG')
+            if no_network and not no_network.lower() == 'true':
+                if tap_idx == 0:
+                    netconf = "192.168.7.%s::192.168.7.%s:255.255.255.0::eth%d" % (client, gateway, tap_idx)
+                    logger.info("Network configuration: %s", netconf)
+                    self.kernel_cmdline_script += " ip=%s" % netconf
 
             mac = "%s%02x" % (self.mac_tap, client)
             qemu_tap_opt = qemu_tap_opt.replace('@TAP@', tap, 1)
-- 
2.20.1


