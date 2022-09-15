Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1E4C6FD19
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.10897.1663251514837393995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GqGeajrb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 0101018341840303-0b2daec8-9d75-4213-9067-f3d9092f7bca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rgRu7kx2VTEZ41axzTzBRn4p1FGtIPbGhFPwW5o6HrQ=;
	b=GqGeajrbxf2YBebZXvzprdWQpptHi694igQHe+b4fHe0NbqIRDa8oGWv5S1KCkZh
	DZzxX52FvZThPzHjSufZF3I8kF8Ep10Jp+fBSApYD5OCwTwoXpw9QklG0vgPaKIm7BC
	jkGcOsH7uxme/FlQl8adAnp03yf1f8NVUGbLf8+c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rgRu7kx2VTEZ41axzTzBRn4p1FGtIPbGhFPwW5o6HrQ=;
	b=gk6BjdGrRZJWVfWAuDKQDKv+FO+mNrVQO46uNXwq93fJLuo19tzUhEHH8nfIuXpd
	zS7P2fq3Fx4VGbBGBy7KvBkkqpaYacqUO9zXPzvCnYrp3mZt3p0qeafIjYenVtNQYiR
	alqHDmTFcK+G4vdr4QSiAH0Fb99mjALbTSflPs44=
Content-Type: multipart/mixed; boundary="===============8008159670571946403=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20220913 SUCCEEDED
Message-ID: 
 <0101018341840303-0b2daec8-9d75-4213-9067-f3d9092f7bca-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:34 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170752

--===============8008159670571946403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20220913* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20220708-20220913.patch
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
--===============8008159670571946403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: FILELIST: added "/lib/firmware/brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: FILELIST: added "/lib/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt /lib/firmware/brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: FILELIST: added "/lib/firmware/brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/dg2_guc_70.4.1.bin /lib/firmware/i915/dg2_dmc_ver2_07.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: FILELIST: removed "/lib/firmware/intel/ice/ddp/ice-1.3.28.0.pkg", added "/lib/firmware/intel/ice/ddp/ice-1.3.30.0.pkg"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/lib/firmware/LICENSE.cirrus"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/mellanox/mlxsw_spectrum-13.2010.3020.mfa2 /lib/firmware/mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg /lib/firmware/qcom/sc8280xp/LENOVO/21BX/adspr.jsn /lib/firmware/mellanox/lc_ini_bundle_2010_3020.bin /lib/firmware/amdgpu/gc_10_3_6_mec.bin /lib/firmware/mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg /lib/firmware/brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt /lib/firmware/amdgpu/psp_13_0_5_ta.bin /lib/firmware/amd-ucode/README /lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn /lib/firmware/qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn /lib/firmware/amdgpu/gc_10_3_6_rlc.bin /lib/firmware/mellanox/mlxsw_spectrum3-30.2010.3020.mfa2 /lib/firmware/amdgpu/gc_10_3_6_mec2.bin /lib/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn /lib/firmware/amdgpu/dcn_3_1_5_dmcub.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot.wmfw /lib/firmware/mellanox/mlxsw_spectrum2-29.2010.3020.mfa2 /li
 b/firmware/qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn /lib/firmware/amdgpu/gc_10_3_6_ce.bin /lib/firmware/amdgpu/gc_10_3_6_me.bin /lib/firmware/mellanox/mlxsw_spectrum2-29.2010.3146.mfa2 /lib/firmware/mellanox/mlxsw_spectrum-13.2010.3146.mfa2 /lib/firmware/mellanox/lc_ini_bundle_2010_3146.bin /lib/firmware/mediatek/sof/sof-mt8186.ri /lib/firmware/qcom/sc8280xp/LENOVO/21BX/cdspr.jsn /lib/firmware/amdgpu/sdma_5_2_6.bin /lib/firmware/amdgpu/psp_13_0_5_asd.bin /lib/firmware/qcom/sc8280xp/LENOVO/21BX/adspua.jsn /lib/firmware/mellanox/mlxsw_spectrum3-30.2010.3146.mfa2 /lib/firmware/amdgpu/psp_13_0_5_toc.bin /lib/firmware/amdgpu/vcn_3_1_2.bin /lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn /lib/firmware/cirrus/cs35l41-dsp1-spk-prot.bin /lib/firmware/amdgpu/gc_10_3_6_pfp.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 271439875 to 307482936 (+13%)
Changes to packages/all-poky-linux/linux-firmware (sysroot):
  /lib/firmware/brcm/brcmfmac43455-sdio.AW-CM256SM.txt changed type from symlink to file
  /lib/firmware/brcm/brcmfmac43455-sdio.AW-CM256SM.txt changed permissions from rwxrwxrwx to rw-r--r--
  /lib/firmware/intel/ice/ddp/ice.pkg changed symlink target from ice-1.3.28.0.pkg to ice-1.3.30.0.pkg
  /lib/firmware/intel/ice/ddp/ice-1.3.28.0.pkg moved to /lib/firmware/intel/ice/ddp/ice-1.3.30.0.pkg
  /lib/firmware/amdgpu/dcn_3_1_5_dmcub.bin was added
  /lib/firmware/amdgpu/gc_10_3_6_ce.bin was added
  /lib/firmware/amdgpu/gc_10_3_6_me.bin was added
  /lib/firmware/amdgpu/gc_10_3_6_mec2.bin was added
  /lib/firmware/amdgpu/gc_10_3_6_mec.bin was added
  /lib/firmware/amdgpu/gc_10_3_6_pfp.bin was added
  /lib/firmware/amdgpu/gc_10_3_6_rlc.bin was added
  /lib/firmware/amdgpu/psp_13_0_5_asd.bin was added
  /lib/firmware/amdgpu/psp_13_0_5_ta.bin was added
  /lib/firmware/amdgpu/psp_13_0_5_toc.bin was added
  /lib/firmware/amdgpu/sdma_5_2_6.bin was added
  /lib/firmware/amdgpu/vcn_3_1_2.bin was added
  /lib/firmware/amd-ucode/README was added
  /lib/firmware/brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt was added
  /lib/firmware/brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt was added
  /lib/firmware/brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt was added
  /lib/firmware/cirrus was added
  /lib/firmware/cirrus/cs35l41-dsp1-spk-prot.bin was added
  /lib/firmware/cirrus/cs35l41-dsp1-spk-prot.wmfw was added
  /lib/firmware/i915/dg2_dmc_ver2_07.bin was added
  /lib/firmware/i915/dg2_guc_70.4.1.bin was added
  /lib/firmware/LICENSE.cirrus was added
  /lib/firmware/mediatek/sof was added
  /lib/firmware/mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg was added
  /lib/firmware/mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg was added
  /lib/firmware/mediatek/sof/sof-mt8186.ri was added
  /lib/firmware/mellanox/lc_ini_bundle_2010_3020.bin was added
  /lib/firmware/mellanox/lc_ini_bundle_2010_3146.bin was added
  /lib/firmware/mellanox/mlxsw_spectrum-13.2010.3020.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum-13.2010.3146.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum2-29.2010.3020.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum2-29.2010.3146.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum3-30.2010.3020.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum3-30.2010.3146.mfa2 was added
  /lib/firmware/qcom/LENOVO was added
  /lib/firmware/qcom/LENOVO/21BX was added
  /lib/firmware/qcom/sc8280xp was added
  /lib/firmware/qcom/sc8280xp/LENOVO was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX/adspr.jsn was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX/adspua.jsn was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX/cdspr.jsn was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn was added

--===============8008159670571946403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20220708.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20220913.tar.xz"
packages/all-poky-linux/linux-firmware: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGSIZE changed from 414854 to 416655 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: FILELIST: added "/lib/firmware/brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGSIZE changed from 656628 to 658195 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: FILELIST: added "/lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt /lib/firmware/brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt /lib/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGSIZE changed from 624504 to 627603 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: FILELIST: added "/lib/firmware/brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 22114371 to 22506459 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/dg2_guc_70.4.1.bin /lib/firmware/i915/dg2_dmc_ver2_07.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGSIZE changed from 2388683 to 2392811 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 16383212 to 16433936 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGSIZE changed from 2118776 to 2127028 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: FILELIST: removed "/lib/firmware/intel/ice/ddp/ice-1.3.28.0.pkg", added "/lib/firmware/intel/ice/ddp/ice-1.3.30.0.pkg"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 144335 to 155681 (+8%)
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/lib/firmware/LICENSE.cirrus"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 1735900 to 1753268 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 188968 to 190374 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20220708 [default] to 20220913 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 271439875 to 307482936 (+13%)
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20220708" to "20220913"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/amdgpu/gc_10_3_6_ce.bin /lib/firmware/amdgpu/sdma_5_2_6.bin /lib/firmware/mellanox/mlxsw_spectrum-13.2010.3146.mfa2 /lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn /lib/firmware/cirrus/cs35l41-dsp1-spk-prot.wmfw /lib/firmware/qcom/sc8280xp/LENOVO/21BX/adspr.jsn /lib/firmware/mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg /lib/firmware/amd-ucode/README /lib/firmware/mellanox/mlxsw_spectrum3-30.2010.3146.mfa2 /lib/firmware/mediatek/sof/sof-mt8186.ri /lib/firmware/amdgpu/psp_13_0_5_toc.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot.bin /lib/firmware/mellanox/mlxsw_spectrum3-30.2010.3020.mfa2 /lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn /lib/firmware/amdgpu/gc_10_3_6_mec2.bin /lib/firmware/amdgpu/psp_13_0_5_ta.bin /lib/firmware/mellanox/mlxsw_spectrum-13.2010.3020.mfa2 /lib/firmware/amdgpu/gc_10_3_6_rlc.bin /lib/firmware/mellanox/mlxsw_spectrum2-29.2010.3020.mfa2 /lib/firmware/qc
 om/sc8280xp/LENOVO/21BX/battmgr.jsn /lib/firmware/amdgpu/gc_10_3_6_mec.bin /lib/firmware/mellanox/lc_ini_bundle_2010_3146.bin /lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn /lib/firmware/amdgpu/gc_10_3_6_pfp.bin /lib/firmware/mellanox/mlxsw_spectrum2-29.2010.3146.mfa2 /lib/firmware/brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt /lib/firmware/amdgpu/dcn_3_1_5_dmcub.bin /lib/firmware/amdgpu/psp_13_0_5_asd.bin /lib/firmware/amdgpu/vcn_3_1_2.bin /lib/firmware/mellanox/lc_ini_bundle_2010_3020.bin /lib/firmware/mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg /lib/firmware/qcom/sc8280xp/LENOVO/21BX/adspua.jsn /lib/firmware/qcom/sc8280xp/LENOVO/21BX/cdspr.jsn /lib/firmware/amdgpu/gc_10_3_6_me.bin /lib/firmware/qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20220708 [default] to 20220913 [default]
Changes to packages/all-poky-linux/linux-firmware (sysroot):
  /lib/firmware/brcm/brcmfmac43455-sdio.AW-CM256SM.txt changed type from symlink to file
  /lib/firmware/brcm/brcmfmac43455-sdio.AW-CM256SM.txt changed permissions from rwxrwxrwx to rw-r--r--
  /lib/firmware/intel/ice/ddp/ice.pkg changed symlink target from ice-1.3.28.0.pkg to ice-1.3.30.0.pkg
  /lib/firmware/intel/ice/ddp/ice-1.3.28.0.pkg moved to /lib/firmware/intel/ice/ddp/ice-1.3.30.0.pkg
  /lib/firmware/amdgpu/dcn_3_1_5_dmcub.bin was added
  /lib/firmware/amdgpu/gc_10_3_6_ce.bin was added
  /lib/firmware/amdgpu/gc_10_3_6_me.bin was added
  /lib/firmware/amdgpu/gc_10_3_6_mec2.bin was added
  /lib/firmware/amdgpu/gc_10_3_6_mec.bin was added
  /lib/firmware/amdgpu/gc_10_3_6_pfp.bin was added
  /lib/firmware/amdgpu/gc_10_3_6_rlc.bin was added
  /lib/firmware/amdgpu/psp_13_0_5_asd.bin was added
  /lib/firmware/amdgpu/psp_13_0_5_ta.bin was added
  /lib/firmware/amdgpu/psp_13_0_5_toc.bin was added
  /lib/firmware/amdgpu/sdma_5_2_6.bin was added
  /lib/firmware/amdgpu/vcn_3_1_2.bin was added
  /lib/firmware/amd-ucode/README was added
  /lib/firmware/brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt was added
  /lib/firmware/brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt was added
  /lib/firmware/brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt was added
  /lib/firmware/brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt was added
  /lib/firmware/cirrus was added
  /lib/firmware/cirrus/cs35l41-dsp1-spk-prot.bin was added
  /lib/firmware/cirrus/cs35l41-dsp1-spk-prot.wmfw was added
  /lib/firmware/i915/dg2_dmc_ver2_07.bin was added
  /lib/firmware/i915/dg2_guc_70.4.1.bin was added
  /lib/firmware/LICENSE.cirrus was added
  /lib/firmware/mediatek/sof was added
  /lib/firmware/mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg was added
  /lib/firmware/mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg was added
  /lib/firmware/mediatek/sof/sof-mt8186.ri was added
  /lib/firmware/mellanox/lc_ini_bundle_2010_3020.bin was added
  /lib/firmware/mellanox/lc_ini_bundle_2010_3146.bin was added
  /lib/firmware/mellanox/mlxsw_spectrum-13.2010.3020.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum-13.2010.3146.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum2-29.2010.3020.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum2-29.2010.3146.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum3-30.2010.3020.mfa2 was added
  /lib/firmware/mellanox/mlxsw_spectrum3-30.2010.3146.mfa2 was added
  /lib/firmware/qcom/LENOVO was added
  /lib/firmware/qcom/LENOVO/21BX was added
  /lib/firmware/qcom/sc8280xp was added
  /lib/firmware/qcom/sc8280xp/LENOVO was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX/adspr.jsn was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX/adspua.jsn was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX/cdspr.jsn was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn was added
  /lib/firmware/qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn was added

--===============8008159670571946403==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20220708-20220913.patch"

RnJvbSBiZjc5YzI0NmMwODMxYTk2NTFjYzk5NmVlYjIxODYxMmI0NGU5OTFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTI6MzE6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDIyMDcwOCAtPiAyMDIyMDkxMwoKLS0tCiAuLi4yMDIy
MDcwOC5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIyMDkxMy5iYn0gfCAzNzggKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgMzc2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyMjA3MDguYmIgPT4gbGludXgtZmlybXdhcmVfMjAyMjA5MTMuYmJ9ICg3OCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDIyMDcwOC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyMjA5MTMuYmIKc2ltaWxhcml0eSBpbmRleCA3OCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDIyMDcwOC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIyMDkxMy5iYgppbmRleCA5MWMzMmU0OWQ2Li40NjlhN2NmYTUzIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjIw
NzA4LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyMjA5MTMuYmIKQEAgLTEsMyArMSwzNzcgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtMjUxOCwxNyArMjUxOCwyOSBAQAorIyAgRmls
ZTogYW1kZ3B1L2FsZGViYXJhbl9zb3MuYmluCisjICBGaWxlOiBhbWRncHUvYWxkZWJhcmFuX3Rh
LmJpbgorIyAgRmlsZTogYW1kZ3B1L2FsZGViYXJhbl92Y24uYmluCisjICtGaWxlOiBhbWRncHUv
Z2NfMTBfM182X2NlLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzEwXzNfNl9tZS5iaW4KKyMgK0Zp
bGU6IGFtZGdwdS9nY18xMF8zXzZfbWVjLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzEwXzNfNl9t
ZWMyLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzEwXzNfNl9wZnAuYmluCisjICtGaWxlOiBhbWRn
cHUvZ2NfMTBfM182X3JsYy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMF8zXzdfY2UuYmluCisj
ICBGaWxlOiBhbWRncHUvZ2NfMTBfM183X21lLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzEwXzNf
N19tZWMuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTBfM183X21lYzIuYmluCisjICBGaWxlOiBh
bWRncHUvZ2NfMTBfM183X3BmcC5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMF8zXzdfcmxjLmJp
bgorIyArRmlsZTogYW1kZ3B1L2Rjbl8zXzFfNV9kbWN1Yi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9k
Y25fM18xXzZfZG1jdWIuYmluCisjICtGaWxlOiBhbWRncHUvcHNwXzEzXzBfNV9hc2QuYmluCisj
ICtGaWxlOiBhbWRncHUvcHNwXzEzXzBfNV90YS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9wc3BfMTNf
MF81X3RvYy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9wc3BfMTNfMF84X2FzZC5iaW4KKyMgIEZpbGU6
IGFtZGdwdS9wc3BfMTNfMF84X3RhLmJpbgorIyAgRmlsZTogYW1kZ3B1L3BzcF8xM18wXzhfdG9j
LmJpbgorIyArRmlsZTogYW1kZ3B1L3NkbWFfNV8yXzYuYmluCisjICBGaWxlOiBhbWRncHUvc2Rt
YV81XzJfNy5iaW4KKyMgK0ZpbGU6IGFtZGdwdS92Y25fM18xXzIuYmluCisjICAKKyMgIExpY2Vu
Y2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuYW1kZ3B1IGZvciBkZXRhaWxzLgorIyAg
CisjIEBAIC0yNzg1LDcgKzI3OTcsOSBAQAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFi
bGUuIFNlZSBMSUNFTkNFLmN5cHJlc3MgZm9yIGRldGFpbHMuCisjICAKKyMgK0ZpbGU6ICJicmNt
L2JyY21mbWFjNDMyNDFiNC1zZGlvLkludGVsIENvcnAuLVZBTExFWVZJRVcgQzAgUExBVEZPUk0u
dHh0IgorIyAgRmlsZTogImJyY20vYnJjbWZtYWM0MzMwLXNkaW8uUHJvd2lzZS1QVDMwMS50eHQi
CisjICtGaWxlOiAiYnJjbS9icmNtZm1hYzQzMzQwLXNkaW8uQVNVU1RlSyBDT01QVVRFUiBJTkMu
LVRGMTAzQ0UudHh0IgorIyAgRmlsZTogImJyY20vYnJjbWZtYWM0MzM0MC1zZGlvLm1lZWdvcGFk
LXQwOC50eHQiCisjICBGaWxlOiAiYnJjbS9icmNtZm1hYzQzMzQwLXNkaW8ucG92LXRhYi1wMTAw
NnctZGF0YS50eHQiCisjICBGaWxlOiAiYnJjbS9icmNtZm1hYzQzMzQwLXNkaW8ucHJlZGlhLWJh
c2ljLnR4dCIKKyMgQEAgLTI4MTUsMTUgKzI4MjksMTYgQEAKKyMgIExpbms6IGJyY20vYnJjbWZt
YWM0MzQ1NS1zZGlvLlJhc3BiZXJyeVwgUGlcIEZvdW5kYXRpb24tUmFzcGJlcnJ5XCBQaVwgQ29t
cHV0ZVwgTW9kdWxlXCA0LnR4dCAtPiBicmNtZm1hYzQzNDU1LXNkaW8ucmFzcGJlcnJ5cGksNC1t
b2RlbC1iLnR4dAorIyAgRmlsZTogImJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLk1JTklYLU5FTyBa
ODMtNC50eHQiCisjICBGaWxlOiAiYnJjbS9icmNtZm1hYzQzNTYtcGNpZS5ncGQtd2luLXBvY2tl
dC50eHQiCisjICtGaWxlOiAiYnJjbS9icmNtZm1hYzQzNTYtcGNpZS5YaWFvbWkgSW5jLU1pcGFk
Mi50eHQiCisjICBGaWxlOiBicmNtL2JyY21mbWFjNDM1Ni1zZGlvLkFQNjM1NlMudHh0CisjICBM
aW5rOiBicmNtL2JyY21mbWFjNDM1Ni1zZGlvLmZpcmVmbHksZmlyZWZseS1yazMzOTkudHh0IC0+
IGJyY21mbWFjNDM1Ni1zZGlvLkFQNjM1NlMudHh0CisjICBMaW5rOiBicmNtL2JyY21mbWFjNDM1
Ni1zZGlvLmtoYWRhcyx2aW0yLnR4dCAtPiBicmNtZm1hYzQzNTYtc2Rpby5BUDYzNTZTLnR4dAor
IyAgTGluazogYnJjbS9icmNtZm1hYzQzNTYtc2Rpby52YW1ycyxyb2NrOTYwLnR4dCAtPiBicmNt
Zm1hYzQzNTYtc2Rpby5BUDYzNTZTLnR4dAorIyAgRmlsZTogYnJjbS9icmNtZm1hYzQzNDU1LXNk
aW8uQVctQ00yNTZTTS50eHQKKyMgLUxpbms6IGJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLkFXLUNN
MjU2U00udHh0IC0+IGJyY21mbWFjNDM0NTUtc2Rpby5iZWFnbGUsYW01NzI5LWJlYWdsZWJvbmVh
aS50eHQKKyMgLUxpbms6IGJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLkFXLUNNMjU2U00udHh0IC0+
IGJyY21mbWFjNDM0NTUtc2Rpby5waW5lNjQscGluZWJvb2stcHJvLnR4dAorIyAtTGluazogYnJj
bS9icmNtZm1hYzQzNDU1LXNkaW8uQVctQ00yNTZTTS50eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlv
LnBpbmU2NCxwaW5lcGhvbmUtcHJvLnR4dAorIyAtTGluazogYnJjbS9icmNtZm1hYzQzNDU1LXNk
aW8uQVctQ00yNTZTTS50eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlvLnBpbmU2NCxxdWFydHo2NC1i
LnR4dAorIyArTGluazogYnJjbS9icmNtZm1hYzQzNDU1LXNkaW8uYmVhZ2xlLGFtNTcyOS1iZWFn
bGVib25lYWkudHh0IC0+IGJyY21mbWFjNDM0NTUtc2Rpby5BVy1DTTI1NlNNLnR4dAorIyArTGlu
azogYnJjbS9icmNtZm1hYzQzNDU1LXNkaW8ucGluZTY0LHBpbmVib29rLXByby50eHQgLT4gYnJj
bWZtYWM0MzQ1NS1zZGlvLkFXLUNNMjU2U00udHh0CisjICtMaW5rOiBicmNtL2JyY21mbWFjNDM0
NTUtc2Rpby5waW5lNjQscGluZXBob25lLXByby50eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlvLkFX
LUNNMjU2U00udHh0CisjICtMaW5rOiBicmNtL2JyY21mbWFjNDM0NTUtc2Rpby5waW5lNjQscXVh
cnR6NjQtYi50eHQgLT4gYnJjbWZtYWM0MzQ1NS1zZGlvLkFXLUNNMjU2U00udHh0CisjICAKKyMg
IExpY2VuY2U6IEdQTHYyLiBTZWUgR1BMLTIgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTM3Mzcs
OTIgKzM3NTIsOTIgQEAKKyMgIEZpbGU6IGludGVsL2lidC0xOC0xLmRkYworIyAgVmVyc2lvbjog
QlRfVGh1bmRlclBlYWtfQTBfQjBfUkVMMDIwMQorIyAgRmlsZTppbnRlbC9pYnQtMjAtMC0zLnNm
aQorIyAtVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNDQ1NjUKKyMgK1ZlcnNpb246IEJU
X0N5Y2xvbmVQZWFrX0EwX1JFTDQ3MTI0CisjICBGaWxlOmludGVsL2lidC0yMC0wLTMuZGRjCisj
IC1WZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw0NDU2NQorIyArVmVyc2lvbjogQlRfQ3lj
bG9uZVBlYWtfQTBfUkVMNDcxMjQKKyMgIEZpbGU6aW50ZWwvaWJ0LTIwLTEtMy5zZmkKKyMgLVZl
cnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDQ0NTY1CisjICtWZXJzaW9uOiBCVF9DeWNsb25l
UGVha19BMF9SRUw0NzEyNAorIyAgRmlsZTppbnRlbC9pYnQtMjAtMS0zLmRkYworIyAtVmVyc2lv
bjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNDQ1NjUKKyMgK1ZlcnNpb246IEJUX0N5Y2xvbmVQZWFr
X0EwX1JFTDQ3MTI0CisjICBGaWxlOmludGVsL2lidC0yMC0xLTQuc2ZpCisjIC1WZXJzaW9uOiBC
VF9DeWNsb25lUGVha19BMF9SRUw0NDU2NQorIyArVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBf
UkVMNDcxMjQKKyMgIEZpbGU6aW50ZWwvaWJ0LTIwLTEtNC5kZGMKKyMgLVZlcnNpb246IEJUX0N5
Y2xvbmVQZWFrX0EwX1JFTDQ0NTY1CisjICtWZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw0
NzEyNAorIyAgRmlsZTppbnRlbC9pYnQtMTktMC0wLnNmaQorIyAtVmVyc2lvbjogQlRfUXVhc2Fy
X1JFTDQ0NTY1CisjICtWZXJzaW9uOiBCVF9RdWFzYXJfUkVMNDcxMjQKKyMgIEZpbGU6aW50ZWwv
aWJ0LTE5LTAtMC5kZGMKKyMgLVZlcnNpb246IEJUX1F1YXNhcl9SRUw0NDU2NQorIyArVmVyc2lv
bjogQlRfUXVhc2FyX1JFTDQ3MTI0CisjICBGaWxlOmludGVsL2lidC0xOS0wLTEuc2ZpCisjIC1W
ZXJzaW9uOiBCVF9RdWFzYXJfUkVMNDQ1NjUKKyMgK1ZlcnNpb246IEJUX1F1YXNhcl9SRUw0NzEy
NAorIyAgRmlsZTppbnRlbC9pYnQtMTktMC0xLmRkYworIyAtVmVyc2lvbjogQlRfUXVhc2FyX1JF
TDQ0NTY1CisjICtWZXJzaW9uOiBCVF9RdWFzYXJfUkVMNDcxMjQKKyMgIEZpbGU6aW50ZWwvaWJ0
LTE5LTAtNC5zZmkKKyMgLVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw0NDU2NQorIyArVmVy
c2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDQ3MTI0CisjICBGaWxlOmludGVsL2lidC0xOS0wLTQu
ZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNDQ1NjUKKyMgK1ZlcnNpb246IEJU
X0hhcnJpc29uUGVha19SRUw0NzEyNAorIyAgRmlsZTppbnRlbC9pYnQtMTktMTYtNC5zZmkKKyMg
LVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw0NDU2NQorIyArVmVyc2lvbjogQlRfSGFycmlz
b25QZWFrX1JFTDQ3MTI0CisjICBGaWxlOmludGVsL2lidC0xOS0xNi00LmRkYworIyAtVmVyc2lv
bjogQlRfSGFycmlzb25QZWFrX1JFTDQ0NTY1CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtf
UkVMNDcxMjQKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTMyLTEuc2ZpCisjIC1WZXJzaW9uOiBCVF9I
YXJyaXNvblBlYWtfUkVMNDQ1NjUKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw0NzEy
NAorIyAgRmlsZTppbnRlbC9pYnQtMTktMzItMS5kZGMKKyMgLVZlcnNpb246IEJUX0hhcnJpc29u
UGVha19SRUw0NDU2NQorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDQ3MTI0CisjICBG
aWxlOmludGVsL2lidC0xOS0zMi0wLnNmaQorIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JF
TDQ0NTY1CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNDcxMjQKKyMgIEZpbGU6aW50
ZWwvaWJ0LTE5LTMyLTAuZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNDQ1NjUK
KyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw0NzEyNAorIyAgRmlsZTppbnRlbC9pYnQt
MTktMzItNC5zZmkKKyMgLVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw0NDU2NQorIyArVmVy
c2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDQ3MTI0CisjICBGaWxlOmludGVsL2lidC0xOS0zMi00
LmRkYworIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDQ0NTY1CisjICtWZXJzaW9uOiBC
VF9IYXJyaXNvblBlYWtfUkVMNDcxMjQKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTI0MC0xLnNmaQor
IyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDQ0NTY1CisjICtWZXJzaW9uOiBCVF9IYXJy
aXNvblBlYWtfUkVMNDcxMjQKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTI0MC0xLmRkYworIyAtVmVy
c2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDQ0NTY1CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBl
YWtfUkVMNDcxMjQKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTI0MC00LnNmaQorIyAtVmVyc2lvbjog
QlRfSGFycmlzb25QZWFrX1JFTDQ0NTY1CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVM
NDcxMjQKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTI0MC00LmRkYworIyAtVmVyc2lvbjogQlRfSGFy
cmlzb25QZWFrX1JFTDQ0NTY1CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNDcxMjQK
KyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDEtMDA0MS5zZmkKKyMgLVZlcnNpb246IEJUX1R5cGhvb25Q
ZWFrX1JFTDQ0OTE4CisjICtWZXJzaW9uOiBCVF9UeXBob29uUGVha19SRUw0NzQ4OQorIyAgRmls
ZTppbnRlbC9pYnQtMDA0MS0wMDQxLmRkYworIyAtVmVyc2lvbjogQlRfVHlwaG9vblBlYWtfUkVM
NDQ5MTgKKyMgK1ZlcnNpb246IEJUX1R5cGhvb25QZWFrX1JFTDQ3NDg5CisjICBGaWxlOmludGVs
L2lidC0wMDQwLTAwNDEuc2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9HZlAyX1JFTDQ0OTE4Cisj
ICtWZXJzaW9uOiBCVF9Tb2xhcl9HZlAyX1JFTDQ3NDg5CisjICBGaWxlOmludGVsL2lidC0wMDQw
LTAwNDEuZGRjCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9HZlAyX1JFTDQ0OTE4CisjICtWZXJzaW9u
OiBCVF9Tb2xhcl9HZlAyX1JFTDQ3NDg5CisjICBGaWxlOmludGVsL2lidC0xMDQwLTAwNDEuc2Zp
CisjIC1WZXJzaW9uOiBCVF9Tb2xhckZfR2ZQMl9SRUw0NDkxOAorIyArVmVyc2lvbjogQlRfU29s
YXJGX0dmUDJfUkVMNDc0ODkKKyMgIEZpbGU6aW50ZWwvaWJ0LTEwNDAtMDA0MS5kZGMKKyMgLVZl
cnNpb246IEJUX1NvbGFyRl9HZlAyX1JFTDQ0OTE4CisjICtWZXJzaW9uOiBCVF9Tb2xhckZfR2ZQ
Ml9SRUw0NzQ4OQorIyAgCisjICBGaWxlOmludGVsL2lidC0wMDQwLTEwMjAuc2ZpCisjIC1WZXJz
aW9uOiBCVF9Tb2xhcl9KZlAxX1JFTDQ0OTE4CisjICtWZXJzaW9uOiBCVF9Tb2xhcl9KZlAxX1JF
TDQ3NDg5CisjICBGaWxlOmludGVsL2lidC0wMDQwLTEwMjAuZGRjCisjIC1WZXJzaW9uOiBCVF9T
b2xhcl9KZlAxX1JFTDQ0OTE4CisjICtWZXJzaW9uOiBCVF9Tb2xhcl9KZlAxX1JFTDQ3NDg5Cisj
ICBGaWxlOmludGVsL2lidC0xMDQwLTEwMjAuc2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhckZfSmZQ
MV9SRUw0NDkxOAorIyArVmVyc2lvbjogQlRfU29sYXJGX0pmUDFfUkVMNDc0ODkKKyMgIEZpbGU6
aW50ZWwvaWJ0LTEwNDAtMTAyMC5kZGMKKyMgLVZlcnNpb246IEJUX1NvbGFyRl9KZlAxX1JFTDQ0
OTE4CisjICtWZXJzaW9uOiBCVF9Tb2xhckZfSmZQMV9SRUw0NzQ4OQorIyAgCisjICBGaWxlOmlu
dGVsL2lidC0wMDQwLTIxMjAuc2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9KZlAyX1JFTDQ0OTE4
CisjICtWZXJzaW9uOiBCVF9Tb2xhcl9KZlAyX1JFTDQ3NDg5CisjICBGaWxlOmludGVsL2lidC0w
MDQwLTIxMjAuZGRjCisjIC1WZXJzaW9uOiBCVF9Tb2xhcl9KZlAyX1JFTDQ0OTE4CisjICtWZXJz
aW9uOiBCVF9Tb2xhcl9KZlAyX1JFTDQ3NDg5CisjICBGaWxlOmludGVsL2lidC0xMDQwLTIxMjAu
c2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhckZfSmZQMl9SRUw0NDkxOAorIyArVmVyc2lvbjogQlRf
U29sYXJGX0pmUDJfUkVMNDc0ODkKKyMgIEZpbGU6aW50ZWwvaWJ0LTEwNDAtMjEyMC5kZGMKKyMg
LVZlcnNpb246IEJUX1NvbGFyRl9KZlAyX1JFTDQ0OTE4CisjICtWZXJzaW9uOiBCVF9Tb2xhckZf
SmZQMl9SRUw0NzQ4OQorIyAgCisjICBGaWxlOmludGVsL2lidC0wMDQwLTQxNTAuc2ZpCisjIC1W
ZXJzaW9uOiBCVF9Tb2xhcl9IclAyX1JFTDQ0OTE4CisjICtWZXJzaW9uOiBCVF9Tb2xhcl9IclAy
X1JFTDQ3NDg5CisjICBGaWxlOmludGVsL2lidC0wMDQwLTQxNTAuZGRjCisjIC1WZXJzaW9uOiBC
VF9Tb2xhcl9IclAyX1JFTDQ0OTE4CisjICtWZXJzaW9uOiBCVF9Tb2xhcl9IclAyX1JFTDQ3NDg5
CisjICBGaWxlOmludGVsL2lidC0xMDQwLTQxNTAuc2ZpCisjIC1WZXJzaW9uOiBCVF9Tb2xhckZf
SHJQMl9SRUw0NDkxOAorIyArVmVyc2lvbjogQlRfU29sYXJGX0hyUDJfUkVMNDc0ODkKKyMgIEZp
bGU6aW50ZWwvaWJ0LTEwNDAtNDE1MC5kZGMKKyMgLVZlcnNpb246IEJUX1NvbGFyRl9IclAyX1JF
TDQ0OTE4CisjICtWZXJzaW9uOiBCVF9Tb2xhckZfSHJQMl9SRUw0NzQ4OQorIyAgCisjICBMaWNl
bmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmlidF9maXJtd2FyZSBmb3IgZGV0YWls
cworIyAgCisjIEBAIC0zOTU3LDYgKzM5NzIsNyBAQAorIyAgVmVyc2lvbjogMjAyMi0wNC0wOAor
IyAgRmlsZTogYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTloLmJpbgorIyAgVmVyc2lvbjog
MjAyMi0wNC0wOAorIyArRmlsZTogYW1kLXVjb2RlL1JFQURNRQorIyAgCisjICBMaWNlbnNlOiBS
ZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFtZC11Y29kZSBmb3IgZGV0YWlscworIyAgCisj
IEBAIC00NjgyLDggKzQ2OTgsMTQgQEAKKyMgIEZpbGU6IGk5MTUvZGcyX2d1Y183MC4xLjIuYmlu
CisjICBWZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuMS4yIGZvciBERzIKKyMgIAorIyArRmls
ZTogaTkxNS9kZzJfZ3VjXzcwLjQuMS5iaW4KKyMgK1ZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3
MC40LjEgZm9yIERHMgorIyArCisjICBGaWxlOiBpOTE1L2RnMl9kbWNfdmVyMl8wNi5iaW4KKyMg
IFZlcnNpb246IERNQyBBUEkvQVBCIHZlciAyIHJlbGVhc2UgNiBmb3IgREcyCisjICsKKyMgK0Zp
bGU6IGk5MTUvZGcyX2RtY192ZXIyXzA3LmJpbgorIyArVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVy
IDIgcmVsZWFzZSA3IGZvciBERzIKKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBT
ZWUgTElDRU5TRS5pOTE1IGZvciBkZXRhaWxzCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyBAQCAt
NTE1NCw0OSArNTE3NiwyOSBAQAorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIC1E
cml2ZXI6IG10ay12cHUgLSBNZWRpYXRlayBWUFUgdmlkZW8gcHJvY2Vzc2luZyB1bml0IGRyaXZl
cgorIyArRHJpdmVyOiBtdGstdnB1IC0gTWVkaWFUZWsgVlBVIHZpZGVvIHByb2Nlc3NpbmcgdW5p
dCBkcml2ZXIKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvbXQ4MTczL3ZwdV9kLmJpbgorIyAgRmls
ZTogbWVkaWF0ZWsvbXQ4MTczL3ZwdV9wLmJpbgorIyAgTGluazogdnB1X2QuYmluIC0+IG1lZGlh
dGVrL210ODE3My92cHVfZC5iaW4KKyMgIExpbms6IHZwdV9wLmJpbiAtPiBtZWRpYXRlay9tdDgx
NzMvdnB1X3AuYmluCisjICAKKyMgLUxpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4KKyMgLQorIyAt
TWVkaWFUZWsgSW5jLiBncmFudHMgcGVybWlzc2lvbiB0byB1c2UgYW5kIHJlZGlzdHJpYnV0ZSBh
Zm9yZW1lbnRpb25lZCBmaXJtd2FyZQorIyAtZmlsZXMgZm9yIHRoZSB1c2Ugd2l0aCBkZXZpY2Vz
IGNvbnRhaW5pbmcgTWVkaWFUZWsgY2hpcHNldHMsIGJ1dCBub3QgYXMgcGFydCBvZgorIyAtdGhl
IExpbnV4IGtlcm5lbCBvciBpbiBhbnkgb3RoZXIgZm9ybSB3aGljaCB3b3VsZCByZXF1aXJlIHRo
ZXNlIGZpbGVzIHRoZW1zZWx2ZXMKKyMgLXRvIGJlIGNvdmVyZWQgYnkgdGhlIHRlcm1zIG9mIHRo
ZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBvciB0aGUgR05VIExlc3NlcgorIyAtR2VuZXJh
bCBQdWJsaWMgTGljZW5zZS4KKyMgLQorIyAtVGhlc2UgZmlybXdhcmUgZmlsZXMgYXJlIGRpc3Ry
aWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgdGhleSB3aWxsIGJlIHVzZWZ1bCwgYnV0CisjIC1hcmUg
cHJvdmlkZWQgV0lUSE9VVCBBTlkgV0FSUkFOVFksIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQg
VE8gSU1QTElFRCBXQVJSQU5UWQorIyAtT0YgTUVSQ0hBTlRBQklMSVRZIE9SIEZJVE5FU1MgRk9S
IEEgUEFSVElDVUxBUiBQVVJQT1NFLgorIyAtCisjIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAtCisj
IC1Ecml2ZXI6IG10a19zY3AgLSBNZWRpYXRlayBTQ1AgU3lzdGVtIENvbnRyb2wgUHJvY2Vzc2lu
ZyBEcml2ZXIKKyMgK0xpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0
ZWsgZm9yIGRldGFpbHMuCisjICsKKyMgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjICsKKyMgK0RyaXZl
cjogbXRrX3NjcCAtIE1lZGlhVGVrIFNDUCBTeXN0ZW0gQ29udHJvbCBQcm9jZXNzaW5nIERyaXZl
cgorIyAgCisjICBGaWxlOiBtZWRpYXRlay9tdDgxODMvc2NwLmltZworIyAtVmVyc2lvbjogdjIu
MC4yNzQ1CisjICtWZXJzaW9uOiB2Mi4wLjEzMzI0CisjICBGaWxlOiBtZWRpYXRlay9tdDgxODYv
c2NwLmltZworIyAgVmVyc2lvbjogdjAuMC42CisjICBGaWxlOiBtZWRpYXRlay9tdDgxOTIvc2Nw
LmltZworIyAtVmVyc2lvbjogdjIuMC44NTM3CisjICtWZXJzaW9uOiB2Mi4wLjg1NDgKKyMgIEZp
bGU6IG1lZGlhdGVrL210ODE5NS9zY3AuaW1nCisjIC1WZXJzaW9uOiB2MTQ0NTQuOC4wCisjIC0K
KyMgLUxpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4KKyMgLQorIyAtTWVkaWFUZWsgSW5jLiBncmFu
dHMgcGVybWlzc2lvbiB0byB1c2UgYW5kIHJlZGlzdHJpYnV0ZSBhZm9yZW1lbnRpb25lZCBmaXJt
d2FyZQorIyAtZmlsZXMgZm9yIHRoZSB1c2Ugd2l0aCBkZXZpY2VzIGNvbnRhaW5pbmcgTWVkaWFU
ZWsgY2hpcHNldHMsIGJ1dCBub3QgYXMgcGFydCBvZgorIyAtdGhlIExpbnV4IGtlcm5lbCBvciBp
biBhbnkgb3RoZXIgZm9ybSB3aGljaCB3b3VsZCByZXF1aXJlIHRoZXNlIGZpbGVzIHRoZW1zZWx2
ZXMKKyMgLXRvIGJlIGNvdmVyZWQgYnkgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZSBvciB0aGUgR05VIExlc3NlcgorIyAtR2VuZXJhbCBQdWJsaWMgTGljZW5zZS4K
KyMgLQorIyAtVGhlc2UgZmlybXdhcmUgZmlsZXMgYXJlIGRpc3RyaWJ1dGVkIGluIHRoZSBob3Bl
IHRoYXQgdGhleSB3aWxsIGJlIHVzZWZ1bCwgYnV0CisjIC1hcmUgcHJvdmlkZWQgV0lUSE9VVCBB
TlkgV0FSUkFOVFksIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gSU1QTElFRCBXQVJSQU5U
WQorIyAtT0YgTUVSQ0hBTlRBQklMSVRZIE9SIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQ
T1NFLgorIyArVmVyc2lvbjogdjIuMC4xMzMyNAorIyArCisjICtMaWNlbmNlOiBSZWRpc3RyaWJ1
dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjICAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQorIyAgCisjIEBAIC01NjA1LDYgKzU2MDcsNyBAQAorIyAgRmlsZTogcWNvbS9h
NjYwX3NxZS5mdworIyAgRmlsZTogcWNvbS9sZWlhX3BmcF80NzAuZncKKyMgIEZpbGU6IHFjb20v
bGVpYV9wbTRfNDcwLmZ3CisjICtGaWxlOiBxY29tL3NjODI4MHhwL0xFTk9WTy8yMUJYL3FjZHhr
bXN1YzgyODAubWJuCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VO
U0UucWNvbSBhbmQgcWNvbS9OT1RJQ0UudHh0IGZvciBkZXRhaWxzCisjICAKKyMgQEAgLTU2MzEs
NiArNTYzNCwxNCBAQAorIyAgRmlsZTogcWNvbS9zbTgyNTAvYWRzcHVhLmpzbgorIyAgRmlsZTog
cWNvbS9zbTgyNTAvY2RzcC5tYm4KKyMgIEZpbGU6IHFjb20vc204MjUwL2Nkc3ByLmpzbgorIyAr
RmlsZTogcWNvbS9zYzgyODB4cC9MRU5PVk8vMjFCWC9hZHNwci5qc24KKyMgK0ZpbGU6IHFjb20v
c2M4MjgweHAvTEVOT1ZPLzIxQlgvYWRzcHVhLmpzbgorIyArRmlsZTogcWNvbS9zYzgyODB4cC9M
RU5PVk8vMjFCWC9iYXR0bWdyLmpzbgorIyArRmlsZTogcWNvbS9zYzgyODB4cC9MRU5PVk8vMjFC
WC9jZHNwci5qc24KKyMgK0ZpbGU6IHFjb20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvcWNhZHNwODI4
MC5tYm4KKyMgK0ZpbGU6IHFjb20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvcWNjZHNwODI4MC5tYm4K
KyMgK0ZpbGU6IHFjb20vc2M4MjgweHAvTEVOT1ZPLzIxQlgvcWNzbHBpODI4MC5tYm4KKyMgK0xp
bms6IHFjb20vTEVOT1ZPLzIxQlggLT4gLi4vc2M4MjgweHAvTEVOT1ZPLzIxQlgKKyMgIAorIyAg
TGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5xY29tIGFuZCBxY29tL05PVElD
RS50eHQgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtNTcyMCw2ICs1NzMxLDE0IEBACisjICBGaWxl
OiBtZWxsYW5veC9tbHhzd19zcGVjdHJ1bTItMjkuMjAxMC4xNTAyLm1mYTIKKyMgIEZpbGU6IG1l
bGxhbm94L21seHN3X3NwZWN0cnVtMy0zMC4yMDEwLjE1MDIubWZhMgorIyAgRmlsZTogbWVsbGFu
b3gvbGNfaW5pX2J1bmRsZV8yMDEwXzE1MDIuYmluCisjICtGaWxlOiBtZWxsYW5veC9tbHhzd19z
cGVjdHJ1bS0xMy4yMDEwLjMwMjAubWZhMgorIyArRmlsZTogbWVsbGFub3gvbWx4c3dfc3BlY3Ry
dW0yLTI5LjIwMTAuMzAyMC5tZmEyCisjICtGaWxlOiBtZWxsYW5veC9tbHhzd19zcGVjdHJ1bTMt
MzAuMjAxMC4zMDIwLm1mYTIKKyMgK0ZpbGU6IG1lbGxhbm94L2xjX2luaV9idW5kbGVfMjAxMF8z
MDIwLmJpbgorIyArRmlsZTogbWVsbGFub3gvbWx4c3dfc3BlY3RydW0tMTMuMjAxMC4zMTQ2Lm1m
YTIKKyMgK0ZpbGU6IG1lbGxhbm94L21seHN3X3NwZWN0cnVtMi0yOS4yMDEwLjMxNDYubWZhMgor
IyArRmlsZTogbWVsbGFub3gvbWx4c3dfc3BlY3RydW0zLTMwLjIwMTAuMzE0Ni5tZmEyCisjICtG
aWxlOiBtZWxsYW5veC9sY19pbmlfYnVuZGxlXzIwMTBfMzE0Ni5iaW4KKyMgIAorIyAgTGljZW5j
ZToKKyMgICBDb3B5cmlnaHQgKGMpIDIwMTctMjAyMCBNZWxsYW5veCBUZWNobm9sb2dpZXMsIEx0
ZC4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgQEAgLTU4MTgsOCArNTgzNyw4IEBACisjICAKKyMg
IERyaXZlcjogaWNlIC0gSW50ZWwoUikgRXRoZXJuZXQgQ29ubmVjdGlvbiBFODAwIFNlcmllcwor
IyAgCisjIC1GaWxlOiBpbnRlbC9pY2UvZGRwL2ljZS0xLjMuMjguMC5wa2cKKyMgLUxpbms6IGlu
dGVsL2ljZS9kZHAvaWNlLnBrZyAtPiBpY2UtMS4zLjI4LjAucGtnCisjICtGaWxlOiBpbnRlbC9p
Y2UvZGRwL2ljZS0xLjMuMzAuMC5wa2cKKyMgK0xpbms6IGludGVsL2ljZS9kZHAvaWNlLnBrZyAt
PiBpY2UtMS4zLjMwLjAucGtnCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2Vl
IExJQ0VOU0UuaWNlIGZvciBkZXRhaWxzCisjICAKKyMgQEAgLTU5MTksMyArNTkzOCwzMSBAQAor
IyAgVmVyc2lvbjogMS4zLjEKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUg
TElDRU5TRS5hbXBoaW9uX3ZwdSBmb3IgZGV0YWlscworIyArCisjICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KKyMgKworIyArRHJpdmVyOiBjczM1bDQxX2hkYSAtIENTMzVsNDEgQUxTQSBIREEgYXVkaW8g
ZHJpdmVyCisjICsKKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3Qud21mdwor
IyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC5iaW4KKyMgKworIyArTGljZW5z
ZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5jaXJydXMgZm9yIGRldGFpbHMuCisjICsK
KyMgK1VzZSBvZiBDaXJydXMgTG9naWMgZHJpdmVycywgZmlybXdhcmUgYW5kIG90aGVyIG1hdGVy
aWFscyBpcyBwZXJtaXR0ZWQKKyMgK29ubHkgaW4gY29ubmVjdGlvbiB3aXRoIENpcnJ1cyBMb2dp
YyBoYXJkd2FyZSBwcm9kdWN0cy4KKyMgKworIyArQ29weXJpZ2h0IMKpIDIwMjIgQ2lycnVzIExv
Z2ljLCBJbmMuIGFuZCBDaXJydXMgTG9naWMgSW50ZXJuYXRpb25hbAorIyArU2VtaWNvbmR1Y3Rv
ciBMdGQuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisjICsKKyMgKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQor
IyArCisjICtEcml2ZXI6IG10ay1zb2YgLSBNZWRpYVRlayBTb3VuZCBPcGVuIEZpcm13YXJlIGRy
aXZlcgorIyArCisjICtGaWxlOiBtZWRpYXRlay9zb2Yvc29mLW10ODE4Ni5yaQorIyArRmlsZTog
bWVkaWF0ZWsvc29mL3NvZi1tdDgxODYtbXQ2MzY2LWRhNzIxOS1tYXg5ODM1Ny50cGxnCisjICtG
aWxlOiBtZWRpYXRlay9zb2Yvc29mLW10ODE4Ni1tdDYzNjYtcnQxMDE5LXJ0NTY4MnMudHBsZwor
IyArVmVyc2lvbjogdjAuMi4wCisjICsKKyMgK0xpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2Vl
IExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICsKKyMgKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CisjIAorIworCiBTVU1NQVJZID0gIkZpcm13YXJlIGZpbGVzIGZvciB1c2Ugd2l0aCBMaW51eCBr
ZXJuZWwiCiBIT01FUEFHRSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnLyIKIERFU0NSSVBUSU9O
ID0gIkxpbnV4IGZpcm13YXJlIGlzIGEgcGFja2FnZSBkaXN0cmlidXRlZCBhbG9uZ3NpZGUgdGhl
IExpbnV4IGtlcm5lbCBcCkBAIC0xMjgsNyArNTAyLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5DRS5BYmlsaXM7bWQ1PWI1ZWUzZjQxMDc4MGU1NjcxMWFkNDhlYWRjMjJiOGJj
IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM0MDAwO21kNT0wZmY1MWQy
ZGM0OWZjZTA0ODE0YzkxNTUwODEwOTJmMCBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9M
SUNFTkNFLnhjNTAwMDttZDU9MWUxNzBjMTMxNzUzMjNjMzJjN2Y0ZDA5OThkNTNmNjYgXAogICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzUwMDBjO21kNT0xMmIwMmVmYTMwNDlk
YjY1ZDUyNGFlYjQxOGRkODdjYSBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7
bWQ1PSR7V0hFTkNFX0NIS1NVTX0gXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNF
O21kNT05OGVjYzNkMzIyM2RmN2ViZGMyM2IwZWM1NmFhZmIyMCBcCiAgICAgICAgICAgICAgICAg
ICAgICIKICMgV0hFTkNFIGNoZWNrc3VtIGlzIGRlZmluZWQgc2VwYXJhdGVseSB0byBlYXNlIG92
ZXJyaWRpbmcgaXQgaWYKICMgY2xhc3MtZGV2dXBzdHJlYW0gaXMgc2VsZWN0ZWQuCkBAIC0yMDks
NyArNTgzLDcgQEAgU1JDX1VSSTpjbGFzcy1kZXZ1cHN0cmVhbSA9ICJnaXQ6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXcKICMgUGluIHRoaXMgdG8gdGhlIDIw
MjIwNTA5IHJlbGVhc2UsIG92ZXJyaWRlIHRoaXMgaW4gbG9jYWwuY29uZgogU1JDUkVWOmNsYXNz
LWRldnVwc3RyZWFtID89ICJiMTljYmRjYTc4YWIyYWRmZDIxMGM5MWJlMTVhMjI1NjhlOGI4Y2Fl
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGFiZWM4MjdhMDM1YzgyYmRjYWJkZjgyYWEzN2Rl
ZDI0N2JjNjgyZWYwNTg2MWJkNDA5ZWE2ZjQ3N2JhYjgxZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIyNmZkMDBmMmQ4ZTk2YzRhZjZmNDQyNjlhNmI4OTNlYjg1NzI1MzA0NGY3NWFkMjhlZjY3MDZh
MjI1MGNkOGU5IgogCiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi4zMS4xCgo=

--===============8008159670571946403==--

