Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E36C54EF1
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:18 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.20198.1672605969351145227
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ia70IBjF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101856f15a767-ab2af4fc-90b0-441b-ac7e-a10ecd6906b0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mO4OdvoxIcufmlqmrwNxz/iz697qNGqCgv1naOJ/17Y=;
	b=Ia70IBjF3Ea1ht7xLH0ZrkKHnxtexyVOsGNvcYt4aPUHEQ7CGDrbsrsERH3d+6lS
	/CKKjGplA7FLD0N9GkoenslGjgBFrKYz7k9akTAGP25/frbsJPTvAXPGNbnuZOHjZF1
	Rn4xXTPVpkJM5wYAUF0KaVfMg2qEEbJWpmh3CN60=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mO4OdvoxIcufmlqmrwNxz/iz697qNGqCgv1naOJ/17Y=;
	b=SMBUYJwv5rr68vKPoj8uC8VOkPwhWBSiDr9FEP0pAo2o35W8geiB1IX/6LC6+YGD
	TKruHfP2dG65V6UfQG2d9ZXm8a8ANuz1gZHg28rQOPMkNek7M4ZBaPUBwLcR/yEzkdM
	xDELyfH1yIGSMg7EGwWiGO/J+bQ412CNbmZzENRk=
Content-Type: multipart/mixed; boundary="===============7202609184199586243=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20221214 SUCCEEDED
Message-ID: <010101856f15a767-ab2af4fc-90b0-441b-ac7e-a10ecd6906b0-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175302

--===============7202609184199586243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20221214* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20221109-20221214.patch
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
--===============7202609184199586243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/lib/firmware/amdgpu/gc_11_0_0_mes1.bin /lib/firmware/amdgpu/sdma_6_0_0.bin /lib/firmware/amdgpu/gc_11_0_0_mec.bin /lib/firmware/amdgpu/aldebaran_sjt_mec.bin /lib/firmware/amdgpu/vcn_4_0_0.bin /lib/firmware/amdgpu/gc_11_0_0_pfp.bin /lib/firmware/amdgpu/psp_13_0_0_sos.bin /lib/firmware/amdgpu/smu_13_0_0.bin /lib/firmware/amdgpu/gc_11_0_0_rlc.bin /lib/firmware/amdgpu/aldebaran_sjt_mec2.bin /lib/firmware/amdgpu/gc_11_0_0_mes.bin /lib/firmware/amdgpu/gc_11_0_0_imu.bin /lib/firmware/amdgpu/dcn_3_2_0_dmcub.bin /lib/firmware/amdgpu/psp_13_0_0_ta.bin /lib/firmware/amdgpu/gc_11_0_0_me.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/mtl_dmc_ver2_10.bin /lib/firmware/i915/dg2_dmc_ver2_08.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/lib/firmware/LICENSE.nxp"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 1744896 to 1960217 (+12%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca: FILELIST: added "/lib/firmware/qca/nvm_usb_00190200.bin /lib/firmware/qca/rampatch_usb_00190200.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/mediatek/mt7986_wo_0.bin /lib/firmware/mediatek/mt7986_wo_1.bin /lib/firmware/nxp/sr150_fw.bin"

--===============7202609184199586243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20221109.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20221214.tar.xz"
packages/all-poky-linux/linux-firmware: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 65320058 to 69094574 (+6%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/lib/firmware/amdgpu/psp_13_0_0_sos.bin /lib/firmware/amdgpu/gc_11_0_0_rlc.bin /lib/firmware/amdgpu/aldebaran_sjt_mec.bin /lib/firmware/amdgpu/sdma_6_0_0.bin /lib/firmware/amdgpu/aldebaran_sjt_mec2.bin /lib/firmware/amdgpu/gc_11_0_0_mec.bin /lib/firmware/amdgpu/smu_13_0_0.bin /lib/firmware/amdgpu/gc_11_0_0_mes1.bin /lib/firmware/amdgpu/gc_11_0_0_imu.bin /lib/firmware/amdgpu/psp_13_0_0_ta.bin /lib/firmware/amdgpu/dcn_3_2_0_dmcub.bin /lib/firmware/amdgpu/gc_11_0_0_me.bin /lib/firmware/amdgpu/gc_11_0_0_mes.bin /lib/firmware/amdgpu/vcn_4_0_0.bin /lib/firmware/amdgpu/gc_11_0_0_pfp.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGSIZE changed from 455745 to 459988 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGSIZE changed from 253748 to 246791 (-3%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGSIZE changed from 223635 to 225090 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGSIZE changed from 633817 to 634361 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 25534811 to 25605463 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/dg2_dmc_ver2_08.bin /lib/firmware/i915/mtl_dmc_ver2_10.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 152743 to 157939 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/lib/firmware/LICENSE.nxp"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 1744896 to 1960217 (+12%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: FILELIST: added "/lib/firmware/qca/rampatch_usb_00190200.bin /lib/firmware/qca/nvm_usb_00190200.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 203715 to 204929 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20221109" to "20221214"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 252633154 to 257851634 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20221109 [default] to 20221214 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/nxp/sr150_fw.bin /lib/firmware/mediatek/mt7986_wo_0.bin /lib/firmware/mediatek/mt7986_wo_1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20221109" to "20221214"

--===============7202609184199586243==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20221109-20221214.patch"

RnJvbSA4N2Y1NzBlMjhkZDU1YTkzNTkwZWJiZjQ4MzUwNGY3ZTExNmY3NDVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxNToyOTozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
bnV4LWZpcm13YXJlOiB1cGdyYWRlIDIwMjIxMTA5IC0+IDIwMjIxMjE0CgotLS0KIC4uLjIwMjIx
MTA5LmJiID0+IGxpbnV4LWZpcm13YXJlXzIwMjIxMjE0LmJifSB8IDE4MSArKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNzkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL3tsaW51eC1maXJtd2Fy
ZV8yMDIyMTEwOS5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIyMTIxNC5iYn0gKDkwJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJl
XzIwMjIxMTA5LmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1m
aXJtd2FyZV8yMDIyMTIxNC5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjIxMTA5LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13
YXJlXzIwMjIxMjE0LmJiCmluZGV4IGIwNWI5NjBlYmQuLmRhNDZkZDEwNDEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVfMjAyMjEx
MDkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIyMTIxNC5iYgpAQCAtMSwzICsxLDE4MCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IFdIRU5DRQorIyArKysgV0hFTkNFCisjIEBAIC0yNjIyLDYgKzI2MjIsOCBAQAorIyAgRmlsZTog
YW1kZ3B1L2FsZGViYXJhbl9tZWMuYmluCisjICBGaWxlOiBhbWRncHUvYWxkZWJhcmFuX3JsYy5i
aW4KKyMgIEZpbGU6IGFtZGdwdS9hbGRlYmFyYW5fc2RtYS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9h
bGRlYmFyYW5fc2p0X21lYzIuYmluCisjICtGaWxlOiBhbWRncHUvYWxkZWJhcmFuX3NqdF9tZWMu
YmluCisjICBGaWxlOiBhbWRncHUvYWxkZWJhcmFuX3NtYy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9h
bGRlYmFyYW5fc29zLmJpbgorIyAgRmlsZTogYW1kZ3B1L2FsZGViYXJhbl90YS5iaW4KKyMgQEAg
LTI2MzgsOCArMjY0MCwxOCBAQAorIyAgRmlsZTogYW1kZ3B1L2djXzEwXzNfN19tZWMyLmJpbgor
IyAgRmlsZTogYW1kZ3B1L2djXzEwXzNfN19wZnAuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTBf
M183X3JsYy5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV8wXzBfaW11LmJpbgorIyArRmlsZTog
YW1kZ3B1L2djXzExXzBfMF9tZS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV8wXzBfbWVjLmJp
bgorIyArRmlsZTogYW1kZ3B1L2djXzExXzBfMF9tZXMxLmJpbgorIyArRmlsZTogYW1kZ3B1L2dj
XzExXzBfMF9tZXMuYmluCisjICtGaWxlOiBhbWRncHUvZ2NfMTFfMF8wX3BmcC5iaW4KKyMgK0Zp
bGU6IGFtZGdwdS9nY18xMV8wXzBfcmxjLmJpbgorIyAgRmlsZTogYW1kZ3B1L2Rjbl8zXzFfNV9k
bWN1Yi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9kY25fM18xXzZfZG1jdWIuYmluCisjICtGaWxlOiBh
bWRncHUvZGNuXzNfMl8wX2RtY3ViLmJpbgorIyArRmlsZTogYW1kZ3B1L3BzcF8xM18wXzBfc29z
LmJpbgorIyArRmlsZTogYW1kZ3B1L3BzcF8xM18wXzBfdGEuYmluCisjICBGaWxlOiBhbWRncHUv
cHNwXzEzXzBfNV9hc2QuYmluCisjICBGaWxlOiBhbWRncHUvcHNwXzEzXzBfNV90YS5iaW4KKyMg
IEZpbGU6IGFtZGdwdS9wc3BfMTNfMF81X3RvYy5iaW4KKyMgQEAgLTI2NDgsNyArMjY2MCwxMCBA
QAorIyAgRmlsZTogYW1kZ3B1L3BzcF8xM18wXzhfdG9jLmJpbgorIyAgRmlsZTogYW1kZ3B1L3Nk
bWFfNV8yXzYuYmluCisjICBGaWxlOiBhbWRncHUvc2RtYV81XzJfNy5iaW4KKyMgK0ZpbGU6IGFt
ZGdwdS9zZG1hXzZfMF8wLmJpbgorIyArRmlsZTogYW1kZ3B1L3NtdV8xM18wXzAuYmluCisjICBG
aWxlOiBhbWRncHUvdmNuXzNfMV8yLmJpbgorIyArRmlsZTogYW1kZ3B1L3Zjbl80XzBfMC5iaW4K
KyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5hbWRncHUgZm9y
IGRldGFpbHMuCisjICAKKyMgQEAgLTI4NDAsNiArMjg1NSw3IEBACisjICBGaWxlOiBicmNtL2Jy
Y21mbWFjNDMzMC1zZGlvLmJpbgorIyAgRmlsZTogYnJjbS9icmNtZm1hYzQzMzQtc2Rpby5iaW4K
KyMgIEZpbGU6IGJyY20vYnJjbWZtYWM0MzM1LXNkaW8uYmluCisjICtGaWxlOiBicmNtL2JyY21m
bWFjNDMzOS1zZGlvLmJpbgorIyAgRmlsZTogYnJjbS9icmNtZm1hYzQzMjQxYjAtc2Rpby5iaW4K
KyMgIEZpbGU6IGJyY20vYnJjbWZtYWM0MzI0MWI0LXNkaW8uYmluCisjICBGaWxlOiBicmNtL2Jy
Y21mbWFjNDMyNDFiNS1zZGlvLmJpbgorIyBAQCAtMjg0OSw3ICsyODY1LDEwIEBACisjICBGaWxl
OiBicmNtL2JyY21mbWFjNDM0MzBhMC1zZGlvLmJpbgorIyAgRmlsZTogYnJjbS9icmNtZm1hYzQz
NTBjMi1wY2llLmJpbgorIyAgRmlsZTogYnJjbS9icmNtZm1hYzQzNTAtcGNpZS5iaW4KKyMgK0Zp
bGU6IGJyY20vYnJjbWZtYWM0MzU0LXNkaW8uYmluCisjICBGaWxlOiBicmNtL2JyY21mbWFjNDM1
NjkuYmluCisjICtGaWxlOiBicmNtL2JyY21mbWFjNDM1Ni1wY2llLmJpbgorIyArRmlsZTogYnJj
bS9icmNtZm1hYzQzNTYtc2Rpby5iaW4KKyMgIEZpbGU6IGJyY20vYnJjbWZtYWM0MzU4LXBjaWUu
YmluCisjICBGaWxlOiBicmNtL2JyY21mbWFjNDM2MDItcGNpZS5iaW4KKyMgIEZpbGU6IGJyY20v
YnJjbWZtYWM0MzYwMi1wY2llLmFwLmJpbgorIyBAQCAtNDQ0Nyw2ICs0NDY2LDggQEAKKyMgIEZp
bGU6IHFjYS9udm1fdXNiXzAwMTMwMjAxX2dmXzAxMGEuYmluCisjICBGaWxlOiBxY2EvbnZtX3Vz
Yl8wMDEzMDIwMV9nZl8wMTBiLmJpbgorIyAgRmlsZTogcWNhL252bV91c2JfMDAxMzAyMDFfZ2Zf
MDMwMy5iaW4KKyMgK0ZpbGU6IHFjYS9yYW1wYXRjaF91c2JfMDAxOTAyMDAuYmluCisjICtGaWxl
OiBxY2EvbnZtX3VzYl8wMDE5MDIwMC5iaW4KKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRh
YmxlLiBTZWUgTElDRU5TRS5RdWFsY29tbUF0aGVyb3NfYXRoMTBrIGFuZCBxY2EvTk9USUNFLnR4
dCBmb3IgZGV0YWlscworIyAgCisjIEBAIC00ODQ2LDYgKzQ4NjcsMTIgQEAKKyMgIAorIyAgRmls
ZTogaTkxNS9kZzJfZG1jX3ZlcjJfMDcuYmluCisjICBWZXJzaW9uOiBETUMgQVBJL0FQQiB2ZXIg
MiByZWxlYXNlIDcgZm9yIERHMgorIyArCisjICtGaWxlOiBpOTE1L2RnMl9kbWNfdmVyMl8wOC5i
aW4KKyMgK1ZlcnNpb246IERNQyBBUEkvQVBCIHZlciAyIHJlbGVhc2UgOCBmb3IgREcyCisjICsK
KyMgK0ZpbGU6IGk5MTUvbXRsX2RtY192ZXIyXzEwLmJpbgorIyArVmVyc2lvbjogRE1DIEFQSS9B
UEIgdmVyIDIgcmVsZWFzZSAxMCBmb3IgTWV0ZW9ybGFrZQorIyAgCisjICBMaWNlbnNlOiBSZWRp
c3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmk5MTUgZm9yIGRldGFpbHMKKyMgIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCisjIEBAIC01NDQzLDM1ICs1NDcwLDM5IEBACisjICBEcml2ZXI6IG10NzkxNWUgLSBN
ZWRpYVRlayBXaXJlbGVzcyBNQUNzIGZvciBNVDc5MTUvTVQ3OTE2L01UNzk4NgorIyAgCisjICBG
aWxlOiBtZWRpYXRlay9tdDc5MTVfd20uYmluCisjIC1WZXJzaW9uOiAyMDIxMTIyMjE4NDA1Mgor
IyArVmVyc2lvbjogMjAyMjA5MjkxMDQxNDUKKyMgIEZpbGU6IG1lZGlhdGVrL210NzkxNV93YS5i
aW4KKyMgLVZlcnNpb246IDIwMjExMjIyMTg0MTExCisjICtWZXJzaW9uOiAyMDIyMDkyOTEwNDIw
NQorIyAgRmlsZTogbWVkaWF0ZWsvbXQ3OTE1X3JvbV9wYXRjaC5iaW4KKyMgLVZlcnNpb246IDIw
MjExMjIyMTg0MDE3YQorIyArVmVyc2lvbjogMjAyMjA5MjkxMDQxMTNhCisjICBGaWxlOiBtZWRp
YXRlay9tdDc5MTVfZWVwcm9tLmJpbgorIyAgVmVyc2lvbjogMjAyMDA4MjEKKyMgIEZpbGU6IG1l
ZGlhdGVrL210NzkxNV9lZXByb21fZGJkYy5iaW4KKyMgIFZlcnNpb246IDIwMjAwODIxCisjICAK
KyMgIEZpbGU6IG1lZGlhdGVrL210NzkxNl93bS5iaW4KKyMgLVZlcnNpb246IDIwMjExMjMwMTM1
NzIwCisjICtWZXJzaW9uOiAyMDIyMTAzMTE1NDcxMworIyAgRmlsZTogbWVkaWF0ZWsvbXQ3OTE2
X3dhLmJpbgorIyAtVmVyc2lvbjogMjAyMTEyMzAxMzU4MDgKKyMgK1ZlcnNpb246IDIwMjIxMDMx
MTU0NzU3CisjICBGaWxlOiBtZWRpYXRlay9tdDc5MTZfcm9tX3BhdGNoLmJpbgorIyAtVmVyc2lv
bjogMjAyMTEyMzAxMzU2MjBhCisjICtWZXJzaW9uOiAyMDIyMTAzMTE1NDY1MmEKKyMgIEZpbGU6
IG1lZGlhdGVrL210NzkxNl9lZXByb20uYmluCisjICBWZXJzaW9uOiAyMDIxMTEzMAorIyAgCisj
ICBGaWxlOiBtZWRpYXRlay9tdDc5ODZfd20uYmluCisjIC1WZXJzaW9uOiAyMDIyMDExMzE2MjY0
MQorIyArVmVyc2lvbjogMjAyMjEwMTIxNzQ3MjUKKyMgIEZpbGU6IG1lZGlhdGVrL210Nzk4Nl93
bV9tdDc5NzUuYmluCisjIC1WZXJzaW9uOiAyMDIyMDExMzE2Mjc1NgorIyArVmVyc2lvbjogMjAy
MjEwMTIxNzQ4MDUKKyMgIEZpbGU6IG1lZGlhdGVrL210Nzk4Nl93YS5iaW4KKyMgLVZlcnNpb246
IDIwMjIwMTEzMTYzMDM0CisjICtWZXJzaW9uOiAyMDIyMTAxMjE3NDkzNworIyAgRmlsZTogbWVk
aWF0ZWsvbXQ3OTg2X3JvbV9wYXRjaC5iaW4KKyMgLVZlcnNpb246IDIwMjIwMTEzMTYyNTQzYQor
IyArVmVyc2lvbjogMjAyMjEwMTIxNzQ2NDhhCisjICBGaWxlOiBtZWRpYXRlay9tdDc5ODZfcm9t
X3BhdGNoX210Nzk3NS5iaW4KKyMgLVZlcnNpb246IDIwMjIwMTEzMTYyNzAxYQorIyArVmVyc2lv
bjogMjAyMjEwMTIxNzQ3NDNhCisjICtGaWxlOiBtZWRpYXRlay9tdDc5ODZfd29fMC5iaW4KKyMg
K1ZlcnNpb246IDIwMjIxMDEyMTc1MDA1CisjICtGaWxlOiBtZWRpYXRlay9tdDc5ODZfd29fMS5i
aW4KKyMgK1ZlcnNpb246IDIwMjIxMDEyMTc1MDMyCisjICBGaWxlOiBtZWRpYXRlay9tdDc5ODZf
ZWVwcm9tX210Nzk3Ni5iaW4KKyMgIFZlcnNpb246IDIwMjExMTA1CisjICBGaWxlOiBtZWRpYXRl
ay9tdDc5ODZfZWVwcm9tX210Nzk3Nl9kYmRjLmJpbgorIyBAQCAtNTQ4OCw5ICs1NTE5LDkgQEAK
KyMgIERyaXZlcjogbXQ3OTIxIC0gTWVkaWFUZWsgTVQ3OTIxIFdpcmVsZXNzIE1BQ3MKKyMgIAor
IyAgRmlsZTogbWVkaWF0ZWsvV0lGSV9NVDc5NjFfcGF0Y2hfbWN1XzFfMl9oZHIuYmluCisjIC1W
ZXJzaW9uOiAyMDIyMDkwODIxMDkxOWEKKyMgK1ZlcnNpb246IDIwMjIxMTA5MTEwOTE4YQorIyAg
RmlsZTogbWVkaWF0ZWsvV0lGSV9SQU1fQ09ERV9NVDc5NjFfMS5iaW4KKyMgLVZlcnNpb246IDIw
MjIwOTA4MjExMDIxCisjICtWZXJzaW9uOiAyMDIyMTEwOTExMTAwNQorIyAgCisjICBMaWNlbmNl
OiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAg
CisjIEBAIC01NDk5LDcgKzU1MzAsNyBAQAorIyAgRHJpdmVyOiBtdDc5MjEgLSBNZWRpYVRlayBN
VDc5MjEgYmx1ZXRvb3RoIGNoaXBzZXQKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvQlRfUkFNX0NP
REVfTVQ3OTYxXzFfMl9oZHIuYmluCisjIC1WZXJzaW9uOiAyMDIyMDkwODIxMTIzNAorIyArVmVy
c2lvbjogMjAyMjExMDkxMTEyMTMKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBT
ZWUgTElDRU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNjIyMywzICs2MjU0
LDExIEBACisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVr
IGZvciBkZXRhaWxzLgorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyArCisjICtEcml2ZXI6
IG54cC1zcjF4eCAtIE5YUCBVbHRyYSBXaWRlIEJhbmQgZHJpdmVyCisjICtGaWxlOiBueHAvc3Ix
NTBfZncuYmluCisjICtWZXJzaW9uOiAzNS4wMC4wMworIyArCisjICtMaWNlbmNlOiBSZWRpc3Ry
aWJ1dGFibGUuIFNlZSBMSUNFTlNFLm54cCBmb3IgZGV0YWlscworIyArT3JpZ2luYXRlcyBmcm9t
IGh0dHBzOi8vZ2l0aHViLmNvbS9OWFAvdXdiLU5YUFVXQi1GVy5naXQKKyMgKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCisjIAorIworCiBTVU1NQVJZID0gIkZpcm13YXJlIGZpbGVzIGZvciB1c2Ugd2l0aCBM
aW51eCBrZXJuZWwiCiBIT01FUEFHRSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnLyIKIERFU0NS
SVBUSU9OID0gIkxpbnV4IGZpcm13YXJlIGlzIGEgcGFja2FnZSBkaXN0cmlidXRlZCBhbG9uZ3Np
ZGUgdGhlIExpbnV4IGtlcm5lbCBcCkBAIC0xMjgsNyArMzA1LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5DRS5BYmlsaXM7bWQ1PWI1ZWUzZjQxMDc4MGU1NjcxMWFkNDhlYWRj
MjJiOGJjIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM0MDAwO21kNT0w
ZmY1MWQyZGM0OWZjZTA0ODE0YzkxNTUwODEwOTJmMCBcCiAgICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9MSUNFTkNFLnhjNTAwMDttZDU9MWUxNzBjMTMxNzUzMjNjMzJjN2Y0ZDA5OThkNTNmNjYg
XAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzUwMDBjO21kNT0xMmIwMmVm
YTMwNDlkYjY1ZDUyNGFlYjQxOGRkODdjYSBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9X
SEVOQ0U7bWQ1PSR7V0hFTkNFX0NIS1NVTX0gXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
V0hFTkNFO21kNT1iZjdjNzE2ZDE2ZTQ4ZmUxMThjNjIwOWY5OWIxMzI1MyBcCiAgICAgICAgICAg
ICAgICAgICAgICIKICMgV0hFTkNFIGNoZWNrc3VtIGlzIGRlZmluZWQgc2VwYXJhdGVseSB0byBl
YXNlIG92ZXJyaWRpbmcgaXQgaWYKICMgY2xhc3MtZGV2dXBzdHJlYW0gaXMgc2VsZWN0ZWQuCkBA
IC0yMDksNyArMzg2LDcgQEAgU1JDX1VSSTpjbGFzcy1kZXZ1cHN0cmVhbSA9ICJnaXQ6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXcKICMgUGluIHRoaXMgdG8g
dGhlIDIwMjIwNTA5IHJlbGVhc2UsIG92ZXJyaWRlIHRoaXMgaW4gbG9jYWwuY29uZgogU1JDUkVW
OmNsYXNzLWRldnVwc3RyZWFtID89ICJiMTljYmRjYTc4YWIyYWRmZDIxMGM5MWJlMTVhMjI1Njhl
OGI4Y2FlIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzBkZGZmYmJjZjMwZjJlMDE1YmRkZDVj
NmQzY2UxZjEzOTc2YjkwNmFjZWFiZGE0YTU3ZTNjNDFhMzE5MDcwMSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJlNzkzNzgzZTkyYWNiZGU1NDk5NjU1MjE0NjJkMWQxMzI3ODI3MzYwNjY0Y2YyNDJk
YmRhMDhmMDc1NjU0MzMxIgogCiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi4zNy4zCgo=

--===============7202609184199586243==--

