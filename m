Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E55CCA47F
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:45 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.4449.1655298222094350203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AcADisTH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010181677666ff-34ce7957-d394-493d-9c88-8de1a5b3dc5a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ny9rr94jvQrKV/s6hE0GjLYQh+HfCrnjTWn2Ms91lpk=;
	b=AcADisTHHThQPiPCZN2QcnbMcapODA0JCpyQzDvMrqxi1avEbbngbSLNdOcG66S8
	A2eIcLvy1yRawfnDBqrYCBhb8I87M4KSbyaM9tN1w6/iRqaimSvkPBQiciFzvXY65Bl
	bj1vKn5MW7MFN/CoYnSlGaWvbxTjI+UQCNODMAEk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ny9rr94jvQrKV/s6hE0GjLYQh+HfCrnjTWn2Ms91lpk=;
	b=jjkQb+INBhM21nu2U+LosvgR+wQCzkfLuYfLJKqoBjEB0RTgivtzjy+3ZNxPD1Cr
	6Wp35idzx5ftbyclg10wGON2V0lgVp1jhCHsRGoLmV1GZK1n0t+kVuwSD8DDpi3QaZX
	8aA1/jHHwT6VPtwvdQhz9bmi7WEHPi+oQOv9jybA=
Content-Type: multipart/mixed; boundary="===============1769464633945219999=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20220610 SUCCEEDED
Message-ID: 
 <01010181677666ff-34ce7957-d394-493d-9c88-8de1a5b3dc5a-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166978

--===============1769464633945219999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20220610* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20220509-20220610.patch
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
--===============1769464633945219999==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20220509-20220610.patch"

From 22476e1172704b02cf3f0fc0868f1bc5671f6229 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 12:34:11 +0000
Subject: [PATCH] linux-firmware: upgrade 20220509 -> 20220610

---
 ...01-Makefile-replace-mkdir-by-install.patch |  84 ----
 ...20220509.bb => linux-firmware_20220610.bb} | 418 +++++++++++++++++-
 2 files changed, 412 insertions(+), 90 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220509.bb => linux-firmware_20220610.bb} (80%)

diff --git a/meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch b/meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch
deleted file mode 100644
index b1ac5a16ab..0000000000
--- a/meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 71514e74f35f2b51ca24062573d6d913525b30db Mon Sep 17 00:00:00 2001
-From: Konrad Weihmann <kweihmann@outlook.com>
-Date: Mon, 9 May 2022 12:57:57 +0200
-Subject: [PATCH] Makefile: replace mkdir by install
-
-mkdir -p creates paths that are bound to user's settings and therefore
-can lead to different file mode bits of the base paths accross different
-machines.
-Use install instead, as this tool is not prone to such behavior.
-
-Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
-Upstream-Status: Submitted [https://lore.kernel.org/linux-firmware/PR2PR09MB310088EA719E6D7CA5C268F1A8C69@PR2PR09MB3100.eurprd09.prod.outlook.com/]
----
- Makefile                      | 2 +-
- carl9170fw/toolchain/Makefile | 4 ++--
- copy-firmware.sh              | 6 +++---
- 3 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index e1c362f..83a0ec6 100644
---- a/Makefile
-+++ b/Makefile
-@@ -9,5 +9,5 @@ check:
- 	@./check_whence.py
- 
- install:
--	mkdir -p $(DESTDIR)$(FIRMWAREDIR)
-+	install -d $(DESTDIR)$(FIRMWAREDIR)
- 	./copy-firmware.sh $(DESTDIR)$(FIRMWAREDIR)
-diff --git a/carl9170fw/toolchain/Makefile b/carl9170fw/toolchain/Makefile
-index 2b25ffe..aaea8e8 100644
---- a/carl9170fw/toolchain/Makefile
-+++ b/carl9170fw/toolchain/Makefile
-@@ -46,14 +46,14 @@ src/gcc-$(GCC_VER): src/$(GCC_TAR) src/newlib-$(NEWLIB_VER)
- 	ln -s $(BASEDIR)/src/newlib-$(NEWLIB_VER)/libgloss $@
- 
- binutils: src/binutils-$(BINUTILS_VER)
--	mkdir -p build/binutils
-+	install -d build/binutils
- 	cd build/binutils; \
- 	$(BASEDIR)/$</configure --target=sh-elf --prefix=$(BASEDIR)/inst; \
- 	$(MAKE) -j3; \
- 	$(MAKE) install
- 
- gcc: src/gcc-$(GCC_VER) binutils
--	mkdir -p build/gcc
-+	install -d build/gcc
- 	cd build/gcc; \
- 	$(BASEDIR)/$</configure --target=sh-elf --prefix=$(BASEDIR)/inst -enable-languages=c --without-pkgversion --with-newlib; \
- 	$(MAKE) -j3; \
-diff --git a/copy-firmware.sh b/copy-firmware.sh
-index 9b46b63..bbacb92 100755
---- a/copy-firmware.sh
-+++ b/copy-firmware.sh
-@@ -34,7 +34,7 @@ done
- grep '^File:' WHENCE | sed -e's/^File: *//g' -e's/"//g' | while read f; do
-     test -f "$f" || continue
-     $verbose "copying file $f"
--    mkdir -p $destdir/$(dirname "$f")
-+    install -d $destdir/$(dirname "$f")
-     cp -d "$f" $destdir/"$f"
- done
- 
-@@ -42,7 +42,7 @@ grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; d
-     if test -L "$f"; then
-         test -f "$destdir/$f" && continue
-         $verbose "copying link $f"
--        mkdir -p $destdir/$(dirname "$f")
-+        install -d $destdir/$(dirname "$f")
-         cp -d "$f" $destdir/"$f"
- 
-         if test "x$d" != "x"; then
-@@ -63,7 +63,7 @@ grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; d
-         fi
-     else
-         $verbose "creating link $f -> $d"
--        mkdir -p $destdir/$(dirname "$f")
-+        install -d $destdir/$(dirname "$f")
-         ln -sf "$d" "$destdir/$f"
-     fi
- done
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220610.bb
similarity index 80%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220610.bb
index 10a7036a19..49a6064b95 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220610.bb
@@ -1,3 +1,412 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- WHENCE
+# +++ WHENCE
+# @@ -862,92 +862,15 @@
+#  File: iwlwifi-2000-6.ucode
+#  Version: 18.168.6.1
+#  
+# -File: iwlwifi-7260-7.ucode
+# -Version: 22.1.7.0
+# -
+# -File: iwlwifi-7260-8.ucode
+# -Version: 22.24.8.0
+# -
+# -File: iwlwifi-7260-9.ucode
+# -Version: 25.228.9.0
+# -
+# -File: iwlwifi-7260-10.ucode
+# -Version: 23.15.10.0
+# -
+# -File: iwlwifi-7260-12.ucode
+# -Version: 25.17.12.0
+# -
+# -File: iwlwifi-7260-13.ucode
+# -Version: 25.30.13.0
+# -
+# -File: iwlwifi-7260-16.ucode
+# -Version: 16.242414.0
+# -
+#  File: iwlwifi-7260-17.ucode
+#  Version: 17.bfb58538.0
+#  
+# -File: iwlwifi-3160-7.ucode
+# -Version: 22.1.7.0
+# -
+# -File: iwlwifi-3160-8.ucode
+# -Version: 22.24.8.0
+# -
+# -File: iwlwifi-3160-9.ucode
+# -Version: 25.228.9.0
+# -
+# -File: iwlwifi-3160-10.ucode
+# -Version: 23.15.10.0
+# -
+# -File: iwlwifi-3160-12.ucode
+# -Version: 25.17.12.0
+# -
+# -File: iwlwifi-3160-13.ucode
+# -Version: 25.30.13.0
+# -
+# -File: iwlwifi-3160-16.ucode
+# -Version: 16.242414.0
+# -
+#  File: iwlwifi-3160-17.ucode
+#  Version: 17.bfb58538.0
+#  
+# -File: iwlwifi-7265-8.ucode
+# -Version: 22.24.8.0
+# -
+# -File: iwlwifi-7265-9.ucode
+# -Version: 25.228.9.0
+# -
+# -File: iwlwifi-7265-10.ucode
+# -Version: 23.15.10.0
+# -
+# -File: iwlwifi-7265-12.ucode
+# -Version: 25.17.12.0
+# -
+# -File: iwlwifi-7265-13.ucode
+# -Version: 25.30.13.0
+# -
+# -File: iwlwifi-7265-16.ucode
+# -Version: 16.242414.0
+# -
+#  File: iwlwifi-7265-17.ucode
+#  Version: 17.bfb58538.0
+#  
+# -Link: iwlwifi-7265D-10.ucode -> iwlwifi-7265-10.ucode
+# -
+# -File: iwlwifi-7265D-12.ucode
+# -Version: 25.17.12.0
+# -
+# -File: iwlwifi-7265D-13.ucode
+# -Version: 25.30.13.0
+# -
+# -File: iwlwifi-7265D-16.ucode
+# -Version: 16.242414.0
+# -
+# -File: iwlwifi-7265D-17.ucode
+# -Version: 17.352738.0
+# -
+# -File: iwlwifi-7265D-21.ucode
+# -Version: 21.302800.0
+# -
+#  File: iwlwifi-7265D-22.ucode
+#  Version: 22.391740.0
+#  
+# @@ -957,9 +880,6 @@
+#  File: iwlwifi-7265D-29.ucode
+#  Version: 29.f2390aa8.0
+#  
+# -File: iwlwifi-3168-21.ucode
+# -Version: 21.302800.0
+# -
+#  File: iwlwifi-3168-22.ucode
+#  Version: 22.391740.0
+#  
+# @@ -969,15 +889,6 @@
+#  File: iwlwifi-3168-29.ucode
+#  Version: 29.0bd893f3.0
+#  
+# -File: iwlwifi-8000C-13.ucode
+# -Version: 25.30.13.0
+# -
+# -File: iwlwifi-8000C-16.ucode
+# -Version: 16.242414.0
+# -
+# -File: iwlwifi-8000C-21.ucode
+# -Version: 21.302800.0
+# -
+#  File: iwlwifi-8000C-22.ucode
+#  Version: 22.391740.0
+#  
+# @@ -993,9 +904,6 @@
+#  File: iwlwifi-8000C-36.ucode
+#  Version: 36.ca7b901d.0
+#  
+# -File: iwlwifi-8265-21.ucode
+# -Version: 21.302800.0
+# -
+#  File: iwlwifi-8265-22.ucode
+#  Version: 22.391740.0
+#  
+# @@ -1027,7 +935,7 @@
+#  Version: 43.95eb4e97.0
+#  
+#  File: iwlwifi-9000-pu-b0-jf-b0-46.ucode
+# -Version: 46.fae53a8b.0
+# +Version: 46.9d0122c0.0
+#  
+#  File: iwlwifi-9260-th-b0-jf-b0-33.ucode
+#  Version: 33.610294.0
+# @@ -1045,7 +953,7 @@
+#  Version: 43.95eb4e97.0
+#  
+#  File: iwlwifi-9260-th-b0-jf-b0-46.ucode
+# -Version: 46.fae53a8b.0
+# +Version: 46.9d0122c0.0
+#  
+#  File: iwlwifi-cc-a0-46.ucode
+#  Version: 46.3cfab8da.0
+# @@ -1329,6 +1237,42 @@
+#  
+#  File: iwlwifi-so-a0-jf-b0-71.ucode
+#  Version: 71.058653f6.0
+# +
+# +File: iwlwifi-cc-a0-73.ucode
+# +Version: 73.35c0a2c6.0
+# +
+# +File: iwlwifi-Qu-b0-hr-b0-73.ucode
+# +Version: 73.35c0a2c6.0
+# +
+# +File: iwlwifi-Qu-b0-jf-b0-73.ucode
+# +Version: 73.35c0a2c6.0
+# +
+# +File: iwlwifi-Qu-c0-hr-b0-73.ucode
+# +Version: 73.35c0a2c6.0
+# +
+# +File: iwlwifi-Qu-c0-jf-b0-73.ucode
+# +Version: 73.35c0a2c6.0
+# +
+# +File: iwlwifi-QuZ-a0-hr-b0-73.ucode
+# +Version: 73.35c0a2c6.0
+# +
+# +File: iwlwifi-QuZ-a0-jf-b0-73.ucode
+# +Version: 73.35c0a2c6.0
+# +
+# +File: iwlwifi-ty-a0-gf-a0-73.ucode
+# +Version: 73.35c0a2c6.0
+# +
+# +File: iwlwifi-so-a0-gf4-a0-73.ucode
+# +Version: 73.35c0a2c6.0
+# +
+# +File: iwlwifi-so-a0-gf-a0-73.ucode
+# +Version: 73.35c0a2c6.0
+# +
+# +File: iwlwifi-so-a0-hr-b0-73.ucode
+# +Version: 73.35c0a2c6.0
+# +
+# +File: iwlwifi-so-a0-jf-b0-73.ucode
+# +Version: 73.35c0a2c6.0
+#  
+#  File: iwlwifi-so-a0-gf-a0.pnvm
+#  
+# @@ -3000,11 +2944,15 @@
+#  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-ultra.txt -> brcmfmac43430-sdio.AP6212.txt
+#  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m3.txt -> brcmfmac43430-sdio.AP6212.txt
+#  Link: brcm/brcmfmac43430-sdio.friendlyarm,nanopi-r1.txt -> brcmfmac43430-sdio.AP6212.txt
+# +Link: brcm/brcmfmac43430-sdio.starfive,visionfive-v1.txt -> brcmfmac43430-sdio.AP6212.txt
+# +Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-a1.txt -> brcmfmac43430-sdio.AP6212.txt
+# +Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-r0.txt -> brcmfmac43430-sdio.AP6212.txt
+#  File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
+#  File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
+#  File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
+#  Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
+#  File: "brcm/brcmfmac43455-sdio.acepc-t8.txt"
+# +File: "brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt"
+#  File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
+#  Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
+#  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
+# @@ -3649,15 +3597,16 @@
+#  File: ath10k/QCA9887/hw1.0/notice_ath10k_firmware-5.txt
+#  File: ath10k/QCA9888/hw2.0/board-2.bin
+#  File: ath10k/QCA9888/hw2.0/firmware-5.bin
+# -Version: 10.4-3.9.0.2-00156
+# +Version: 10.4-3.9.0.2-00157
+#  File: ath10k/QCA9888/hw2.0/notice_ath10k_firmware-5.txt
+#  File: ath10k/QCA9984/hw1.0/board-2.bin
+#  File: ath10k/QCA9984/hw1.0/firmware-5.bin
+# -Version: 10.4-3.9.0.2-00156
+# +Version: 10.4-3.9.0.2-00157
+#  File: ath10k/QCA9984/hw1.0/notice_ath10k_firmware-5.txt
+#  File: ath10k/QCA9377/hw1.0/firmware-6.bin
+#  Version: WLAN.TF.2.1-00021-QCARMSWP-1
+#  File: ath10k/QCA9377/hw1.0/notice_ath10k_firmware-6.txt
+# +File: ath10k/WCN3990/hw1.0/board-2.bin
+#  File: ath10k/WCN3990/hw1.0/firmware-5.bin
+#  File: ath10k/WCN3990/hw1.0/wlanmdsp.mbn
+#  Link: qcom/sdm845/wlanmdsp.mbn -> ../../ath10k/WCN3990/hw1.0/wlanmdsp.mbn
+# @@ -3711,14 +3660,14 @@
+#  File: ath11k/QCA6390/hw2.0/m3.bin
+#  Version: WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1
+#  File: ath11k/QCA6390/hw2.0/Notice.txt
+# +File: ath11k/WCN6855/hw2.0/regdb.bin
+#  File: ath11k/WCN6855/hw2.0/board-2.bin
+# -File: ath11k/WCN6855/hw2.0/regdb.bin
+#  File: ath11k/WCN6855/hw2.0/amss.bin
+#  File: ath11k/WCN6855/hw2.0/m3.bin
+# -Version: WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.7
+# +Version: WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
+#  File: ath11k/WCN6855/hw2.0/Notice.txt
+# +Link: ath11k/WCN6855/hw2.1/regdb.bin -> ../hw2.0/regdb.bin
+#  Link: ath11k/WCN6855/hw2.1/board-2.bin -> ../hw2.0/board-2.bin
+# -Link: ath11k/WCN6855/hw2.1/regdb.bin -> ../hw2.0/regdb.bin
+#  Link: ath11k/WCN6855/hw2.1/amss.bin -> ../hw2.0/amss.bin
+#  Link: ath11k/WCN6855/hw2.1/m3.bin -> ../hw2.0/m3.bin
+#  File: ath11k/QCN9074/hw1.0/board-2.bin
+# @@ -3938,92 +3887,92 @@
+#  File: intel/ibt-18-1.ddc
+#  Version: BT_ThunderPeak_A0_B0_REL0201
+#  File:intel/ibt-20-0-3.sfi
+# -Version: BT_CyclonePeak_A0_REL41522
+# +Version: BT_CyclonePeak_A0_REL43126
+#  File:intel/ibt-20-0-3.ddc
+# -Version: BT_CyclonePeak_A0_REL41522
+# +Version: BT_CyclonePeak_A0_REL43126
+#  File:intel/ibt-20-1-3.sfi
+# -Version: BT_CyclonePeak_A0_REL41522
+# +Version: BT_CyclonePeak_A0_REL43126
+#  File:intel/ibt-20-1-3.ddc
+# -Version: BT_CyclonePeak_A0_REL41522
+# +Version: BT_CyclonePeak_A0_REL43126
+#  File:intel/ibt-20-1-4.sfi
+# -Version: BT_CyclonePeak_A0_REL41522
+# +Version: BT_CyclonePeak_A0_REL43126
+#  File:intel/ibt-20-1-4.ddc
+# -Version: BT_CyclonePeak_A0_REL41522
+# +Version: BT_CyclonePeak_A0_REL43126
+#  File:intel/ibt-19-0-0.sfi
+# -Version: BT_Quasar_REL41522
+# +Version: BT_Quasar_REL43126
+#  File:intel/ibt-19-0-0.ddc
+# -Version: BT_Quasar_REL41522
+# +Version: BT_Quasar_REL43126
+#  File:intel/ibt-19-0-1.sfi
+# -Version: BT_Quasar_REL41522
+# +Version: BT_Quasar_REL43126
+#  File:intel/ibt-19-0-1.ddc
+# -Version: BT_Quasar_REL41522
+# +Version: BT_Quasar_REL43126
+#  File:intel/ibt-19-0-4.sfi
+# -Version: BT_HarrisonPeak_REL41522
+# +Version: BT_HarrisonPeak_REL43126
+#  File:intel/ibt-19-0-4.ddc
+# -Version: BT_HarrisonPeak_REL41522
+# +Version: BT_HarrisonPeak_REL43126
+#  File:intel/ibt-19-16-4.sfi
+# -Version: BT_HarrisonPeak_REL41522
+# +Version: BT_HarrisonPeak_REL43126
+#  File:intel/ibt-19-16-4.ddc
+# -Version: BT_HarrisonPeak_REL41522
+# +Version: BT_HarrisonPeak_REL43126
+#  File:intel/ibt-19-32-1.sfi
+# -Version: BT_HarrisonPeak_REL41522
+# +Version: BT_HarrisonPeak_REL43126
+#  File:intel/ibt-19-32-1.ddc
+# -Version: BT_HarrisonPeak_REL41522
+# +Version: BT_HarrisonPeak_REL43126
+#  File:intel/ibt-19-32-0.sfi
+# -Version: BT_HarrisonPeak_REL41522
+# +Version: BT_HarrisonPeak_REL43126
+#  File:intel/ibt-19-32-0.ddc
+# -Version: BT_HarrisonPeak_REL41522
+# +Version: BT_HarrisonPeak_REL43126
+#  File:intel/ibt-19-32-4.sfi
+# -Version: BT_HarrisonPeak_REL41522
+# +Version: BT_HarrisonPeak_REL43126
+#  File:intel/ibt-19-32-4.ddc
+# -Version: BT_HarrisonPeak_REL41522
+# +Version: BT_HarrisonPeak_REL43126
+#  File:intel/ibt-19-240-1.sfi
+# -Version: BT_HarrisonPeak_REL41522
+# +Version: BT_HarrisonPeak_REL43126
+#  File:intel/ibt-19-240-1.ddc
+# -Version: BT_HarrisonPeak_REL41522
+# +Version: BT_HarrisonPeak_REL43126
+#  File:intel/ibt-19-240-4.sfi
+# -Version: BT_HarrisonPeak_REL41522
+# +Version: BT_HarrisonPeak_REL43126
+#  File:intel/ibt-19-240-4.ddc
+# -Version: BT_HarrisonPeak_REL41522
+# +Version: BT_HarrisonPeak_REL43126
+#  File:intel/ibt-0041-0041.sfi
+# -Version: BT_TyphoonPeak_REL41819
+# +Version: BT_TyphoonPeak_REL43435
+#  File:intel/ibt-0041-0041.ddc
+# -Version: BT_TyphoonPeak_REL41819
+# +Version: BT_TyphoonPeak_REL43435
+#  File:intel/ibt-0040-0041.sfi
+# -Version: BT_Solar_GfP2_REL41819
+# +Version: BT_Solar_GfP2_REL43435
+#  File:intel/ibt-0040-0041.ddc
+# -Version: BT_Solar_GfP2_REL41819
+# +Version: BT_Solar_GfP2_REL43435
+#  File:intel/ibt-1040-0041.sfi
+# -Version: BT_SolarF_GfP2_REL41819
+# +Version: BT_SolarF_GfP2_REL43435
+#  File:intel/ibt-1040-0041.ddc
+# -Version: BT_SolarF_GfP2_REL41819
+# +Version: BT_SolarF_GfP2_REL43435
+#  
+#  File:intel/ibt-0040-1020.sfi
+# -Version: BT_Solar_JfP1_REL41819
+# +Version: BT_Solar_JfP1_REL43435
+#  File:intel/ibt-0040-1020.ddc
+# -Version: BT_Solar_JfP1_REL41819
+# +Version: BT_Solar_JfP1_REL43435
+#  File:intel/ibt-1040-1020.sfi
+# -Version: BT_SolarF_JfP1_REL41819
+# +Version: BT_SolarF_JfP1_REL43435
+#  File:intel/ibt-1040-1020.ddc
+# -Version: BT_SolarF_JfP1_REL41819
+# +Version: BT_SolarF_JfP1_REL43435
+#  
+#  File:intel/ibt-0040-2120.sfi
+# -Version: BT_Solar_JfP2_REL41819
+# +Version: BT_Solar_JfP2_REL43435
+#  File:intel/ibt-0040-2120.ddc
+# -Version: BT_Solar_JfP2_REL41819
+# +Version: BT_Solar_JfP2_REL43435
+#  File:intel/ibt-1040-2120.sfi
+# -Version: BT_SolarF_JfP2_REL41819
+# +Version: BT_SolarF_JfP2_REL43435
+#  File:intel/ibt-1040-2120.ddc
+# -Version: BT_SolarF_JfP2_REL41819
+# +Version: BT_SolarF_JfP2_REL43435
+#  
+#  File:intel/ibt-0040-4150.sfi
+# -Version: BT_Solar_HrP2_REL41819
+# +Version: BT_Solar_HrP2_REL43435
+#  File:intel/ibt-0040-4150.ddc
+# -Version: BT_Solar_HrP2_REL41819
+# +Version: BT_Solar_HrP2_REL43435
+#  File:intel/ibt-1040-4150.sfi
+# -Version: BT_SolarF_HrP2_REL41819
+# +Version: BT_SolarF_HrP2_REL43435
+#  File:intel/ibt-1040-4150.ddc
+# -Version: BT_SolarF_HrP2_REL41819
+# +Version: BT_SolarF_HrP2_REL43435
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  
+# @@ -5320,7 +5269,7 @@
+#  File: atmel/wilc1000_p2p_fw.bin
+#  File: atmel/wilc1000_wifi_firmware.bin
+#  File: atmel/wilc1000_wifi_firmware-1.bin
+# -Version: 15.4
+# +Version: 15.6
+#  
+#  License: Redistributable. See LICENSE.atmel for details
+#  
+# @@ -5387,7 +5336,7 @@
+#  File: mediatek/mt8183/scp.img
+#  Version: v2.0.2745
+#  File: mediatek/mt8192/scp.img
+# -Version: v1
+# +Version: v2.0.8537
+#  File: mediatek/mt8195/scp.img
+#  Version: v14454.8.0
+#  
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -133,7 +542,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=385947b278a6646ae4c3d39ba8c9b1bb \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -204,17 +613,14 @@ NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
 PE = "1"
 
-SRC_URI = "\
-  ${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz \
-  file://0001-Makefile-replace-mkdir-by-install.patch \
-"
+SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
 BBCLASSEXTEND = "devupstream:target"
 SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=https;branch=main"
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "376e0b3d7b4f8aaa2abf7f5ab74803dcf14b06b94e3d841b1467cd9a2848255e"
+SRC_URI[sha256sum] = "faf3aedf89530e61f4fa1e8c7303dead9127cc24416945647797d079feb12837"
 
 inherit allarch
 
-- 
2.31.1


--===============1769464633945219999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20220509.tar.xz file://0001-Makefile-replace-mkdir-by-install.patch" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20220610.tar.xz"
packages/all-poky-linux/linux-firmware: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: FILELIST: added "/lib/firmware/ath10k/WCN3990/hw1.0/board-2.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGSIZE changed from 15126516 to 15624208 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: FILELIST: added "/lib/firmware/brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-r0.txt /lib/firmware/brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-a1.txt /lib/firmware/brcm/brcmfmac43430-sdio.starfive,visionfive-v1.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGSIZE changed from 428295 to 428382 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: FILELIST: added "/lib/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGSIZE changed from 656588 to 658472 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: RRECOMMENDS: removed "linux-firmware-iwlwifi-7265-dev"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGSIZE changed from 2412595 to 2396807 (-1%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 16480004 to 16467428 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: FILELIST: removed all items "/lib/firmware/iwlwifi-3160-10.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGSIZE changed from 609892 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: FILELIST: removed all items "/lib/firmware/iwlwifi-3160-12.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGSIZE changed from 683996 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: FILELIST: removed all items "/lib/firmware/iwlwifi-3160-13.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGSIZE changed from 688616 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: FILELIST: removed all items "/lib/firmware/iwlwifi-3160-16.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGSIZE changed from 918212 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: FILELIST: removed all items "/lib/firmware/iwlwifi-3160-7.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGSIZE changed from 670484 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: FILELIST: removed all items "/lib/firmware/iwlwifi-3160-8.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGSIZE changed from 667284 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: FILELIST: removed all items "/lib/firmware/iwlwifi-3160-9.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGSIZE changed from 669872 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: FILELIST: removed "/lib/firmware/iwlwifi-7260-10.ucode /lib/firmware/iwlwifi-7260-8.ucode /lib/firmware/iwlwifi-7260-12.ucode /lib/firmware/iwlwifi-7260-9.ucode /lib/firmware/iwlwifi-7260-7.ucode /lib/firmware/iwlwifi-7260-16.ucode /lib/firmware/iwlwifi-7260-13.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGSIZE changed from 6383720 to 1049340 (-84%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: FILELIST: removed "/lib/firmware/iwlwifi-7265-8.ucode /lib/firmware/iwlwifi-7265-16.ucode /lib/firmware/iwlwifi-7265-13.ucode /lib/firmware/iwlwifi-7265-9.ucode /lib/firmware/iwlwifi-7265-10.ucode /lib/firmware/iwlwifi-7265-12.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGSIZE changed from 6251720 to 1180412 (-81%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: FILELIST: removed "/lib/firmware/iwlwifi-7265D-16.ucode /lib/firmware/iwlwifi-7265D-13.ucode /lib/firmware/iwlwifi-7265D-12.ucode /lib/firmware/iwlwifi-7265D-10.ucode /lib/firmware/iwlwifi-7265D-21.ucode /lib/firmware/iwlwifi-7265D-17.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGSIZE changed from 9262873 to 3097888 (-67%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: RDEPENDS: removed "linux-firmware-iwlwifi-7265"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: FILELIST: removed "/lib/firmware/iwlwifi-8000C-16.ucode /lib/firmware/iwlwifi-8000C-13.ucode /lib/firmware/iwlwifi-8000C-21.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGSIZE changed from 18026112 to 11535240 (-36%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: FILELIST: removed "/lib/firmware/iwlwifi-8265-21.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGSIZE changed from 13620996 to 11231028 (-18%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGSIZE changed from 14515680 to 14514260 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: removed "/lib/firmware/iwlwifi-3168-21.ucode", added "/lib/firmware/iwlwifi-cc-a0-73.ucode /lib/firmware/iwlwifi-so-a0-jf-b0-73.ucode /lib/firmware/iwlwifi-so-a0-gf-a0-73.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-73.ucode /lib/firmware/iwlwifi-so-a0-gf4-a0-73.ucode /lib/firmware/iwlwifi-QuZ-a0-jf-b0-73.ucode /lib/firmware/iwlwifi-so-a0-hr-b0-73.ucode /lib/firmware/iwlwifi-Qu-c0-hr-b0-73.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-73.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0-73.ucode /lib/firmware/iwlwifi-ty-a0-gf-a0-73.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-73.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 143367116 to 158823060 (+11%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 194062 to 193633 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20220509" to "20220610"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20220509 [default] to 20220610 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 288587850 to 288780846 (+0%)
Changes to packages/all-poky-linux/linux-firmware (sysroot):
  /lib/firmware/ath10k/WCN3990/hw1.0/board-2.bin was added
  /lib/firmware/brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-a1.txt was added
  /lib/firmware/brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-r0.txt was added
  /lib/firmware/brcm/brcmfmac43430-sdio.starfive,visionfive-v1.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt was added
  /lib/firmware/iwlwifi-cc-a0-73.ucode was added
  /lib/firmware/iwlwifi-Qu-b0-hr-b0-73.ucode was added
  /lib/firmware/iwlwifi-Qu-b0-jf-b0-73.ucode was added
  /lib/firmware/iwlwifi-Qu-c0-hr-b0-73.ucode was added
  /lib/firmware/iwlwifi-Qu-c0-jf-b0-73.ucode was added
  /lib/firmware/iwlwifi-QuZ-a0-hr-b0-73.ucode was added
  /lib/firmware/iwlwifi-QuZ-a0-jf-b0-73.ucode was added
  /lib/firmware/iwlwifi-so-a0-gf4-a0-73.ucode was added
  /lib/firmware/iwlwifi-so-a0-gf-a0-73.ucode was added
  /lib/firmware/iwlwifi-so-a0-hr-b0-73.ucode was added
  /lib/firmware/iwlwifi-so-a0-jf-b0-73.ucode was added
  /lib/firmware/iwlwifi-ty-a0-gf-a0-73.ucode was added
  /lib/firmware/iwlwifi-3160-10.ucode was removed
  /lib/firmware/iwlwifi-3160-12.ucode was removed
  /lib/firmware/iwlwifi-3160-13.ucode was removed
  /lib/firmware/iwlwifi-3160-16.ucode was removed
  /lib/firmware/iwlwifi-3160-7.ucode was removed
  /lib/firmware/iwlwifi-3160-8.ucode was removed
  /lib/firmware/iwlwifi-3160-9.ucode was removed
  /lib/firmware/iwlwifi-3168-21.ucode was removed
  /lib/firmware/iwlwifi-7260-10.ucode was removed
  /lib/firmware/iwlwifi-7260-12.ucode was removed
  /lib/firmware/iwlwifi-7260-13.ucode was removed
  /lib/firmware/iwlwifi-7260-16.ucode was removed
  /lib/firmware/iwlwifi-7260-7.ucode was removed
  /lib/firmware/iwlwifi-7260-8.ucode was removed
  /lib/firmware/iwlwifi-7260-9.ucode was removed
  /lib/firmware/iwlwifi-7265-10.ucode was removed
  /lib/firmware/iwlwifi-7265-12.ucode was removed
  /lib/firmware/iwlwifi-7265-13.ucode was removed
  /lib/firmware/iwlwifi-7265-16.ucode was removed
  /lib/firmware/iwlwifi-7265-8.ucode was removed
  /lib/firmware/iwlwifi-7265-9.ucode was removed
  /lib/firmware/iwlwifi-7265D-10.ucode was removed
  /lib/firmware/iwlwifi-7265D-12.ucode was removed
  /lib/firmware/iwlwifi-7265D-13.ucode was removed
  /lib/firmware/iwlwifi-7265D-16.ucode was removed
  /lib/firmware/iwlwifi-7265D-17.ucode was removed
  /lib/firmware/iwlwifi-7265D-21.ucode was removed
  /lib/firmware/iwlwifi-8000C-13.ucode was removed
  /lib/firmware/iwlwifi-8000C-16.ucode was removed
  /lib/firmware/iwlwifi-8000C-21.ucode was removed
  /lib/firmware/iwlwifi-8265-21.ucode was removed

--===============1769464633945219999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: FILELIST: added "/lib/firmware/ath10k/WCN3990/hw1.0/board-2.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: FILELIST: added "/lib/firmware/brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-r0.txt /lib/firmware/brcm/brcmfmac43430-sdio.starfive,visionfive-v1.txt /lib/firmware/brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-a1.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: FILELIST: added "/lib/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: RRECOMMENDS: removed "linux-firmware-iwlwifi-7265-dev"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: FILELIST: removed all items "/lib/firmware/iwlwifi-3160-10.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGSIZE changed from 609892 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: FILELIST: removed all items "/lib/firmware/iwlwifi-3160-12.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGSIZE changed from 683996 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: FILELIST: removed all items "/lib/firmware/iwlwifi-3160-13.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGSIZE changed from 688616 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: FILELIST: removed all items "/lib/firmware/iwlwifi-3160-16.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGSIZE changed from 918212 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: FILELIST: removed all items "/lib/firmware/iwlwifi-3160-7.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGSIZE changed from 670484 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: FILELIST: removed all items "/lib/firmware/iwlwifi-3160-8.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGSIZE changed from 667284 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: FILELIST: removed all items "/lib/firmware/iwlwifi-3160-9.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGSIZE changed from 669872 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: FILELIST: removed "/lib/firmware/iwlwifi-7260-12.ucode /lib/firmware/iwlwifi-7260-10.ucode /lib/firmware/iwlwifi-7260-9.ucode /lib/firmware/iwlwifi-7260-16.ucode /lib/firmware/iwlwifi-7260-7.ucode /lib/firmware/iwlwifi-7260-8.ucode /lib/firmware/iwlwifi-7260-13.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGSIZE changed from 6383720 to 1049340 (-84%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: FILELIST: removed "/lib/firmware/iwlwifi-7265-9.ucode /lib/firmware/iwlwifi-7265-16.ucode /lib/firmware/iwlwifi-7265-10.ucode /lib/firmware/iwlwifi-7265-12.ucode /lib/firmware/iwlwifi-7265-8.ucode /lib/firmware/iwlwifi-7265-13.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGSIZE changed from 6251720 to 1180412 (-81%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: RDEPENDS: removed "linux-firmware-iwlwifi-7265"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: FILELIST: removed "/lib/firmware/iwlwifi-7265D-21.ucode /lib/firmware/iwlwifi-7265D-13.ucode /lib/firmware/iwlwifi-7265D-10.ucode /lib/firmware/iwlwifi-7265D-16.ucode /lib/firmware/iwlwifi-7265D-17.ucode /lib/firmware/iwlwifi-7265D-12.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGSIZE changed from 9262873 to 3097888 (-67%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: FILELIST: removed "/lib/firmware/iwlwifi-8000C-13.ucode /lib/firmware/iwlwifi-8000C-16.ucode /lib/firmware/iwlwifi-8000C-21.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGSIZE changed from 18026112 to 11535240 (-36%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: FILELIST: removed "/lib/firmware/iwlwifi-8265-21.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGSIZE changed from 13620996 to 11231028 (-18%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: removed "/lib/firmware/iwlwifi-3168-21.ucode", added "/lib/firmware/iwlwifi-QuZ-a0-jf-b0-73.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-73.ucode /lib/firmware/iwlwifi-so-a0-hr-b0-73.ucode /lib/firmware/iwlwifi-so-a0-gf-a0-73.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0-73.ucode /lib/firmware/iwlwifi-so-a0-jf-b0-73.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-73.ucode /lib/firmware/iwlwifi-cc-a0-73.ucode /lib/firmware/iwlwifi-Qu-c0-hr-b0-73.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-73.ucode /lib/firmware/iwlwifi-ty-a0-gf-a0-73.ucode /lib/firmware/iwlwifi-so-a0-gf4-a0-73.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 143367116 to 158823060 (+11%)
Changes to packages/all-poky-linux/linux-firmware (sysroot):
  /lib/firmware/ath10k/WCN3990/hw1.0/board-2.bin was added
  /lib/firmware/brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-a1.txt was added
  /lib/firmware/brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-r0.txt was added
  /lib/firmware/brcm/brcmfmac43430-sdio.starfive,visionfive-v1.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt was added
  /lib/firmware/iwlwifi-cc-a0-73.ucode was added
  /lib/firmware/iwlwifi-Qu-b0-hr-b0-73.ucode was added
  /lib/firmware/iwlwifi-Qu-b0-jf-b0-73.ucode was added
  /lib/firmware/iwlwifi-Qu-c0-hr-b0-73.ucode was added
  /lib/firmware/iwlwifi-Qu-c0-jf-b0-73.ucode was added
  /lib/firmware/iwlwifi-QuZ-a0-hr-b0-73.ucode was added
  /lib/firmware/iwlwifi-QuZ-a0-jf-b0-73.ucode was added
  /lib/firmware/iwlwifi-so-a0-gf4-a0-73.ucode was added
  /lib/firmware/iwlwifi-so-a0-gf-a0-73.ucode was added
  /lib/firmware/iwlwifi-so-a0-hr-b0-73.ucode was added
  /lib/firmware/iwlwifi-so-a0-jf-b0-73.ucode was added
  /lib/firmware/iwlwifi-ty-a0-gf-a0-73.ucode was added
  /lib/firmware/iwlwifi-3160-10.ucode was removed
  /lib/firmware/iwlwifi-3160-12.ucode was removed
  /lib/firmware/iwlwifi-3160-13.ucode was removed
  /lib/firmware/iwlwifi-3160-16.ucode was removed
  /lib/firmware/iwlwifi-3160-7.ucode was removed
  /lib/firmware/iwlwifi-3160-8.ucode was removed
  /lib/firmware/iwlwifi-3160-9.ucode was removed
  /lib/firmware/iwlwifi-3168-21.ucode was removed
  /lib/firmware/iwlwifi-7260-10.ucode was removed
  /lib/firmware/iwlwifi-7260-12.ucode was removed
  /lib/firmware/iwlwifi-7260-13.ucode was removed
  /lib/firmware/iwlwifi-7260-16.ucode was removed
  /lib/firmware/iwlwifi-7260-7.ucode was removed
  /lib/firmware/iwlwifi-7260-8.ucode was removed
  /lib/firmware/iwlwifi-7260-9.ucode was removed
  /lib/firmware/iwlwifi-7265-10.ucode was removed
  /lib/firmware/iwlwifi-7265-12.ucode was removed
  /lib/firmware/iwlwifi-7265-13.ucode was removed
  /lib/firmware/iwlwifi-7265-16.ucode was removed
  /lib/firmware/iwlwifi-7265-8.ucode was removed
  /lib/firmware/iwlwifi-7265-9.ucode was removed
  /lib/firmware/iwlwifi-7265D-10.ucode was removed
  /lib/firmware/iwlwifi-7265D-12.ucode was removed
  /lib/firmware/iwlwifi-7265D-13.ucode was removed
  /lib/firmware/iwlwifi-7265D-16.ucode was removed
  /lib/firmware/iwlwifi-7265D-17.ucode was removed
  /lib/firmware/iwlwifi-7265D-21.ucode was removed
  /lib/firmware/iwlwifi-8000C-13.ucode was removed
  /lib/firmware/iwlwifi-8000C-16.ucode was removed
  /lib/firmware/iwlwifi-8000C-21.ucode was removed
  /lib/firmware/iwlwifi-8265-21.ucode was removed

--===============1769464633945219999==--

