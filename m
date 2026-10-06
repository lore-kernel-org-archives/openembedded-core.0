Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A19CA5FFC
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 06:24:56 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39323.1791267894356408091
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 23:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AXisx9w7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FpnC32Q2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a10fe2effd-d4efaf5d-d2a4-40be-affe-afb2ff844c1f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791267893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=570Gp+Mxbql4zms/Eu4B0SY35ePkEdnHS0f7uJrww8E=;
	b=AXisx9w7ef3iuMmkCL7y0ThMNDEYC+b4HklrT1ZM76YW3kkalTpAFdf0kaUCulS4
	OtHaKcwpDoeiBAdaBjQbeRCQd1ahU+6tRQG9OrZettFS9SbVaI/CpeVUygONjI/QuQI
	gAEfUomRVFcjiWRwIY9QXuhVhslqEGEZaTW/XoiU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791267893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=570Gp+Mxbql4zms/Eu4B0SY35ePkEdnHS0f7uJrww8E=;
	b=FpnC32Q239SYZ5j6+gkfOgisbfwH+0ze6FOiTSKPvHH5jlbPRPioPoHMsEPpFNjn
	PMUC1ibjIsFRpjGbJsQY3OHtV1JirkWgf5H54bUxwltQiiaqcMWiGpI1AcPXstNDIX+
	2F/5aFwNVx9qQAH5klBozdS7uY98hfw7N8CacBLs=
Content-Type: multipart/mixed; boundary="===============1379261659734509085=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Fabio Estevam <festevam@gmail.com>, Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot-tools,u-boot: upgrading to 2026.10 FAILED
Message-ID: <010101a10fe2effd-d4efaf5d-d2a4-40be-affe-afb2ff844c1f-000000@us-west-2.amazonses.com>
Date: Tue, 6 Oct 2026 06:24:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.06-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 06:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247265

--===============1379261659734509085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *u-boot-tools,u-boot* to *2026.10* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f u-boot /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1994 entries from dependency cache.
Parsing recipes...
Summary: There were 3 ERROR messages, returning a non-zero exit code.

ERROR: /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot_2026.07.bb: Unable to get checksum for u-boot SRC_URI entry 0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch: file could not be found
The following paths were searched:
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot-2026.07/poky/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot/poky/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/files/poky/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot-2026.07/qemux86-64/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot/qemux86-64/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/files/qemux86-64/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot-2026.07/qemuall/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot/qemuall/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/files/qemuall/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot-2026.07/x86-64/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot/x86-64/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/files/x86-64/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot-2026.07/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
ERROR: /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot-tools_2026.10.bb: Unable to get checksum for nativesdk-u-boot-tools SRC_URI entry 0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch: file could not be found
The following paths were searched:
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot-tools-2026.10/poky/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot-tools/poky/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/files/poky/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot-tools-2026.10/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot-tools/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot-tools-2026.10/x86-64/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot-tools/x86-64/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/files/x86-64/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot-tools-2026.10/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/u-boot-tools/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
ERROR: Parsing halted due to errors, see error messages above
ERROR: Failed to start bitbake environment


Next steps:
    - apply the patch: git am 0001-u-boot-tools-u-boot-upgrade-2026.07-2026.10.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 98877f4965fafa68c253745e3cf754d98a426e68 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 6 Oct 2026 05:16:57 +0000
Subject: [PATCH] u-boot-tools,u-boot: upgrade 2026.07 -> 2026.10

Prepare v2026.10
MAINTAINERS: Fix Lukasz email
Gitlab CI: Temporarily limit thread count on world builds
board: beacon: Remove i.MX8MP Beacon EmbeddedWorks Devkit support
board: beacon: Remove i.MX8MN Beacon EmbeddedWorks Devkit support
board: beacon: Remove i.MX8MM Beacon EmbeddedWorks Devkit support
board: beacon: Remove Beacon EmbeddedWorks RZ/G2 Dev Kit support
board: davinci: Remove DA850 EVM support
board: logicpd: Remove AM3517 EVM support
board: logicpd: Remove i.MX6 SOM support
board: logicpd: Remove OMAP3 SOM support
Merge tag 'efi-2026-10-rc6' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-efi
lmb: Add StarFive JH-7110 SoC as requiring DMA below 4GiB
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
sh
boot: mention sbox in efi loader boot method doc
efi_loader: fix efi_http_instance free on error
Merge patch series "fsl, powerpc: Fix SPD read and appended DTB alignment"
board: cssi: Move alignment padding into __u_boot_list section
powerpc: mpc85xx: Move alignment padding into __u_boot_list section
ddr: fsl: Fix SPD read when legacy I2C is used
Merge tag 'u-boot-dfu-20260929' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-dfu
usb: dwc3-generic: Fix ref clock enable error check
power: domain: renesas-r8a78000: Add SDK SCP 4.39 map
power: domain: renesas-r8a78000: Add SDK SCP 4.37 map
clk: renesas: Add SDK SCP 4.39 map to Renesas R-Car R8A78000 X5H CPG clock
driver
clk: renesas: Add SDK SCP 4.37 map to Renesas R-Car R8A78000 X5H CPG clock
driver
configs: Resync with savedefconfig
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
usb
usb: dwc3-generic: fix ref clock lookup indexing wrong clk_bulk array
usb: gadget: f_mass_storage: Synchronously tear interface down
usb: gadget: rockusb: terminate full-speed descriptors
Prepare v2026.10-rc5
Merge tag 'u-boot-stm32-20260921' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-stm
fw_env: do not create lockfile with read access for others
MAINTAINERS: Update some SoCFPGA related addresses
ARM: dts: Add bootph-all in ltdc node for sqtm32mp235f-dk-u-boot
ARM: dts: Add bootph-all in ltdc node for stm32mp257f-dk-u-boot
Merge tag 'u-boot-rockchip-2026.10-20260918' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-rockchip
Revert "Clean up emails from non-existing domains"
Clean up emails from non-existing domains
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
sh
clk: versaclock: Fix incorrect error check in versaclock_probe()
arm64: renesas: Enable FFA on Renesas R-Car X5H R8A78000
arm64: renesas: Drop empty board_early_init_f() from Renesas R-Car Gen5 common
code
arm64: renesas: Drop CNTP from Renesas R-Car Gen5 common code
arm: renesas: Drop SYS_ARCH_TIMER on R-Car R8A78000 X5H Cortex-M33 RSIP
Merge tag 'u-boot-dfu-20260914' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-dfu
Merge tag 'net-20260915' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-net
board: anbernic: Fix the RG-DS Kconfig target guard
fastboot: fix the RK3328 buffer-address default
test: dm: nfs: Add regression tests for the NFS reply-length checks
net: nfs: Bound the length of an NFS readlink reply
net: nfs: Bound the length of an NFS read reply
u-boot: fix error check in eth init
net: airoha: fix PCS calibration retry limit
net: net6: validate IPv6 payload and transport lengths on receive
net: lwip: allow DHCP to stop without releasing its lease
net: lwip: add an HTTP client abort operation
net: lwip: allow DNS callbacks to be canceled
net: lwip: return ERR_ABRT after aborting wget receive
test: dm: eth: add DHCPv6 oversized option regression tests
net: dhcp6: bound received DUID option lengths
MAINTAINERS: tee: update Jens Wiklander's email address
env: Update description of single to redundant environment upgrade path
Merge tag 'u-boot-pci-fixes-20260911' of https://git.u-boot-
project.org/u-boot/custodians/neil.armstrong/u-boot-pci
Merge tag 'u-boot-nvme-fixes-20260911' of https://git.u-boot-
project.org/u-boot/custodians/neil.armstrong/u-boot-nvme
dm: pci: fix uninitialized fdt_pci_addr fall-through in pci_get_devfn
pci: Iterate over busses using uclass_foreach_dev_probe
nvme: apple: Drop the PRP null check chicken bit
nvme: apple: Add WARN_ON_ONCE for non page-aligned admin queue buffers
nvme: apple: Never set the opcode in the NVMMU TCB
nvme: apple: Don't set a DMA direction for commands without a data transfer
avb: fix missing break in avb_set_state() switch
dfu: mtd: probe before get_mtd_device_nm()
Prepare v2026.10-rc4
arm: mvebu: armada8k: do not offer the ATF/TEE region as free memory
Merge tag 'efi-2026-10-rc4-2' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-efi
Merge tag 'fsl-qoriq-for-2026.10-rc4' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-fsl-qoriq
configs: ls104{3,6}aqds_tfa: enable PCIe Ethernet
common: kconfig: raise SYS_CBSIZE default to 1024 for FSL_LSCH2/LSCH3
configs: layersc

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...Add-support-for-OpenSSL-Provider-API.patch | 38 ++++++-------
 ...-removed-SWIG-Python-2-compatibility.patch | 55 -------------------
 ...apsule-Detect-GnuTLS-PKCS-11-support.patch | 10 ++--
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  2 +-
 ...ols_2026.07.bb => u-boot-tools_2026.10.bb} |  4 +-
 5 files changed, 27 insertions(+), 82 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2026.07.bb => u-boot-tools_2026.10.bb} (22%)

diff --git a/meta/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API.patch b/meta/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API.patch
index 346d0584d5..caca2955a4 100644
--- a/meta/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API.patch
+++ b/meta/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API.patch
@@ -1,4 +1,4 @@
-From a81cb0932dce109af44d7245d47489fe54ae390f Mon Sep 17 00:00:00 2001
+From fedf11e740e7893eed6590d17e92073fcd7e7841 Mon Sep 17 00:00:00 2001
 From: Eddie Kovsky <ewk@edkovsky.org>
 Date: Mon, 23 Feb 2026 09:43:22 -0700
 Subject: [PATCH] Add support for OpenSSL Provider API
@@ -39,14 +39,14 @@ Changes from upstream:
 
 Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
 ---
- doc/build/gcc.rst      |   4 +-
- lib/aes/aes-encrypt.c |   4 +-
- lib/rsa/rsa-sign.c    | 102 +++++++++++++++++++++++++++++++++++++++---
- tools/docker/Dockerfile |  1 +
- 4 files changed, 103 insertions(+), 8 deletions(-)
+ doc/build/gcc.rst       |   4 +-
+ lib/aes/aes-encrypt.c   |   4 +-
+ lib/rsa/rsa-sign.c      | 103 ++++++++++++++++++++++++++++++++++++++--
+ tools/docker/Dockerfile |   1 +
+ 4 files changed, 104 insertions(+), 8 deletions(-)
 
 diff --git a/doc/build/gcc.rst b/doc/build/gcc.rst
-index 1fef718ceecb..29a6a632e7e3 100644
+index 1fef718ceec..29a6a632e7e 100644
 --- a/doc/build/gcc.rst
 +++ b/doc/build/gcc.rst
 @@ -25,8 +25,8 @@ Depending on the build targets further packages maybe needed
@@ -61,7 +61,7 @@ index 1fef718ceecb..29a6a632e7e3 100644
        python3-pkg-resources python3-pycryptodome python3-pyelftools \
        python3-pytest python3-pytest-xdist python3-sphinxcontrib.apidoc \
 diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
-index 90e1407b4f09..4fc4ce232478 100644
+index 90e1407b4f0..4fc4ce23247 100644
 --- a/lib/aes/aes-encrypt.c
 +++ b/lib/aes/aes-encrypt.c
 @@ -16,7 +16,9 @@
@@ -76,7 +76,7 @@ index 90e1407b4f09..4fc4ce232478 100644
  
  #if OPENSSL_VERSION_NUMBER >= 0x10000000L
 diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
-index 0e38c9e802fd..f456f3c58e65 100644
+index 0e38c9e802f..4990b43a7a6 100644
 --- a/lib/rsa/rsa-sign.c
 +++ b/lib/rsa/rsa-sign.c
 @@ -19,7 +19,47 @@
@@ -128,7 +128,7 @@ index 0e38c9e802fd..f456f3c58e65 100644
  
  static int rsa_err(const char *msg)
  {
-@@ -94,10 +134,11 @@ static int rsa_pem_get_pub_key(const char *keydir, const char *name, EVP_PKEY **
+@@ -94,10 +134,11 @@ err_cert:
   *
   * @keydir:	Key prefix
   * @name	Name of key
@@ -214,7 +214,7 @@ index 0e38c9e802fd..f456f3c58e65 100644
  	return 0;
  }
  
-@@ -226,6 +301,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+@@ -226,6 +302,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
   * @evpp	Returns EVP_PKEY object, or NULL on failure
   * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
   */
@@ -222,7 +222,7 @@ index 0e38c9e802fd..f456f3c58e65 100644
  static int rsa_engine_get_priv_key(const char *keydir, const char *name,
  				   const char *keyfile,
  				   ENGINE *engine, EVP_PKEY **evpp)
-@@ -293,22 +369,25 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+@@ -293,22 +370,25 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
  
  	return 0;
  }
@@ -249,7 +249,7 @@ index 0e38c9e802fd..f456f3c58e65 100644
  	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
  }
  
-@@ -325,6 +404,7 @@ static int rsa_init(void)
+@@ -325,6 +405,7 @@ static int rsa_init(void)
  	return 0;
  }
  
@@ -257,7 +257,7 @@ index 0e38c9e802fd..f456f3c58e65 100644
  static int rsa_engine_init(const char *engine_id, ENGINE **pe)
  {
  	const char *key_pass;
-@@ -380,6 +460,7 @@ static void rsa_engine_remove(ENGINE *e)
+@@ -380,6 +461,7 @@ static void rsa_engine_remove(ENGINE *e)
  		ENGINE_free(e);
  	}
  }
@@ -265,7 +265,7 @@ index 0e38c9e802fd..f456f3c58e65 100644
  
  static int rsa_sign_with_key(EVP_PKEY *pkey, struct padding_algo *padding_algo,
  			     struct checksum_algo *checksum_algo,
-@@ -480,11 +561,13 @@ int rsa_sign(struct image_sign_info *info,
+@@ -480,11 +562,13 @@ int rsa_sign(struct image_sign_info *info,
  	if (ret)
  		return ret;
  
@@ -279,7 +279,7 @@ index 0e38c9e802fd..f456f3c58e65 100644
  
  	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
  			       e, &pkey);
-@@ -496,16 +579,21 @@ int rsa_sign(struct image_sign_info *info,
+@@ -496,16 +580,21 @@ int rsa_sign(struct image_sign_info *info,
  		goto err_sign;
  
  	EVP_PKEY_free(pkey);
@@ -301,7 +301,7 @@ index 0e38c9e802fd..f456f3c58e65 100644
  	return ret;
  }
  
-@@ -645,11 +733,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
+@@ -645,11 +734,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
  	ENGINE *e = NULL;
  
  	debug("%s: Getting verification data\n", __func__);
@@ -315,7 +315,7 @@ index 0e38c9e802fd..f456f3c58e65 100644
  	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
  	if (ret)
  		goto err_get_pub_key;
-@@ -726,8 +816,10 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
+@@ -726,8 +817,10 @@ done:
  err_get_params:
  	EVP_PKEY_free(pkey);
  err_get_pub_key:
@@ -327,7 +327,7 @@ index 0e38c9e802fd..f456f3c58e65 100644
  	if (ret)
  		return ret;
 diff --git a/tools/docker/Dockerfile b/tools/docker/Dockerfile
-index 73bf6cdd2c52..50e98e83dc20 100644
+index ebb679a5f46..c2ccc0ca7db 100644
 --- a/tools/docker/Dockerfile
 +++ b/tools/docker/Dockerfile
 @@ -122,6 +122,7 @@ RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
diff --git a/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch b/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
deleted file mode 100644
index c1d0204e32..0000000000
--- a/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 886616d03b6afcc5ce8b34e7af91f7ccfbb0a5c Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Tue, 11 Aug 2026 13:21:01 +0000
-Subject: [PATCH] pylibfdt: Replace removed SWIG Python 2 compatibility macros
-
-SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
-from its runtime header pyhead.swg (see commit 79f7a2b7cb7d). Replace
-them with their Python 3 C API equivalents:
-
-- PyString_FromString -> PyUnicode_FromString
-- PyString_AsString -> PyBytes_AsString
-- PyInt_AsLong -> PyLong_AsLong
-
-The replacements are safe since the macros were already aliased to
-these exact functions in SWIG's Python 3 code path.
-
-This is a backport of dtc commit 5008d1d6a356 ("pylibfdt: Replace
-removed SWIG Python 2 compatibility macros").
-
-Upstream-Status: Submitted [https://patchwork.ozlabs.org/patch/2283713/]
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- scripts/dtc/pylibfdt/libfdt.i_shipped | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/scripts/dtc/pylibfdt/libfdt.i_shipped b/scripts/dtc/pylibfdt/libfdt.i_shipped
-index e4659489..326a15c7 100644
---- a/scripts/dtc/pylibfdt/libfdt.i_shipped
-+++ b/scripts/dtc/pylibfdt/libfdt.i_shipped
-@@ -1033,7 +1033,7 @@ typedef uint32_t fdt32_t;
- 	PyObject *buff;
- 
- 	if ($1) {
--		resultobj = PyString_FromString(
-+		resultobj = PyUnicode_FromString(
- 			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
- 		buff = PyByteArray_FromStringAndSize(
- 			(const char *)($1 + 1), fdt32_to_cpu($1->len));
-@@ -1064,13 +1064,13 @@ typedef uint32_t fdt32_t;
-         }
-         $1 = PyBytes_AsString($input);
-     %#else
--        $1 = PyString_AsString($input);   /* char *str */
-+        $1 = PyBytes_AsString($input);   /* char *str */
-     %#endif
- }
- 
- /* typemaps used for fdt_next_node() */
- %typemap(in, numinputs=1) int *depth (int depth) {
--   depth = (int) PyInt_AsLong($input);
-+   depth = (int) PyLong_AsLong($input);
-    $1 = &depth;
- }
- 
diff --git a/meta/recipes-bsp/u-boot/files/0001-tools-mkeficapsule-Detect-GnuTLS-PKCS-11-support.patch b/meta/recipes-bsp/u-boot/files/0001-tools-mkeficapsule-Detect-GnuTLS-PKCS-11-support.patch
index 68865af481..e0323abef8 100644
--- a/meta/recipes-bsp/u-boot/files/0001-tools-mkeficapsule-Detect-GnuTLS-PKCS-11-support.patch
+++ b/meta/recipes-bsp/u-boot/files/0001-tools-mkeficapsule-Detect-GnuTLS-PKCS-11-support.patch
@@ -1,4 +1,4 @@
-From 007b77c2f51d4c1c696fbf1ff92694b585b35f57 Mon Sep 17 00:00:00 2001
+From 1f5b573d5340b66bf09310e8331064ca53a2d7d2 Mon Sep 17 00:00:00 2001
 From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
 Date: Tue, 9 Jun 2026 09:01:04 +0200
 Subject: [PATCH] tools: mkeficapsule: Rework pkcs11 support
@@ -22,10 +22,10 @@ Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
  2 files changed, 77 insertions(+), 23 deletions(-)
 
 diff --git a/tools/Makefile b/tools/Makefile
-index 1a5f425ecdaa..e85f5a354b81 100644
+index 535a5d51c89..607d6d8ff8b 100644
 --- a/tools/Makefile
 +++ b/tools/Makefile
-@@ -271,6 +271,11 @@ mkeficapsule-objs := generated/lib/uuid.o \
+@@ -272,6 +272,11 @@ mkeficapsule-objs := generated/lib/uuid.o \
  	$(LIBFDT_OBJS) \
  	mkeficapsule.o
  hostprogs-always-$(CONFIG_TOOLS_MKEFICAPSULE) += mkeficapsule
@@ -38,7 +38,7 @@ index 1a5f425ecdaa..e85f5a354b81 100644
  include tools/fwumdata_src/fwumdata.mk
  
 diff --git a/tools/mkeficapsule.c b/tools/mkeficapsule.c
-index ec640c57e8a5..c3cf48f4cc1d 100644
+index ec640c57e8a..9ac686f51a8 100644
 --- a/tools/mkeficapsule.c
 +++ b/tools/mkeficapsule.c
 @@ -207,6 +207,71 @@ static int write_capsule_file(FILE *f, void *data, size_t size, const char *msg)
@@ -175,5 +175,3 @@ index ec640c57e8a5..c3cf48f4cc1d 100644
  				gnutls_strerror(ret));
  			return -1;
  		}
--- 
-2.47.3
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index ece0fade55..9d217f13a5 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,7 +14,7 @@ CVE_PRODUCT = "u-boot:u-boot denx:u-boot"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "ece349ade2973e220f524ce59e59711cc919263f"
+SRCREV = "5508406582f6f7120dce0c4b3059819a41788db2"
 
 SRC_URI = "git://git.u-boot-project.org/u-boot/u-boot.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch \
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.10.bb
similarity index 22%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2026.10.bb
index 9e7a178310..b28afecf72 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.10.bb
@@ -1,4 +1,6 @@
 require u-boot-common.inc
 require u-boot-tools.inc
 
-SRC_URI += "file://0001-tools-mkeficapsule-Detect-GnuTLS-PKCS-11-support.patch"
+SRC_URI += "git://git.u-boot-project.org/u-boot/u-boot.git;protocol=https;branch=main;tag=v${PV} \
+           file://0001-Add-support-for-OpenSSL-Provider-API.patch \
+           "
-- 
2.47.1


--===============1379261659734509085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="u-boot-changelog.txt"

Prepare v2026.10
MAINTAINERS: Fix Lukasz email
Gitlab CI: Temporarily limit thread count on world builds
board: beacon: Remove i.MX8MP Beacon EmbeddedWorks Devkit support
board: beacon: Remove i.MX8MN Beacon EmbeddedWorks Devkit support
board: beacon: Remove i.MX8MM Beacon EmbeddedWorks Devkit support
board: beacon: Remove Beacon EmbeddedWorks RZ/G2 Dev Kit support
board: davinci: Remove DA850 EVM support
board: logicpd: Remove AM3517 EVM support
board: logicpd: Remove i.MX6 SOM support
board: logicpd: Remove OMAP3 SOM support
Merge tag 'efi-2026-10-rc6' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-efi
lmb: Add StarFive JH-7110 SoC as requiring DMA below 4GiB
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
sh
boot: mention sbox in efi loader boot method doc
efi_loader: fix efi_http_instance free on error
Merge patch series "fsl, powerpc: Fix SPD read and appended DTB alignment"
board: cssi: Move alignment padding into __u_boot_list section
powerpc: mpc85xx: Move alignment padding into __u_boot_list section
ddr: fsl: Fix SPD read when legacy I2C is used
Merge tag 'u-boot-dfu-20260929' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-dfu
usb: dwc3-generic: Fix ref clock enable error check
power: domain: renesas-r8a78000: Add SDK SCP 4.39 map
power: domain: renesas-r8a78000: Add SDK SCP 4.37 map
clk: renesas: Add SDK SCP 4.39 map to Renesas R-Car R8A78000 X5H CPG clock
driver
clk: renesas: Add SDK SCP 4.37 map to Renesas R-Car R8A78000 X5H CPG clock
driver
configs: Resync with savedefconfig
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
usb
usb: dwc3-generic: fix ref clock lookup indexing wrong clk_bulk array
usb: gadget: f_mass_storage: Synchronously tear interface down
usb: gadget: rockusb: terminate full-speed descriptors
Prepare v2026.10-rc5
Merge tag 'u-boot-stm32-20260921' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-stm
fw_env: do not create lockfile with read access for others
MAINTAINERS: Update some SoCFPGA related addresses
ARM: dts: Add bootph-all in ltdc node for sqtm32mp235f-dk-u-boot
ARM: dts: Add bootph-all in ltdc node for stm32mp257f-dk-u-boot
Merge tag 'u-boot-rockchip-2026.10-20260918' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-rockchip
Revert "Clean up emails from non-existing domains"
Clean up emails from non-existing domains
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
sh
clk: versaclock: Fix incorrect error check in versaclock_probe()
arm64: renesas: Enable FFA on Renesas R-Car X5H R8A78000
arm64: renesas: Drop empty board_early_init_f() from Renesas R-Car Gen5 common
code
arm64: renesas: Drop CNTP from Renesas R-Car Gen5 common code
arm: renesas: Drop SYS_ARCH_TIMER on R-Car R8A78000 X5H Cortex-M33 RSIP
Merge tag 'u-boot-dfu-20260914' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-dfu
Merge tag 'net-20260915' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-net
board: anbernic: Fix the RG-DS Kconfig target guard
fastboot: fix the RK3328 buffer-address default
test: dm: nfs: Add regression tests for the NFS reply-length checks
net: nfs: Bound the length of an NFS readlink reply
net: nfs: Bound the length of an NFS read reply
u-boot: fix error check in eth init
net: airoha: fix PCS calibration retry limit
net: net6: validate IPv6 payload and transport lengths on receive
net: lwip: allow DHCP to stop without releasing its lease
net: lwip: add an HTTP client abort operation
net: lwip: allow DNS callbacks to be canceled
net: lwip: return ERR_ABRT after aborting wget receive
test: dm: eth: add DHCPv6 oversized option regression tests
net: dhcp6: bound received DUID option lengths
MAINTAINERS: tee: update Jens Wiklander's email address
env: Update description of single to redundant environment upgrade path
Merge tag 'u-boot-pci-fixes-20260911' of https://git.u-boot-
project.org/u-boot/custodians/neil.armstrong/u-boot-pci
Merge tag 'u-boot-nvme-fixes-20260911' of https://git.u-boot-
project.org/u-boot/custodians/neil.armstrong/u-boot-nvme
dm: pci: fix uninitialized fdt_pci_addr fall-through in pci_get_devfn
pci: Iterate over busses using uclass_foreach_dev_probe
nvme: apple: Drop the PRP null check chicken bit
nvme: apple: Add WARN_ON_ONCE for non page-aligned admin queue buffers
nvme: apple: Never set the opcode in the NVMMU TCB
nvme: apple: Don't set a DMA direction for commands without a data transfer
avb: fix missing break in avb_set_state() switch
dfu: mtd: probe before get_mtd_device_nm()
Prepare v2026.10-rc4
arm: mvebu: armada8k: do not offer the ATF/TEE region as free memory
Merge tag 'efi-2026-10-rc4-2' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-efi
Merge tag 'fsl-qoriq-for-2026.10-rc4' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-fsl-qoriq
configs: ls104{3,6}aqds_tfa: enable PCIe Ethernet
common: kconfig: raise SYS_CBSIZE default to 1024 for FSL_LSCH2/LSCH3
configs: layerscape: drop CONFIG_SYS_PBSIZE=532 override
configs: layerscape qds: enable OF_LIBFDT_OVERLAY
configs: ls2088aqds_tfa: fix NOR flash write failure
configs: layerscape qds: disable ENV_RELOC_GD_ENV_ADDR for NOR boot
docs: u-boot-stats-v2026.07: Regenerate
doc: board: ti: correct path to tcl scripts
doc: board: ti: am64x: add missing debugging section
efi_loader: Remove duplicate declarations
efi_loader: consider type of platform_get_rng_device() return value
efi_loader: remove debug in platform_get_rng_device
Merge patch series "board: ti: update and correct files MAINTAINERS entries"
board: ti: j722s: update the MAINTAINERS entry
board: ti: j721s2: update MAINTAINERS entries
board: ti: j721e: update MAINTAINERS entries
board: ti: j7200: update MAINTAINERS entries
board: ti: am62px: update MAINTAINERS entries
board: ti: am62dx: update MAINTAINERS entries
board: ti: am62ax: update MAINTAINERS entries
board: ti: am62x: add files to MAINTAINERS entries
board: ti: j721s2: split boards into separate maintainer entries
board: ti: j721e: split boards into separate maintainer entries
board: ti: am64x: split the EVM and SK board entries
board: ti: am62x: split board variants into separate maintainer entries
board: ti: correct names in MAINTAINERS file
board: ti: sort file entries in MAINTAINERS files
Merge tag 'u-boot-imx-main-20260906' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-imx
ddr: imx: Reload the training firmware for every PHY configuration
arm64: dts: imx: Increase malloc area size on Data Modul i.MX8M eDM SBC
arm64: dts: imx: Fix EEPROM address on Data Modul i.MX8M Plus eDM SBC
net: fsl_enetc: fix all interfaces getting named enetc-0 on LS1028A
power: regulator: mpq8785: match the MPS MPQ8646
net: ldpaa_eth: fix error logics of unconfigured DPMACs
spi: fsl_dspi: match the Layerscape DSPI compatibles
include/env.h: use plain old #ifdef CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG
board: tqma6ul: Add missing include
Merge patch series "fit: Harden handling of external-data properties"
spl: fit: Bound external data like U-Boot proper
spl: fit: Harden external-data offset and size arithmetic
test: spl: Factor out external-data FIT property checks
image-fit: Use unsigned types for external data properties
fw_env: use env-size property for nvmem layout device detection
fw_env: allow detection of NVMEM device using layout node compatible string
Merge tag 'xilinx-for-v2026.10-rc4' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-amd
fpga: xilinx: Check bitstream length against the supplied buffer
spi: xilinx_spi: fix premature transfer termination at low SCK
board: xilinx: versal-net: move platform_id/platform_version to .data
board: amd: versal2: move platform_id/platform_version to .data
arm64: versal2: Initialize num_banks variable in dram_init()
xilinx: Move u-boot-microblaze to u-boot-amd
MAINTAINERS: Move u-boot-microblaze to u-boot-amd
configs: sc5xx: set default FDT file
Merge tag 'u-boot-stm32-20260902' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-stm
board: st: Fix compilation issue
Merge tag 'u-boot-stm32-20260831' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-stm
ARM: stm32mp2: fix TAMP_FWU_BOOT_IDX_MASK/OFFSET definition
ram: stm32mp1: bound the invalid-argument message in stm32mp1_ddr_subcmd()
Merge tag 'efi-2026-10-rc4' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-efi
binman: gbb: update link
binman: btool: bootgen: update link to user guide
doc: switch to HTTPS for a few links
doc: develop/sending_patches: use link from ozlabs.org mailman archive
doc: chromium/chainload: update instructions on booting on Snow
doc: develop/sending_patches: remove mention to the test mailing list
doc: develop/bootstd: fix link to distro_boot
doc: index: update link to mailing list info
doc: fix broken links to mailing lists
doc: board/renesas: update clone instructions to use new GitLab
doc: develop/tests_writing: update links to new GitLab
doc: board/siemens: iot2050: update links to files on GitHub
doc: board/highbank: update links to cxmanage and ipmitool tools
doc: build/gen_compile_commands: update link to point to the right page
doc: learn/talks: remove dead links to slides
doc: bootstd: update link to BSL
doc: board/tbs: update link to TRM
doc: develop/driver-model: fs_firmware_loader: update link
doc: chromium: update links to slides
doc: chromium: update Firmware porting guide link
doc: chromium: update link to Developer Mode
doc: board/allwinner: update link to MTD utils
doc: develop/uefi: stop tripping linkcheck
doc: arch/arc: update link
doc: board/nxp: mx6ullevk: replace broken link
doc: develop/coccinelle: remove dead link in supplemental documentation
doc: develop/coccinelle: update links
doc: arch/sh: remove squatted URL
doc: board/google: chromebook_link: update link to blobs
doc: usage/pxe: use redirect link
doc: develop: sending_patches: update link to GPL license
doc: develop: sending_patches: update link to Email Clients and Patches
doc: board/amlogic: jethub-j80: use redirect link directly
doc: board/amlogic: jethub-j100: update product page
doc: develop: uefi: update link to ipxe git repo
doc: arch/x86: manual_boot: update links to slides
doc: arch/x86: update link to ACPI
doc: arch/x86: update link to SeaBIOS
doc: arch/x86: update MP link
doc: arch/x86: update SFI link
doc: arch/x86: update link to DediProg SO8 Testclip
doc: arch/x86: fix URL to em100
doc: develop: sending_patches: fix links to pw-am.sh
doc: arch/x86: fix "link" to IRQ router DT binding
doc: arch/mips: update link for Buildroot toolchain
lib: correct list_guid[] array
rng: Fix build with SPL/TPL
test: boot: measurement: Fix compilation for non-sandbox builds
MAINTAINERS: Use proper Orphan status marking
fix non-existing sysam.it domain
Merge patch series "fs/squashfs: fix two out-of-bounds reads on crafted images"
fs/squashfs: bound fragment offset/size in sqfs_read_nest()
fs/squashfs: bound the inode table walk in sqfs_find_inode()
Merge patch series "fs/squashfs: fix directory table integer overflow"
test: squashfs: add directory table overflow regression test
fs/squashfs: fix integer overflow in directory table allocation
Merge patch series "fs/squashfs: bounds checks on image-controlled offsets"
fs/squashfs: bound the offset returned by sqfs_dir_offset()
fs/squashfs: bound fragment table accesses in sqfs_frag_lookup()
Prepare v2026.10-rc3
Merge patch series "boot: image-fdt: Restore suppression of irrelevant ERROR
message"
boot: image-fdt: Restore suppression of irrelevant ERROR message
lmb: Return -EFAULT when freeing unallocated memory regions
lmb: Return -EFAULT when requested region is not part of memory map
disk: ubi: use a format string when copying the volume name
test: dm: hash: check digest size before memset
Merge patch series "sc59x: Disable CONFIG_EFI_LOADER"
Merge patch series "gunzip: Fix spurious Z_BUF_ERROR in chunked gzwrite
decompression"
Merge tag 'u-boot-dfu-20260819' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-dfu
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
sh
arm64: dts: renesas: r8a779g3: Drop set VDDQ18_25_AVB voltage on Retronix R-Car
V4H Sparrow Hawk EVTB1
arm64: dts: renesas: r8a779g3: Drop invert microSD voltage selector on Retronix
R-Car V4H Sparrow Hawk EVTB1
arm64: dts: renesas: r8a779g3: Drop generic SPI NOR support on Retronix R-Car
V4H Sparrow Hawk board
arm64: renesas: r8a779g3: Switch to distro boot command on Retronix R-Car V4H
Sparrow Hawk
arm64: renesas: r8a779g3: Add bootloader update environment on Retronix R-Car
V4H Sparrow Hawk
arm64: renesas: r8a779g3: Add PCIe firmware environment on Retronix R-Car V4H
Sparrow Hawk
doc: board: renesas: Document Retronix R-Car Gen4 V4H Sparrow Hawk SPI NOR
layout
pci: pcie-rcar-gen4: Switch to devm_*() GPIO and reset
pci: pcie-rcar-gen4: Avoid repeated link attempts
pci: pcie-rcar-gen4: Switch to generic firmware loader
remoteproc: renesas: rsip: Implement core status
remoteproc: renesas: rsip: Implement SCMI core stop
remoteproc: renesas: rsip: Reset SCP core on stop
configs: adi: sc594: disable CONFIG_EFI_LOADER
configs: adi: sc598: disable CONFIG_EFI_LOADER
test: cmd: Add gzwrite chunk boundary regression test
gunzip: Fix spurious Z_BUF_ERROR in chunked gzwrite decompression
remoteproc: renesas: rsip: Extract SCP initialization from board file
remoteproc: renesas: rsip: Improve error print
remoteproc: renesas: rsip: Clear SCMI transport flags
pylibfdt: Replace removed SWIG Python 2 compatibility macros
arm: dts: k3-am625-beagleplay: add bootph tags to pmic regulators
Merge tag 'u-boot-rockchip-2026.10-20260813' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-rockchip
Merge tag 'net-20260813' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-net
net: srand_mac(): fix -ENODEV crash with CONFIG_DM_RNG
Merge tag 'xilinx-for-v2026.10-rc3' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-amd
net: lwip: dhcp: fix DHCP fine timer interval
bootstd: android: bound the boot image read by its partition size
MAINTAINERS: Add missing fragment for Versal Gen 2
ufs: amd-versal2: Remove ZYNQMP_FIRMWARE dependency
xilinx: versal2: Clean UFS firmware interface
ufs: amd-versal2: Perform controller reset in the init callback
xilinx: versal2: Add PM UFS firmware interface
firmware: zynqmp: Remove duplicated sys_proto.h header
xilinx: zynqmp: Enable SPL for zynqmp mini
xilinx: zynqmp: Setup BOARD_SIZE_LIMIT for mini configurations
xilinx: mbv: Enable SPL_REMAKE_ELF support
xilinx: mbv: Disable arch-specific memory functions in SPL
xilinx: mbv: Disable CPU driver in SPL
spi: zynqmp_gqspi: fix quad mode bus conflict
board: xilinx: Generate FWU capsule dfu_alt_info from fwu_platform_hook()
arm64: versal2: Select GIC redistributor base at runtime
arm64: versal2: Make hardware.h assembly safe
rockchip: rk3576: Disable force_jtag by default
include: linux: Import hw_bitfield.h from Linux v6.18
Merge tag 'fsl-qoriq-for-2026.10-rc3' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-fsl-qoriq
armv8: layerscape: Fix TF-A DRAM reservation with empty banks
scmi: pinctrl: Rename SCMI_PIN_DEFUALT to SCMI_PIN_DEFAULT
power: regulator: tps65219: Fix LDO selector boundaries
pci: layerscape: fix pci_iommu_extra hotplug
arm: dts: layerscape: drop leading zeros from unit addresses
power: pmic: tps65219: fail if regulators node is missing
firmware: scmi: Support probe vendor ID 0x81
cmd: scmi: Show names for vendor protocols 0x80 and 0x82
Prepare v2026.10-rc2
board_f: Call initf_malloc() before fdtdec_setup()
Makefile: depend on OF_LIST dts sources for fit-dtb.blob
bootretry: only reinitialize retry_time when bootretry env variable has been
touched
arm: mach-k3: j784s4: Add clk and power support for main_uart2 and main_uart3
serial: coreboot: Accept DBG2 subtype 0x12
cmd: scsi: Drop duplicate leading scsi prefix
mtd: cfi: Replace env_get_f() with env_get_yesno()
Merge patch series "fs: btrfs: report file sizes from readdir"
fs: btrfs: deduplicate the inode size lookup
fs: btrfs: release the path when btrfs_search_slot() fails
fs: btrfs: report file sizes from readdir
Merge patch series "boot: fit: authenticate the dm-verity roothash"
test: fit: verify dm-verity roothash is covered by the config signature
boot: fit: cover the dm-verity roothash with the config signature
boot: fit: factor out node-path collection in fit_config_add_hash()
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
usb
usb: mtu3: add SPL support
usb: mtu3: support the upstream devicetree binding
doc: usb: remove obsolete MediaTek MTU3 bindings
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
sh
arm64: dts: renesas: ironhide: Describe inline ECC carveouts
arm64: dts: renesas: ironhide: Describe all reserved memory
arm: renesas: Store env in HF on R-Car R8A78000 X5H Cortex-M33 RSIP port
arm: renesas: Enable RPC on R-Car R8A78000 X5H Cortex-M33 RSIP port
arm: renesas: Bind RPC on R-Car R8A78000 X5H Cortex-M33 RSIP port
arm: renesas: Disable MMC support on R-Car R8A78000 X5H Cortex-M33 RSIP port
ufs: rcar-gen5: Switch from FASTAUTO mode to FAST mode
mtd: spi: renesas: Add R-Car Gen5 DT compatible
mtd: spi: renesas: Align macro prefixes
mtd: rpc: renesas: Add R-Car Gen5 DT compatible
mtd: rpc: renesas: Switch to dev_read_addr_name()
Merge tag 'u-boot-imx-main-20260807' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-imx
Gitlab CI: sage: Disable test_net_tftpboot_boot on Raspberry Pi 4 for now
Merge tag 'mediatek-for-main-2026-08-05' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-mediatek
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
riscv
Merge tag 'u-boot-watchdog-20260803' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-watchdog
Merge tag 'fwu-main-03082026' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-tpm
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
sh
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
usb
binman: nxp_imx8mcst: Handle FCFB header during SPI NOR boot
imx: Add FRDM-IMX95 initial support
clk: mediatek: mt8188: fix top0 gate polarity
arm: mediatek: use phase-aware PSCI reset on MT8188
cmd: ufetch: fix compiling with no CONFIG_SYS_CONFIG_NAME
board: sophgo: add support for Milk-V Duo 256M
board: sophgo: move ethernet driver to common directory
mailbox: mpfs: add bounded wait for BUSY to clear before sending request
mailbox: mpfs-mbox: replace unbounded BUSY polling with bounded waits
configs: microchip_mpfs_generic: enable MPFS RNG support
rng: add Microchip PolarFire SoC hardware RNG driver
misc: mpfs_syscontroller: bind RNG sub-device
misc: mpfs_syscontroller: add mailbox RX helper for service responses
net: rtl8169: add support for RTL8126A and RTL8127A
watchdog: ast2600: add AST2700 support
cyclic: return early from cyclic_run() if the list is empty
cyclic: get rid of cyclic_get_list() helper
toradex: tdx-cfg-block: Add Aquila iMX95 0243 PID4
arm: imx: initialize the system counter earlier on i.MX7
imx: scmi: suppress invalid origin/errid in reset reason print
binman: add CST backend selection for i.MX8M signing
board: phycore_imx8mm: add 1 and 4GB RAM timings
board: phycore_imx8mm: update RAM timings
fwu: Make boottime check failures visible
arm: dts: renesas: Remove unused OPP nodes from R-Car H3/M3-W/M3-W+/M3-N
pinctrl: renesas: Further minimize R8A77965 M3-N PFC tables
pinctrl: renesas: Further minimize R8A77960 M3-W and R8A77961 M3-W+ PFC tables
pinctrl: renesas: Further minimize R8A77951 H3 PFC tables
Revert "arm64: dts: renesas: r8a779g3: Reinstate basic PCIe clock description
for Sparrow Hawk"
arm64: renesas: r8a779g3: Enable PCIe clock generator and I2C mux drivers on
Retronix R-Car V4H Sparrow Hawk board
pci: pcie-rcar-gen4: Handle always on reference clock
clk: rs9: Add Renesas 9-series PCIe clock generator driver
clk: renesas: Add SDK SCP 4.36 map to Renesas R-Car R8A78000 X5H CPG clock
driver
usb: mtu3: wait for TX FIFO to drain before disconnect
MAINTAINERS: Update SH/SoCFPGA/USB email addresses
Merge tag 'efi-2026-10-rc2-2' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-efi
Merge tag 'u-boot-at91-fixes-2026.10-a' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-at91
Merge tag 'u-boot-marvell-20260731' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-marvell
efi_loader: fix use of uninitialized guid in variable enumeration loops
doc: cmd: gpt: Reinstate gpt setenv
README: Slightly rephrase env set and env print paragraph
doc: CONTRIBUTE: replace "as" with "like"
efi_loader: fix memory leak in efi_sigstore_parse_siglist
efi: Print ISA-specific and unknown memory attributes
efi: Unify the memory map output of 'efi mem' and 'efidebug memmap'
arm: mvebu: Add Allied Telesis x960 board
arm: mvebu: Update docs for Allied Telesis x220
arm: mach-mvebu: Add more AC3 & PC3 variants
arm64: a37xx: pinctrl: fix info->dev used but never set
Merge tag 'mmc-for-2026.10-rc2' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-mmc
test: net: add regression test for IP reassembly overflow
net: fix out-of-bounds write in IP fragment reassembly
crypto: hash: use DM providers from hash command
spl: atf: fix BL32 entry point for multi-segment TEE images
Merge patch series "rtc: pcf8563: HYM8563 support and unreliable-time reporting"
rtc: pcf8563: return -EINVAL when the voltage-low flag is set
rtc: pcf8563: add haoyu,hym8563 compatible
x86: add support for CONFIG_REMAKE_ELF
CI: Azure: Correctly skip semihosting tests on vexpress_fvp
mailmap: update entry for Christopher Obbard
arm: qcom: Update ipq5424-rdp466-u-boot.dtsi for v7.1-dts changes
arm: imx943: Update dts files to build with v7.1-dts tag
Subtree merge tag 'v7.1-dts' of dts repo [1] into dts/upstream
Squashed 'dts/upstream/' changes from 0f7b6a4fa8c5..e8613e1cf445
clk: mediatek: drop probe-after-bind provider setup
clk: mediatek: probe parent providers on demand
clk: mediatek: mt8188: add display related clock driver
clk: mediatek: get the clock tree from the driver data in mtk_common_clk_init
clk: mediatek: remove the dedicated clock gate code path
clk: mediatek: mt8189: use driver data to store the clock tree
clk: mediatek: mt8189: deduplicate clock gate drivers
clk: mediatek: mt8512: use driver data to store the clock tree
clk: mediatek: mt8512: deduplicate clock gate drivers
clk: mediatek: mt8365: use driver data to store the clock tree
clk: mediatek: mt8365: deduplicate clock gate drivers
clk: mediatek: mt8195: use driver data to store the clock tree
clk: mediatek: mt8195: deduplicate clock gate drivers
clk: mediatek: mt8518: use driver data to store the clock tree
clk: mediatek: mt8518: deduplicate clock gate drivers
clk: mediatek: mt8516: use driver data to store the clock tree
clk: mediatek: mt8516: deduplicate clock gate drivers
clk: mediatek: mt8183: use driver data to store the clock tree
clk: mediatek: mt8183: deduplicate clock gate drivers
clk: mediatek: mt7988: use driver data to store the clock tree
clk: mediatek: mt7988: deduplicate clock gate drivers
clk: mediatek: mt7987: use driver data to store the clock tree
clk: mediatek: mt7987: deduplicate clock gate drivers
clk: mediatek: mt7986: use driver data to store the clock tree
clk: mediatek: mt7986: deduplicate clock gate drivers
clk: mediatek: mt7981: use driver data to store the clock tree
clk: mediatek: mt7981: deduplicate clock gate drivers
clk: mediatek: mt7629: use driver data to store the clock tree
clk: mediatek: mt7629: deduplicate clock gate drivers
clk: mediatek: mt7623: use driver data to store the clock tree
clk: mediatek: mt7623: deduplicate clock gate drivers
clk: mediatek: mt7622: use driver data to store the clock tree
clk: mediatek: mt7622: deduplicate clock gate drivers
clk: mediatek: mt8188: use driver data to store the clock tree
clk: mediatek: mt8188: deduplicate clock gate drivers
power: regulator: ADD PMIC PF9453 support
power: pmic: ADD PMIC PF9453 support
power: domain: renesas-r8a78000: Add SDK SCP 4.36 map
mmc: enable CMD23 for multi-block transfers
mmc: fix mmc_deinit regression when card is at 1.8V signaling
mmc: fix mmc_bwrite() ignoring host get_b_max() callback
mmc: sdhci: fix align_buffer memory leak on re-initialization
mmc: rpmb: fix tautological condition in RPMB_REQ_READ_DATA validation
mmc: fix mmc_poll_for_busy() false timeout when card is ready
ram: k3-ddrss: fix ecc range checking bug
Kconfig: ram: select FDT_64BIT for K3_INLINE_ECC
cmd/mtd.c: fix do_mtd_io doesn't support 64bit user address
board: phytec: phycore_am68x: Turn off pmic watchdog
arm: dts: k3-am68-phyboard-izar-u-boot: Add mcu_i2c0
serial: avoid redundant early UART initialization
arm: dts: Add SD dts for the sc598 EZKIT
tools: binman: pass KEYDIR to FIT entries
pinctrl: single: parse gpio-range as a raw array (O(N^2) -> O(N))
Merge patch series "Enable Ethernet boot on SK-AM62A-LP"
doc: board: ti: am62ax_sk: Add document for Ethernet boot on AM62x SoC.
arm: dts: k3-am62a7-sk-u-boot: Enable DM services for main_pktdma
configs: am62ax_evm_a53_ethboot: Enable config options required to enable
Ethernet boot
configs: am62ax_evm_r5_ethboot: Enable config options required for Ethernet boot
Merge tag 'u-boot-nvme-next-20260728' of https://git.u-boot-
project.org/u-boot/custodians/neil.armstrong/u-boot-nvme
Merge tag 'u-boot-ufs-fixes-20260728' of https://git.u-boot-
project.org/u-boot/custodians/neil.armstrong/u-boot-ufs
Merge tag 'efi-2026-01-rc2' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-efi
Merge tag 'u-boot-dfu-20260728' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-dfu
Merge tag 'u-boot-imx-main-20260727' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-imx
Prepare v2026.10-rc1
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
sunxi
sandbox: fix enum host_platform_flags description
Merge tag 'u-boot-rockchip-2026.10-20260724' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-rockchip
Merge patch series "fs: regression-safe load <iface> for null_dev_desc_ok
fstypes"
efi_loader: check efi_deserialize_load_option() in get_dp_device()
test: check default GUID selection of signature database variables
cmd: nvedit_efi: use efi_auth_var_get_guid() for the default GUID
doc: board: renesas: Document Renesas R-Car Gen5 RSIP Cortex-R52 start
doc: Switch from printenv to env print
doc: Switch from setenv to env set
doc: thead: lpi4a: detail how to enable fastboot
efi_loader: set correct frame buffer address
board: gateworks: fsa: bound FSA EEPROM gpio descriptor count
configs: tqma6ul: add support for redundant environment
board: tqma6: add kernel device tree handling for environment
board: tqma6: implement ENET errata workaround detection
board: tqma6: use runtime SoC detection in enet setup
dts: tqma6: mba6: remove old device trees
ARM: dts: tqma6: add boot phase properties
board: tqma6: change U-Boot device tree fragments
rtc: snvs: Add i.MX SNVS RTC driver
arm64: imx: Handle both MMC2 and SD2 boot devices on Data Modul i.MX8M Mini eDM
SBC
toradex: tdx-cfg-block: Add verdin am62 0242 pid4
toradex: tdx-cfg-block: Add smarc imx8mp 0240 pid4
toradex: tdx-cfg-block: Add verdin imx8mm 0239 pid4
toradex: tdx-cfg-block: Add verdin imx8mp 64gb emmc pid4s
toradex: tdx-cfg-block: Add apalis imx8qm 64gb emmc pid4s
toradex: tdx-cfg-block: Add aquila tda4 0230 pid4
toradex: tdx-cfg-block: Add smarc imx95 0229 pid4
board: toradex: aquila-imx95: detect RAM sizes
board: toradex: smarc-imx95: detect RAM sizes
imx9: scmi: Update get mac from fuse for iMX952
test: py: load: check null_dev_desc_ok dispatch
doc: usage: cmd: load: null-block-device
fs: dispatch null_dev_desc_ok filesystems before lookup
imx93_frdm: Add OP-TEE device tree node
arm64: dts: imx8mn: Drop nxp,fspi-header-filename
arm64: dts: imx8mm: Drop nxp,fspi-header-filename
binman: imx8mimage: Generate FSPI header in binman instead of mkimage
ge: common: vpd_reader: fix errloc array size in verify_bch()
boards: tqma6ul: select TQ_COMMON_SYSINFO
arm: dts: tqma6ul: integrate tq,eeprom sysinfo driver
arm: dts: tqma6ul: add eeprom nvmem-layout
sysinfo: tq_eeprom: select NVMEM
arm64: dts: imx8m: Reinstate TEE ifdeffery
mx6: ddr: Subtract half a cycle instead of three quarters of a cycle after DQS
gating calibration
arm: dts: imx943-evk: Add label for gpio expander devices
imx9: scmi: reset GPIO2 according its node status
imx9{4, 5, 52}_evk: power on mcore according to SM config
imx9: bootaux: Support booting CM70, CM71 and CM33 sync cores
imx9: bootaux: Support authenticate signed Mcore container image
Merge https://git.u-boot-project.org/u-boot/custodians/u-boot-riscv
board: purism: Add support for the Librem5 devkit
doc: android: refresh AVB provenance and pin libavb reference
libavb: update to AOSP 1.3.0
serial: sifive: remove busy-loops from getc and putc ops
riscv: remove log_debug() in enable_caches()
MAINTAINERS: riscv: Add myself as a reviewer
rng: jh7110: Fix invalid usage of dev_read_addr
riscv: Exclude ACLINT for TARGET_XILINX_MBV
riscv: Make RISCV_ACLINT visible
riscv: Skip riscv_cpu_setup() when CPU driver is disabled
board: starfive: visionfive2: Support VisionFive 2 Lite eMMC
configs: visionfive2: Add VisionFive 2 Lite eMMC DT to OF_LIST
riscv: dts: cv18xx: fix spi node name
doc: sophgo: licheerv_nano: fix incorrect step numbering
configs: radxa-cubie-a5e: enable the gmac1 controller
net: dwc_eth_qos: add support for sun55i platform
arm: mach-sunxi: add syscon driver for system-control nodes
clk: sunxi: a523: add MBUS_EMAC1 clock gate
pinctrl: sunxi: a523: add gmac1 support
sunxi: configs: OrangePi 4A: enable SPI
sunxi: configs: Radxa Cubie A5E: enable SPI
sunxi: spl: spi: Add support for Allwinner A523
sunxi: spl: spi: Clean up SPI0 pinmux setting
spi: sunxi: add support for A523 SPI controller
mmc: sunxi: fix MACH_SUN9I typo in get_mclk_offset()
Merge patch series "fs/squashfs: fix symlink load failure on large images"
fs/squashfs: fix dirs->entry leaks on sqfs_search_dir() error paths
fs/squashfs: add sqfs_dir_offset() error checks
fs/squashfs: fix heap exhaustion during symlink resolution
Azure CI: Drop Windows host tools builds
fit: prefer the default configuration on best-match ties
MAINTAINERS: Replace Atmel with N:
.mailmap: map the old U-Boot mailing list address to the new one
avb: free mmc_part allocated by get_partition()
boot: android: fix AvbOps and verify-data leaks in AVB path
arm: armv8: mmu: fix DCACHE_OFF incorrectly unmapping region
serial: esp32: add driver for esp32 series chips
bootm: teach handle_decomp_error() about the noload decompression buffer
cmd: mbr: return false instead of NULL from bool found_key()
cmd: pstore: bound path formatting with snprintf to avoid stack overflow
cmd: strings: interpret second argument as a byte count
cmd: date: Handle -ENOSYS return from dm_rtc_reset()
Merge patch series "tools: mkimage: fix stale data pointer in fit_import_data()"
test: py: add regression test for fit_import_data() stale state
tools: mkimage: fix stale data pointer in fit_import_data()
Merge tag 'mediatek-for-main-2026-07-22' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-mediatek
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
usb
mtd: nand: raw: rockchip_nfc: fix ecc setup
net: nfs: clean up bounds checks in nfs_readlink_reply()
net: dwc_eth_xgmac: Return -ENODEV when phy_connect() fails
cmd: lwip: wget: free mbedtls x509 cert context to avoid memory leak
cmd: lwip: sntp: fix netif leak when ntpserverip is unset
net: lwip: handle chained pbufs in transmit path
net: lwip: add tftpsrv command
net: Drop unnecessary device_set_name
net: phy: fix duplicate eth_phy binding
net: phy: dp83867: enable extended read / write for driver
rockchip: rk3588s: Add support for ROC-RK3588S-PC
rockchip: pinctrl: use include from dts/upstream
rockchip: pinctrl: replace RK_GPIOn defines
rockchip: pinctrl: replace RK_FUNC_n defines
MAINTAINERS: update ARM ROCKCHIP entry to list Simon as reviewer
rockchip: only build GPT capsule update helpers with PARTITION_TYPE_GUID
Merge patch series "i3c: dw: fix slave device setup and probe issues"
i3c: dw: fix slave device setup after DAA
configs: versal2: enable I3C support
cmd: i3c: fix list and current needing pre-selected controller
i3c: dw: make resets optional in probe
configs: mediatek: enable MT8188 power domain
power: domain: mediatek: add MT8188 power domain driver
power: domain: mediatek: add support for the power-controller model
power: domain: mediatek: rename struct mtk_scp_domain to mtk_scpsys
power: domain: mediatek: rename mtk_power_domain_probe to mtk_scpsys_probe
power: domain: mediatek: wrap domain tables in struct scp_soc_data
power: domain: mediatek: split into per-SoC drivers
power: domain: mediatek: constify scp_domain_data instances
power: domain: mediatek: prefix internal identifiers with mtk_
power: domain: mediatek: remove enum scp_domain_type
power: domain: mediatek: use MT2701 naming instead of MT7623
power: domain: mediatek: use MT7622 naming instead of MT7629
configs: mediatek: drop unused CONFIG_MTK_POWER_DOMAIN
power: domain: keep Makefile and Kconfig sorted
clk: mediatek: mt8518: unique driver names
clk: mediatek: mt8516: unique driver names
clk: mediatek: mt8512: unique driver names
clk: mediatek: mt8365: unique driver names
clk: mediatek: mt8195: unique driver names
clk: mediatek: mt8189: unique driver names
clk: mediatek: mt8188: unique driver names
clk: mediatek: mt8183: unique driver names
clk: mediatek: mt7988: unique driver names
clk: mediatek: mt7987: unique driver names
clk: mediatek: mt7986: unique driver names
clk: mediatek: mt7981: unique driver names
clk: mediatek: mt7629: unique driver names
clk: mediatek: mt7623: unique driver names
clk: mediatek: mt7622: unique driver names
clk: mediatek: mt7629: remove mt7629_peri_clk_tree
arm: dts: mt7988: remove clock-parent properties
arm: dts: mt7986: remove clock-parent properties
arm: dts: mt7981: remove clock-parent properties
clk: mediatek: remove mtk_common_clk_infrasys_init()
clk: mediatek: drop parent udevice field
clk: mediatek: use registered provider for parent lookup
clk: mediaTek: mt8518: add clock tree type flags
clk: mediaTek: mt8516: add clock tree type flags
clk: mediaTek: mt8512: add clock tree type flags
clk: mediaTek: mt8365: add clock tree type flags
clk: mediaTek: mt8195: add clock tree type flags
clk: mediaTek: mt8189: add clock tree type flags
clk: mediaTek: mt8188: add clock tree type flags
clk: mediaTek: mt8183: add clock tree type flags
clk: mediaTek: mt7988: add clock tree type flags
clk: mediaTek: mt7987: add clock tree type flags
clk: mediaTek: mt7986: add clock tree type flags
clk: mediaTek: mt7981: add clock tree type flags
clk: mediaTek: mt7629: add clock tree type flags
clk: mediaTek: mt7623: add clock tree type flags
clk: mediaTek: mt7622: add clock tree type flags
clk: mediatek: add registration function for clock tree types
clk: mediatek: mt7622: set parent flag for GATE_APMIXED()
arm: dts: mt7623: remove duplicate topckgen override
clk: mediatek: mt8189: fix VLP_CK wrong parents
configs: mediatek: do not autostart the watchdog on the Genio EVKs
clk: mediatek: mt8188: add missing clock in pericfg_ao
arm: dts: mediatek: add U-Boot dtsi overrides for Genio 510 and Genio 700
MAINTAINERS: Replace Mediatek with N:
usb: ci_udc: verify all dtds are inactive before completing request
usb: ci_udc: Update usb request status
usb: ci_udc: set correct ep type in ep_enable()
boot: android: fix out-of-bounds access in bootconfig parsing
usb: gadget: dwc2: Set endpoint capabilities via .caps field
usb: gadget: dwc2: Use usb_ep_set_maxpacket_limit() for fifo sizes
cmd: ums: Set Device Descriptor iSerial based on serial# env variable
cmd: read: fix unsigned overflow bypassing range check
Merge patch series "some string cleanup, and a tweak of the "config" command"
test: add test of 'config' command
doc: document 'config' command
cmd: config: allow simple filtering of output
test: string: add test of new strcasestr() function
string: add strcasestr()
string: remove more pointless __HAVE_ARCH_STR*
string: remove unused strswab() function
string: correct documentation for strstr and strnstr
string: correct prototype of strchrnul()
sh: clean up asm/string.h
test: spl: check load_simple_fit() rejects an oversized data-size
spl: fit: bound the external data size before reading it
Merge tag 'riscv-for-v2026.10-rc1' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-riscv
nvme: Fix missing address translation for PCIe inbound access
MAINTAINERS: update RISC-V maintainers
configs: k1: enable pinctrl and gpio
gpio: add gpio driver for Spacemit K1 SoC
pinctrl: add pinctrl driver for Spacemit K1 SoC
spacemit: k1: Add multiple device tree support
riscv: binman: Always set default configuration in FIT image
spl: k1: enable SPI NOR flash detection and boot
spi: fsl: add support for Spacemit K1 SoC
mtd: spi: enable spi_nor_remove() in soft reset config
mtd: spi: select SPL_SPI_FLASH_TINY in SPL stage
doc: spacemit: add K1 SPL build and test guide
board: k1: enable pmic in spl
power: regulator: add support for Spacemit P1 SoC
power: pmic: add support for Spacemit P1 PMIC
spacemit: k1: Add DDR firmware support to SPL
spacemit: k1: add TLV EEPROM support in SPL
i2c: k1: add I2C driver support
board: k1: initialize clock and serial devices in SPL
dts: k1: enable clocks in SPL
configs: k1: add default option for clock driver in SPL
clk: spacemit: k1: prune SPL clock tree
configs: k1: enable early timer support
spacemit: k1: enable SPL with debug UART
spacemit: k1: support multi-board infrastructure
dt-bindings: reset: drop spacemit-k1-reset.h
reset: spacemit: k1: drop legacy spacemit,k1-reset driver
dts: k1: drop legacy local DT files
dts: k1: switch BPI-F3 build to upstream DT
configs: bananapi-f3: enable Spacemit K1 clock driver
clk: spacemit: k1: spawn reset device from per-syscon clock drivers
reset: spacemit: k1: introduce syscon-bound reset driver
clk: spacemit: Add support for K1 SoC
ufs: invalidate the whole descriptor data segment after a query read
usb: xhci-dwc3: Call xhci_deregister() before asserting reset
spi: dw: Allow bits_per_word to be configured by device drivers
global: Switch from source.denx.de to git.u-boot-project.org
Merge patch series "treewide: migrate to the new mailing-list domain"
MAINTAINERS/README: Migrate mailing-list to lists.u-boot-project.org
doc: Migrate mailing-list to lists.u-boot-project.org
tools/patman: Migrate mailing-list to lists.u-boot-project.org
board: rockchip: add Anbernic RG-DS
rockchip: rk3568-nanopi-r5: Drop duplicated/extra sdhci
clk: airoha: fix off-by-one in clock ID boundary check
bloblist: Rename GD_FLG_BLOBLIST_READY to GD_FLG_BLOBLIST_HANDOFF
Revert "Merge patch series "Add DM firmware reserved memory support""
Merge patch series "cyclic: update and optimization"
cyclic: reduce get_timer_us() calls inside hlist_for_each_entry_safe()
cyclic: replace uint64_t by u64 suggested by b4
Merge patch series "vbe: bound FIT external-data reads against the firmware
area"
test: vbe: cover vbe_read_fit() external-data bounds checks
vbe: bound FIT external-data offset and size before blk_read
sandbox: vbe: size firmware1 area to fit the binman fw-update section
Merge patch series "Add DM firmware reserved memory support"
arm: mach-k3: Add DM reserved memory fixup
arm: mack-k3: Kconfig: Add DM firmware reserved memory configs
arm: mach-k3: am62ax: Enable OF_SYSTEM_SETUP for AM62D2
arm: mach-k3: Fix phandle corruption in fdt fixup
Merge patch series "arm: k3: replace tifsstub runtime filter with per-state FIT
configurations"
arm: k3: drop redundant tifsstub runtime filter
board: toradex: verdin-am62: select tifsstub via FIT config
board: phytec: phycore-am62: select tifsstub via FIT config
arm: k3: select tifsstub via board_fit_config_name_match
Merge patch series "dm: core: misc fixes"
dm: core: free old name in device_set_name to prevent leak
dm: core: Correct calloc arguments
dm: core: fix wrong strlen check in of_add_subnode
dm: core: free fdt when fdt_create_empty_tree failure
mach-k3: am64x: clear MCU_RST_SRC before reset
Merge tag 'efi-2026-10-rc1' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-efi
doc: CONTRIBUTE: explicitly list tests and documentation as welcome
contributions
doc: CONTRIBUTE: tell people reviewing *is* contributing
doc: CONTRIBUTE: use internal link instead of hardcoded external URL
efi_loader: Measure secure boot variables in the correct PCR if DeployedMode is
set
efi_loader: Change the return values if a TPM is missing during GetEventLog
efi_loader: Correctly count the size on DTB measurements
efi_loader: fix buffer overrun in efi_sigstore_parse_siglist
efi_selftest: test block io revision and pointers
efi_selftest: free handles on teardown()
efi_loader: fix building with CONFIG_EFI_VARIABLES_PRESEED=y
doc: board: renesas: Convert Renesas board support table to grid table
doc: board: renesas: Update Renesas generic build section
doc: board: renesas: Document Renesas R-Car Gen5 X5H Ironhide board
doc: board: renesas: Document Retronix R-Car Gen4 V4H Sparrow Hawk board
doc: board: renesas: Document Renesas R-Car Gen3 D3 Draak board
doc: board: renesas: Document Renesas R-Car Gen3 E3 Ebisu board
doc: board: renesas: Document Renesas R-Car Gen3 M3Le Geist board
doc: board: renesas: Document Renesas R-Car Gen3 H3/M3-W/M3-N ULCB board
doc: board: renesas: Document Renesas R-Car Gen3 H3/M3-W/M3-N Salvator-X(S)
board
doc: board: renesas: Document Aarch32 toolchain setup in RZ/N1
doc: board: renesas: Document SH/Aarch32/Aarch64 toolchain setup
efi_loader: fix missing EFI_EXIT in efi_disconnect_controller
doc: boards: amlogic: update documentation for Beelink GT1 Ultimate
qfw: fix RSDP ext_checksum recomputation
Merge patch series "mach-omap2: am33xx: ddr JEDEC spec fixups"
arm: mach-omap2: am33xx: check VTP before reinitalizing
arm: mach-omap2: am33xx: ddr: ensure proper reset->cke delay
clk: ti: Use CPU ticks to count timeout
Merge patch series "tools: qconfig: print a proper error when database is
missing"
qconfig: Rename the doc link in help text
tools: qconfig: print a proper error when database is missing
Merge patch series "pinctrl: aspeed: Add AST2700 pinctrl drivers"
pinctrl: aspeed: Add AST2700 SoC1 pinconf support
pinctrl: aspeed: Add AST2700 SoC1 pinctrl driver
pinctrl: aspeed: Add AST2700 SoC0 pinconf support
pinctrl: aspeed: Add AST2700 SoC0 pinctrl driver
Merge tag 'mmc-for-2026.10-rc1' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-mmc
get_maintainer.pl: tighten up git contributors cc list
test: cmd: part: fix integer handling in setup_gpt_partitions()
tools: binman: ti_board_cfg: Add configurable sw-rev support
cmd: fdt: keep control FDT during checksign
Gitlab CI: Switch to git.u-boot-project.org
test: dm: pmbus: test pmbus command and framework
test: dm: pmbus: add a sandbox PMBus chip emulator
thermal: pmbus: add PMBus die-temp driver
board: nxp: vid: introduce PMBus framework support
power: regulator: add MPS MPQ8785 PMBus regulator driver
power: regulator: add generic PMBus UCLASS_REGULATOR adapter
pmbus: add PMBus 1.x framework, CLI, and binding
serial: lpuart: Clear the OR STAT in tstc to prevent hang
power: regulator: Fix regulator_enable/disable() macros
mmc: sdhci: Use CONFIG_IS_ENABLED for MMC_IO_VOLTAGE
mmc: dw_mmc: Allow use of in-spec voltage range for vqmmc-supply
test: dm: regulator: Add regulator_set_value_clamp() tests
power: regulator: Add helper to set voltage within an acceptable range
MAINTAINERS: add entry for SDHCI Cadence driver
Merge patch series "fs: btrfs: add support for readdir"
fs: btrfs: use fs_ls_generic() and drop custom implementation
fs: btrfs: implement opendir(), readdir() and closedir()
cmd: x86: zboot: remove duplicate zboot_setup() call in do_zboot_setup
cmd: upl: fix off-by-one argc check in do_upl_read
cmd: ini: avoid NULL deref when loadaddr/filesize env vars are unset
cmd: host: fix duplicate device_unbind and wrong error message in unbind
cmd: clone: report destination block number on dest write error
remoteproc: k3-r5: Fix crash when issuing rproc init
treewide: Kconfig: use bool instead of tristate
Merge tag 'u-boot-rockchip-2026.10-20260710' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-rockchip
board: rockchip: Add support for 9Tripod X3568 v4
board: rockchip: set M.2 NVMe PERSTN low in spl_board_init on Jaguar
rockchip: fix asm-operand-widths clang warning
rockchip: rk3568: Add support for LinkEase EasePi R1
mtd: nand: raw: rockchip_nfc: fix oobfree length calculation
Merge tag 'i2c-updates-for-2026.10-rc1' of https://git.u-boot-
project.org/u-boot/custodians/hs/u-boot-i2c
rockchip: doc: fix typo evb-rk3288-rk808_defconfig
arm: dts: rockchip: Align OTP nodes for RK3528/RK356x with Linux v7.1
MAINTAINERS: add myself as ARM ROCKCHIP maintainer
MAINTAINERS: remove Philipp Tomsich from ARM ROCKCHIP maintainers
MAINTAINERS: add rockusb to ARM ROCKCHIP
MAINTAINERS: add more Rockchip drivers to ARM ROCKCHIP
MAINTAINERS: add N: rkmtd regex to ARM ROCKCHIP
MAINTAINERS: add N: rv11 regex to ARM ROCKCHIP
MAINTAINERS: add N: rk8 regex to ARM ROCKCHIP
MAINTAINERS: add N: rk3 regex to ARM ROCKCHIP
MAINTAINERS: add N: px5 regex to ARM ROCKCHIP
MAINTAINERS: add N: px30 regex to ARM ROCKCHIP
MAINTAINERS: add rkmux.py to ARM ROCKCHIP
MAINTAINERS: remove redundant entries for ARM ROCKCHIP
Merge tag 'ubi-updates-for-2026.10-rc1' of
https://source.denx.de/u-boot/custodians/u-boot-ubi
cmd: kconfig: i2c: add missing I2C API dependency
Merge patch series "pinctrl: add support of Airoha SoCs"
arm: dts: en7523: add pinctrl/gpio support, drop legacy gpio support
configs: airoha: en7523: enable pinctrl/gpio support
configs: airoha: an7581: enable pinctrl/gpio support
pinctrl: airoha: add pin controller and gpio driver for EN7523 SoC
pinctrl: airoha: add pin controller and gpio driver for AN7583 SoC
pinctrl: airoha: add pin controller and gpio driver for AN7581 SoC
pinctrl: airoha: add shared pinctrl code
pinctrl: sort and format the contents of the makefile
pinctrl: add more pinconf/pinctrl definitions
board: renesas: gen5-cm33: Convert to common field_{get, prep}() helpers
clk: renesas: rcar-cpg-lib: Convert to common field_{get, prep}() helpers
mtd: nand: raw: sunxi: Convert to common field_{get, prep}() helpers
net: hifemac: Convert to common field_{get, prep}() helpers
power: domain: renesas-r8a78000: Convert to common field_{get, prep}() helpers
watchdog: renesas_wwdt: Convert to common field_{get, prep}() helpers
bitfield: Add non-constant field_{prep, get}() helpers
bitfield: Add less-checking __FIELD_{GET,PREP}()
bitops: import BITS_PER_TYPE() macro from linux
board: renesas: gen5-cm33: #undef field_{get, prep}() before definition
clk: renesas: #undef field_{get, prep}() before definition
mtd: nand: raw: sunxi: #undef field_{get, prep}() before definition
net: hifemac: #undef field_{get, prep}() before definition
power: domain: renesas-r8a78000: #undef field_{get, prep}() before definition
watchdog: renesas_wwdt: #undef field_{get, prep}() before definition
Merge tag 'xilinx-for-v2026.10-rc1-v3' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-amd
env: ubi: add support to create environment volume if it does not exist
cmd: ubi: allow creating volume with all free spaces in ubi_create_vol
cmd: ubi: export more APIs to public
cmd: ubi: reorganize command messages
cmd: ubi: change all positive error return value to negative
cmd: ubi: change the type of parameter dynamic to bool
cmd: ubifs: mark string parameters with const
cmd: ubi: use void * for buf parameter in ubi_volume_read
cmd: ubi: mark read-only function parameters with const
ubi: remove unnecessary extern directive from function prototypes
fs: ubifs: fix ubifs_finddir() result check
i2c: designware: fix i2c probe error
i2c: nx: Add License
i2c: nx: Use dev_read_addr_ptr()
arm: dts: zynqmp: Fix space indentation to use tabs
arm64: xilinx: Add missing newline in kr260-revA
arm64: zynqmp: Disable ina226 iio-hwmon nodes
arch: arm: dts: Add RTC clock nodes for ZynqMP platform
arm64: versal-net: Add mmc_get_env_dev() and deduplicate MMC handling
arm64: versal-net: Look up eMMC device in boot_targets_setup()
arm64: versal-net: Do not print bootmode from spi_get_env_dev()
arm64: versal-net: Simplify spi_get_bootseq() bootmode switch
arm64: versal-net: Deduplicate SPI bootmode handling
arm64: zynqmp: Decouple MMIO accessors from firmware
arm64: versal-net: Move bootmode decoding out of board code
arm64: versal-net: Move SoC detection out of board code
arm64: versal2: Move SoC detection out of board code
arm64: zynqmp: Move board_early_init_r clock setup to mach code
arm64: versal-net: Move board_early_init_r clock setup to mach code
arm64: versal2: Move board_early_init_r clock setup to mach code
arm64: versal: Move board_early_init_r clock setup to mach code
arm64: versal: Move bootmode decoding out of board code
arm64: versal: Decouple multiboot register access from firmware
arm64: versal2: Move bootmode decoding out of board code
arm64: versal2: Decouple multiboot register access from firmware
arm: xilinx: Guard mach sys_proto.h against multiple inclusion
soc: xilinx: zynqmp: Add TCG variant detection for ZU3TCG
drivers: fpga: Use FPGA_INTEL_SDM_MAILBOX conditional instead of
Agilex/Stratix10
ufs: amd-versal2: Fix missing .priv_auto in driver registration
MAINTAINERS: Replace Zynq/ZynqMP with N:
mkimage: allow zynqmpbif to use a register initialization file
arm64: versal: Drop static DDR and PCIe MMU mappings
arm64: versal2: Drop static DDR MMU mappings
amd: versal2: detect spi env bus from boot mode
arm64: zynqmp: Sync compatible string format
arm64: dts: xilinx: Drop "label" property on dlg, slg7xl45106
arm64: zynqmp: dts: Fix file descriptions to match actual filenames
arm64: zynqmp: add USB hub supply regulators
arm64: zynqmp: Add CMA reserved-memory for runtime FPGA loading
arm64: zynqmp: Use fixed-partitions for MTD
arm64: zynqmp: Drop incorrect #phy-cells from ethernet-phy nodes
arm64: zynqmp-dlc21-revA: add mac nvmem cell for gem0
arm64: zynqmp-dlc21-revA: Update GPIO line names mapping
Merge branch 'next'
Merge tag 'fsl-qoriq-next-2026-07-06' of
https://source.denx.de/u-boot/custodians/u-boot-fsl-qoriq into next
power: domain: scmi: Allow failure in getting power domain attribute
crypto: fsl: Hide CAAM_64BIT symbol behind FSL_CAAM
gpio: mpc8xxx: add set_flags/get_flags ops
ls1028ardb: Move environment variables to .env file
Merge patch series "bootdev: few fixes for automatic boot"
test: bootdev: scan with a broken high-priority device
bootdev: scan boot devices at each priority level
Merge patch series "bootm: fix flush_cache() with IH_TYPE_KERNEL_NOLOAD"
bootm: allow omitting entry point for IH_TYPE_KERNEL_NOLOAD
bootm: warn about load address for IH_TYPE_KERNEL_NOLOAD in FIT
bootm: fix flush_cache() with IH_TYPE_KERNEL_NOLOAD
Merge patch series "TI: AM64-EVM/SK: Enable MAIN UART1 for SYSFW tracing"
arm: dts: k3-am642-evm/sk: enable MAIN UART1 for SYSFW logs
arm: mach-k3: am642: Update MAIN UART1 serial alias from 3 to 1
mtd: spi-nor: Add gd55lb02gf chips
bootm: move OS index bound check into the legacy path
MAINTAINERS: Remove merge garbage
Merge tag 'u-boot-pci-next-20260701' of
https://source.denx.de/u-boot/custodians/u-boot-ufs into next
pci: layerscape: ep: Use dev APIs
pci: imx: Use dev_read_addr_index_ptr()
pci: dw_mvebu: Use dev_read_addr_x APIs
pci: mpc85xx: Simplfy code with dev_remap_addr()
pci: rcar: Use dev_read_addr_index()
MAINTAINERS: Add myself as core PCI maintainer
rockchip: sdram: Fix initialization of DRAM banks
Makefile.lib: remove stale migrate_xxx logic from fdtgrep logic
MAINTAINERS: Replace Cortina with N:
Merge tag 'u-boot-dfu-next-20260629' of
https://source.denx.de/u-boot/custodians/u-boot-dfu into next
Merge patch series "arm: aspeed: add initial AST2700 SoC support"
treewide: Staticize and constify acpi ops
cros_ec: Convert dm_cros_ec_get_ops into an inline function and constify
dm_cros_ec_ops
env: Avoid mixing of environment and driver prints on env load
rtc: mcfrtc: fix leap year calculation using wrong variable
ram: aspeed: add SDRAM controller driver for AST2700
reset: ast2700: add reset driver support
clk: ast2700: add clock driver support
arm: dts: aspeed: Add initial AST27xx SoC device tree
arm: aspeed: add ASPEED AST2700 SoC family support
spi: aspeed: add AST2700 support
Merge tag 'u-boot-imx-next-20260627' of
https://gitlab.denx.de/u-boot/custodians/u-boot-imx into next
imx9: Add v2x_status and ele_info commands
misc: ele_api: Add V2X Get State API
imx952_evk: Correct CONFIG_DEFAULT_FDT_FILE
imx95/952/94_evk/: enable booting Image.gz
imx93_evk/qsb/frdm: enable booting Image.gz and avoid extra memcpy
imx8mm/n_evk: enable booting Image.gz and avoid extra memcpy
imx8mq_evk: enable booting Image.gz and avoid extra memcpy
imx8mp_evk: enable booting Image.gz and avoid extra memcpy
imx: kontron-sl-mx8mm: Enable the watchdog at boot
clk: imx6q: use clk_divider_table instead of fixed factor for pll5 divs
clk: clk-divider: add clk_register_divider_table()
video: imx: ipuv3: enable ipu clk before writing registers in CCF
clk: imx6q: configure ldb clock selectors
imx6: clock: allow different clock sources for ldb
clk: imx6q: add missing pll bypasses
clk: imx6q: guard video clocks behind config
clk: imx6q: cosmetic: keep pll definitions together
imx93_frdm: Add support for 2CS 2GB DRAM support
imx: fdt: Allow users to inhibit trip point setup
board: toradex: add initial support for aquila imx95
imx93: Add support for OPTEE
binman: Add optee binary to i.MX9 platform types
mx6sabre: Move environment variables to .env files
mx6ullevk: Move environment variables to .env file
mx7ulp_evk: Move environment variables to .env file
imx9: Select OF_LIVE
imx8m_evk: Select OF_LIVE
imx9: soc: Use livetree API for fdt access
misc: ele: Use dev_read_addr
gpio: imx_rgpio2p: Use dev_read_addr_index
serial: lpuart: Use livetree API for fdt access
imx8m: dts: Update ddr firmware name
imx: Guard print_cpuinfo with !CONFIG_IS_ENABLED(CPU)
imx7ulp: cleanup get_imx_type
imx8ulp: cleanup get_imx_type
imx952: Update gpio node regs
imx8m: Imply DM_THERMAL
board: qualcomm: phone: enable CMD_FASTBOOT_ABORT_KEYED
cmd: fastboot: Add keyed abort option
usb: gadget: f_mass_storage: Disable eps during disconnect
usb: f_sdp: handle the spl load function failure
Merge patch series "Kconfig restyle part 2"
Kconfig: restyle
Kconfig: drivers: restyle remaining
Kconfig: gpio: add empty line
Kconfig: video: restyle
Kconfig: usb: restyle
Kconfig: power: restyle
Kconfig: pinctrl: restyle
Kconfig: net: restyle
Kconfig: mtd: restyle
Kconfig: i2c: restyle
Kconfig: net: restyle
Kconfig: lib: restyle
Kconfig: fs: restyle
Kconfig: dts: restyle
Kconfig: disk: restyle
Kconfig: common: restyle
Kconfig: cmd: restyle
Kconfig: boot: restyle
Merge patch series "Kconfig restyle"
Kconfig: board: restyle
Kconfig: arch: restyle
Kconfig: arm: restyle
Kconfig: misc: add empty line
Kconfig: themal: fix typo
Kconfig: power: pmic: fix typo
Kconfig: powerpc: mpc85xx: fix typo
Kconfig: armv7: fix typo
Merge patch series "Relocate U-Boot in the last bank"
doc: Add a warning about using RELOC_ADDR_TOP
configs: Enable RELOC_ADDR_TOP on arm64 QEMU
common: Add an option to relocate on ram top
rpi: Add a local get_effective_memsize()
common: Clean up setup_dest_addr()
common: move ram_base calculation to independent INITCALL()
treewide: move bi_dram[] from bd to gd
rtc: goldfish: Return error when device address is invalid
timer: goldfish: Return error when device address is invalid
serial: goldfish: return error when device address is invalid
serial: cortina: check RX FIFO status before reading data
global_data: fix type for gd_malloc_ptr()
Merge tag 'v2026.07-rc5' into next
Merge patch series "Fixes, cleanup and a test for the SPL FIT "full" loader"
test: spl: add unit test for the "full" FIT loader
spl: fit: use CONFIG_IS_ENABLED whenever possible
spl: fit: drop the 'standalone' load attempt
spl: fit: rework the FDT load hack
spl: fit: fix loadables load under sandbox
boot: fit: fix FIT verification in SPL
Merge patch series "dtc: Resync fdt_check_full function"
dtc: libfdt: Introduce a can_assume check in fdt_check_full
dtc: Resync fdt_check_full() with upstream version v1.7.2-35-g52f07dcca47c
bootm: increase kernel_noload decompression headroom from 4x to 8x
bootm: fix overflow of the noload kernel decompression buffer
board: variscite: add support for the omap4_var_som
arm: ti: Introduce back omap4 support
configs: omap4: remove unused boot target devices
clk: ti: Remove AM33xx dependency
arm: ti: omap: Extract common clock definitions
arm: omap: Move PRM I2C channel frequency to vc.c
Merge patch series "armv8: mmu: fix region unmapping and optimise
set_one_region()"
armv8: mmu: fix and optimise explicitly unmapping regions
armv8: mmu: commonize the set_one_region() loop
armv8: mmu: teach the pagetable dumper to show explicit FAULT maps
armv8: mmu: add a function to help debug TLB lookups
Merge patch series "bootm: bound noload kernel decompression to the allocated
buffer"
test/py: test kernel_noload decompression buffer overflow
bootm: increase kernel_noload decompression headroom from 4x to 8x
bootm: fix overflow of the noload kernel decompression buffer
Merge patch series "arm: omap: Add back omap4 support"
board: variscite: add support for the omap4_var_som
arm: ti: Introduce back omap4 support
configs: omap4: remove unused boot target devices
clk: ti: Remove AM33xx dependency
arm: ti: omap: Extract common clock definitions
arm: omap: Move PRM I2C channel frequency to vc.c
Merge patch series "various memory related fixups"
memory: reserve from start_addr_sp to initial_relocaddr
test: boot: add a fdt reserved region check
test_ut: add a ut_ubman fixture to clean up tests
boot: image-fdt: free old dtb reservations
Merge branch 'assorted-fit-validation-fixes' into next
fdt: Check return value of fdt_get_name() calls
image-fit: Validate external data offset and size
image-fit: Limit recursion depth in fdt_check_no_at()
fdt_region: Check return value of fdt_get_property_by_offset() calls
image-fit-sig: Validate hashed-strings region size
Merge patch series "arm: am335x: Switch to upstream devicetree"
arm: dts: Move remaining am335x-bone* to OF_UPSTREAM
arm: mach-omap2: Use dt_dir for devicetree paths
Makefile: Move dt_dir definition
dm: core: Remove dependency on CLK
arm: dts: am335x: Remove unused uboot devicetrees
configs: am335x_evm_defconfig: Switch to upstream devicetree
dm: core: Split SIMPLE_PM_BUS into phases
am33xx: Support upstream devicetree USB device
am33xx: Fix comment about config symbols
arm: dts: am335x-boneblack-u-boot: Add lcdc to all boot phases
arm: dts: am335x-*-u-boot: Add chosen tick-timer
am33xx: Avoid hard failure on USB probe issue
configs: am335x_evm: Unify evm board defconfigs
configs: am335x_evm: Enable SPL_OPTIMIZE_INLINING
include: configs: am335x_evm: Enable vidconsole
configs: am335x_evm_defconfig: Enable panel
arm: dts: am335x-evm: Add backlight to the panel
Merge patch series "fdt_support: validate property lengths in chosen and dma-
range fixups"
fdt_support: validate dma-ranges length in fdt_get_dma_range
fdt_support: bound serialN alias length before copying to stack
Merge patch series "tools: mkimage: fix get_basename crash on paths with dotted
directories"
test/py: cover get_basename crash on paths with dotted directories
tools: mkimage: fix get_basename crash on paths with dotted directories
bootm: bound-check OS index in bootm_os_get_boot_func()
drivers: gpio: Fix dev_read_addr error check
board: ti: am62ax: tifs-rm-cfg/rm-cfg: Update DMA resource sharing for CPSW
arm: dts: add/fix I2C controllers for sc5xx
dm: core: use DT region size when mapping device addresses
Revert "clk: enhance clk-gpio to also handle gated-fixed-clock"
Merge patch series "allow control DTB to double as "FIT image""
test: hook up test of allowing control DTB to act as FIT image
doc: develop: add section on embedding scripts inside control DTB
image-fit.c: introduce CONTROL_DTB_AS_FIT config knob
Merge tag 'mediatek-for-next-2026-06-10' of
https://source.denx.de/u-boot/custodians/u-boot-mediatek into next
Merge patch series "This series introduces initial U-Boot support for mach-
axiado AX3005 SCM3005 board, a quad-core ARM Cortex-A53 (ARMv8/ARM64) platform."
MAINTAINERS: Replace ASpeed with N:
grm: axiado: Add AX3005 based SCM3005 board support
arm64: dts: axiado: Add AX3005 SCM3005 device tree
clk: enhance clk-gpio to also handle gated-fixed-clock
serial: lpuart: Fix RX FIFO Enable bitmask
treewide: prefer __func__ over __FUNCTION__ and __PRETTY_FUNCTION__
bootmenu: fix incorrect menu quitting logic
configs/mt8365: enable bootstd, FIT and DT overlays
configs/mt8195: enable bootstd, FIT and DT overlays
configs/mt8188: enable bootstd, FIT and DT overlays
pinctrl: mediatek: use scnprintf() instead of snprintf()
configs: mt8189: Enable ethernet support
arm: dts: mt8189: Add ethernet support for Genio 520/720 boards
net: dwc_eth_qos: Add mediatek support
net: phy: Add airoha AN8801 ethernet phy driver
net: phy: air_phy_lib: Factorize BuckPBus register
net: Fix alphabetical ordering in drivers/net/Kconfig
net: Fix alphabetical ordering in drivers/net/Makefile
MAINTAINERS: add maintainer entry for air_en8811 driver
MAINTAINERS: remove trailing colons from section titles
Merge tag 'u-boot-marvell-next-20260610' of
https://source.denx.de/u-boot/custodians/u-boot-marvell into next
Merge tag 'fsl-qoriq-next-2026-06-09' of
https://source.denx.de/u-boot/custodians/u-boot-fsl-qoriq into next
timer: orion: Use dev_remap_addr_index()
arm: dts: armada-8040-nbx: add U-Boot dtsi for conditional OP-TEE
board: freebox: nbx10g: add device serial and MAC address initialization
board: freebox: nbx10g: add emmcboot for dual-bank eMMC boot
board: freebox: add Nodebox 10G board support
arm: mach-mvebu: armada8k: cpuinfo and SAR
pinctrl: armada-38x: Staticize and constify driver ops
arm: mvebu: Drop unnecessary BOARD_EARLY_INIT_F usage
serial: serial_octeon_bootcmd.c: use correct Kconfig symbol
board: Synology: common: Fix typo in Makefile
board: Synology: legacy.c: Include asm/io.h
arm: mvebu: Add Allied Telesis x220
arm: mvebu: db-xc3-24g4xg: Remove marvell, nand-keep-config
mtd: nand: pxa3xx: Pass valid dev to dev_err()
net: mvpp2: fix NULL pointer dereference in mvpp2_phy_connect
arm: kirkwood: Remove unnecessary watchdog GPIO for ZyXEL NSA325 board
Merge tag 'mmc-next-2026-06-10' of
https://source.denx.de/u-boot/custodians/u-boot-mmc into next
Merge assorted patches to use device API to replace devfdt_ helpers
ata: dwc_ahci: Use dev_read_addr_index()
ata: mtk_ahci: Use dev_remap_addr_index() and ofnode API
rng: rproc_rng200: Use dev_remap_addr()
misc: k3_avs: Use dev_read_addr_index()
thermal: ti-bandgap: Use dev_read_addr_index()
reset: ast: Use dev_read_addr_ptr()
ram: aspeed: Use dev_read_addr_x() API
crypto: tegra: Use dev_read_addr_x()
crypto: aspeed: Use dev_read_addr_x()
remoteproc: ipu: Use dev_read_addr_x()
remoteproc: pru: Use dev_read_addr_size_index()
gpio: aspeed: Use dev_read_addr_ptr()
gpio: nx: Use dev_remap_addr()
pinctrl: nexell: Use dev_read_addr()
pinctrl: at91: Use dev_read_addr_index()
clk: sophgo: Use dev_read_addr_ptr()
clk: hsdk-cgu: Use dev_read_addr_index_ptr()
clk: aspeed: Use dev_read_addr_ptr()
clk: altera: Use dev_read_addr_ptr()
clk: at91: Use dev_read_addr_ptr()
Merge tag 'u-boot-watchdog-next-20260609' of
https://source.denx.de/u-boot/custodians/u-boot-watchdog into next
nxp: imx[95,94,952]_evk: Implement board_fix_fdt
iMX9: scmi: Disable fused modules for iMX95/94/952
imx9: scmi: Print CPU part number name
imx9: scmi: Fix temperature range for Extended industrial parts
thermal: imx_tmu: extend with QorIQ/Layerscape TMU
thermal: jc42: add JEDEC JC-42.4/TSE2004av SPD
power: regulator: scmi: convert ofnode API to dev_read API
power: regulator: qcom-rpmh: convert ofnode API to dev_read API
power: regulator: anatop: convert ofnode API to dev_read API
power: pmic: qcom: convert ofnode API to dev_read API
power: pmic: pca9450: convert ofnode API to dev_read API
power: domain: imx8m: convert ofnode API to dev_read API
power: domain: meson-gx-pwrc-vpu: use dev_read_phandle_with_args for hhi-sysctrl
power: domain: meson-ee-pwrc: use dev_read_phandle_with_args for ao-sysctrl
power: regulator: tps6287x: Use dev_read_addr_index()
power: regulator: Fix power on/off delay issue
cmd: mmc: fix help and parameter verification with MMC_SPEED_MODE_SET not set
mmc: octeontx_hsmmc: convert ofnode API to dev_read API
mmc: msm_sdhci: convert ofnode API to dev_read API
mmc: fsl_esdhc_imx: convert ofnode API to dev_read API
mmc: cv1800b_sdhci: Use dev_read_addr_ptr()
mmc: xenon_sdhci: Use livetree API
arm: dts: fsl-lx2162a-qds: drop &dspi{0,1,2} block
arm: dts: fsl-lx2160a: wdt0 for watchdog node
drivers: watchdog: Fix dev_read_addr error check
watchdog: mpc8xxx_wdt: Use dev_remap_addr()
watchdog: rti: Use dev_read_addr_ptr()
watchdog: orion_wdt: use dev_read_addr_size_index()
doc: wdt: fix typo for expire
watchdog: octeontx_wdt: fix DT matches to Marvell compatibles
watchdog: sbsa_gwdt: clamp WOR value to hw max
watchdog: designware: Fix probe when clk_enable return ENOSYS
watchdog: Correct dependencies for WDT_MAX6370
watchdog: orion_wdt: Add support for armada-xp
Merge tag 'v2026.07-rc4' into next
Merge tag 'xilinx-for-v2026.10-rc1-v2' of
https://source.denx.de/u-boot/custodians/u-boot-microblaze into next
reset: zynqmp: Implement rst_reset using PM_RESET_ACTION_PULSE
spi: cadence: Use reset_reset_bulk() for proper reset cycling
reset: sandbox: Cover reset_reset() fallback with second sandbox provider
reset: Add sandbox tests for reset_reset() and reset_reset_bulk()
reset: Add reset_reset() and reset_reset_bulk() API
configs: amd: Enable capsule update and DFU support
configs: xilinx: Enable DFU MTD support
board: xilinx: Add FWU boot index support
board: amd: Add capsule and FWU support
board: xilinx: Add capsule and FWU support
firmware: zynqmp: Add PMC PGGS register read API
arm64: xilinx: Add PMC PGGS3 and PGGS4 registers
xilinx: mbv: Allow compiler to optimize inlining in SPL
xilinx: mbv: Disable AVAILABLE_HARTS
board: zynqmp: Remove hardcoded USB ethernet initialization
configs: zynqmp: Enable USB gadget download support
Merge tag 'u-boot-imx-next-20260605' of
https://gitlab.denx.de/u-boot/custodians/u-boot-imx into next
Merge patch series "rtc: pcf85036: improve spec coherence and extend features"
drivers: Kconfig: rtc_pcf85063: note unsupported chip features
rtc: pcf85063: add power loss detection during probe
rtc: pcf85063: support loading quartz-load capacitance from device tree
rtc: pcf85063: keep the divider chain in reset during set_time
rtc: pcf85063: add missing register definitions
rtc: pcf85063: add support for NXP PCF85063 family
rtc: pcf85063: adjust date format to adhere to the rtc_time spec
cmd: date: validate date using rtc_month_days()
cmd_date: make mk_date() static
cpu: imx8_cpu: fix the mpidr check
cpu: imx8_cpu: Add iMX8MP UltraLite Part cpu type
boards: tqma7: call tq-sysinfo setup
arm: dts: tqma7: integrate tq,eeprom sysinfo driver
arm: dts: tqma7: add eeprom nvmem-layout
board: tq: common: add sysinfo setup helper
sysinfo: tq_eeprom: new driver
sysinfo: add sysinfo_get_and_detect() helper
sysinfo: uclass: use sysinfo_priv size for per_device_auto
arm: imx9: Fix broken formatting
clk: imx: don't build i.MX/RTxxxx code for all users of CCF
imx: kontron-sl-mx6ul: Enable I2C support
arch: imx9: Fix blk_dwrite/blk_derase error checking
arm: imx8mp: Add new variant parts support
board: tqma7: update fastboot env
arm: gic-v3-its: Fix LPI pending table size calculation
configs: add defconfigs for TQMa6UL[L]x[L] SOM on MBa6ULx baseboard
board: tq: add TQMa6UL[L]x[L] SOM and MBa6ULx baseboard
ARM: dts: tqma6ul: add boot phase properties
ARM: dts: add TQMa6UL[L]x[L] u-boot device tree fragments
imx: Remove hardcoded watchdog base address macros
watchdog: ulp_wdog: Use driver model for reset_cpu()
imx: soc: Get watchdog base addresses from device tree
arm: dts: imx: Update watchdog nodes for dynamic base address lookup
imx93_var_som: Switch to OF_UPSTREAM
imx93-frdm: Switch to OF_UPSTREAM
imx91: Switch to OF_UPSTREAM
imx7ulp: Switch to OF_UPSTREAM
imx8mp: msc-sm2s: Switch to OF_UPSTREAM
imx8mm: pgh: Switch to OF_UPSTREAM
imx8mp: icore-mx8mp-edimm2.2: Switch to OF_UPSTREAM
imx8mm: icore-mx8mm: Switch to OF_UPSTREAM
Merge patch series "sc5xx Environment Cleanup and Fixes"
Merge patch series "Cleanup some linker list usage issues"
event: Remove obsolete comment and __used attributes
linker_lists: Do not set "unused" attribute
sandbox: Drop special link order treatment of start.o and sdl.o
mach-sc5xx: Remove unused image offset Kconfig options
arm: sc5xx: Add fdt_addr_r, kernel_addr_r, and ramdisk_addr_r
arm: sc5xx: add missing boot env selectors
arm: sc5xx: Remove SC5XX_LOADADDR
configs: sc5xx: Set default bootcmd to SPI boot
mach-sc5xx: Update SPI bootargs for ubifs
mach-sc5xx: Update image load address
mach-sc5xx: sc573: Rename EZKIT board to EZLITE
dts: sc594: Fix gige-reset line on EZKIT
mach-sc5xx: Remove preliminary binman support
mach-sc5xx: Add USB boot command
mach-sc5xx: Switch from tftp to wget
mach-sc5xx: Update boot commands
mach-sc59x: Add CONFIG_SC5XX_LOADADDR
mach-sc5xx: Remove update commands from default environment
configs: sc5xx: Do not store environment in SPI flash
Merge tag 'net-next-20260603' of
https://source.denx.de/u-boot/custodians/u-boot-net into next
Merge branch 'next' of git://source.denx.de/u-boot-usb into next
net: mvpp2: convert FDT access to ofnode API
net: mvpp2: Use dev_read_addr_index_ptr()
net: dc2114x: Use dev_remap_addr()
net: calxedaxgmac: Use dev_read_addr()
net: qe: dm_qe_uec: Use dev_read_addr()
net: ethoc: Use dev_read_addr_index()
phy: cadence: Use device API
phy: marvell: comphy: Use dev_read_addr_index_ptr()
phy: ti-pipe3: Use device API for DT parsing
phy: Kconfig: use bool instead of tristate
net: SYS_RX_ETH_BUFFER defaults to 8 when CONFIG_FSL_ENETC=y
net: guard SYS_RX_ETH_BUFFER with NET
net: tsec: make tsec_private a private structure
arm: ls102xa: use platform data to check Ethernet interface is not SGMII
ls1028a: only include drivers/net/fsl_enetc.h when driver is compiled
usb: dwc3: generic: Staticize and constify driver ops
usb: dwc3: sti: Staticize and constify driver ops
usb: dwc3: am62: Staticize and constify driver ops
Merge patch series "Enable splashscreen functionality on AM62X"
configs: am62x_evm_a53_defconfig: Enable A53 splashscreen at u-boot SPL
configs: am62x_evm_a53_ethboot_defconfig: Disable splashscreen
configs: am62x: Add splashscreen prune config fragment
configs: am62x: Add splashscreen config fragment
timer: sp804: Fix dev_read_addr error check
Merge patch series "Clean up bloblist initialization"
bloblist: Rework bloblist_init and bloblist_maybe_init
bloblist: Demote not finding a bloblist to a debug
bloblist / handoff: Make this depend on BLOBLIST_FIXED
Merge patch series "video: bridge: anx6345: Staticize and constify driver ops"
video console: add 6x8 console font from linux
video: kconfig: replace tristate with bool for LCD panel drivers
video: Kconfig: fix indentation of help text
video: simplefb: Parse memory region from memory-region property
video: simplefb: Map framebuffer region on probe on ARM64
video: Correct dependencies for VIDEO_TIDSS
video: Correct dependencies for VIDEO_LCD_RAYDIUM_RM68200
video: Correct dependencies of LOGICORE_DP_TX
common: splash_source: fix cryptic error messages
video: tegra: Staticize and constify driver ops
video: tda19988: Staticize and constify driver ops
video: stm32: Staticize and constify driver ops
video: imx: ldb: Staticize and constify driver ops
video: dw_mipi_dsi: Staticize and constify driver ops
video: console: truetype: Staticize and constify driver ops
video: console: rotate: Staticize and constify driver ops
video: console: normal: Staticize and constify driver ops
video: bridge: ptn3460: Staticize and constify driver ops
video: bridge: ps862x: Staticize and constify driver ops
video: bridge: anx6345: Staticize and constify driver ops
boot: cedit: Check ofnode_read_prop return value
Merge patch series "board: phytec: Update rm-cfgs, env and docs"
doc: board: phytec: Document DDR size override Kconfigs
doc: board: phytec: k3: Document boot flow and watchdog
doc: board: phytec: Fix typos and copy-paste errors in K3 docs
include: env: phytec: Drop legacy RAUC boot logic
board: phytec: phycore_am68x: Update rm-cfg
arm: dts: k3-am625-phycore-som-binman: Enable tifs-rm-cfg
board: phytec: phycore_am62x: Add tifs-rm-cfg
Merge patch series "board: toradex: k3: Sync rm-cfg with TIFS v12.00.00
firmware"
arm: dts: k3: k3-am62*5-verdin-binman: Enable tifs-rm-cfg in binman
board: toradex: aquila-am69: update rm-cfg.yaml and tifs-rm-cfg.yaml
board: toradex: verdin-am62: add missing tifs-rm-cfg.yaml
board: toradex: verdin-am62p: update tifs-rm-cfg
board: ti: j722s: add processor ACL entry for wkup_r5
Merge patch series "Update envs to use Kconfig values"
env: ti: k3_dfu: use Kconfig options for addresses
env: ti: k3_dfu: load only the next stage binary
am33xx: don't assume we have a UCLASS_MISC device present
common/command.c: Avoid NULL pointer use in cmd_auto_complete
fs: fat: fix seconds in timestamp
Merge patch series "fit: dm-verity support"
image: fit: add dm-verity property name constants
configs: sandbox: enable CONFIG_FIT_VERITY
test: py: add mkimage dm-verity round-trip test
test: boot: add runtime unit test for fit_verity_build_cmdline()
doc: fit: add dm-verity boot parameter documentation
tools: mkimage: add dm-verity Merkle-tree generation
include: hexdump: make hex2bin() usable from host tools
boot: fit: support generating DM verity cmdline parameters
Merge patch series "env: migrate static flags list to Kconfig"
doc: remove configuration settings from README
env: migrate static flags list to Kconfig
Merge patch series "boot/fit: use fdt_for_each_subnode() in image-fit.c"
boot/fit: use fdt_for_each_subnode() in image-fit.c
test: fit: regression test for default-config print with reversed node order
boot/fit: read default-config property from the configurations node
cros_ec: Sync ec_commands.h from upstream Chrome OS EC
led: Fix toggling LED on initial SW blink
gpio: uclass: show DT gpio-line-names
test: fs: Use shared generate_file from utils
Merge tag 'v2026.07-rc3' into next
Merge patch series "Add virtio-mmio support to m68k virt machine"
board: qemu: m68k: Create virtio mmio instances
virtio: blk: Fix converting the vendor id to a string
virtio: cmd: Depend on VIRTIO_BLK
virtio: mmio: Allow instantiation via platform data
m68k: Fix writew(), writel(), readw(), readl() endianness for classic m68k
timer: goldfish: Use __raw_readl()
rtc: goldfish: Use __raw_readl() and __raw_writel()
sysreset: qemu virt: Use __raw_writel()
sysreset: qemu virt: Use map_sysmem()
virtio: Drop empty bootdev_ops structure
scsi: Drop empty bootdev_ops structure
ata: sata: Drop empty bootdev_ops structure
block: ide: Drop empty bootdev_ops structure
bootdev: Fix the case where the driver ops field is null.
arm: Fix typo in linker script
Merge branch 'staticize-constify-drivers' into next
spi: apple: Staticize and constify driver ops
scsi: sandbox: Staticize and constify driver ops
rtc: emul: Staticize and constify driver ops
reset: tegra186: Staticize and constify driver ops
reset: tegra-car: Staticize and constify driver ops
reset: sti: Staticize and constify driver ops
reset: sandbox: Staticize and constify driver ops
reset: sunxi: Staticize and constify driver ops
reset: raspberrypi: Staticize and constify driver ops
reset: npcm: Staticize and constify driver ops
reset: meson: Staticize and constify driver ops
reset: mediatek: Staticize and constify driver ops
reset: dra7: Staticize and constify driver ops
reset: bcm6345: Staticize and constify driver ops
reset: at91: Staticize and constify driver ops
reset: ast2600: Staticize and constify driver ops
reset: ast2500: Staticize and constify driver ops
cpu: armv8: Staticize driver ops
mtd: spi: bootstd: Staticize and constify driver ops
misc: x86: Staticize and constify driver ops
misc: i2c: eeprom-emul: Staticize and constify driver ops
misc: cros_ec: Staticize and constify driver ops
mailbox: stm32-ipcc: Staticize and constify driver ops
mailbox: sandbox: Staticize and constify driver ops
mailbox: renesas: Staticize and constify driver ops
mailbox: k3-sec-proxy: Staticize and constify driver ops
mailbox: imx: Staticize and constify driver ops
mailbox: apple: Staticize and constify driver ops
clk: sunxi: Staticize and constify driver ops
clk: sunxi: Drop the extern
clk: ast2600: Staticize and constify driver ops
clk: ast2500: Staticize and constify driver ops
block: rockchip: Staticize and constify driver ops
ata: sata_mv: Staticize and constify driver ops
ata: fsl_sata: Staticize and constify driver ops
Merge tag 'qcom-next-18May2026' of
https://source.denx.de/u-boot/custodians/u-boot-snapdragon into next
board/qualcomm: qcom-phone: Add poweroff command
clk/qcom: qcm2290: Fix vote_bit of gpll6 clock
phy: qcom: Add SM6115 and SM6125 to QMP UFS PHY driver
pci: pcie_dw_qcom: Staticize and constify driver ops
gpio: qcom: Staticize and constify driver ops
gpio: qcom_pmic: Staticize and constify driver ops
drivers: pinctrl: Add Qualcomm SM6125 TLMM driver
qcom_defconfig: Enable SM6125 clock driver
clk/qcom: Add SM6125 clock driver
cmd: ufetch: only show comma separator if there was a previous feature
cmd: ufetch: show net feature when NET_LWIP is selected
serial: msm-geni: configure RX watermark register
dts: lemans-evk-u-boot: add override dtsi
ufs: qcom: Remove redundant POST_CHANGE clock setup call
drivers: ufs: qcom: Initialize and enable clocks before hardware access
clk: qcom: sc7280: Add UFS clock support
clk: qcom: qcs615: Add UFS clock support
clk: qcom: sa8775p: Add UFS clock support
clk: qcom: clk-stub: Add compatibles for QCS615/SA8775P
clk: stub: Sort compatible strings alphabetically
Merge tag 'u-boot-imx-next-20260515' of
https://gitlab.denx.de/u-boot/custodians/u-boot-imx into next
net: fsl_enetc: Add support for i.MX952
net: fsl_enetc: fix the duplex setting on the iMX platform
arm: imx9: Update i.MX91 part number detection
imx: priblob: Fix build break
power: regulator: pfuze100: Fix unchecked pmic_reg_read, return value
arm: mx6: module_fuse: update node path for Linux 6.13
arm: mx6: cm-fx6: Staticize and constify driver ops
board: toradex: verdin-imx95: remove gpio1 reg
board: toradex: smarc-imx95: remove gpio1 reg
doc: board: nxp: Add Quickboot documentation
board: nxp: imx9{4, 5, 52}_evk: Add qb save option in SPL
arm: mach-imx: Add command to expose QB functionality
imx9: Add support for saving DDR training data to NVM
imx: ahab: Use authenticated header for images loading
imx9: clock: Fix missing break in get_clk_src_rate
imx8mp_evk: Fix the ND mode VDD_SOC voltage
i2c: imx_lpi2c: Fix MSR status check issue in STOP
net: phy: nxp-c45-tja11xx: Fix incorrect usage of devm_kzalloc
imx9: scmi: Support iMX95/94/952 secondary boot
imx9: scmi: soc: Add support for detecting primary/secondary bmode on MX95
imx: Add SPI NOR A/B switching support
imx8mm/n: Drop unused dtsi
imx8mq: Drop arch/arm/dts/imx8mq.dtsi
imx8mq: kontron-pitx-imx8m: Switch OF_UPSTREAM
imx8mq: librem5: Switch to OF_UPSTREAM
imx8mq: pico: Switch OF_UPSTREAM
imx8mq: phanbell: Switch OF_UPSTREAM
imx8mq: reform2: Switch to OF_UPSTREAM
nitrogen6x: Fix compile error if VIDEO_IPUV3 is disabled
MAINTAINERS: Use N: for NXP entry
Merge tag 'mmc-next-2026-05-15' of
https://source.denx.de/u-boot/custodians/u-boot-mmc into next
power: domain: zynqmp: Staticize and constify driver ops
power: domain: tegra186: Staticize and constify driver ops
power: domain: scmi: Staticize and constify driver ops
power: domain: sandbox: Staticize and constify driver ops
power: domain: mtk: Staticize and constify driver ops
power: domain: meson-secure-pwrc: Staticize and constify driver ops
power: domain: meson-gx-pwrc: Staticize and constify driver ops
power: domain: meson-ee-pwrc: Staticize and constify driver ops
power: domain: imx8mp-mediamix: Staticize and constify driver ops
power: domain: imx8m: Staticize and constify driver ops
power: domain: imx8: Staticize and constify driver ops
power: domain: imx8-legacy: Staticize and constify driver ops
power: domain: bcm6328: Staticize and constify driver ops
power: domain: apple: Staticize and constify driver ops
mmc: cv1800b_sdhci: honor 'no-1-8-v' DT property
power: pmic: emul: Staticize and constify driver ops
mmc: bootstd: Staticize and constify driver ops
mmc: sdhci: Start status timeout after command issue
gpio: Correct dependencies for MCP230xx
board: ti: am335x: Conditional MDIO PAD configuration instead of static for
AM335_ICE
rtc: ds1307: Handle oscillator stop flag set on ds1339 chip
Merge patch series "test: Quote variables in 'test -n' expressions across
boards"
aristainetos2: Quote rescue_reason in rescueboot test
mccmon6: Quote recovery_status in bootcmd test
beaglev_fire: Quote no_of_overlays in design test
siemens: Quote A/B flags in env tests
ti: Quote board_init in ti_common.env
Merge patch series "add memdup_nul(), use it and memdup() in a few places"
test: lib: add test of memdup_nul()
drivers/core: use memdup() instead of malloc()+memcpy()
common/cli.c: use memdup_nul() in run_command_list()
lib/hashtable.c: use memdup_nul() in himport_r
lib/string.c: implement strdup() and strndup() in terms of memdup_nul()
lib/string.c: introduce memdup_nul() helper
lib/string.c: drop pointless __HAVE_ARCH_STRDUP
stdio: drop stdio_clone
string: fix prototype of memdup()

--===============1379261659734509085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="u-boot-tools-changelog.txt"

Prepare v2026.10
MAINTAINERS: Fix Lukasz email
Gitlab CI: Temporarily limit thread count on world builds
board: beacon: Remove i.MX8MP Beacon EmbeddedWorks Devkit support
board: beacon: Remove i.MX8MN Beacon EmbeddedWorks Devkit support
board: beacon: Remove i.MX8MM Beacon EmbeddedWorks Devkit support
board: beacon: Remove Beacon EmbeddedWorks RZ/G2 Dev Kit support
board: davinci: Remove DA850 EVM support
board: logicpd: Remove AM3517 EVM support
board: logicpd: Remove i.MX6 SOM support
board: logicpd: Remove OMAP3 SOM support
Merge tag 'efi-2026-10-rc6' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-efi
lmb: Add StarFive JH-7110 SoC as requiring DMA below 4GiB
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
sh
boot: mention sbox in efi loader boot method doc
efi_loader: fix efi_http_instance free on error
Merge patch series "fsl, powerpc: Fix SPD read and appended DTB alignment"
board: cssi: Move alignment padding into __u_boot_list section
powerpc: mpc85xx: Move alignment padding into __u_boot_list section
ddr: fsl: Fix SPD read when legacy I2C is used
Merge tag 'u-boot-dfu-20260929' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-dfu
usb: dwc3-generic: Fix ref clock enable error check
power: domain: renesas-r8a78000: Add SDK SCP 4.39 map
power: domain: renesas-r8a78000: Add SDK SCP 4.37 map
clk: renesas: Add SDK SCP 4.39 map to Renesas R-Car R8A78000 X5H CPG clock
driver
clk: renesas: Add SDK SCP 4.37 map to Renesas R-Car R8A78000 X5H CPG clock
driver
configs: Resync with savedefconfig
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
usb
usb: dwc3-generic: fix ref clock lookup indexing wrong clk_bulk array
usb: gadget: f_mass_storage: Synchronously tear interface down
usb: gadget: rockusb: terminate full-speed descriptors
Prepare v2026.10-rc5
Merge tag 'u-boot-stm32-20260921' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-stm
fw_env: do not create lockfile with read access for others
MAINTAINERS: Update some SoCFPGA related addresses
ARM: dts: Add bootph-all in ltdc node for sqtm32mp235f-dk-u-boot
ARM: dts: Add bootph-all in ltdc node for stm32mp257f-dk-u-boot
Merge tag 'u-boot-rockchip-2026.10-20260918' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-rockchip
Revert "Clean up emails from non-existing domains"
Clean up emails from non-existing domains
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
sh
clk: versaclock: Fix incorrect error check in versaclock_probe()
arm64: renesas: Enable FFA on Renesas R-Car X5H R8A78000
arm64: renesas: Drop empty board_early_init_f() from Renesas R-Car Gen5 common
code
arm64: renesas: Drop CNTP from Renesas R-Car Gen5 common code
arm: renesas: Drop SYS_ARCH_TIMER on R-Car R8A78000 X5H Cortex-M33 RSIP
Merge tag 'u-boot-dfu-20260914' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-dfu
Merge tag 'net-20260915' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-net
board: anbernic: Fix the RG-DS Kconfig target guard
fastboot: fix the RK3328 buffer-address default
test: dm: nfs: Add regression tests for the NFS reply-length checks
net: nfs: Bound the length of an NFS readlink reply
net: nfs: Bound the length of an NFS read reply
u-boot: fix error check in eth init
net: airoha: fix PCS calibration retry limit
net: net6: validate IPv6 payload and transport lengths on receive
net: lwip: allow DHCP to stop without releasing its lease
net: lwip: add an HTTP client abort operation
net: lwip: allow DNS callbacks to be canceled
net: lwip: return ERR_ABRT after aborting wget receive
test: dm: eth: add DHCPv6 oversized option regression tests
net: dhcp6: bound received DUID option lengths
MAINTAINERS: tee: update Jens Wiklander's email address
env: Update description of single to redundant environment upgrade path
Merge tag 'u-boot-pci-fixes-20260911' of https://git.u-boot-
project.org/u-boot/custodians/neil.armstrong/u-boot-pci
Merge tag 'u-boot-nvme-fixes-20260911' of https://git.u-boot-
project.org/u-boot/custodians/neil.armstrong/u-boot-nvme
dm: pci: fix uninitialized fdt_pci_addr fall-through in pci_get_devfn
pci: Iterate over busses using uclass_foreach_dev_probe
nvme: apple: Drop the PRP null check chicken bit
nvme: apple: Add WARN_ON_ONCE for non page-aligned admin queue buffers
nvme: apple: Never set the opcode in the NVMMU TCB
nvme: apple: Don't set a DMA direction for commands without a data transfer
avb: fix missing break in avb_set_state() switch
dfu: mtd: probe before get_mtd_device_nm()
Prepare v2026.10-rc4
arm: mvebu: armada8k: do not offer the ATF/TEE region as free memory
Merge tag 'efi-2026-10-rc4-2' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-efi
Merge tag 'fsl-qoriq-for-2026.10-rc4' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-fsl-qoriq
configs: ls104{3,6}aqds_tfa: enable PCIe Ethernet
common: kconfig: raise SYS_CBSIZE default to 1024 for FSL_LSCH2/LSCH3
configs: layerscape: drop CONFIG_SYS_PBSIZE=532 override
configs: layerscape qds: enable OF_LIBFDT_OVERLAY
configs: ls2088aqds_tfa: fix NOR flash write failure
configs: layerscape qds: disable ENV_RELOC_GD_ENV_ADDR for NOR boot
docs: u-boot-stats-v2026.07: Regenerate
doc: board: ti: correct path to tcl scripts
doc: board: ti: am64x: add missing debugging section
efi_loader: Remove duplicate declarations
efi_loader: consider type of platform_get_rng_device() return value
efi_loader: remove debug in platform_get_rng_device
Merge patch series "board: ti: update and correct files MAINTAINERS entries"
board: ti: j722s: update the MAINTAINERS entry
board: ti: j721s2: update MAINTAINERS entries
board: ti: j721e: update MAINTAINERS entries
board: ti: j7200: update MAINTAINERS entries
board: ti: am62px: update MAINTAINERS entries
board: ti: am62dx: update MAINTAINERS entries
board: ti: am62ax: update MAINTAINERS entries
board: ti: am62x: add files to MAINTAINERS entries
board: ti: j721s2: split boards into separate maintainer entries
board: ti: j721e: split boards into separate maintainer entries
board: ti: am64x: split the EVM and SK board entries
board: ti: am62x: split board variants into separate maintainer entries
board: ti: correct names in MAINTAINERS file
board: ti: sort file entries in MAINTAINERS files
Merge tag 'u-boot-imx-main-20260906' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-imx
ddr: imx: Reload the training firmware for every PHY configuration
arm64: dts: imx: Increase malloc area size on Data Modul i.MX8M eDM SBC
arm64: dts: imx: Fix EEPROM address on Data Modul i.MX8M Plus eDM SBC
net: fsl_enetc: fix all interfaces getting named enetc-0 on LS1028A
power: regulator: mpq8785: match the MPS MPQ8646
net: ldpaa_eth: fix error logics of unconfigured DPMACs
spi: fsl_dspi: match the Layerscape DSPI compatibles
include/env.h: use plain old #ifdef CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG
board: tqma6ul: Add missing include
Merge patch series "fit: Harden handling of external-data properties"
spl: fit: Bound external data like U-Boot proper
spl: fit: Harden external-data offset and size arithmetic
test: spl: Factor out external-data FIT property checks
image-fit: Use unsigned types for external data properties
fw_env: use env-size property for nvmem layout device detection
fw_env: allow detection of NVMEM device using layout node compatible string
Merge tag 'xilinx-for-v2026.10-rc4' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-amd
fpga: xilinx: Check bitstream length against the supplied buffer
spi: xilinx_spi: fix premature transfer termination at low SCK
board: xilinx: versal-net: move platform_id/platform_version to .data
board: amd: versal2: move platform_id/platform_version to .data
arm64: versal2: Initialize num_banks variable in dram_init()
xilinx: Move u-boot-microblaze to u-boot-amd
MAINTAINERS: Move u-boot-microblaze to u-boot-amd
configs: sc5xx: set default FDT file
Merge tag 'u-boot-stm32-20260902' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-stm
board: st: Fix compilation issue
Merge tag 'u-boot-stm32-20260831' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-stm
ARM: stm32mp2: fix TAMP_FWU_BOOT_IDX_MASK/OFFSET definition
ram: stm32mp1: bound the invalid-argument message in stm32mp1_ddr_subcmd()
Merge tag 'efi-2026-10-rc4' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-efi
binman: gbb: update link
binman: btool: bootgen: update link to user guide
doc: switch to HTTPS for a few links
doc: develop/sending_patches: use link from ozlabs.org mailman archive
doc: chromium/chainload: update instructions on booting on Snow
doc: develop/sending_patches: remove mention to the test mailing list
doc: develop/bootstd: fix link to distro_boot
doc: index: update link to mailing list info
doc: fix broken links to mailing lists
doc: board/renesas: update clone instructions to use new GitLab
doc: develop/tests_writing: update links to new GitLab
doc: board/siemens: iot2050: update links to files on GitHub
doc: board/highbank: update links to cxmanage and ipmitool tools
doc: build/gen_compile_commands: update link to point to the right page
doc: learn/talks: remove dead links to slides
doc: bootstd: update link to BSL
doc: board/tbs: update link to TRM
doc: develop/driver-model: fs_firmware_loader: update link
doc: chromium: update links to slides
doc: chromium: update Firmware porting guide link
doc: chromium: update link to Developer Mode
doc: board/allwinner: update link to MTD utils
doc: develop/uefi: stop tripping linkcheck
doc: arch/arc: update link
doc: board/nxp: mx6ullevk: replace broken link
doc: develop/coccinelle: remove dead link in supplemental documentation
doc: develop/coccinelle: update links
doc: arch/sh: remove squatted URL
doc: board/google: chromebook_link: update link to blobs
doc: usage/pxe: use redirect link
doc: develop: sending_patches: update link to GPL license
doc: develop: sending_patches: update link to Email Clients and Patches
doc: board/amlogic: jethub-j80: use redirect link directly
doc: board/amlogic: jethub-j100: update product page
doc: develop: uefi: update link to ipxe git repo
doc: arch/x86: manual_boot: update links to slides
doc: arch/x86: update link to ACPI
doc: arch/x86: update link to SeaBIOS
doc: arch/x86: update MP link
doc: arch/x86: update SFI link
doc: arch/x86: update link to DediProg SO8 Testclip
doc: arch/x86: fix URL to em100
doc: develop: sending_patches: fix links to pw-am.sh
doc: arch/x86: fix "link" to IRQ router DT binding
doc: arch/mips: update link for Buildroot toolchain
lib: correct list_guid[] array
rng: Fix build with SPL/TPL
test: boot: measurement: Fix compilation for non-sandbox builds
MAINTAINERS: Use proper Orphan status marking
fix non-existing sysam.it domain
Merge patch series "fs/squashfs: fix two out-of-bounds reads on crafted images"
fs/squashfs: bound fragment offset/size in sqfs_read_nest()
fs/squashfs: bound the inode table walk in sqfs_find_inode()
Merge patch series "fs/squashfs: fix directory table integer overflow"
test: squashfs: add directory table overflow regression test
fs/squashfs: fix integer overflow in directory table allocation
Merge patch series "fs/squashfs: bounds checks on image-controlled offsets"
fs/squashfs: bound the offset returned by sqfs_dir_offset()
fs/squashfs: bound fragment table accesses in sqfs_frag_lookup()
Prepare v2026.10-rc3
Merge patch series "boot: image-fdt: Restore suppression of irrelevant ERROR
message"
boot: image-fdt: Restore suppression of irrelevant ERROR message
lmb: Return -EFAULT when freeing unallocated memory regions
lmb: Return -EFAULT when requested region is not part of memory map
disk: ubi: use a format string when copying the volume name
test: dm: hash: check digest size before memset
Merge patch series "sc59x: Disable CONFIG_EFI_LOADER"
Merge patch series "gunzip: Fix spurious Z_BUF_ERROR in chunked gzwrite
decompression"
Merge tag 'u-boot-dfu-20260819' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-dfu
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
sh
arm64: dts: renesas: r8a779g3: Drop set VDDQ18_25_AVB voltage on Retronix R-Car
V4H Sparrow Hawk EVTB1
arm64: dts: renesas: r8a779g3: Drop invert microSD voltage selector on Retronix
R-Car V4H Sparrow Hawk EVTB1
arm64: dts: renesas: r8a779g3: Drop generic SPI NOR support on Retronix R-Car
V4H Sparrow Hawk board
arm64: renesas: r8a779g3: Switch to distro boot command on Retronix R-Car V4H
Sparrow Hawk
arm64: renesas: r8a779g3: Add bootloader update environment on Retronix R-Car
V4H Sparrow Hawk
arm64: renesas: r8a779g3: Add PCIe firmware environment on Retronix R-Car V4H
Sparrow Hawk
doc: board: renesas: Document Retronix R-Car Gen4 V4H Sparrow Hawk SPI NOR
layout
pci: pcie-rcar-gen4: Switch to devm_*() GPIO and reset
pci: pcie-rcar-gen4: Avoid repeated link attempts
pci: pcie-rcar-gen4: Switch to generic firmware loader
remoteproc: renesas: rsip: Implement core status
remoteproc: renesas: rsip: Implement SCMI core stop
remoteproc: renesas: rsip: Reset SCP core on stop
configs: adi: sc594: disable CONFIG_EFI_LOADER
configs: adi: sc598: disable CONFIG_EFI_LOADER
test: cmd: Add gzwrite chunk boundary regression test
gunzip: Fix spurious Z_BUF_ERROR in chunked gzwrite decompression
remoteproc: renesas: rsip: Extract SCP initialization from board file
remoteproc: renesas: rsip: Improve error print
remoteproc: renesas: rsip: Clear SCMI transport flags
pylibfdt: Replace removed SWIG Python 2 compatibility macros
arm: dts: k3-am625-beagleplay: add bootph tags to pmic regulators
Merge tag 'u-boot-rockchip-2026.10-20260813' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-rockchip
Merge tag 'net-20260813' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-net
net: srand_mac(): fix -ENODEV crash with CONFIG_DM_RNG
Merge tag 'xilinx-for-v2026.10-rc3' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-amd
net: lwip: dhcp: fix DHCP fine timer interval
bootstd: android: bound the boot image read by its partition size
MAINTAINERS: Add missing fragment for Versal Gen 2
ufs: amd-versal2: Remove ZYNQMP_FIRMWARE dependency
xilinx: versal2: Clean UFS firmware interface
ufs: amd-versal2: Perform controller reset in the init callback
xilinx: versal2: Add PM UFS firmware interface
firmware: zynqmp: Remove duplicated sys_proto.h header
xilinx: zynqmp: Enable SPL for zynqmp mini
xilinx: zynqmp: Setup BOARD_SIZE_LIMIT for mini configurations
xilinx: mbv: Enable SPL_REMAKE_ELF support
xilinx: mbv: Disable arch-specific memory functions in SPL
xilinx: mbv: Disable CPU driver in SPL
spi: zynqmp_gqspi: fix quad mode bus conflict
board: xilinx: Generate FWU capsule dfu_alt_info from fwu_platform_hook()
arm64: versal2: Select GIC redistributor base at runtime
arm64: versal2: Make hardware.h assembly safe
rockchip: rk3576: Disable force_jtag by default
include: linux: Import hw_bitfield.h from Linux v6.18
Merge tag 'fsl-qoriq-for-2026.10-rc3' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-fsl-qoriq
armv8: layerscape: Fix TF-A DRAM reservation with empty banks
scmi: pinctrl: Rename SCMI_PIN_DEFUALT to SCMI_PIN_DEFAULT
power: regulator: tps65219: Fix LDO selector boundaries
pci: layerscape: fix pci_iommu_extra hotplug
arm: dts: layerscape: drop leading zeros from unit addresses
power: pmic: tps65219: fail if regulators node is missing
firmware: scmi: Support probe vendor ID 0x81
cmd: scmi: Show names for vendor protocols 0x80 and 0x82
Prepare v2026.10-rc2
board_f: Call initf_malloc() before fdtdec_setup()
Makefile: depend on OF_LIST dts sources for fit-dtb.blob
bootretry: only reinitialize retry_time when bootretry env variable has been
touched
arm: mach-k3: j784s4: Add clk and power support for main_uart2 and main_uart3
serial: coreboot: Accept DBG2 subtype 0x12
cmd: scsi: Drop duplicate leading scsi prefix
mtd: cfi: Replace env_get_f() with env_get_yesno()
Merge patch series "fs: btrfs: report file sizes from readdir"
fs: btrfs: deduplicate the inode size lookup
fs: btrfs: release the path when btrfs_search_slot() fails
fs: btrfs: report file sizes from readdir
Merge patch series "boot: fit: authenticate the dm-verity roothash"
test: fit: verify dm-verity roothash is covered by the config signature
boot: fit: cover the dm-verity roothash with the config signature
boot: fit: factor out node-path collection in fit_config_add_hash()
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
usb
usb: mtu3: add SPL support
usb: mtu3: support the upstream devicetree binding
doc: usb: remove obsolete MediaTek MTU3 bindings
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
sh
arm64: dts: renesas: ironhide: Describe inline ECC carveouts
arm64: dts: renesas: ironhide: Describe all reserved memory
arm: renesas: Store env in HF on R-Car R8A78000 X5H Cortex-M33 RSIP port
arm: renesas: Enable RPC on R-Car R8A78000 X5H Cortex-M33 RSIP port
arm: renesas: Bind RPC on R-Car R8A78000 X5H Cortex-M33 RSIP port
arm: renesas: Disable MMC support on R-Car R8A78000 X5H Cortex-M33 RSIP port
ufs: rcar-gen5: Switch from FASTAUTO mode to FAST mode
mtd: spi: renesas: Add R-Car Gen5 DT compatible
mtd: spi: renesas: Align macro prefixes
mtd: rpc: renesas: Add R-Car Gen5 DT compatible
mtd: rpc: renesas: Switch to dev_read_addr_name()
Merge tag 'u-boot-imx-main-20260807' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-imx
Gitlab CI: sage: Disable test_net_tftpboot_boot on Raspberry Pi 4 for now
Merge tag 'mediatek-for-main-2026-08-05' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-mediatek
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
riscv
Merge tag 'u-boot-watchdog-20260803' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-watchdog
Merge tag 'fwu-main-03082026' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-tpm
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
sh
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
usb
binman: nxp_imx8mcst: Handle FCFB header during SPI NOR boot
imx: Add FRDM-IMX95 initial support
clk: mediatek: mt8188: fix top0 gate polarity
arm: mediatek: use phase-aware PSCI reset on MT8188
cmd: ufetch: fix compiling with no CONFIG_SYS_CONFIG_NAME
board: sophgo: add support for Milk-V Duo 256M
board: sophgo: move ethernet driver to common directory
mailbox: mpfs: add bounded wait for BUSY to clear before sending request
mailbox: mpfs-mbox: replace unbounded BUSY polling with bounded waits
configs: microchip_mpfs_generic: enable MPFS RNG support
rng: add Microchip PolarFire SoC hardware RNG driver
misc: mpfs_syscontroller: bind RNG sub-device
misc: mpfs_syscontroller: add mailbox RX helper for service responses
net: rtl8169: add support for RTL8126A and RTL8127A
watchdog: ast2600: add AST2700 support
cyclic: return early from cyclic_run() if the list is empty
cyclic: get rid of cyclic_get_list() helper
toradex: tdx-cfg-block: Add Aquila iMX95 0243 PID4
arm: imx: initialize the system counter earlier on i.MX7
imx: scmi: suppress invalid origin/errid in reset reason print
binman: add CST backend selection for i.MX8M signing
board: phycore_imx8mm: add 1 and 4GB RAM timings
board: phycore_imx8mm: update RAM timings
fwu: Make boottime check failures visible
arm: dts: renesas: Remove unused OPP nodes from R-Car H3/M3-W/M3-W+/M3-N
pinctrl: renesas: Further minimize R8A77965 M3-N PFC tables
pinctrl: renesas: Further minimize R8A77960 M3-W and R8A77961 M3-W+ PFC tables
pinctrl: renesas: Further minimize R8A77951 H3 PFC tables
Revert "arm64: dts: renesas: r8a779g3: Reinstate basic PCIe clock description
for Sparrow Hawk"
arm64: renesas: r8a779g3: Enable PCIe clock generator and I2C mux drivers on
Retronix R-Car V4H Sparrow Hawk board
pci: pcie-rcar-gen4: Handle always on reference clock
clk: rs9: Add Renesas 9-series PCIe clock generator driver
clk: renesas: Add SDK SCP 4.36 map to Renesas R-Car R8A78000 X5H CPG clock
driver
usb: mtu3: wait for TX FIFO to drain before disconnect
MAINTAINERS: Update SH/SoCFPGA/USB email addresses
Merge tag 'efi-2026-10-rc2-2' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-efi
Merge tag 'u-boot-at91-fixes-2026.10-a' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-at91
Merge tag 'u-boot-marvell-20260731' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-marvell
efi_loader: fix use of uninitialized guid in variable enumeration loops
doc: cmd: gpt: Reinstate gpt setenv
README: Slightly rephrase env set and env print paragraph
doc: CONTRIBUTE: replace "as" with "like"
efi_loader: fix memory leak in efi_sigstore_parse_siglist
efi: Print ISA-specific and unknown memory attributes
efi: Unify the memory map output of 'efi mem' and 'efidebug memmap'
arm: mvebu: Add Allied Telesis x960 board
arm: mvebu: Update docs for Allied Telesis x220
arm: mach-mvebu: Add more AC3 & PC3 variants
arm64: a37xx: pinctrl: fix info->dev used but never set
Merge tag 'mmc-for-2026.10-rc2' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-mmc
test: net: add regression test for IP reassembly overflow
net: fix out-of-bounds write in IP fragment reassembly
crypto: hash: use DM providers from hash command
spl: atf: fix BL32 entry point for multi-segment TEE images
Merge patch series "rtc: pcf8563: HYM8563 support and unreliable-time reporting"
rtc: pcf8563: return -EINVAL when the voltage-low flag is set
rtc: pcf8563: add haoyu,hym8563 compatible
x86: add support for CONFIG_REMAKE_ELF
CI: Azure: Correctly skip semihosting tests on vexpress_fvp
mailmap: update entry for Christopher Obbard
arm: qcom: Update ipq5424-rdp466-u-boot.dtsi for v7.1-dts changes
arm: imx943: Update dts files to build with v7.1-dts tag
Subtree merge tag 'v7.1-dts' of dts repo [1] into dts/upstream
Squashed 'dts/upstream/' changes from 0f7b6a4fa8c5..e8613e1cf445
clk: mediatek: drop probe-after-bind provider setup
clk: mediatek: probe parent providers on demand
clk: mediatek: mt8188: add display related clock driver
clk: mediatek: get the clock tree from the driver data in mtk_common_clk_init
clk: mediatek: remove the dedicated clock gate code path
clk: mediatek: mt8189: use driver data to store the clock tree
clk: mediatek: mt8189: deduplicate clock gate drivers
clk: mediatek: mt8512: use driver data to store the clock tree
clk: mediatek: mt8512: deduplicate clock gate drivers
clk: mediatek: mt8365: use driver data to store the clock tree
clk: mediatek: mt8365: deduplicate clock gate drivers
clk: mediatek: mt8195: use driver data to store the clock tree
clk: mediatek: mt8195: deduplicate clock gate drivers
clk: mediatek: mt8518: use driver data to store the clock tree
clk: mediatek: mt8518: deduplicate clock gate drivers
clk: mediatek: mt8516: use driver data to store the clock tree
clk: mediatek: mt8516: deduplicate clock gate drivers
clk: mediatek: mt8183: use driver data to store the clock tree
clk: mediatek: mt8183: deduplicate clock gate drivers
clk: mediatek: mt7988: use driver data to store the clock tree
clk: mediatek: mt7988: deduplicate clock gate drivers
clk: mediatek: mt7987: use driver data to store the clock tree
clk: mediatek: mt7987: deduplicate clock gate drivers
clk: mediatek: mt7986: use driver data to store the clock tree
clk: mediatek: mt7986: deduplicate clock gate drivers
clk: mediatek: mt7981: use driver data to store the clock tree
clk: mediatek: mt7981: deduplicate clock gate drivers
clk: mediatek: mt7629: use driver data to store the clock tree
clk: mediatek: mt7629: deduplicate clock gate drivers
clk: mediatek: mt7623: use driver data to store the clock tree
clk: mediatek: mt7623: deduplicate clock gate drivers
clk: mediatek: mt7622: use driver data to store the clock tree
clk: mediatek: mt7622: deduplicate clock gate drivers
clk: mediatek: mt8188: use driver data to store the clock tree
clk: mediatek: mt8188: deduplicate clock gate drivers
power: regulator: ADD PMIC PF9453 support
power: pmic: ADD PMIC PF9453 support
power: domain: renesas-r8a78000: Add SDK SCP 4.36 map
mmc: enable CMD23 for multi-block transfers
mmc: fix mmc_deinit regression when card is at 1.8V signaling
mmc: fix mmc_bwrite() ignoring host get_b_max() callback
mmc: sdhci: fix align_buffer memory leak on re-initialization
mmc: rpmb: fix tautological condition in RPMB_REQ_READ_DATA validation
mmc: fix mmc_poll_for_busy() false timeout when card is ready
ram: k3-ddrss: fix ecc range checking bug
Kconfig: ram: select FDT_64BIT for K3_INLINE_ECC
cmd/mtd.c: fix do_mtd_io doesn't support 64bit user address
board: phytec: phycore_am68x: Turn off pmic watchdog
arm: dts: k3-am68-phyboard-izar-u-boot: Add mcu_i2c0
serial: avoid redundant early UART initialization
arm: dts: Add SD dts for the sc598 EZKIT
tools: binman: pass KEYDIR to FIT entries
pinctrl: single: parse gpio-range as a raw array (O(N^2) -> O(N))
Merge patch series "Enable Ethernet boot on SK-AM62A-LP"
doc: board: ti: am62ax_sk: Add document for Ethernet boot on AM62x SoC.
arm: dts: k3-am62a7-sk-u-boot: Enable DM services for main_pktdma
configs: am62ax_evm_a53_ethboot: Enable config options required to enable
Ethernet boot
configs: am62ax_evm_r5_ethboot: Enable config options required for Ethernet boot
Merge tag 'u-boot-nvme-next-20260728' of https://git.u-boot-
project.org/u-boot/custodians/neil.armstrong/u-boot-nvme
Merge tag 'u-boot-ufs-fixes-20260728' of https://git.u-boot-
project.org/u-boot/custodians/neil.armstrong/u-boot-ufs
Merge tag 'efi-2026-01-rc2' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-efi
Merge tag 'u-boot-dfu-20260728' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-dfu
Merge tag 'u-boot-imx-main-20260727' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-imx
Prepare v2026.10-rc1
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
sunxi
sandbox: fix enum host_platform_flags description
Merge tag 'u-boot-rockchip-2026.10-20260724' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-rockchip
Merge patch series "fs: regression-safe load <iface> for null_dev_desc_ok
fstypes"
efi_loader: check efi_deserialize_load_option() in get_dp_device()
test: check default GUID selection of signature database variables
cmd: nvedit_efi: use efi_auth_var_get_guid() for the default GUID
doc: board: renesas: Document Renesas R-Car Gen5 RSIP Cortex-R52 start
doc: Switch from printenv to env print
doc: Switch from setenv to env set
doc: thead: lpi4a: detail how to enable fastboot
efi_loader: set correct frame buffer address
board: gateworks: fsa: bound FSA EEPROM gpio descriptor count
configs: tqma6ul: add support for redundant environment
board: tqma6: add kernel device tree handling for environment
board: tqma6: implement ENET errata workaround detection
board: tqma6: use runtime SoC detection in enet setup
dts: tqma6: mba6: remove old device trees
ARM: dts: tqma6: add boot phase properties
board: tqma6: change U-Boot device tree fragments
rtc: snvs: Add i.MX SNVS RTC driver
arm64: imx: Handle both MMC2 and SD2 boot devices on Data Modul i.MX8M Mini eDM
SBC
toradex: tdx-cfg-block: Add verdin am62 0242 pid4
toradex: tdx-cfg-block: Add smarc imx8mp 0240 pid4
toradex: tdx-cfg-block: Add verdin imx8mm 0239 pid4
toradex: tdx-cfg-block: Add verdin imx8mp 64gb emmc pid4s
toradex: tdx-cfg-block: Add apalis imx8qm 64gb emmc pid4s
toradex: tdx-cfg-block: Add aquila tda4 0230 pid4
toradex: tdx-cfg-block: Add smarc imx95 0229 pid4
board: toradex: aquila-imx95: detect RAM sizes
board: toradex: smarc-imx95: detect RAM sizes
imx9: scmi: Update get mac from fuse for iMX952
test: py: load: check null_dev_desc_ok dispatch
doc: usage: cmd: load: null-block-device
fs: dispatch null_dev_desc_ok filesystems before lookup
imx93_frdm: Add OP-TEE device tree node
arm64: dts: imx8mn: Drop nxp,fspi-header-filename
arm64: dts: imx8mm: Drop nxp,fspi-header-filename
binman: imx8mimage: Generate FSPI header in binman instead of mkimage
ge: common: vpd_reader: fix errloc array size in verify_bch()
boards: tqma6ul: select TQ_COMMON_SYSINFO
arm: dts: tqma6ul: integrate tq,eeprom sysinfo driver
arm: dts: tqma6ul: add eeprom nvmem-layout
sysinfo: tq_eeprom: select NVMEM
arm64: dts: imx8m: Reinstate TEE ifdeffery
mx6: ddr: Subtract half a cycle instead of three quarters of a cycle after DQS
gating calibration
arm: dts: imx943-evk: Add label for gpio expander devices
imx9: scmi: reset GPIO2 according its node status
imx9{4, 5, 52}_evk: power on mcore according to SM config
imx9: bootaux: Support booting CM70, CM71 and CM33 sync cores
imx9: bootaux: Support authenticate signed Mcore container image
Merge https://git.u-boot-project.org/u-boot/custodians/u-boot-riscv
board: purism: Add support for the Librem5 devkit
doc: android: refresh AVB provenance and pin libavb reference
libavb: update to AOSP 1.3.0
serial: sifive: remove busy-loops from getc and putc ops
riscv: remove log_debug() in enable_caches()
MAINTAINERS: riscv: Add myself as a reviewer
rng: jh7110: Fix invalid usage of dev_read_addr
riscv: Exclude ACLINT for TARGET_XILINX_MBV
riscv: Make RISCV_ACLINT visible
riscv: Skip riscv_cpu_setup() when CPU driver is disabled
board: starfive: visionfive2: Support VisionFive 2 Lite eMMC
configs: visionfive2: Add VisionFive 2 Lite eMMC DT to OF_LIST
riscv: dts: cv18xx: fix spi node name
doc: sophgo: licheerv_nano: fix incorrect step numbering
configs: radxa-cubie-a5e: enable the gmac1 controller
net: dwc_eth_qos: add support for sun55i platform
arm: mach-sunxi: add syscon driver for system-control nodes
clk: sunxi: a523: add MBUS_EMAC1 clock gate
pinctrl: sunxi: a523: add gmac1 support
sunxi: configs: OrangePi 4A: enable SPI
sunxi: configs: Radxa Cubie A5E: enable SPI
sunxi: spl: spi: Add support for Allwinner A523
sunxi: spl: spi: Clean up SPI0 pinmux setting
spi: sunxi: add support for A523 SPI controller
mmc: sunxi: fix MACH_SUN9I typo in get_mclk_offset()
Merge patch series "fs/squashfs: fix symlink load failure on large images"
fs/squashfs: fix dirs->entry leaks on sqfs_search_dir() error paths
fs/squashfs: add sqfs_dir_offset() error checks
fs/squashfs: fix heap exhaustion during symlink resolution
Azure CI: Drop Windows host tools builds
fit: prefer the default configuration on best-match ties
MAINTAINERS: Replace Atmel with N:
.mailmap: map the old U-Boot mailing list address to the new one
avb: free mmc_part allocated by get_partition()
boot: android: fix AvbOps and verify-data leaks in AVB path
arm: armv8: mmu: fix DCACHE_OFF incorrectly unmapping region
serial: esp32: add driver for esp32 series chips
bootm: teach handle_decomp_error() about the noload decompression buffer
cmd: mbr: return false instead of NULL from bool found_key()
cmd: pstore: bound path formatting with snprintf to avoid stack overflow
cmd: strings: interpret second argument as a byte count
cmd: date: Handle -ENOSYS return from dm_rtc_reset()
Merge patch series "tools: mkimage: fix stale data pointer in fit_import_data()"
test: py: add regression test for fit_import_data() stale state
tools: mkimage: fix stale data pointer in fit_import_data()
Merge tag 'mediatek-for-main-2026-07-22' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-mediatek
Merge branch 'main' of https://git.u-boot-project.org/u-boot/custodians/u-boot-
usb
mtd: nand: raw: rockchip_nfc: fix ecc setup
net: nfs: clean up bounds checks in nfs_readlink_reply()
net: dwc_eth_xgmac: Return -ENODEV when phy_connect() fails
cmd: lwip: wget: free mbedtls x509 cert context to avoid memory leak
cmd: lwip: sntp: fix netif leak when ntpserverip is unset
net: lwip: handle chained pbufs in transmit path
net: lwip: add tftpsrv command
net: Drop unnecessary device_set_name
net: phy: fix duplicate eth_phy binding
net: phy: dp83867: enable extended read / write for driver
rockchip: rk3588s: Add support for ROC-RK3588S-PC
rockchip: pinctrl: use include from dts/upstream
rockchip: pinctrl: replace RK_GPIOn defines
rockchip: pinctrl: replace RK_FUNC_n defines
MAINTAINERS: update ARM ROCKCHIP entry to list Simon as reviewer
rockchip: only build GPT capsule update helpers with PARTITION_TYPE_GUID
Merge patch series "i3c: dw: fix slave device setup and probe issues"
i3c: dw: fix slave device setup after DAA
configs: versal2: enable I3C support
cmd: i3c: fix list and current needing pre-selected controller
i3c: dw: make resets optional in probe
configs: mediatek: enable MT8188 power domain
power: domain: mediatek: add MT8188 power domain driver
power: domain: mediatek: add support for the power-controller model
power: domain: mediatek: rename struct mtk_scp_domain to mtk_scpsys
power: domain: mediatek: rename mtk_power_domain_probe to mtk_scpsys_probe
power: domain: mediatek: wrap domain tables in struct scp_soc_data
power: domain: mediatek: split into per-SoC drivers
power: domain: mediatek: constify scp_domain_data instances
power: domain: mediatek: prefix internal identifiers with mtk_
power: domain: mediatek: remove enum scp_domain_type
power: domain: mediatek: use MT2701 naming instead of MT7623
power: domain: mediatek: use MT7622 naming instead of MT7629
configs: mediatek: drop unused CONFIG_MTK_POWER_DOMAIN
power: domain: keep Makefile and Kconfig sorted
clk: mediatek: mt8518: unique driver names
clk: mediatek: mt8516: unique driver names
clk: mediatek: mt8512: unique driver names
clk: mediatek: mt8365: unique driver names
clk: mediatek: mt8195: unique driver names
clk: mediatek: mt8189: unique driver names
clk: mediatek: mt8188: unique driver names
clk: mediatek: mt8183: unique driver names
clk: mediatek: mt7988: unique driver names
clk: mediatek: mt7987: unique driver names
clk: mediatek: mt7986: unique driver names
clk: mediatek: mt7981: unique driver names
clk: mediatek: mt7629: unique driver names
clk: mediatek: mt7623: unique driver names
clk: mediatek: mt7622: unique driver names
clk: mediatek: mt7629: remove mt7629_peri_clk_tree
arm: dts: mt7988: remove clock-parent properties
arm: dts: mt7986: remove clock-parent properties
arm: dts: mt7981: remove clock-parent properties
clk: mediatek: remove mtk_common_clk_infrasys_init()
clk: mediatek: drop parent udevice field
clk: mediatek: use registered provider for parent lookup
clk: mediaTek: mt8518: add clock tree type flags
clk: mediaTek: mt8516: add clock tree type flags
clk: mediaTek: mt8512: add clock tree type flags
clk: mediaTek: mt8365: add clock tree type flags
clk: mediaTek: mt8195: add clock tree type flags
clk: mediaTek: mt8189: add clock tree type flags
clk: mediaTek: mt8188: add clock tree type flags
clk: mediaTek: mt8183: add clock tree type flags
clk: mediaTek: mt7988: add clock tree type flags
clk: mediaTek: mt7987: add clock tree type flags
clk: mediaTek: mt7986: add clock tree type flags
clk: mediaTek: mt7981: add clock tree type flags
clk: mediaTek: mt7629: add clock tree type flags
clk: mediaTek: mt7623: add clock tree type flags
clk: mediaTek: mt7622: add clock tree type flags
clk: mediatek: add registration function for clock tree types
clk: mediatek: mt7622: set parent flag for GATE_APMIXED()
arm: dts: mt7623: remove duplicate topckgen override
clk: mediatek: mt8189: fix VLP_CK wrong parents
configs: mediatek: do not autostart the watchdog on the Genio EVKs
clk: mediatek: mt8188: add missing clock in pericfg_ao
arm: dts: mediatek: add U-Boot dtsi overrides for Genio 510 and Genio 700
MAINTAINERS: Replace Mediatek with N:
usb: ci_udc: verify all dtds are inactive before completing request
usb: ci_udc: Update usb request status
usb: ci_udc: set correct ep type in ep_enable()
boot: android: fix out-of-bounds access in bootconfig parsing
usb: gadget: dwc2: Set endpoint capabilities via .caps field
usb: gadget: dwc2: Use usb_ep_set_maxpacket_limit() for fifo sizes
cmd: ums: Set Device Descriptor iSerial based on serial# env variable
cmd: read: fix unsigned overflow bypassing range check
Merge patch series "some string cleanup, and a tweak of the "config" command"
test: add test of 'config' command
doc: document 'config' command
cmd: config: allow simple filtering of output
test: string: add test of new strcasestr() function
string: add strcasestr()
string: remove more pointless __HAVE_ARCH_STR*
string: remove unused strswab() function
string: correct documentation for strstr and strnstr
string: correct prototype of strchrnul()
sh: clean up asm/string.h
test: spl: check load_simple_fit() rejects an oversized data-size
spl: fit: bound the external data size before reading it
Merge tag 'riscv-for-v2026.10-rc1' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-riscv
nvme: Fix missing address translation for PCIe inbound access
MAINTAINERS: update RISC-V maintainers
configs: k1: enable pinctrl and gpio
gpio: add gpio driver for Spacemit K1 SoC
pinctrl: add pinctrl driver for Spacemit K1 SoC
spacemit: k1: Add multiple device tree support
riscv: binman: Always set default configuration in FIT image
spl: k1: enable SPI NOR flash detection and boot
spi: fsl: add support for Spacemit K1 SoC
mtd: spi: enable spi_nor_remove() in soft reset config
mtd: spi: select SPL_SPI_FLASH_TINY in SPL stage
doc: spacemit: add K1 SPL build and test guide
board: k1: enable pmic in spl
power: regulator: add support for Spacemit P1 SoC
power: pmic: add support for Spacemit P1 PMIC
spacemit: k1: Add DDR firmware support to SPL
spacemit: k1: add TLV EEPROM support in SPL
i2c: k1: add I2C driver support
board: k1: initialize clock and serial devices in SPL
dts: k1: enable clocks in SPL
configs: k1: add default option for clock driver in SPL
clk: spacemit: k1: prune SPL clock tree
configs: k1: enable early timer support
spacemit: k1: enable SPL with debug UART
spacemit: k1: support multi-board infrastructure
dt-bindings: reset: drop spacemit-k1-reset.h
reset: spacemit: k1: drop legacy spacemit,k1-reset driver
dts: k1: drop legacy local DT files
dts: k1: switch BPI-F3 build to upstream DT
configs: bananapi-f3: enable Spacemit K1 clock driver
clk: spacemit: k1: spawn reset device from per-syscon clock drivers
reset: spacemit: k1: introduce syscon-bound reset driver
clk: spacemit: Add support for K1 SoC
ufs: invalidate the whole descriptor data segment after a query read
usb: xhci-dwc3: Call xhci_deregister() before asserting reset
spi: dw: Allow bits_per_word to be configured by device drivers
global: Switch from source.denx.de to git.u-boot-project.org
Merge patch series "treewide: migrate to the new mailing-list domain"
MAINTAINERS/README: Migrate mailing-list to lists.u-boot-project.org
doc: Migrate mailing-list to lists.u-boot-project.org
tools/patman: Migrate mailing-list to lists.u-boot-project.org
board: rockchip: add Anbernic RG-DS
rockchip: rk3568-nanopi-r5: Drop duplicated/extra sdhci
clk: airoha: fix off-by-one in clock ID boundary check
bloblist: Rename GD_FLG_BLOBLIST_READY to GD_FLG_BLOBLIST_HANDOFF
Revert "Merge patch series "Add DM firmware reserved memory support""
Merge patch series "cyclic: update and optimization"
cyclic: reduce get_timer_us() calls inside hlist_for_each_entry_safe()
cyclic: replace uint64_t by u64 suggested by b4
Merge patch series "vbe: bound FIT external-data reads against the firmware
area"
test: vbe: cover vbe_read_fit() external-data bounds checks
vbe: bound FIT external-data offset and size before blk_read
sandbox: vbe: size firmware1 area to fit the binman fw-update section
Merge patch series "Add DM firmware reserved memory support"
arm: mach-k3: Add DM reserved memory fixup
arm: mack-k3: Kconfig: Add DM firmware reserved memory configs
arm: mach-k3: am62ax: Enable OF_SYSTEM_SETUP for AM62D2
arm: mach-k3: Fix phandle corruption in fdt fixup
Merge patch series "arm: k3: replace tifsstub runtime filter with per-state FIT
configurations"
arm: k3: drop redundant tifsstub runtime filter
board: toradex: verdin-am62: select tifsstub via FIT config
board: phytec: phycore-am62: select tifsstub via FIT config
arm: k3: select tifsstub via board_fit_config_name_match
Merge patch series "dm: core: misc fixes"
dm: core: free old name in device_set_name to prevent leak
dm: core: Correct calloc arguments
dm: core: fix wrong strlen check in of_add_subnode
dm: core: free fdt when fdt_create_empty_tree failure
mach-k3: am64x: clear MCU_RST_SRC before reset
Merge tag 'efi-2026-10-rc1' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-efi
doc: CONTRIBUTE: explicitly list tests and documentation as welcome
contributions
doc: CONTRIBUTE: tell people reviewing *is* contributing
doc: CONTRIBUTE: use internal link instead of hardcoded external URL
efi_loader: Measure secure boot variables in the correct PCR if DeployedMode is
set
efi_loader: Change the return values if a TPM is missing during GetEventLog
efi_loader: Correctly count the size on DTB measurements
efi_loader: fix buffer overrun in efi_sigstore_parse_siglist
efi_selftest: test block io revision and pointers
efi_selftest: free handles on teardown()
efi_loader: fix building with CONFIG_EFI_VARIABLES_PRESEED=y
doc: board: renesas: Convert Renesas board support table to grid table
doc: board: renesas: Update Renesas generic build section
doc: board: renesas: Document Renesas R-Car Gen5 X5H Ironhide board
doc: board: renesas: Document Retronix R-Car Gen4 V4H Sparrow Hawk board
doc: board: renesas: Document Renesas R-Car Gen3 D3 Draak board
doc: board: renesas: Document Renesas R-Car Gen3 E3 Ebisu board
doc: board: renesas: Document Renesas R-Car Gen3 M3Le Geist board
doc: board: renesas: Document Renesas R-Car Gen3 H3/M3-W/M3-N ULCB board
doc: board: renesas: Document Renesas R-Car Gen3 H3/M3-W/M3-N Salvator-X(S)
board
doc: board: renesas: Document Aarch32 toolchain setup in RZ/N1
doc: board: renesas: Document SH/Aarch32/Aarch64 toolchain setup
efi_loader: fix missing EFI_EXIT in efi_disconnect_controller
doc: boards: amlogic: update documentation for Beelink GT1 Ultimate
qfw: fix RSDP ext_checksum recomputation
Merge patch series "mach-omap2: am33xx: ddr JEDEC spec fixups"
arm: mach-omap2: am33xx: check VTP before reinitalizing
arm: mach-omap2: am33xx: ddr: ensure proper reset->cke delay
clk: ti: Use CPU ticks to count timeout
Merge patch series "tools: qconfig: print a proper error when database is
missing"
qconfig: Rename the doc link in help text
tools: qconfig: print a proper error when database is missing
Merge patch series "pinctrl: aspeed: Add AST2700 pinctrl drivers"
pinctrl: aspeed: Add AST2700 SoC1 pinconf support
pinctrl: aspeed: Add AST2700 SoC1 pinctrl driver
pinctrl: aspeed: Add AST2700 SoC0 pinconf support
pinctrl: aspeed: Add AST2700 SoC0 pinctrl driver
Merge tag 'mmc-for-2026.10-rc1' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-mmc
get_maintainer.pl: tighten up git contributors cc list
test: cmd: part: fix integer handling in setup_gpt_partitions()
tools: binman: ti_board_cfg: Add configurable sw-rev support
cmd: fdt: keep control FDT during checksign
Gitlab CI: Switch to git.u-boot-project.org
test: dm: pmbus: test pmbus command and framework
test: dm: pmbus: add a sandbox PMBus chip emulator
thermal: pmbus: add PMBus die-temp driver
board: nxp: vid: introduce PMBus framework support
power: regulator: add MPS MPQ8785 PMBus regulator driver
power: regulator: add generic PMBus UCLASS_REGULATOR adapter
pmbus: add PMBus 1.x framework, CLI, and binding
serial: lpuart: Clear the OR STAT in tstc to prevent hang
power: regulator: Fix regulator_enable/disable() macros
mmc: sdhci: Use CONFIG_IS_ENABLED for MMC_IO_VOLTAGE
mmc: dw_mmc: Allow use of in-spec voltage range for vqmmc-supply
test: dm: regulator: Add regulator_set_value_clamp() tests
power: regulator: Add helper to set voltage within an acceptable range
MAINTAINERS: add entry for SDHCI Cadence driver
Merge patch series "fs: btrfs: add support for readdir"
fs: btrfs: use fs_ls_generic() and drop custom implementation
fs: btrfs: implement opendir(), readdir() and closedir()
cmd: x86: zboot: remove duplicate zboot_setup() call in do_zboot_setup
cmd: upl: fix off-by-one argc check in do_upl_read
cmd: ini: avoid NULL deref when loadaddr/filesize env vars are unset
cmd: host: fix duplicate device_unbind and wrong error message in unbind
cmd: clone: report destination block number on dest write error
remoteproc: k3-r5: Fix crash when issuing rproc init
treewide: Kconfig: use bool instead of tristate
Merge tag 'u-boot-rockchip-2026.10-20260710' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-rockchip
board: rockchip: Add support for 9Tripod X3568 v4
board: rockchip: set M.2 NVMe PERSTN low in spl_board_init on Jaguar
rockchip: fix asm-operand-widths clang warning
rockchip: rk3568: Add support for LinkEase EasePi R1
mtd: nand: raw: rockchip_nfc: fix oobfree length calculation
Merge tag 'i2c-updates-for-2026.10-rc1' of https://git.u-boot-
project.org/u-boot/custodians/hs/u-boot-i2c
rockchip: doc: fix typo evb-rk3288-rk808_defconfig
arm: dts: rockchip: Align OTP nodes for RK3528/RK356x with Linux v7.1
MAINTAINERS: add myself as ARM ROCKCHIP maintainer
MAINTAINERS: remove Philipp Tomsich from ARM ROCKCHIP maintainers
MAINTAINERS: add rockusb to ARM ROCKCHIP
MAINTAINERS: add more Rockchip drivers to ARM ROCKCHIP
MAINTAINERS: add N: rkmtd regex to ARM ROCKCHIP
MAINTAINERS: add N: rv11 regex to ARM ROCKCHIP
MAINTAINERS: add N: rk8 regex to ARM ROCKCHIP
MAINTAINERS: add N: rk3 regex to ARM ROCKCHIP
MAINTAINERS: add N: px5 regex to ARM ROCKCHIP
MAINTAINERS: add N: px30 regex to ARM ROCKCHIP
MAINTAINERS: add rkmux.py to ARM ROCKCHIP
MAINTAINERS: remove redundant entries for ARM ROCKCHIP
Merge tag 'ubi-updates-for-2026.10-rc1' of
https://source.denx.de/u-boot/custodians/u-boot-ubi
cmd: kconfig: i2c: add missing I2C API dependency
Merge patch series "pinctrl: add support of Airoha SoCs"
arm: dts: en7523: add pinctrl/gpio support, drop legacy gpio support
configs: airoha: en7523: enable pinctrl/gpio support
configs: airoha: an7581: enable pinctrl/gpio support
pinctrl: airoha: add pin controller and gpio driver for EN7523 SoC
pinctrl: airoha: add pin controller and gpio driver for AN7583 SoC
pinctrl: airoha: add pin controller and gpio driver for AN7581 SoC
pinctrl: airoha: add shared pinctrl code
pinctrl: sort and format the contents of the makefile
pinctrl: add more pinconf/pinctrl definitions
board: renesas: gen5-cm33: Convert to common field_{get, prep}() helpers
clk: renesas: rcar-cpg-lib: Convert to common field_{get, prep}() helpers
mtd: nand: raw: sunxi: Convert to common field_{get, prep}() helpers
net: hifemac: Convert to common field_{get, prep}() helpers
power: domain: renesas-r8a78000: Convert to common field_{get, prep}() helpers
watchdog: renesas_wwdt: Convert to common field_{get, prep}() helpers
bitfield: Add non-constant field_{prep, get}() helpers
bitfield: Add less-checking __FIELD_{GET,PREP}()
bitops: import BITS_PER_TYPE() macro from linux
board: renesas: gen5-cm33: #undef field_{get, prep}() before definition
clk: renesas: #undef field_{get, prep}() before definition
mtd: nand: raw: sunxi: #undef field_{get, prep}() before definition
net: hifemac: #undef field_{get, prep}() before definition
power: domain: renesas-r8a78000: #undef field_{get, prep}() before definition
watchdog: renesas_wwdt: #undef field_{get, prep}() before definition
Merge tag 'xilinx-for-v2026.10-rc1-v3' of https://git.u-boot-
project.org/u-boot/custodians/u-boot-amd
env: ubi: add support to create environment volume if it does not exist
cmd: ubi: allow creating volume with all free spaces in ubi_create_vol
cmd: ubi: export more APIs to public
cmd: ubi: reorganize command messages
cmd: ubi: change all positive error return value to negative
cmd: ubi: change the type of parameter dynamic to bool
cmd: ubifs: mark string parameters with const
cmd: ubi: use void * for buf parameter in ubi_volume_read
cmd: ubi: mark read-only function parameters with const
ubi: remove unnecessary extern directive from function prototypes
fs: ubifs: fix ubifs_finddir() result check
i2c: designware: fix i2c probe error
i2c: nx: Add License
i2c: nx: Use dev_read_addr_ptr()
arm: dts: zynqmp: Fix space indentation to use tabs
arm64: xilinx: Add missing newline in kr260-revA
arm64: zynqmp: Disable ina226 iio-hwmon nodes
arch: arm: dts: Add RTC clock nodes for ZynqMP platform
arm64: versal-net: Add mmc_get_env_dev() and deduplicate MMC handling
arm64: versal-net: Look up eMMC device in boot_targets_setup()
arm64: versal-net: Do not print bootmode from spi_get_env_dev()
arm64: versal-net: Simplify spi_get_bootseq() bootmode switch
arm64: versal-net: Deduplicate SPI bootmode handling
arm64: zynqmp: Decouple MMIO accessors from firmware
arm64: versal-net: Move bootmode decoding out of board code
arm64: versal-net: Move SoC detection out of board code
arm64: versal2: Move SoC detection out of board code
arm64: zynqmp: Move board_early_init_r clock setup to mach code
arm64: versal-net: Move board_early_init_r clock setup to mach code
arm64: versal2: Move board_early_init_r clock setup to mach code
arm64: versal: Move board_early_init_r clock setup to mach code
arm64: versal: Move bootmode decoding out of board code
arm64: versal: Decouple multiboot register access from firmware
arm64: versal2: Move bootmode decoding out of board code
arm64: versal2: Decouple multiboot register access from firmware
arm: xilinx: Guard mach sys_proto.h against multiple inclusion
soc: xilinx: zynqmp: Add TCG variant detection for ZU3TCG
drivers: fpga: Use FPGA_INTEL_SDM_MAILBOX conditional instead of
Agilex/Stratix10
ufs: amd-versal2: Fix missing .priv_auto in driver registration
MAINTAINERS: Replace Zynq/ZynqMP with N:
mkimage: allow zynqmpbif to use a register initialization file
arm64: versal: Drop static DDR and PCIe MMU mappings
arm64: versal2: Drop static DDR MMU mappings
amd: versal2: detect spi env bus from boot mode
arm64: zynqmp: Sync compatible string format
arm64: dts: xilinx: Drop "label" property on dlg, slg7xl45106
arm64: zynqmp: dts: Fix file descriptions to match actual filenames
arm64: zynqmp: add USB hub supply regulators
arm64: zynqmp: Add CMA reserved-memory for runtime FPGA loading
arm64: zynqmp: Use fixed-partitions for MTD
arm64: zynqmp: Drop incorrect #phy-cells from ethernet-phy nodes
arm64: zynqmp-dlc21-revA: add mac nvmem cell for gem0
arm64: zynqmp-dlc21-revA: Update GPIO line names mapping
Merge branch 'next'
Merge tag 'fsl-qoriq-next-2026-07-06' of
https://source.denx.de/u-boot/custodians/u-boot-fsl-qoriq into next
power: domain: scmi: Allow failure in getting power domain attribute
crypto: fsl: Hide CAAM_64BIT symbol behind FSL_CAAM
gpio: mpc8xxx: add set_flags/get_flags ops
ls1028ardb: Move environment variables to .env file
Merge patch series "bootdev: few fixes for automatic boot"
test: bootdev: scan with a broken high-priority device
bootdev: scan boot devices at each priority level
Merge patch series "bootm: fix flush_cache() with IH_TYPE_KERNEL_NOLOAD"
bootm: allow omitting entry point for IH_TYPE_KERNEL_NOLOAD
bootm: warn about load address for IH_TYPE_KERNEL_NOLOAD in FIT
bootm: fix flush_cache() with IH_TYPE_KERNEL_NOLOAD
Merge patch series "TI: AM64-EVM/SK: Enable MAIN UART1 for SYSFW tracing"
arm: dts: k3-am642-evm/sk: enable MAIN UART1 for SYSFW logs
arm: mach-k3: am642: Update MAIN UART1 serial alias from 3 to 1
mtd: spi-nor: Add gd55lb02gf chips
bootm: move OS index bound check into the legacy path
MAINTAINERS: Remove merge garbage
Merge tag 'u-boot-pci-next-20260701' of
https://source.denx.de/u-boot/custodians/u-boot-ufs into next
pci: layerscape: ep: Use dev APIs
pci: imx: Use dev_read_addr_index_ptr()
pci: dw_mvebu: Use dev_read_addr_x APIs
pci: mpc85xx: Simplfy code with dev_remap_addr()
pci: rcar: Use dev_read_addr_index()
MAINTAINERS: Add myself as core PCI maintainer
rockchip: sdram: Fix initialization of DRAM banks
Makefile.lib: remove stale migrate_xxx logic from fdtgrep logic
MAINTAINERS: Replace Cortina with N:
Merge tag 'u-boot-dfu-next-20260629' of
https://source.denx.de/u-boot/custodians/u-boot-dfu into next
Merge patch series "arm: aspeed: add initial AST2700 SoC support"
treewide: Staticize and constify acpi ops
cros_ec: Convert dm_cros_ec_get_ops into an inline function and constify
dm_cros_ec_ops
env: Avoid mixing of environment and driver prints on env load
rtc: mcfrtc: fix leap year calculation using wrong variable
ram: aspeed: add SDRAM controller driver for AST2700
reset: ast2700: add reset driver support
clk: ast2700: add clock driver support
arm: dts: aspeed: Add initial AST27xx SoC device tree
arm: aspeed: add ASPEED AST2700 SoC family support
spi: aspeed: add AST2700 support
Merge tag 'u-boot-imx-next-20260627' of
https://gitlab.denx.de/u-boot/custodians/u-boot-imx into next
imx9: Add v2x_status and ele_info commands
misc: ele_api: Add V2X Get State API
imx952_evk: Correct CONFIG_DEFAULT_FDT_FILE
imx95/952/94_evk/: enable booting Image.gz
imx93_evk/qsb/frdm: enable booting Image.gz and avoid extra memcpy
imx8mm/n_evk: enable booting Image.gz and avoid extra memcpy
imx8mq_evk: enable booting Image.gz and avoid extra memcpy
imx8mp_evk: enable booting Image.gz and avoid extra memcpy
imx: kontron-sl-mx8mm: Enable the watchdog at boot
clk: imx6q: use clk_divider_table instead of fixed factor for pll5 divs
clk: clk-divider: add clk_register_divider_table()
video: imx: ipuv3: enable ipu clk before writing registers in CCF
clk: imx6q: configure ldb clock selectors
imx6: clock: allow different clock sources for ldb
clk: imx6q: add missing pll bypasses
clk: imx6q: guard video clocks behind config
clk: imx6q: cosmetic: keep pll definitions together
imx93_frdm: Add support for 2CS 2GB DRAM support
imx: fdt: Allow users to inhibit trip point setup
board: toradex: add initial support for aquila imx95
imx93: Add support for OPTEE
binman: Add optee binary to i.MX9 platform types
mx6sabre: Move environment variables to .env files
mx6ullevk: Move environment variables to .env file
mx7ulp_evk: Move environment variables to .env file
imx9: Select OF_LIVE
imx8m_evk: Select OF_LIVE
imx9: soc: Use livetree API for fdt access
misc: ele: Use dev_read_addr
gpio: imx_rgpio2p: Use dev_read_addr_index
serial: lpuart: Use livetree API for fdt access
imx8m: dts: Update ddr firmware name
imx: Guard print_cpuinfo with !CONFIG_IS_ENABLED(CPU)
imx7ulp: cleanup get_imx_type
imx8ulp: cleanup get_imx_type
imx952: Update gpio node regs
imx8m: Imply DM_THERMAL
board: qualcomm: phone: enable CMD_FASTBOOT_ABORT_KEYED
cmd: fastboot: Add keyed abort option
usb: gadget: f_mass_storage: Disable eps during disconnect
usb: f_sdp: handle the spl load function failure
Merge patch series "Kconfig restyle part 2"
Kconfig: restyle
Kconfig: drivers: restyle remaining
Kconfig: gpio: add empty line
Kconfig: video: restyle
Kconfig: usb: restyle
Kconfig: power: restyle
Kconfig: pinctrl: restyle
Kconfig: net: restyle
Kconfig: mtd: restyle
Kconfig: i2c: restyle
Kconfig: net: restyle
Kconfig: lib: restyle
Kconfig: fs: restyle
Kconfig: dts: restyle
Kconfig: disk: restyle
Kconfig: common: restyle
Kconfig: cmd: restyle
Kconfig: boot: restyle
Merge patch series "Kconfig restyle"
Kconfig: board: restyle
Kconfig: arch: restyle
Kconfig: arm: restyle
Kconfig: misc: add empty line
Kconfig: themal: fix typo
Kconfig: power: pmic: fix typo
Kconfig: powerpc: mpc85xx: fix typo
Kconfig: armv7: fix typo
Merge patch series "Relocate U-Boot in the last bank"
doc: Add a warning about using RELOC_ADDR_TOP
configs: Enable RELOC_ADDR_TOP on arm64 QEMU
common: Add an option to relocate on ram top
rpi: Add a local get_effective_memsize()
common: Clean up setup_dest_addr()
common: move ram_base calculation to independent INITCALL()
treewide: move bi_dram[] from bd to gd
rtc: goldfish: Return error when device address is invalid
timer: goldfish: Return error when device address is invalid
serial: goldfish: return error when device address is invalid
serial: cortina: check RX FIFO status before reading data
global_data: fix type for gd_malloc_ptr()
Merge tag 'v2026.07-rc5' into next
Merge patch series "Fixes, cleanup and a test for the SPL FIT "full" loader"
test: spl: add unit test for the "full" FIT loader
spl: fit: use CONFIG_IS_ENABLED whenever possible
spl: fit: drop the 'standalone' load attempt
spl: fit: rework the FDT load hack
spl: fit: fix loadables load under sandbox
boot: fit: fix FIT verification in SPL
Merge patch series "dtc: Resync fdt_check_full function"
dtc: libfdt: Introduce a can_assume check in fdt_check_full
dtc: Resync fdt_check_full() with upstream version v1.7.2-35-g52f07dcca47c
bootm: increase kernel_noload decompression headroom from 4x to 8x
bootm: fix overflow of the noload kernel decompression buffer
board: variscite: add support for the omap4_var_som
arm: ti: Introduce back omap4 support
configs: omap4: remove unused boot target devices
clk: ti: Remove AM33xx dependency
arm: ti: omap: Extract common clock definitions
arm: omap: Move PRM I2C channel frequency to vc.c
Merge patch series "armv8: mmu: fix region unmapping and optimise
set_one_region()"
armv8: mmu: fix and optimise explicitly unmapping regions
armv8: mmu: commonize the set_one_region() loop
armv8: mmu: teach the pagetable dumper to show explicit FAULT maps
armv8: mmu: add a function to help debug TLB lookups
Merge patch series "bootm: bound noload kernel decompression to the allocated
buffer"
test/py: test kernel_noload decompression buffer overflow
bootm: increase kernel_noload decompression headroom from 4x to 8x
bootm: fix overflow of the noload kernel decompression buffer
Merge patch series "arm: omap: Add back omap4 support"
board: variscite: add support for the omap4_var_som
arm: ti: Introduce back omap4 support
configs: omap4: remove unused boot target devices
clk: ti: Remove AM33xx dependency
arm: ti: omap: Extract common clock definitions
arm: omap: Move PRM I2C channel frequency to vc.c
Merge patch series "various memory related fixups"
memory: reserve from start_addr_sp to initial_relocaddr
test: boot: add a fdt reserved region check
test_ut: add a ut_ubman fixture to clean up tests
boot: image-fdt: free old dtb reservations
Merge branch 'assorted-fit-validation-fixes' into next
fdt: Check return value of fdt_get_name() calls
image-fit: Validate external data offset and size
image-fit: Limit recursion depth in fdt_check_no_at()
fdt_region: Check return value of fdt_get_property_by_offset() calls
image-fit-sig: Validate hashed-strings region size
Merge patch series "arm: am335x: Switch to upstream devicetree"
arm: dts: Move remaining am335x-bone* to OF_UPSTREAM
arm: mach-omap2: Use dt_dir for devicetree paths
Makefile: Move dt_dir definition
dm: core: Remove dependency on CLK
arm: dts: am335x: Remove unused uboot devicetrees
configs: am335x_evm_defconfig: Switch to upstream devicetree
dm: core: Split SIMPLE_PM_BUS into phases
am33xx: Support upstream devicetree USB device
am33xx: Fix comment about config symbols
arm: dts: am335x-boneblack-u-boot: Add lcdc to all boot phases
arm: dts: am335x-*-u-boot: Add chosen tick-timer
am33xx: Avoid hard failure on USB probe issue
configs: am335x_evm: Unify evm board defconfigs
configs: am335x_evm: Enable SPL_OPTIMIZE_INLINING
include: configs: am335x_evm: Enable vidconsole
configs: am335x_evm_defconfig: Enable panel
arm: dts: am335x-evm: Add backlight to the panel
Merge patch series "fdt_support: validate property lengths in chosen and dma-
range fixups"
fdt_support: validate dma-ranges length in fdt_get_dma_range
fdt_support: bound serialN alias length before copying to stack
Merge patch series "tools: mkimage: fix get_basename crash on paths with dotted
directories"
test/py: cover get_basename crash on paths with dotted directories
tools: mkimage: fix get_basename crash on paths with dotted directories
bootm: bound-check OS index in bootm_os_get_boot_func()
drivers: gpio: Fix dev_read_addr error check
board: ti: am62ax: tifs-rm-cfg/rm-cfg: Update DMA resource sharing for CPSW
arm: dts: add/fix I2C controllers for sc5xx
dm: core: use DT region size when mapping device addresses
Revert "clk: enhance clk-gpio to also handle gated-fixed-clock"
Merge patch series "allow control DTB to double as "FIT image""
test: hook up test of allowing control DTB to act as FIT image
doc: develop: add section on embedding scripts inside control DTB
image-fit.c: introduce CONTROL_DTB_AS_FIT config knob
Merge tag 'mediatek-for-next-2026-06-10' of
https://source.denx.de/u-boot/custodians/u-boot-mediatek into next
Merge patch series "This series introduces initial U-Boot support for mach-
axiado AX3005 SCM3005 board, a quad-core ARM Cortex-A53 (ARMv8/ARM64) platform."
MAINTAINERS: Replace ASpeed with N:
grm: axiado: Add AX3005 based SCM3005 board support
arm64: dts: axiado: Add AX3005 SCM3005 device tree
clk: enhance clk-gpio to also handle gated-fixed-clock
serial: lpuart: Fix RX FIFO Enable bitmask
treewide: prefer __func__ over __FUNCTION__ and __PRETTY_FUNCTION__
bootmenu: fix incorrect menu quitting logic
configs/mt8365: enable bootstd, FIT and DT overlays
configs/mt8195: enable bootstd, FIT and DT overlays
configs/mt8188: enable bootstd, FIT and DT overlays
pinctrl: mediatek: use scnprintf() instead of snprintf()
configs: mt8189: Enable ethernet support
arm: dts: mt8189: Add ethernet support for Genio 520/720 boards
net: dwc_eth_qos: Add mediatek support
net: phy: Add airoha AN8801 ethernet phy driver
net: phy: air_phy_lib: Factorize BuckPBus register
net: Fix alphabetical ordering in drivers/net/Kconfig
net: Fix alphabetical ordering in drivers/net/Makefile
MAINTAINERS: add maintainer entry for air_en8811 driver
MAINTAINERS: remove trailing colons from section titles
Merge tag 'u-boot-marvell-next-20260610' of
https://source.denx.de/u-boot/custodians/u-boot-marvell into next
Merge tag 'fsl-qoriq-next-2026-06-09' of
https://source.denx.de/u-boot/custodians/u-boot-fsl-qoriq into next
timer: orion: Use dev_remap_addr_index()
arm: dts: armada-8040-nbx: add U-Boot dtsi for conditional OP-TEE
board: freebox: nbx10g: add device serial and MAC address initialization
board: freebox: nbx10g: add emmcboot for dual-bank eMMC boot
board: freebox: add Nodebox 10G board support
arm: mach-mvebu: armada8k: cpuinfo and SAR
pinctrl: armada-38x: Staticize and constify driver ops
arm: mvebu: Drop unnecessary BOARD_EARLY_INIT_F usage
serial: serial_octeon_bootcmd.c: use correct Kconfig symbol
board: Synology: common: Fix typo in Makefile
board: Synology: legacy.c: Include asm/io.h
arm: mvebu: Add Allied Telesis x220
arm: mvebu: db-xc3-24g4xg: Remove marvell, nand-keep-config
mtd: nand: pxa3xx: Pass valid dev to dev_err()
net: mvpp2: fix NULL pointer dereference in mvpp2_phy_connect
arm: kirkwood: Remove unnecessary watchdog GPIO for ZyXEL NSA325 board
Merge tag 'mmc-next-2026-06-10' of
https://source.denx.de/u-boot/custodians/u-boot-mmc into next
Merge assorted patches to use device API to replace devfdt_ helpers
ata: dwc_ahci: Use dev_read_addr_index()
ata: mtk_ahci: Use dev_remap_addr_index() and ofnode API
rng: rproc_rng200: Use dev_remap_addr()
misc: k3_avs: Use dev_read_addr_index()
thermal: ti-bandgap: Use dev_read_addr_index()
reset: ast: Use dev_read_addr_ptr()
ram: aspeed: Use dev_read_addr_x() API
crypto: tegra: Use dev_read_addr_x()
crypto: aspeed: Use dev_read_addr_x()
remoteproc: ipu: Use dev_read_addr_x()
remoteproc: pru: Use dev_read_addr_size_index()
gpio: aspeed: Use dev_read_addr_ptr()
gpio: nx: Use dev_remap_addr()
pinctrl: nexell: Use dev_read_addr()
pinctrl: at91: Use dev_read_addr_index()
clk: sophgo: Use dev_read_addr_ptr()
clk: hsdk-cgu: Use dev_read_addr_index_ptr()
clk: aspeed: Use dev_read_addr_ptr()
clk: altera: Use dev_read_addr_ptr()
clk: at91: Use dev_read_addr_ptr()
Merge tag 'u-boot-watchdog-next-20260609' of
https://source.denx.de/u-boot/custodians/u-boot-watchdog into next
nxp: imx[95,94,952]_evk: Implement board_fix_fdt
iMX9: scmi: Disable fused modules for iMX95/94/952
imx9: scmi: Print CPU part number name
imx9: scmi: Fix temperature range for Extended industrial parts
thermal: imx_tmu: extend with QorIQ/Layerscape TMU
thermal: jc42: add JEDEC JC-42.4/TSE2004av SPD
power: regulator: scmi: convert ofnode API to dev_read API
power: regulator: qcom-rpmh: convert ofnode API to dev_read API
power: regulator: anatop: convert ofnode API to dev_read API
power: pmic: qcom: convert ofnode API to dev_read API
power: pmic: pca9450: convert ofnode API to dev_read API
power: domain: imx8m: convert ofnode API to dev_read API
power: domain: meson-gx-pwrc-vpu: use dev_read_phandle_with_args for hhi-sysctrl
power: domain: meson-ee-pwrc: use dev_read_phandle_with_args for ao-sysctrl
power: regulator: tps6287x: Use dev_read_addr_index()
power: regulator: Fix power on/off delay issue
cmd: mmc: fix help and parameter verification with MMC_SPEED_MODE_SET not set
mmc: octeontx_hsmmc: convert ofnode API to dev_read API
mmc: msm_sdhci: convert ofnode API to dev_read API
mmc: fsl_esdhc_imx: convert ofnode API to dev_read API
mmc: cv1800b_sdhci: Use dev_read_addr_ptr()
mmc: xenon_sdhci: Use livetree API
arm: dts: fsl-lx2162a-qds: drop &dspi{0,1,2} block
arm: dts: fsl-lx2160a: wdt0 for watchdog node
drivers: watchdog: Fix dev_read_addr error check
watchdog: mpc8xxx_wdt: Use dev_remap_addr()
watchdog: rti: Use dev_read_addr_ptr()
watchdog: orion_wdt: use dev_read_addr_size_index()
doc: wdt: fix typo for expire
watchdog: octeontx_wdt: fix DT matches to Marvell compatibles
watchdog: sbsa_gwdt: clamp WOR value to hw max
watchdog: designware: Fix probe when clk_enable return ENOSYS
watchdog: Correct dependencies for WDT_MAX6370
watchdog: orion_wdt: Add support for armada-xp
Merge tag 'v2026.07-rc4' into next
Merge tag 'xilinx-for-v2026.10-rc1-v2' of
https://source.denx.de/u-boot/custodians/u-boot-microblaze into next
reset: zynqmp: Implement rst_reset using PM_RESET_ACTION_PULSE
spi: cadence: Use reset_reset_bulk() for proper reset cycling
reset: sandbox: Cover reset_reset() fallback with second sandbox provider
reset: Add sandbox tests for reset_reset() and reset_reset_bulk()
reset: Add reset_reset() and reset_reset_bulk() API
configs: amd: Enable capsule update and DFU support
configs: xilinx: Enable DFU MTD support
board: xilinx: Add FWU boot index support
board: amd: Add capsule and FWU support
board: xilinx: Add capsule and FWU support
firmware: zynqmp: Add PMC PGGS register read API
arm64: xilinx: Add PMC PGGS3 and PGGS4 registers
xilinx: mbv: Allow compiler to optimize inlining in SPL
xilinx: mbv: Disable AVAILABLE_HARTS
board: zynqmp: Remove hardcoded USB ethernet initialization
configs: zynqmp: Enable USB gadget download support
Merge tag 'u-boot-imx-next-20260605' of
https://gitlab.denx.de/u-boot/custodians/u-boot-imx into next
Merge patch series "rtc: pcf85036: improve spec coherence and extend features"
drivers: Kconfig: rtc_pcf85063: note unsupported chip features
rtc: pcf85063: add power loss detection during probe
rtc: pcf85063: support loading quartz-load capacitance from device tree
rtc: pcf85063: keep the divider chain in reset during set_time
rtc: pcf85063: add missing register definitions
rtc: pcf85063: add support for NXP PCF85063 family
rtc: pcf85063: adjust date format to adhere to the rtc_time spec
cmd: date: validate date using rtc_month_days()
cmd_date: make mk_date() static
cpu: imx8_cpu: fix the mpidr check
cpu: imx8_cpu: Add iMX8MP UltraLite Part cpu type
boards: tqma7: call tq-sysinfo setup
arm: dts: tqma7: integrate tq,eeprom sysinfo driver
arm: dts: tqma7: add eeprom nvmem-layout
board: tq: common: add sysinfo setup helper
sysinfo: tq_eeprom: new driver
sysinfo: add sysinfo_get_and_detect() helper
sysinfo: uclass: use sysinfo_priv size for per_device_auto
arm: imx9: Fix broken formatting
clk: imx: don't build i.MX/RTxxxx code for all users of CCF
imx: kontron-sl-mx6ul: Enable I2C support
arch: imx9: Fix blk_dwrite/blk_derase error checking
arm: imx8mp: Add new variant parts support
board: tqma7: update fastboot env
arm: gic-v3-its: Fix LPI pending table size calculation
configs: add defconfigs for TQMa6UL[L]x[L] SOM on MBa6ULx baseboard
board: tq: add TQMa6UL[L]x[L] SOM and MBa6ULx baseboard
ARM: dts: tqma6ul: add boot phase properties
ARM: dts: add TQMa6UL[L]x[L] u-boot device tree fragments
imx: Remove hardcoded watchdog base address macros
watchdog: ulp_wdog: Use driver model for reset_cpu()
imx: soc: Get watchdog base addresses from device tree
arm: dts: imx: Update watchdog nodes for dynamic base address lookup
imx93_var_som: Switch to OF_UPSTREAM
imx93-frdm: Switch to OF_UPSTREAM
imx91: Switch to OF_UPSTREAM
imx7ulp: Switch to OF_UPSTREAM
imx8mp: msc-sm2s: Switch to OF_UPSTREAM
imx8mm: pgh: Switch to OF_UPSTREAM
imx8mp: icore-mx8mp-edimm2.2: Switch to OF_UPSTREAM
imx8mm: icore-mx8mm: Switch to OF_UPSTREAM
Merge patch series "sc5xx Environment Cleanup and Fixes"
Merge patch series "Cleanup some linker list usage issues"
event: Remove obsolete comment and __used attributes
linker_lists: Do not set "unused" attribute
sandbox: Drop special link order treatment of start.o and sdl.o
mach-sc5xx: Remove unused image offset Kconfig options
arm: sc5xx: Add fdt_addr_r, kernel_addr_r, and ramdisk_addr_r
arm: sc5xx: add missing boot env selectors
arm: sc5xx: Remove SC5XX_LOADADDR
configs: sc5xx: Set default bootcmd to SPI boot
mach-sc5xx: Update SPI bootargs for ubifs
mach-sc5xx: Update image load address
mach-sc5xx: sc573: Rename EZKIT board to EZLITE
dts: sc594: Fix gige-reset line on EZKIT
mach-sc5xx: Remove preliminary binman support
mach-sc5xx: Add USB boot command
mach-sc5xx: Switch from tftp to wget
mach-sc5xx: Update boot commands
mach-sc59x: Add CONFIG_SC5XX_LOADADDR
mach-sc5xx: Remove update commands from default environment
configs: sc5xx: Do not store environment in SPI flash
Merge tag 'net-next-20260603' of
https://source.denx.de/u-boot/custodians/u-boot-net into next
Merge branch 'next' of git://source.denx.de/u-boot-usb into next
net: mvpp2: convert FDT access to ofnode API
net: mvpp2: Use dev_read_addr_index_ptr()
net: dc2114x: Use dev_remap_addr()
net: calxedaxgmac: Use dev_read_addr()
net: qe: dm_qe_uec: Use dev_read_addr()
net: ethoc: Use dev_read_addr_index()
phy: cadence: Use device API
phy: marvell: comphy: Use dev_read_addr_index_ptr()
phy: ti-pipe3: Use device API for DT parsing
phy: Kconfig: use bool instead of tristate
net: SYS_RX_ETH_BUFFER defaults to 8 when CONFIG_FSL_ENETC=y
net: guard SYS_RX_ETH_BUFFER with NET
net: tsec: make tsec_private a private structure
arm: ls102xa: use platform data to check Ethernet interface is not SGMII
ls1028a: only include drivers/net/fsl_enetc.h when driver is compiled
usb: dwc3: generic: Staticize and constify driver ops
usb: dwc3: sti: Staticize and constify driver ops
usb: dwc3: am62: Staticize and constify driver ops
Merge patch series "Enable splashscreen functionality on AM62X"
configs: am62x_evm_a53_defconfig: Enable A53 splashscreen at u-boot SPL
configs: am62x_evm_a53_ethboot_defconfig: Disable splashscreen
configs: am62x: Add splashscreen prune config fragment
configs: am62x: Add splashscreen config fragment
timer: sp804: Fix dev_read_addr error check
Merge patch series "Clean up bloblist initialization"
bloblist: Rework bloblist_init and bloblist_maybe_init
bloblist: Demote not finding a bloblist to a debug
bloblist / handoff: Make this depend on BLOBLIST_FIXED
Merge patch series "video: bridge: anx6345: Staticize and constify driver ops"
video console: add 6x8 console font from linux
video: kconfig: replace tristate with bool for LCD panel drivers
video: Kconfig: fix indentation of help text
video: simplefb: Parse memory region from memory-region property
video: simplefb: Map framebuffer region on probe on ARM64
video: Correct dependencies for VIDEO_TIDSS
video: Correct dependencies for VIDEO_LCD_RAYDIUM_RM68200
video: Correct dependencies of LOGICORE_DP_TX
common: splash_source: fix cryptic error messages
video: tegra: Staticize and constify driver ops
video: tda19988: Staticize and constify driver ops
video: stm32: Staticize and constify driver ops
video: imx: ldb: Staticize and constify driver ops
video: dw_mipi_dsi: Staticize and constify driver ops
video: console: truetype: Staticize and constify driver ops
video: console: rotate: Staticize and constify driver ops
video: console: normal: Staticize and constify driver ops
video: bridge: ptn3460: Staticize and constify driver ops
video: bridge: ps862x: Staticize and constify driver ops
video: bridge: anx6345: Staticize and constify driver ops
boot: cedit: Check ofnode_read_prop return value
Merge patch series "board: phytec: Update rm-cfgs, env and docs"
doc: board: phytec: Document DDR size override Kconfigs
doc: board: phytec: k3: Document boot flow and watchdog
doc: board: phytec: Fix typos and copy-paste errors in K3 docs
include: env: phytec: Drop legacy RAUC boot logic
board: phytec: phycore_am68x: Update rm-cfg
arm: dts: k3-am625-phycore-som-binman: Enable tifs-rm-cfg
board: phytec: phycore_am62x: Add tifs-rm-cfg
Merge patch series "board: toradex: k3: Sync rm-cfg with TIFS v12.00.00
firmware"
arm: dts: k3: k3-am62*5-verdin-binman: Enable tifs-rm-cfg in binman
board: toradex: aquila-am69: update rm-cfg.yaml and tifs-rm-cfg.yaml
board: toradex: verdin-am62: add missing tifs-rm-cfg.yaml
board: toradex: verdin-am62p: update tifs-rm-cfg
board: ti: j722s: add processor ACL entry for wkup_r5
Merge patch series "Update envs to use Kconfig values"
env: ti: k3_dfu: use Kconfig options for addresses
env: ti: k3_dfu: load only the next stage binary
am33xx: don't assume we have a UCLASS_MISC device present
common/command.c: Avoid NULL pointer use in cmd_auto_complete
fs: fat: fix seconds in timestamp
Merge patch series "fit: dm-verity support"
image: fit: add dm-verity property name constants
configs: sandbox: enable CONFIG_FIT_VERITY
test: py: add mkimage dm-verity round-trip test
test: boot: add runtime unit test for fit_verity_build_cmdline()
doc: fit: add dm-verity boot parameter documentation
tools: mkimage: add dm-verity Merkle-tree generation
include: hexdump: make hex2bin() usable from host tools
boot: fit: support generating DM verity cmdline parameters
Merge patch series "env: migrate static flags list to Kconfig"
doc: remove configuration settings from README
env: migrate static flags list to Kconfig
Merge patch series "boot/fit: use fdt_for_each_subnode() in image-fit.c"
boot/fit: use fdt_for_each_subnode() in image-fit.c
test: fit: regression test for default-config print with reversed node order
boot/fit: read default-config property from the configurations node
cros_ec: Sync ec_commands.h from upstream Chrome OS EC
led: Fix toggling LED on initial SW blink
gpio: uclass: show DT gpio-line-names
test: fs: Use shared generate_file from utils
Merge tag 'v2026.07-rc3' into next
Merge patch series "Add virtio-mmio support to m68k virt machine"
board: qemu: m68k: Create virtio mmio instances
virtio: blk: Fix converting the vendor id to a string
virtio: cmd: Depend on VIRTIO_BLK
virtio: mmio: Allow instantiation via platform data
m68k: Fix writew(), writel(), readw(), readl() endianness for classic m68k
timer: goldfish: Use __raw_readl()
rtc: goldfish: Use __raw_readl() and __raw_writel()
sysreset: qemu virt: Use __raw_writel()
sysreset: qemu virt: Use map_sysmem()
virtio: Drop empty bootdev_ops structure
scsi: Drop empty bootdev_ops structure
ata: sata: Drop empty bootdev_ops structure
block: ide: Drop empty bootdev_ops structure
bootdev: Fix the case where the driver ops field is null.
arm: Fix typo in linker script
Merge branch 'staticize-constify-drivers' into next
spi: apple: Staticize and constify driver ops
scsi: sandbox: Staticize and constify driver ops
rtc: emul: Staticize and constify driver ops
reset: tegra186: Staticize and constify driver ops
reset: tegra-car: Staticize and constify driver ops
reset: sti: Staticize and constify driver ops
reset: sandbox: Staticize and constify driver ops
reset: sunxi: Staticize and constify driver ops
reset: raspberrypi: Staticize and constify driver ops
reset: npcm: Staticize and constify driver ops
reset: meson: Staticize and constify driver ops
reset: mediatek: Staticize and constify driver ops
reset: dra7: Staticize and constify driver ops
reset: bcm6345: Staticize and constify driver ops
reset: at91: Staticize and constify driver ops
reset: ast2600: Staticize and constify driver ops
reset: ast2500: Staticize and constify driver ops
cpu: armv8: Staticize driver ops
mtd: spi: bootstd: Staticize and constify driver ops
misc: x86: Staticize and constify driver ops
misc: i2c: eeprom-emul: Staticize and constify driver ops
misc: cros_ec: Staticize and constify driver ops
mailbox: stm32-ipcc: Staticize and constify driver ops
mailbox: sandbox: Staticize and constify driver ops
mailbox: renesas: Staticize and constify driver ops
mailbox: k3-sec-proxy: Staticize and constify driver ops
mailbox: imx: Staticize and constify driver ops
mailbox: apple: Staticize and constify driver ops
clk: sunxi: Staticize and constify driver ops
clk: sunxi: Drop the extern
clk: ast2600: Staticize and constify driver ops
clk: ast2500: Staticize and constify driver ops
block: rockchip: Staticize and constify driver ops
ata: sata_mv: Staticize and constify driver ops
ata: fsl_sata: Staticize and constify driver ops
Merge tag 'qcom-next-18May2026' of
https://source.denx.de/u-boot/custodians/u-boot-snapdragon into next
board/qualcomm: qcom-phone: Add poweroff command
clk/qcom: qcm2290: Fix vote_bit of gpll6 clock
phy: qcom: Add SM6115 and SM6125 to QMP UFS PHY driver
pci: pcie_dw_qcom: Staticize and constify driver ops
gpio: qcom: Staticize and constify driver ops
gpio: qcom_pmic: Staticize and constify driver ops
drivers: pinctrl: Add Qualcomm SM6125 TLMM driver
qcom_defconfig: Enable SM6125 clock driver
clk/qcom: Add SM6125 clock driver
cmd: ufetch: only show comma separator if there was a previous feature
cmd: ufetch: show net feature when NET_LWIP is selected
serial: msm-geni: configure RX watermark register
dts: lemans-evk-u-boot: add override dtsi
ufs: qcom: Remove redundant POST_CHANGE clock setup call
drivers: ufs: qcom: Initialize and enable clocks before hardware access
clk: qcom: sc7280: Add UFS clock support
clk: qcom: qcs615: Add UFS clock support
clk: qcom: sa8775p: Add UFS clock support
clk: qcom: clk-stub: Add compatibles for QCS615/SA8775P
clk: stub: Sort compatible strings alphabetically
Merge tag 'u-boot-imx-next-20260515' of
https://gitlab.denx.de/u-boot/custodians/u-boot-imx into next
net: fsl_enetc: Add support for i.MX952
net: fsl_enetc: fix the duplex setting on the iMX platform
arm: imx9: Update i.MX91 part number detection
imx: priblob: Fix build break
power: regulator: pfuze100: Fix unchecked pmic_reg_read, return value
arm: mx6: module_fuse: update node path for Linux 6.13
arm: mx6: cm-fx6: Staticize and constify driver ops
board: toradex: verdin-imx95: remove gpio1 reg
board: toradex: smarc-imx95: remove gpio1 reg
doc: board: nxp: Add Quickboot documentation
board: nxp: imx9{4, 5, 52}_evk: Add qb save option in SPL
arm: mach-imx: Add command to expose QB functionality
imx9: Add support for saving DDR training data to NVM
imx: ahab: Use authenticated header for images loading
imx9: clock: Fix missing break in get_clk_src_rate
imx8mp_evk: Fix the ND mode VDD_SOC voltage
i2c: imx_lpi2c: Fix MSR status check issue in STOP
net: phy: nxp-c45-tja11xx: Fix incorrect usage of devm_kzalloc
imx9: scmi: Support iMX95/94/952 secondary boot
imx9: scmi: soc: Add support for detecting primary/secondary bmode on MX95
imx: Add SPI NOR A/B switching support
imx8mm/n: Drop unused dtsi
imx8mq: Drop arch/arm/dts/imx8mq.dtsi
imx8mq: kontron-pitx-imx8m: Switch OF_UPSTREAM
imx8mq: librem5: Switch to OF_UPSTREAM
imx8mq: pico: Switch OF_UPSTREAM
imx8mq: phanbell: Switch OF_UPSTREAM
imx8mq: reform2: Switch to OF_UPSTREAM
nitrogen6x: Fix compile error if VIDEO_IPUV3 is disabled
MAINTAINERS: Use N: for NXP entry
Merge tag 'mmc-next-2026-05-15' of
https://source.denx.de/u-boot/custodians/u-boot-mmc into next
power: domain: zynqmp: Staticize and constify driver ops
power: domain: tegra186: Staticize and constify driver ops
power: domain: scmi: Staticize and constify driver ops
power: domain: sandbox: Staticize and constify driver ops
power: domain: mtk: Staticize and constify driver ops
power: domain: meson-secure-pwrc: Staticize and constify driver ops
power: domain: meson-gx-pwrc: Staticize and constify driver ops
power: domain: meson-ee-pwrc: Staticize and constify driver ops
power: domain: imx8mp-mediamix: Staticize and constify driver ops
power: domain: imx8m: Staticize and constify driver ops
power: domain: imx8: Staticize and constify driver ops
power: domain: imx8-legacy: Staticize and constify driver ops
power: domain: bcm6328: Staticize and constify driver ops
power: domain: apple: Staticize and constify driver ops
mmc: cv1800b_sdhci: honor 'no-1-8-v' DT property
power: pmic: emul: Staticize and constify driver ops
mmc: bootstd: Staticize and constify driver ops
mmc: sdhci: Start status timeout after command issue
gpio: Correct dependencies for MCP230xx
board: ti: am335x: Conditional MDIO PAD configuration instead of static for
AM335_ICE
rtc: ds1307: Handle oscillator stop flag set on ds1339 chip
Merge patch series "test: Quote variables in 'test -n' expressions across
boards"
aristainetos2: Quote rescue_reason in rescueboot test
mccmon6: Quote recovery_status in bootcmd test
beaglev_fire: Quote no_of_overlays in design test
siemens: Quote A/B flags in env tests
ti: Quote board_init in ti_common.env
Merge patch series "add memdup_nul(), use it and memdup() in a few places"
test: lib: add test of memdup_nul()
drivers/core: use memdup() instead of malloc()+memcpy()
common/cli.c: use memdup_nul() in run_command_list()
lib/hashtable.c: use memdup_nul() in himport_r
lib/string.c: implement strdup() and strndup() in terms of memdup_nul()
lib/string.c: introduce memdup_nul() helper
lib/string.c: drop pointless __HAVE_ARCH_STRDUP
stdio: drop stdio_clone
string: fix prototype of memdup()

--===============1379261659734509085==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-u-boot-tools-u-boot-upgrade-2026.07-2026.10.patch"

RnJvbSA5ODg3N2Y0OTY1ZmFmYTY4YzI1Mzc0NWUzY2Y3NTRkOThhNDI2ZTY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgNiBPY3QgMjAyNiAwNToxNjo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHUt
Ym9vdC10b29scyx1LWJvb3Q6IHVwZ3JhZGUgMjAyNi4wNyAtPiAyMDI2LjEwCgpQcmVwYXJlIHYy
MDI2LjEwCk1BSU5UQUlORVJTOiBGaXggTHVrYXN6IGVtYWlsCkdpdGxhYiBDSTogVGVtcG9yYXJp
bHkgbGltaXQgdGhyZWFkIGNvdW50IG9uIHdvcmxkIGJ1aWxkcwpib2FyZDogYmVhY29uOiBSZW1v
dmUgaS5NWDhNUCBCZWFjb24gRW1iZWRkZWRXb3JrcyBEZXZraXQgc3VwcG9ydApib2FyZDogYmVh
Y29uOiBSZW1vdmUgaS5NWDhNTiBCZWFjb24gRW1iZWRkZWRXb3JrcyBEZXZraXQgc3VwcG9ydApi
b2FyZDogYmVhY29uOiBSZW1vdmUgaS5NWDhNTSBCZWFjb24gRW1iZWRkZWRXb3JrcyBEZXZraXQg
c3VwcG9ydApib2FyZDogYmVhY29uOiBSZW1vdmUgQmVhY29uIEVtYmVkZGVkV29ya3MgUlovRzIg
RGV2IEtpdCBzdXBwb3J0CmJvYXJkOiBkYXZpbmNpOiBSZW1vdmUgREE4NTAgRVZNIHN1cHBvcnQK
Ym9hcmQ6IGxvZ2ljcGQ6IFJlbW92ZSBBTTM1MTcgRVZNIHN1cHBvcnQKYm9hcmQ6IGxvZ2ljcGQ6
IFJlbW92ZSBpLk1YNiBTT00gc3VwcG9ydApib2FyZDogbG9naWNwZDogUmVtb3ZlIE9NQVAzIFNP
TSBzdXBwb3J0Ck1lcmdlIHRhZyAnZWZpLTIwMjYtMTAtcmM2JyBvZiBodHRwczovL2dpdC51LWJv
b3QtCnByb2plY3Qub3JnL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1lZmkKbG1iOiBBZGQgU3Rh
ckZpdmUgSkgtNzExMCBTb0MgYXMgcmVxdWlyaW5nIERNQSBiZWxvdyA0R2lCCk1lcmdlIGJyYW5j
aCAnbWFpbicgb2YgaHR0cHM6Ly9naXQudS1ib290LXByb2plY3Qub3JnL3UtYm9vdC9jdXN0b2Rp
YW5zL3UtYm9vdC0Kc2gKYm9vdDogbWVudGlvbiBzYm94IGluIGVmaSBsb2FkZXIgYm9vdCBtZXRo
b2QgZG9jCmVmaV9sb2FkZXI6IGZpeCBlZmlfaHR0cF9pbnN0YW5jZSBmcmVlIG9uIGVycm9yCk1l
cmdlIHBhdGNoIHNlcmllcyAiZnNsLCBwb3dlcnBjOiBGaXggU1BEIHJlYWQgYW5kIGFwcGVuZGVk
IERUQiBhbGlnbm1lbnQiCmJvYXJkOiBjc3NpOiBNb3ZlIGFsaWdubWVudCBwYWRkaW5nIGludG8g
X191X2Jvb3RfbGlzdCBzZWN0aW9uCnBvd2VycGM6IG1wYzg1eHg6IE1vdmUgYWxpZ25tZW50IHBh
ZGRpbmcgaW50byBfX3VfYm9vdF9saXN0IHNlY3Rpb24KZGRyOiBmc2w6IEZpeCBTUEQgcmVhZCB3
aGVuIGxlZ2FjeSBJMkMgaXMgdXNlZApNZXJnZSB0YWcgJ3UtYm9vdC1kZnUtMjAyNjA5MjknIG9m
IGh0dHBzOi8vZ2l0LnUtYm9vdC0KcHJvamVjdC5vcmcvdS1ib290L2N1c3RvZGlhbnMvdS1ib290
LWRmdQp1c2I6IGR3YzMtZ2VuZXJpYzogRml4IHJlZiBjbG9jayBlbmFibGUgZXJyb3IgY2hlY2sK
cG93ZXI6IGRvbWFpbjogcmVuZXNhcy1yOGE3ODAwMDogQWRkIFNESyBTQ1AgNC4zOSBtYXAKcG93
ZXI6IGRvbWFpbjogcmVuZXNhcy1yOGE3ODAwMDogQWRkIFNESyBTQ1AgNC4zNyBtYXAKY2xrOiBy
ZW5lc2FzOiBBZGQgU0RLIFNDUCA0LjM5IG1hcCB0byBSZW5lc2FzIFItQ2FyIFI4QTc4MDAwIFg1
SCBDUEcgY2xvY2sKZHJpdmVyCmNsazogcmVuZXNhczogQWRkIFNESyBTQ1AgNC4zNyBtYXAgdG8g
UmVuZXNhcyBSLUNhciBSOEE3ODAwMCBYNUggQ1BHIGNsb2NrCmRyaXZlcgpjb25maWdzOiBSZXN5
bmMgd2l0aCBzYXZlZGVmY29uZmlnCk1lcmdlIGJyYW5jaCAnbWFpbicgb2YgaHR0cHM6Ly9naXQu
dS1ib290LXByb2plY3Qub3JnL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC0KdXNiCnVzYjogZHdj
My1nZW5lcmljOiBmaXggcmVmIGNsb2NrIGxvb2t1cCBpbmRleGluZyB3cm9uZyBjbGtfYnVsayBh
cnJheQp1c2I6IGdhZGdldDogZl9tYXNzX3N0b3JhZ2U6IFN5bmNocm9ub3VzbHkgdGVhciBpbnRl
cmZhY2UgZG93bgp1c2I6IGdhZGdldDogcm9ja3VzYjogdGVybWluYXRlIGZ1bGwtc3BlZWQgZGVz
Y3JpcHRvcnMKUHJlcGFyZSB2MjAyNi4xMC1yYzUKTWVyZ2UgdGFnICd1LWJvb3Qtc3RtMzItMjAy
NjA5MjEnIG9mIGh0dHBzOi8vZ2l0LnUtYm9vdC0KcHJvamVjdC5vcmcvdS1ib290L2N1c3RvZGlh
bnMvdS1ib290LXN0bQpmd19lbnY6IGRvIG5vdCBjcmVhdGUgbG9ja2ZpbGUgd2l0aCByZWFkIGFj
Y2VzcyBmb3Igb3RoZXJzCk1BSU5UQUlORVJTOiBVcGRhdGUgc29tZSBTb0NGUEdBIHJlbGF0ZWQg
YWRkcmVzc2VzCkFSTTogZHRzOiBBZGQgYm9vdHBoLWFsbCBpbiBsdGRjIG5vZGUgZm9yIHNxdG0z
Mm1wMjM1Zi1kay11LWJvb3QKQVJNOiBkdHM6IEFkZCBib290cGgtYWxsIGluIGx0ZGMgbm9kZSBm
b3Igc3RtMzJtcDI1N2YtZGstdS1ib290Ck1lcmdlIHRhZyAndS1ib290LXJvY2tjaGlwLTIwMjYu
MTAtMjAyNjA5MTgnIG9mIGh0dHBzOi8vZ2l0LnUtYm9vdC0KcHJvamVjdC5vcmcvdS1ib290L2N1
c3RvZGlhbnMvdS1ib290LXJvY2tjaGlwClJldmVydCAiQ2xlYW4gdXAgZW1haWxzIGZyb20gbm9u
LWV4aXN0aW5nIGRvbWFpbnMiCkNsZWFuIHVwIGVtYWlscyBmcm9tIG5vbi1leGlzdGluZyBkb21h
aW5zCk1lcmdlIGJyYW5jaCAnbWFpbicgb2YgaHR0cHM6Ly9naXQudS1ib290LXByb2plY3Qub3Jn
L3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC0Kc2gKY2xrOiB2ZXJzYWNsb2NrOiBGaXggaW5jb3Jy
ZWN0IGVycm9yIGNoZWNrIGluIHZlcnNhY2xvY2tfcHJvYmUoKQphcm02NDogcmVuZXNhczogRW5h
YmxlIEZGQSBvbiBSZW5lc2FzIFItQ2FyIFg1SCBSOEE3ODAwMAphcm02NDogcmVuZXNhczogRHJv
cCBlbXB0eSBib2FyZF9lYXJseV9pbml0X2YoKSBmcm9tIFJlbmVzYXMgUi1DYXIgR2VuNSBjb21t
b24KY29kZQphcm02NDogcmVuZXNhczogRHJvcCBDTlRQIGZyb20gUmVuZXNhcyBSLUNhciBHZW41
IGNvbW1vbiBjb2RlCmFybTogcmVuZXNhczogRHJvcCBTWVNfQVJDSF9USU1FUiBvbiBSLUNhciBS
OEE3ODAwMCBYNUggQ29ydGV4LU0zMyBSU0lQCk1lcmdlIHRhZyAndS1ib290LWRmdS0yMDI2MDkx
NCcgb2YgaHR0cHM6Ly9naXQudS1ib290LQpwcm9qZWN0Lm9yZy91LWJvb3QvY3VzdG9kaWFucy91
LWJvb3QtZGZ1Ck1lcmdlIHRhZyAnbmV0LTIwMjYwOTE1JyBvZiBodHRwczovL2dpdC51LWJvb3Qt
CnByb2plY3Qub3JnL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1uZXQKYm9hcmQ6IGFuYmVybmlj
OiBGaXggdGhlIFJHLURTIEtjb25maWcgdGFyZ2V0IGd1YXJkCmZhc3Rib290OiBmaXggdGhlIFJL
MzMyOCBidWZmZXItYWRkcmVzcyBkZWZhdWx0CnRlc3Q6IGRtOiBuZnM6IEFkZCByZWdyZXNzaW9u
IHRlc3RzIGZvciB0aGUgTkZTIHJlcGx5LWxlbmd0aCBjaGVja3MKbmV0OiBuZnM6IEJvdW5kIHRo
ZSBsZW5ndGggb2YgYW4gTkZTIHJlYWRsaW5rIHJlcGx5Cm5ldDogbmZzOiBCb3VuZCB0aGUgbGVu
Z3RoIG9mIGFuIE5GUyByZWFkIHJlcGx5CnUtYm9vdDogZml4IGVycm9yIGNoZWNrIGluIGV0aCBp
bml0Cm5ldDogYWlyb2hhOiBmaXggUENTIGNhbGlicmF0aW9uIHJldHJ5IGxpbWl0Cm5ldDogbmV0
NjogdmFsaWRhdGUgSVB2NiBwYXlsb2FkIGFuZCB0cmFuc3BvcnQgbGVuZ3RocyBvbiByZWNlaXZl
Cm5ldDogbHdpcDogYWxsb3cgREhDUCB0byBzdG9wIHdpdGhvdXQgcmVsZWFzaW5nIGl0cyBsZWFz
ZQpuZXQ6IGx3aXA6IGFkZCBhbiBIVFRQIGNsaWVudCBhYm9ydCBvcGVyYXRpb24KbmV0OiBsd2lw
OiBhbGxvdyBETlMgY2FsbGJhY2tzIHRvIGJlIGNhbmNlbGVkCm5ldDogbHdpcDogcmV0dXJuIEVS
Ul9BQlJUIGFmdGVyIGFib3J0aW5nIHdnZXQgcmVjZWl2ZQp0ZXN0OiBkbTogZXRoOiBhZGQgREhD
UHY2IG92ZXJzaXplZCBvcHRpb24gcmVncmVzc2lvbiB0ZXN0cwpuZXQ6IGRoY3A2OiBib3VuZCBy
ZWNlaXZlZCBEVUlEIG9wdGlvbiBsZW5ndGhzCk1BSU5UQUlORVJTOiB0ZWU6IHVwZGF0ZSBKZW5z
IFdpa2xhbmRlcidzIGVtYWlsIGFkZHJlc3MKZW52OiBVcGRhdGUgZGVzY3JpcHRpb24gb2Ygc2lu
Z2xlIHRvIHJlZHVuZGFudCBlbnZpcm9ubWVudCB1cGdyYWRlIHBhdGgKTWVyZ2UgdGFnICd1LWJv
b3QtcGNpLWZpeGVzLTIwMjYwOTExJyBvZiBodHRwczovL2dpdC51LWJvb3QtCnByb2plY3Qub3Jn
L3UtYm9vdC9jdXN0b2RpYW5zL25laWwuYXJtc3Ryb25nL3UtYm9vdC1wY2kKTWVyZ2UgdGFnICd1
LWJvb3QtbnZtZS1maXhlcy0yMDI2MDkxMScgb2YgaHR0cHM6Ly9naXQudS1ib290LQpwcm9qZWN0
Lm9yZy91LWJvb3QvY3VzdG9kaWFucy9uZWlsLmFybXN0cm9uZy91LWJvb3QtbnZtZQpkbTogcGNp
OiBmaXggdW5pbml0aWFsaXplZCBmZHRfcGNpX2FkZHIgZmFsbC10aHJvdWdoIGluIHBjaV9nZXRf
ZGV2Zm4KcGNpOiBJdGVyYXRlIG92ZXIgYnVzc2VzIHVzaW5nIHVjbGFzc19mb3JlYWNoX2Rldl9w
cm9iZQpudm1lOiBhcHBsZTogRHJvcCB0aGUgUFJQIG51bGwgY2hlY2sgY2hpY2tlbiBiaXQKbnZt
ZTogYXBwbGU6IEFkZCBXQVJOX09OX09OQ0UgZm9yIG5vbiBwYWdlLWFsaWduZWQgYWRtaW4gcXVl
dWUgYnVmZmVycwpudm1lOiBhcHBsZTogTmV2ZXIgc2V0IHRoZSBvcGNvZGUgaW4gdGhlIE5WTU1V
IFRDQgpudm1lOiBhcHBsZTogRG9uJ3Qgc2V0IGEgRE1BIGRpcmVjdGlvbiBmb3IgY29tbWFuZHMg
d2l0aG91dCBhIGRhdGEgdHJhbnNmZXIKYXZiOiBmaXggbWlzc2luZyBicmVhayBpbiBhdmJfc2V0
X3N0YXRlKCkgc3dpdGNoCmRmdTogbXRkOiBwcm9iZSBiZWZvcmUgZ2V0X210ZF9kZXZpY2Vfbm0o
KQpQcmVwYXJlIHYyMDI2LjEwLXJjNAphcm06IG12ZWJ1OiBhcm1hZGE4azogZG8gbm90IG9mZmVy
IHRoZSBBVEYvVEVFIHJlZ2lvbiBhcyBmcmVlIG1lbW9yeQpNZXJnZSB0YWcgJ2VmaS0yMDI2LTEw
LXJjNC0yJyBvZiBodHRwczovL2dpdC51LWJvb3QtCnByb2plY3Qub3JnL3UtYm9vdC9jdXN0b2Rp
YW5zL3UtYm9vdC1lZmkKTWVyZ2UgdGFnICdmc2wtcW9yaXEtZm9yLTIwMjYuMTAtcmM0JyBvZiBo
dHRwczovL2dpdC51LWJvb3QtCnByb2plY3Qub3JnL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1m
c2wtcW9yaXEKY29uZmlnczogbHMxMDR7Myw2fWFxZHNfdGZhOiBlbmFibGUgUENJZSBFdGhlcm5l
dApjb21tb246IGtjb25maWc6IHJhaXNlIFNZU19DQlNJWkUgZGVmYXVsdCB0byAxMDI0IGZvciBG
U0xfTFNDSDIvTFNDSDMKY29uZmlnczogbGF5ZXJzYwoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMg
aXQgZXhjZWVkcyA1MDAwIGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91
bmQgaW4gYW4gYXR0YWNobWVudCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLkFkZC1zdXBwb3J0
LWZvci1PcGVuU1NMLVByb3ZpZGVyLUFQSS5wYXRjaCB8IDM4ICsrKysrKy0tLS0tLS0KIC4uLi1y
ZW1vdmVkLVNXSUctUHl0aG9uLTItY29tcGF0aWJpbGl0eS5wYXRjaCB8IDU1IC0tLS0tLS0tLS0t
LS0tLS0tLS0KIC4uLmFwc3VsZS1EZXRlY3QtR251VExTLVBLQ1MtMTEtc3VwcG9ydC5wYXRjaCB8
IDEwICsrLS0KIG1ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC1jb21tb24uaW5jICAgICB8
ICAyICstCiAuLi5vbHNfMjAyNi4wNy5iYiA9PiB1LWJvb3QtdG9vbHNfMjAyNi4xMC5iYn0gfCAg
NCArLQogNSBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCA4MiBkZWxldGlvbnMoLSkK
IGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC9maWxlcy8wMDAxLXB5
bGliZmR0LVJlcGxhY2UtcmVtb3ZlZC1TV0lHLVB5dGhvbi0yLWNvbXBhdGliaWxpdHkucGF0Y2gK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC97dS1ib290LXRvb2xzXzIwMjYuMDcuYmIg
PT4gdS1ib290LXRvb2xzXzIwMjYuMTAuYmJ9ICgyMiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWJzcC91LWJvb3QvZmlsZXMvMDAwMS1BZGQtc3VwcG9ydC1mb3ItT3BlblNTTC1Qcm92aWRl
ci1BUEkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC9maWxlcy8wMDAxLUFkZC1zdXBw
b3J0LWZvci1PcGVuU1NMLVByb3ZpZGVyLUFQSS5wYXRjaAppbmRleCAzNDZkMDU4NGQ1Li5jYWNh
Mjk1NWE0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC9maWxlcy8wMDAxLUFk
ZC1zdXBwb3J0LWZvci1PcGVuU1NMLVByb3ZpZGVyLUFQSS5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtYnNwL3UtYm9vdC9maWxlcy8wMDAxLUFkZC1zdXBwb3J0LWZvci1PcGVuU1NMLVByb3ZpZGVy
LUFQSS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTgxY2IwOTMyZGNlMTA5YWY0NGQ3MjQ1
ZDQ3NDg5ZmU1NGFlMzkwZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmVkZjExZTc0
MGU3ODkzZWVkNjU5MGQxN2U5MjA3M2ZjZDdlNzg0MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEVkZGllIEtvdnNreSA8ZXdrQGVka292c2t5Lm9yZz4KIERhdGU6IE1vbiwgMjMgRmVi
IDIwMjYgMDk6NDM6MjIgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkIHN1cHBvcnQgZm9yIE9w
ZW5TU0wgUHJvdmlkZXIgQVBJCkBAIC0zOSwxNCArMzksMTQgQEAgQ2hhbmdlcyBmcm9tIHVwc3Ry
ZWFtOgogCiBTaWduZWQtb2ZmLWJ5OiBKYWlwYXVsIENoZWVybmFtIDxqYWlwYXVsLmNoZWVybmFt
QGVzdC50ZWNoPgogLS0tCi0gZG9jL2J1aWxkL2djYy5yc3QgICAgICB8ICAgNCArLQotIGxpYi9h
ZXMvYWVzLWVuY3J5cHQuYyB8ICAgNCArLQotIGxpYi9yc2EvcnNhLXNpZ24uYyAgICB8IDEwMiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KLSB0b29scy9kb2NrZXIv
RG9ja2VyZmlsZSB8ICAxICsKLSA0IGZpbGVzIGNoYW5nZWQsIDEwMyBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQorIGRvYy9idWlsZC9nY2MucnN0ICAgICAgIHwgICA0ICstCisgbGliL2Fl
cy9hZXMtZW5jcnlwdC5jICAgfCAgIDQgKy0KKyBsaWIvcnNhL3JzYS1zaWduLmMgICAgICB8IDEw
MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCisgdG9vbHMvZG9ja2Vy
L0RvY2tlcmZpbGUgfCAgIDEgKworIDQgZmlsZXMgY2hhbmdlZCwgMTA0IGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9kb2MvYnVpbGQvZ2NjLnJzdCBiL2RvYy9i
dWlsZC9nY2MucnN0Ci1pbmRleCAxZmVmNzE4Y2VlY2IuLjI5YTZhNjMyZTdlMyAxMDA2NDQKK2lu
ZGV4IDFmZWY3MThjZWVjLi4yOWE2YTYzMmU3ZSAxMDA2NDQKIC0tLSBhL2RvYy9idWlsZC9nY2Mu
cnN0CiArKysgYi9kb2MvYnVpbGQvZ2NjLnJzdAogQEAgLTI1LDggKzI1LDggQEAgRGVwZW5kaW5n
IG9uIHRoZSBidWlsZCB0YXJnZXRzIGZ1cnRoZXIgcGFja2FnZXMgbWF5YmUgbmVlZGVkCkBAIC02
MSw3ICs2MSw3IEBAIGluZGV4IDFmZWY3MThjZWVjYi4uMjlhNmE2MzJlN2UzIDEwMDY0NAogICAg
ICAgIHB5dGhvbjMtcGtnLXJlc291cmNlcyBweXRob24zLXB5Y3J5cHRvZG9tZSBweXRob24zLXB5
ZWxmdG9vbHMgXAogICAgICAgIHB5dGhvbjMtcHl0ZXN0IHB5dGhvbjMtcHl0ZXN0LXhkaXN0IHB5
dGhvbjMtc3BoaW54Y29udHJpYi5hcGlkb2MgXAogZGlmZiAtLWdpdCBhL2xpYi9hZXMvYWVzLWVu
Y3J5cHQuYyBiL2xpYi9hZXMvYWVzLWVuY3J5cHQuYwotaW5kZXggOTBlMTQwN2I0ZjA5Li40ZmM0
Y2UyMzI0NzggMTAwNjQ0CitpbmRleCA5MGUxNDA3YjRmMC4uNGZjNGNlMjMyNDcgMTAwNjQ0CiAt
LS0gYS9saWIvYWVzL2Flcy1lbmNyeXB0LmMKICsrKyBiL2xpYi9hZXMvYWVzLWVuY3J5cHQuYwog
QEAgLTE2LDcgKzE2LDkgQEAKQEAgLTc2LDcgKzc2LDcgQEAgaW5kZXggOTBlMTQwN2I0ZjA5Li40
ZmM0Y2UyMzI0NzggMTAwNjQ0CiAgCiAgI2lmIE9QRU5TU0xfVkVSU0lPTl9OVU1CRVIgPj0gMHgx
MDAwMDAwMEwKIGRpZmYgLS1naXQgYS9saWIvcnNhL3JzYS1zaWduLmMgYi9saWIvcnNhL3JzYS1z
aWduLmMKLWluZGV4IDBlMzhjOWU4MDJmZC4uZjQ1NmYzYzU4ZTY1IDEwMDY0NAoraW5kZXggMGUz
OGM5ZTgwMmYuLjQ5OTBiNDNhN2E2IDEwMDY0NAogLS0tIGEvbGliL3JzYS9yc2Etc2lnbi5jCiAr
KysgYi9saWIvcnNhL3JzYS1zaWduLmMKIEBAIC0xOSw3ICsxOSw0NyBAQApAQCAtMTI4LDcgKzEy
OCw3IEBAIGluZGV4IDBlMzhjOWU4MDJmZC4uZjQ1NmYzYzU4ZTY1IDEwMDY0NAogIAogIHN0YXRp
YyBpbnQgcnNhX2Vycihjb25zdCBjaGFyICptc2cpCiAgewotQEAgLTk0LDEwICsxMzQsMTEgQEAg
c3RhdGljIGludCByc2FfcGVtX2dldF9wdWJfa2V5KGNvbnN0IGNoYXIgKmtleWRpciwgY29uc3Qg
Y2hhciAqbmFtZSwgRVZQX1BLRVkgKioKK0BAIC05NCwxMCArMTM0LDExIEBAIGVycl9jZXJ0Ogog
ICAqCiAgICogQGtleWRpcjoJS2V5IHByZWZpeAogICAqIEBuYW1lCU5hbWUgb2Yga2V5CkBAIC0y
MTQsNyArMjE0LDcgQEAgaW5kZXggMGUzOGM5ZTgwMmZkLi5mNDU2ZjNjNThlNjUgMTAwNjQ0CiAg
CXJldHVybiAwOwogIH0KICAKLUBAIC0yMjYsNiArMzAxLDcgQEAgc3RhdGljIGludCByc2FfcGVt
X2dldF9wcml2X2tleShjb25zdCBjaGFyICprZXlkaXIsIGNvbnN0IGNoYXIgKm5hbWUsCitAQCAt
MjI2LDYgKzMwMiw3IEBAIHN0YXRpYyBpbnQgcnNhX3BlbV9nZXRfcHJpdl9rZXkoY29uc3QgY2hh
ciAqa2V5ZGlyLCBjb25zdCBjaGFyICpuYW1lLAogICAqIEBldnBwCVJldHVybnMgRVZQX1BLRVkg
b2JqZWN0LCBvciBOVUxMIG9uIGZhaWx1cmUKICAgKiBSZXR1cm46IDAgaWYgb2ssIC12ZSBvbiBl
cnJvciAoaW4gd2hpY2ggY2FzZSAqZXZwcCB3aWxsIGJlIHNldCB0byBOVUxMKQogICAqLwpAQCAt
MjIyLDcgKzIyMiw3IEBAIGluZGV4IDBlMzhjOWU4MDJmZC4uZjQ1NmYzYzU4ZTY1IDEwMDY0NAog
IHN0YXRpYyBpbnQgcnNhX2VuZ2luZV9nZXRfcHJpdl9rZXkoY29uc3QgY2hhciAqa2V5ZGlyLCBj
b25zdCBjaGFyICpuYW1lLAogIAkJCQkgICBjb25zdCBjaGFyICprZXlmaWxlLAogIAkJCQkgICBF
TkdJTkUgKmVuZ2luZSwgRVZQX1BLRVkgKipldnBwKQotQEAgLTI5MywyMiArMzY5LDI1IEBAIHN0
YXRpYyBpbnQgcnNhX2VuZ2luZV9nZXRfcHJpdl9rZXkoY29uc3QgY2hhciAqa2V5ZGlyLCBjb25z
dCBjaGFyICpuYW1lLAorQEAgLTI5MywyMiArMzcwLDI1IEBAIHN0YXRpYyBpbnQgcnNhX2VuZ2lu
ZV9nZXRfcHJpdl9rZXkoY29uc3QgY2hhciAqa2V5ZGlyLCBjb25zdCBjaGFyICpuYW1lLAogIAog
IAlyZXR1cm4gMDsKICB9CkBAIC0yNDksNyArMjQ5LDcgQEAgaW5kZXggMGUzOGM5ZTgwMmZkLi5m
NDU2ZjNjNThlNjUgMTAwNjQ0CiAgCXJldHVybiByc2FfcGVtX2dldF9wcml2X2tleShrZXlkaXIs
IG5hbWUsIGtleWZpbGUsIGV2cHApOwogIH0KICAKLUBAIC0zMjUsNiArNDA0LDcgQEAgc3RhdGlj
IGludCByc2FfaW5pdCh2b2lkKQorQEAgLTMyNSw2ICs0MDUsNyBAQCBzdGF0aWMgaW50IHJzYV9p
bml0KHZvaWQpCiAgCXJldHVybiAwOwogIH0KICAKQEAgLTI1Nyw3ICsyNTcsNyBAQCBpbmRleCAw
ZTM4YzllODAyZmQuLmY0NTZmM2M1OGU2NSAxMDA2NDQKICBzdGF0aWMgaW50IHJzYV9lbmdpbmVf
aW5pdChjb25zdCBjaGFyICplbmdpbmVfaWQsIEVOR0lORSAqKnBlKQogIHsKICAJY29uc3QgY2hh
ciAqa2V5X3Bhc3M7Ci1AQCAtMzgwLDYgKzQ2MCw3IEBAIHN0YXRpYyB2b2lkIHJzYV9lbmdpbmVf
cmVtb3ZlKEVOR0lORSAqZSkKK0BAIC0zODAsNiArNDYxLDcgQEAgc3RhdGljIHZvaWQgcnNhX2Vu
Z2luZV9yZW1vdmUoRU5HSU5FICplKQogIAkJRU5HSU5FX2ZyZWUoZSk7CiAgCX0KICB9CkBAIC0y
NjUsNyArMjY1LDcgQEAgaW5kZXggMGUzOGM5ZTgwMmZkLi5mNDU2ZjNjNThlNjUgMTAwNjQ0CiAg
CiAgc3RhdGljIGludCByc2Ffc2lnbl93aXRoX2tleShFVlBfUEtFWSAqcGtleSwgc3RydWN0IHBh
ZGRpbmdfYWxnbyAqcGFkZGluZ19hbGdvLAogIAkJCSAgICAgc3RydWN0IGNoZWNrc3VtX2FsZ28g
KmNoZWNrc3VtX2FsZ28sCi1AQCAtNDgwLDExICs1NjEsMTMgQEAgaW50IHJzYV9zaWduKHN0cnVj
dCBpbWFnZV9zaWduX2luZm8gKmluZm8sCitAQCAtNDgwLDExICs1NjIsMTMgQEAgaW50IHJzYV9z
aWduKHN0cnVjdCBpbWFnZV9zaWduX2luZm8gKmluZm8sCiAgCWlmIChyZXQpCiAgCQlyZXR1cm4g
cmV0OwogIApAQCAtMjc5LDcgKzI3OSw3IEBAIGluZGV4IDBlMzhjOWU4MDJmZC4uZjQ1NmYzYzU4
ZTY1IDEwMDY0NAogIAogIAlyZXQgPSByc2FfZ2V0X3ByaXZfa2V5KGluZm8tPmtleWRpciwgaW5m
by0+a2V5bmFtZSwgaW5mby0+a2V5ZmlsZSwKICAJCQkgICAgICAgZSwgJnBrZXkpOwotQEAgLTQ5
NiwxNiArNTc5LDIxIEBAIGludCByc2Ffc2lnbihzdHJ1Y3QgaW1hZ2Vfc2lnbl9pbmZvICppbmZv
LAorQEAgLTQ5NiwxNiArNTgwLDIxIEBAIGludCByc2Ffc2lnbihzdHJ1Y3QgaW1hZ2Vfc2lnbl9p
bmZvICppbmZvLAogIAkJZ290byBlcnJfc2lnbjsKICAKICAJRVZQX1BLRVlfZnJlZShwa2V5KTsK
QEAgLTMwMSw3ICszMDEsNyBAQCBpbmRleCAwZTM4YzllODAyZmQuLmY0NTZmM2M1OGU2NSAxMDA2
NDQKICAJcmV0dXJuIHJldDsKICB9CiAgCi1AQCAtNjQ1LDExICs3MzMsMTMgQEAgaW50IHJzYV9h
ZGRfdmVyaWZ5X2RhdGEoc3RydWN0IGltYWdlX3NpZ25faW5mbyAqaW5mbywgdm9pZCAqa2V5ZGVz
dCkKK0BAIC02NDUsMTEgKzczNCwxMyBAQCBpbnQgcnNhX2FkZF92ZXJpZnlfZGF0YShzdHJ1Y3Qg
aW1hZ2Vfc2lnbl9pbmZvICppbmZvLCB2b2lkICprZXlkZXN0KQogIAlFTkdJTkUgKmUgPSBOVUxM
OwogIAogIAlkZWJ1ZygiJXM6IEdldHRpbmcgdmVyaWZpY2F0aW9uIGRhdGFcbiIsIF9fZnVuY19f
KTsKQEAgLTMxNSw3ICszMTUsNyBAQCBpbmRleCAwZTM4YzllODAyZmQuLmY0NTZmM2M1OGU2NSAx
MDA2NDQKICAJcmV0ID0gcnNhX2dldF9wdWJfa2V5KGluZm8tPmtleWRpciwgaW5mby0+a2V5bmFt
ZSwgZSwgJnBrZXkpOwogIAlpZiAocmV0KQogIAkJZ290byBlcnJfZ2V0X3B1Yl9rZXk7Ci1AQCAt
NzI2LDggKzgxNiwxMCBAQCBpbnQgcnNhX2FkZF92ZXJpZnlfZGF0YShzdHJ1Y3QgaW1hZ2Vfc2ln
bl9pbmZvICppbmZvLCB2b2lkICprZXlkZXN0KQorQEAgLTcyNiw4ICs4MTcsMTAgQEAgZG9uZToK
ICBlcnJfZ2V0X3BhcmFtczoKICAJRVZQX1BLRVlfZnJlZShwa2V5KTsKICBlcnJfZ2V0X3B1Yl9r
ZXk6CkBAIC0zMjcsNyArMzI3LDcgQEAgaW5kZXggMGUzOGM5ZTgwMmZkLi5mNDU2ZjNjNThlNjUg
MTAwNjQ0CiAgCWlmIChyZXQpCiAgCQlyZXR1cm4gcmV0OwogZGlmZiAtLWdpdCBhL3Rvb2xzL2Rv
Y2tlci9Eb2NrZXJmaWxlIGIvdG9vbHMvZG9ja2VyL0RvY2tlcmZpbGUKLWluZGV4IDczYmY2Y2Rk
MmM1Mi4uNTBlOThlODNkYzIwIDEwMDY0NAoraW5kZXggZWJiNjc5YTVmNDYuLmMyY2NjMGNhN2Ri
IDEwMDY0NAogLS0tIGEvdG9vbHMvZG9ja2VyL0RvY2tlcmZpbGUKICsrKyBiL3Rvb2xzL2RvY2tl
ci9Eb2NrZXJmaWxlCiBAQCAtMTIyLDYgKzEyMiw3IEBAIFJVTiAtLW1vdW50PXR5cGU9Y2FjaGUs
dGFyZ2V0PS92YXIvY2FjaGUvYXB0LHNoYXJpbmc9bG9ja2VkIFwKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ic3AvdS1ib290L2ZpbGVzLzAwMDEtcHlsaWJmZHQtUmVwbGFjZS1yZW1vdmVkLVNX
SUctUHl0aG9uLTItY29tcGF0aWJpbGl0eS5wYXRjaCBiL21ldGEvcmVjaXBlcy1ic3AvdS1ib290
L2ZpbGVzLzAwMDEtcHlsaWJmZHQtUmVwbGFjZS1yZW1vdmVkLVNXSUctUHl0aG9uLTItY29tcGF0
aWJpbGl0eS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYzFkMDIwNGUzMi4u
MDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC9maWxlcy8wMDAxLXB5bGli
ZmR0LVJlcGxhY2UtcmVtb3ZlZC1TV0lHLVB5dGhvbi0yLWNvbXBhdGliaWxpdHkucGF0Y2gKKysr
IC9kZXYvbnVsbApAQCAtMSw1NSArMCwwIEBACi1Gcm9tIDg4NjYxNmQwM2I2YWZjYzVjZThiMzRl
N2FmOTFmN2NjZmJiMGE1YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEphaXBhdWwg
Q2hlZXJuYW0gPGphaXBhdWwuY2hlZXJuYW1AZXN0LnRlY2g+Ci1EYXRlOiBUdWUsIDExIEF1ZyAy
MDI2IDEzOjIxOjAxICswMDAwCi1TdWJqZWN0OiBbUEFUQ0hdIHB5bGliZmR0OiBSZXBsYWNlIHJl
bW92ZWQgU1dJRyBQeXRob24gMiBjb21wYXRpYmlsaXR5IG1hY3JvcwotCi1TV0lHIDQuNS4wIHJl
bW92ZWQgUHl0aG9uIDIgY29tcGF0aWJpbGl0eSBtYWNyb3MgKFB5SW50XyosIFB5U3RyaW5nXyop
Ci1mcm9tIGl0cyBydW50aW1lIGhlYWRlciBweWhlYWQuc3dnIChzZWUgY29tbWl0IDc5ZjdhMmI3
Y2I3ZCkuIFJlcGxhY2UKLXRoZW0gd2l0aCB0aGVpciBQeXRob24gMyBDIEFQSSBlcXVpdmFsZW50
czoKLQotLSBQeVN0cmluZ19Gcm9tU3RyaW5nIC0+IFB5VW5pY29kZV9Gcm9tU3RyaW5nCi0tIFB5
U3RyaW5nX0FzU3RyaW5nIC0+IFB5Qnl0ZXNfQXNTdHJpbmcKLS0gUHlJbnRfQXNMb25nIC0+IFB5
TG9uZ19Bc0xvbmcKLQotVGhlIHJlcGxhY2VtZW50cyBhcmUgc2FmZSBzaW5jZSB0aGUgbWFjcm9z
IHdlcmUgYWxyZWFkeSBhbGlhc2VkIHRvCi10aGVzZSBleGFjdCBmdW5jdGlvbnMgaW4gU1dJRydz
IFB5dGhvbiAzIGNvZGUgcGF0aC4KLQotVGhpcyBpcyBhIGJhY2twb3J0IG9mIGR0YyBjb21taXQg
NTAwOGQxZDZhMzU2ICgicHlsaWJmZHQ6IFJlcGxhY2UKLXJlbW92ZWQgU1dJRyBQeXRob24gMiBj
b21wYXRpYmlsaXR5IG1hY3JvcyIpLgotCi1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8yMjgzNzEzL10KLQotU2lnbmVkLW9mZi1i
eTogSmFpcGF1bCBDaGVlcm5hbSA8amFpcGF1bC5jaGVlcm5hbUBlc3QudGVjaD4KLS0tLQotIHNj
cmlwdHMvZHRjL3B5bGliZmR0L2xpYmZkdC5pX3NoaXBwZWQgfCA2ICsrKy0tLQotIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9z
Y3JpcHRzL2R0Yy9weWxpYmZkdC9saWJmZHQuaV9zaGlwcGVkIGIvc2NyaXB0cy9kdGMvcHlsaWJm
ZHQvbGliZmR0Lmlfc2hpcHBlZAotaW5kZXggZTQ2NTk0ODkuLjMyNmExNWM3IDEwMDY0NAotLS0t
IGEvc2NyaXB0cy9kdGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZAotKysrIGIvc2NyaXB0cy9k
dGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZAotQEAgLTEwMzMsNyArMTAzMyw3IEBAIHR5cGVk
ZWYgdWludDMyX3QgZmR0MzJfdDsKLSAJUHlPYmplY3QgKmJ1ZmY7Ci0gCi0gCWlmICgkMSkgewot
LQkJcmVzdWx0b2JqID0gUHlTdHJpbmdfRnJvbVN0cmluZygKLSsJCXJlc3VsdG9iaiA9IFB5VW5p
Y29kZV9Gcm9tU3RyaW5nKAotIAkJCWZkdF9zdHJpbmcoZmR0MSwgZmR0MzJfdG9fY3B1KCQxLT5u
YW1lb2ZmKSkpOwotIAkJYnVmZiA9IFB5Qnl0ZUFycmF5X0Zyb21TdHJpbmdBbmRTaXplKAotIAkJ
CShjb25zdCBjaGFyICopKCQxICsgMSksIGZkdDMyX3RvX2NwdSgkMS0+bGVuKSk7Ci1AQCAtMTA2
NCwxMyArMTA2NCwxMyBAQCB0eXBlZGVmIHVpbnQzMl90IGZkdDMyX3Q7Ci0gICAgICAgICB9Ci0g
ICAgICAgICAkMSA9IFB5Qnl0ZXNfQXNTdHJpbmcoJGlucHV0KTsKLSAgICAgJSNlbHNlCi0tICAg
ICAgICAkMSA9IFB5U3RyaW5nX0FzU3RyaW5nKCRpbnB1dCk7ICAgLyogY2hhciAqc3RyICovCi0r
ICAgICAgICAkMSA9IFB5Qnl0ZXNfQXNTdHJpbmcoJGlucHV0KTsgICAvKiBjaGFyICpzdHIgKi8K
LSAgICAgJSNlbmRpZgotIH0KLSAKLSAvKiB0eXBlbWFwcyB1c2VkIGZvciBmZHRfbmV4dF9ub2Rl
KCkgKi8KLSAldHlwZW1hcChpbiwgbnVtaW5wdXRzPTEpIGludCAqZGVwdGggKGludCBkZXB0aCkg
ewotLSAgIGRlcHRoID0gKGludCkgUHlJbnRfQXNMb25nKCRpbnB1dCk7Ci0rICAgZGVwdGggPSAo
aW50KSBQeUxvbmdfQXNMb25nKCRpbnB1dCk7Ci0gICAgJDEgPSAmZGVwdGg7Ci0gfQotIApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvZmlsZXMvMDAwMS10b29scy1ta2VmaWNh
cHN1bGUtRGV0ZWN0LUdudVRMUy1QS0NTLTExLXN1cHBvcnQucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
YnNwL3UtYm9vdC9maWxlcy8wMDAxLXRvb2xzLW1rZWZpY2Fwc3VsZS1EZXRlY3QtR251VExTLVBL
Q1MtMTEtc3VwcG9ydC5wYXRjaAppbmRleCA2ODg2NWFmNDgxLi5lMDMyM2FiZWY4IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC9maWxlcy8wMDAxLXRvb2xzLW1rZWZpY2Fwc3Vs
ZS1EZXRlY3QtR251VExTLVBLQ1MtMTEtc3VwcG9ydC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
YnNwL3UtYm9vdC9maWxlcy8wMDAxLXRvb2xzLW1rZWZpY2Fwc3VsZS1EZXRlY3QtR251VExTLVBL
Q1MtMTEtc3VwcG9ydC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDA3Yjc3YzJmNTFkNGMx
YzY5NmZiZjFmZjkyNjk0YjU4NWIzNWY1NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MWY1YjU3M2Q1MzQwYjY2YmYwOTMxMGU4MzMxMDY0Y2E1M2EyZDdkMiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IFdvamNpZWNoIER1Ym93aWsgPFdvamNpZWNoLkR1Ym93aWtAbXQuY29t
PgogRGF0ZTogVHVlLCA5IEp1biAyMDI2IDA5OjAxOjA0ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hd
IHRvb2xzOiBta2VmaWNhcHN1bGU6IFJld29yayBwa2NzMTEgc3VwcG9ydApAQCAtMjIsMTAgKzIy
LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFdvamNpZWNoIER1Ym93aWsgPFdvamNpZWNoLkR1Ym93aWtA
bXQuY29tPgogIDIgZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS90b29scy9NYWtlZmlsZSBiL3Rvb2xzL01ha2VmaWxlCi1pbmRl
eCAxYTVmNDI1ZWNkYWEuLmU4NWY1YTM1NGI4MSAxMDA2NDQKK2luZGV4IDUzNWE1ZDUxYzg5Li42
MDdkNmQ4ZmY4YiAxMDA2NDQKIC0tLSBhL3Rvb2xzL01ha2VmaWxlCiArKysgYi90b29scy9NYWtl
ZmlsZQotQEAgLTI3MSw2ICsyNzEsMTEgQEAgbWtlZmljYXBzdWxlLW9ianMgOj0gZ2VuZXJhdGVk
L2xpYi91dWlkLm8gXAorQEAgLTI3Miw2ICsyNzIsMTEgQEAgbWtlZmljYXBzdWxlLW9ianMgOj0g
Z2VuZXJhdGVkL2xpYi91dWlkLm8gXAogIAkkKExJQkZEVF9PQkpTKSBcCiAgCW1rZWZpY2Fwc3Vs
ZS5vCiAgaG9zdHByb2dzLWFsd2F5cy0kKENPTkZJR19UT09MU19NS0VGSUNBUFNVTEUpICs9IG1r
ZWZpY2Fwc3VsZQpAQCAtMzgsNyArMzgsNyBAQCBpbmRleCAxYTVmNDI1ZWNkYWEuLmU4NWY1YTM1
NGI4MSAxMDA2NDQKICBpbmNsdWRlIHRvb2xzL2Z3dW1kYXRhX3NyYy9md3VtZGF0YS5tawogIAog
ZGlmZiAtLWdpdCBhL3Rvb2xzL21rZWZpY2Fwc3VsZS5jIGIvdG9vbHMvbWtlZmljYXBzdWxlLmMK
LWluZGV4IGVjNjQwYzU3ZThhNS4uYzNjZjQ4ZjRjYzFkIDEwMDY0NAoraW5kZXggZWM2NDBjNTdl
OGEuLjlhYzY4NmY1MWE4IDEwMDY0NAogLS0tIGEvdG9vbHMvbWtlZmljYXBzdWxlLmMKICsrKyBi
L3Rvb2xzL21rZWZpY2Fwc3VsZS5jCiBAQCAtMjA3LDYgKzIwNyw3MSBAQCBzdGF0aWMgaW50IHdy
aXRlX2NhcHN1bGVfZmlsZShGSUxFICpmLCB2b2lkICpkYXRhLCBzaXplX3Qgc2l6ZSwgY29uc3Qg
Y2hhciAqbXNnKQpAQCAtMTc1LDUgKzE3NSwzIEBAIGluZGV4IGVjNjQwYzU3ZThhNS4uYzNjZjQ4
ZjRjYzFkIDEwMDY0NAogIAkJCQlnbnV0bHNfc3RyZXJyb3IocmV0KSk7CiAgCQkJcmV0dXJuIC0x
OwogIAkJfQotLS0gCi0yLjQ3LjMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvdS1ib290
L3UtYm9vdC1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LWNvbW1v
bi5pbmMKaW5kZXggZWNlMGZhZGU1NS4uOWQyMTdmMTNhNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWJzcC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWJzcC91
LWJvb3QvdS1ib290LWNvbW1vbi5pbmMKQEAgLTE0LDcgKzE0LDcgQEAgQ1ZFX1BST0RVQ1QgPSAi
dS1ib290OnUtYm9vdCBkZW54OnUtYm9vdCIKIAogIyBXZSB1c2UgdGhlIHJldmlzaW9uIGluIG9y
ZGVyIHRvIGF2b2lkIGhhdmluZyB0byBmZXRjaCBpdCBmcm9tIHRoZQogIyByZXBvIGR1cmluZyBw
YXJzZQotU1JDUkVWID0gImVjZTM0OWFkZTI5NzNlMjIwZjUyNGNlNTllNTk3MTFjYzkxOTI2M2Yi
CitTUkNSRVYgPSAiNTUwODQwNjU4MmY2ZjcxMjBkY2UwYzRiMzA1OTgxOWE0MTc4OGRiMiIKIAog
U1JDX1VSSSA9ICJnaXQ6Ly9naXQudS1ib290LXByb2plY3Qub3JnL3UtYm9vdC91LWJvb3QuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluO3RhZz12JHtQVn0gXAogICAgICAgICAgICBmaWxl
Oi8vMDAwMS1weWxpYmZkdC1SZXBsYWNlLXJlbW92ZWQtU1dJRy1QeXRob24tMi1jb21wYXRpYmls
aXR5LnBhdGNoIFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC10
b29sc18yMDI2LjA3LmJiIGIvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LXRvb2xzXzIw
MjYuMTAuYmIKc2ltaWxhcml0eSBpbmRleCAyMiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWJz
cC91LWJvb3QvdS1ib290LXRvb2xzXzIwMjYuMDcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1i
c3AvdS1ib290L3UtYm9vdC10b29sc18yMDI2LjEwLmJiCmluZGV4IDllN2ExNzgzMTAuLmIyOGFm
ZWNmNzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC10b29sc18y
MDI2LjA3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC10b29sc18yMDI2
LjEwLmJiCkBAIC0xLDQgKzEsNiBAQAogcmVxdWlyZSB1LWJvb3QtY29tbW9uLmluYwogcmVxdWly
ZSB1LWJvb3QtdG9vbHMuaW5jCiAKLVNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLXRvb2xzLW1rZWZp
Y2Fwc3VsZS1EZXRlY3QtR251VExTLVBLQ1MtMTEtc3VwcG9ydC5wYXRjaCIKK1NSQ19VUkkgKz0g
ImdpdDovL2dpdC51LWJvb3QtcHJvamVjdC5vcmcvdS1ib290L3UtYm9vdC5naXQ7cHJvdG9jb2w9
aHR0cHM7YnJhbmNoPW1haW47dGFnPXYke1BWfSBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAxLUFk
ZC1zdXBwb3J0LWZvci1PcGVuU1NMLVByb3ZpZGVyLUFQSS5wYXRjaCBcCisgICAgICAgICAgICIK
LS0gCjIuNDcuMQoK

--===============1379261659734509085==--

