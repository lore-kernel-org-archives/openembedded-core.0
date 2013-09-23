Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5481D610F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 15:50:30 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id q59so3194135wes.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 08:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dHN02soda6nLP5GXvebBkP/LKvX9t7lk4pOPcCC1wcM=;
	b=g/FcFyPO8zy/L+ufUvAnZpyW8lhG5TrICcyjMPoqRtChf5vcJ3AjpTe/VqDD73LhVV
	A/7sYEazy2mg4Ykv13LRfHxFTwvzwtBc+S0ZgiYFjuMWzBqL3xbSkxrQFVt1KfGD4U3j
	gIVzI2Qv7D3VUPT5hC5BckIsD9gdBDC6HwyI79uF2CZecbZ3awJGPvEQQEH6FkhLfylj
	E+0nrkyFCy6b9JnOWWUGl4YC426W8fhVpk3zQ7GAT9USp0qR2OlNexwf2tfz8t3wyKn0
	F85nW1zIR6/7CGc58U4tBffjVwHwMVMtGiHFi9JcJHdCDxTVK7vz2VfCrXMz5+KBP2K+
	z1kQ==
X-Gm-Message-State: ALoCoQmO7+9zIS9hOMFexOjmMZjCJyBgfv8qKidwrNf9ruiPXhYBvhA5dd/YDeLYpD5ZYJIczWfu
X-Received: by 10.180.206.180 with SMTP id lp20mr13986393wic.48.1379951431683; 
	Mon, 23 Sep 2013 08:50:31 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	ey4sm26779297wic.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 23 Sep 2013 08:50:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 16:50:24 +0100
Message-Id: <1379951424-2636-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] qemu: don't claim support for IrDA and PCMCIA
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
X-List-Received-Date: Mon, 23 Sep 2013 15:50:30 -0000

QEMU machines don't have virtual IrDA or PCMCIA hardware, so don't claim to
support them.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/machine/include/qemu.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index a78622d..591f6b4 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -11,7 +11,7 @@ XSERVER ?= "xserver-xorg \
             xf86-video-fbdev \
             xf86-input-keyboard"
 
-MACHINE_FEATURES = "alsa pcmcia bluetooth irda usbgadget screen"
+MACHINE_FEATURES = "alsa bluetooth usbgadget screen"
 
 MACHINEOVERRIDES =. "qemuall:"
 
-- 
1.7.10.4


