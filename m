Return-Path: <anibal.limon@linaro.org>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0E9657E7BE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 21:18:09 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id l12so11203122oil.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 14:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sX3n5OlVTOC3e0EaTaApoiad6WeJorg8GqqVIIebXIo=;
	b=KDMd+lcIHBJEpqsKHr64p21kT9To9GfB1nO8ecRWpeMXUDUSf+gGGudCyVcsDevFM3
	qTMcoHhwER5SucqylTfSlpF9LGyBJCCW5K7/N05zTAalBD5SnHWzGq5RNHsAVRkurloj
	xkLJiAQ/aFLWd3h3TjA41zE+f2I3pJOQdV+Cp/+iYBp9il8fF2kq4BZbWa4AhP53L/a8
	+00Ygg4wx5yoWZ0Z3z4pYT8sXCSmoknrKhsqnWjh66ZMhovAyi7T1zsY0z+iNH8jIqW/
	o6kR2x6Za75lbR3/hWfXsecnjY1wzXyKCzb/466LuWTAgzHZU8Oqm2DWP2lN1954kOrM
	KE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sX3n5OlVTOC3e0EaTaApoiad6WeJorg8GqqVIIebXIo=;
	b=X0faSsbriZ68THduohoGomQArqv0nbajfcHDnIJgkOXB/gW8+z8klU4z5vA0U7aOF4
	Vvi+4XqNWiLcnQf2IA4LB28tYLFk0Rtt+TWJd8FEajfHIQ49JATwd/ma96ufy8VzL+hm
	m6zNL04Bx4DQPcilK7MrTmvyRZbdMs/QChrshfjVWwYe9od8RoF5voLtDWB85k9vQi5u
	bovKxluofN/+fxE8JvXhyrtY28eHWkob/s6b24eixfMzH9Q7XARBZaGoDJ2bu1/A4ARN
	JXllU/VszMii5XZE/O1L/vZhPBp4CGWgCaD5HGglOvjXWZMnxmYF5H9tJWR0KK01Gz4/
	wQ9g==
X-Gm-Message-State: APjAAAUbK/lbJhNl0eWxkvAqbEgSwvaUmxW7UdpHw+BR4Io6Gie2RzoY
	rMDfgH16jnwSIkntrN2gwkG6yJqw0Co=
X-Google-Smtp-Source: APXvYqxQDnyifK/QbmuecG1QklTFEf1Q0RgyCrOnEkcvHaOhETlIBPRQ+WkHIhOiRrIJtQxVghDyjw==
X-Received: by 2002:aca:4c16:: with SMTP id z22mr905917oia.57.1562015890839;
	Mon, 01 Jul 2019 14:18:10 -0700 (PDT)
Received: from blackbox.Home ([200.68.140.5]) by smtp.gmail.com with ESMTPSA id
	l15sm4460040otr.38.2019.07.01.14.18.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 14:18:10 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 16:18:49 -0500
Message-Id: <20190701211849.31989-3-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701211849.31989-1-anibal.limon@linaro.org>
References: <20190701211849.31989-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Subject: [PATCHv2 3/3] runqemu: Add QB_KERNEL_NO_NETWORK_CONFIG variable
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
X-List-Received-Date: Mon, 01 Jul 2019 21:18:10 -0000
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
index 2f318e114d..ec61edfc46 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1069,10 +1069,12 @@ class BaseConfig(object):
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


