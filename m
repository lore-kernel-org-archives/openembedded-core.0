Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36495.1795585774376365023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=j96//uWe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1qffQk1Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a211409000-a3f1c471-9cf5-47cd-aff1-ab0b9a04e95c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795585773;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4FlYshaiwkbw/+LFyyJ55I+sV5foSOJCfKk+yuH0uD4=;
	b=j96//uWenjZIzmdIhXQyCrTtYuPyVFwi/1v1VHg1vHLh6Q5ri8TYGRyWofAyi9hr
	8XVqKYu0gsMa5wrXgoQtlZqZ4wKEh/NN+38Ys5bMjdpiWmRk3mfm8zH4vjxlqX0E7t7
	Y/XZV2d5RxQBWOi+QDs0Zo0M5upPOM5UMmCL65zk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795585773;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4FlYshaiwkbw/+LFyyJ55I+sV5foSOJCfKk+yuH0uD4=;
	b=1qffQk1Z1CF9c3I9ed2VX6qorKngNp9jeyb+dYIftiRt2D1XP2mAt9TSarFF8KUk
	6V6ojy78yH0MPY5AkMepvU8BOeUnLyrOVTAIZKUFvZjJA5f8bMl9JUiiT1/v+Za1/vE
	hcDDhi+eNS5GLBffhmpkiv+CC4avME5XbVnTYsbU=
Content-Type: multipart/mixed; boundary="===============7172860586474665489=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20261124 FAILED
Message-ID: <010101a211409000-a3f1c471-9cf5-47cd-aff1-ab0b9a04e95c-000000@us-west-2.amazonses.com>
Date: Wed, 25 Nov 2026 05:49:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.25-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251159

--===============7172860586474665489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *linux-firmware* to *20261124* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20261019-20261124.patch
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
From a812da8134e5fd7912e492c9c2a924f7b0c51213 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 25 Nov 2026 05:49:24 +0000
Subject: [PATCH] linux-firmware: upgrade 20261019 -> 20261124

---
 ...20261019.bb => linux-firmware_20261124.bb} | 1555 ++++++++++++++++-
 1 file changed, 1553 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20261019.bb => linux-firmware_20261124.bb} (70%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb
similarity index 70%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb
index 01341a81ff..f767bd002b 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20261019.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb
@@ -1,3 +1,1554 @@
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
+# @@ -959,31 +959,31 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-cc-a0-77.ucode
+#  Link: iwlwifi-cc-a0-77.ucode -> intel/iwlwifi/iwlwifi-cc-a0-77.ucode
+# -Version: 74.563a6e92.0
+# +Version: 74.3cda2a2c.0
+#  
+#  File: intel/iwlwifi/iwlwifi-Qu-b0-hr-b0-77.ucode
+#  Link: iwlwifi-Qu-b0-hr-b0-77.ucode -> intel/iwlwifi/iwlwifi-Qu-b0-hr-b0-77.ucode
+# -Version: 74.563a6e92.0
+# +Version: 74.3cda2a2c.0
+#  
+#  File: intel/iwlwifi/iwlwifi-Qu-b0-jf-b0-77.ucode
+#  Link: iwlwifi-Qu-b0-jf-b0-77.ucode -> intel/iwlwifi/iwlwifi-Qu-b0-jf-b0-77.ucode
+# -Version: 74.563a6e92.0
+# +Version: 74.3cda2a2c.0
+#  
+#  File: intel/iwlwifi/iwlwifi-Qu-c0-hr-b0-77.ucode
+#  Link: iwlwifi-Qu-c0-hr-b0-77.ucode -> intel/iwlwifi/iwlwifi-Qu-c0-hr-b0-77.ucode
+# -Version: 74.563a6e92.0
+# +Version: 74.3cda2a2c.0
+#  
+#  File: intel/iwlwifi/iwlwifi-Qu-c0-jf-b0-77.ucode
+#  Link: iwlwifi-Qu-c0-jf-b0-77.ucode -> intel/iwlwifi/iwlwifi-Qu-c0-jf-b0-77.ucode
+# -Version: 74.563a6e92.0
+# +Version: 74.3cda2a2c.0
+#  
+#  File: intel/iwlwifi/iwlwifi-QuZ-a0-hr-b0-77.ucode
+#  Link: iwlwifi-QuZ-a0-hr-b0-77.ucode -> intel/iwlwifi/iwlwifi-QuZ-a0-hr-b0-77.ucode
+# -Version: 74.563a6e92.0
+# +Version: 74.3cda2a2c.0
+#  
+#  File: intel/iwlwifi/iwlwifi-QuZ-a0-jf-b0-77.ucode
+#  Link: iwlwifi-QuZ-a0-jf-b0-77.ucode -> intel/iwlwifi/iwlwifi-QuZ-a0-jf-b0-77.ucode
+# -Version: 74.563a6e92.0
+# +Version: 74.3cda2a2c.0
+#  
+#  File: intel/iwlwifi/iwlwifi-ty-a0-gf-a0-77.ucode
+#  Link: iwlwifi-ty-a0-gf-a0-77.ucode -> intel/iwlwifi/iwlwifi-ty-a0-gf-a0-77.ucode
+# @@ -1015,7 +1015,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-ty-a0-gf-a0-89.ucode
+#  Link: iwlwifi-ty-a0-gf-a0-89.ucode -> intel/iwlwifi/iwlwifi-ty-a0-gf-a0-89.ucode
+# -Version: 86.b20dcd1f.0
+# +Version: 86.a67023b2.0
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-gf4-a0-77.ucode
+#  Link: iwlwifi-so-a0-gf4-a0-77.ucode -> intel/iwlwifi/iwlwifi-so-a0-gf4-a0-77.ucode
+# @@ -1047,7 +1047,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-gf4-a0-89.ucode
+#  Link: iwlwifi-so-a0-gf4-a0-89.ucode -> intel/iwlwifi/iwlwifi-so-a0-gf4-a0-89.ucode
+# -Version: 86.b20dcd1f.0
+# +Version: 86.a67023b2.0
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-gf-a0-77.ucode
+#  Link: iwlwifi-so-a0-gf-a0-77.ucode -> intel/iwlwifi/iwlwifi-so-a0-gf-a0-77.ucode
+# @@ -1079,7 +1079,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-gf-a0-89.ucode
+#  Link: iwlwifi-so-a0-gf-a0-89.ucode -> intel/iwlwifi/iwlwifi-so-a0-gf-a0-89.ucode
+# -Version: 86.b20dcd1f.0
+# +Version: 86.a67023b2.0
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-hr-b0-77.ucode
+#  Link: iwlwifi-so-a0-hr-b0-77.ucode -> intel/iwlwifi/iwlwifi-so-a0-hr-b0-77.ucode
+# @@ -1107,11 +1107,11 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-hr-b0-89.ucode
+#  Link: iwlwifi-so-a0-hr-b0-89.ucode -> intel/iwlwifi/iwlwifi-so-a0-hr-b0-89.ucode
+# -Version: 86.b20dcd1f.0
+# +Version: 86.a67023b2.0
+#  
+#  File: intel/iwlwifi/iwlwifi-so-a0-jf-b0-77.ucode
+#  Link: iwlwifi-so-a0-jf-b0-77.ucode -> intel/iwlwifi/iwlwifi-so-a0-jf-b0-77.ucode
+# -Version: 74.f92b5fed.0
+# +Version: 74.3cda2a2c.0
+#  
+#  File: intel/iwlwifi/iwlwifi-ty-a0-gf-a0.pnvm
+#  Link: iwlwifi-ty-a0-gf-a0.pnvm -> intel/iwlwifi/iwlwifi-ty-a0-gf-a0.pnvm
+# @@ -1130,7 +1130,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-bz-b0-hr-b0-100.ucode
+#  Link: iwlwifi-bz-b0-hr-b0-100.ucode -> intel/iwlwifi/iwlwifi-bz-b0-hr-b0-100.ucode
+# -Version: 97.5850a0c2.0
+# +Version: 97.25f6c331.0
+#  
+#  File: intel/iwlwifi/iwlwifi-bz-b0-hr-b0.pnvm
+#  Link: iwlwifi-bz-b0-hr-b0.pnvm -> intel/iwlwifi/iwlwifi-bz-b0-hr-b0.pnvm
+# @@ -1157,7 +1157,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-bz-b0-gf-a0-100.ucode
+#  Link: iwlwifi-bz-b0-gf-a0-100.ucode -> intel/iwlwifi/iwlwifi-bz-b0-gf-a0-100.ucode
+# -Version: 97.5850a0c2.0
+# +Version: 97.25f6c331.0
+#  
+#  File: intel/iwlwifi/iwlwifi-bz-b0-gf-a0.pnvm
+#  Link: iwlwifi-bz-b0-gf-a0.pnvm -> intel/iwlwifi/iwlwifi-bz-b0-gf-a0.pnvm
+# @@ -1218,6 +1218,10 @@
+#  Link: iwlwifi-gl-c0-fm-c0-c108.ucode -> intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c108.ucode
+#  Version: 108.45105872.0
+#  
+# +File: intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c109.ucode
+# +Link: iwlwifi-gl-c0-fm-c0-c109.ucode -> intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c109.ucode
+# +Version: 109.b165461c.0
+# +
+#  File: intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c101.ucode
+#  Link: iwlwifi-gl-c0-fm-c0-c101.ucode -> intel/iwlwifi/iwlwifi-gl-c0-fm-c0-c101.ucode
+#  Version: 101.6e695a70.0
+# @@ -1279,7 +1283,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c107.ucode
+#  Link: iwlwifi-bz-b0-fm-c0-c107.ucode -> intel/iwlwifi/iwlwifi-bz-b0-fm-c0-c107.ucode
+# -Version: 107.b2a0d4b2k.0
+# +Version: 107.15d0f7d3k.0
+#  
+#  File: intel/iwlwifi/iwlwifi-bz-b0-fm-c0.pnvm
+#  Link: iwlwifi-bz-b0-fm-c0.pnvm -> intel/iwlwifi/iwlwifi-bz-b0-fm-c0.pnvm
+# @@ -1294,7 +1298,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-gf-a0-89.ucode
+#  Link: iwlwifi-ma-b0-gf-a0-89.ucode -> intel/iwlwifi/iwlwifi-ma-b0-gf-a0-89.ucode
+# -Version: 86.b20dcd1f.0
+# +Version: 86.a67023b2.0
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-gf-a0.pnvm
+#  Link: iwlwifi-ma-b0-gf-a0.pnvm -> intel/iwlwifi/iwlwifi-ma-b0-gf-a0.pnvm
+# @@ -1309,7 +1313,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-gf4-a0-89.ucode
+#  Link: iwlwifi-ma-b0-gf4-a0-89.ucode -> intel/iwlwifi/iwlwifi-ma-b0-gf4-a0-89.ucode
+# -Version: 86.b20dcd1f.0
+# +Version: 86.a67023b2.0
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-gf4-a0.pnvm
+#  Link: iwlwifi-ma-b0-gf4-a0.pnvm -> intel/iwlwifi/iwlwifi-ma-b0-gf4-a0.pnvm
+# @@ -1324,7 +1328,7 @@
+#  
+#  File: intel/iwlwifi/iwlwifi-ma-b0-hr-b0-89.ucode
+#  Link: iwlwifi-ma-b0-hr-b0-89.ucode -> intel/iwlwifi/iwlwifi-ma-b0-hr-b0-89.ucode
+# -Version: 86.b20dcd1f.0
+# +Version: 86.a67023b2.0
+#  
+#  File: intel/iwlwifi/iwlwifi-sc-a0-wh-b0-101.ucode
+#  Link: iwlwifi-sc-a0-wh-b0-101.ucode -> intel/iwlwifi/iwlwifi-sc-a0-wh-b0-101.ucode
+# @@ -1346,17 +1350,21 @@
+#  Link: iwlwifi-sc-a0-wh-b0-c108.ucode -> intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c108.ucode
+#  Version: 108.45105872.0
+#  
+# +File: intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c109.ucode
+# +Link: iwlwifi-sc-a0-wh-b0-c109.ucode -> intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c109.ucode
+# +Version: 109.b165461c.0
+# +
+#  File: intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c101.ucode
+#  Link: iwlwifi-sc-a0-wh-b0-c101.ucode -> intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c101.ucode
+#  Version: 101.6e695a70.0
+#  
+#  File: intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c102.ucode
+#  Link: iwlwifi-sc-a0-wh-b0-c102.ucode -> intel/iwlwifi/iwlwifi-sc-a0-wh-b0-c102.ucode
+# -Version: 102.07fca168.0
+# +Version: 102.651bbed6.0
+#  
+#  File: intel/iwlwifi/iwlwifi-sc-a0-gf-a0-100.ucode
+#  Link: iwlwifi-sc-a0-gf-a0-100.ucode -> intel/iwlwifi/iwlwifi-sc-a0-gf-a0-100.ucode
+# -Version: 97.5850a0c2.0
+# +Version: 97.25f6c331.0
+#  
+#  File: intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c101.ucode
+#  Link: iwlwifi-sc-a0-fm-c0-c101.ucode -> intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c101.ucode
+# @@ -1382,6 +1390,10 @@
+#  Link: iwlwifi-sc-a0-fm-c0-c108.ucode -> intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c108.ucode
+#  Version: 108.45105872.0
+#  
+# +File: intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c109.ucode
+# +Link: iwlwifi-sc-a0-fm-c0-c109.ucode -> intel/iwlwifi/iwlwifi-sc-a0-fm-c0-c109.ucode
+# +Version: 109.b165461c.0
+# +
+#  File: intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c102.ucode
+#  Link: iwlwifi-bz-b0-wh-b0-c102.ucode -> intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c102.ucode
+#  Version: 102.07fca168.0
+# @@ -1398,9 +1410,25 @@
+#  Link: iwlwifi-bz-b0-wh-b0-c107.ucode -> intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c107.ucode
+#  Version: 107.1b444747.0
+#  
+# +File: intel/iwlwifi/iwlwifi-sc2-a0-wh-b0-c107.ucode
+# +Link: iwlwifi-sc2-a0-wh-b0-c107.ucode -> intel/iwlwifi/iwlwifi-sc2-a0-wh-b0-c107.ucode
+# +Version: 107.b9e887a2.0
+# +
+#  File: intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c108.ucode
+#  Link: iwlwifi-bz-b0-wh-b0-c108.ucode -> intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c108.ucode
+#  Version: 108.45105872.0
+# +
+# +File: intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c109.ucode
+# +Link: iwlwifi-bz-b0-wh-b0-c109.ucode -> intel/iwlwifi/iwlwifi-bz-b0-wh-b0-c109.ucode
+# +Version: 109.b165461c.0
+# +
+# +File: intel/iwlwifi/iwlwifi-sc2-a0-wh-b0-c108.ucode
+# +Link: iwlwifi-sc2-a0-wh-b0-c108.ucode -> intel/iwlwifi/iwlwifi-sc2-a0-wh-b0-c108.ucode
+# +Version: 108.45105872.0
+# +
+# +File: intel/iwlwifi/iwlwifi-sc2-a0-wh-b0-c109.ucode
+# +Link: iwlwifi-sc2-a0-wh-b0-c109.ucode -> intel/iwlwifi/iwlwifi-sc2-a0-wh-b0-c109.ucode
+# +Version: 109.b165461c.0
+#  
+#  Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
+#  SPDX-License-Identifier: LicenseRef-LICENCE.iwlwifi_firmware
+# @@ -1435,7 +1463,7 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# -Driver: intel-ipu6-isys - Intel IPU6 (Image Processing Unit 6) driver
+# +Driver: intel-ipu6 - Intel IPU6 (Image Processing Unit 6) driver
+#  
+#  File: intel/ipu/ipu6epadln_fw.bin
+#  File: intel/ipu/ipu6ep_fw.bin
+# @@ -1449,15 +1477,14 @@
+#  Licence: Redistributable. See LICENSE.ivsc for details
+#  SPDX-License-Identifier: LicenseRef-LICENSE.ivsc
+#  
+# ---------------------------------------------------------------------------
+# -
+# -Driver: intel-ipu7-isys - Intel IPU7 (Image Processing Unit 7) driver
+# -
+#  File: intel/ipu/ipu7_fw.bin
+#  Version: master_release_20240628_1854
+#  
+#  File: intel/ipu/ipu7ptl_fw.bin
+#  Version: 1.2.1.20251215_224531
+# +
+# +File: intel/ipu/ipu8_fw.bin
+# +Version: 1.0.15.20260909_223533
+#  
+#  Licence: Redistributable. See LICENSE.intel for details
+#  SPDX-License-Identifier: LicenseRef-LICENSE.intel
+# @@ -2217,6 +2244,23 @@
+#  
+#  Licence: Redistributable. See LICENSE.airoha for details.
+#  SPDX-License-Identifier: LicenseRef-LICENSE.airoha
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: aw88399 - awinic SmartK AMP driver.
+# +
+# +File: awinic/aw88399_acf_17aa3906.bin
+# +File: awinic/aw88399_acf_17aa3907.bin
+# +File: awinic/aw88399_acf_17aa3927.bin
+# +File: awinic/aw88399_acf_17aa3928.bin
+# +File: awinic/aw88399_acf_17aa3936.bin
+# +File: awinic/aw88399_acf_17aa3937.bin
+# +File: awinic/aw88399_acf_17aa3938.bin
+# +File: awinic/aw88399_acf_17aa3939.bin
+# +
+# +Version: 1.0
+# +
+# +License: Redistributable. See LICENSE.awinic for details.
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -2790,20 +2834,48 @@
+#  File: amdgpu/gc_11_5_3_mes_2.bin
+#  File: amdgpu/gc_11_5_3_pfp.bin
+#  File: amdgpu/gc_11_5_3_rlc.bin
+# -File: amdgpu/gc_11_7_0_imu.bin
+# +File: amdgpu/gc_11_7_0_imu_p.bin
+# +Link: amdgpu/gc_11_7_0_imu.bin -> gc_11_7_0_imu_p.bin
+# +Link: amdgpu/gc_11_7_0_imu_l.bin -> gc_11_7_0_imu_p.bin
+#  File: amdgpu/gc_11_7_0_me.bin
+# +File: amdgpu/gc_11_7_0_me_l.bin
+# +File: amdgpu/gc_11_7_0_me_p.bin
+#  File: amdgpu/gc_11_7_0_mec.bin
+# +File: amdgpu/gc_11_7_0_mec_l.bin
+# +File: amdgpu/gc_11_7_0_mec_p.bin
+#  File: amdgpu/gc_11_7_0_mes1.bin
+# +File: amdgpu/gc_11_7_0_mes1_l.bin
+# +File: amdgpu/gc_11_7_0_mes1_p.bin
+#  File: amdgpu/gc_11_7_0_mes_2.bin
+# +File: amdgpu/gc_11_7_0_mes_2_l.bin
+# +File: amdgpu/gc_11_7_0_mes_2_p.bin
+#  File: amdgpu/gc_11_7_0_pfp.bin
+# +File: amdgpu/gc_11_7_0_pfp_l.bin
+# +File: amdgpu/gc_11_7_0_pfp_p.bin
+#  File: amdgpu/gc_11_7_0_rlc.bin
+# -File: amdgpu/gc_11_7_1_imu.bin
+# +File: amdgpu/gc_11_7_0_rlc_l.bin
+# +File: amdgpu/gc_11_7_0_rlc_p.bin
+# +File: amdgpu/gc_11_7_1_imu_p.bin
+# +Link: amdgpu/gc_11_7_1_imu.bin -> gc_11_7_1_imu_p.bin
+# +Link: amdgpu/gc_11_7_1_imu_l.bin -> gc_11_7_1_imu_p.bin
+#  File: amdgpu/gc_11_7_1_me.bin
+# +File: amdgpu/gc_11_7_1_me_l.bin
+# +File: amdgpu/gc_11_7_1_me_p.bin
+#  File: amdgpu/gc_11_7_1_mec.bin
+# +File: amdgpu/gc_11_7_1_mec_l.bin
+# +File: amdgpu/gc_11_7_1_mec_p.bin
+#  File: amdgpu/gc_11_7_1_mes1.bin
+# +File: amdgpu/gc_11_7_1_mes1_l.bin
+# +File: amdgpu/gc_11_7_1_mes1_p.bin
+#  File: amdgpu/gc_11_7_1_mes_2.bin
+# +File: amdgpu/gc_11_7_1_mes_2_l.bin
+# +File: amdgpu/gc_11_7_1_mes_2_p.bin
+#  File: amdgpu/gc_11_7_1_pfp.bin
+# +File: amdgpu/gc_11_7_1_pfp_l.bin
+# +File: amdgpu/gc_11_7_1_pfp_p.bin
+#  File: amdgpu/gc_11_7_1_rlc.bin
+# +File: amdgpu/gc_11_7_1_rlc_l.bin
+# +File: amdgpu/gc_11_7_1_rlc_p.bin
+#  File: amdgpu/gc_12_0_0_imu.bin
+#  File: amdgpu/gc_12_0_0_me.bin
+#  File: amdgpu/gc_12_0_0_mec.bin
+# @@ -2834,6 +2906,8 @@
+#  File: amdgpu/dcn_3_6_dmcub.bin
+#  File: amdgpu/dcn_4_0_1_dmcub.bin
+#  File: amdgpu/dcn_4_2_dmcub.bin
+# +File: amdgpu/dcn_4_2_dmcub_l.bin
+# +File: amdgpu/dcn_4_2_dmcub_p.bin
+#  File: amdgpu/psp_13_0_0_sos.bin
+#  File: amdgpu/psp_13_0_0_sos_kicker.bin
+#  File: amdgpu/psp_13_0_0_ta.bin
+# @@ -2875,9 +2949,17 @@
+#  File: amdgpu/psp_14_0_5_ta.bin
+#  File: amdgpu/psp_14_0_5_toc.bin
+#  File: amdgpu/psp_15_0_0_ta.bin
+# +File: amdgpu/psp_15_0_0_ta_l.bin
+# +File: amdgpu/psp_15_0_0_ta_p.bin
+#  File: amdgpu/psp_15_0_0_toc.bin
+# +File: amdgpu/psp_15_0_0_toc_l.bin
+# +File: amdgpu/psp_15_0_0_toc_p.bin
+#  File: amdgpu/psp_15_0_9_ta.bin
+# +File: amdgpu/psp_15_0_9_ta_l.bin
+# +File: amdgpu/psp_15_0_9_ta_p.bin
+#  File: amdgpu/psp_15_0_9_toc.bin
+# +File: amdgpu/psp_15_0_9_toc_l.bin
+# +File: amdgpu/psp_15_0_9_toc_p.bin
+#  File: amdgpu/sdma_4_4_2.bin
+#  File: amdgpu/sdma_4_4_4.bin
+#  File: amdgpu/sdma_4_4_5.bin
+# @@ -2892,6 +2974,8 @@
+#  File: amdgpu/sdma_6_1_2.bin
+#  File: amdgpu/sdma_6_1_3.bin
+#  File: amdgpu/sdma_6_1_4.bin
+# +File: amdgpu/sdma_6_1_4_l.bin
+# +File: amdgpu/sdma_6_1_4_p.bin
+#  File: amdgpu/sdma_7_0_0.bin
+#  File: amdgpu/sdma_7_0_1.bin
+#  File: amdgpu/smu_13_0_0.bin
+# @@ -2916,7 +3000,11 @@
+#  File: amdgpu/vcn_5_0_0.bin
+#  File: amdgpu/vcn_5_0_1.bin
+#  File: amdgpu/vcn_5_3_0.bin
+# +File: amdgpu/vcn_5_3_0_l.bin
+# +File: amdgpu/vcn_5_3_0_p.bin
+#  File: amdgpu/vpe_2_0_0.bin
+# +File: amdgpu/vpe_2_0_0_l.bin
+# +File: amdgpu/vpe_2_0_0_p.bin
+#  File: amdgpu/vpe_6_1_0.bin
+#  File: amdgpu/vpe_6_1_1.bin
+#  File: amdgpu/vpe_6_1_3.bin
+# @@ -2952,9 +3040,56 @@
+#  Link: amdtee/amd_pmf_v3.bin -> 773bd96f-b83f-4d52-b12dc529b13d8543.bin
+#  File: amdtee/f29bb3d9-bd66-5441-afb88acc2b2b60d6.bin
+#  Link: amdtee/amd_pmf_v3_1.bin -> f29bb3d9-bd66-5441-afb88acc2b2b60d6.bin
+# +File: amdtee/64ad1cf5-14ea-8947-b6ae89ec7a1b8b94.bin
+# +Link: amdtee/amd_pmf_v4.bin -> 64ad1cf5-14ea-8947-b6ae89ec7a1b8b94.bin
+#  
+#  Licence: Redistributable. See LICENSE.amd_pmf for details.
+#  SPDX-License-Identifier: LicenseRef-LICENSE.amd_pmf
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: amd-sof - AMD ACP 7.F Sound Open Firmware
+# +
+# +File: amd/sof/acp7f/v1.0/sof-acp7f-code.bin
+# +Version: 1.0
+# +Link: amd/sof/sof-acp7f-code.bin -> acp7f/v1.0/sof-acp7f-code.bin
+# +File: amd/sof/acp7f/v1.0/sof-acp7f-data.bin
+# +Version: 1.0
+# +Link: amd/sof/sof-acp7f-data.bin -> acp7f/v1.0/sof-acp7f-data.bin
+# +File: amd/sof/acp7f/v1.0/sof-acp7f-code_l.bin
+# +Version: 1.0
+# +Link: amd/sof/sof-acp7f-code_l.bin -> acp7f/v1.0/sof-acp7f-code_l.bin
+# +
+# +File: amd/sof-tplg/acp7f/v1.0/sof-acp7f-1amp-l0-id2.tplg
+# +Version: 1.0
+# +Link: amd/sof-tplg/sof-acp7f-1amp-l0-id2.tplg -> acp7f/v1.0/sof-acp7f-1amp-l0-id2.tplg
+# +File: amd/sof-tplg/acp7f/v1.0/sof-acp7f-1amp-l1-id2.tplg
+# +Version: 1.0
+# +Link: amd/sof-tplg/sof-acp7f-1amp-l1-id2.tplg -> acp7f/v1.0/sof-acp7f-1amp-l1-id2.tplg
+# +File: amd/sof-tplg/acp7f/v1.0/sof-acp7f-jack-l0-id0.tplg
+# +Version: 1.0
+# +Link: amd/sof-tplg/sof-acp7f-jack-l0-id0.tplg -> acp7f/v1.0/sof-acp7f-jack-l0-id0.tplg
+# +File: amd/sof-tplg/acp7f/v1.0/sof-acp7f-jack-l1-id0.tplg
+# +Version: 1.0
+# +Link: amd/sof-tplg/sof-acp7f-jack-l1-id0.tplg -> acp7f/v1.0/sof-acp7f-jack-l1-id0.tplg
+# +File: amd/sof-tplg/acp7f/v1.0/sof-acp7f-mic-l0-id4.tplg
+# +Version: 1.0
+# +Link: amd/sof-tplg/sof-acp7f-mic-l0-id4.tplg -> acp7f/v1.0/sof-acp7f-mic-l0-id4.tplg
+# +File: amd/sof-tplg/acp7f/v1.0/sof-acp7f-mic-l1-id4.tplg
+# +Version: 1.0
+# +Link: amd/sof-tplg/sof-acp7f-mic-l1-id4.tplg -> acp7f/v1.0/sof-acp7f-mic-l1-id4.tplg
+# +File: amd/sof-tplg/acp7f/v1.0/sof-acp7f-rt722-l0.tplg
+# +Version: 1.0
+# +Link: amd/sof-tplg/sof-acp7f-rt722-l0.tplg -> acp7f/v1.0/sof-acp7f-rt722-l0.tplg
+# +File: amd/sof-tplg/acp7f/v1.0/sof-acp7f-rt721-l0.tplg
+# +Version: 1.0
+# +Link: amd/sof-tplg/sof-acp7f-rt721-l0.tplg -> acp7f/v1.0/sof-acp7f-rt721-l0.tplg
+# +File: amd/sof-tplg/acp7f/v1.0/sof-acp7f-cs42l45-l0u0-cs35l63x2-l1u13.tplg
+# +Version: 1.0
+# +Link: amd/sof-tplg/sof-acp7f-cs42l45-l0u0-cs35l63x2-l1u13.tplg -> acp7f/v1.0/sof-acp7f-cs42l45-l0u0-cs35l63x2-l1u13.tplg
+# +
+# +Licence: Redistributable. See LICENSE.amdsof for details.
+# +SPDX-License-Identifier: LicenseRef-LICENSE.amdsof
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -3160,6 +3295,7 @@
+#  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
+#  Link: brcm/brcmfmac43455-sdio.raspberrypi,4-compute-module.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+#  Link: brcm/brcmfmac43455-sdio.raspberrypi,5-model-b.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+# +Link: brcm/brcmfmac43455-sdio.raspberrypi,5-model-b-d0.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+#  Link: brcm/brcmfmac43455-sdio.raspberrypi,500.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+#  Link: brcm/brcmfmac43455-sdio.raspberrypi,5-compute-module.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+#  Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+# @@ -3173,6 +3309,7 @@
+#  Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6356S.txt
+#  Link: brcm/brcmfmac4356-sdio.friendlyarm,nanopi-m4.txt -> brcmfmac4356-sdio.AP6356S.txt
+#  Link: brcm/brcmfmac4356-sdio.friendlyarm,nanopc-t4.txt -> brcmfmac4356-sdio.AP6356S.txt
+# +Link: brcm/brcmfmac4356-sdio.graperain,g3568-v2.txt -> brcmfmac4356-sdio.AP6356S.txt
+#  Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
+#  Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
+#  File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
+# @@ -3801,6 +3938,9 @@
+#  
+#  File: realtek/rt1320/rt1321-patch-code-va.bin
+#  Version: 1.10.0
+# +
+# +File: realtek/rt1320/rt1321-patch-code-va2.bin
+# +Version: 2.1.0
+#  
+#  Licence: Redistributable. See LICENSE.rt1320 for details.
+#  SPDX-License-Identifier: LicenseRef-LICENSE.rt1320
+# @@ -3973,7 +4113,7 @@
+#  File: ath10k/WCN3990/hw1.0/shikra/firmware-5.bin
+#  File: ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn
+#  Link: qcom/shikra/wlanmdsp.mbn -> ../../ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn
+# -Version: WLAN.HL.3.3.7.c5-00093.2-QCAHLSWMTPL-1
+# +Version: WLAN.HL.3.3.7.c5-00226-QCAHLSWMTPL-1
+#  File: ath10k/WCN3990/hw1.0/shikra/notice.txt_wlanmdsp
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
+# @@ -4090,6 +4230,10 @@
+#  File: ath11k/QCA2066/hw2.1/m3.bin
+#  Version: WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.9
+#  File: ath11k/QCA2066/hw2.1/Notice.txt
+# +File: ath11k/QCA2066/hw2.1/nfa725/amss.bin
+# +File: ath11k/QCA2066/hw2.1/nfa725/m3.bin
+# +Version: WLAN.HSP.1.1.c6-00302-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
+# +File: ath11k/QCA2066/hw2.1/nfa725/Notice.txt
+#  File: ath11k/QCA6698AQ/hw2.1/board-2.bin
+#  File: ath11k/QCA6698AQ/hw2.1/amss.bin
+#  File: ath11k/QCA6698AQ/hw2.1/m3.bin
+# @@ -4368,7 +4512,7 @@
+#  Link: intel/ibt-0040-1050.ddc -> ibt-0040-0041.ddc
+#  Link: intel/ibt-1040-1050.sfi -> ibt-1040-0041.sfi
+#  Link: intel/ibt-1040-1050.ddc -> ibt-1040-0041.ddc
+# -Version: BT_Solar_REL82200_23.50.26292.82200
+# +Version: BT_Solar_REL82251_23.50.26393.82251
+#  
+#  File: intel/ibt-0040-1020.sfi
+#  File: intel/ibt-0040-1020.ddc
+# @@ -4386,15 +4530,15 @@
+#  File: intel/ibt-0093-4150.ddc
+#  File: intel/ibt-0093-1050.sfi
+#  File: intel/ibt-0093-1050.ddc
+# -Version: BT_BlazaruHrpGfp_S_REL405_24.00.26304.405
+# +Version: BT_BlazaruHrpGfp_S_REL471_24.00.26393.471
+#  
+#  File: intel/ibt-0291-0291.sfi
+#  File: intel/ibt-0291-0291.ddc
+# -Version: BT_BlazarU_S_REL125585_24.80.26362.125585
+# +Version: BT_BlazarU_S_REL131287_24.90.26441.131287
+#  
+#  File: intel/ibt-0093-0291.sfi
+#  File: intel/ibt-0093-0291.ddc
+# -Version: BT_BlazaruFmpArl_S_REL58_24.70.26333.58
+# +Version: BT_BlazaruFmpArl_S_REL137_24.70.26415.137
+#  
+#  File: intel/ibt-0180-0041.sfi
+#  File: intel/ibt-0180-0041.ddc
+# @@ -4402,7 +4546,7 @@
+#  File: intel/ibt-0180-4150.ddc
+#  File: intel/ibt-0180-1050.sfi
+#  File: intel/ibt-0180-1050.ddc
+# -Version: BT_Magnetar_REL104027_23.50.26292.104027
+# +Version: BT_Magnetar_REL104078_23.50.26393.104078
+#  
+#  File: intel/ibt-0190-0291.sfi
+#  File: intel/ibt-0190-0291.ddc
+# @@ -4426,12 +4570,12 @@
+#  File: intel/ibt-0190-0291-usb.sfi
+#  File: intel/ibt-0190-0291-pci.ddc
+#  File: intel/ibt-0190-0291-pci.sfi
+# -Version: BT_BlazariFmp_S_REL62_24.70.26333.62
+# +Version: BT_BlazariFmp_S_REL143_24.70.26415.143
+#  
+#  File: intel/ibt-1190-01a1-iml.sfi
+#  File: intel/ibt-1190-01a1-pci.ddc
+#  File: intel/ibt-1190-01a1-pci.sfi
+# -Version: BT_BlazarI_S_REL132931_24.80.26362.132931
+# +Version: BT_BlazarI_S_REL138496_24.90.26441.138496
+#  
+#  File: intel/ibt-00a0-01a1-iml.sfi
+#  File: intel/ibt-00a0-01a1-pci.ddc
+# @@ -4439,12 +4583,17 @@
+#  File: intel/ibt-00a0-0291-iml.sfi
+#  File: intel/ibt-00a0-0291-pci.ddc
+#  File: intel/ibt-00a0-0291-pci.sfi
+# -Version: BT_Scorpius_S_REL102163_24.80.26362.102163
+# +Version: BT_Scorpius_S_REL108142_24.90.26441.108142
+#  
+#  File: intel/ibt-00a0-0041-iml.sfi
+#  File: intel/ibt-00a0-0041-pci.ddc
+#  File: intel/ibt-00a0-0041-pci.sfi
+# -Version: BT_ScorpiusGfp_S_REL384_24.00.26304.384
+# +Version: BT_ScorpiusGfp_S_REL455_24.00.26393.455
+# +
+# +File: intel/ibt-02a2-01a1-iml.sfi
+# +File: intel/ibt-02a2-01a1.sfi
+# +File: intel/ibt-02a2-01a1.ddc
+# +Version: BT_Scorpius2_S_REL92087_24.90.26441.92087
+#  
+#  Licence: Redistributable. See LICENCE.ibt_firmware for details
+#  SPDX-License-Identifier: LicenseRef-LICENCE.ibt_firmware
+# @@ -5035,8 +5184,8 @@
+#  File: qca/rampatch_usb_00000200.bin
+#  File: qca/nvm_usb_00000200.bin
+#  
+# -File: qca/rampatch_usb_00000201.bin
+# -File: qca/nvm_usb_00000201.bin
+# +Link: qca/rampatch_usb_00000201.bin -> rampatch_usb_00000200.bin
+# +Link: qca/nvm_usb_00000201.bin -> nvm_usb_00000200.bin
+#  
+#  File: qca/rampatch_usb_00000300.bin
+#  Version: BTFM.RM.2.2.c3-00031-QCABTFMSWP-1
+# @@ -5048,28 +5197,28 @@
+#  File: qca/nvm_usb_00000302_eu.bin
+#  
+#  File: qca/rampatch_usb_00130200.bin
+# -Version: BTFW.HSP.2.0.0-00609-USB_PATCHZ-1
+# +Version: BTFW.HSP.2.0.0-00634-USB_PATCHZ-2
+#  File: qca/nvm_usb_00130200.bin
+#  File: qca/nvm_usb_00130200_0104.bin
+# -File: qca/nvm_usb_00130200_0105.bin
+# -File: qca/nvm_usb_00130200_0106.bin
+#  File: qca/nvm_usb_00130200_0107.bin
+# -File: qca/nvm_usb_00130200_0109.bin
+# -File: qca/nvm_usb_00130200_0110.bin
+# +Link: qca/nvm_usb_00130200_0105.bin -> nvm_usb_00130200_0104.bin
+# +Link: qca/nvm_usb_00130200_0106.bin -> nvm_usb_00130200.bin
+# +Link: qca/nvm_usb_00130200_0109.bin -> nvm_usb_00130200.bin
+# +Link: qca/nvm_usb_00130200_0110.bin -> nvm_usb_00130200_0104.bin
+#  
+#  File: qca/rampatch_usb_00130201.bin
+#  Version: BTFW.HSP.2.1.0-00669-USB_UART_PATCHZ-1
+#  File: qca/nvm_usb_00130201.bin
+# -File: qca/nvm_usb_00130201_010a.bin
+# -File: qca/nvm_usb_00130201_010b.bin
+# -File: qca/nvm_usb_00130201_0303.bin
+#  File: qca/nvm_usb_00130201_gf.bin
+# -File: qca/nvm_usb_00130201_gf_010a.bin
+# -File: qca/nvm_usb_00130201_gf_010b.bin
+# -File: qca/nvm_usb_00130201_gf_0303.bin
+# +Link: qca/nvm_usb_00130201_010a.bin -> nvm_usb_00130201.bin
+# +Link: qca/nvm_usb_00130201_010b.bin -> nvm_usb_00130201.bin
+# +Link: qca/nvm_usb_00130201_0303.bin -> nvm_usb_00130201.bin
+# +Link: qca/nvm_usb_00130201_gf_010a.bin -> nvm_usb_00130201_gf.bin
+# +Link: qca/nvm_usb_00130201_gf_010b.bin -> nvm_usb_00130201_gf.bin
+# +Link: qca/nvm_usb_00130201_gf_0303.bin -> nvm_usb_00130201_gf.bin
+#  
+#  File: qca/QCA2066/rampatch_usb_00130201.bin
+# -Version: BTFW.HSP.2.1.0-00680-VER_PATCHZ-1
+# +Version: BTFW.HSP.2.1.0-00680-VER_PATCHZ-2
+#  File: qca/QCA2066/nvm_usb_00130201_030a.bin
+#  File: qca/QCA2066/nvm_usb_00130201_gf_030a.bin
+#  
+# @@ -5077,18 +5226,65 @@
+#  Version: BTFW.HAMILTON.2.0.0-00799-USB_PATCHZ-5
+#  File: qca/nvm_usb_00190200.bin
+#  File: qca/nvm_usb_00190200_0104.bin
+# -File: qca/nvm_usb_00190200_0106.bin
+#  File: qca/nvm_usb_00190200_0108.bin
+# -File: qca/nvm_usb_00190200_0109.bin
+# -File: qca/nvm_usb_00190200_010a.bin
+# -File: qca/nvm_usb_00190200_010c.bin
+# -File: qca/nvm_usb_00190200_010e.bin
+# -File: qca/nvm_usb_00190200_0110.bin
+#  File: qca/nvm_usb_00190200_0111.bin
+# -File: qca/nvm_usb_00190200_0112.bin
+# +Link: qca/nvm_usb_00190200_0106.bin -> nvm_usb_00190200_0104.bin
+# +Link: qca/nvm_usb_00190200_0109.bin -> nvm_usb_00190200_0104.bin
+# +Link: qca/nvm_usb_00190200_010a.bin -> nvm_usb_00190200_0104.bin
+# +Link: qca/nvm_usb_00190200_010c.bin -> nvm_usb_00190200_0104.bin
+# +Link: qca/nvm_usb_00190200_010e.bin -> nvm_usb_00190200.bin
+# +Link: qca/nvm_usb_00190200_0110.bin -> nvm_usb_00190200.bin
+# +Link: qca/nvm_usb_00190200_0112.bin -> nvm_usb_00190200.bin
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and NOTICE.qca for details
+#  SPDX-License-Identifier: LicenseRef-LICENSE.QualcommAtheros_ath10k
+# +
+# +--------------------------------------------------------------------------
+# +
+# +Driver: btusb - Bluetooth USB driver for Qualcomm controllers
+# +
+# +File: qca/QCC2072/peripatch_usb_00220100.bin
+# +Version: BTFW.COLOGNE.1.0.0-00054-PATCH-1
+# +File: qca/QCC2072/perinvm_usb_00220100.bin
+# +Link: qca/QCC2072/perinvm_usb_00220100_0002.bin -> perinvm_usb_00220100.bin
+# +Link: qca/QCC2072/perinvm_usb_00220100_0006.bin -> perinvm_usb_00220100.bin
+# +Link: qca/QCC2072/perinvm_usb_00220100_0008.bin -> perinvm_usb_00220100.bin
+# +Link: qca/QCC2072/perinvm_usb_00220100_000f.bin -> perinvm_usb_00220100.bin
+# +Link: qca/QCC2072/perinvm_usb_00220100_0011.bin -> perinvm_usb_00220100.bin
+# +Link: qca/QCC2072/perinvm_usb_00220100_0013.bin -> perinvm_usb_00220100.bin
+# +Link: qca/QCC2072/perinvm_usb_00220100_001e.bin -> perinvm_usb_00220100.bin
+# +Link: qca/QCC2072/perinvm_usb_00220100_001f.bin -> perinvm_usb_00220100.bin
+# +Link: qca/QCC2072/perinvm_usb_00220100_0021.bin -> perinvm_usb_00220100.bin
+# +Link: qca/QCC2072/perinvm_usb_00220100_0022.bin -> perinvm_usb_00220100.bin
+# +Link: qca/QCC2072/perinvm_usb_00220100_0201.bin -> perinvm_usb_00220100.bin
+# +Link: qca/QCC2072/perinvm_usb_00220100_0601.bin -> perinvm_usb_00220100.bin
+# +Link: qca/QCC2072/perinvm_usb_00220100_0604.bin -> perinvm_usb_00220100.bin
+# +Link: qca/QCC2072/perinvm_usb_00220100_0605.bin -> perinvm_usb_00220100.bin
+# +Link: qca/QCC2072/perinvm_usb_00220100_0606.bin -> perinvm_usb_00220100.bin
+# +
+# +File: qca/QCC2072/rampatch_usb_00200101.bin
+# +Version: BTFW.ORNE.1.1.0.c1-00038-PATCH-1
+# +File: qca/QCC2072/nvm_usb_00200101.bin
+# +File: qca/QCC2072/nvm_usb_00200101_0021.bin
+# +File: qca/QCC2072/nvm_usb_00200101_0022.bin
+# +Link: qca/QCC2072/nvm_usb_00200101_0002.bin -> nvm_usb_00200101.bin
+# +Link: qca/QCC2072/nvm_usb_00200101_0006.bin -> nvm_usb_00200101.bin
+# +Link: qca/QCC2072/nvm_usb_00200101_0008.bin -> nvm_usb_00200101.bin
+# +Link: qca/QCC2072/nvm_usb_00200101_000f.bin -> nvm_usb_00200101.bin
+# +Link: qca/QCC2072/nvm_usb_00200101_0011.bin -> nvm_usb_00200101.bin
+# +Link: qca/QCC2072/nvm_usb_00200101_0013.bin -> nvm_usb_00200101.bin
+# +Link: qca/QCC2072/nvm_usb_00200101_001a.bin -> nvm_usb_00200101.bin
+# +Link: qca/QCC2072/nvm_usb_00200101_001c.bin -> nvm_usb_00200101.bin
+# +Link: qca/QCC2072/nvm_usb_00200101_001e.bin -> nvm_usb_00200101.bin
+# +Link: qca/QCC2072/nvm_usb_00200101_001f.bin -> nvm_usb_00200101.bin
+# +Link: qca/QCC2072/nvm_usb_00200101_0201.bin -> nvm_usb_00200101.bin
+# +Link: qca/QCC2072/nvm_usb_00200101_0601.bin -> nvm_usb_00200101.bin
+# +Link: qca/QCC2072/nvm_usb_00200101_0604.bin -> nvm_usb_00200101_0021.bin
+# +Link: qca/QCC2072/nvm_usb_00200101_0605.bin -> nvm_usb_00200101_0021.bin
+# +Link: qca/QCC2072/nvm_usb_00200101_0606.bin -> nvm_usb_00200101_0022.bin
+# +
+# +Licence: Redistributable. See LICENSE.qcom and NOTICE.qca for details
+# +SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -5131,11 +5327,13 @@
+#  Driver: btqca - Qualcomm Atheros Bluetooth support for QCA_QCC2072 chip
+#  
+#  File: qca/ornbtfw11.tlv
+# -Version: BTFW.ORNE.1.1.0-00355-PATCH-1
+# +Version: BTFW.ORNE.1.1.0-00391-PATCH-1
+#  File: qca/ornnv11.bin
+# -Version: BTFW.ORNE.1.1.0-00355-PATCH-1
+# +Version: BTFW.ORNE.1.1.0-00391-PATCH-1
+# +File: qca/ornnv11.b18
+# +Version: BTFW.ORNE.1.1.0-00391-PATCH-1
+#  File: qca/ornbcscal11.bin
+# -Version: BTFW.ORNE.1.1.0-00355-PATCH-1
+# +Version: BTFW.ORNE.1.1.0-00391-PATCH-1
+#  
+#  Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and NOTICE.qca for details
+#  SPDX-License-Identifier: LicenseRef-LICENSE.QualcommAtheros_ath10k
+# @@ -5247,7 +5445,7 @@
+#  Driver: qca - Qualcomm Atheros Bluetooth support for QCA2066 chips
+#  
+#  File: qca/hpbtfw21.tlv
+# -Version: BTFW.HSP.2.1.0-00653-VER_PATCHZ-3
+# +Version: BTFW.HSP.2.1.0-00680-VER_PATCHZ-1
+#  File: qca/hpnv21.bin
+#  File: qca/hpnv21g.bin
+#  File: qca/hpnv21.301
+# @@ -5604,7 +5802,7 @@
+#  Version: GuC API/APB ver 70.1.1 for Tigerlake
+#  
+#  File: i915/tgl_guc_70.bin
+# -Version: GuC API/APB ver 70.49.4 for Tigerlake
+# +Version: GuC API/APB ver 70.49.5 for Tigerlake
+#  
+#  File: i915/tgl_huc_7.0.3.bin
+#  Version: Huc API/APB ver 7 release 0 for Tigerlake
+# @@ -5643,7 +5841,7 @@
+#  Version: GuC API/APB ver 70.1.1 for DG1
+#  
+#  File: i915/dg1_guc_70.bin
+# -Version: GuC API/APB ver 70.49.4 for DG1
+# +Version: GuC API/APB ver 70.49.5 for DG1
+#  
+#  File: i915/dg1_huc_7.7.1.bin
+#  Version: Huc API/APB ver 7 release 1 for DG1
+# @@ -5685,7 +5883,7 @@
+#  Version: GuC API/APB ver 70.1.1 for Alderlake P
+#  
+#  File: i915/adlp_guc_70.bin
+# -Version: GuC API/APB ver 70.49.4 for Alderlake P
+# +Version: GuC API/APB ver 70.49.5 for Alderlake P
+#  
+#  File: i915/dg2_guc_70.1.2.bin
+#  Version: GuC API/APB ver 70.1.2 for DG2
+# @@ -5694,7 +5892,7 @@
+#  Version: GuC API/APB ver 70.4.1 for DG2
+#  
+#  File: i915/dg2_guc_70.bin
+# -Version: GuC API/APB ver 70.53.0 for DG2
+# +Version: GuC API/APB ver 70.83.0 for DG2
+#  
+#  File: i915/dg2_huc_gsc.bin
+#  Version: HuC API/APB ver 7.10.16 for DG2
+# @@ -5715,7 +5913,7 @@
+#  Version: DMC API/APB ver 2 release 23 for Meteorlake
+#  
+#  File: i915/mtl_guc_70.bin
+# -Version: GuC API/APB ver 70.53.0 for Meteorlake
+# +Version: GuC API/APB ver 70.83.0 for Meteorlake
+#  
+#  File: i915/mtl_huc_gsc.bin
+#  Version: HuC API/APB ver 8.5.4 for Meteorlake
+# @@ -5736,7 +5934,7 @@
+#  Version: DMC API/APB ver 2 release 31 for Xe3LPD_3002
+#  
+#  File: i915/xe3p_lpd_dmc.bin
+# -Version: DMC API/APB ver 2 release 37 for Xe3p_LPD
+# +Version: DMC API/APB ver 2 release 44 for Xe3p_LPD
+#  
+#  License: Redistributable. See LICENSE.i915 for details
+#  SPDX-License-Identifier: LicenseRef-LICENSE.i915
+# @@ -5748,13 +5946,13 @@
+#  Version: GSC API/APB v1.0, release 104.0.5.1429, SVN 1 for Lunarlake
+#  
+#  File: xe/lnl_guc_70.bin
+# -Version: GuC API/APB ver 70.72.1 for Lunarlake
+# +Version: GuC API/APB ver 70.83.0 for Lunarlake
+#  
+#  File: xe/lnl_huc.bin
+#  Version: HuC API/APB ver 9.4.13 for Lunarlake
+#  
+#  File: xe/bmg_guc_70.bin
+# -Version: GuC API/APB ver 70.72.1 for Battlemage
+# +Version: GuC API/APB ver 70.83.0 for Battlemage
+#  
+#  File: xe/bmg_huc.bin
+#  Version: HuC API/APB ver 8.2.10 for Battlemage
+# @@ -5766,13 +5964,23 @@
+#  Version: GSC API/APB v1.0, release 105.0.2.1397, SVN 1 for Pantherlake
+#  
+#  File: xe/ptl_guc_70.bin
+# -Version: GuC API/APB ver 70.72.1 for Pantherlake
+# +Version: GuC API/APB ver 70.83.0 for Pantherlake
+#  
+#  File: xe/ptl_huc.bin
+#  Version: HuC API/APB ver 10.3.3 for Pantherlake
+#  
+#  File: xe/nvl_guc_70.bin
+# -Version: GuC API/APB ver 70.72.1 for Novalake S
+# +Version: GuC API/APB ver 70.83.0 for Novalake S
+# +
+# +File: xe/nvl_gsc_1.bin
+# +Version: GSC API v1.0, release 108.0.0.1242, SVN 1 for Novalake
+# +
+# +File: xe/cri_guc_70.bin
+# +Version: GuC API/APB ver 70.83.0 for Crescentisland
+# +
+# +File: xe/nvlpg_guc_70.bin
+# +File: xe/nvlpm_guc_70.bin
+# +Version: GuC API/APB ver 70.83.0 for Novalake P
+#  
+#  License: Redistributable. See LICENSE.xe for details
+#  SPDX-License-Identifier: LicenseRef-LICENSE.xe
+# @@ -6287,8 +6495,9 @@
+#  File: atmel/wilc1000_p2p_fw.bin
+#  File: atmel/wilc1000_wifi_firmware.bin
+#  File: atmel/wilc1000_wifi_firmware-1.bin
+# +Version: 16.5.2
+#  File: atmel/wilc3000_wifi_firmware-1.bin
+# -Version: 16.1.2
+# +Version: 16.5.2
+#  
+#  License: Redistributable. See LICENSE.atmel for details
+#  SPDX-License-Identifier: LicenseRef-LICENSE.atmel
+# @@ -6365,7 +6574,7 @@
+#  Version: v2.0.21961
+#  File: mediatek/mt8188/scp_c0.img
+#  Link: mediatek/mt8188/scp.img -> scp_c0.img
+# -Version: v2.0.27748
+# +Version: v2.0.30090
+#  File: mediatek/mt8189/scp.img
+#  Version: v1.0.0
+#  
+# @@ -6617,9 +6826,9 @@
+#  Driver: mt7922 - MediaTek MT7922 Wireless MACs
+#  
+#  File: mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin
+# -Version: 20260724143257a
+# +Version: 20261027203145a
+#  File: mediatek/WIFI_RAM_CODE_MT7922_1.bin
+# -Version: 20260724143402
+# +Version: 20261027203227
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+# @@ -6629,7 +6838,7 @@
+#  Driver: mt7922 - MediaTek MT7922 bluetooth chipset
+#  
+#  File: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
+# -Version: 20260724143815
+# +Version: 20261027203403
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+# @@ -6639,9 +6848,9 @@
+#  Driver: mt7925 - MediaTek MT7925 Wireless MACs
+#  
+#  File: mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
+# -Version: 20260813113015a
+# +Version: 20261016232915a
+#  File: mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
+# -Version: 20260813113118
+# +Version: 20261016233029
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+# @@ -6651,7 +6860,7 @@
+#  Driver: mt7925 - MediaTek MT7925 bluetooth chipset
+#  
+#  File: mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
+# -Version: 20260813113236
+# +Version: 20261016233221
+#  
+#  Licence: Redistributable. See LICENCE.mediatek for details.
+#  SPDX-License-Identifier: LicenseRef-LICENCE.mediatek
+# @@ -6987,7 +7196,7 @@
+#  
+#  File: qcom/vpu/vpu40_p2_s7.mbn
+#  
+# -Version: VIDEO.VPU.4.0-0045
+# +Version: VIDEO.VPU.5.0-0042
+#  
+#  File: qcom/vpu/vpu40_p1_s8.mbn
+#  
+# @@ -7105,11 +7314,24 @@
+#  Version: v4.02.14
+#  File: qcom/sm8650/gen70900_zap.mbn
+#  Version: v0.13
+# +Link: qcom/gen71300_aqe.fw -> gen70900_aqe.fw
+# +File: qcom/gen71300_gmu.bin
+# +Version: v4.11.00
+# +File: qcom/gen71300_sqe.fw
+# +Version: v1.86
+# +File: qcom/nord/gen71300_zap.mbn
+# +Version: v0.13
+#  File: qcom/gen71500_gmu.bin
+#  Version: v4.06.04
+#  File: qcom/gen71500_sqe.fw
+#  Version: v1.81
+#  File: qcom/x1p42100/gen71500_zap.mbn
+# +Version: v0.13
+# +File: qcom/gen71600_gmu.bin
+# +Version: v4.10.00
+# +File: qcom/gen71600_sqe.fw
+# +Version: v1.86
+# +File: qcom/nord/gen71600_zap.mbn
+#  Version: v0.13
+#  File: qcom/gen71700_gmu.bin
+#  Version: v4.09.00
+# @@ -7246,7 +7468,7 @@
+#  Version: CDSP.HT.2.5.c4-00004-KODIAK-1
+#  RawFile: qcom/qcs6490/radxa/dragon-q6a/cdspr.jsn
+#  File: qcom/qcs6490/Thundercomm/RubikPi3/adsp.mbn
+# -Version: ADSP.HT.5.5.c8-00249.1-KODIAK-1
+# +Version: ADSP.HT.5.5.c8-00256.2-KODIAK-1
+#  RawFile: qcom/qcs6490/Thundercomm/RubikPi3/adspr.jsn
+#  RawFile: qcom/qcs6490/Thundercomm/RubikPi3/adsps.jsn
+#  RawFile: qcom/qcs6490/Thundercomm/RubikPi3/adspua.jsn
+# @@ -7322,7 +7544,7 @@
+#  File: qcom/sc8280xp/radxa/dragon-q8b/qcadsp8280.mbn
+#  Version: ADSP.HT.5.6.c2-00037-MAKENA-1
+#  
+# -# Lenovo T14s
+# +# Lenovo T14s G6
+#  File: qcom/x1e80100/LENOVO/21N1/qcvss8380.mbn
+#  Version: VIDEO.VPU.3.1-0085
+#  RawFile: qcom/x1e80100/LENOVO/21N1/adspua.jsn
+# @@ -7337,7 +7559,7 @@
+#  File: qcom/x1e80100/LENOVO/21N1/cdsp_dtbs.elf
+#  RawFile: qcom/x1e80100/LENOVO/21N1/adsps.jsn
+#  File: qcom/x1e80100/LENOVO/21N1/qccdsp8380.mbn
+# -Version: CDSP.HT.2.9-00447-HAMOA-2
+# +Version: CDSP.HT.2.9.c1-00078-HAMOA-1
+#  RawFile: qcom/x1e80100/LENOVO/21N1/cdspr.jsn
+#  RawFile: qcom/x1e80100/LENOVO/21N1/battmgr.jsn
+#  
+# @@ -7353,9 +7575,10 @@
+#  File: qcom/x1e80100/LENOVO/83ED/qcav1e8380.mbn
+#  Version: CDSP.HT.2.9.c2-00051-HAMOA-1
+#  File: qcom/x1e80100/LENOVO/83ED/qccdsp8380.mbn
+# -Version: CDSP.HT.2.9.c2-00051-HAMOA-1
+# +Version: CDSP.HT.2.9.c1-00075-HAMOA-1
+#  File: qcom/x1e80100/LENOVO/83ED/qcvss8380.mbn
+#  Version: video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
+# +File: qcom/x1e80100/LENOVO/83ED/cdsp_dtbs.elf
+#  
+#  Licence: Redistributable. See LICENSE.qcom and NOTICE.qcom for details
+#  SPDX-License-Identifier: LicenseRef-LICENSE.qcom
+# @@ -7385,6 +7608,10 @@
+#  File: qcom/glymur/cdsp_dtb.mbn
+#  Version: CDSP.HT.3.3-00315-GLYMUR-1
+#  RawFile: qcom/glymur/cdspr.jsn
+# +File: qcom/glymur/soccp.mbn
+# +File: qcom/glymur/soccp_dtb.mbn
+# +Version: SOCCP.FW.2.1-00263-GLYMUR_SOCCP_PACK-1
+# +RawFile: qcom/glymur/soccpr.jsn
+#  
+#  # qcom/hawi
+#  File: qcom/hawi/adsp.mbn
+# @@ -7458,7 +7685,7 @@
+#  File: qcom/nord/adsp1.mbn
+#  File: qcom/nord/adsp_dtb.mbn
+#  File: qcom/nord/adsp1_dtb.mbn
+# -Version: HPASS.AT.1.0.1-00003-NORD-6
+# +Version: HPASS.AT.1.0.1-00032-NORD-1
+#  RawFile: qcom/nord/adspr.jsn
+#  RawFile: qcom/nord/adspua.jsn
+#  RawFile: qcom/nord/adsp1r.jsn
+# @@ -7466,11 +7693,14 @@
+#  File: qcom/nord/cdsp_dtb.mbn
+#  Version: NSP.AT.1.0-00579-NORD-1
+#  RawFile: qcom/nord/cdspr.jsn
+# +File: qcom/nord/soccp.mbn
+# +Version: SOCCP.FW.2.2-00009.4-NORD_SOCCP_PACK-1
+# +RawFile: qcom/nord/soccpr.jsn
+#  
+#  # qcom/sm8750
+#  File: qcom/sm8750/adsp.mbn
+#  File: qcom/sm8750/adsp_dtb.mbn
+# -Version: LPAIDSP.HT.1.2.c2-00021-PAKALA-1
+# +Version: LPAIDSP.HT.1.2.c2-00080-PAKALA-1
+#  RawFile: qcom/sm8750/adspr.jsn
+#  RawFile: qcom/sm8750/adsps.jsn
+#  RawFile: qcom/sm8750/adspua.jsn
+# @@ -7483,11 +7713,11 @@
+#  # qcom/eliza
+#  File: qcom/eliza/cdsp.mbn
+#  File: qcom/eliza/cdsp_dtb.mbn
+# -Version: CDSP.HT.3.1-00889-PAKALA-1
+# +Version: CDSP.HT.3.1-00893-PAKALA-1
+#  RawFile: qcom/eliza/cdspr.jsn
+#  File: qcom/eliza/adsp.mbn
+#  File: qcom/eliza/adsp_dtb.mbn
+# -Version: LPAIDSP.HT.1.2.c2-00064-PAKALA-3
+# +Version: LPAIDSP.HT.1.2.c2-00080-PAKALA-1
+#  RawFile: qcom/eliza/adspr.jsn
+#  RawFile: qcom/eliza/adsps.jsn
+#  RawFile: qcom/eliza/adspua.jsn
+# @@ -7503,14 +7733,14 @@
+#  
+#  # qcom/shikra
+#  File: qcom/shikra/cdsp.mbn
+# -Version: CDSP.VT.2.4.3-00088-SHIKRA-1
+# +Version: CDSP.VT.2.4.3-00131-SHIKRA-2
+#  RawFile: qcom/shikra/cdspr.jsn
+#  File: qcom/shikra/lpaicp.mbn
+#  File: qcom/shikra/lpaicp_dtb.mbn
+# -Version: LPAICP.FW.1.2-00155-SHIKRA_LPAICP_PACK-1
+# +Version: LPAICP.FW.1.2-00173.1-SHIKRA_LPAICP_PACK-1s
+#  RawFile: qcom/shikra/lpaicpr.jsn
+#  File: qcom/shikra/cqs/qdsp6sw.mbn
+# -Version: MPSS.JO.4.0-00272-SHIKRA_LWG_PACK-2
+# +Version: MPSS.JO.4.0-00273-SHIKRA_LWG_PACK-1
+#  
+#  Licence: Redistributable. See LICENSE.qcom-2 and NOTICE.qcom for details
+#  SPDX-License-Identifier: LicenseRef-LICENSE.qcom-2
+# @@ -8916,11 +9146,15 @@
+#  File: cirrus/cs35l56/CS35L56_Rev4.5.9.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev4.7.0.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev4.7.2.wmfw
+# +File: cirrus/cs35l56/CS35L56_Rev4.7.5.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev4.7.9.wmfw
+# +File: cirrus/cs35l56/CS35L56_Rev4.7.10.wmfw
+#  File: cirrus/cs35l56/CS35L56_Rev4.7.12.wmfw
+# +File: cirrus/cs35l56/CS35L56_Rev4.7.17.wmfw
+#  File: cirrus/cs35l63/CS35L63_Rev2.5.4.wmfw
+#  File: cirrus/cs35l63/CS35L63_Rev2.5.7.wmfw
+#  File: cirrus/cs35l63/CS35L63_Rev2.5.11.wmfw
+# +File: cirrus/cs35l63/CS35L63_Rev2.6.6.wmfw
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.11.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10280c62-spkid0-amp2.bin
+# @@ -9489,6 +9723,12 @@
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280edc-spkid1-00-l3u3.bin -> cs35l63-a1-dsp1-misc-10280edc-spkid0-00-l3u3.bin
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280edc-spkid1-01-l3u1.bin -> cs35l63-a1-dsp1-misc-10280edc-spkid0-00-l3u1.bin
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280edc-spkid1-01-l3u3.bin -> cs35l63-a1-dsp1-misc-10280edc-spkid0-00-l3u3.bin
+# +Link: cirrus/cs35l56-b2-dsp1-misc-10280ee0-spkid0.wmfw -> cs35l56/CS35L56_Rev4.7.17.wmfw
+# +File: cirrus/cs35l56-b2-dsp1-misc-10280ee0-spkid0-l2u0.bin
+# +File: cirrus/cs35l56-b2-dsp1-misc-10280ee0-spkid0-l2u1.bin
+# +Link: cirrus/cs35l56-b2-dsp1-misc-10280ee0-spkid1.wmfw -> cs35l56/CS35L56_Rev4.7.17.wmfw
+# +File: cirrus/cs35l56-b2-dsp1-misc-10280ee0-spkid1-l2u0.bin
+# +File: cirrus/cs35l56-b2-dsp1-misc-10280ee0-spkid1-l2u1.bin
+#  Link: cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid1.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+#  File: cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid1-l2u1.bin
+#  File: cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid1-l2u3.bin
+# @@ -9589,6 +9829,56 @@
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280eef-spkid3.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280eef-spkid3-05-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u1.bin
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280eef-spkid3-05-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef1-spkid1.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef1-spkid1-06-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef1-spkid1-06-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef1-spkid2.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef1-spkid2-06-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef1-spkid2-06-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef1-spkid3.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef1-spkid3-06-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef1-spkid3-06-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid0-01-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid0-01-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid0-02-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid0-02-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid1.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid1-01-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid1-01-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid1-02-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid1-02-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid2.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid2-01-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid2-01-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid2-02-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid2-02-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid3.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid3-01-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid3-01-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid3-02-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef2-spkid3-02-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef3-spkid1.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef3-spkid1-05-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef3-spkid1-05-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef3-spkid2.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef3-spkid2-05-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef3-spkid2-05-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef3-spkid3.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef3-spkid3-05-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef3-spkid3-05-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef4-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef4-spkid0-02-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef4-spkid0-02-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef4-spkid1.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef4-spkid1-02-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef4-spkid1-02-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef4-spkid2.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef4-spkid2-02-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef4-spkid2-02-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef4-spkid3.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef4-spkid3-02-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280ef4-spkid3-02-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u3.bin
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280efb-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280efb-spkid0-02-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u1.bin
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280efb-spkid0-02-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u3.bin
+# @@ -9619,12 +9909,38 @@
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280f01-spkid1.wmfw -> cs35l63/CS35L63_Rev2.5.11.wmfw
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280f01-spkid1-00-l0u3.bin -> cs35l63-a1-dsp1-misc-10280f01-spkid0-00-l0u3.bin
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280f01-spkid1-00-l3u1.bin -> cs35l63-a1-dsp1-misc-10280f01-spkid0-00-l3u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f02-spkid0.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280f02-spkid0-l0u2.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280f02-spkid0-l0u3.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280f02-spkid0-l3u0.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280f02-spkid0-l3u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f02-spkid1.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f02-spkid1-l0u2.bin -> cs35l57-b2-dsp1-misc-10280f02-spkid0-l0u2.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f02-spkid1-l0u3.bin -> cs35l57-b2-dsp1-misc-10280f02-spkid0-l0u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f02-spkid1-l3u0.bin -> cs35l57-b2-dsp1-misc-10280f02-spkid0-l3u0.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f02-spkid1-l3u1.bin -> cs35l57-b2-dsp1-misc-10280f02-spkid0-l3u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f03-spkid0.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f03-spkid0-l0u2.bin -> cs35l57-b2-dsp1-misc-10280f02-spkid0-l0u2.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f03-spkid0-l0u3.bin -> cs35l57-b2-dsp1-misc-10280f02-spkid0-l0u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f03-spkid0-l3u0.bin -> cs35l57-b2-dsp1-misc-10280f02-spkid0-l3u0.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f03-spkid0-l3u1.bin -> cs35l57-b2-dsp1-misc-10280f02-spkid0-l3u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f03-spkid1.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f03-spkid1-l0u2.bin -> cs35l57-b2-dsp1-misc-10280f02-spkid0-l0u2.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f03-spkid1-l0u3.bin -> cs35l57-b2-dsp1-misc-10280f02-spkid0-l0u3.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f03-spkid1-l3u0.bin -> cs35l57-b2-dsp1-misc-10280f02-spkid0-l3u0.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f03-spkid1-l3u1.bin -> cs35l57-b2-dsp1-misc-10280f02-spkid0-l3u1.bin
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280f04-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.11.wmfw
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280f04-spkid0-00-l0u3.bin -> cs35l63-a1-dsp1-misc-10280f01-spkid0-00-l0u3.bin
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280f04-spkid0-00-l3u1.bin -> cs35l63-a1-dsp1-misc-10280f01-spkid0-00-l3u1.bin
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280f04-spkid1.wmfw -> cs35l63/CS35L63_Rev2.5.11.wmfw
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280f04-spkid1-00-l0u3.bin -> cs35l63-a1-dsp1-misc-10280f01-spkid0-00-l0u3.bin
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280f04-spkid1-00-l3u1.bin -> cs35l63-a1-dsp1-misc-10280f01-spkid0-00-l3u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f05-spkid0.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280f05-spkid0-l0u3.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280f05-spkid0-l3u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10280f05-spkid1.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280f05-spkid1-l0u3.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-10280f05-spkid1-l3u1.bin
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280f07-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280f07-spkid0-02-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u1.bin
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280f07-spkid0-02-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u3.bin
+# @@ -9649,6 +9965,29 @@
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280f08-spkid3.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280f08-spkid3-04-l3u1.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u1.bin
+#  Link: cirrus/cs35l63-a1-dsp1-misc-10280f08-spkid3-04-l3u3.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f12-spkid2.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f12-spkid2-01-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f12-spkid2-01-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f12-spkid2-02-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f12-spkid2-02-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f12-spkid3.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f12-spkid3-01-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f12-spkid3-01-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f12-spkid3-02-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f12-spkid3-02-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f13-spkid0.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f13-spkid0-03-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f13-spkid0-03-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f13-spkid0-04-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f13-spkid0-04-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f13-spkid2.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f13-spkid2-03-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f13-spkid2-03-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f13-spkid2-04-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f13-spkid2-04-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u3.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f13-spkid3.wmfw -> cs35l63/CS35L63_Rev2.5.7.wmfw
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f13-spkid3-04-l1u1.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-10280f13-spkid3-04-l1u3.bin -> cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u3.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8c52.wmfw -> cs35l56/CS35L56_Rev3.11.18.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp2.bin
+# @@ -9733,6 +10072,9 @@
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8e2c.wmfw -> cs35l56/CS35L56_Rev3.11.11.1.wmfw
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8e2c-amp1.bin -> cs35l56-b0-dsp1-misc-103c8d90-amp1.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-103c8e2c-amp2.bin -> cs35l56-b0-dsp1-misc-103c8d90-amp2.bin
+# +Link: cirrus/cs35l54-b0-dsp1-misc-103c8f5d.wmfw -> cs35l56/CS35L56_Rev3.13.4.wmfw
+# +File: cirrus/cs35l54-b0-dsp1-misc-103c8f5d-amp1.bin
+# +File: cirrus/cs35l54-b0-dsp1-misc-103c8f5d-amp2.bin
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c900c.wmfw -> cs35l56/CS35L56_Rev3.11.18.wmfw
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c900c-amp1.bin -> cs35l54-b0-dsp1-misc-103c8d01-amp1.bin
+#  Link: cirrus/cs35l54-b0-dsp1-misc-103c900c-amp2.bin -> cs35l54-b0-dsp1-misc-103c8d01-amp2.bin
+# @@ -9792,6 +10134,15 @@
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431634.wmfw -> cs35l56/CS35L56_Rev3.13.4.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431634-l2u0.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431634-l2u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10431ad4.wmfw -> cs35l56/CS35L56_Rev4.7.5.wmfw
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10431ad4-l2u0.bin -> cs35l57-b2-dsp1-misc-10431ad4-spkid0-l2u0.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10431ad4-l2u1.bin -> cs35l57-b2-dsp1-misc-10431ad4-spkid0-l2u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10431ad4-spkid0.wmfw -> cs35l56/CS35L56_Rev4.7.5.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-10431ad4-spkid0-l2u0.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-10431ad4-spkid0-l2u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-10431ad4-spkid1.wmfw -> cs35l56/CS35L56_Rev4.7.5.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-10431ad4-spkid1-l2u0.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-10431ad4-spkid1-l2u1.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp2.bin
+# @@ -9904,6 +10255,24 @@
+#  Link: cirrus/cs35l57-b2-dsp1-misc-17aa235d.wmfw -> cs35l56/CS35L56_Rev4.7.2.wmfw
+#  File: cirrus/cs35l57-b2-dsp1-misc-17aa235d-l2u0.bin
+#  File: cirrus/cs35l57-b2-dsp1-misc-17aa235d-l2u4.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-17aa2369.wmfw -> cs35l63/CS35L63_Rev2.6.6.wmfw
+# +File: cirrus/cs35l63-a1-dsp1-misc-17aa2369-l2u0.bin
+# +File: cirrus/cs35l63-a1-dsp1-misc-17aa2369-l2u1.bin
+# +Link: cirrus/cs35l63-a1-dsp1-misc-17aa236a.wmfw -> cs35l63/CS35L63_Rev2.6.6.wmfw
+# +File: cirrus/cs35l63-a1-dsp1-misc-17aa236a-l2u0.bin
+# +File: cirrus/cs35l63-a1-dsp1-misc-17aa236a-l2u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-17aa236b-spkid0.wmfw -> cs35l56/CS35L56_Rev4.7.10.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-17aa236b-spkid0-l1u0.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-17aa236b-spkid0-l1u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-17aa236b-spkid1.wmfw -> cs35l56/CS35L56_Rev4.7.10.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-17aa236b-spkid1-l1u0.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-17aa236b-spkid1-l1u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-17aa236c-spkid0.wmfw -> cs35l56/CS35L56_Rev4.7.10.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-17aa236c-spkid0-l1u0.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-17aa236c-spkid0-l1u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-17aa236c-spkid1.wmfw -> cs35l56/CS35L56_Rev4.7.10.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-17aa236c-spkid1-l1u0.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-17aa236c-spkid1-l1u1.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0.wmfw -> cs35l56/CS35L56_Rev3.13.3.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u0.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u1.bin
+# @@ -9932,6 +10301,12 @@
+#  Link: cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid1.wmfw -> cs35l56/CS35L56_Rev4.5.3.wmfw
+#  File: cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid1-ampl.bin
+#  File: cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid1-ampr.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-17aa3824-spkid0.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-17aa3824-spkid0-l0u0.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-17aa3824-spkid0-l0u1.bin
+# +Link: cirrus/cs35l57-b2-dsp1-misc-17aa3824-spkid1.wmfw -> cs35l56/CS35L56_Rev4.7.9.wmfw
+# +File: cirrus/cs35l57-b2-dsp1-misc-17aa3824-spkid1-l0u0.bin
+# +File: cirrus/cs35l57-b2-dsp1-misc-17aa3824-spkid1-l0u1.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.26.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0-ampl.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0-ampr.bin
+# @@ -9979,6 +10354,9 @@
+#  Link: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp2.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa391e.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa391e-amp1.bin -> cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp1.bin
+# +Link: cirrus/cs35l56-b0-dsp1-misc-17aa391e-amp2.bin -> cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp2.bin
+#  Link: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin
+#  File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin
+# @@ -10248,56 +10626,101 @@
+#  Link: sdca/1fa/1028/efc/4.bin -> ../../cs42l45_primer4.bin
+#  Link: sdca/1fa/1028/efc/42450005.bin -> ../cs42l45_v20260615.bin
+#  
+# -File: sdca/1fa/1028/cs42l45_v20260917.bin
+# +File: sdca/1fa/1028/cs42l49_v20261104.bin
+# +Link: sdca/1fa/1028/f01/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/f01/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/f01/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/f01/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/f01/42450005.bin -> ../cs42l49_v20261104.bin
+# +Link: sdca/1fa/1028/f04/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/f04/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/f04/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/f04/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/f04/42450005.bin -> ../cs42l49_v20261104.bin
+# +Link: sdca/1fa/1028/f05/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/f05/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/f05/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/f05/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/f05/42450005.bin -> ../cs42l49_v20261104.bin
+# +
+# +File: sdca/1fa/1028/cs42l45_v20261022.bin
+# +Link: sdca/1fa/1028/ef1/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/ef1/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/ef1/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/ef1/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/ef1/42450005.bin -> ../cs42l45_v20261022.bin
+# +Link: sdca/1fa/1028/ef2/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/ef2/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/ef2/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/ef2/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/ef2/42450005.bin -> ../cs42l45_v20261022.bin
+# +Link: sdca/1fa/1028/ef3/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/ef3/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/ef3/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/ef3/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/ef3/42450005.bin -> ../cs42l45_v20261022.bin
+# +Link: sdca/1fa/1028/ef4/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/ef4/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/ef4/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/ef4/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/ef4/42450005.bin -> ../cs42l45_v20261022.bin
+# +Link: sdca/1fa/1028/f12/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/f12/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/f12/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/f12/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/f12/42450005.bin -> ../cs42l45_v20261022.bin
+# +Link: sdca/1fa/1028/f13/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/f13/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/f13/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/f13/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/f13/42450005.bin -> ../cs42l45_v20261022.bin
+# +
+# +File: sdca/1fa/1028/cs42l45_v20261030.bin
+# +Link: sdca/1fa/1028/edc/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/edc/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/edc/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/edc/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/edc/42450005.bin -> ../cs42l45_v20261030.bin
+#  Link: sdca/1fa/1028/eec/1.bin -> ../../cs42l45_primer1.bin
+#  Link: sdca/1fa/1028/eec/2.bin -> ../../cs42l45_primer2.bin
+#  Link: sdca/1fa/1028/eec/3.bin -> ../../cs42l45_primer3.bin
+#  Link: sdca/1fa/1028/eec/4.bin -> ../../cs42l45_primer4.bin
+# -Link: sdca/1fa/1028/eec/42450005.bin -> ../cs42l45_v20260917.bin
+# +Link: sdca/1fa/1028/eec/42450005.bin -> ../cs42l45_v20261030.bin
+#  Link: sdca/1fa/1028/eed/1.bin -> ../../cs42l45_primer1.bin
+#  Link: sdca/1fa/1028/eed/2.bin -> ../../cs42l45_primer2.bin
+#  Link: sdca/1fa/1028/eed/3.bin -> ../../cs42l45_primer3.bin
+#  Link: sdca/1fa/1028/eed/4.bin -> ../../cs42l45_primer4.bin
+# -Link: sdca/1fa/1028/eed/42450005.bin -> ../cs42l45_v20260917.bin
+# +Link: sdca/1fa/1028/eed/42450005.bin -> ../cs42l45_v20261030.bin
+#  Link: sdca/1fa/1028/eee/1.bin -> ../../cs42l45_primer1.bin
+#  Link: sdca/1fa/1028/eee/2.bin -> ../../cs42l45_primer2.bin
+#  Link: sdca/1fa/1028/eee/3.bin -> ../../cs42l45_primer3.bin
+#  Link: sdca/1fa/1028/eee/4.bin -> ../../cs42l45_primer4.bin
+# -Link: sdca/1fa/1028/eee/42450005.bin -> ../cs42l45_v20260917.bin
+# +Link: sdca/1fa/1028/eee/42450005.bin -> ../cs42l45_v20261030.bin
+#  Link: sdca/1fa/1028/eef/1.bin -> ../../cs42l45_primer1.bin
+#  Link: sdca/1fa/1028/eef/2.bin -> ../../cs42l45_primer2.bin
+#  Link: sdca/1fa/1028/eef/3.bin -> ../../cs42l45_primer3.bin
+#  Link: sdca/1fa/1028/eef/4.bin -> ../../cs42l45_primer4.bin
+# -Link: sdca/1fa/1028/eef/42450005.bin -> ../cs42l45_v20260917.bin
+# +Link: sdca/1fa/1028/eef/42450005.bin -> ../cs42l45_v20261030.bin
+# +Link: sdca/1fa/1028/f02/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/f02/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/f02/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/f02/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/f02/42450005.bin -> ../cs42l45_v20261030.bin
+# +Link: sdca/1fa/1028/f03/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/1028/f03/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/1028/f03/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/1028/f03/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/1028/f03/42450005.bin -> ../cs42l45_v20261030.bin
+#  Link: sdca/1fa/1028/f07/1.bin -> ../../cs42l45_primer1.bin
+#  Link: sdca/1fa/1028/f07/2.bin -> ../../cs42l45_primer2.bin
+#  Link: sdca/1fa/1028/f07/3.bin -> ../../cs42l45_primer3.bin
+#  Link: sdca/1fa/1028/f07/4.bin -> ../../cs42l45_primer4.bin
+# -Link: sdca/1fa/1028/f07/42450005.bin -> ../cs42l45_v20260917.bin
+# +Link: sdca/1fa/1028/f07/42450005.bin -> ../cs42l45_v20261030.bin
+#  Link: sdca/1fa/1028/f08/1.bin -> ../../cs42l45_primer1.bin
+#  Link: sdca/1fa/1028/f08/2.bin -> ../../cs42l45_primer2.bin
+#  Link: sdca/1fa/1028/f08/3.bin -> ../../cs42l45_primer3.bin
+#  Link: sdca/1fa/1028/f08/4.bin -> ../../cs42l45_primer4.bin
+# -Link: sdca/1fa/1028/f08/42450005.bin -> ../cs42l45_v20260917.bin
+# -
+# -File: sdca/1fa/1028/cs42l45_v20260930.bin
+# -Link: sdca/1fa/1028/edc/1.bin -> ../../cs42l45_primer1.bin
+# -Link: sdca/1fa/1028/edc/2.bin -> ../../cs42l45_primer2.bin
+# -Link: sdca/1fa/1028/edc/3.bin -> ../../cs42l45_primer3.bin
+# -Link: sdca/1fa/1028/edc/4.bin -> ../../cs42l45_primer4.bin
+# -Link: sdca/1fa/1028/edc/42450005.bin -> ../cs42l45_v20260930.bin
+# -
+# -File: sdca/1fa/1028/cs42l49_v20260921.bin
+# -Link: sdca/1fa/1028/f01/1.bin -> ../../cs42l45_primer1.bin
+# -Link: sdca/1fa/1028/f01/2.bin -> ../../cs42l45_primer2.bin
+# -Link: sdca/1fa/1028/f01/3.bin -> ../../cs42l45_primer3.bin
+# -Link: sdca/1fa/1028/f01/4.bin -> ../../cs42l45_primer4.bin
+# -Link: sdca/1fa/1028/f01/42450005.bin -> ../cs42l49_v20260921.bin
+# -Link: sdca/1fa/1028/f04/1.bin -> ../../cs42l45_primer1.bin
+# -Link: sdca/1fa/1028/f04/2.bin -> ../../cs42l45_primer2.bin
+# -Link: sdca/1fa/1028/f04/3.bin -> ../../cs42l45_primer3.bin
+# -Link: sdca/1fa/1028/f04/4.bin -> ../../cs42l45_primer4.bin
+# -Link: sdca/1fa/1028/f04/42450005.bin -> ../cs42l49_v20260921.bin
+# +Link: sdca/1fa/1028/f08/42450005.bin -> ../cs42l45_v20261030.bin
+#  
+#  File: sdca/1fa/17aa/cs42l45_v20260522.bin
+#  Link: sdca/1fa/17aa/2352/1.bin -> ../../cs42l45_primer1.bin
+# @@ -10321,6 +10744,30 @@
+#  Link: sdca/1fa/17aa/5159/4.bin -> ../../cs42l45_primer4.bin
+#  Link: sdca/1fa/17aa/5159/42450005.bin -> ../cs42l45_v20260522.bin
+#  
+# +File: sdca/1fa/17aa/cs42l45_v20261007.bin
+# +Link: sdca/1fa/17aa/2369/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/17aa/2369/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/17aa/2369/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/17aa/2369/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/17aa/2369/42450005.bin -> ../cs42l45_v20261007.bin
+# +Link: sdca/1fa/17aa/236a/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/17aa/236a/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/17aa/236a/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/17aa/236a/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/17aa/236a/42450005.bin -> ../cs42l45_v20261007.bin
+# +
+# +File: sdca/1fa/17aa/cs42l45_v20261106.bin
+# +Link: sdca/1fa/17aa/236b/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/17aa/236b/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/17aa/236b/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/17aa/236b/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/17aa/236b/42450005.bin -> ../cs42l45_v20261106.bin
+# +Link: sdca/1fa/17aa/236c/1.bin -> ../../cs42l45_primer1.bin
+# +Link: sdca/1fa/17aa/236c/2.bin -> ../../cs42l45_primer2.bin
+# +Link: sdca/1fa/17aa/236c/3.bin -> ../../cs42l45_primer3.bin
+# +Link: sdca/1fa/17aa/236c/4.bin -> ../../cs42l45_primer4.bin
+# +Link: sdca/1fa/17aa/236c/42450005.bin -> ../cs42l45_v20261106.bin
+# +
+#  File: sdca/1fa/144d/cs42l45_v20260820.bin
+#  Link: sdca/1fa/144d/c1dc/1.bin -> ../../cs42l45_primer1.bin
+#  Link: sdca/1fa/144d/c1dc/2.bin -> ../../cs42l45_primer2.bin
+# @@ -10395,11 +10842,16 @@
+#  
+#  File: nxp/sd_w61x_v1.bin.se
+#  Version: 18.99.3.p26.7
+# +Originates from
+# +https://github.com/nxp-imx/imx-firmware/tree/lf-6.12.34_2.1.0
+# +
+# +File: nxp/sd_iw610.bin.se
+# +Version: 18.99.8.p136
+# +Originates from
+# +https://github.com/nxp-imx/imx-firmware/tree/lf-6.18.37_2.1.0
+#  
+#  Licence: Redistributable. See LICENSE.nxp for details
+#  SPDX-License-Identifier: LicenseRef-LICENSE.nxp
+# -
+# -Originates from https://github.com/nxp-imx/imx-firmware/tree/lf-6.12.34_2.1.0
+#  
+#  --------------------------------------------------------------------------
+#  
+# @@ -10457,8 +10909,19 @@
+#  --------------------------------------------------------------------------
+#  
+#  Driver: Qualcomm ASoC tplg Firmware
+# +File: qcom/eliza/eliza-cqs-evk-tplg.bin
+#  File: qcom/glymur/GLYMUR-CRD-tplg.bin
+# +File: qcom/glymur/ASUSTeK/UX3407NA/GLYMUR-ASUS-Zenbook-A14-UX3407NA-tplg.bin
+# +Link: qcom/glymur/GLYMUR-ASUS-Zenbook-A14-UX3407NA-tplg.bin -> ASUSTeK/UX3407NA/GLYMUR-ASUS-Zenbook-A14-UX3407NA-tplg.bin
+# +File: qcom/glymur/ASUSTeK/UX3607OA/GLYMUR-ASUS-Zenbook-A16-UX3607OA-tplg.bin
+# +Link: qcom/glymur/GLYMUR-ASUS-Zenbook-A16-UX3607OA-tplg.bin -> ASUSTeK/UX3607OA/GLYMUR-ASUS-Zenbook-A16-UX3607OA-tplg.bin
+# +File: qcom/glymur/LENOVO/22A8/Lenovo-ThinkPad-T14s-Gen-7-tplg.bin
+# +Link: qcom/glymur/Lenovo-ThinkPad-T14s-Gen-7-tplg.bin -> LENOVO/22A8/Lenovo-ThinkPad-T14s-Gen-7-tplg.bin
+# +File: qcom/hawi/HAWI-MTP-tplg.bin
+#  File: qcom/kaanapali/Kaanapali-MTP-tplg.bin
+# +File: qcom/maili/MAILI-MTP-tplg.bin
+# +File: qcom/nord/NORD-RIDE-tplg.bin
+# +File: qcom/nord/NORD-RRD-tplg.bin
+#  File: qcom/qcm6490/QCM6490-IDP-tplg.bin
+#  File: qcom/qcs615/TALOS-EVK-tplg.bin
+#  File: qcom/qcs6490/radxa/dragon-q6a/QCS6490-Radxa-Dragon-Q6A-tplg.bin
+# @@ -10473,6 +10936,9 @@
+#  File: qcom/sa8775p/LEMANS-EVK-tplg.bin
+#  File: qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin
+#  Link: qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin -> LENOVO/21BX/audioreach-tplg.bin
+# +File: qcom/sc8280xp/radxa/dragon-q8b/SC8280XP-Radxa-Dragon-Q8B-tplg.bin
+# +File: qcom/shikra/shikra-cqs-evk-tplg.bin
+# +File: qcom/shikra/shikra-iqs-evk-tplg.bin
+#  File: qcom/sm8450/SM8450-HDK-tplg.bin
+#  File: qcom/sm8550/SM8550-HDK-tplg.bin
+#  File: qcom/sm8550/SM8550-QRD-tplg.bin
+# @@ -10486,6 +10952,8 @@
+#  Link: qcom/x1e80100/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin -> LENOVO/21N1/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin
+#  File: qcom/x1e80100/LENOVO/83ED/X1E80100-LENOVO-Yoga-Slim7x-tplg.bin
+#  Link: qcom/x1e80100/X1E80100-LENOVO-Yoga-Slim7x-tplg.bin -> LENOVO/83ED/X1E80100-LENOVO-Yoga-Slim7x-tplg.bin
+# +File: qcom/x1e80100/LENOVO/91B6/X1E80100-LENOVO-IdeaCentre-Mini-tplg.bin
+# +Link: qcom/x1e80100/X1E80100-LENOVO-IdeaCentre-Mini-tplg.bin -> LENOVO/91B6/X1E80100-LENOVO-IdeaCentre-Mini-tplg.bin
+#  File: qcom/x1e80100/X1E80100-EVK-tplg.bin
+#  File: qcom/x1e80100/ASUSTeK/vivobook-16/X1E80100-ASUS-Vivobook-16-tplg.bin
+#  Link: qcom/x1e80100/X1E80100-ASUS-Vivobook-16-tplg.bin -> ASUSTeK/vivobook-16/X1E80100-ASUS-Vivobook-16-tplg.bin
+# @@ -10494,7 +10962,10 @@
+#  File: qcom/x1e80100/ASUSTeK/zenbook-a14/X1E80100-ASUS-Zenbook-A14-tplg.bin
+#  Link: qcom/x1e80100/X1E80100-ASUS-Zenbook-A14-tplg.bin -> ASUSTeK/zenbook-a14/X1E80100-ASUS-Zenbook-A14-tplg.bin
+#  File: qcom/x1e80100/X1E001DE-DEVKIT-tplg.bin
+# +File: qcom/x1e80100/X1E80100-ACER-SWIFT-14-tplg.bin
+#  File: qcom/x1e80100/X1E80100-CRD-tplg.bin
+# +File: qcom/x1e80100/X1E80100-MEDION-SPRCHRGD-14-S1-tplg.bin
+# +File: qcom/x1e80100/X1E80100-Microsoft-Surface-Pro-11-tplg.bin
+#  File: qcom/x1e80100/X1E80100-Romulus-tplg.bin
+#  File: qcom/x1e80100/X1E80100-TUXEDO-Elite-14-tplg.bin
+#  File: qcom/x1e80100/dell/inspiron-14-plus-7441/X1E80100-Dell-Inspiron-14p-7441-tplg.bin
+# @@ -10507,8 +10978,8 @@
+#  Link: qcom/x1e80100/X1E80100-HP-OMNIBOOK-X14-tplg.bin -> hp/omnibook-x14/X1E80100-HP-OMNIBOOK-X14-tplg.bin
+#  File: qcom/x1e80100/X1P42100-Microsoft-Surface-Pro-12in-tplg.bin
+#  
+# -Version: v1.0.4
+# -Info: DATE=05.06.2026
+# +Version: v1.0.5
+# +Info: DATE=16.10.2026
+#  
+#  Licence: Redistributable. See LICENCE.linaro for details
+#  SPDX-License-Identifier: BSD-3-Clause
+# @@ -11284,6 +11755,8 @@
+#  Version: 5.8.200.7720_1029
+#  
+#  File: HP/ish/ish_ptl_12128606_581.7779.0.bin
+# +Link: intel/ish/ish_ptl_12128606_93ec38f0.bin -> ../../HP/ish/ish_ptl_12128606_581.7779.0.bin
+# +Info: product_name - "HP ZBook 8 G2i 14 inch Mobile Workstation PC"
+#  Version: 5.8.1.7779
+#  
+#  License: Redistributable. See LICENCE.HP for details
+# @@ -11295,6 +11768,9 @@
+#  File: dell/ish/ish_ptl_39ceeaf8_581.7779.0.bin
+#  File: dell/ish/ish_ptl_39ceeaf8_581.7783.0.bin
+#  Link: intel/ish/ish_ptl_39ceeaf8.bin -> ../../dell/ish/ish_ptl_39ceeaf8_581.7783.0.bin
+# +
+# +File: dell/ish/ish_nvlh_39ceeaf8_582.7822.0.bin
+# +Link: intel/ish/ish_nvlh_39ceeaf8.bin -> ../../dell/ish/ish_nvlh_39ceeaf8_582.7822.0.bin
+#  
+#  License: Redistributable. See LICENSE.dell for details
+#  SPDX-License-Identifier: LicenseRef-LICENSE.dell
+# @@ -11339,16 +11815,19 @@
+#  Driver: intel_vpu - Intel NPU driver
+#  
+#  File: intel/vpu/vpu_37xx_v1.bin
+# -Version: 20260820*MTL_CLIENT_SILICON-NVR+NN-deployment*6fc835a192052ac2261c4e1d5da7379ced95ae81*6fc835a192052ac2261c4e1d5da7379ced95ae81*6fc835a1920
+# +Version: 20261028*MTL_CLIENT_SILICON-NVR+NN-deployment*743046b1a1bd1fb278261547c4b4458172fc3bd0*743046b1a1bd1fb278261547c4b4458172fc3bd0*743046b
+#  Link: intel/vpu/vpu_37xx_v0.0.bin -> vpu_37xx_v1.bin
+#  
+#  File: intel/vpu/vpu_40xx_v1.bin
+# -Version: Aug 20 2026*NPU40xx*build/ci/npu-fw-ci-ci_branch_UD202638_npu_release_26ww32-20260813_185051-3a5e4dd1cf93522baa79e55a53f2ac7165723cad-1-g6fc835a1920*6fc835a192052ac2261c4e1d5da7379ced95ae81
+# +Version: Oct 28 2026*NPU40xx**743046b1a1bd1fb278261547c4b4458172fc3bd0
+#  Link: intel/vpu/vpu_40xx_v0.0.bin -> vpu_40xx_v1.bin
+#  
+#  File: intel/vpu/vpu_50xx_v1.bin
+# -Version: Aug 20 2026*NPU50xx*build/ci/npu-fw-ci-ci_branch_UD202638_npu_release_26ww32-20260813_185051-3a5e4dd1cf93522baa79e55a53f2ac7165723cad-1-g6fc835a1920*6fc835a192052ac2261c4e1d5da7379ced95ae81
+# +Version: Oct 28 2026*NPU50xx**743046b1a1bd1fb278261547c4b4458172fc3bd0
+#  Link: intel/vpu/vpu_50xx_v0.0.bin -> vpu_50xx_v1.bin
+# +
+# +File: intel/vpu/vpu_60xx_v1.bin
+# +Version: Oct 28 2026*NPU60xx**743046b1a1bd1fb278261547c4b4458172fc3bd0
+#  
+#  License: Redistributable. See LICENSE.intel_vpu for details
+#  SPDX-License-Identifier: LicenseRef-LICENSE.intel_vpu
+# @@ -11366,6 +11845,7 @@
+#  ---------------------------------------------------------------------------
+#  
+#  Driver: qcom-geni-se - Qualcomm QUPv3 firmware image file
+# +File: qcom/eliza/qupv3fw.elf
+#  File: qcom/sa8775p/qupv3fw.elf
+#  File: qcom/nord/qupv3fw.elf
+#  File: qcom/qcm6490/qupv3fw.elf
+# @@ -11427,6 +11907,15 @@
+#  
+#  Version: 56
+#  
+# +File: morsemicro/mm81x/v57/mm8108.bin
+# +File: morsemicro/mm81x/v57/bcf_mm8108_mf15457.bin
+# +File: morsemicro/mm81x/v57/bcf_aw_hm677.bin
+# +Link: morsemicro/mm81x/v57/bcf_boardtype_0804.bin -> bcf_mm8108_mf15457.bin
+# +Link: morsemicro/mm81x/v57/bcf_boardtype_0807.bin -> bcf_mm8108_mf15457.bin
+# +Link: morsemicro/mm81x/v57/bcf_boardtype_0a02.bin -> bcf_aw_hm677.bin
+# +
+# +Version: 57
+# +
+#  License: Redistributable. See LICENCE.morsemicro for details.
+#  SPDX-License-Identifier: LicenseRef-LICENCE.morsemicro
+#  
+# @@ -11446,10 +11935,20 @@
+#  
+#  --------------------------------------------------------------------------
+#  
+# -Driver: aic - AIC8800D80 U02 SDIO Wi-Fi support
+# +Driver: aic - AIC8800D80 U02 and AIC8800D80N U02/U02C SDIO Wi-Fi support
+#  
+#  File: aic/aic8800d80/fmacfw_8800d80_u02.bin
+#  Version: v6.9.1.1
+# +File: aic/aic8800d80/aic_userconfig_8800d80.txt
+# +File: aic/aic8800d80n/aic_userconfig_8800d80n.txt
+# +File: aic/aic8800d80n/fmacfw_calib_8800d80n_u02.bin
+# +File: aic/aic8800d80n/fmacfw_cinit_8800d80n_u02.bin
+# +File: aic/aic8800d80n/fmacfw_patch_8800d80n_u02.bin
+# +File: aic/aic8800d80n/fmacfw_patch_tbl_8800d80n_u02.bin
+# +File: aic/aic8800d80n/fmacfw_calib_8800d80n_u02c.bin
+# +File: aic/aic8800d80n/fmacfw_cinit_8800d80n_u02c.bin
+# +File: aic/aic8800d80n/fmacfw_patch_8800d80n_u02c.bin
+# +File: aic/aic8800d80n/fmacfw_patch_tbl_8800d80n_u02c.bin
+#  
+#  Licence: Redistributable. See LICENSE.aic for details.
+#  SPDX-License-Identifier: LicenseRef-LICENSE.aic
+# 
+#
+
 SUMMARY = "Firmware files for use with Linux kernel"
 HOMEPAGE = "https://www.kernel.org/"
 DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
@@ -275,7 +1826,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/LICENCE.Abilis;md5=b5ee3f410780e56711ad48ead
                     file://LICENSES/LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
                     file://LICENSES/LICENSE.xe;md5=c674d38774242bc0c528214721488118 \
                     file://LICENSES/LICENCE.wf200;md5=4d1beff00d902c05c9c7e95a5d8eb52d \
-                    file://WHENCE;md5=${WHENCE_CHKSUM} \
+                    file://WHENCE;md5=5fdc74405b5d6ee112d4f482ccdae43b \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
@@ -419,7 +1970,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "a10d1ab5baf2c74ba92e8c7cf313e691696c26bddfa6df00db795e48d70cd4ca"
+SRC_URI[sha256sum] = "2cabe10253005f55bf4bbc0ebb25c0964d66f7c4121ffa47853ff1e70ea1aa54"
 
 inherit allarch
 
-- 
2.47.1


--===============7172860586474665489==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20261019-20261124.patch"

RnJvbSBhODEyZGE4MTM0ZTVmZDc5MTJlNDkyYzljMmE5MjRmN2IwYzUxMjEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjUgTm92IDIwMjYgMDU6NDk6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDI2MTAxOSAtPiAyMDI2MTEyNAoKLS0tCiAuLi4yMDI2
MTAxOS5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDI2MTEyNC5iYn0gfCAxNTU1ICsrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTU1MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUve2xpbnV4LWZpcm13
YXJlXzIwMjYxMDE5LmJiID0+IGxpbnV4LWZpcm13YXJlXzIwMjYxMTI0LmJifSAoNzAlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdh
cmVfMjAyNjEwMTkuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4
LWZpcm13YXJlXzIwMjYxMTI0LmJiCnNpbWlsYXJpdHkgaW5kZXggNzAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVfMjAyNjEwMTku
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyNjExMjQuYmIKaW5kZXggMDEzNDFhODFmZi4uZjc2N2JkMDAyYiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDI2
MTAxOS5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZp
cm13YXJlXzIwMjYxMTI0LmJiCkBAIC0xLDMgKzEsMTU1NCBAQAorIyBGSVhNRTogdGhlIExJQ19G
SUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUn
LgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQg
dGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUg
aWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVz
c2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBk
YXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMg
LS0tIFdIRU5DRQorIyArKysgV0hFTkNFCisjIEBAIC05NTksMzEgKzk1OSwzMSBAQAorIyAgCisj
ICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktY2MtYTAtNzcudWNvZGUKKyMgIExpbms6IGl3
bHdpZmktY2MtYTAtNzcudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWNjLWEwLTc3LnVj
b2RlCisjIC1WZXJzaW9uOiA3NC41NjNhNmU5Mi4wCisjICtWZXJzaW9uOiA3NC4zY2RhMmEyYy4w
CisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1RdS1iMC1oci1iMC03Ny51Y29k
ZQorIyAgTGluazogaXdsd2lmaS1RdS1iMC1oci1iMC03Ny51Y29kZSAtPiBpbnRlbC9pd2x3aWZp
L2l3bHdpZmktUXUtYjAtaHItYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LjU2M2E2ZTkyLjAK
KyMgK1ZlcnNpb246IDc0LjNjZGEyYTJjLjAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9p
d2x3aWZpLVF1LWIwLWpmLWIwLTc3LnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLVF1LWIwLWpmLWIw
LTc3LnVjb2RlIC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS1RdS1iMC1qZi1iMC03Ny51Y29kZQor
IyAtVmVyc2lvbjogNzQuNTYzYTZlOTIuMAorIyArVmVyc2lvbjogNzQuM2NkYTJhMmMuMAorIyAg
CisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktUXUtYzAtaHItYjAtNzcudWNvZGUKKyMg
IExpbms6IGl3bHdpZmktUXUtYzAtaHItYjAtNzcudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3
aWZpLVF1LWMwLWhyLWIwLTc3LnVjb2RlCisjIC1WZXJzaW9uOiA3NC41NjNhNmU5Mi4wCisjICtW
ZXJzaW9uOiA3NC4zY2RhMmEyYy4wCisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lm
aS1RdS1jMC1qZi1iMC03Ny51Y29kZQorIyAgTGluazogaXdsd2lmaS1RdS1jMC1qZi1iMC03Ny51
Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktUXUtYzAtamYtYjAtNzcudWNvZGUKKyMgLVZl
cnNpb246IDc0LjU2M2E2ZTkyLjAKKyMgK1ZlcnNpb246IDc0LjNjZGEyYTJjLjAKKyMgIAorIyAg
RmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLVF1Wi1hMC1oci1iMC03Ny51Y29kZQorIyAgTGlu
azogaXdsd2lmaS1RdVotYTAtaHItYjAtNzcudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZp
LVF1Wi1hMC1oci1iMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuNTYzYTZlOTIuMAorIyArVmVy
c2lvbjogNzQuM2NkYTJhMmMuMAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmkt
UXVaLWEwLWpmLWIwLTc3LnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLVF1Wi1hMC1qZi1iMC03Ny51
Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktUXVaLWEwLWpmLWIwLTc3LnVjb2RlCisjIC1W
ZXJzaW9uOiA3NC41NjNhNmU5Mi4wCisjICtWZXJzaW9uOiA3NC4zY2RhMmEyYy4wCisjICAKKyMg
IEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS10eS1hMC1nZi1hMC03Ny51Y29kZQorIyAgTGlu
azogaXdsd2lmaS10eS1hMC1nZi1hMC03Ny51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmkt
dHktYTAtZ2YtYTAtNzcudWNvZGUKKyMgQEAgLTEwMTUsNyArMTAxNSw3IEBACisjICAKKyMgIEZp
bGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS10eS1hMC1nZi1hMC04OS51Y29kZQorIyAgTGluazog
aXdsd2lmaS10eS1hMC1nZi1hMC04OS51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktdHkt
YTAtZ2YtYTAtODkudWNvZGUKKyMgLVZlcnNpb246IDg2LmIyMGRjZDFmLjAKKyMgK1ZlcnNpb246
IDg2LmE2NzAyM2IyLjAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEw
LWdmNC1hMC03Ny51Y29kZQorIyAgTGluazogaXdsd2lmaS1zby1hMC1nZjQtYTAtNzcudWNvZGUg
LT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWdmNC1hMC03Ny51Y29kZQorIyBAQCAtMTA0
Nyw3ICsxMDQ3LDcgQEAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEw
LWdmNC1hMC04OS51Y29kZQorIyAgTGluazogaXdsd2lmaS1zby1hMC1nZjQtYTAtODkudWNvZGUg
LT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWdmNC1hMC04OS51Y29kZQorIyAtVmVyc2lv
bjogODYuYjIwZGNkMWYuMAorIyArVmVyc2lvbjogODYuYTY3MDIzYjIuMAorIyAgCisjICBGaWxl
OiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc28tYTAtZ2YtYTAtNzcudWNvZGUKKyMgIExpbms6IGl3
bHdpZmktc28tYTAtZ2YtYTAtNzcudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEw
LWdmLWEwLTc3LnVjb2RlCisjIEBAIC0xMDc5LDcgKzEwNzksNyBAQAorIyAgCisjICBGaWxlOiBp
bnRlbC9pd2x3aWZpL2l3bHdpZmktc28tYTAtZ2YtYTAtODkudWNvZGUKKyMgIExpbms6IGl3bHdp
Zmktc28tYTAtZ2YtYTAtODkudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWdm
LWEwLTg5LnVjb2RlCisjIC1WZXJzaW9uOiA4Ni5iMjBkY2QxZi4wCisjICtWZXJzaW9uOiA4Ni5h
NjcwMjNiMi4wCisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zby1hMC1oci1i
MC03Ny51Y29kZQorIyAgTGluazogaXdsd2lmaS1zby1hMC1oci1iMC03Ny51Y29kZSAtPiBpbnRl
bC9pd2x3aWZpL2l3bHdpZmktc28tYTAtaHItYjAtNzcudWNvZGUKKyMgQEAgLTExMDcsMTEgKzEx
MDcsMTEgQEAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWhyLWIw
LTg5LnVjb2RlCisjICBMaW5rOiBpd2x3aWZpLXNvLWEwLWhyLWIwLTg5LnVjb2RlIC0+IGludGVs
L2l3bHdpZmkvaXdsd2lmaS1zby1hMC1oci1iMC04OS51Y29kZQorIyAtVmVyc2lvbjogODYuYjIw
ZGNkMWYuMAorIyArVmVyc2lvbjogODYuYTY3MDIzYjIuMAorIyAgCisjICBGaWxlOiBpbnRlbC9p
d2x3aWZpL2l3bHdpZmktc28tYTAtamYtYjAtNzcudWNvZGUKKyMgIExpbms6IGl3bHdpZmktc28t
YTAtamYtYjAtNzcudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWpmLWIwLTc3
LnVjb2RlCisjIC1WZXJzaW9uOiA3NC5mOTJiNWZlZC4wCisjICtWZXJzaW9uOiA3NC4zY2RhMmEy
Yy4wCisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS10eS1hMC1nZi1hMC5wbnZt
CisjICBMaW5rOiBpd2x3aWZpLXR5LWEwLWdmLWEwLnBudm0gLT4gaW50ZWwvaXdsd2lmaS9pd2x3
aWZpLXR5LWEwLWdmLWEwLnBudm0KKyMgQEAgLTExMzAsNyArMTEzMCw3IEBACisjICAKKyMgIEZp
bGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC1oci1iMC0xMDAudWNvZGUKKyMgIExpbms6
IGl3bHdpZmktYnotYjAtaHItYjAtMTAwLnVjb2RlIC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS1i
ei1iMC1oci1iMC0xMDAudWNvZGUKKyMgLVZlcnNpb246IDk3LjU4NTBhMGMyLjAKKyMgK1ZlcnNp
b246IDk3LjI1ZjZjMzMxLjAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6
LWIwLWhyLWIwLnBudm0KKyMgIExpbms6IGl3bHdpZmktYnotYjAtaHItYjAucG52bSAtPiBpbnRl
bC9pd2x3aWZpL2l3bHdpZmktYnotYjAtaHItYjAucG52bQorIyBAQCAtMTE1Nyw3ICsxMTU3LDcg
QEAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6LWIwLWdmLWEwLTEwMC51
Y29kZQorIyAgTGluazogaXdsd2lmaS1iei1iMC1nZi1hMC0xMDAudWNvZGUgLT4gaW50ZWwvaXds
d2lmaS9pd2x3aWZpLWJ6LWIwLWdmLWEwLTEwMC51Y29kZQorIyAtVmVyc2lvbjogOTcuNTg1MGEw
YzIuMAorIyArVmVyc2lvbjogOTcuMjVmNmMzMzEuMAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3
aWZpL2l3bHdpZmktYnotYjAtZ2YtYTAucG52bQorIyAgTGluazogaXdsd2lmaS1iei1iMC1nZi1h
MC5wbnZtIC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC1nZi1hMC5wbnZtCisjIEBAIC0x
MjE4LDYgKzEyMTgsMTAgQEAKKyMgIExpbms6IGl3bHdpZmktZ2wtYzAtZm0tYzAtYzEwOC51Y29k
ZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktZ2wtYzAtZm0tYzAtYzEwOC51Y29kZQorIyAgVmVy
c2lvbjogMTA4LjQ1MTA1ODcyLjAKKyMgIAorIyArRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZp
LWdsLWMwLWZtLWMwLWMxMDkudWNvZGUKKyMgK0xpbms6IGl3bHdpZmktZ2wtYzAtZm0tYzAtYzEw
OS51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktZ2wtYzAtZm0tYzAtYzEwOS51Y29kZQor
IyArVmVyc2lvbjogMTA5LmIxNjU0NjFjLjAKKyMgKworIyAgRmlsZTogaW50ZWwvaXdsd2lmaS9p
d2x3aWZpLWdsLWMwLWZtLWMwLWMxMDEudWNvZGUKKyMgIExpbms6IGl3bHdpZmktZ2wtYzAtZm0t
YzAtYzEwMS51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktZ2wtYzAtZm0tYzAtYzEwMS51
Y29kZQorIyAgVmVyc2lvbjogMTAxLjZlNjk1YTcwLjAKKyMgQEAgLTEyNzksNyArMTI4Myw3IEBA
CisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC1mbS1jMC1jMTA3LnVj
b2RlCisjICBMaW5rOiBpd2x3aWZpLWJ6LWIwLWZtLWMwLWMxMDcudWNvZGUgLT4gaW50ZWwvaXds
d2lmaS9pd2x3aWZpLWJ6LWIwLWZtLWMwLWMxMDcudWNvZGUKKyMgLVZlcnNpb246IDEwNy5iMmEw
ZDRiMmsuMAorIyArVmVyc2lvbjogMTA3LjE1ZDBmN2Qzay4wCisjICAKKyMgIEZpbGU6IGludGVs
L2l3bHdpZmkvaXdsd2lmaS1iei1iMC1mbS1jMC5wbnZtCisjICBMaW5rOiBpd2x3aWZpLWJ6LWIw
LWZtLWMwLnBudm0gLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6LWIwLWZtLWMwLnBudm0KKyMg
QEAgLTEyOTQsNyArMTI5OCw3IEBACisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lm
aS1tYS1iMC1nZi1hMC04OS51Y29kZQorIyAgTGluazogaXdsd2lmaS1tYS1iMC1nZi1hMC04OS51
Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktbWEtYjAtZ2YtYTAtODkudWNvZGUKKyMgLVZl
cnNpb246IDg2LmIyMGRjZDFmLjAKKyMgK1ZlcnNpb246IDg2LmE2NzAyM2IyLjAKKyMgIAorIyAg
RmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLW1hLWIwLWdmLWEwLnBudm0KKyMgIExpbms6IGl3
bHdpZmktbWEtYjAtZ2YtYTAucG52bSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktbWEtYjAtZ2Yt
YTAucG52bQorIyBAQCAtMTMwOSw3ICsxMzEzLDcgQEAKKyMgIAorIyAgRmlsZTogaW50ZWwvaXds
d2lmaS9pd2x3aWZpLW1hLWIwLWdmNC1hMC04OS51Y29kZQorIyAgTGluazogaXdsd2lmaS1tYS1i
MC1nZjQtYTAtODkudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLW1hLWIwLWdmNC1hMC04
OS51Y29kZQorIyAtVmVyc2lvbjogODYuYjIwZGNkMWYuMAorIyArVmVyc2lvbjogODYuYTY3MDIz
YjIuMAorIyAgCisjICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktbWEtYjAtZ2Y0LWEwLnBu
dm0KKyMgIExpbms6IGl3bHdpZmktbWEtYjAtZ2Y0LWEwLnBudm0gLT4gaW50ZWwvaXdsd2lmaS9p
d2x3aWZpLW1hLWIwLWdmNC1hMC5wbnZtCisjIEBAIC0xMzI0LDcgKzEzMjgsNyBAQAorIyAgCisj
ICBGaWxlOiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktbWEtYjAtaHItYjAtODkudWNvZGUKKyMgIExp
bms6IGl3bHdpZmktbWEtYjAtaHItYjAtODkudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZp
LW1hLWIwLWhyLWIwLTg5LnVjb2RlCisjIC1WZXJzaW9uOiA4Ni5iMjBkY2QxZi4wCisjICtWZXJz
aW9uOiA4Ni5hNjcwMjNiMi4wCisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1z
Yy1hMC13aC1iMC0xMDEudWNvZGUKKyMgIExpbms6IGl3bHdpZmktc2MtYTAtd2gtYjAtMTAxLnVj
b2RlIC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC13aC1iMC0xMDEudWNvZGUKKyMgQEAg
LTEzNDYsMTcgKzEzNTAsMjEgQEAKKyMgIExpbms6IGl3bHdpZmktc2MtYTAtd2gtYjAtYzEwOC51
Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc2MtYTAtd2gtYjAtYzEwOC51Y29kZQorIyAg
VmVyc2lvbjogMTA4LjQ1MTA1ODcyLjAKKyMgIAorIyArRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3
aWZpLXNjLWEwLXdoLWIwLWMxMDkudWNvZGUKKyMgK0xpbms6IGl3bHdpZmktc2MtYTAtd2gtYjAt
YzEwOS51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc2MtYTAtd2gtYjAtYzEwOS51Y29k
ZQorIyArVmVyc2lvbjogMTA5LmIxNjU0NjFjLjAKKyMgKworIyAgRmlsZTogaW50ZWwvaXdsd2lm
aS9pd2x3aWZpLXNjLWEwLXdoLWIwLWMxMDEudWNvZGUKKyMgIExpbms6IGl3bHdpZmktc2MtYTAt
d2gtYjAtYzEwMS51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc2MtYTAtd2gtYjAtYzEw
MS51Y29kZQorIyAgVmVyc2lvbjogMTAxLjZlNjk1YTcwLjAKKyMgIAorIyAgRmlsZTogaW50ZWwv
aXdsd2lmaS9pd2x3aWZpLXNjLWEwLXdoLWIwLWMxMDIudWNvZGUKKyMgIExpbms6IGl3bHdpZmkt
c2MtYTAtd2gtYjAtYzEwMi51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc2MtYTAtd2gt
YjAtYzEwMi51Y29kZQorIyAtVmVyc2lvbjogMTAyLjA3ZmNhMTY4LjAKKyMgK1ZlcnNpb246IDEw
Mi42NTFiYmVkNi4wCisjICAKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1n
Zi1hMC0xMDAudWNvZGUKKyMgIExpbms6IGl3bHdpZmktc2MtYTAtZ2YtYTAtMTAwLnVjb2RlIC0+
IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1nZi1hMC0xMDAudWNvZGUKKyMgLVZlcnNpb246
IDk3LjU4NTBhMGMyLjAKKyMgK1ZlcnNpb246IDk3LjI1ZjZjMzMxLjAKKyMgIAorIyAgRmlsZTog
aW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNjLWEwLWZtLWMwLWMxMDEudWNvZGUKKyMgIExpbms6IGl3
bHdpZmktc2MtYTAtZm0tYzAtYzEwMS51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc2Mt
YTAtZm0tYzAtYzEwMS51Y29kZQorIyBAQCAtMTM4Miw2ICsxMzkwLDEwIEBACisjICBMaW5rOiBp
d2x3aWZpLXNjLWEwLWZtLWMwLWMxMDgudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNj
LWEwLWZtLWMwLWMxMDgudWNvZGUKKyMgIFZlcnNpb246IDEwOC40NTEwNTg3Mi4wCisjICAKKyMg
K0ZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1mbS1jMC1jMTA5LnVjb2RlCisjICtM
aW5rOiBpd2x3aWZpLXNjLWEwLWZtLWMwLWMxMDkudWNvZGUgLT4gaW50ZWwvaXdsd2lmaS9pd2x3
aWZpLXNjLWEwLWZtLWMwLWMxMDkudWNvZGUKKyMgK1ZlcnNpb246IDEwOS5iMTY1NDYxYy4wCisj
ICsKKyMgIEZpbGU6IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC13aC1iMC1jMTAyLnVjb2Rl
CisjICBMaW5rOiBpd2x3aWZpLWJ6LWIwLXdoLWIwLWMxMDIudWNvZGUgLT4gaW50ZWwvaXdsd2lm
aS9pd2x3aWZpLWJ6LWIwLXdoLWIwLWMxMDIudWNvZGUKKyMgIFZlcnNpb246IDEwMi4wN2ZjYTE2
OC4wCisjIEBAIC0xMzk4LDkgKzE0MTAsMjUgQEAKKyMgIExpbms6IGl3bHdpZmktYnotYjAtd2gt
YjAtYzEwNy51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktYnotYjAtd2gtYjAtYzEwNy51
Y29kZQorIyAgVmVyc2lvbjogMTA3LjFiNDQ0NzQ3LjAKKyMgIAorIyArRmlsZTogaW50ZWwvaXds
d2lmaS9pd2x3aWZpLXNjMi1hMC13aC1iMC1jMTA3LnVjb2RlCisjICtMaW5rOiBpd2x3aWZpLXNj
Mi1hMC13aC1iMC1jMTA3LnVjb2RlIC0+IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYzItYTAtd2gt
YjAtYzEwNy51Y29kZQorIyArVmVyc2lvbjogMTA3LmI5ZTg4N2EyLjAKKyMgKworIyAgRmlsZTog
aW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6LWIwLXdoLWIwLWMxMDgudWNvZGUKKyMgIExpbms6IGl3
bHdpZmktYnotYjAtd2gtYjAtYzEwOC51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktYnot
YjAtd2gtYjAtYzEwOC51Y29kZQorIyAgVmVyc2lvbjogMTA4LjQ1MTA1ODcyLjAKKyMgKworIyAr
RmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6LWIwLXdoLWIwLWMxMDkudWNvZGUKKyMgK0xp
bms6IGl3bHdpZmktYnotYjAtd2gtYjAtYzEwOS51Y29kZSAtPiBpbnRlbC9pd2x3aWZpL2l3bHdp
ZmktYnotYjAtd2gtYjAtYzEwOS51Y29kZQorIyArVmVyc2lvbjogMTA5LmIxNjU0NjFjLjAKKyMg
KworIyArRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNjMi1hMC13aC1iMC1jMTA4LnVjb2Rl
CisjICtMaW5rOiBpd2x3aWZpLXNjMi1hMC13aC1iMC1jMTA4LnVjb2RlIC0+IGludGVsL2l3bHdp
ZmkvaXdsd2lmaS1zYzItYTAtd2gtYjAtYzEwOC51Y29kZQorIyArVmVyc2lvbjogMTA4LjQ1MTA1
ODcyLjAKKyMgKworIyArRmlsZTogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNjMi1hMC13aC1iMC1j
MTA5LnVjb2RlCisjICtMaW5rOiBpd2x3aWZpLXNjMi1hMC13aC1iMC1jMTA5LnVjb2RlIC0+IGlu
dGVsL2l3bHdpZmkvaXdsd2lmaS1zYzItYTAtd2gtYjAtYzEwOS51Y29kZQorIyArVmVyc2lvbjog
MTA5LmIxNjU0NjFjLjAKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElD
RU5DRS5pd2x3aWZpX2Zpcm13YXJlIGZvciBkZXRhaWxzCisjICBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogTGljZW5zZVJlZi1MSUNFTkNFLml3bHdpZmlfZmlybXdhcmUKKyMgQEAgLTE0MzUsNyAr
MTQ2Myw3IEBACisjICAKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICAKKyMgLURyaXZlcjogaW50
ZWwtaXB1Ni1pc3lzIC0gSW50ZWwgSVBVNiAoSW1hZ2UgUHJvY2Vzc2luZyBVbml0IDYpIGRyaXZl
cgorIyArRHJpdmVyOiBpbnRlbC1pcHU2IC0gSW50ZWwgSVBVNiAoSW1hZ2UgUHJvY2Vzc2luZyBV
bml0IDYpIGRyaXZlcgorIyAgCisjICBGaWxlOiBpbnRlbC9pcHUvaXB1NmVwYWRsbl9mdy5iaW4K
KyMgIEZpbGU6IGludGVsL2lwdS9pcHU2ZXBfZncuYmluCisjIEBAIC0xNDQ5LDE1ICsxNDc3LDE0
IEBACisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLml2c2MgZm9yIGRl
dGFpbHMKKyMgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UuaXZz
YworIyAgCisjIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAtCisjIC1Ecml2ZXI6IGludGVsLWlwdTct
aXN5cyAtIEludGVsIElQVTcgKEltYWdlIFByb2Nlc3NpbmcgVW5pdCA3KSBkcml2ZXIKKyMgLQor
IyAgRmlsZTogaW50ZWwvaXB1L2lwdTdfZncuYmluCisjICBWZXJzaW9uOiBtYXN0ZXJfcmVsZWFz
ZV8yMDI0MDYyOF8xODU0CisjICAKKyMgIEZpbGU6IGludGVsL2lwdS9pcHU3cHRsX2Z3LmJpbgor
IyAgVmVyc2lvbjogMS4yLjEuMjAyNTEyMTVfMjI0NTMxCisjICsKKyMgK0ZpbGU6IGludGVsL2lw
dS9pcHU4X2Z3LmJpbgorIyArVmVyc2lvbjogMS4wLjE1LjIwMjYwOTA5XzIyMzUzMworIyAgCisj
ICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmludGVsIGZvciBkZXRhaWxz
CisjICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLmludGVsCisj
IEBAIC0yMjE3LDYgKzIyNDQsMjMgQEAKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxl
LiBTZWUgTElDRU5TRS5haXJvaGEgZm9yIGRldGFpbHMuCisjICBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLmFpcm9oYQorIyArCisjICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQorIyArCisjICtEcml2ZXI6IGF3ODgzOTkgLSBhd2luaWMgU21hcnRLIEFNUCBkcml2ZXIuCisj
ICsKKyMgK0ZpbGU6IGF3aW5pYy9hdzg4Mzk5X2FjZl8xN2FhMzkwNi5iaW4KKyMgK0ZpbGU6IGF3
aW5pYy9hdzg4Mzk5X2FjZl8xN2FhMzkwNy5iaW4KKyMgK0ZpbGU6IGF3aW5pYy9hdzg4Mzk5X2Fj
Zl8xN2FhMzkyNy5iaW4KKyMgK0ZpbGU6IGF3aW5pYy9hdzg4Mzk5X2FjZl8xN2FhMzkyOC5iaW4K
KyMgK0ZpbGU6IGF3aW5pYy9hdzg4Mzk5X2FjZl8xN2FhMzkzNi5iaW4KKyMgK0ZpbGU6IGF3aW5p
Yy9hdzg4Mzk5X2FjZl8xN2FhMzkzNy5iaW4KKyMgK0ZpbGU6IGF3aW5pYy9hdzg4Mzk5X2FjZl8x
N2FhMzkzOC5iaW4KKyMgK0ZpbGU6IGF3aW5pYy9hdzg4Mzk5X2FjZl8xN2FhMzkzOS5iaW4KKyMg
KworIyArVmVyc2lvbjogMS4wCisjICsKKyMgK0xpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2Vl
IExJQ0VOU0UuYXdpbmljIGZvciBkZXRhaWxzLgorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQor
IyAgCisjIEBAIC0yNzkwLDIwICsyODM0LDQ4IEBACisjICBGaWxlOiBhbWRncHUvZ2NfMTFfNV8z
X21lc18yLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzExXzVfM19wZnAuYmluCisjICBGaWxlOiBh
bWRncHUvZ2NfMTFfNV8zX3JsYy5iaW4KKyMgLUZpbGU6IGFtZGdwdS9nY18xMV83XzBfaW11LmJp
bgorIyArRmlsZTogYW1kZ3B1L2djXzExXzdfMF9pbXVfcC5iaW4KKyMgK0xpbms6IGFtZGdwdS9n
Y18xMV83XzBfaW11LmJpbiAtPiBnY18xMV83XzBfaW11X3AuYmluCisjICtMaW5rOiBhbWRncHUv
Z2NfMTFfN18wX2ltdV9sLmJpbiAtPiBnY18xMV83XzBfaW11X3AuYmluCisjICBGaWxlOiBhbWRn
cHUvZ2NfMTFfN18wX21lLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzdfMF9tZV9sLmJpbgor
IyArRmlsZTogYW1kZ3B1L2djXzExXzdfMF9tZV9wLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzEx
XzdfMF9tZWMuYmluCisjICtGaWxlOiBhbWRncHUvZ2NfMTFfN18wX21lY19sLmJpbgorIyArRmls
ZTogYW1kZ3B1L2djXzExXzdfMF9tZWNfcC5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMV83XzBf
bWVzMS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV83XzBfbWVzMV9sLmJpbgorIyArRmlsZTog
YW1kZ3B1L2djXzExXzdfMF9tZXMxX3AuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTFfN18wX21l
c18yLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzdfMF9tZXNfMl9sLmJpbgorIyArRmlsZTog
YW1kZ3B1L2djXzExXzdfMF9tZXNfMl9wLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzExXzdfMF9w
ZnAuYmluCisjICtGaWxlOiBhbWRncHUvZ2NfMTFfN18wX3BmcF9sLmJpbgorIyArRmlsZTogYW1k
Z3B1L2djXzExXzdfMF9wZnBfcC5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMV83XzBfcmxjLmJp
bgorIyAtRmlsZTogYW1kZ3B1L2djXzExXzdfMV9pbXUuYmluCisjICtGaWxlOiBhbWRncHUvZ2Nf
MTFfN18wX3JsY19sLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzdfMF9ybGNfcC5iaW4KKyMg
K0ZpbGU6IGFtZGdwdS9nY18xMV83XzFfaW11X3AuYmluCisjICtMaW5rOiBhbWRncHUvZ2NfMTFf
N18xX2ltdS5iaW4gLT4gZ2NfMTFfN18xX2ltdV9wLmJpbgorIyArTGluazogYW1kZ3B1L2djXzEx
XzdfMV9pbXVfbC5iaW4gLT4gZ2NfMTFfN18xX2ltdV9wLmJpbgorIyAgRmlsZTogYW1kZ3B1L2dj
XzExXzdfMV9tZS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV83XzFfbWVfbC5iaW4KKyMgK0Zp
bGU6IGFtZGdwdS9nY18xMV83XzFfbWVfcC5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMV83XzFf
bWVjLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzdfMV9tZWNfbC5iaW4KKyMgK0ZpbGU6IGFt
ZGdwdS9nY18xMV83XzFfbWVjX3AuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTFfN18xX21lczEu
YmluCisjICtGaWxlOiBhbWRncHUvZ2NfMTFfN18xX21lczFfbC5iaW4KKyMgK0ZpbGU6IGFtZGdw
dS9nY18xMV83XzFfbWVzMV9wLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzExXzdfMV9tZXNfMi5i
aW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV83XzFfbWVzXzJfbC5iaW4KKyMgK0ZpbGU6IGFtZGdw
dS9nY18xMV83XzFfbWVzXzJfcC5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMV83XzFfcGZwLmJp
bgorIyArRmlsZTogYW1kZ3B1L2djXzExXzdfMV9wZnBfbC5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9n
Y18xMV83XzFfcGZwX3AuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTFfN18xX3JsYy5iaW4KKyMg
K0ZpbGU6IGFtZGdwdS9nY18xMV83XzFfcmxjX2wuYmluCisjICtGaWxlOiBhbWRncHUvZ2NfMTFf
N18xX3JsY19wLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzEyXzBfMF9pbXUuYmluCisjICBGaWxl
OiBhbWRncHUvZ2NfMTJfMF8wX21lLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzEyXzBfMF9tZWMu
YmluCisjIEBAIC0yODM0LDYgKzI5MDYsOCBAQAorIyAgRmlsZTogYW1kZ3B1L2Rjbl8zXzZfZG1j
dWIuYmluCisjICBGaWxlOiBhbWRncHUvZGNuXzRfMF8xX2RtY3ViLmJpbgorIyAgRmlsZTogYW1k
Z3B1L2Rjbl80XzJfZG1jdWIuYmluCisjICtGaWxlOiBhbWRncHUvZGNuXzRfMl9kbWN1Yl9sLmJp
bgorIyArRmlsZTogYW1kZ3B1L2Rjbl80XzJfZG1jdWJfcC5iaW4KKyMgIEZpbGU6IGFtZGdwdS9w
c3BfMTNfMF8wX3Nvcy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9wc3BfMTNfMF8wX3Nvc19raWNrZXIu
YmluCisjICBGaWxlOiBhbWRncHUvcHNwXzEzXzBfMF90YS5iaW4KKyMgQEAgLTI4NzUsOSArMjk0
OSwxNyBAQAorIyAgRmlsZTogYW1kZ3B1L3BzcF8xNF8wXzVfdGEuYmluCisjICBGaWxlOiBhbWRn
cHUvcHNwXzE0XzBfNV90b2MuYmluCisjICBGaWxlOiBhbWRncHUvcHNwXzE1XzBfMF90YS5iaW4K
KyMgK0ZpbGU6IGFtZGdwdS9wc3BfMTVfMF8wX3RhX2wuYmluCisjICtGaWxlOiBhbWRncHUvcHNw
XzE1XzBfMF90YV9wLmJpbgorIyAgRmlsZTogYW1kZ3B1L3BzcF8xNV8wXzBfdG9jLmJpbgorIyAr
RmlsZTogYW1kZ3B1L3BzcF8xNV8wXzBfdG9jX2wuYmluCisjICtGaWxlOiBhbWRncHUvcHNwXzE1
XzBfMF90b2NfcC5iaW4KKyMgIEZpbGU6IGFtZGdwdS9wc3BfMTVfMF85X3RhLmJpbgorIyArRmls
ZTogYW1kZ3B1L3BzcF8xNV8wXzlfdGFfbC5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9wc3BfMTVfMF85
X3RhX3AuYmluCisjICBGaWxlOiBhbWRncHUvcHNwXzE1XzBfOV90b2MuYmluCisjICtGaWxlOiBh
bWRncHUvcHNwXzE1XzBfOV90b2NfbC5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9wc3BfMTVfMF85X3Rv
Y19wLmJpbgorIyAgRmlsZTogYW1kZ3B1L3NkbWFfNF80XzIuYmluCisjICBGaWxlOiBhbWRncHUv
c2RtYV80XzRfNC5iaW4KKyMgIEZpbGU6IGFtZGdwdS9zZG1hXzRfNF81LmJpbgorIyBAQCAtMjg5
Miw2ICsyOTc0LDggQEAKKyMgIEZpbGU6IGFtZGdwdS9zZG1hXzZfMV8yLmJpbgorIyAgRmlsZTog
YW1kZ3B1L3NkbWFfNl8xXzMuYmluCisjICBGaWxlOiBhbWRncHUvc2RtYV82XzFfNC5iaW4KKyMg
K0ZpbGU6IGFtZGdwdS9zZG1hXzZfMV80X2wuYmluCisjICtGaWxlOiBhbWRncHUvc2RtYV82XzFf
NF9wLmJpbgorIyAgRmlsZTogYW1kZ3B1L3NkbWFfN18wXzAuYmluCisjICBGaWxlOiBhbWRncHUv
c2RtYV83XzBfMS5iaW4KKyMgIEZpbGU6IGFtZGdwdS9zbXVfMTNfMF8wLmJpbgorIyBAQCAtMjkx
Niw3ICszMDAwLDExIEBACisjICBGaWxlOiBhbWRncHUvdmNuXzVfMF8wLmJpbgorIyAgRmlsZTog
YW1kZ3B1L3Zjbl81XzBfMS5iaW4KKyMgIEZpbGU6IGFtZGdwdS92Y25fNV8zXzAuYmluCisjICtG
aWxlOiBhbWRncHUvdmNuXzVfM18wX2wuYmluCisjICtGaWxlOiBhbWRncHUvdmNuXzVfM18wX3Au
YmluCisjICBGaWxlOiBhbWRncHUvdnBlXzJfMF8wLmJpbgorIyArRmlsZTogYW1kZ3B1L3ZwZV8y
XzBfMF9sLmJpbgorIyArRmlsZTogYW1kZ3B1L3ZwZV8yXzBfMF9wLmJpbgorIyAgRmlsZTogYW1k
Z3B1L3ZwZV82XzFfMC5iaW4KKyMgIEZpbGU6IGFtZGdwdS92cGVfNl8xXzEuYmluCisjICBGaWxl
OiBhbWRncHUvdnBlXzZfMV8zLmJpbgorIyBAQCAtMjk1Miw5ICszMDQwLDU2IEBACisjICBMaW5r
OiBhbWR0ZWUvYW1kX3BtZl92My5iaW4gLT4gNzczYmQ5NmYtYjgzZi00ZDUyLWIxMmRjNTI5YjEz
ZDg1NDMuYmluCisjICBGaWxlOiBhbWR0ZWUvZjI5YmIzZDktYmQ2Ni01NDQxLWFmYjg4YWNjMmIy
YjYwZDYuYmluCisjICBMaW5rOiBhbWR0ZWUvYW1kX3BtZl92M18xLmJpbiAtPiBmMjliYjNkOS1i
ZDY2LTU0NDEtYWZiODhhY2MyYjJiNjBkNi5iaW4KKyMgK0ZpbGU6IGFtZHRlZS82NGFkMWNmNS0x
NGVhLTg5NDctYjZhZTg5ZWM3YTFiOGI5NC5iaW4KKyMgK0xpbms6IGFtZHRlZS9hbWRfcG1mX3Y0
LmJpbiAtPiA2NGFkMWNmNS0xNGVhLTg5NDctYjZhZTg5ZWM3YTFiOGI5NC5iaW4KKyMgIAorIyAg
TGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5hbWRfcG1mIGZvciBkZXRhaWxz
LgorIyAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5hbWRfcG1m
CisjICsKKyMgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICsKKyMgK0RyaXZlcjogYW1kLXNvZiAtIEFN
RCBBQ1AgNy5GIFNvdW5kIE9wZW4gRmlybXdhcmUKKyMgKworIyArRmlsZTogYW1kL3NvZi9hY3A3
Zi92MS4wL3NvZi1hY3A3Zi1jb2RlLmJpbgorIyArVmVyc2lvbjogMS4wCisjICtMaW5rOiBhbWQv
c29mL3NvZi1hY3A3Zi1jb2RlLmJpbiAtPiBhY3A3Zi92MS4wL3NvZi1hY3A3Zi1jb2RlLmJpbgor
IyArRmlsZTogYW1kL3NvZi9hY3A3Zi92MS4wL3NvZi1hY3A3Zi1kYXRhLmJpbgorIyArVmVyc2lv
bjogMS4wCisjICtMaW5rOiBhbWQvc29mL3NvZi1hY3A3Zi1kYXRhLmJpbiAtPiBhY3A3Zi92MS4w
L3NvZi1hY3A3Zi1kYXRhLmJpbgorIyArRmlsZTogYW1kL3NvZi9hY3A3Zi92MS4wL3NvZi1hY3A3
Zi1jb2RlX2wuYmluCisjICtWZXJzaW9uOiAxLjAKKyMgK0xpbms6IGFtZC9zb2Yvc29mLWFjcDdm
LWNvZGVfbC5iaW4gLT4gYWNwN2YvdjEuMC9zb2YtYWNwN2YtY29kZV9sLmJpbgorIyArCisjICtG
aWxlOiBhbWQvc29mLXRwbGcvYWNwN2YvdjEuMC9zb2YtYWNwN2YtMWFtcC1sMC1pZDIudHBsZwor
IyArVmVyc2lvbjogMS4wCisjICtMaW5rOiBhbWQvc29mLXRwbGcvc29mLWFjcDdmLTFhbXAtbDAt
aWQyLnRwbGcgLT4gYWNwN2YvdjEuMC9zb2YtYWNwN2YtMWFtcC1sMC1pZDIudHBsZworIyArRmls
ZTogYW1kL3NvZi10cGxnL2FjcDdmL3YxLjAvc29mLWFjcDdmLTFhbXAtbDEtaWQyLnRwbGcKKyMg
K1ZlcnNpb246IDEuMAorIyArTGluazogYW1kL3NvZi10cGxnL3NvZi1hY3A3Zi0xYW1wLWwxLWlk
Mi50cGxnIC0+IGFjcDdmL3YxLjAvc29mLWFjcDdmLTFhbXAtbDEtaWQyLnRwbGcKKyMgK0ZpbGU6
IGFtZC9zb2YtdHBsZy9hY3A3Zi92MS4wL3NvZi1hY3A3Zi1qYWNrLWwwLWlkMC50cGxnCisjICtW
ZXJzaW9uOiAxLjAKKyMgK0xpbms6IGFtZC9zb2YtdHBsZy9zb2YtYWNwN2YtamFjay1sMC1pZDAu
dHBsZyAtPiBhY3A3Zi92MS4wL3NvZi1hY3A3Zi1qYWNrLWwwLWlkMC50cGxnCisjICtGaWxlOiBh
bWQvc29mLXRwbGcvYWNwN2YvdjEuMC9zb2YtYWNwN2YtamFjay1sMS1pZDAudHBsZworIyArVmVy
c2lvbjogMS4wCisjICtMaW5rOiBhbWQvc29mLXRwbGcvc29mLWFjcDdmLWphY2stbDEtaWQwLnRw
bGcgLT4gYWNwN2YvdjEuMC9zb2YtYWNwN2YtamFjay1sMS1pZDAudHBsZworIyArRmlsZTogYW1k
L3NvZi10cGxnL2FjcDdmL3YxLjAvc29mLWFjcDdmLW1pYy1sMC1pZDQudHBsZworIyArVmVyc2lv
bjogMS4wCisjICtMaW5rOiBhbWQvc29mLXRwbGcvc29mLWFjcDdmLW1pYy1sMC1pZDQudHBsZyAt
PiBhY3A3Zi92MS4wL3NvZi1hY3A3Zi1taWMtbDAtaWQ0LnRwbGcKKyMgK0ZpbGU6IGFtZC9zb2Yt
dHBsZy9hY3A3Zi92MS4wL3NvZi1hY3A3Zi1taWMtbDEtaWQ0LnRwbGcKKyMgK1ZlcnNpb246IDEu
MAorIyArTGluazogYW1kL3NvZi10cGxnL3NvZi1hY3A3Zi1taWMtbDEtaWQ0LnRwbGcgLT4gYWNw
N2YvdjEuMC9zb2YtYWNwN2YtbWljLWwxLWlkNC50cGxnCisjICtGaWxlOiBhbWQvc29mLXRwbGcv
YWNwN2YvdjEuMC9zb2YtYWNwN2YtcnQ3MjItbDAudHBsZworIyArVmVyc2lvbjogMS4wCisjICtM
aW5rOiBhbWQvc29mLXRwbGcvc29mLWFjcDdmLXJ0NzIyLWwwLnRwbGcgLT4gYWNwN2YvdjEuMC9z
b2YtYWNwN2YtcnQ3MjItbDAudHBsZworIyArRmlsZTogYW1kL3NvZi10cGxnL2FjcDdmL3YxLjAv
c29mLWFjcDdmLXJ0NzIxLWwwLnRwbGcKKyMgK1ZlcnNpb246IDEuMAorIyArTGluazogYW1kL3Nv
Zi10cGxnL3NvZi1hY3A3Zi1ydDcyMS1sMC50cGxnIC0+IGFjcDdmL3YxLjAvc29mLWFjcDdmLXJ0
NzIxLWwwLnRwbGcKKyMgK0ZpbGU6IGFtZC9zb2YtdHBsZy9hY3A3Zi92MS4wL3NvZi1hY3A3Zi1j
czQybDQ1LWwwdTAtY3MzNWw2M3gyLWwxdTEzLnRwbGcKKyMgK1ZlcnNpb246IDEuMAorIyArTGlu
azogYW1kL3NvZi10cGxnL3NvZi1hY3A3Zi1jczQybDQ1LWwwdTAtY3MzNWw2M3gyLWwxdTEzLnRw
bGcgLT4gYWNwN2YvdjEuMC9zb2YtYWNwN2YtY3M0Mmw0NS1sMHUwLWNzMzVsNjN4Mi1sMXUxMy50
cGxnCisjICsKKyMgK0xpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuYW1kc29m
IGZvciBkZXRhaWxzLgorIyArU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElD
RU5TRS5hbWRzb2YKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtMzE2MCw2
ICszMjk1LDcgQEAKKyMgIEZpbGU6ICJicmNtL2JyY21mbWFjNDM0NTUtc2Rpby5yYXNwYmVycnlw
aSw0LW1vZGVsLWIudHh0IgorIyAgTGluazogYnJjbS9icmNtZm1hYzQzNDU1LXNkaW8ucmFzcGJl
cnJ5cGksNC1jb21wdXRlLW1vZHVsZS50eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlvLnJhc3BiZXJy
eXBpLDQtbW9kZWwtYi50eHQKKyMgIExpbms6IGJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLnJhc3Bi
ZXJyeXBpLDUtbW9kZWwtYi50eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlvLnJhc3BiZXJyeXBpLDQt
bW9kZWwtYi50eHQKKyMgK0xpbms6IGJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLnJhc3BiZXJyeXBp
LDUtbW9kZWwtYi1kMC50eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlvLnJhc3BiZXJyeXBpLDQtbW9k
ZWwtYi50eHQKKyMgIExpbms6IGJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLnJhc3BiZXJyeXBpLDUw
MC50eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlvLnJhc3BiZXJyeXBpLDQtbW9kZWwtYi50eHQKKyMg
IExpbms6IGJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLnJhc3BiZXJyeXBpLDUtY29tcHV0ZS1tb2R1
bGUudHh0IC0+IGJyY21mbWFjNDM0NTUtc2Rpby5yYXNwYmVycnlwaSw0LW1vZGVsLWIudHh0Cisj
ICBMaW5rOiBicmNtL2JyY21mbWFjNDM0NTUtc2Rpby5SYXNwYmVycnlcIFBpXCBGb3VuZGF0aW9u
LVJhc3BiZXJyeVwgUGlcIDRcIE1vZGVsXCBCLnR4dCAtPiBicmNtZm1hYzQzNDU1LXNkaW8ucmFz
cGJlcnJ5cGksNC1tb2RlbC1iLnR4dAorIyBAQCAtMzE3Myw2ICszMzA5LDcgQEAKKyMgIExpbms6
IGJyY20vYnJjbWZtYWM0MzU2LXNkaW8uZmlyZWZseSxmaXJlZmx5LXJrMzM5OS50eHQgLT4gYnJj
bWZtYWM0MzU2LXNkaW8uQVA2MzU2Uy50eHQKKyMgIExpbms6IGJyY20vYnJjbWZtYWM0MzU2LXNk
aW8uZnJpZW5kbHlhcm0sbmFub3BpLW00LnR4dCAtPiBicmNtZm1hYzQzNTYtc2Rpby5BUDYzNTZT
LnR4dAorIyAgTGluazogYnJjbS9icmNtZm1hYzQzNTYtc2Rpby5mcmllbmRseWFybSxuYW5vcGMt
dDQudHh0IC0+IGJyY21mbWFjNDM1Ni1zZGlvLkFQNjM1NlMudHh0CisjICtMaW5rOiBicmNtL2Jy
Y21mbWFjNDM1Ni1zZGlvLmdyYXBlcmFpbixnMzU2OC12Mi50eHQgLT4gYnJjbWZtYWM0MzU2LXNk
aW8uQVA2MzU2Uy50eHQKKyMgIExpbms6IGJyY20vYnJjbWZtYWM0MzU2LXNkaW8ua2hhZGFzLHZp
bTIudHh0IC0+IGJyY21mbWFjNDM1Ni1zZGlvLkFQNjM1NlMudHh0CisjICBMaW5rOiBicmNtL2Jy
Y21mbWFjNDM1Ni1zZGlvLnZhbXJzLHJvY2s5NjAudHh0IC0+IGJyY21mbWFjNDM1Ni1zZGlvLkFQ
NjM1NlMudHh0CisjICBGaWxlOiBicmNtL2JyY21mbWFjNDM0NTUtc2Rpby5BVy1DTTI1NlNNLnR4
dAorIyBAQCAtMzgwMSw2ICszOTM4LDkgQEAKKyMgIAorIyAgRmlsZTogcmVhbHRlay9ydDEzMjAv
cnQxMzIxLXBhdGNoLWNvZGUtdmEuYmluCisjICBWZXJzaW9uOiAxLjEwLjAKKyMgKworIyArRmls
ZTogcmVhbHRlay9ydDEzMjAvcnQxMzIxLXBhdGNoLWNvZGUtdmEyLmJpbgorIyArVmVyc2lvbjog
Mi4xLjAKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5ydDEz
MjAgZm9yIGRldGFpbHMuCisjICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5zZVJlZi1M
SUNFTlNFLnJ0MTMyMAorIyBAQCAtMzk3Myw3ICs0MTEzLDcgQEAKKyMgIEZpbGU6IGF0aDEway9X
Q04zOTkwL2h3MS4wL3NoaWtyYS9maXJtd2FyZS01LmJpbgorIyAgRmlsZTogYXRoMTBrL1dDTjM5
OTAvaHcxLjAvc2hpa3JhL3dsYW5tZHNwLm1ibgorIyAgTGluazogcWNvbS9zaGlrcmEvd2xhbm1k
c3AubWJuIC0+IC4uLy4uL2F0aDEway9XQ04zOTkwL2h3MS4wL3NoaWtyYS93bGFubWRzcC5tYm4K
KyMgLVZlcnNpb246IFdMQU4uSEwuMy4zLjcuYzUtMDAwOTMuMi1RQ0FITFNXTVRQTC0xCisjICtW
ZXJzaW9uOiBXTEFOLkhMLjMuMy43LmM1LTAwMjI2LVFDQUhMU1dNVFBMLTEKKyMgIEZpbGU6IGF0
aDEway9XQ04zOTkwL2h3MS4wL3NoaWtyYS9ub3RpY2UudHh0X3dsYW5tZHNwCisjICAKKyMgIExp
Y2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuUXVhbGNvbW1BdGhlcm9zX2F0aDEw
ayBmb3IgZGV0YWlscworIyBAQCAtNDA5MCw2ICs0MjMwLDEwIEBACisjICBGaWxlOiBhdGgxMWsv
UUNBMjA2Ni9odzIuMS9tMy5iaW4KKyMgIFZlcnNpb246IFdMQU4uSFNQLjEuMS0wMzkyNi4xMy1R
Q0FIU1BTV1BMX1YyX1NJTElDT05aX0NFLTIuNTIyOTcuOQorIyAgRmlsZTogYXRoMTFrL1FDQTIw
NjYvaHcyLjEvTm90aWNlLnR4dAorIyArRmlsZTogYXRoMTFrL1FDQTIwNjYvaHcyLjEvbmZhNzI1
L2Ftc3MuYmluCisjICtGaWxlOiBhdGgxMWsvUUNBMjA2Ni9odzIuMS9uZmE3MjUvbTMuYmluCisj
ICtWZXJzaW9uOiBXTEFOLkhTUC4xLjEuYzYtMDAzMDItUUNBSFNQU1dQTF9WMV9WMl9TSUxJQ09O
Wl9MSVRFLTEKKyMgK0ZpbGU6IGF0aDExay9RQ0EyMDY2L2h3Mi4xL25mYTcyNS9Ob3RpY2UudHh0
CisjICBGaWxlOiBhdGgxMWsvUUNBNjY5OEFRL2h3Mi4xL2JvYXJkLTIuYmluCisjICBGaWxlOiBh
dGgxMWsvUUNBNjY5OEFRL2h3Mi4xL2Ftc3MuYmluCisjICBGaWxlOiBhdGgxMWsvUUNBNjY5OEFR
L2h3Mi4xL20zLmJpbgorIyBAQCAtNDM2OCw3ICs0NTEyLDcgQEAKKyMgIExpbms6IGludGVsL2li
dC0wMDQwLTEwNTAuZGRjIC0+IGlidC0wMDQwLTAwNDEuZGRjCisjICBMaW5rOiBpbnRlbC9pYnQt
MTA0MC0xMDUwLnNmaSAtPiBpYnQtMTA0MC0wMDQxLnNmaQorIyAgTGluazogaW50ZWwvaWJ0LTEw
NDAtMTA1MC5kZGMgLT4gaWJ0LTEwNDAtMDA0MS5kZGMKKyMgLVZlcnNpb246IEJUX1NvbGFyX1JF
TDgyMjAwXzIzLjUwLjI2MjkyLjgyMjAwCisjICtWZXJzaW9uOiBCVF9Tb2xhcl9SRUw4MjI1MV8y
My41MC4yNjM5My44MjI1MQorIyAgCisjICBGaWxlOiBpbnRlbC9pYnQtMDA0MC0xMDIwLnNmaQor
IyAgRmlsZTogaW50ZWwvaWJ0LTAwNDAtMTAyMC5kZGMKKyMgQEAgLTQzODYsMTUgKzQ1MzAsMTUg
QEAKKyMgIEZpbGU6IGludGVsL2lidC0wMDkzLTQxNTAuZGRjCisjICBGaWxlOiBpbnRlbC9pYnQt
MDA5My0xMDUwLnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTAwOTMtMTA1MC5kZGMKKyMgLVZlcnNp
b246IEJUX0JsYXphcnVIcnBHZnBfU19SRUw0MDVfMjQuMDAuMjYzMDQuNDA1CisjICtWZXJzaW9u
OiBCVF9CbGF6YXJ1SHJwR2ZwX1NfUkVMNDcxXzI0LjAwLjI2MzkzLjQ3MQorIyAgCisjICBGaWxl
OiBpbnRlbC9pYnQtMDI5MS0wMjkxLnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTAyOTEtMDI5MS5k
ZGMKKyMgLVZlcnNpb246IEJUX0JsYXphclVfU19SRUwxMjU1ODVfMjQuODAuMjYzNjIuMTI1NTg1
CisjICtWZXJzaW9uOiBCVF9CbGF6YXJVX1NfUkVMMTMxMjg3XzI0LjkwLjI2NDQxLjEzMTI4Nwor
IyAgCisjICBGaWxlOiBpbnRlbC9pYnQtMDA5My0wMjkxLnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0
LTAwOTMtMDI5MS5kZGMKKyMgLVZlcnNpb246IEJUX0JsYXphcnVGbXBBcmxfU19SRUw1OF8yNC43
MC4yNjMzMy41OAorIyArVmVyc2lvbjogQlRfQmxhemFydUZtcEFybF9TX1JFTDEzN18yNC43MC4y
NjQxNS4xMzcKKyMgIAorIyAgRmlsZTogaW50ZWwvaWJ0LTAxODAtMDA0MS5zZmkKKyMgIEZpbGU6
IGludGVsL2lidC0wMTgwLTAwNDEuZGRjCisjIEBAIC00NDAyLDcgKzQ1NDYsNyBAQAorIyAgRmls
ZTogaW50ZWwvaWJ0LTAxODAtNDE1MC5kZGMKKyMgIEZpbGU6IGludGVsL2lidC0wMTgwLTEwNTAu
c2ZpCisjICBGaWxlOiBpbnRlbC9pYnQtMDE4MC0xMDUwLmRkYworIyAtVmVyc2lvbjogQlRfTWFn
bmV0YXJfUkVMMTA0MDI3XzIzLjUwLjI2MjkyLjEwNDAyNworIyArVmVyc2lvbjogQlRfTWFnbmV0
YXJfUkVMMTA0MDc4XzIzLjUwLjI2MzkzLjEwNDA3OAorIyAgCisjICBGaWxlOiBpbnRlbC9pYnQt
MDE5MC0wMjkxLnNmaQorIyAgRmlsZTogaW50ZWwvaWJ0LTAxOTAtMDI5MS5kZGMKKyMgQEAgLTQ0
MjYsMTIgKzQ1NzAsMTIgQEAKKyMgIEZpbGU6IGludGVsL2lidC0wMTkwLTAyOTEtdXNiLnNmaQor
IyAgRmlsZTogaW50ZWwvaWJ0LTAxOTAtMDI5MS1wY2kuZGRjCisjICBGaWxlOiBpbnRlbC9pYnQt
MDE5MC0wMjkxLXBjaS5zZmkKKyMgLVZlcnNpb246IEJUX0JsYXphcmlGbXBfU19SRUw2Ml8yNC43
MC4yNjMzMy42MgorIyArVmVyc2lvbjogQlRfQmxhemFyaUZtcF9TX1JFTDE0M18yNC43MC4yNjQx
NS4xNDMKKyMgIAorIyAgRmlsZTogaW50ZWwvaWJ0LTExOTAtMDFhMS1pbWwuc2ZpCisjICBGaWxl
OiBpbnRlbC9pYnQtMTE5MC0wMWExLXBjaS5kZGMKKyMgIEZpbGU6IGludGVsL2lidC0xMTkwLTAx
YTEtcGNpLnNmaQorIyAtVmVyc2lvbjogQlRfQmxhemFySV9TX1JFTDEzMjkzMV8yNC44MC4yNjM2
Mi4xMzI5MzEKKyMgK1ZlcnNpb246IEJUX0JsYXphcklfU19SRUwxMzg0OTZfMjQuOTAuMjY0NDEu
MTM4NDk2CisjICAKKyMgIEZpbGU6IGludGVsL2lidC0wMGEwLTAxYTEtaW1sLnNmaQorIyAgRmls
ZTogaW50ZWwvaWJ0LTAwYTAtMDFhMS1wY2kuZGRjCisjIEBAIC00NDM5LDEyICs0NTgzLDE3IEBA
CisjICBGaWxlOiBpbnRlbC9pYnQtMDBhMC0wMjkxLWltbC5zZmkKKyMgIEZpbGU6IGludGVsL2li
dC0wMGEwLTAyOTEtcGNpLmRkYworIyAgRmlsZTogaW50ZWwvaWJ0LTAwYTAtMDI5MS1wY2kuc2Zp
CisjIC1WZXJzaW9uOiBCVF9TY29ycGl1c19TX1JFTDEwMjE2M18yNC44MC4yNjM2Mi4xMDIxNjMK
KyMgK1ZlcnNpb246IEJUX1Njb3JwaXVzX1NfUkVMMTA4MTQyXzI0LjkwLjI2NDQxLjEwODE0Mgor
IyAgCisjICBGaWxlOiBpbnRlbC9pYnQtMDBhMC0wMDQxLWltbC5zZmkKKyMgIEZpbGU6IGludGVs
L2lidC0wMGEwLTAwNDEtcGNpLmRkYworIyAgRmlsZTogaW50ZWwvaWJ0LTAwYTAtMDA0MS1wY2ku
c2ZpCisjIC1WZXJzaW9uOiBCVF9TY29ycGl1c0dmcF9TX1JFTDM4NF8yNC4wMC4yNjMwNC4zODQK
KyMgK1ZlcnNpb246IEJUX1Njb3JwaXVzR2ZwX1NfUkVMNDU1XzI0LjAwLjI2MzkzLjQ1NQorIyAr
CisjICtGaWxlOiBpbnRlbC9pYnQtMDJhMi0wMWExLWltbC5zZmkKKyMgK0ZpbGU6IGludGVsL2li
dC0wMmEyLTAxYTEuc2ZpCisjICtGaWxlOiBpbnRlbC9pYnQtMDJhMi0wMWExLmRkYworIyArVmVy
c2lvbjogQlRfU2NvcnBpdXMyX1NfUkVMOTIwODdfMjQuOTAuMjY0NDEuOTIwODcKKyMgIAorIyAg
TGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5pYnRfZmlybXdhcmUgZm9yIGRl
dGFpbHMKKyMgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UuaWJ0
X2Zpcm13YXJlCisjIEBAIC01MDM1LDggKzUxODQsOCBAQAorIyAgRmlsZTogcWNhL3JhbXBhdGNo
X3VzYl8wMDAwMDIwMC5iaW4KKyMgIEZpbGU6IHFjYS9udm1fdXNiXzAwMDAwMjAwLmJpbgorIyAg
CisjIC1GaWxlOiBxY2EvcmFtcGF0Y2hfdXNiXzAwMDAwMjAxLmJpbgorIyAtRmlsZTogcWNhL252
bV91c2JfMDAwMDAyMDEuYmluCisjICtMaW5rOiBxY2EvcmFtcGF0Y2hfdXNiXzAwMDAwMjAxLmJp
biAtPiByYW1wYXRjaF91c2JfMDAwMDAyMDAuYmluCisjICtMaW5rOiBxY2EvbnZtX3VzYl8wMDAw
MDIwMS5iaW4gLT4gbnZtX3VzYl8wMDAwMDIwMC5iaW4KKyMgIAorIyAgRmlsZTogcWNhL3JhbXBh
dGNoX3VzYl8wMDAwMDMwMC5iaW4KKyMgIFZlcnNpb246IEJURk0uUk0uMi4yLmMzLTAwMDMxLVFD
QUJURk1TV1AtMQorIyBAQCAtNTA0OCwyOCArNTE5NywyOCBAQAorIyAgRmlsZTogcWNhL252bV91
c2JfMDAwMDAzMDJfZXUuYmluCisjICAKKyMgIEZpbGU6IHFjYS9yYW1wYXRjaF91c2JfMDAxMzAy
MDAuYmluCisjIC1WZXJzaW9uOiBCVEZXLkhTUC4yLjAuMC0wMDYwOS1VU0JfUEFUQ0haLTEKKyMg
K1ZlcnNpb246IEJURlcuSFNQLjIuMC4wLTAwNjM0LVVTQl9QQVRDSFotMgorIyAgRmlsZTogcWNh
L252bV91c2JfMDAxMzAyMDAuYmluCisjICBGaWxlOiBxY2EvbnZtX3VzYl8wMDEzMDIwMF8wMTA0
LmJpbgorIyAtRmlsZTogcWNhL252bV91c2JfMDAxMzAyMDBfMDEwNS5iaW4KKyMgLUZpbGU6IHFj
YS9udm1fdXNiXzAwMTMwMjAwXzAxMDYuYmluCisjICBGaWxlOiBxY2EvbnZtX3VzYl8wMDEzMDIw
MF8wMTA3LmJpbgorIyAtRmlsZTogcWNhL252bV91c2JfMDAxMzAyMDBfMDEwOS5iaW4KKyMgLUZp
bGU6IHFjYS9udm1fdXNiXzAwMTMwMjAwXzAxMTAuYmluCisjICtMaW5rOiBxY2EvbnZtX3VzYl8w
MDEzMDIwMF8wMTA1LmJpbiAtPiBudm1fdXNiXzAwMTMwMjAwXzAxMDQuYmluCisjICtMaW5rOiBx
Y2EvbnZtX3VzYl8wMDEzMDIwMF8wMTA2LmJpbiAtPiBudm1fdXNiXzAwMTMwMjAwLmJpbgorIyAr
TGluazogcWNhL252bV91c2JfMDAxMzAyMDBfMDEwOS5iaW4gLT4gbnZtX3VzYl8wMDEzMDIwMC5i
aW4KKyMgK0xpbms6IHFjYS9udm1fdXNiXzAwMTMwMjAwXzAxMTAuYmluIC0+IG52bV91c2JfMDAx
MzAyMDBfMDEwNC5iaW4KKyMgIAorIyAgRmlsZTogcWNhL3JhbXBhdGNoX3VzYl8wMDEzMDIwMS5i
aW4KKyMgIFZlcnNpb246IEJURlcuSFNQLjIuMS4wLTAwNjY5LVVTQl9VQVJUX1BBVENIWi0xCisj
ICBGaWxlOiBxY2EvbnZtX3VzYl8wMDEzMDIwMS5iaW4KKyMgLUZpbGU6IHFjYS9udm1fdXNiXzAw
MTMwMjAxXzAxMGEuYmluCisjIC1GaWxlOiBxY2EvbnZtX3VzYl8wMDEzMDIwMV8wMTBiLmJpbgor
IyAtRmlsZTogcWNhL252bV91c2JfMDAxMzAyMDFfMDMwMy5iaW4KKyMgIEZpbGU6IHFjYS9udm1f
dXNiXzAwMTMwMjAxX2dmLmJpbgorIyAtRmlsZTogcWNhL252bV91c2JfMDAxMzAyMDFfZ2ZfMDEw
YS5iaW4KKyMgLUZpbGU6IHFjYS9udm1fdXNiXzAwMTMwMjAxX2dmXzAxMGIuYmluCisjIC1GaWxl
OiBxY2EvbnZtX3VzYl8wMDEzMDIwMV9nZl8wMzAzLmJpbgorIyArTGluazogcWNhL252bV91c2Jf
MDAxMzAyMDFfMDEwYS5iaW4gLT4gbnZtX3VzYl8wMDEzMDIwMS5iaW4KKyMgK0xpbms6IHFjYS9u
dm1fdXNiXzAwMTMwMjAxXzAxMGIuYmluIC0+IG52bV91c2JfMDAxMzAyMDEuYmluCisjICtMaW5r
OiBxY2EvbnZtX3VzYl8wMDEzMDIwMV8wMzAzLmJpbiAtPiBudm1fdXNiXzAwMTMwMjAxLmJpbgor
IyArTGluazogcWNhL252bV91c2JfMDAxMzAyMDFfZ2ZfMDEwYS5iaW4gLT4gbnZtX3VzYl8wMDEz
MDIwMV9nZi5iaW4KKyMgK0xpbms6IHFjYS9udm1fdXNiXzAwMTMwMjAxX2dmXzAxMGIuYmluIC0+
IG52bV91c2JfMDAxMzAyMDFfZ2YuYmluCisjICtMaW5rOiBxY2EvbnZtX3VzYl8wMDEzMDIwMV9n
Zl8wMzAzLmJpbiAtPiBudm1fdXNiXzAwMTMwMjAxX2dmLmJpbgorIyAgCisjICBGaWxlOiBxY2Ev
UUNBMjA2Ni9yYW1wYXRjaF91c2JfMDAxMzAyMDEuYmluCisjIC1WZXJzaW9uOiBCVEZXLkhTUC4y
LjEuMC0wMDY4MC1WRVJfUEFUQ0haLTEKKyMgK1ZlcnNpb246IEJURlcuSFNQLjIuMS4wLTAwNjgw
LVZFUl9QQVRDSFotMgorIyAgRmlsZTogcWNhL1FDQTIwNjYvbnZtX3VzYl8wMDEzMDIwMV8wMzBh
LmJpbgorIyAgRmlsZTogcWNhL1FDQTIwNjYvbnZtX3VzYl8wMDEzMDIwMV9nZl8wMzBhLmJpbgor
IyAgCisjIEBAIC01MDc3LDE4ICs1MjI2LDY1IEBACisjICBWZXJzaW9uOiBCVEZXLkhBTUlMVE9O
LjIuMC4wLTAwNzk5LVVTQl9QQVRDSFotNQorIyAgRmlsZTogcWNhL252bV91c2JfMDAxOTAyMDAu
YmluCisjICBGaWxlOiBxY2EvbnZtX3VzYl8wMDE5MDIwMF8wMTA0LmJpbgorIyAtRmlsZTogcWNh
L252bV91c2JfMDAxOTAyMDBfMDEwNi5iaW4KKyMgIEZpbGU6IHFjYS9udm1fdXNiXzAwMTkwMjAw
XzAxMDguYmluCisjIC1GaWxlOiBxY2EvbnZtX3VzYl8wMDE5MDIwMF8wMTA5LmJpbgorIyAtRmls
ZTogcWNhL252bV91c2JfMDAxOTAyMDBfMDEwYS5iaW4KKyMgLUZpbGU6IHFjYS9udm1fdXNiXzAw
MTkwMjAwXzAxMGMuYmluCisjIC1GaWxlOiBxY2EvbnZtX3VzYl8wMDE5MDIwMF8wMTBlLmJpbgor
IyAtRmlsZTogcWNhL252bV91c2JfMDAxOTAyMDBfMDExMC5iaW4KKyMgIEZpbGU6IHFjYS9udm1f
dXNiXzAwMTkwMjAwXzAxMTEuYmluCisjIC1GaWxlOiBxY2EvbnZtX3VzYl8wMDE5MDIwMF8wMTEy
LmJpbgorIyArTGluazogcWNhL252bV91c2JfMDAxOTAyMDBfMDEwNi5iaW4gLT4gbnZtX3VzYl8w
MDE5MDIwMF8wMTA0LmJpbgorIyArTGluazogcWNhL252bV91c2JfMDAxOTAyMDBfMDEwOS5iaW4g
LT4gbnZtX3VzYl8wMDE5MDIwMF8wMTA0LmJpbgorIyArTGluazogcWNhL252bV91c2JfMDAxOTAy
MDBfMDEwYS5iaW4gLT4gbnZtX3VzYl8wMDE5MDIwMF8wMTA0LmJpbgorIyArTGluazogcWNhL252
bV91c2JfMDAxOTAyMDBfMDEwYy5iaW4gLT4gbnZtX3VzYl8wMDE5MDIwMF8wMTA0LmJpbgorIyAr
TGluazogcWNhL252bV91c2JfMDAxOTAyMDBfMDEwZS5iaW4gLT4gbnZtX3VzYl8wMDE5MDIwMC5i
aW4KKyMgK0xpbms6IHFjYS9udm1fdXNiXzAwMTkwMjAwXzAxMTAuYmluIC0+IG52bV91c2JfMDAx
OTAyMDAuYmluCisjICtMaW5rOiBxY2EvbnZtX3VzYl8wMDE5MDIwMF8wMTEyLmJpbiAtPiBudm1f
dXNiXzAwMTkwMjAwLmJpbgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBM
SUNFTlNFLlF1YWxjb21tQXRoZXJvc19hdGgxMGsgYW5kIE5PVElDRS5xY2EgZm9yIGRldGFpbHMK
KyMgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UuUXVhbGNvbW1B
dGhlcm9zX2F0aDEwaworIyArCisjICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyArCisjICtEcml2ZXI6
IGJ0dXNiIC0gQmx1ZXRvb3RoIFVTQiBkcml2ZXIgZm9yIFF1YWxjb21tIGNvbnRyb2xsZXJzCisj
ICsKKyMgK0ZpbGU6IHFjYS9RQ0MyMDcyL3BlcmlwYXRjaF91c2JfMDAyMjAxMDAuYmluCisjICtW
ZXJzaW9uOiBCVEZXLkNPTE9HTkUuMS4wLjAtMDAwNTQtUEFUQ0gtMQorIyArRmlsZTogcWNhL1FD
QzIwNzIvcGVyaW52bV91c2JfMDAyMjAxMDAuYmluCisjICtMaW5rOiBxY2EvUUNDMjA3Mi9wZXJp
bnZtX3VzYl8wMDIyMDEwMF8wMDAyLmJpbiAtPiBwZXJpbnZtX3VzYl8wMDIyMDEwMC5iaW4KKyMg
K0xpbms6IHFjYS9RQ0MyMDcyL3Blcmludm1fdXNiXzAwMjIwMTAwXzAwMDYuYmluIC0+IHBlcmlu
dm1fdXNiXzAwMjIwMTAwLmJpbgorIyArTGluazogcWNhL1FDQzIwNzIvcGVyaW52bV91c2JfMDAy
MjAxMDBfMDAwOC5iaW4gLT4gcGVyaW52bV91c2JfMDAyMjAxMDAuYmluCisjICtMaW5rOiBxY2Ev
UUNDMjA3Mi9wZXJpbnZtX3VzYl8wMDIyMDEwMF8wMDBmLmJpbiAtPiBwZXJpbnZtX3VzYl8wMDIy
MDEwMC5iaW4KKyMgK0xpbms6IHFjYS9RQ0MyMDcyL3Blcmludm1fdXNiXzAwMjIwMTAwXzAwMTEu
YmluIC0+IHBlcmludm1fdXNiXzAwMjIwMTAwLmJpbgorIyArTGluazogcWNhL1FDQzIwNzIvcGVy
aW52bV91c2JfMDAyMjAxMDBfMDAxMy5iaW4gLT4gcGVyaW52bV91c2JfMDAyMjAxMDAuYmluCisj
ICtMaW5rOiBxY2EvUUNDMjA3Mi9wZXJpbnZtX3VzYl8wMDIyMDEwMF8wMDFlLmJpbiAtPiBwZXJp
bnZtX3VzYl8wMDIyMDEwMC5iaW4KKyMgK0xpbms6IHFjYS9RQ0MyMDcyL3Blcmludm1fdXNiXzAw
MjIwMTAwXzAwMWYuYmluIC0+IHBlcmludm1fdXNiXzAwMjIwMTAwLmJpbgorIyArTGluazogcWNh
L1FDQzIwNzIvcGVyaW52bV91c2JfMDAyMjAxMDBfMDAyMS5iaW4gLT4gcGVyaW52bV91c2JfMDAy
MjAxMDAuYmluCisjICtMaW5rOiBxY2EvUUNDMjA3Mi9wZXJpbnZtX3VzYl8wMDIyMDEwMF8wMDIy
LmJpbiAtPiBwZXJpbnZtX3VzYl8wMDIyMDEwMC5iaW4KKyMgK0xpbms6IHFjYS9RQ0MyMDcyL3Bl
cmludm1fdXNiXzAwMjIwMTAwXzAyMDEuYmluIC0+IHBlcmludm1fdXNiXzAwMjIwMTAwLmJpbgor
IyArTGluazogcWNhL1FDQzIwNzIvcGVyaW52bV91c2JfMDAyMjAxMDBfMDYwMS5iaW4gLT4gcGVy
aW52bV91c2JfMDAyMjAxMDAuYmluCisjICtMaW5rOiBxY2EvUUNDMjA3Mi9wZXJpbnZtX3VzYl8w
MDIyMDEwMF8wNjA0LmJpbiAtPiBwZXJpbnZtX3VzYl8wMDIyMDEwMC5iaW4KKyMgK0xpbms6IHFj
YS9RQ0MyMDcyL3Blcmludm1fdXNiXzAwMjIwMTAwXzA2MDUuYmluIC0+IHBlcmludm1fdXNiXzAw
MjIwMTAwLmJpbgorIyArTGluazogcWNhL1FDQzIwNzIvcGVyaW52bV91c2JfMDAyMjAxMDBfMDYw
Ni5iaW4gLT4gcGVyaW52bV91c2JfMDAyMjAxMDAuYmluCisjICsKKyMgK0ZpbGU6IHFjYS9RQ0My
MDcyL3JhbXBhdGNoX3VzYl8wMDIwMDEwMS5iaW4KKyMgK1ZlcnNpb246IEJURlcuT1JORS4xLjEu
MC5jMS0wMDAzOC1QQVRDSC0xCisjICtGaWxlOiBxY2EvUUNDMjA3Mi9udm1fdXNiXzAwMjAwMTAx
LmJpbgorIyArRmlsZTogcWNhL1FDQzIwNzIvbnZtX3VzYl8wMDIwMDEwMV8wMDIxLmJpbgorIyAr
RmlsZTogcWNhL1FDQzIwNzIvbnZtX3VzYl8wMDIwMDEwMV8wMDIyLmJpbgorIyArTGluazogcWNh
L1FDQzIwNzIvbnZtX3VzYl8wMDIwMDEwMV8wMDAyLmJpbiAtPiBudm1fdXNiXzAwMjAwMTAxLmJp
bgorIyArTGluazogcWNhL1FDQzIwNzIvbnZtX3VzYl8wMDIwMDEwMV8wMDA2LmJpbiAtPiBudm1f
dXNiXzAwMjAwMTAxLmJpbgorIyArTGluazogcWNhL1FDQzIwNzIvbnZtX3VzYl8wMDIwMDEwMV8w
MDA4LmJpbiAtPiBudm1fdXNiXzAwMjAwMTAxLmJpbgorIyArTGluazogcWNhL1FDQzIwNzIvbnZt
X3VzYl8wMDIwMDEwMV8wMDBmLmJpbiAtPiBudm1fdXNiXzAwMjAwMTAxLmJpbgorIyArTGluazog
cWNhL1FDQzIwNzIvbnZtX3VzYl8wMDIwMDEwMV8wMDExLmJpbiAtPiBudm1fdXNiXzAwMjAwMTAx
LmJpbgorIyArTGluazogcWNhL1FDQzIwNzIvbnZtX3VzYl8wMDIwMDEwMV8wMDEzLmJpbiAtPiBu
dm1fdXNiXzAwMjAwMTAxLmJpbgorIyArTGluazogcWNhL1FDQzIwNzIvbnZtX3VzYl8wMDIwMDEw
MV8wMDFhLmJpbiAtPiBudm1fdXNiXzAwMjAwMTAxLmJpbgorIyArTGluazogcWNhL1FDQzIwNzIv
bnZtX3VzYl8wMDIwMDEwMV8wMDFjLmJpbiAtPiBudm1fdXNiXzAwMjAwMTAxLmJpbgorIyArTGlu
azogcWNhL1FDQzIwNzIvbnZtX3VzYl8wMDIwMDEwMV8wMDFlLmJpbiAtPiBudm1fdXNiXzAwMjAw
MTAxLmJpbgorIyArTGluazogcWNhL1FDQzIwNzIvbnZtX3VzYl8wMDIwMDEwMV8wMDFmLmJpbiAt
PiBudm1fdXNiXzAwMjAwMTAxLmJpbgorIyArTGluazogcWNhL1FDQzIwNzIvbnZtX3VzYl8wMDIw
MDEwMV8wMjAxLmJpbiAtPiBudm1fdXNiXzAwMjAwMTAxLmJpbgorIyArTGluazogcWNhL1FDQzIw
NzIvbnZtX3VzYl8wMDIwMDEwMV8wNjAxLmJpbiAtPiBudm1fdXNiXzAwMjAwMTAxLmJpbgorIyAr
TGluazogcWNhL1FDQzIwNzIvbnZtX3VzYl8wMDIwMDEwMV8wNjA0LmJpbiAtPiBudm1fdXNiXzAw
MjAwMTAxXzAwMjEuYmluCisjICtMaW5rOiBxY2EvUUNDMjA3Mi9udm1fdXNiXzAwMjAwMTAxXzA2
MDUuYmluIC0+IG52bV91c2JfMDAyMDAxMDFfMDAyMS5iaW4KKyMgK0xpbms6IHFjYS9RQ0MyMDcy
L252bV91c2JfMDAyMDAxMDFfMDYwNi5iaW4gLT4gbnZtX3VzYl8wMDIwMDEwMV8wMDIyLmJpbgor
IyArCisjICtMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnFjb20gYW5kIE5P
VElDRS5xY2EgZm9yIGRldGFpbHMKKyMgK1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNl
UmVmLUxJQ0VOU0UucWNvbQorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC01
MTMxLDExICs1MzI3LDEzIEBACisjICBEcml2ZXI6IGJ0cWNhIC0gUXVhbGNvbW0gQXRoZXJvcyBC
bHVldG9vdGggc3VwcG9ydCBmb3IgUUNBX1FDQzIwNzIgY2hpcAorIyAgCisjICBGaWxlOiBxY2Ev
b3JuYnRmdzExLnRsdgorIyAtVmVyc2lvbjogQlRGVy5PUk5FLjEuMS4wLTAwMzU1LVBBVENILTEK
KyMgK1ZlcnNpb246IEJURlcuT1JORS4xLjEuMC0wMDM5MS1QQVRDSC0xCisjICBGaWxlOiBxY2Ev
b3JubnYxMS5iaW4KKyMgLVZlcnNpb246IEJURlcuT1JORS4xLjEuMC0wMDM1NS1QQVRDSC0xCisj
ICtWZXJzaW9uOiBCVEZXLk9STkUuMS4xLjAtMDAzOTEtUEFUQ0gtMQorIyArRmlsZTogcWNhL29y
bm52MTEuYjE4CisjICtWZXJzaW9uOiBCVEZXLk9STkUuMS4xLjAtMDAzOTEtUEFUQ0gtMQorIyAg
RmlsZTogcWNhL29ybmJjc2NhbDExLmJpbgorIyAtVmVyc2lvbjogQlRGVy5PUk5FLjEuMS4wLTAw
MzU1LVBBVENILTEKKyMgK1ZlcnNpb246IEJURlcuT1JORS4xLjEuMC0wMDM5MS1QQVRDSC0xCisj
ICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuUXVhbGNvbW1BdGhl
cm9zX2F0aDEwayBhbmQgTk9USUNFLnFjYSBmb3IgZGV0YWlscworIyAgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5RdWFsY29tbUF0aGVyb3NfYXRoMTBrCisjIEBA
IC01MjQ3LDcgKzU0NDUsNyBAQAorIyAgRHJpdmVyOiBxY2EgLSBRdWFsY29tbSBBdGhlcm9zIEJs
dWV0b290aCBzdXBwb3J0IGZvciBRQ0EyMDY2IGNoaXBzCisjICAKKyMgIEZpbGU6IHFjYS9ocGJ0
ZncyMS50bHYKKyMgLVZlcnNpb246IEJURlcuSFNQLjIuMS4wLTAwNjUzLVZFUl9QQVRDSFotMwor
IyArVmVyc2lvbjogQlRGVy5IU1AuMi4xLjAtMDA2ODAtVkVSX1BBVENIWi0xCisjICBGaWxlOiBx
Y2EvaHBudjIxLmJpbgorIyAgRmlsZTogcWNhL2hwbnYyMWcuYmluCisjICBGaWxlOiBxY2EvaHBu
djIxLjMwMQorIyBAQCAtNTYwNCw3ICs1ODAyLDcgQEAKKyMgIFZlcnNpb246IEd1QyBBUEkvQVBC
IHZlciA3MC4xLjEgZm9yIFRpZ2VybGFrZQorIyAgCisjICBGaWxlOiBpOTE1L3RnbF9ndWNfNzAu
YmluCisjIC1WZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuNDkuNCBmb3IgVGlnZXJsYWtlCisj
ICtWZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuNDkuNSBmb3IgVGlnZXJsYWtlCisjICAKKyMg
IEZpbGU6IGk5MTUvdGdsX2h1Y183LjAuMy5iaW4KKyMgIFZlcnNpb246IEh1YyBBUEkvQVBCIHZl
ciA3IHJlbGVhc2UgMCBmb3IgVGlnZXJsYWtlCisjIEBAIC01NjQzLDcgKzU4NDEsNyBAQAorIyAg
VmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjEuMSBmb3IgREcxCisjICAKKyMgIEZpbGU6IGk5
MTUvZGcxX2d1Y183MC5iaW4KKyMgLVZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC40OS40IGZv
ciBERzEKKyMgK1ZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC40OS41IGZvciBERzEKKyMgIAor
IyAgRmlsZTogaTkxNS9kZzFfaHVjXzcuNy4xLmJpbgorIyAgVmVyc2lvbjogSHVjIEFQSS9BUEIg
dmVyIDcgcmVsZWFzZSAxIGZvciBERzEKKyMgQEAgLTU2ODUsNyArNTg4Myw3IEBACisjICBWZXJz
aW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuMS4xIGZvciBBbGRlcmxha2UgUAorIyAgCisjICBGaWxl
OiBpOTE1L2FkbHBfZ3VjXzcwLmJpbgorIyAtVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjQ5
LjQgZm9yIEFsZGVybGFrZSBQCisjICtWZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuNDkuNSBm
b3IgQWxkZXJsYWtlIFAKKyMgIAorIyAgRmlsZTogaTkxNS9kZzJfZ3VjXzcwLjEuMi5iaW4KKyMg
IFZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC4xLjIgZm9yIERHMgorIyBAQCAtNTY5NCw3ICs1
ODkyLDcgQEAKKyMgIFZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC40LjEgZm9yIERHMgorIyAg
CisjICBGaWxlOiBpOTE1L2RnMl9ndWNfNzAuYmluCisjIC1WZXJzaW9uOiBHdUMgQVBJL0FQQiB2
ZXIgNzAuNTMuMCBmb3IgREcyCisjICtWZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuODMuMCBm
b3IgREcyCisjICAKKyMgIEZpbGU6IGk5MTUvZGcyX2h1Y19nc2MuYmluCisjICBWZXJzaW9uOiBI
dUMgQVBJL0FQQiB2ZXIgNy4xMC4xNiBmb3IgREcyCisjIEBAIC01NzE1LDcgKzU5MTMsNyBAQAor
IyAgVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAyMyBmb3IgTWV0ZW9ybGFrZQor
IyAgCisjICBGaWxlOiBpOTE1L210bF9ndWNfNzAuYmluCisjIC1WZXJzaW9uOiBHdUMgQVBJL0FQ
QiB2ZXIgNzAuNTMuMCBmb3IgTWV0ZW9ybGFrZQorIyArVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVy
IDcwLjgzLjAgZm9yIE1ldGVvcmxha2UKKyMgIAorIyAgRmlsZTogaTkxNS9tdGxfaHVjX2dzYy5i
aW4KKyMgIFZlcnNpb246IEh1QyBBUEkvQVBCIHZlciA4LjUuNCBmb3IgTWV0ZW9ybGFrZQorIyBA
QCAtNTczNiw3ICs1OTM0LDcgQEAKKyMgIFZlcnNpb246IERNQyBBUEkvQVBCIHZlciAyIHJlbGVh
c2UgMzEgZm9yIFhlM0xQRF8zMDAyCisjICAKKyMgIEZpbGU6IGk5MTUveGUzcF9scGRfZG1jLmJp
bgorIyAtVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAzNyBmb3IgWGUzcF9MUEQK
KyMgK1ZlcnNpb246IERNQyBBUEkvQVBCIHZlciAyIHJlbGVhc2UgNDQgZm9yIFhlM3BfTFBECisj
ICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuaTkxNSBmb3IgZGV0
YWlscworIyAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5pOTE1
CisjIEBAIC01NzQ4LDEzICs1OTQ2LDEzIEBACisjICBWZXJzaW9uOiBHU0MgQVBJL0FQQiB2MS4w
LCByZWxlYXNlIDEwNC4wLjUuMTQyOSwgU1ZOIDEgZm9yIEx1bmFybGFrZQorIyAgCisjICBGaWxl
OiB4ZS9sbmxfZ3VjXzcwLmJpbgorIyAtVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjcyLjEg
Zm9yIEx1bmFybGFrZQorIyArVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjgzLjAgZm9yIEx1
bmFybGFrZQorIyAgCisjICBGaWxlOiB4ZS9sbmxfaHVjLmJpbgorIyAgVmVyc2lvbjogSHVDIEFQ
SS9BUEIgdmVyIDkuNC4xMyBmb3IgTHVuYXJsYWtlCisjICAKKyMgIEZpbGU6IHhlL2JtZ19ndWNf
NzAuYmluCisjIC1WZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuNzIuMSBmb3IgQmF0dGxlbWFn
ZQorIyArVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjgzLjAgZm9yIEJhdHRsZW1hZ2UKKyMg
IAorIyAgRmlsZTogeGUvYm1nX2h1Yy5iaW4KKyMgIFZlcnNpb246IEh1QyBBUEkvQVBCIHZlciA4
LjIuMTAgZm9yIEJhdHRsZW1hZ2UKKyMgQEAgLTU3NjYsMTMgKzU5NjQsMjMgQEAKKyMgIFZlcnNp
b246IEdTQyBBUEkvQVBCIHYxLjAsIHJlbGVhc2UgMTA1LjAuMi4xMzk3LCBTVk4gMSBmb3IgUGFu
dGhlcmxha2UKKyMgIAorIyAgRmlsZTogeGUvcHRsX2d1Y183MC5iaW4KKyMgLVZlcnNpb246IEd1
QyBBUEkvQVBCIHZlciA3MC43Mi4xIGZvciBQYW50aGVybGFrZQorIyArVmVyc2lvbjogR3VDIEFQ
SS9BUEIgdmVyIDcwLjgzLjAgZm9yIFBhbnRoZXJsYWtlCisjICAKKyMgIEZpbGU6IHhlL3B0bF9o
dWMuYmluCisjICBWZXJzaW9uOiBIdUMgQVBJL0FQQiB2ZXIgMTAuMy4zIGZvciBQYW50aGVybGFr
ZQorIyAgCisjICBGaWxlOiB4ZS9udmxfZ3VjXzcwLmJpbgorIyAtVmVyc2lvbjogR3VDIEFQSS9B
UEIgdmVyIDcwLjcyLjEgZm9yIE5vdmFsYWtlIFMKKyMgK1ZlcnNpb246IEd1QyBBUEkvQVBCIHZl
ciA3MC44My4wIGZvciBOb3ZhbGFrZSBTCisjICsKKyMgK0ZpbGU6IHhlL252bF9nc2NfMS5iaW4K
KyMgK1ZlcnNpb246IEdTQyBBUEkgdjEuMCwgcmVsZWFzZSAxMDguMC4wLjEyNDIsIFNWTiAxIGZv
ciBOb3ZhbGFrZQorIyArCisjICtGaWxlOiB4ZS9jcmlfZ3VjXzcwLmJpbgorIyArVmVyc2lvbjog
R3VDIEFQSS9BUEIgdmVyIDcwLjgzLjAgZm9yIENyZXNjZW50aXNsYW5kCisjICsKKyMgK0ZpbGU6
IHhlL252bHBnX2d1Y183MC5iaW4KKyMgK0ZpbGU6IHhlL252bHBtX2d1Y183MC5iaW4KKyMgK1Zl
cnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC44My4wIGZvciBOb3ZhbGFrZSBQCisjICAKKyMgIExp
Y2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UueGUgZm9yIGRldGFpbHMKKyMgIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOU0UueGUKKyMgQEAgLTYyODcs
OCArNjQ5NSw5IEBACisjICBGaWxlOiBhdG1lbC93aWxjMTAwMF9wMnBfZncuYmluCisjICBGaWxl
OiBhdG1lbC93aWxjMTAwMF93aWZpX2Zpcm13YXJlLmJpbgorIyAgRmlsZTogYXRtZWwvd2lsYzEw
MDBfd2lmaV9maXJtd2FyZS0xLmJpbgorIyArVmVyc2lvbjogMTYuNS4yCisjICBGaWxlOiBhdG1l
bC93aWxjMzAwMF93aWZpX2Zpcm13YXJlLTEuYmluCisjIC1WZXJzaW9uOiAxNi4xLjIKKyMgK1Zl
cnNpb246IDE2LjUuMgorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNF
TlNFLmF0bWVsIGZvciBkZXRhaWxzCisjICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTGljZW5z
ZVJlZi1MSUNFTlNFLmF0bWVsCisjIEBAIC02MzY1LDcgKzY1NzQsNyBAQAorIyAgVmVyc2lvbjog
djIuMC4yMTk2MQorIyAgRmlsZTogbWVkaWF0ZWsvbXQ4MTg4L3NjcF9jMC5pbWcKKyMgIExpbms6
IG1lZGlhdGVrL210ODE4OC9zY3AuaW1nIC0+IHNjcF9jMC5pbWcKKyMgLVZlcnNpb246IHYyLjAu
Mjc3NDgKKyMgK1ZlcnNpb246IHYyLjAuMzAwOTAKKyMgIEZpbGU6IG1lZGlhdGVrL210ODE4OS9z
Y3AuaW1nCisjICBWZXJzaW9uOiB2MS4wLjAKKyMgIAorIyBAQCAtNjYxNyw5ICs2ODI2LDkgQEAK
KyMgIERyaXZlcjogbXQ3OTIyIC0gTWVkaWFUZWsgTVQ3OTIyIFdpcmVsZXNzIE1BQ3MKKyMgIAor
IyAgRmlsZTogbWVkaWF0ZWsvV0lGSV9NVDc5MjJfcGF0Y2hfbWN1XzFfMV9oZHIuYmluCisjIC1W
ZXJzaW9uOiAyMDI2MDcyNDE0MzI1N2EKKyMgK1ZlcnNpb246IDIwMjYxMDI3MjAzMTQ1YQorIyAg
RmlsZTogbWVkaWF0ZWsvV0lGSV9SQU1fQ09ERV9NVDc5MjJfMS5iaW4KKyMgLVZlcnNpb246IDIw
MjYwNzI0MTQzNDAyCisjICtWZXJzaW9uOiAyMDI2MTAyNzIwMzIyNworIyAgCisjICBMaWNlbmNl
OiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5tZWRpYXRlaworIyBA
QCAtNjYyOSw3ICs2ODM4LDcgQEAKKyMgIERyaXZlcjogbXQ3OTIyIC0gTWVkaWFUZWsgTVQ3OTIy
IGJsdWV0b290aCBjaGlwc2V0CisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL0JUX1JBTV9DT0RFX01U
NzkyMl8xXzFfaGRyLmJpbgorIyAtVmVyc2lvbjogMjAyNjA3MjQxNDM4MTUKKyMgK1ZlcnNpb246
IDIwMjYxMDI3MjAzNDAzCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJ
Q0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
TGljZW5zZVJlZi1MSUNFTkNFLm1lZGlhdGVrCisjIEBAIC02NjM5LDkgKzY4NDgsOSBAQAorIyAg
RHJpdmVyOiBtdDc5MjUgLSBNZWRpYVRlayBNVDc5MjUgV2lyZWxlc3MgTUFDcworIyAgCisjICBG
aWxlOiBtZWRpYXRlay9tdDc5MjUvV0lGSV9NVDc5MjVfUEFUQ0hfTUNVXzFfMV9oZHIuYmluCisj
IC1WZXJzaW9uOiAyMDI2MDgxMzExMzAxNWEKKyMgK1ZlcnNpb246IDIwMjYxMDE2MjMyOTE1YQor
IyAgRmlsZTogbWVkaWF0ZWsvbXQ3OTI1L1dJRklfUkFNX0NPREVfTVQ3OTI1XzFfMS5iaW4KKyMg
LVZlcnNpb246IDIwMjYwODEzMTEzMTE4CisjICtWZXJzaW9uOiAyMDI2MTAxNjIzMzAyOQorIyAg
CisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBk
ZXRhaWxzLgorIyAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5t
ZWRpYXRlaworIyBAQCAtNjY1MSw3ICs2ODYwLDcgQEAKKyMgIERyaXZlcjogbXQ3OTI1IC0gTWVk
aWFUZWsgTVQ3OTI1IGJsdWV0b290aCBjaGlwc2V0CisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL210
NzkyNS9CVF9SQU1fQ09ERV9NVDc5MjVfMV8xX2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjYwODEz
MTEzMjM2CisjICtWZXJzaW9uOiAyMDI2MTAxNjIzMzIyMQorIyAgCisjICBMaWNlbmNlOiBSZWRp
c3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5DRS5tZWRpYXRlaworIyBAQCAtNjk4
Nyw3ICs3MTk2LDcgQEAKKyMgIAorIyAgRmlsZTogcWNvbS92cHUvdnB1NDBfcDJfczcubWJuCisj
ICAKKyMgLVZlcnNpb246IFZJREVPLlZQVS40LjAtMDA0NQorIyArVmVyc2lvbjogVklERU8uVlBV
LjUuMC0wMDQyCisjICAKKyMgIEZpbGU6IHFjb20vdnB1L3ZwdTQwX3AxX3M4Lm1ibgorIyAgCisj
IEBAIC03MTA1LDExICs3MzE0LDI0IEBACisjICBWZXJzaW9uOiB2NC4wMi4xNAorIyAgRmlsZTog
cWNvbS9zbTg2NTAvZ2VuNzA5MDBfemFwLm1ibgorIyAgVmVyc2lvbjogdjAuMTMKKyMgK0xpbms6
IHFjb20vZ2VuNzEzMDBfYXFlLmZ3IC0+IGdlbjcwOTAwX2FxZS5mdworIyArRmlsZTogcWNvbS9n
ZW43MTMwMF9nbXUuYmluCisjICtWZXJzaW9uOiB2NC4xMS4wMAorIyArRmlsZTogcWNvbS9nZW43
MTMwMF9zcWUuZncKKyMgK1ZlcnNpb246IHYxLjg2CisjICtGaWxlOiBxY29tL25vcmQvZ2VuNzEz
MDBfemFwLm1ibgorIyArVmVyc2lvbjogdjAuMTMKKyMgIEZpbGU6IHFjb20vZ2VuNzE1MDBfZ211
LmJpbgorIyAgVmVyc2lvbjogdjQuMDYuMDQKKyMgIEZpbGU6IHFjb20vZ2VuNzE1MDBfc3FlLmZ3
CisjICBWZXJzaW9uOiB2MS44MQorIyAgRmlsZTogcWNvbS94MXA0MjEwMC9nZW43MTUwMF96YXAu
bWJuCisjICtWZXJzaW9uOiB2MC4xMworIyArRmlsZTogcWNvbS9nZW43MTYwMF9nbXUuYmluCisj
ICtWZXJzaW9uOiB2NC4xMC4wMAorIyArRmlsZTogcWNvbS9nZW43MTYwMF9zcWUuZncKKyMgK1Zl
cnNpb246IHYxLjg2CisjICtGaWxlOiBxY29tL25vcmQvZ2VuNzE2MDBfemFwLm1ibgorIyAgVmVy
c2lvbjogdjAuMTMKKyMgIEZpbGU6IHFjb20vZ2VuNzE3MDBfZ211LmJpbgorIyAgVmVyc2lvbjog
djQuMDkuMDAKKyMgQEAgLTcyNDYsNyArNzQ2OCw3IEBACisjICBWZXJzaW9uOiBDRFNQLkhULjIu
NS5jNC0wMDAwNC1LT0RJQUstMQorIyAgUmF3RmlsZTogcWNvbS9xY3M2NDkwL3JhZHhhL2RyYWdv
bi1xNmEvY2RzcHIuanNuCisjICBGaWxlOiBxY29tL3FjczY0OTAvVGh1bmRlcmNvbW0vUnViaWtQ
aTMvYWRzcC5tYm4KKyMgLVZlcnNpb246IEFEU1AuSFQuNS41LmM4LTAwMjQ5LjEtS09ESUFLLTEK
KyMgK1ZlcnNpb246IEFEU1AuSFQuNS41LmM4LTAwMjU2LjItS09ESUFLLTEKKyMgIFJhd0ZpbGU6
IHFjb20vcWNzNjQ5MC9UaHVuZGVyY29tbS9SdWJpa1BpMy9hZHNwci5qc24KKyMgIFJhd0ZpbGU6
IHFjb20vcWNzNjQ5MC9UaHVuZGVyY29tbS9SdWJpa1BpMy9hZHNwcy5qc24KKyMgIFJhd0ZpbGU6
IHFjb20vcWNzNjQ5MC9UaHVuZGVyY29tbS9SdWJpa1BpMy9hZHNwdWEuanNuCisjIEBAIC03MzIy
LDcgKzc1NDQsNyBAQAorIyAgRmlsZTogcWNvbS9zYzgyODB4cC9yYWR4YS9kcmFnb24tcThiL3Fj
YWRzcDgyODAubWJuCisjICBWZXJzaW9uOiBBRFNQLkhULjUuNi5jMi0wMDAzNy1NQUtFTkEtMQor
IyAgCisjIC0jIExlbm92byBUMTRzCisjICsjIExlbm92byBUMTRzIEc2CisjICBGaWxlOiBxY29t
L3gxZTgwMTAwL0xFTk9WTy8yMU4xL3FjdnNzODM4MC5tYm4KKyMgIFZlcnNpb246IFZJREVPLlZQ
VS4zLjEtMDA4NQorIyAgUmF3RmlsZTogcWNvbS94MWU4MDEwMC9MRU5PVk8vMjFOMS9hZHNwdWEu
anNuCisjIEBAIC03MzM3LDcgKzc1NTksNyBAQAorIyAgRmlsZTogcWNvbS94MWU4MDEwMC9MRU5P
Vk8vMjFOMS9jZHNwX2R0YnMuZWxmCisjICBSYXdGaWxlOiBxY29tL3gxZTgwMTAwL0xFTk9WTy8y
MU4xL2Fkc3BzLmpzbgorIyAgRmlsZTogcWNvbS94MWU4MDEwMC9MRU5PVk8vMjFOMS9xY2Nkc3A4
MzgwLm1ibgorIyAtVmVyc2lvbjogQ0RTUC5IVC4yLjktMDA0NDctSEFNT0EtMgorIyArVmVyc2lv
bjogQ0RTUC5IVC4yLjkuYzEtMDAwNzgtSEFNT0EtMQorIyAgUmF3RmlsZTogcWNvbS94MWU4MDEw
MC9MRU5PVk8vMjFOMS9jZHNwci5qc24KKyMgIFJhd0ZpbGU6IHFjb20veDFlODAxMDAvTEVOT1ZP
LzIxTjEvYmF0dG1nci5qc24KKyMgIAorIyBAQCAtNzM1Myw5ICs3NTc1LDEwIEBACisjICBGaWxl
OiBxY29tL3gxZTgwMTAwL0xFTk9WTy84M0VEL3FjYXYxZTgzODAubWJuCisjICBWZXJzaW9uOiBD
RFNQLkhULjIuOS5jMi0wMDA1MS1IQU1PQS0xCisjICBGaWxlOiBxY29tL3gxZTgwMTAwL0xFTk9W
Ty84M0VEL3FjY2RzcDgzODAubWJuCisjIC1WZXJzaW9uOiBDRFNQLkhULjIuOS5jMi0wMDA1MS1I
QU1PQS0xCisjICtWZXJzaW9uOiBDRFNQLkhULjIuOS5jMS0wMDA3NS1IQU1PQS0xCisjICBGaWxl
OiBxY29tL3gxZTgwMTAwL0xFTk9WTy84M0VEL3FjdnNzODM4MC5tYm4KKyMgIFZlcnNpb246IHZp
ZGVvLWZpcm13YXJlLjMuMS1lNWFlYTIwYzY0Y2I2ZGY5YTFjOWJlOTllMjA2MDUzYjM2NDI0OTM5
CisjICtGaWxlOiBxY29tL3gxZTgwMTAwL0xFTk9WTy84M0VEL2Nkc3BfZHRicy5lbGYKKyMgIAor
IyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5xY29tIGFuZCBOT1RJQ0Uu
cWNvbSBmb3IgZGV0YWlscworIyAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYt
TElDRU5TRS5xY29tCisjIEBAIC03Mzg1LDYgKzc2MDgsMTAgQEAKKyMgIEZpbGU6IHFjb20vZ2x5
bXVyL2Nkc3BfZHRiLm1ibgorIyAgVmVyc2lvbjogQ0RTUC5IVC4zLjMtMDAzMTUtR0xZTVVSLTEK
KyMgIFJhd0ZpbGU6IHFjb20vZ2x5bXVyL2Nkc3ByLmpzbgorIyArRmlsZTogcWNvbS9nbHltdXIv
c29jY3AubWJuCisjICtGaWxlOiBxY29tL2dseW11ci9zb2NjcF9kdGIubWJuCisjICtWZXJzaW9u
OiBTT0NDUC5GVy4yLjEtMDAyNjMtR0xZTVVSX1NPQ0NQX1BBQ0stMQorIyArUmF3RmlsZTogcWNv
bS9nbHltdXIvc29jY3ByLmpzbgorIyAgCisjICAjIHFjb20vaGF3aQorIyAgRmlsZTogcWNvbS9o
YXdpL2Fkc3AubWJuCisjIEBAIC03NDU4LDcgKzc2ODUsNyBAQAorIyAgRmlsZTogcWNvbS9ub3Jk
L2Fkc3AxLm1ibgorIyAgRmlsZTogcWNvbS9ub3JkL2Fkc3BfZHRiLm1ibgorIyAgRmlsZTogcWNv
bS9ub3JkL2Fkc3AxX2R0Yi5tYm4KKyMgLVZlcnNpb246IEhQQVNTLkFULjEuMC4xLTAwMDAzLU5P
UkQtNgorIyArVmVyc2lvbjogSFBBU1MuQVQuMS4wLjEtMDAwMzItTk9SRC0xCisjICBSYXdGaWxl
OiBxY29tL25vcmQvYWRzcHIuanNuCisjICBSYXdGaWxlOiBxY29tL25vcmQvYWRzcHVhLmpzbgor
IyAgUmF3RmlsZTogcWNvbS9ub3JkL2Fkc3Axci5qc24KKyMgQEAgLTc0NjYsMTEgKzc2OTMsMTQg
QEAKKyMgIEZpbGU6IHFjb20vbm9yZC9jZHNwX2R0Yi5tYm4KKyMgIFZlcnNpb246IE5TUC5BVC4x
LjAtMDA1NzktTk9SRC0xCisjICBSYXdGaWxlOiBxY29tL25vcmQvY2RzcHIuanNuCisjICtGaWxl
OiBxY29tL25vcmQvc29jY3AubWJuCisjICtWZXJzaW9uOiBTT0NDUC5GVy4yLjItMDAwMDkuNC1O
T1JEX1NPQ0NQX1BBQ0stMQorIyArUmF3RmlsZTogcWNvbS9ub3JkL3NvY2Nwci5qc24KKyMgIAor
IyAgIyBxY29tL3NtODc1MAorIyAgRmlsZTogcWNvbS9zbTg3NTAvYWRzcC5tYm4KKyMgIEZpbGU6
IHFjb20vc204NzUwL2Fkc3BfZHRiLm1ibgorIyAtVmVyc2lvbjogTFBBSURTUC5IVC4xLjIuYzIt
MDAwMjEtUEFLQUxBLTEKKyMgK1ZlcnNpb246IExQQUlEU1AuSFQuMS4yLmMyLTAwMDgwLVBBS0FM
QS0xCisjICBSYXdGaWxlOiBxY29tL3NtODc1MC9hZHNwci5qc24KKyMgIFJhd0ZpbGU6IHFjb20v
c204NzUwL2Fkc3BzLmpzbgorIyAgUmF3RmlsZTogcWNvbS9zbTg3NTAvYWRzcHVhLmpzbgorIyBA
QCAtNzQ4MywxMSArNzcxMywxMSBAQAorIyAgIyBxY29tL2VsaXphCisjICBGaWxlOiBxY29tL2Vs
aXphL2Nkc3AubWJuCisjICBGaWxlOiBxY29tL2VsaXphL2Nkc3BfZHRiLm1ibgorIyAtVmVyc2lv
bjogQ0RTUC5IVC4zLjEtMDA4ODktUEFLQUxBLTEKKyMgK1ZlcnNpb246IENEU1AuSFQuMy4xLTAw
ODkzLVBBS0FMQS0xCisjICBSYXdGaWxlOiBxY29tL2VsaXphL2Nkc3ByLmpzbgorIyAgRmlsZTog
cWNvbS9lbGl6YS9hZHNwLm1ibgorIyAgRmlsZTogcWNvbS9lbGl6YS9hZHNwX2R0Yi5tYm4KKyMg
LVZlcnNpb246IExQQUlEU1AuSFQuMS4yLmMyLTAwMDY0LVBBS0FMQS0zCisjICtWZXJzaW9uOiBM
UEFJRFNQLkhULjEuMi5jMi0wMDA4MC1QQUtBTEEtMQorIyAgUmF3RmlsZTogcWNvbS9lbGl6YS9h
ZHNwci5qc24KKyMgIFJhd0ZpbGU6IHFjb20vZWxpemEvYWRzcHMuanNuCisjICBSYXdGaWxlOiBx
Y29tL2VsaXphL2Fkc3B1YS5qc24KKyMgQEAgLTc1MDMsMTQgKzc3MzMsMTQgQEAKKyMgIAorIyAg
IyBxY29tL3NoaWtyYQorIyAgRmlsZTogcWNvbS9zaGlrcmEvY2RzcC5tYm4KKyMgLVZlcnNpb246
IENEU1AuVlQuMi40LjMtMDAwODgtU0hJS1JBLTEKKyMgK1ZlcnNpb246IENEU1AuVlQuMi40LjMt
MDAxMzEtU0hJS1JBLTIKKyMgIFJhd0ZpbGU6IHFjb20vc2hpa3JhL2Nkc3ByLmpzbgorIyAgRmls
ZTogcWNvbS9zaGlrcmEvbHBhaWNwLm1ibgorIyAgRmlsZTogcWNvbS9zaGlrcmEvbHBhaWNwX2R0
Yi5tYm4KKyMgLVZlcnNpb246IExQQUlDUC5GVy4xLjItMDAxNTUtU0hJS1JBX0xQQUlDUF9QQUNL
LTEKKyMgK1ZlcnNpb246IExQQUlDUC5GVy4xLjItMDAxNzMuMS1TSElLUkFfTFBBSUNQX1BBQ0st
MXMKKyMgIFJhd0ZpbGU6IHFjb20vc2hpa3JhL2xwYWljcHIuanNuCisjICBGaWxlOiBxY29tL3No
aWtyYS9jcXMvcWRzcDZzdy5tYm4KKyMgLVZlcnNpb246IE1QU1MuSk8uNC4wLTAwMjcyLVNISUtS
QV9MV0dfUEFDSy0yCisjICtWZXJzaW9uOiBNUFNTLkpPLjQuMC0wMDI3My1TSElLUkFfTFdHX1BB
Q0stMQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLnFjb20t
MiBhbmQgTk9USUNFLnFjb20gZm9yIGRldGFpbHMKKyMgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBMaWNlbnNlUmVmLUxJQ0VOU0UucWNvbS0yCisjIEBAIC04OTE2LDExICs5MTQ2LDE1IEBACisj
ICBGaWxlOiBjaXJydXMvY3MzNWw1Ni9DUzM1TDU2X1JldjQuNS45LndtZncKKyMgIEZpbGU6IGNp
cnJ1cy9jczM1bDU2L0NTMzVMNTZfUmV2NC43LjAud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVs
NTYvQ1MzNUw1Nl9SZXY0LjcuMi53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ni9DUzM1TDU2
X1JldjQuNy41LndtZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2L0NTMzVMNTZfUmV2NC43Ljku
d21mdworIyArRmlsZTogY2lycnVzL2NzMzVsNTYvQ1MzNUw1Nl9SZXY0LjcuMTAud21mdworIyAg
RmlsZTogY2lycnVzL2NzMzVsNTYvQ1MzNUw1Nl9SZXY0LjcuMTIud21mdworIyArRmlsZTogY2ly
cnVzL2NzMzVsNTYvQ1MzNUw1Nl9SZXY0LjcuMTcud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVs
NjMvQ1MzNUw2M19SZXYyLjUuNC53bWZ3CisjICBGaWxlOiBjaXJydXMvY3MzNWw2My9DUzM1TDYz
X1JldjIuNS43LndtZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDYzL0NTMzVMNjNfUmV2Mi41LjEx
LndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDYzL0NTMzVMNjNfUmV2Mi42LjYud21mdworIyAg
TGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwMjgwYzYyLXNwa2lkMC53bWZ3IC0+
IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjExLndtZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2
LWIwLWRzcDEtbWlzYy0xMDI4MGM2Mi1zcGtpZDAtYW1wMS5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9j
czM1bDU2LWIwLWRzcDEtbWlzYy0xMDI4MGM2Mi1zcGtpZDAtYW1wMi5iaW4KKyMgQEAgLTk0ODks
NiArOTcyMywxMiBAQAorIyAgTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgw
ZWRjLXNwa2lkMS0wMC1sM3UzLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVkYy1z
cGtpZDAtMDAtbDN1My5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0x
MDI4MGVkYy1zcGtpZDEtMDEtbDN1MS5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBl
ZGMtc3BraWQwLTAwLWwzdTEuYmluCisjICBMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1p
c2MtMTAyODBlZGMtc3BraWQxLTAxLWwzdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEw
MjgwZWRjLXNwa2lkMC0wMC1sM3UzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTYtYjItZHNw
MS1taXNjLTEwMjgwZWUwLXNwa2lkMC53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXY0LjcuMTcu
d21mdworIyArRmlsZTogY2lycnVzL2NzMzVsNTYtYjItZHNwMS1taXNjLTEwMjgwZWUwLXNwa2lk
MC1sMnUwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNTYtYjItZHNwMS1taXNjLTEwMjgwZWUw
LXNwa2lkMC1sMnUxLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTYtYjItZHNwMS1taXNjLTEw
MjgwZWUwLXNwa2lkMS53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXY0LjcuMTcud21mdworIyAr
RmlsZTogY2lycnVzL2NzMzVsNTYtYjItZHNwMS1taXNjLTEwMjgwZWUwLXNwa2lkMS1sMnUwLmJp
bgorIyArRmlsZTogY2lycnVzL2NzMzVsNTYtYjItZHNwMS1taXNjLTEwMjgwZWUwLXNwa2lkMS1s
MnUxLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTEwMjgwZWUyLXNw
a2lkMS53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXY0LjcuOS53bWZ3CisjICBGaWxlOiBjaXJy
dXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBlZTItc3BraWQxLWwydTEuYmluCisjICBGaWxl
OiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBlZTItc3BraWQxLWwydTMuYmluCisj
IEBAIC05NTg5LDYgKzk4MjksNTYgQEAKKyMgIExpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEt
bWlzYy0xMDI4MGVlZi1zcGtpZDMud21mdyAtPiBjczM1bDYzL0NTMzVMNjNfUmV2Mi41Ljcud21m
dworIyAgTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWVmLXNwa2lkMy0w
NS1sM3UxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxZS1zcGtpZDMtMDYtbDN1
MS5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVlZi1zcGtp
ZDMtMDUtbDN1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWUtc3BraWQzLTA2
LWwzdTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZjEt
c3BraWQxLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVmMS1zcGtpZDEtMDYtbDF1MS5iaW4gLT4g
Y3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWUtc3BraWQxLTA2LWwzdTEuYmluCisjICtMaW5r
OiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZjEtc3BraWQxLTA2LWwxdTMuYmlu
IC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFlLXNwa2lkMS0wNi1sM3UzLmJpbgorIyAr
TGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWYxLXNwa2lkMi53bWZ3IC0+
IGNzMzVsNjMvQ1MzNUw2M19SZXYyLjUuNy53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1h
MS1kc3AxLW1pc2MtMTAyODBlZjEtc3BraWQyLTA2LWwxdTEuYmluIC0+IGNzMzVsNjMtYTEtZHNw
MS1taXNjLTEwMjgwZTFlLXNwa2lkMi0wNi1sM3UxLmJpbgorIyArTGluazogY2lycnVzL2NzMzVs
NjMtYTEtZHNwMS1taXNjLTEwMjgwZWYxLXNwa2lkMi0wNi1sMXUzLmJpbiAtPiBjczM1bDYzLWEx
LWRzcDEtbWlzYy0xMDI4MGUxZS1zcGtpZDItMDYtbDN1My5iaW4KKyMgK0xpbms6IGNpcnJ1cy9j
czM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVmMS1zcGtpZDMud21mdyAtPiBjczM1bDYzL0NTMzVM
NjNfUmV2Mi41Ljcud21mdworIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEw
MjgwZWYxLXNwa2lkMy0wNi1sMXUxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUx
ZS1zcGtpZDMtMDYtbDN1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlz
Yy0xMDI4MGVmMS1zcGtpZDMtMDYtbDF1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAy
ODBlMWUtc3BraWQzLTA2LWwzdTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3Ax
LW1pc2MtMTAyODBlZjItc3BraWQwLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS43Lndt
ZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVmMi1zcGtpZDAt
MDEtbDF1MS5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQwLTAxLWwz
dTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZjItc3Br
aWQwLTAxLWwxdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFjLXNwa2lkMC0w
MS1sM3UzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWYy
LXNwa2lkMC0wMi1sMXUxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxYy1zcGtp
ZDAtMDEtbDN1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4
MGVmMi1zcGtpZDAtMDItbDF1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMt
c3BraWQwLTAxLWwzdTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2Mt
MTAyODBlZjItc3BraWQxLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMg
K0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVmMi1zcGtpZDEtMDEtbDF1
MS5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQxLTAxLWwzdTEuYmlu
CisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZjItc3BraWQxLTAx
LWwxdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFjLXNwa2lkMS0wMS1sM3Uz
LmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWYyLXNwa2lk
MS0wMi1sMXUxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxYy1zcGtpZDEtMDEt
bDN1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVmMi1z
cGtpZDEtMDItbDF1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQx
LTAxLWwzdTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBl
ZjItc3BraWQyLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVmMi1zcGtpZDItMDEtbDF1MS5iaW4g
LT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQyLTAxLWwzdTEuYmluCisjICtM
aW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZjItc3BraWQyLTAxLWwxdTMu
YmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFjLXNwa2lkMi0wMS1sM3UzLmJpbgor
IyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWYyLXNwa2lkMi0wMi1s
MXUxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxYy1zcGtpZDItMDEtbDN1MS5i
aW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVmMi1zcGtpZDIt
MDItbDF1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQyLTAxLWwz
dTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZjItc3Br
aWQzLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMgK0xpbms6IGNpcnJ1
cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVmMi1zcGtpZDMtMDEtbDF1MS5iaW4gLT4gY3Mz
NWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQzLTAxLWwzdTEuYmluCisjICtMaW5rOiBj
aXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZjItc3BraWQzLTAxLWwxdTMuYmluIC0+
IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFjLXNwa2lkMy0wMS1sM3UzLmJpbgorIyArTGlu
azogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWYyLXNwa2lkMy0wMi1sMXUxLmJp
biAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxYy1zcGtpZDMtMDEtbDN1MS5iaW4KKyMg
K0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVmMi1zcGtpZDMtMDItbDF1
My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQzLTAxLWwzdTMuYmlu
CisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZjMtc3BraWQxLndt
ZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1
bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVmMy1zcGtpZDEtMDUtbDF1MS5iaW4gLT4gY3MzNWw2My1h
MS1kc3AxLW1pc2MtMTAyODBlMWUtc3BraWQxLTA2LWwzdTEuYmluCisjICtMaW5rOiBjaXJydXMv
Y3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZjMtc3BraWQxLTA1LWwxdTMuYmluIC0+IGNzMzVs
NjMtYTEtZHNwMS1taXNjLTEwMjgwZTFlLXNwa2lkMS0wNi1sM3UzLmJpbgorIyArTGluazogY2ly
cnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWYzLXNwa2lkMi53bWZ3IC0+IGNzMzVsNjMv
Q1MzNUw2M19SZXYyLjUuNy53bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1p
c2MtMTAyODBlZjMtc3BraWQyLTA1LWwxdTEuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEw
MjgwZTFlLXNwa2lkMi0wNi1sM3UxLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNw
MS1taXNjLTEwMjgwZWYzLXNwa2lkMi0wNS1sMXUzLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlz
Yy0xMDI4MGUxZS1zcGtpZDItMDYtbDN1My5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWEx
LWRzcDEtbWlzYy0xMDI4MGVmMy1zcGtpZDMud21mdyAtPiBjczM1bDYzL0NTMzVMNjNfUmV2Mi41
Ljcud21mdworIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWYzLXNw
a2lkMy0wNS1sMXUxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxZS1zcGtpZDMt
MDYtbDN1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVm
My1zcGtpZDMtMDUtbDF1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWUtc3Br
aWQzLTA2LWwzdTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAy
ODBlZjQtc3BraWQwLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMgK0xp
bms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVmNC1zcGtpZDAtMDItbDF1MS5i
aW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQwLTAxLWwzdTEuYmluCisj
ICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZjQtc3BraWQwLTAyLWwx
dTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFjLXNwa2lkMC0wMS1sM3UzLmJp
bgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWY0LXNwa2lkMS53
bWZ3IC0+IGNzMzVsNjMvQ1MzNUw2M19SZXYyLjUuNy53bWZ3CisjICtMaW5rOiBjaXJydXMvY3Mz
NWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZjQtc3BraWQxLTAyLWwxdTEuYmluIC0+IGNzMzVsNjMt
YTEtZHNwMS1taXNjLTEwMjgwZTFjLXNwa2lkMS0wMS1sM3UxLmJpbgorIyArTGluazogY2lycnVz
L2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWY0LXNwa2lkMS0wMi1sMXUzLmJpbiAtPiBjczM1
bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxYy1zcGtpZDEtMDEtbDN1My5iaW4KKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVmNC1zcGtpZDIud21mdyAtPiBjczM1bDYz
L0NTMzVMNjNfUmV2Mi41Ljcud21mdworIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1t
aXNjLTEwMjgwZWY0LXNwa2lkMi0wMi1sMXUxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0x
MDI4MGUxYy1zcGtpZDItMDEtbDN1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRz
cDEtbWlzYy0xMDI4MGVmNC1zcGtpZDItMDItbDF1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1p
c2MtMTAyODBlMWMtc3BraWQyLTAxLWwzdTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1h
MS1kc3AxLW1pc2MtMTAyODBlZjQtc3BraWQzLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIu
NS43LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGVmNC1z
cGtpZDMtMDItbDF1MS5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWMtc3BraWQz
LTAxLWwzdTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBl
ZjQtc3BraWQzLTAyLWwxdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFjLXNw
a2lkMy0wMS1sM3UzLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEw
MjgwZWZiLXNwa2lkMC53bWZ3IC0+IGNzMzVsNjMvQ1MzNUw2M19SZXYyLjUuNy53bWZ3CisjICBM
aW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlZmItc3BraWQwLTAyLWwxdTEu
YmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTFjLXNwa2lkMC0wMS1sM3UxLmJpbgor
IyAgTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZWZiLXNwa2lkMC0wMi1s
MXUzLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUxYy1zcGtpZDAtMDEtbDN1My5i
aW4KKyMgQEAgLTk2MTksMTIgKzk5MDksMzggQEAKKyMgIExpbms6IGNpcnJ1cy9jczM1bDYzLWEx
LWRzcDEtbWlzYy0xMDI4MGYwMS1zcGtpZDEud21mdyAtPiBjczM1bDYzL0NTMzVMNjNfUmV2Mi41
LjExLndtZncKKyMgIExpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYwMS1z
cGtpZDEtMDAtbDB1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBmMDEtc3BraWQw
LTAwLWwwdTMuYmluCisjICBMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBm
MDEtc3BraWQxLTAwLWwzdTEuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZjAxLXNw
a2lkMC0wMC1sM3UxLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTEw
MjgwZjAyLXNwa2lkMC53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXY0LjcuOS53bWZ3CisjICtG
aWxlOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBmMDItc3BraWQwLWwwdTIuYmlu
CisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBmMDItc3BraWQwLWww
dTMuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBmMDItc3Br
aWQwLWwzdTAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBm
MDItc3BraWQwLWwzdTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2Mt
MTAyODBmMDItc3BraWQxLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjQuNy45LndtZncKKyMg
K0xpbms6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGYwMi1zcGtpZDEtbDB1Mi5i
aW4gLT4gY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBmMDItc3BraWQwLWwwdTIuYmluCisjICtM
aW5rOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBmMDItc3BraWQxLWwwdTMuYmlu
IC0+IGNzMzVsNTctYjItZHNwMS1taXNjLTEwMjgwZjAyLXNwa2lkMC1sMHUzLmJpbgorIyArTGlu
azogY2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTEwMjgwZjAyLXNwa2lkMS1sM3UwLmJpbiAt
PiBjczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGYwMi1zcGtpZDAtbDN1MC5iaW4KKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGYwMi1zcGtpZDEtbDN1MS5iaW4gLT4g
Y3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBmMDItc3BraWQwLWwzdTEuYmluCisjICtMaW5rOiBj
aXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBmMDMtc3BraWQwLndtZncgLT4gY3MzNWw1
Ni9DUzM1TDU2X1JldjQuNy45LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEt
bWlzYy0xMDI4MGYwMy1zcGtpZDAtbDB1Mi5iaW4gLT4gY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAy
ODBmMDItc3BraWQwLWwwdTIuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1p
c2MtMTAyODBmMDMtc3BraWQwLWwwdTMuYmluIC0+IGNzMzVsNTctYjItZHNwMS1taXNjLTEwMjgw
ZjAyLXNwa2lkMC1sMHUzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNj
LTEwMjgwZjAzLXNwa2lkMC1sM3UwLmJpbiAtPiBjczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGYw
Mi1zcGtpZDAtbDN1MC5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0x
MDI4MGYwMy1zcGtpZDAtbDN1MS5iaW4gLT4gY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBmMDIt
c3BraWQwLWwzdTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAy
ODBmMDMtc3BraWQxLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjQuNy45LndtZncKKyMgK0xp
bms6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGYwMy1zcGtpZDEtbDB1Mi5iaW4g
LT4gY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBmMDItc3BraWQwLWwwdTIuYmluCisjICtMaW5r
OiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBmMDMtc3BraWQxLWwwdTMuYmluIC0+
IGNzMzVsNTctYjItZHNwMS1taXNjLTEwMjgwZjAyLXNwa2lkMC1sMHUzLmJpbgorIyArTGluazog
Y2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTEwMjgwZjAzLXNwa2lkMS1sM3UwLmJpbiAtPiBj
czM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGYwMi1zcGtpZDAtbDN1MC5iaW4KKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGYwMy1zcGtpZDEtbDN1MS5iaW4gLT4gY3Mz
NWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBmMDItc3BraWQwLWwzdTEuYmluCisjICBMaW5rOiBjaXJy
dXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBmMDQtc3BraWQwLndtZncgLT4gY3MzNWw2My9D
UzM1TDYzX1JldjIuNS4xMS53bWZ3CisjICBMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1p
c2MtMTAyODBmMDQtc3BraWQwLTAwLWwwdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEw
MjgwZjAxLXNwa2lkMC0wMC1sMHUzLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNw
MS1taXNjLTEwMjgwZjA0LXNwa2lkMC0wMC1sM3UxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlz
Yy0xMDI4MGYwMS1zcGtpZDAtMDAtbDN1MS5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDYzLWEx
LWRzcDEtbWlzYy0xMDI4MGYwNC1zcGtpZDEud21mdyAtPiBjczM1bDYzL0NTMzVMNjNfUmV2Mi41
LjExLndtZncKKyMgIExpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYwNC1z
cGtpZDEtMDAtbDB1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBmMDEtc3BraWQw
LTAwLWwwdTMuYmluCisjICBMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBm
MDQtc3BraWQxLTAwLWwzdTEuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZjAxLXNw
a2lkMC0wMC1sM3UxLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTEw
MjgwZjA1LXNwa2lkMC53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXY0LjcuOS53bWZ3CisjICtG
aWxlOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBmMDUtc3BraWQwLWwwdTMuYmlu
CisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBmMDUtc3BraWQwLWwz
dTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTAyODBmMDUtc3Br
aWQxLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjQuNy45LndtZncKKyMgK0ZpbGU6IGNpcnJ1
cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGYwNS1zcGtpZDEtbDB1My5iaW4KKyMgK0ZpbGU6
IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xMDI4MGYwNS1zcGtpZDEtbDN1MS5iaW4KKyMg
IExpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYwNy1zcGtpZDAud21mdyAt
PiBjczM1bDYzL0NTMzVMNjNfUmV2Mi41Ljcud21mdworIyAgTGluazogY2lycnVzL2NzMzVsNjMt
YTEtZHNwMS1taXNjLTEwMjgwZjA3LXNwa2lkMC0wMi1sM3UxLmJpbiAtPiBjczM1bDYzLWExLWRz
cDEtbWlzYy0xMDI4MGUxYS1zcGtpZDAtMDItbDN1MS5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1
bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYwNy1zcGtpZDAtMDItbDN1My5iaW4gLT4gY3MzNWw2My1h
MS1kc3AxLW1pc2MtMTAyODBlMWEtc3BraWQwLTAyLWwzdTMuYmluCisjIEBAIC05NjQ5LDYgKzk5
NjUsMjkgQEAKKyMgIExpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYwOC1z
cGtpZDMud21mdyAtPiBjczM1bDYzL0NTMzVMNjNfUmV2Mi41Ljcud21mdworIyAgTGluazogY2ly
cnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZjA4LXNwa2lkMy0wNC1sM3UxLmJpbiAtPiBj
czM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGUyMy1zcGtpZDMtMDQtbDF1MS5iaW4KKyMgIExpbms6
IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYwOC1zcGtpZDMtMDQtbDN1My5iaW4g
LT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMjMtc3BraWQzLTA0LWwxdTMuYmluCisjICtM
aW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBmMTItc3BraWQyLndtZncgLT4g
Y3MzNWw2My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWEx
LWRzcDEtbWlzYy0xMDI4MGYxMi1zcGtpZDItMDEtbDF1MS5iaW4gLT4gY3MzNWw2My1hMS1kc3Ax
LW1pc2MtMTAyODBlMWEtc3BraWQyLTAxLWwzdTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2
My1hMS1kc3AxLW1pc2MtMTAyODBmMTItc3BraWQyLTAxLWwxdTMuYmluIC0+IGNzMzVsNjMtYTEt
ZHNwMS1taXNjLTEwMjgwZTFhLXNwa2lkMi0wMS1sM3UzLmJpbgorIyArTGluazogY2lycnVzL2Nz
MzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZjEyLXNwa2lkMi0wMi1sMXUxLmJpbiAtPiBjczM1bDYz
LWExLWRzcDEtbWlzYy0xMDI4MGUxYS1zcGtpZDItMDEtbDN1MS5iaW4KKyMgK0xpbms6IGNpcnJ1
cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYxMi1zcGtpZDItMDItbDF1My5iaW4gLT4gY3Mz
NWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMWEtc3BraWQyLTAxLWwzdTMuYmluCisjICtMaW5rOiBj
aXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBmMTItc3BraWQzLndtZncgLT4gY3MzNWw2
My9DUzM1TDYzX1JldjIuNS43LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEt
bWlzYy0xMDI4MGYxMi1zcGtpZDMtMDEtbDF1MS5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2Mt
MTAyODBlMWEtc3BraWQzLTAxLWwzdTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1k
c3AxLW1pc2MtMTAyODBmMTItc3BraWQzLTAxLWwxdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1t
aXNjLTEwMjgwZTFhLXNwa2lkMy0wMS1sM3UzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMt
YTEtZHNwMS1taXNjLTEwMjgwZjEyLXNwa2lkMy0wMi1sMXUxLmJpbiAtPiBjczM1bDYzLWExLWRz
cDEtbWlzYy0xMDI4MGUxYS1zcGtpZDMtMDEtbDN1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1
bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYxMi1zcGtpZDMtMDItbDF1My5iaW4gLT4gY3MzNWw2My1h
MS1kc3AxLW1pc2MtMTAyODBlMWEtc3BraWQzLTAxLWwzdTMuYmluCisjICtMaW5rOiBjaXJydXMv
Y3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBmMTMtc3BraWQwLndtZncgLT4gY3MzNWw2My9DUzM1
TDYzX1JldjIuNS43LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0x
MDI4MGYxMy1zcGtpZDAtMDMtbDF1MS5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBl
MjMtc3BraWQwLTAzLWwxdTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1p
c2MtMTAyODBmMTMtc3BraWQwLTAzLWwxdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEw
MjgwZTIzLXNwa2lkMC0wMy1sMXUzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNw
MS1taXNjLTEwMjgwZjEzLXNwa2lkMC0wNC1sMXUxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlz
Yy0xMDI4MGUyMy1zcGtpZDAtMDQtbDF1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWEx
LWRzcDEtbWlzYy0xMDI4MGYxMy1zcGtpZDAtMDQtbDF1My5iaW4gLT4gY3MzNWw2My1hMS1kc3Ax
LW1pc2MtMTAyODBlMjMtc3BraWQwLTA0LWwxdTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2
My1hMS1kc3AxLW1pc2MtMTAyODBmMTMtc3BraWQyLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1Jl
djIuNS43LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYx
My1zcGtpZDItMDMtbDF1MS5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMjMtc3Br
aWQyLTAzLWwxdTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAy
ODBmMTMtc3BraWQyLTAzLWwxdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTIz
LXNwa2lkMi0wMy1sMXUzLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNj
LTEwMjgwZjEzLXNwa2lkMi0wNC1sMXUxLmJpbiAtPiBjczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4
MGUyMy1zcGtpZDItMDQtbDF1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEt
bWlzYy0xMDI4MGYxMy1zcGtpZDItMDQtbDF1My5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2Mt
MTAyODBlMjMtc3BraWQyLTA0LWwxdTMuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1k
c3AxLW1pc2MtMTAyODBmMTMtc3BraWQzLndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNS43
LndtZncKKyMgK0xpbms6IGNpcnJ1cy9jczM1bDYzLWExLWRzcDEtbWlzYy0xMDI4MGYxMy1zcGtp
ZDMtMDQtbDF1MS5iaW4gLT4gY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBlMjMtc3BraWQzLTA0
LWwxdTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTAyODBmMTMt
c3BraWQzLTA0LWwxdTMuYmluIC0+IGNzMzVsNjMtYTEtZHNwMS1taXNjLTEwMjgwZTIzLXNwa2lk
My0wNC1sMXUzLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwM2M4
YzUyLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMTgud21mdworIyAgRmlsZTogY2ly
cnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwM2M4YzUyLWFtcDEuYmluCisjICBGaWxlOiBjaXJy
dXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAzYzhjNTItYW1wMi5iaW4KKyMgQEAgLTk3MzMsNiAr
MTAwNzIsOSBAQAorIyAgTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTEwM2M4ZTJj
LndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTEuMTEuMS53bWZ3CisjICBMaW5rOiBjaXJy
dXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTAzYzhlMmMtYW1wMS5iaW4gLT4gY3MzNWw1Ni1iMC1k
c3AxLW1pc2MtMTAzYzhkOTAtYW1wMS5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRz
cDEtbWlzYy0xMDNjOGUyYy1hbXAyLmJpbiAtPiBjczM1bDU2LWIwLWRzcDEtbWlzYy0xMDNjOGQ5
MC1hbXAyLmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZjVk
LndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMuMTMuNC53bWZ3CisjICtGaWxlOiBjaXJydXMv
Y3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhmNWQtYW1wMS5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9j
czM1bDU0LWIwLWRzcDEtbWlzYy0xMDNjOGY1ZC1hbXAyLmJpbgorIyAgTGluazogY2lycnVzL2Nz
MzVsNTQtYjAtZHNwMS1taXNjLTEwM2M5MDBjLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjMu
MTEuMTgud21mdworIyAgTGluazogY2lycnVzL2NzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M5MDBj
LWFtcDEuYmluIC0+IGNzMzVsNTQtYjAtZHNwMS1taXNjLTEwM2M4ZDAxLWFtcDEuYmluCisjICBM
aW5rOiBjaXJydXMvY3MzNWw1NC1iMC1kc3AxLW1pc2MtMTAzYzkwMGMtYW1wMi5iaW4gLT4gY3Mz
NWw1NC1iMC1kc3AxLW1pc2MtMTAzYzhkMDEtYW1wMi5iaW4KKyMgQEAgLTk3OTIsNiArMTAxMzQs
MTUgQEAKKyMgIExpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMTYzNC53bWZ3
IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjEzLjQud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVs
NTYtYjAtZHNwMS1taXNjLTEwNDMxNjM0LWwydTAuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw1
Ni1iMC1kc3AxLW1pc2MtMTA0MzE2MzQtbDJ1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU3
LWIyLWRzcDEtbWlzYy0xMDQzMWFkNC53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXY0LjcuNS53
bWZ3CisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTA0MzFhZDQtbDJ1MC5i
aW4gLT4gY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTA0MzFhZDQtc3BraWQwLWwydTAuYmluCisjICtM
aW5rOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTA0MzFhZDQtbDJ1MS5iaW4gLT4gY3Mz
NWw1Ny1iMi1kc3AxLW1pc2MtMTA0MzFhZDQtc3BraWQwLWwydTEuYmluCisjICtMaW5rOiBjaXJy
dXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTA0MzFhZDQtc3BraWQwLndtZncgLT4gY3MzNWw1Ni9D
UzM1TDU2X1JldjQuNy41LndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlz
Yy0xMDQzMWFkNC1zcGtpZDAtbDJ1MC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU3LWIyLWRz
cDEtbWlzYy0xMDQzMWFkNC1zcGtpZDAtbDJ1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU3
LWIyLWRzcDEtbWlzYy0xMDQzMWFkNC1zcGtpZDEud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2
NC43LjUud21mdworIyArRmlsZTogY2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTEwNDMxYWQ0
LXNwa2lkMS1sMnUwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNTctYjItZHNwMS1taXNjLTEw
NDMxYWQ0LXNwa2lkMS1sMnUxLmJpbgorIyAgTGluazogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1t
aXNjLTEwNDMxYjEzLXNwa2lkMC53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9SZXYzLjExLjE2Lndt
ZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMWIxMy1zcGtpZDAt
YW1wMS5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xMDQzMWIxMy1z
cGtpZDAtYW1wMi5iaW4KKyMgQEAgLTk5MDQsNiArMTAyNTUsMjQgQEAKKyMgIExpbms6IGNpcnJ1
cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xN2FhMjM1ZC53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9S
ZXY0LjcuMi53bWZ3CisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTdhYTIz
NWQtbDJ1MC5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xN2FhMjM1
ZC1sMnU0LmJpbgorIyArTGluazogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTE3YWEyMzY5
LndtZncgLT4gY3MzNWw2My9DUzM1TDYzX1JldjIuNi42LndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9j
czM1bDYzLWExLWRzcDEtbWlzYy0xN2FhMjM2OS1sMnUwLmJpbgorIyArRmlsZTogY2lycnVzL2Nz
MzVsNjMtYTEtZHNwMS1taXNjLTE3YWEyMzY5LWwydTEuYmluCisjICtMaW5rOiBjaXJydXMvY3Mz
NWw2My1hMS1kc3AxLW1pc2MtMTdhYTIzNmEud21mdyAtPiBjczM1bDYzL0NTMzVMNjNfUmV2Mi42
LjYud21mdworIyArRmlsZTogY2lycnVzL2NzMzVsNjMtYTEtZHNwMS1taXNjLTE3YWEyMzZhLWwy
dTAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw2My1hMS1kc3AxLW1pc2MtMTdhYTIzNmEtbDJ1
MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xN2FhMjM2Yi1zcGtp
ZDAud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2NC43LjEwLndtZncKKyMgK0ZpbGU6IGNpcnJ1
cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xN2FhMjM2Yi1zcGtpZDAtbDF1MC5iaW4KKyMgK0ZpbGU6
IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xN2FhMjM2Yi1zcGtpZDAtbDF1MS5iaW4KKyMg
K0xpbms6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xN2FhMjM2Yi1zcGtpZDEud21mdyAt
PiBjczM1bDU2L0NTMzVMNTZfUmV2NC43LjEwLndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU3
LWIyLWRzcDEtbWlzYy0xN2FhMjM2Yi1zcGtpZDEtbDF1MC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9j
czM1bDU3LWIyLWRzcDEtbWlzYy0xN2FhMjM2Yi1zcGtpZDEtbDF1MS5iaW4KKyMgK0xpbms6IGNp
cnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xN2FhMjM2Yy1zcGtpZDAud21mdyAtPiBjczM1bDU2
L0NTMzVMNTZfUmV2NC43LjEwLndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEt
bWlzYy0xN2FhMjM2Yy1zcGtpZDAtbDF1MC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU3LWIy
LWRzcDEtbWlzYy0xN2FhMjM2Yy1zcGtpZDAtbDF1MS5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1
bDU3LWIyLWRzcDEtbWlzYy0xN2FhMjM2Yy1zcGtpZDEud21mdyAtPiBjczM1bDU2L0NTMzVMNTZf
UmV2NC43LjEwLndtZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xN2Fh
MjM2Yy1zcGtpZDEtbDF1MC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlz
Yy0xN2FhMjM2Yy1zcGtpZDEtbDF1MS5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRz
cDEtbWlzYy0xN2FhMzgwNi1zcGtpZDAud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMy4z
LndtZncKKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzgwNi1zcGtp
ZDAtbDB1MC5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2FhMzgw
Ni1zcGtpZDAtbDB1MS5iaW4KKyMgQEAgLTk5MzIsNiArMTAzMDEsMTIgQEAKKyMgIExpbms6IGNp
cnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xN2FhMzgyMS1zcGtpZDEud21mdyAtPiBjczM1bDU2
L0NTMzVMNTZfUmV2NC41LjMud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVsNTctYjItZHNwMS1t
aXNjLTE3YWEzODIxLXNwa2lkMS1hbXBsLmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNTctYjIt
ZHNwMS1taXNjLTE3YWEzODIxLXNwa2lkMS1hbXByLmJpbgorIyArTGluazogY2lycnVzL2NzMzVs
NTctYjItZHNwMS1taXNjLTE3YWEzODI0LXNwa2lkMC53bWZ3IC0+IGNzMzVsNTYvQ1MzNUw1Nl9S
ZXY0LjcuOS53bWZ3CisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2MtMTdhYTM4
MjQtc3BraWQwLWwwdTAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3AxLW1pc2Mt
MTdhYTM4MjQtc3BraWQwLWwwdTEuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ny1iMi1kc3Ax
LW1pc2MtMTdhYTM4MjQtc3BraWQxLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2X1JldjQuNy45Lndt
ZncKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xN2FhMzgyNC1zcGtpZDEt
bDB1MC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDU3LWIyLWRzcDEtbWlzYy0xN2FhMzgyNC1z
cGtpZDEtbDB1MS5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDU2LWIwLWRzcDEtbWlzYy0xN2Fh
MzgzMi1zcGtpZDAud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4yNi53bWZ3CisjICBG
aWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM4MzItc3BraWQwLWFtcGwuYmlu
CisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM4MzItc3BraWQwLWFt
cHIuYmluCisjIEBAIC05OTc5LDYgKzEwMzU0LDkgQEAKKyMgIExpbms6IGNpcnJ1cy9jczM1bDU2
LWIwLWRzcDEtbWlzYy0xN2FhMzkxZS1zcGtpZDAud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2
My4xMS4yMS53bWZ3CisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5
MWUtc3BraWQwLWFtcDEuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2Mt
MTdhYTM5MWUtc3BraWQwLWFtcDIuYmluCisjICtMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3Ax
LW1pc2MtMTdhYTM5MWUud21mdyAtPiBjczM1bDU2L0NTMzVMNTZfUmV2My4xMS4yMS53bWZ3Cisj
ICtMaW5rOiBjaXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MWUtYW1wMS5iaW4gLT4g
Y3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MWUtc3BraWQwLWFtcDEuYmluCisjICtMaW5rOiBj
aXJydXMvY3MzNWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MWUtYW1wMi5iaW4gLT4gY3MzNWw1Ni1i
MC1kc3AxLW1pc2MtMTdhYTM5MWUtc3BraWQwLWFtcDIuYmluCisjICBMaW5rOiBjaXJydXMvY3Mz
NWw1Ni1iMC1kc3AxLW1pc2MtMTdhYTM5MjEtc3BraWQxLndtZncgLT4gY3MzNWw1Ni9DUzM1TDU2
X1JldjMuMTEuMjEud21mdworIyAgRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1taXNjLTE3
YWEzOTIxLXNwa2lkMS1hbXAxLmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNTYtYjAtZHNwMS1t
aXNjLTE3YWEzOTIxLXNwa2lkMS1hbXAyLmJpbgorIyBAQCAtMTAyNDgsNTYgKzEwNjI2LDEwMSBA
QAorIyAgTGluazogc2RjYS8xZmEvMTAyOC9lZmMvNC5iaW4gLT4gLi4vLi4vY3M0Mmw0NV9wcmlt
ZXI0LmJpbgorIyAgTGluazogc2RjYS8xZmEvMTAyOC9lZmMvNDI0NTAwMDUuYmluIC0+IC4uL2Nz
NDJsNDVfdjIwMjYwNjE1LmJpbgorIyAgCisjIC1GaWxlOiBzZGNhLzFmYS8xMDI4L2NzNDJsNDVf
djIwMjYwOTE3LmJpbgorIyArRmlsZTogc2RjYS8xZmEvMTAyOC9jczQybDQ5X3YyMDI2MTEwNC5i
aW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjAxLzEuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJp
bWVyMS5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjAxLzIuYmluIC0+IC4uLy4uL2NzNDJs
NDVfcHJpbWVyMi5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjAxLzMuYmluIC0+IC4uLy4u
L2NzNDJsNDVfcHJpbWVyMy5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjAxLzQuYmluIC0+
IC4uLy4uL2NzNDJsNDVfcHJpbWVyNC5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjAxLzQy
NDUwMDA1LmJpbiAtPiAuLi9jczQybDQ5X3YyMDI2MTEwNC5iaW4KKyMgK0xpbms6IHNkY2EvMWZh
LzEwMjgvZjA0LzEuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMS5iaW4KKyMgK0xpbms6IHNk
Y2EvMWZhLzEwMjgvZjA0LzIuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMi5iaW4KKyMgK0xp
bms6IHNkY2EvMWZhLzEwMjgvZjA0LzMuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMy5iaW4K
KyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjA0LzQuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVy
NC5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjA0LzQyNDUwMDA1LmJpbiAtPiAuLi9jczQy
bDQ5X3YyMDI2MTEwNC5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjA1LzEuYmluIC0+IC4u
Ly4uL2NzNDJsNDVfcHJpbWVyMS5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjA1LzIuYmlu
IC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMi5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjA1
LzMuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMy5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEw
MjgvZjA1LzQuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyNC5iaW4KKyMgK0xpbms6IHNkY2Ev
MWZhLzEwMjgvZjA1LzQyNDUwMDA1LmJpbiAtPiAuLi9jczQybDQ5X3YyMDI2MTEwNC5iaW4KKyMg
KworIyArRmlsZTogc2RjYS8xZmEvMTAyOC9jczQybDQ1X3YyMDI2MTAyMi5iaW4KKyMgK0xpbms6
IHNkY2EvMWZhLzEwMjgvZWYxLzEuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMS5iaW4KKyMg
K0xpbms6IHNkY2EvMWZhLzEwMjgvZWYxLzIuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMi5i
aW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZWYxLzMuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJp
bWVyMy5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZWYxLzQuYmluIC0+IC4uLy4uL2NzNDJs
NDVfcHJpbWVyNC5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZWYxLzQyNDUwMDA1LmJpbiAt
PiAuLi9jczQybDQ1X3YyMDI2MTAyMi5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZWYyLzEu
YmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMS5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgv
ZWYyLzIuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMi5iaW4KKyMgK0xpbms6IHNkY2EvMWZh
LzEwMjgvZWYyLzMuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMy5iaW4KKyMgK0xpbms6IHNk
Y2EvMWZhLzEwMjgvZWYyLzQuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyNC5iaW4KKyMgK0xp
bms6IHNkY2EvMWZhLzEwMjgvZWYyLzQyNDUwMDA1LmJpbiAtPiAuLi9jczQybDQ1X3YyMDI2MTAy
Mi5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZWYzLzEuYmluIC0+IC4uLy4uL2NzNDJsNDVf
cHJpbWVyMS5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZWYzLzIuYmluIC0+IC4uLy4uL2Nz
NDJsNDVfcHJpbWVyMi5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZWYzLzMuYmluIC0+IC4u
Ly4uL2NzNDJsNDVfcHJpbWVyMy5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZWYzLzQuYmlu
IC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyNC5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZWYz
LzQyNDUwMDA1LmJpbiAtPiAuLi9jczQybDQ1X3YyMDI2MTAyMi5iaW4KKyMgK0xpbms6IHNkY2Ev
MWZhLzEwMjgvZWY0LzEuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMS5iaW4KKyMgK0xpbms6
IHNkY2EvMWZhLzEwMjgvZWY0LzIuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMi5iaW4KKyMg
K0xpbms6IHNkY2EvMWZhLzEwMjgvZWY0LzMuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMy5i
aW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZWY0LzQuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJp
bWVyNC5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZWY0LzQyNDUwMDA1LmJpbiAtPiAuLi9j
czQybDQ1X3YyMDI2MTAyMi5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjEyLzEuYmluIC0+
IC4uLy4uL2NzNDJsNDVfcHJpbWVyMS5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjEyLzIu
YmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMi5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgv
ZjEyLzMuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMy5iaW4KKyMgK0xpbms6IHNkY2EvMWZh
LzEwMjgvZjEyLzQuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyNC5iaW4KKyMgK0xpbms6IHNk
Y2EvMWZhLzEwMjgvZjEyLzQyNDUwMDA1LmJpbiAtPiAuLi9jczQybDQ1X3YyMDI2MTAyMi5iaW4K
KyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjEzLzEuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVy
MS5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjEzLzIuYmluIC0+IC4uLy4uL2NzNDJsNDVf
cHJpbWVyMi5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjEzLzMuYmluIC0+IC4uLy4uL2Nz
NDJsNDVfcHJpbWVyMy5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjEzLzQuYmluIC0+IC4u
Ly4uL2NzNDJsNDVfcHJpbWVyNC5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjEzLzQyNDUw
MDA1LmJpbiAtPiAuLi9jczQybDQ1X3YyMDI2MTAyMi5iaW4KKyMgKworIyArRmlsZTogc2RjYS8x
ZmEvMTAyOC9jczQybDQ1X3YyMDI2MTAzMC5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZWRj
LzEuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMS5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEw
MjgvZWRjLzIuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMi5iaW4KKyMgK0xpbms6IHNkY2Ev
MWZhLzEwMjgvZWRjLzMuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMy5iaW4KKyMgK0xpbms6
IHNkY2EvMWZhLzEwMjgvZWRjLzQuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyNC5iaW4KKyMg
K0xpbms6IHNkY2EvMWZhLzEwMjgvZWRjLzQyNDUwMDA1LmJpbiAtPiAuLi9jczQybDQ1X3YyMDI2
MTAzMC5iaW4KKyMgIExpbms6IHNkY2EvMWZhLzEwMjgvZWVjLzEuYmluIC0+IC4uLy4uL2NzNDJs
NDVfcHJpbWVyMS5iaW4KKyMgIExpbms6IHNkY2EvMWZhLzEwMjgvZWVjLzIuYmluIC0+IC4uLy4u
L2NzNDJsNDVfcHJpbWVyMi5iaW4KKyMgIExpbms6IHNkY2EvMWZhLzEwMjgvZWVjLzMuYmluIC0+
IC4uLy4uL2NzNDJsNDVfcHJpbWVyMy5iaW4KKyMgIExpbms6IHNkY2EvMWZhLzEwMjgvZWVjLzQu
YmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyNC5iaW4KKyMgLUxpbms6IHNkY2EvMWZhLzEwMjgv
ZWVjLzQyNDUwMDA1LmJpbiAtPiAuLi9jczQybDQ1X3YyMDI2MDkxNy5iaW4KKyMgK0xpbms6IHNk
Y2EvMWZhLzEwMjgvZWVjLzQyNDUwMDA1LmJpbiAtPiAuLi9jczQybDQ1X3YyMDI2MTAzMC5iaW4K
KyMgIExpbms6IHNkY2EvMWZhLzEwMjgvZWVkLzEuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVy
MS5iaW4KKyMgIExpbms6IHNkY2EvMWZhLzEwMjgvZWVkLzIuYmluIC0+IC4uLy4uL2NzNDJsNDVf
cHJpbWVyMi5iaW4KKyMgIExpbms6IHNkY2EvMWZhLzEwMjgvZWVkLzMuYmluIC0+IC4uLy4uL2Nz
NDJsNDVfcHJpbWVyMy5iaW4KKyMgIExpbms6IHNkY2EvMWZhLzEwMjgvZWVkLzQuYmluIC0+IC4u
Ly4uL2NzNDJsNDVfcHJpbWVyNC5iaW4KKyMgLUxpbms6IHNkY2EvMWZhLzEwMjgvZWVkLzQyNDUw
MDA1LmJpbiAtPiAuLi9jczQybDQ1X3YyMDI2MDkxNy5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEw
MjgvZWVkLzQyNDUwMDA1LmJpbiAtPiAuLi9jczQybDQ1X3YyMDI2MTAzMC5iaW4KKyMgIExpbms6
IHNkY2EvMWZhLzEwMjgvZWVlLzEuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMS5iaW4KKyMg
IExpbms6IHNkY2EvMWZhLzEwMjgvZWVlLzIuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMi5i
aW4KKyMgIExpbms6IHNkY2EvMWZhLzEwMjgvZWVlLzMuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJp
bWVyMy5iaW4KKyMgIExpbms6IHNkY2EvMWZhLzEwMjgvZWVlLzQuYmluIC0+IC4uLy4uL2NzNDJs
NDVfcHJpbWVyNC5iaW4KKyMgLUxpbms6IHNkY2EvMWZhLzEwMjgvZWVlLzQyNDUwMDA1LmJpbiAt
PiAuLi9jczQybDQ1X3YyMDI2MDkxNy5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZWVlLzQy
NDUwMDA1LmJpbiAtPiAuLi9jczQybDQ1X3YyMDI2MTAzMC5iaW4KKyMgIExpbms6IHNkY2EvMWZh
LzEwMjgvZWVmLzEuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMS5iaW4KKyMgIExpbms6IHNk
Y2EvMWZhLzEwMjgvZWVmLzIuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMi5iaW4KKyMgIExp
bms6IHNkY2EvMWZhLzEwMjgvZWVmLzMuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMy5iaW4K
KyMgIExpbms6IHNkY2EvMWZhLzEwMjgvZWVmLzQuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVy
NC5iaW4KKyMgLUxpbms6IHNkY2EvMWZhLzEwMjgvZWVmLzQyNDUwMDA1LmJpbiAtPiAuLi9jczQy
bDQ1X3YyMDI2MDkxNy5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZWVmLzQyNDUwMDA1LmJp
biAtPiAuLi9jczQybDQ1X3YyMDI2MTAzMC5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjAy
LzEuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMS5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEw
MjgvZjAyLzIuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMi5iaW4KKyMgK0xpbms6IHNkY2Ev
MWZhLzEwMjgvZjAyLzMuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMy5iaW4KKyMgK0xpbms6
IHNkY2EvMWZhLzEwMjgvZjAyLzQuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyNC5iaW4KKyMg
K0xpbms6IHNkY2EvMWZhLzEwMjgvZjAyLzQyNDUwMDA1LmJpbiAtPiAuLi9jczQybDQ1X3YyMDI2
MTAzMC5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjAzLzEuYmluIC0+IC4uLy4uL2NzNDJs
NDVfcHJpbWVyMS5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjAzLzIuYmluIC0+IC4uLy4u
L2NzNDJsNDVfcHJpbWVyMi5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjAzLzMuYmluIC0+
IC4uLy4uL2NzNDJsNDVfcHJpbWVyMy5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjAzLzQu
YmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyNC5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgv
ZjAzLzQyNDUwMDA1LmJpbiAtPiAuLi9jczQybDQ1X3YyMDI2MTAzMC5iaW4KKyMgIExpbms6IHNk
Y2EvMWZhLzEwMjgvZjA3LzEuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMS5iaW4KKyMgIExp
bms6IHNkY2EvMWZhLzEwMjgvZjA3LzIuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMi5iaW4K
KyMgIExpbms6IHNkY2EvMWZhLzEwMjgvZjA3LzMuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVy
My5iaW4KKyMgIExpbms6IHNkY2EvMWZhLzEwMjgvZjA3LzQuYmluIC0+IC4uLy4uL2NzNDJsNDVf
cHJpbWVyNC5iaW4KKyMgLUxpbms6IHNkY2EvMWZhLzEwMjgvZjA3LzQyNDUwMDA1LmJpbiAtPiAu
Li9jczQybDQ1X3YyMDI2MDkxNy5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzEwMjgvZjA3LzQyNDUw
MDA1LmJpbiAtPiAuLi9jczQybDQ1X3YyMDI2MTAzMC5iaW4KKyMgIExpbms6IHNkY2EvMWZhLzEw
MjgvZjA4LzEuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMS5iaW4KKyMgIExpbms6IHNkY2Ev
MWZhLzEwMjgvZjA4LzIuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMi5iaW4KKyMgIExpbms6
IHNkY2EvMWZhLzEwMjgvZjA4LzMuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMy5iaW4KKyMg
IExpbms6IHNkY2EvMWZhLzEwMjgvZjA4LzQuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyNC5i
aW4KKyMgLUxpbms6IHNkY2EvMWZhLzEwMjgvZjA4LzQyNDUwMDA1LmJpbiAtPiAuLi9jczQybDQ1
X3YyMDI2MDkxNy5iaW4KKyMgLQorIyAtRmlsZTogc2RjYS8xZmEvMTAyOC9jczQybDQ1X3YyMDI2
MDkzMC5iaW4KKyMgLUxpbms6IHNkY2EvMWZhLzEwMjgvZWRjLzEuYmluIC0+IC4uLy4uL2NzNDJs
NDVfcHJpbWVyMS5iaW4KKyMgLUxpbms6IHNkY2EvMWZhLzEwMjgvZWRjLzIuYmluIC0+IC4uLy4u
L2NzNDJsNDVfcHJpbWVyMi5iaW4KKyMgLUxpbms6IHNkY2EvMWZhLzEwMjgvZWRjLzMuYmluIC0+
IC4uLy4uL2NzNDJsNDVfcHJpbWVyMy5iaW4KKyMgLUxpbms6IHNkY2EvMWZhLzEwMjgvZWRjLzQu
YmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyNC5iaW4KKyMgLUxpbms6IHNkY2EvMWZhLzEwMjgv
ZWRjLzQyNDUwMDA1LmJpbiAtPiAuLi9jczQybDQ1X3YyMDI2MDkzMC5iaW4KKyMgLQorIyAtRmls
ZTogc2RjYS8xZmEvMTAyOC9jczQybDQ5X3YyMDI2MDkyMS5iaW4KKyMgLUxpbms6IHNkY2EvMWZh
LzEwMjgvZjAxLzEuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMS5iaW4KKyMgLUxpbms6IHNk
Y2EvMWZhLzEwMjgvZjAxLzIuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMi5iaW4KKyMgLUxp
bms6IHNkY2EvMWZhLzEwMjgvZjAxLzMuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMy5iaW4K
KyMgLUxpbms6IHNkY2EvMWZhLzEwMjgvZjAxLzQuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVy
NC5iaW4KKyMgLUxpbms6IHNkY2EvMWZhLzEwMjgvZjAxLzQyNDUwMDA1LmJpbiAtPiAuLi9jczQy
bDQ5X3YyMDI2MDkyMS5iaW4KKyMgLUxpbms6IHNkY2EvMWZhLzEwMjgvZjA0LzEuYmluIC0+IC4u
Ly4uL2NzNDJsNDVfcHJpbWVyMS5iaW4KKyMgLUxpbms6IHNkY2EvMWZhLzEwMjgvZjA0LzIuYmlu
IC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMi5iaW4KKyMgLUxpbms6IHNkY2EvMWZhLzEwMjgvZjA0
LzMuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMy5iaW4KKyMgLUxpbms6IHNkY2EvMWZhLzEw
MjgvZjA0LzQuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyNC5iaW4KKyMgLUxpbms6IHNkY2Ev
MWZhLzEwMjgvZjA0LzQyNDUwMDA1LmJpbiAtPiAuLi9jczQybDQ5X3YyMDI2MDkyMS5iaW4KKyMg
K0xpbms6IHNkY2EvMWZhLzEwMjgvZjA4LzQyNDUwMDA1LmJpbiAtPiAuLi9jczQybDQ1X3YyMDI2
MTAzMC5iaW4KKyMgIAorIyAgRmlsZTogc2RjYS8xZmEvMTdhYS9jczQybDQ1X3YyMDI2MDUyMi5i
aW4KKyMgIExpbms6IHNkY2EvMWZhLzE3YWEvMjM1Mi8xLmJpbiAtPiAuLi8uLi9jczQybDQ1X3By
aW1lcjEuYmluCisjIEBAIC0xMDMyMSw2ICsxMDc0NCwzMCBAQAorIyAgTGluazogc2RjYS8xZmEv
MTdhYS81MTU5LzQuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyNC5iaW4KKyMgIExpbms6IHNk
Y2EvMWZhLzE3YWEvNTE1OS80MjQ1MDAwNS5iaW4gLT4gLi4vY3M0Mmw0NV92MjAyNjA1MjIuYmlu
CisjICAKKyMgK0ZpbGU6IHNkY2EvMWZhLzE3YWEvY3M0Mmw0NV92MjAyNjEwMDcuYmluCisjICtM
aW5rOiBzZGNhLzFmYS8xN2FhLzIzNjkvMS5iaW4gLT4gLi4vLi4vY3M0Mmw0NV9wcmltZXIxLmJp
bgorIyArTGluazogc2RjYS8xZmEvMTdhYS8yMzY5LzIuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJp
bWVyMi5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzE3YWEvMjM2OS8zLmJpbiAtPiAuLi8uLi9jczQy
bDQ1X3ByaW1lcjMuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xN2FhLzIzNjkvNC5iaW4gLT4gLi4v
Li4vY3M0Mmw0NV9wcmltZXI0LmJpbgorIyArTGluazogc2RjYS8xZmEvMTdhYS8yMzY5LzQyNDUw
MDA1LmJpbiAtPiAuLi9jczQybDQ1X3YyMDI2MTAwNy5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzE3
YWEvMjM2YS8xLmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjEuYmluCisjICtMaW5rOiBzZGNh
LzFmYS8xN2FhLzIzNmEvMi5iaW4gLT4gLi4vLi4vY3M0Mmw0NV9wcmltZXIyLmJpbgorIyArTGlu
azogc2RjYS8xZmEvMTdhYS8yMzZhLzMuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyMy5iaW4K
KyMgK0xpbms6IHNkY2EvMWZhLzE3YWEvMjM2YS80LmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1l
cjQuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xN2FhLzIzNmEvNDI0NTAwMDUuYmluIC0+IC4uL2Nz
NDJsNDVfdjIwMjYxMDA3LmJpbgorIyArCisjICtGaWxlOiBzZGNhLzFmYS8xN2FhL2NzNDJsNDVf
djIwMjYxMTA2LmJpbgorIyArTGluazogc2RjYS8xZmEvMTdhYS8yMzZiLzEuYmluIC0+IC4uLy4u
L2NzNDJsNDVfcHJpbWVyMS5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzE3YWEvMjM2Yi8yLmJpbiAt
PiAuLi8uLi9jczQybDQ1X3ByaW1lcjIuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xN2FhLzIzNmIv
My5iaW4gLT4gLi4vLi4vY3M0Mmw0NV9wcmltZXIzLmJpbgorIyArTGluazogc2RjYS8xZmEvMTdh
YS8yMzZiLzQuYmluIC0+IC4uLy4uL2NzNDJsNDVfcHJpbWVyNC5iaW4KKyMgK0xpbms6IHNkY2Ev
MWZhLzE3YWEvMjM2Yi80MjQ1MDAwNS5iaW4gLT4gLi4vY3M0Mmw0NV92MjAyNjExMDYuYmluCisj
ICtMaW5rOiBzZGNhLzFmYS8xN2FhLzIzNmMvMS5iaW4gLT4gLi4vLi4vY3M0Mmw0NV9wcmltZXIx
LmJpbgorIyArTGluazogc2RjYS8xZmEvMTdhYS8yMzZjLzIuYmluIC0+IC4uLy4uL2NzNDJsNDVf
cHJpbWVyMi5iaW4KKyMgK0xpbms6IHNkY2EvMWZhLzE3YWEvMjM2Yy8zLmJpbiAtPiAuLi8uLi9j
czQybDQ1X3ByaW1lcjMuYmluCisjICtMaW5rOiBzZGNhLzFmYS8xN2FhLzIzNmMvNC5iaW4gLT4g
Li4vLi4vY3M0Mmw0NV9wcmltZXI0LmJpbgorIyArTGluazogc2RjYS8xZmEvMTdhYS8yMzZjLzQy
NDUwMDA1LmJpbiAtPiAuLi9jczQybDQ1X3YyMDI2MTEwNi5iaW4KKyMgKworIyAgRmlsZTogc2Rj
YS8xZmEvMTQ0ZC9jczQybDQ1X3YyMDI2MDgyMC5iaW4KKyMgIExpbms6IHNkY2EvMWZhLzE0NGQv
YzFkYy8xLmJpbiAtPiAuLi8uLi9jczQybDQ1X3ByaW1lcjEuYmluCisjICBMaW5rOiBzZGNhLzFm
YS8xNDRkL2MxZGMvMi5iaW4gLT4gLi4vLi4vY3M0Mmw0NV9wcmltZXIyLmJpbgorIyBAQCAtMTAz
OTUsMTEgKzEwODQyLDE2IEBACisjICAKKyMgIEZpbGU6IG54cC9zZF93NjF4X3YxLmJpbi5zZQor
IyAgVmVyc2lvbjogMTguOTkuMy5wMjYuNworIyArT3JpZ2luYXRlcyBmcm9tCisjICtodHRwczov
L2dpdGh1Yi5jb20vbnhwLWlteC9pbXgtZmlybXdhcmUvdHJlZS9sZi02LjEyLjM0XzIuMS4wCisj
ICsKKyMgK0ZpbGU6IG54cC9zZF9pdzYxMC5iaW4uc2UKKyMgK1ZlcnNpb246IDE4Ljk5LjgucDEz
NgorIyArT3JpZ2luYXRlcyBmcm9tCisjICtodHRwczovL2dpdGh1Yi5jb20vbnhwLWlteC9pbXgt
ZmlybXdhcmUvdHJlZS9sZi02LjE4LjM3XzIuMS4wCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJp
YnV0YWJsZS4gU2VlIExJQ0VOU0UubnhwIGZvciBkZXRhaWxzCisjICBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLm54cAorIyAtCisjIC1PcmlnaW5hdGVzIGZyb20g
aHR0cHM6Ly9naXRodWIuY29tL254cC1pbXgvaW14LWZpcm13YXJlL3RyZWUvbGYtNi4xMi4zNF8y
LjEuMAorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIEBAIC0xMDQ1Nyw4ICsxMDkw
OSwxOSBAQAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyAgRHJpdmVyOiBRdWFsY29tbSBB
U29DIHRwbGcgRmlybXdhcmUKKyMgK0ZpbGU6IHFjb20vZWxpemEvZWxpemEtY3FzLWV2ay10cGxn
LmJpbgorIyAgRmlsZTogcWNvbS9nbHltdXIvR0xZTVVSLUNSRC10cGxnLmJpbgorIyArRmlsZTog
cWNvbS9nbHltdXIvQVNVU1RlSy9VWDM0MDdOQS9HTFlNVVItQVNVUy1aZW5ib29rLUExNC1VWDM0
MDdOQS10cGxnLmJpbgorIyArTGluazogcWNvbS9nbHltdXIvR0xZTVVSLUFTVVMtWmVuYm9vay1B
MTQtVVgzNDA3TkEtdHBsZy5iaW4gLT4gQVNVU1RlSy9VWDM0MDdOQS9HTFlNVVItQVNVUy1aZW5i
b29rLUExNC1VWDM0MDdOQS10cGxnLmJpbgorIyArRmlsZTogcWNvbS9nbHltdXIvQVNVU1RlSy9V
WDM2MDdPQS9HTFlNVVItQVNVUy1aZW5ib29rLUExNi1VWDM2MDdPQS10cGxnLmJpbgorIyArTGlu
azogcWNvbS9nbHltdXIvR0xZTVVSLUFTVVMtWmVuYm9vay1BMTYtVVgzNjA3T0EtdHBsZy5iaW4g
LT4gQVNVU1RlSy9VWDM2MDdPQS9HTFlNVVItQVNVUy1aZW5ib29rLUExNi1VWDM2MDdPQS10cGxn
LmJpbgorIyArRmlsZTogcWNvbS9nbHltdXIvTEVOT1ZPLzIyQTgvTGVub3ZvLVRoaW5rUGFkLVQx
NHMtR2VuLTctdHBsZy5iaW4KKyMgK0xpbms6IHFjb20vZ2x5bXVyL0xlbm92by1UaGlua1BhZC1U
MTRzLUdlbi03LXRwbGcuYmluIC0+IExFTk9WTy8yMkE4L0xlbm92by1UaGlua1BhZC1UMTRzLUdl
bi03LXRwbGcuYmluCisjICtGaWxlOiBxY29tL2hhd2kvSEFXSS1NVFAtdHBsZy5iaW4KKyMgIEZp
bGU6IHFjb20va2FhbmFwYWxpL0thYW5hcGFsaS1NVFAtdHBsZy5iaW4KKyMgK0ZpbGU6IHFjb20v
bWFpbGkvTUFJTEktTVRQLXRwbGcuYmluCisjICtGaWxlOiBxY29tL25vcmQvTk9SRC1SSURFLXRw
bGcuYmluCisjICtGaWxlOiBxY29tL25vcmQvTk9SRC1SUkQtdHBsZy5iaW4KKyMgIEZpbGU6IHFj
b20vcWNtNjQ5MC9RQ002NDkwLUlEUC10cGxnLmJpbgorIyAgRmlsZTogcWNvbS9xY3M2MTUvVEFM
T1MtRVZLLXRwbGcuYmluCisjICBGaWxlOiBxY29tL3FjczY0OTAvcmFkeGEvZHJhZ29uLXE2YS9R
Q1M2NDkwLVJhZHhhLURyYWdvbi1RNkEtdHBsZy5iaW4KKyMgQEAgLTEwNDczLDYgKzEwOTM2LDkg
QEAKKyMgIEZpbGU6IHFjb20vc2E4Nzc1cC9MRU1BTlMtRVZLLXRwbGcuYmluCisjICBGaWxlOiBx
Y29tL3NjODI4MHhwL0xFTk9WTy8yMUJYL2F1ZGlvcmVhY2gtdHBsZy5iaW4KKyMgIExpbms6IHFj
b20vc2M4MjgweHAvU0M4MjgwWFAtTEVOT1ZPLVgxM1MtdHBsZy5iaW4gLT4gTEVOT1ZPLzIxQlgv
YXVkaW9yZWFjaC10cGxnLmJpbgorIyArRmlsZTogcWNvbS9zYzgyODB4cC9yYWR4YS9kcmFnb24t
cThiL1NDODI4MFhQLVJhZHhhLURyYWdvbi1ROEItdHBsZy5iaW4KKyMgK0ZpbGU6IHFjb20vc2hp
a3JhL3NoaWtyYS1jcXMtZXZrLXRwbGcuYmluCisjICtGaWxlOiBxY29tL3NoaWtyYS9zaGlrcmEt
aXFzLWV2ay10cGxnLmJpbgorIyAgRmlsZTogcWNvbS9zbTg0NTAvU004NDUwLUhESy10cGxnLmJp
bgorIyAgRmlsZTogcWNvbS9zbTg1NTAvU004NTUwLUhESy10cGxnLmJpbgorIyAgRmlsZTogcWNv
bS9zbTg1NTAvU004NTUwLVFSRC10cGxnLmJpbgorIyBAQCAtMTA0ODYsNiArMTA5NTIsOCBAQAor
IyAgTGluazogcWNvbS94MWU4MDEwMC9YMUU4MDEwMC1MRU5PVk8tVGhpbmtwYWQtVDE0cy10cGxn
LmJpbiAtPiBMRU5PVk8vMjFOMS9YMUU4MDEwMC1MRU5PVk8tVGhpbmtwYWQtVDE0cy10cGxnLmJp
bgorIyAgRmlsZTogcWNvbS94MWU4MDEwMC9MRU5PVk8vODNFRC9YMUU4MDEwMC1MRU5PVk8tWW9n
YS1TbGltN3gtdHBsZy5iaW4KKyMgIExpbms6IHFjb20veDFlODAxMDAvWDFFODAxMDAtTEVOT1ZP
LVlvZ2EtU2xpbTd4LXRwbGcuYmluIC0+IExFTk9WTy84M0VEL1gxRTgwMTAwLUxFTk9WTy1Zb2dh
LVNsaW03eC10cGxnLmJpbgorIyArRmlsZTogcWNvbS94MWU4MDEwMC9MRU5PVk8vOTFCNi9YMUU4
MDEwMC1MRU5PVk8tSWRlYUNlbnRyZS1NaW5pLXRwbGcuYmluCisjICtMaW5rOiBxY29tL3gxZTgw
MTAwL1gxRTgwMTAwLUxFTk9WTy1JZGVhQ2VudHJlLU1pbmktdHBsZy5iaW4gLT4gTEVOT1ZPLzkx
QjYvWDFFODAxMDAtTEVOT1ZPLUlkZWFDZW50cmUtTWluaS10cGxnLmJpbgorIyAgRmlsZTogcWNv
bS94MWU4MDEwMC9YMUU4MDEwMC1FVkstdHBsZy5iaW4KKyMgIEZpbGU6IHFjb20veDFlODAxMDAv
QVNVU1RlSy92aXZvYm9vay0xNi9YMUU4MDEwMC1BU1VTLVZpdm9ib29rLTE2LXRwbGcuYmluCisj
ICBMaW5rOiBxY29tL3gxZTgwMTAwL1gxRTgwMTAwLUFTVVMtVml2b2Jvb2stMTYtdHBsZy5iaW4g
LT4gQVNVU1RlSy92aXZvYm9vay0xNi9YMUU4MDEwMC1BU1VTLVZpdm9ib29rLTE2LXRwbGcuYmlu
CisjIEBAIC0xMDQ5NCw3ICsxMDk2MiwxMCBAQAorIyAgRmlsZTogcWNvbS94MWU4MDEwMC9BU1VT
VGVLL3plbmJvb2stYTE0L1gxRTgwMTAwLUFTVVMtWmVuYm9vay1BMTQtdHBsZy5iaW4KKyMgIExp
bms6IHFjb20veDFlODAxMDAvWDFFODAxMDAtQVNVUy1aZW5ib29rLUExNC10cGxnLmJpbiAtPiBB
U1VTVGVLL3plbmJvb2stYTE0L1gxRTgwMTAwLUFTVVMtWmVuYm9vay1BMTQtdHBsZy5iaW4KKyMg
IEZpbGU6IHFjb20veDFlODAxMDAvWDFFMDAxREUtREVWS0lULXRwbGcuYmluCisjICtGaWxlOiBx
Y29tL3gxZTgwMTAwL1gxRTgwMTAwLUFDRVItU1dJRlQtMTQtdHBsZy5iaW4KKyMgIEZpbGU6IHFj
b20veDFlODAxMDAvWDFFODAxMDAtQ1JELXRwbGcuYmluCisjICtGaWxlOiBxY29tL3gxZTgwMTAw
L1gxRTgwMTAwLU1FRElPTi1TUFJDSFJHRC0xNC1TMS10cGxnLmJpbgorIyArRmlsZTogcWNvbS94
MWU4MDEwMC9YMUU4MDEwMC1NaWNyb3NvZnQtU3VyZmFjZS1Qcm8tMTEtdHBsZy5iaW4KKyMgIEZp
bGU6IHFjb20veDFlODAxMDAvWDFFODAxMDAtUm9tdWx1cy10cGxnLmJpbgorIyAgRmlsZTogcWNv
bS94MWU4MDEwMC9YMUU4MDEwMC1UVVhFRE8tRWxpdGUtMTQtdHBsZy5iaW4KKyMgIEZpbGU6IHFj
b20veDFlODAxMDAvZGVsbC9pbnNwaXJvbi0xNC1wbHVzLTc0NDEvWDFFODAxMDAtRGVsbC1JbnNw
aXJvbi0xNHAtNzQ0MS10cGxnLmJpbgorIyBAQCAtMTA1MDcsOCArMTA5NzgsOCBAQAorIyAgTGlu
azogcWNvbS94MWU4MDEwMC9YMUU4MDEwMC1IUC1PTU5JQk9PSy1YMTQtdHBsZy5iaW4gLT4gaHAv
b21uaWJvb2steDE0L1gxRTgwMTAwLUhQLU9NTklCT09LLVgxNC10cGxnLmJpbgorIyAgRmlsZTog
cWNvbS94MWU4MDEwMC9YMVA0MjEwMC1NaWNyb3NvZnQtU3VyZmFjZS1Qcm8tMTJpbi10cGxnLmJp
bgorIyAgCisjIC1WZXJzaW9uOiB2MS4wLjQKKyMgLUluZm86IERBVEU9MDUuMDYuMjAyNgorIyAr
VmVyc2lvbjogdjEuMC41CisjICtJbmZvOiBEQVRFPTE2LjEwLjIwMjYKKyMgIAorIyAgTGljZW5j
ZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5saW5hcm8gZm9yIGRldGFpbHMKKyMgIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMy1DbGF1c2UKKyMgQEAgLTExMjg0LDYgKzExNzU1
LDggQEAKKyMgIFZlcnNpb246IDUuOC4yMDAuNzcyMF8xMDI5CisjICAKKyMgIEZpbGU6IEhQL2lz
aC9pc2hfcHRsXzEyMTI4NjA2XzU4MS43Nzc5LjAuYmluCisjICtMaW5rOiBpbnRlbC9pc2gvaXNo
X3B0bF8xMjEyODYwNl85M2VjMzhmMC5iaW4gLT4gLi4vLi4vSFAvaXNoL2lzaF9wdGxfMTIxMjg2
MDZfNTgxLjc3NzkuMC5iaW4KKyMgK0luZm86IHByb2R1Y3RfbmFtZSAtICJIUCBaQm9vayA4IEcy
aSAxNCBpbmNoIE1vYmlsZSBXb3Jrc3RhdGlvbiBQQyIKKyMgIFZlcnNpb246IDUuOC4xLjc3NzkK
KyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5IUCBmb3IgZGV0
YWlscworIyBAQCAtMTEyOTUsNiArMTE3NjgsOSBAQAorIyAgRmlsZTogZGVsbC9pc2gvaXNoX3B0
bF8zOWNlZWFmOF81ODEuNzc3OS4wLmJpbgorIyAgRmlsZTogZGVsbC9pc2gvaXNoX3B0bF8zOWNl
ZWFmOF81ODEuNzc4My4wLmJpbgorIyAgTGluazogaW50ZWwvaXNoL2lzaF9wdGxfMzljZWVhZjgu
YmluIC0+IC4uLy4uL2RlbGwvaXNoL2lzaF9wdGxfMzljZWVhZjhfNTgxLjc3ODMuMC5iaW4KKyMg
KworIyArRmlsZTogZGVsbC9pc2gvaXNoX252bGhfMzljZWVhZjhfNTgyLjc4MjIuMC5iaW4KKyMg
K0xpbms6IGludGVsL2lzaC9pc2hfbnZsaF8zOWNlZWFmOC5iaW4gLT4gLi4vLi4vZGVsbC9pc2gv
aXNoX252bGhfMzljZWVhZjhfNTgyLjc4MjIuMC5iaW4KKyMgIAorIyAgTGljZW5zZTogUmVkaXN0
cmlidXRhYmxlLiBTZWUgTElDRU5TRS5kZWxsIGZvciBkZXRhaWxzCisjICBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogTGljZW5zZVJlZi1MSUNFTlNFLmRlbGwKKyMgQEAgLTExMzM5LDE2ICsxMTgx
NSwxOSBAQAorIyAgRHJpdmVyOiBpbnRlbF92cHUgLSBJbnRlbCBOUFUgZHJpdmVyCisjICAKKyMg
IEZpbGU6IGludGVsL3ZwdS92cHVfMzd4eF92MS5iaW4KKyMgLVZlcnNpb246IDIwMjYwODIwKk1U
TF9DTElFTlRfU0lMSUNPTi1OVlIrTk4tZGVwbG95bWVudCo2ZmM4MzVhMTkyMDUyYWMyMjYxYzRl
MWQ1ZGE3Mzc5Y2VkOTVhZTgxKjZmYzgzNWExOTIwNTJhYzIyNjFjNGUxZDVkYTczNzljZWQ5NWFl
ODEqNmZjODM1YTE5MjAKKyMgK1ZlcnNpb246IDIwMjYxMDI4Kk1UTF9DTElFTlRfU0lMSUNPTi1O
VlIrTk4tZGVwbG95bWVudCo3NDMwNDZiMWExYmQxZmIyNzgyNjE1NDdjNGI0NDU4MTcyZmMzYmQw
Kjc0MzA0NmIxYTFiZDFmYjI3ODI2MTU0N2M0YjQ0NTgxNzJmYzNiZDAqNzQzMDQ2YgorIyAgTGlu
azogaW50ZWwvdnB1L3ZwdV8zN3h4X3YwLjAuYmluIC0+IHZwdV8zN3h4X3YxLmJpbgorIyAgCisj
ICBGaWxlOiBpbnRlbC92cHUvdnB1XzQweHhfdjEuYmluCisjIC1WZXJzaW9uOiBBdWcgMjAgMjAy
NipOUFU0MHh4KmJ1aWxkL2NpL25wdS1mdy1jaS1jaV9icmFuY2hfVUQyMDI2MzhfbnB1X3JlbGVh
c2VfMjZ3dzMyLTIwMjYwODEzXzE4NTA1MS0zYTVlNGRkMWNmOTM1MjJiYWE3OWU1NWE1M2YyYWM3
MTY1NzIzY2FkLTEtZzZmYzgzNWExOTIwKjZmYzgzNWExOTIwNTJhYzIyNjFjNGUxZDVkYTczNzlj
ZWQ5NWFlODEKKyMgK1ZlcnNpb246IE9jdCAyOCAyMDI2Kk5QVTQweHgqKjc0MzA0NmIxYTFiZDFm
YjI3ODI2MTU0N2M0YjQ0NTgxNzJmYzNiZDAKKyMgIExpbms6IGludGVsL3ZwdS92cHVfNDB4eF92
MC4wLmJpbiAtPiB2cHVfNDB4eF92MS5iaW4KKyMgIAorIyAgRmlsZTogaW50ZWwvdnB1L3ZwdV81
MHh4X3YxLmJpbgorIyAtVmVyc2lvbjogQXVnIDIwIDIwMjYqTlBVNTB4eCpidWlsZC9jaS9ucHUt
ZnctY2ktY2lfYnJhbmNoX1VEMjAyNjM4X25wdV9yZWxlYXNlXzI2d3czMi0yMDI2MDgxM18xODUw
NTEtM2E1ZTRkZDFjZjkzNTIyYmFhNzllNTVhNTNmMmFjNzE2NTcyM2NhZC0xLWc2ZmM4MzVhMTky
MCo2ZmM4MzVhMTkyMDUyYWMyMjYxYzRlMWQ1ZGE3Mzc5Y2VkOTVhZTgxCisjICtWZXJzaW9uOiBP
Y3QgMjggMjAyNipOUFU1MHh4Kio3NDMwNDZiMWExYmQxZmIyNzgyNjE1NDdjNGI0NDU4MTcyZmMz
YmQwCisjICBMaW5rOiBpbnRlbC92cHUvdnB1XzUweHhfdjAuMC5iaW4gLT4gdnB1XzUweHhfdjEu
YmluCisjICsKKyMgK0ZpbGU6IGludGVsL3ZwdS92cHVfNjB4eF92MS5iaW4KKyMgK1ZlcnNpb246
IE9jdCAyOCAyMDI2Kk5QVTYweHgqKjc0MzA0NmIxYTFiZDFmYjI3ODI2MTU0N2M0YjQ0NTgxNzJm
YzNiZDAKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5pbnRl
bF92cHUgZm9yIGRldGFpbHMKKyMgIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVm
LUxJQ0VOU0UuaW50ZWxfdnB1CisjIEBAIC0xMTM2Niw2ICsxMTg0NSw3IEBACisjICAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KKyMgIAorIyAgRHJpdmVyOiBxY29tLWdlbmktc2UgLSBRdWFsY29tbSBRVVB2
MyBmaXJtd2FyZSBpbWFnZSBmaWxlCisjICtGaWxlOiBxY29tL2VsaXphL3F1cHYzZncuZWxmCisj
ICBGaWxlOiBxY29tL3NhODc3NXAvcXVwdjNmdy5lbGYKKyMgIEZpbGU6IHFjb20vbm9yZC9xdXB2
M2Z3LmVsZgorIyAgRmlsZTogcWNvbS9xY202NDkwL3F1cHYzZncuZWxmCisjIEBAIC0xMTQyNyw2
ICsxMTkwNywxNSBAQAorIyAgCisjICBWZXJzaW9uOiA1NgorIyAgCisjICtGaWxlOiBtb3JzZW1p
Y3JvL21tODF4L3Y1Ny9tbTgxMDguYmluCisjICtGaWxlOiBtb3JzZW1pY3JvL21tODF4L3Y1Ny9i
Y2ZfbW04MTA4X21mMTU0NTcuYmluCisjICtGaWxlOiBtb3JzZW1pY3JvL21tODF4L3Y1Ny9iY2Zf
YXdfaG02NzcuYmluCisjICtMaW5rOiBtb3JzZW1pY3JvL21tODF4L3Y1Ny9iY2ZfYm9hcmR0eXBl
XzA4MDQuYmluIC0+IGJjZl9tbTgxMDhfbWYxNTQ1Ny5iaW4KKyMgK0xpbms6IG1vcnNlbWljcm8v
bW04MXgvdjU3L2JjZl9ib2FyZHR5cGVfMDgwNy5iaW4gLT4gYmNmX21tODEwOF9tZjE1NDU3LmJp
bgorIyArTGluazogbW9yc2VtaWNyby9tbTgxeC92NTcvYmNmX2JvYXJkdHlwZV8wYTAyLmJpbiAt
PiBiY2ZfYXdfaG02NzcuYmluCisjICsKKyMgK1ZlcnNpb246IDU3CisjICsKKyMgIExpY2Vuc2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubW9yc2VtaWNybyBmb3IgZGV0YWlscy4KKyMg
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMaWNlbnNlUmVmLUxJQ0VOQ0UubW9yc2VtaWNybwor
IyAgCisjIEBAIC0xMTQ0NiwxMCArMTE5MzUsMjAgQEAKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KKyMgIAorIyAtRHJpdmVyOiBhaWMgLSBBSUM4ODAwRDgwIFUwMiBTRElPIFdpLUZpIHN1cHBv
cnQKKyMgK0RyaXZlcjogYWljIC0gQUlDODgwMEQ4MCBVMDIgYW5kIEFJQzg4MDBEODBOIFUwMi9V
MDJDIFNESU8gV2ktRmkgc3VwcG9ydAorIyAgCisjICBGaWxlOiBhaWMvYWljODgwMGQ4MC9mbWFj
ZndfODgwMGQ4MF91MDIuYmluCisjICBWZXJzaW9uOiB2Ni45LjEuMQorIyArRmlsZTogYWljL2Fp
Yzg4MDBkODAvYWljX3VzZXJjb25maWdfODgwMGQ4MC50eHQKKyMgK0ZpbGU6IGFpYy9haWM4ODAw
ZDgwbi9haWNfdXNlcmNvbmZpZ184ODAwZDgwbi50eHQKKyMgK0ZpbGU6IGFpYy9haWM4ODAwZDgw
bi9mbWFjZndfY2FsaWJfODgwMGQ4MG5fdTAyLmJpbgorIyArRmlsZTogYWljL2FpYzg4MDBkODBu
L2ZtYWNmd19jaW5pdF84ODAwZDgwbl91MDIuYmluCisjICtGaWxlOiBhaWMvYWljODgwMGQ4MG4v
Zm1hY2Z3X3BhdGNoXzg4MDBkODBuX3UwMi5iaW4KKyMgK0ZpbGU6IGFpYy9haWM4ODAwZDgwbi9m
bWFjZndfcGF0Y2hfdGJsXzg4MDBkODBuX3UwMi5iaW4KKyMgK0ZpbGU6IGFpYy9haWM4ODAwZDgw
bi9mbWFjZndfY2FsaWJfODgwMGQ4MG5fdTAyYy5iaW4KKyMgK0ZpbGU6IGFpYy9haWM4ODAwZDgw
bi9mbWFjZndfY2luaXRfODgwMGQ4MG5fdTAyYy5iaW4KKyMgK0ZpbGU6IGFpYy9haWM4ODAwZDgw
bi9mbWFjZndfcGF0Y2hfODgwMGQ4MG5fdTAyYy5iaW4KKyMgK0ZpbGU6IGFpYy9haWM4ODAwZDgw
bi9mbWFjZndfcGF0Y2hfdGJsXzg4MDBkODBuX3UwMmMuYmluCisjICAKKyMgIExpY2VuY2U6IFJl
ZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuYWljIGZvciBkZXRhaWxzLgorIyAgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IExpY2Vuc2VSZWYtTElDRU5TRS5haWMKKyMgCisjCisKIFNVTU1BUlkg
PSAiRmlybXdhcmUgZmlsZXMgZm9yIHVzZSB3aXRoIExpbnV4IGtlcm5lbCIKIEhPTUVQQUdFID0g
Imh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvIgogREVTQ1JJUFRJT04gPSAiTGludXggZmlybXdhcmUg
aXMgYSBwYWNrYWdlIGRpc3RyaWJ1dGVkIGFsb25nc2lkZSB0aGUgTGludXgga2VybmVsIFwKQEAg
LTI3NSw3ICsxODI2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRVMvTElD
RU5DRS5BYmlsaXM7bWQ1PWI1ZWUzZjQxMDc4MGU1NjcxMWFkNDhlYWQKICAgICAgICAgICAgICAg
ICAgICAgZmlsZTovL0xJQ0VOU0VTL0xJQ0VOQ0UueGM1MDAwYzttZDU9MTJiMDJlZmEzMDQ5ZGI2
NWQ1MjRhZWI0MThkZDg3Y2EgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRVMv
TElDRU5TRS54ZTttZDU9YzY3NGQzODc3NDI0MmJjMGM1MjgyMTQ3MjE0ODgxMTggXAogICAgICAg
ICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRVMvTElDRU5DRS53ZjIwMDttZDU9NGQxYmVmZjAw
ZDkwMmMwNWM5YzdlOTVhNWQ4ZWI1MmQgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hF
TkNFO21kNT0ke1dIRU5DRV9DSEtTVU19IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL1dI
RU5DRTttZDU9NWZkYzc0NDA1YjVkNmVlMTEyZDRmNDgyY2NkYWU0M2IgXAogICAgICAgICAgICAg
ICAgICAgICAiCiAjIFdIRU5DRSBjaGVja3N1bSBpcyBkZWZpbmVkIHNlcGFyYXRlbHkgdG8gZWFz
ZSBvdmVycmlkaW5nIGl0IGlmCiAjIGNsYXNzLWRldnVwc3RyZWFtIGlzIHNlbGVjdGVkLgpAQCAt
NDE5LDcgKzE5NzAsNyBAQCBTUkNfVVJJOmNsYXNzLWRldnVwc3RyZWFtID0gImdpdDovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9maXJtdwogIyBQaW4gdGhpcyB0byB0
aGUgMjAyMjA1MDkgcmVsZWFzZSwgb3ZlcnJpZGUgdGhpcyBpbiBsb2NhbC5jb25mCiBTUkNSRVY6
Y2xhc3MtZGV2dXBzdHJlYW0gPz0gImIxOWNiZGNhNzhhYjJhZGZkMjEwYzkxYmUxNWEyMjU2OGU4
YjhjYWUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhMTBkMWFiNWJhZjJjNzRiYTkyZThjN2Nm
MzEzZTY5MTY5NmMyNmJkZGZhNmRmMDBkYjc5NWU0OGQ3MGNkNGNhIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjJjYWJlMTAyNTMwMDVmNTViZjRiYmMwZWJiMjVjMDk2NGQ2NmY3YzQxMjFmZmE0Nzg1
M2ZmMWU3MGVhMWFhNTQiCiAKIGluaGVyaXQgYWxsYXJjaAogCi0tIAoyLjQ3LjEKCg==

--===============7172860586474665489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 963 .bb files complete (0 cached, 963 parsed). 2014 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the allarch sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-ed7ba8528939e7abcbe65eb7b3f417554ef1462a"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:ed7ba8528939e7abcbe65eb7b3f417554ef1462a"
meta-yocto-bsp       
meta-poky            = "master:6ee74fbbe3a36dabb7f8f85ee10691eaf8aa3252"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 90 Local 77 Mirrors 0 Missed 13 Current 154 (85% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 497 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb:do_recipe_qa)
NOTE: Running task 759 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb:do_create_recipe_spdx)
NOTE: recipe linux-firmware-1_20261124-r0: task do_recipe_qa: Started
NOTE: recipe linux-firmware-1_20261124-r0: task do_create_recipe_spdx: Started
NOTE: recipe linux-firmware-1_20261124-r0: task do_recipe_qa: Succeeded
NOTE: Running task 778 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb:do_fetch)
NOTE: recipe linux-firmware-1_20261124-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe linux-firmware-1_20261124-r0: task do_fetch: Started
NOTE: recipe linux-firmware-1_20261124-r0: task do_fetch: Succeeded
NOTE: Running task 779 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb:do_unpack)
NOTE: Running task 780 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-firmware-1_20261124-r0: task do_unpack: Started
NOTE: recipe linux-firmware-1_20261124-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-firmware-1_20261124-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-firmware-1_20261124-r0: task do_unpack: Succeeded
NOTE: Running task 781 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb:do_patch)
NOTE: recipe linux-firmware-1_20261124-r0: task do_patch: Started
NOTE: recipe linux-firmware-1_20261124-r0: task do_patch: Succeeded
NOTE: Running task 782 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb:do_deploy_source_date_epoch)
NOTE: Running task 783 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb:do_populate_lic)
NOTE: recipe linux-firmware-1_20261124-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-firmware-1_20261124-r0: task do_populate_lic: Started
NOTE: recipe linux-firmware-1_20261124-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 784 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb:do_configure)
NOTE: recipe linux-firmware-1_20261124-r0: task do_populate_lic: Succeeded
NOTE: recipe linux-firmware-1_20261124-r0: task do_configure: Started
NOTE: recipe linux-firmware-1_20261124-r0: task do_configure: Succeeded
NOTE: Running task 785 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb:do_compile)
NOTE: recipe linux-firmware-1_20261124-r0: task do_compile: Started
NOTE: recipe linux-firmware-1_20261124-r0: task do_compile: Succeeded
NOTE: Running task 786 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb:do_install)
NOTE: recipe linux-firmware-1_20261124-r0: task do_install: Started
NOTE: recipe linux-firmware-1_20261124-r0: task do_install: Succeeded
NOTE: Running task 787 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb:do_package)
NOTE: Running task 788 of 796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb:do_populate_sysroot)
NOTE: recipe linux-firmware-1_20261124-r0: task do_populate_sysroot: Started
NOTE: recipe linux-firmware-1_20261124-r0: task do_package: Started
NOTE: recipe linux-firmware-1_20261124-r0: task do_populate_sysroot: Succeeded
NOTE: recipe linux-firmware-1_20261124-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 788 tasks of which 775 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261125054723.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261125054723.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20261124/temp/log.do_package.3573722
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: linux-firmware-1_20261124-r0 do_package: QA Issue: linux-firmware: Files/directories were installed but not shipped in any package:
  /usr/lib/firmware/awinic
  /usr/lib/firmware/amd/sof
  /usr/lib/firmware/amd/sof-tplg
  /usr/lib/firmware/amd/sof/sof-acp7f-code.bin
  /usr/lib/firmware/amd/sof/sof-acp7f-code_l.bin
  /usr/lib/firmware/amd/sof/sof-acp7f-data.bin
  /usr/lib/firmware/amd/sof/acp7f
  /usr/lib/firmware/amd/sof/acp7f/v1.0
  /usr/lib/firmware/amd/sof/acp7f/v1.0/sof-acp7f-code.bin
  /usr/lib/firmware/amd/sof/acp7f/v1.0/sof-acp7f-code_l.bin
  /usr/lib/firmware/amd/sof/acp7f/v1.0/sof-acp7f-data.bin
  /usr/lib/firmware/amd/sof-tplg/sof-acp7f-1amp-l0-id2.tplg
  /usr/lib/firmware/amd/sof-tplg/sof-acp7f-mic-l0-id4.tplg
  /usr/lib/firmware/amd/sof-tplg/sof-acp7f-mic-l1-id4.tplg
  /usr/lib/firmware/amd/sof-tplg/sof-acp7f-cs42l45-l0u0-cs35l63x2-l1u13.tplg
  /usr/lib/firmware/amd/sof-tplg/sof-acp7f-jack-l0-id0.tplg
  /usr/lib/firmware/amd/sof-tplg/sof-acp7f-1amp-l1-id2.tplg
  /usr/lib/firmware/amd/sof-tplg/sof-acp7f-rt721-l0.tplg
  /usr/lib/firmware/amd/sof-tplg/sof-acp7f-rt722-l0.tplg
  /usr/lib/firmware/amd/sof-tplg/sof-acp7f-jack-l1-id0.tplg
  /usr/lib/firmware/amd/sof-tplg/acp7f
  /usr/lib/firmware/amd/sof-tplg/acp7f/v1.0
  /usr/lib/firmware/amd/sof-tplg/acp7f/v1.0/sof-acp7f-1amp-l0-id2.tplg
  /usr/lib/firmware/amd/sof-tplg/acp7f/v1.0/sof-acp7f-mic-l0-id4.tplg
  /usr/lib/firmware/amd/sof-tplg/acp7f/v1.0/sof-acp7f-mic-l1-id4.tplg
  /usr/lib/firmware/amd/sof-tplg/acp7f/v1.0/sof-acp7f-cs42l45-l0u0-cs35l63x2-l1u13.tplg
  /usr/lib/firmware/amd/sof-tplg/acp7f/v1.0/sof-acp7f-jack-l0-id0.tplg
  /usr/lib/firmware/amd/sof-tplg/acp7f/v1.0/sof-acp7f-1amp-l1-id2.tplg
  /usr/lib/firmware/amd/sof-tplg/acp7f/v1.0/sof-acp7f-rt721-l0.tplg
  /usr/lib/firmware/amd/sof-tplg/acp7f/v1.0/sof-acp7f-rt722-l0.tplg
  /usr/lib/firmware/amd/sof-tplg/acp7f/v1.0/sof-acp7f-jack-l1-id0.tplg
  /usr/lib/firmware/qcom/gen71300_aqe.fw
  /usr/lib/firmware/qcom/gen71300_sqe.fw
  /usr/lib/firmware/qcom/gen71600_sqe.fw
  /usr/lib/firmware/qcom/gen71300_gmu.bin
  /usr/lib/firmware/qcom/gen71600_gmu.bin
  /usr/lib/firmware/qcom/nord/soccpr.jsn
  /usr/lib/firmware/qcom/nord/gen71300_zap.mbn
  /usr/lib/firmware/qcom/nord/soccp.mbn
  /usr/lib/firmware/qcom/nord/NORD-RRD-tplg.bin
  /usr/lib/firmware/qcom/nord/gen71600_zap.mbn
  /usr/lib/firmware/qcom/nord/NORD-RIDE-tplg.bin
  /usr/lib/firmware/qcom/hawi/HAWI-MTP-tplg.bin
  /usr/lib/firmware/qcom/eliza/eliza-cqs-evk-tplg.bin
  /usr/lib/firmware/qcom/eliza/qupv3fw.elf
  /usr/lib/firmware/qcom/glymur/soccpr.jsn
  /usr/lib/firmware/qcom/glymur/soccp.mbn
  /usr/lib/firmware/qcom/glymur/GLYMUR-ASUS-Zenbook-A14-UX3407NA-tplg.bin
  /usr/lib/firmware/qcom/glymur/GLYMUR-ASUS-Zenbook-A16-UX3607OA-tplg.bin
  /usr/lib/firmware/qcom/glymur/Lenovo-ThinkPad-T14s-Gen-7-tplg.bin
  /usr/lib/firmware/qcom/glymur/soccp_dtb.mbn
  /usr/lib/firmware/qcom/glymur/ASUSTeK
  /usr/lib/firmware/qcom/glymur/LENOVO
  /usr/lib/firmware/qcom/glymur/ASUSTeK/UX3407NA
  /usr/lib/firmware/qcom/glymur/ASUSTeK/UX3607OA
  /usr/lib/firmware/qcom/glymur/ASUSTeK/UX3407NA/GLYMUR-ASUS-Zenbook-A14-UX3407NA-tplg.bin
  /usr/lib/firmware/qcom/glymur/ASUSTeK/UX3607OA/GLYMUR-ASUS-Zenbook-A16-UX3607OA-tplg.bin
  /usr/lib/firmware/qcom/glymur/LENOVO/22A8
  /usr/lib/firmware/qcom/glymur/LENOVO/22A8/Lenovo-ThinkPad-T14s-Gen-7-tplg.bin
  /usr/lib/firmware/qcom/shikra/shikra-cqs-evk-tplg.bin
  /usr/lib/firmware/qcom/shikra/shikra-iqs-evk-tplg.bin
  /usr/lib/firmware/qcom/maili/MAILI-MTP-tplg.bin
  /usr/lib/firmware/qcom/x1e80100/X1E80100-Microsoft-Surface-Pro-11-tplg.bin
  /usr/lib/firmware/qcom/x1e80100/X1E80100-MEDION-SPRCHRGD-14-S1-tplg.bin
  /usr/lib/firmware/qcom/x1e80100/X1E80100-LENOVO-IdeaCentre-Mini-tplg.bin
  /usr/lib/firmware/qcom/x1e80100/X1E80100-ACER-SWIFT-14-tplg.bin
  /usr/lib/firmware/qcom/x1e80100/LENOVO/91B6
  /usr/lib/firmware/qcom/x1e80100/LENOVO/91B6/X1E80100-LENOVO-IdeaCentre-Mini-tplg.bin
  /usr/lib/firmware/qcom/sc8280xp/radxa/dragon-q8b/SC8280XP-Radxa-Dragon-Q8B-tplg.bin
  /usr/lib/firmware/qca/ornnv11.b18
  /usr/lib/firmware/qca/QCC2072
  /usr/lib/firmware/qca/QCC2072/perinvm_usb_00220100_0013.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101_0606.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101_0604.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101_0006.bin
  /usr/lib/firmware/qca/QCC2072/rampatch_usb_00200101.bin
  /usr/lib/firmware/qca/QCC2072/perinvm_usb_00220100_0021.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101_0002.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101_0013.bin
  /usr/lib/firmware/qca/QCC2072/perinvm_usb_00220100_0605.bin
  /usr/lib/firmware/qca/QCC2072/perinvm_usb_00220100_0601.bin
  /usr/lib/firmware/qca/QCC2072/perinvm_usb_00220100_0022.bin
  /usr/lib/firmware/qca/QCC2072/perinvm_usb_00220100_0604.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101_0605.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101_001f.bin
  /usr/lib/firmware/qca/QCC2072/perinvm_usb_00220100_0006.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101_0008.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101_001a.bin
  /usr/lib/firmware/qca/QCC2072/perinvm_usb_00220100_001f.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101_0021.bin
  /usr/lib/firmware/qca/QCC2072/perinvm_usb_00220100.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101_001e.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101_000f.bin
  /usr/lib/firmware/qca/QCC2072/perinvm_usb_00220100_0606.bin
  /usr/lib/firmware/qca/QCC2072/perinvm_usb_00220100_0201.bin
  /usr/lib/firmware/qca/QCC2072/perinvm_usb_00220100_0002.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101_001c.bin
  /usr/lib/firmware/qca/QCC2072/perinvm_usb_00220100_001e.bin
  /usr/lib/firmware/qca/QCC2072/perinvm_usb_00220100_0008.bin
  /usr/lib/firmware/qca/QCC2072/perinvm_usb_00220100_000f.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101_0601.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101.bin
  /usr/lib/firmware/qca/QCC2072/peripatch_usb_00220100.bin
  /usr/lib/firmware/qca/QCC2072/perinvm_usb_00220100_0011.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101_0201.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101_0011.bin
  /usr/lib/firmware/qca/QCC2072/nvm_usb_00200101_0022.bin
  /usr/lib/firmware/intel/ipu/ipu8_fw.bin
  /usr/lib/firmware/intel/ish/ish_ptl_12128606_93ec38f0.bin
  /usr/lib/firmware/intel/ish/ish_nvlh_39ceeaf8.bin
  /usr/lib/firmware/aic/aic8800d80n
  /usr/lib/firmware/aic/aic8800d80n/fmacfw_cinit_8800d80n_u02.bin
  /usr/lib/firmware/aic/aic8800d80n/fmacfw_calib_8800d80n_u02c.bin
  /usr/lib/firmware/aic/aic8800d80n/fmacfw_patch_8800d80n_u02c.bin
  /usr/lib/firmware/aic/aic8800d80n/fmacfw_patch_tbl_8800d80n_u02c.bin
  /usr/lib/firmware/aic/aic8800d80n/fmacfw_cinit_8800d80n_u02c.bin
  /usr/lib/firmware/aic/aic8800d80n/fmacfw_patch_8800d80n_u02.bin
  /usr/lib/firmware/aic/aic8800d80n/aic_userconfig_8800d80n.txt
  /usr/lib/firmware/aic/aic8800d80n/fmacfw_calib_8800d80n_u02.bin
  /usr/lib/firmware/aic/aic8800d80n/fmacfw_patch_tbl_8800d80n_u02.bin
  /usr/lib/firmware/morsemicro/mm81x/v57
  /usr/lib/firmware/morsemicro/mm81x/v57/bcf_aw_hm677.bin
  /usr/lib/firmware/morsemicro/mm81x/v57/bcf_boardtype_0804.bin
  /usr/lib/firmware/morsemicro/mm81x/v57/bcf_boardtype_0a02.bin
  /usr/lib/firmware/morsemicro/mm81x/v57/mm8108.bin
  /usr/lib/firmware/morsemicro/mm81x/v57/bcf_mm8108_mf15457.bin
  /usr/lib/firmware/morsemicro/mm81x/v57/bcf_boardtype_0807.bin
  /usr/lib/firmware/dell/ish/ish_nvlh_39ceeaf8_582.7822.0.bin
  /usr/lib/firmware/awinic/aw88399_acf_17aa3927.bin
  /usr/lib/firmware/awinic/aw88399_acf_17aa3928.bin
  /usr/lib/firmware/awinic/aw88399_acf_17aa3939.bin
  /usr/lib/firmware/awinic/aw88399_acf_17aa3937.bin
  /usr/lib/firmware/awinic/aw88399_acf_17aa3936.bin
  /usr/lib/firmware/awinic/aw88399_acf_17aa3938.bin
  /usr/lib/firmware/awinic/aw88399_acf_17aa3906.bin
  /usr/lib/firmware/awinic/aw88399_acf_17aa3907.bin
  /usr/lib/firmware/nxp/sd_iw610.bin.se
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
linux-firmware: 137 installed and not shipped files. [installed-vs-shipped]
ERROR: linux-firmware-1_20261124-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/linux-firmware/20261124/temp/log.do_package.3573722
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-firmware/linux-firmware_20261124.bb:do_package) failed with exit code '1'

--===============7172860586474665489==--
