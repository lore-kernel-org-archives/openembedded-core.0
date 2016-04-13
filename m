Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 76FBC605FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 16:12:18 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id f105so47253174qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 09:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=D1kQ2sVyu/W+qUyv3OOw/xyHpPGc0Lcyh1XS66cyiHU=;
	b=TR/OzbfMX1325xD/FIfAoA2mz0oaI5uUX+xybl6NWUlSULLTVXO733Ki4chh3cWDPB
	sNTEvEXnSFQ2fSWhgAqaZbHs2uEdLfdBnI26zQJFIzWZgrIzoONCuDBcZYlBS4AxgjqW
	ccBllydgcIGlM0BZ2lYyPKWLBO5kxurElNdg8TrX2cD5Mm8F/fIKQtBXVtCYa0cC34c5
	J9QGYBVLA5ugBe+X9Xpv22A2R7Jji+2XBY4KZFCw/RwqzPhcFSK+ra3JiE30PKLFz8tp
	qHlS+LlgqMDxTaA1saSKDZC0lJQuqCBmKDy14o3yQ4k4xWH0x4Gh1pXDWSYo/1TUMMqY
	owFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=D1kQ2sVyu/W+qUyv3OOw/xyHpPGc0Lcyh1XS66cyiHU=;
	b=G1bYLuF90jFPIWzp69ywEsfqbIl/wpRUnoOB7wJDoyeO4HR7iihAWvuYs8NCMjFdCI
	/PnxAv9ZnlUcDrsOosBxrxB0HwJZ/orHtYxKf6v8V++fyZ5T8q0+WjOLLWQMB60pQ7nb
	VoZTz70QwRYLd2yzSFU2LTFO/hsysUgQcGZKLzb7QI6k65lnBWX64WfM/bbYxrWSvOd+
	7HvYzZsxihu3Y/mJrnfyDBlayA4qZeVcpN2JFa2YlOU6QqXvx9jkM2SiS0gDe/mY35gA
	8T5fV4rXPN/EXE6QJoTFxw5KrY3WkRnH7i8ACeg/RKOnXd4s9RypJz9EoH8evFUWeNwU
	xQWg==
X-Gm-Message-State: AOPr4FUPp8F2/d04Y3iGOGRIb0yjt7waycdqcB+EJgq3/dNsvC9ikcZjoYS8xbHMngi9Xw==
X-Received: by 10.140.88.202 with SMTP id t68mr12304282qgd.86.1460563938841;
	Wed, 13 Apr 2016 09:12:18 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CMbcc810032faf.cpe.net.cable.rogers.com.
	[99.224.124.24]) by smtp.gmail.com with ESMTPSA id
	y123sm16264104qka.0.2016.04.13.09.12.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2016 09:12:18 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 13 Apr 2016 12:12:11 -0400
Message-Id: <3d1c9fc4252a6a5ff3d58e6df0fbec8124770120.1460563722.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1460563722.git.bruce.ashfield@windriver.com>
References: <cover.1460563722.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1460563722.git.bruce.ashfield@windriver.com>
References: <cover.1460563722.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/4.4: BXT enablement
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
X-List-Received-Date: Wed, 13 Apr 2016 16:12:18 -0000

ASoC HDMI audio backports + mmc fixes backports + misc enablement
changes (all backports):

db28bb1e7a68 async: export current_is_async()
e89355d51cc4 PM / runtime: Add new helper for conditional usage count incrementation
dcf8de0931b1 ALSA: hda - hdmi defer to register acomp eld notifier
da1bcdb4415e ALSA: hda - Allow i915 binding later in codec driver
fb95901a1724 ALSA: hda - Enable audio component for old Intel PCH devices
0a082020f0c4 ALSA: hda - Autosuspend controller after probe even if codecs are already suspended
7f7608752b37 ALSA: hda - hdmi add wmb barrier for audio component
7a32403bb06f ALSA: hdac: add snd_hdac_ext_bus_link_power_up_all
0d593c9fcf75 ALSA: hdac: Add support for hda DMA Resume capability
e453b7e42563 ALSA: hdac: structure definition for ext_dma_params
da5b15cea3a0 drm/edid: Add API to help find connection type
723224e90dfe ASoC: hdac_hdmi: Fix codec power state in S3 during playback
006d407c400d ASoC: hdac_hdmi: Fix to use dev_pm ops instead soc pm
149316f63e17 ASoC: hdac_hdmi: Add broxton device ID
f94dc80e4ac5 ASoC: hdac_hdmi: Fix infoframe programming
623b2f9b33f1 ASoC: hdac_hdmi: Add PM support
9d0c9e8114f8 ASoC: hdac_hdmi: Fix to reconfigure registers in runtime resume
4afb4f7a3760 ASoC: hdac_hdmi: Don't fail in dai startup to make userland happy
ec497d3f13c3 ASoC: hdac_hdmi: Enable playback on all enumerated ports
d94da5c4fe3b ASoC: hdac_hdmi: Apply constraints based on ELD
401a43cac5a4 ASoC: hdac_hdmi: Fix to wait for D3 before powering off codec
69fd08bfd8a8 ASoC: hdac_hdmi: Fix to keep codec power active during enumeration.
fe945a86a8c8 ASoC: hdac_hdmi: Fix possible memory leak in hw_params
2e2a20f383c4 ASoC: hdac_hdmi: Remove 'edev' NULL check
9f781dd80b54 ASoC: hdac_hdmi: Add infoframe support for dp audio
b8110510884a ASoC: hdac_hdmi: Add jack reporting
1cdebc2d6e78 ASoC: hdac_hdmi: Create widget/route based on nodes enumerated
73b4b1dc5b63 ASoC: hdac_hdmi: create dais based on number of cvts
e59b34525953 ASoC: hdac_hdmi: Enable DP1.2 and all converters/pins
760989e722ef ASoC: hdac_hdmi: Add hotplug notification and read ELD
30364a5601ae ASoC: hdac_hdmi: remove unused hdac_hdmi_query_pin_connlist
2764583d744e ASoC: hdac_hdmi: Use list to add pins and converters
9458ca02aa7e ASoC: hdac_hdmi: Fix to warn instead of err for no connected nids
477a88699c5e ASoC: hdac_hdmi: Fix to check num nodes correctly
acdc6421f720 ASoC: hdac_hdmi: use dev_to_hdac_dev and to_ehdac_device
bd4ba9cdf188 ASoC: hdac_hdmi: check error return
b6898f18eaca ASoC: hdac_hdmi: fix possible NULL dereference
4836a9c5bc4e ASoC: hdac_hdmi: Use i915 component framework for PM
c70f3eab8f81 ASoC: hdac_hdmi: Setup and start infoframe
f0f09f63f4f5 ASoC: hdac_hdmi: Add hdac hdmi dai ops
4bab2c42e58a ASoC: hdac_hdmi: Add PM support for HDMI
d1237b8c1a21 ASoC: hdac-hdmi: Add hdmi driver
0e0a7bb86eb8 mei: me: add broxton pci device ids
2af333b2beee usb: xhci: applying XHCI_PME_STUCK_QUIRK to Intel BXT B0 host
7ae2e3bce771 dmaengine: idma64: set maximum allowed segment size for DMA
53e822a3c638 dmaengine: idma64: drop IRQ enable / disable in handler
97e4071b6885 spi: pxa2xx: Fix too early chipselect deassert
46cc317c74dd i2c: designware: remove redundant lock
03a6b1c85e0a i2c: designware: Prevent runtime suspend during adapter registration
d5da4042ad5b mmc: sdhci-pci: Add support and PCI IDs for more Broxton host controllers
c3d97cf9fe19 mmc: sdhci-pci: Do not set DMA mask in enable_dma()
f20ad778b58e mmc: sdhci-pci: Do not default to 33 Ohm driver strength for Intel SPT
ca9a77c6869b mmc: sdhci: Fix override of timeout clk wrt max_busy_timeout
74982dc84940 mmc: sdhci-acpi: Fix card detect race for Intel BXT/APL
8017269a25bf mmc: sdhci-pci: Fix card detect race for Intel BXT/APL
b532b30c3e41 mmc: sdhci: Allow override of get_cd() called from sdhci_request()
9e96c0c00221 mmc: sdhci: Allow override of mmc host operations
0148b3601f29 gpio-pca953x: fix the "drive" property cannot read/write

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 9ae4174f96cc..eb830ef4c49b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "d5a75e64945b378d22b136d8c33a1e9120c3bbb9"
+SRCREV_machine ?= "328830680bc35257c83fc400d9d8e2ae94d86f77"
 SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index b6a5fea6cb0d..00bdcf74d33d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.3"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0148b3601f29b159b4f84c1478ff1859bbd48efe"
+SRCREV_machine ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
 SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 8a9e67126645..76d45f7e9ac5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a1201019dd589ee33964da46a8402c7e00133ee2"
-SRCREV_machine_qemuarm64 ?= "0148b3601f29b159b4f84c1478ff1859bbd48efe"
-SRCREV_machine_qemumips ?= "2f8a14c3f7c6372b00bfa4fea186f277d8125963"
-SRCREV_machine_qemuppc ?= "0148b3601f29b159b4f84c1478ff1859bbd48efe"
-SRCREV_machine_qemux86 ?= "0148b3601f29b159b4f84c1478ff1859bbd48efe"
-SRCREV_machine_qemux86-64 ?= "0148b3601f29b159b4f84c1478ff1859bbd48efe"
-SRCREV_machine_qemumips64 ?= "b65cb9e6c3ed6e8f97150d4de0f651c7cd1c4fdf"
-SRCREV_machine ?= "0148b3601f29b159b4f84c1478ff1859bbd48efe"
+SRCREV_machine_qemuarm ?= "d0dae8a98254e7ddd8d9be107e33c3a492bccdae"
+SRCREV_machine_qemuarm64 ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
+SRCREV_machine_qemumips ?= "9024e9c842557e258a88470f8b1a772df18d9813"
+SRCREV_machine_qemuppc ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
+SRCREV_machine_qemux86 ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
+SRCREV_machine_qemux86-64 ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
+SRCREV_machine_qemumips64 ?= "88fb42ec863d20ccde57dd35da06d6221cfb4c03"
+SRCREV_machine ?= "db28bb1e7a682362f58cc42fbb679022df9657a7"
 SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


