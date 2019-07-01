Return-Path: <anibal.limon@linaro.org>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id D83E97E830
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 21:23:06 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id w196so11197933oie.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 14:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sX3n5OlVTOC3e0EaTaApoiad6WeJorg8GqqVIIebXIo=;
	b=Rpw6NEVehEu4D3YCy1Ixj8Lp5mHLbgX8W1QUNIPw0T8E8yULrmqt6Vu3ByEJdj94mi
	mUeN/7UpN+WadkXQo8WnMXDCWvcVu0SXsFG/vfNY69RJOvGUnWdMvcSSuO/n/cgvKBOL
	TL3et/eJXJn/hwB3RNlPOEhf5kCa/Z/M9sJN4qZS/ecMZNAd2A3gUiJKheijnxreJN01
	ZJzw5bK4w0BbMuVxNjQI8H1xRW186c8dGsxrbhwXffeUSP3Gx2md8WIKXQd5FlMzHHcf
	LDx9GJhoffmF0akznFsXjS06NBXtqzeFa12lOVhO4npQX2QK35mT2ZmkQLZzWsgOazoV
	LApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sX3n5OlVTOC3e0EaTaApoiad6WeJorg8GqqVIIebXIo=;
	b=Rn3/puVMSympTebQi26lYD1S80YT3iaQntX+KkzomMrOukQhf6b+oX82DMonSVEXiY
	U+po9xUPnou/kZOowYA6kZNb/tRGPpt5BMFQkkVjA/Hiu2VK/DyD7MkKABfWBteQX50l
	GLqnTsOKBUo8/JKrS1WtNle+T2IYXGm3yr4BrS+AlV9hNu5epLELejq7QMBHrVV+nwQB
	WCx4IU0uX6hoWesmgD4kx4Bdwrptfjvsa1Z+oUTPtMKngd4KAMLVdheUUxJ6zZMbMUol
	NdqKmpyzMLYy36wl8pxamc4xvqkVZ9Om5/9WTLimHHht9oTVSe7X7zzTFgjydPZD+FxY
	/TEw==
X-Gm-Message-State: APjAAAUHISuDYVp8qGVCT3Mve/FUmh+dfNXVO/5A8gN1rqptUSjHZsuT
	93MNUGMYafE6auBYcltmoAX5t2FgM2Y=
X-Google-Smtp-Source: APXvYqzo4JMjstZopgn7ctXVt4AN1UcBC1FtIzJ60Bsl6JeyuL9JaFuvxwBU51oOVjJQZ7ZUSYLPKA==
X-Received: by 2002:aca:5f03:: with SMTP id t3mr906451oib.18.1562016187600;
	Mon, 01 Jul 2019 14:23:07 -0700 (PDT)
Received: from blackbox.Home ([200.68.140.5]) by smtp.gmail.com with ESMTPSA id
	v203sm4569695oie.5.2019.07.01.14.23.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 14:23:07 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 16:23:50 -0500
Message-Id: <20190701212350.32503-3-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701212350.32503-1-anibal.limon@linaro.org>
References: <20190701212350.32503-1-anibal.limon@linaro.org>
MIME-Version: 1.0
Subject: [PATCHv3 3/3] runqemu: Add QB_KERNEL_NO_NETWORK_CONFIG variable
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
X-List-Received-Date: Mon, 01 Jul 2019 21:23:07 -0000
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


