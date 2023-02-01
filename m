Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5D6C678DB
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.30001.1675272854585881066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DmEOAF2T;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101860e0b29e1-6faef504-5a04-477a-8ea0-3b4b004161a3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272858;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YcbA783BZYNiCw6Qilo8zaqetJPQcuYR5F3cuSifCrs=;
	b=DmEOAF2Tx00iRTOmo7wYEWzeo8yICKDdnK2UzGoM9SvRco9DTnoMu6hsTf+YcGDa
	d0IbzL3PO6s58C5j/dtg0zHg4RD/xGfbf8e9L5gODzdcEVMsexzd3Ipum+E9s9IwhpU
	NXL9fbZ9l8m8EfMMUkkp0vrPan5Z6xtNby/TvHi4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272858;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YcbA783BZYNiCw6Qilo8zaqetJPQcuYR5F3cuSifCrs=;
	b=bdRNUlwC4ICXz+Wg/wRzZrGxW2RoimXoslssICIWqGwFUBPY0v7rx/SuOZqKX8Pi
	bPBozzu9F7f0XV4PJlS2RBpXVY/fG0q10vz5mmmrM4n7HkhWXGl8+814qsVdbqu05QY
	gfalv7jpQLRkEh6WgZqH8cn2PScJBfuti9kMrPD8=
Content-Type: multipart/mixed; boundary="===============1310256369404029785=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20230117 SUCCEEDED
Message-ID: <010101860e0b29e1-6faef504-5a04-477a-8ea0-3b4b004161a3-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176641

--===============1310256369404029785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20230117* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20221214-20230117.patch
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
--===============1310256369404029785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20221214.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230117.tar.xz"
packages/all-poky-linux/linux-firmware: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 69094574 to 72109590 (+4%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/lib/firmware/amdgpu/gc_11_0_2_mes.bin /lib/firmware/amdgpu/gc_11_0_2_imu.bin /lib/firmware/amdgpu/gc_11_0_2_mes1.bin /lib/firmware/amdgpu/sdma_6_0_2.bin /lib/firmware/amdgpu/vcn_4_0_4.bin /lib/firmware/amdgpu/psp_13_0_7_sos.bin /lib/firmware/amdgpu/gc_11_0_2_mec.bin /lib/firmware/amdgpu/smu_13_0_7.bin /lib/firmware/amdgpu/gc_11_0_2_me.bin /lib/firmware/amdgpu/gc_11_0_2_rlc.bin /lib/firmware/amdgpu/gc_11_0_2_pfp.bin /lib/firmware/amdgpu/dcn_3_2_1_dmcub.bin /lib/firmware/amdgpu/psp_13_0_7_ta.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGSIZE changed from 203500 to 204108 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: FILELIST: added "/lib/firmware/brcm/brcmfmac43362-sdio.kobo,tolino-shine2hd.txt /lib/firmware/brcm/brcmfmac43362-sdio.WC121.txt /lib/firmware/brcm/brcmfmac43362-sdio.kobo,aura.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGSIZE changed from 2600382 to 2601222 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGSIZE changed from 2398607 to 2400659 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 16606608 to 16649648 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 209987596 to 221488336 (+5%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/lib/firmware/iwlwifi-ty-a0-gf-a0-79.ucode /lib/firmware/iwlwifi-so-a0-hr-b0-79.ucode /lib/firmware/iwlwifi-so-a0-gf-a0-78.ucode /lib/firmware/iwlwifi-so-a0-gf-a0-79.ucode /lib/firmware/iwlwifi-so-a0-gf4-a0-79.ucode /lib/firmware/iwlwifi-so-a0-gf4-a0-78.ucode /lib/firmware/iwlwifi-ty-a0-gf-a0-78.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 157939 to 159479 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/lib/firmware/LICENSE.qcom_yamato"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 1960217 to 2155397 (+10%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: FILELIST: added "/lib/firmware/qca/hpbtfw21.tlv /lib/firmware/qca/hpnv21g.bin /lib/firmware/qca/hpnv21g.302 /lib/firmware/qca/hpnv21g.301 /lib/firmware/qca/hpnv21.bin /lib/firmware/qca/hpnv21.302 /lib/firmware/qca/hpnv21.301"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 204929 to 206748 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20221214 [default] to 20230117 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 257851634 to 257899414 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20221214" to "20230117"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/lib/firmware/cxgb4/t5fw-1.27.0.0.bin /lib/firmware/cxgb4/t6fw-1.27.0.0.bin /lib/firmware/cxgb4/t4fw-1.27.0.0.bin", added "/lib/firmware/cxgb4/t6fw-1.27.1.0.bin /lib/firmware/qcom/yamato_pm4.fw /lib/firmware/cxgb4/t4fw-1.27.1.0.bin /lib/firmware/cxgb4/t5fw-1.27.1.0.bin /lib/firmware/qcom/yamato_pfp.fw"

--===============1310256369404029785==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20221214-20230117.patch"

RnJvbSBlNjhiYjhhYTFjZjg1N2NmMjYxOTc3MTgxYjk4NmI2Y2ZjZTRkMjk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNjowNToxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
bnV4LWZpcm13YXJlOiB1cGdyYWRlIDIwMjIxMjE0IC0+IDIwMjMwMTE3CgotLS0KIC4uLjIwMjIx
MjE0LmJiID0+IGxpbnV4LWZpcm13YXJlXzIwMjMwMTE3LmJifSB8IDM5MyArKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzOTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL3tsaW51eC1maXJtd2Fy
ZV8yMDIyMTIxNC5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIzMDExNy5iYn0gKDgxJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJl
XzIwMjIxMjE0LmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1m
aXJtd2FyZV8yMDIzMDExNy5iYgpzaW1pbGFyaXR5IGluZGV4IDgxJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjIxMjE0LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13
YXJlXzIwMjMwMTE3LmJiCmluZGV4IGMyMzU0ZTYyN2YuLmU1MWZmNTA1OTcgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVfMjAyMjEy
MTQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIzMDExNy5iYgpAQCAtMSwzICsxLDM5MCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IExJQ0VOU0UuYW1kZ3B1CisjICsrKyBMSUNFTlNFLmFtZGdwdQorIyBAQCAtMSw0ICsxLDQgQEAK
KyMgLUNvcHlyaWdodCAoQykgMjAyMiAgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLiBBbGwg
cmlnaHRzIHJlc2VydmVkLgorIyArQ29weXJpZ2h0IChDKSAyMDIzICBBZHZhbmNlZCBNaWNybyBE
ZXZpY2VzLCBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjICAKKyMgIFJFRElTVFJJQlVUSU9O
OiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGFueSBsaWNlbnNlIGZlZXMs
CisjICB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhIGNvcHkgb2YgdGhpcyBtaWNyb2NvZGUgKHRo
ZSAiU29mdHdhcmUiKSwgdG8KKyMgLS0tIFdIRU5DRQorIyArKysgV0hFTkNFCisjIEBAIC01MzYs
MTQgKzUzNiwxNCBAQAorIyAgCisjICBGaWxlOiBjeGdiNC90NGZ3LTEuMTQuNC4wLmJpbgorIyAg
RmlsZTogY3hnYjQvdDRmdy0xLjE1LjM3LjAuYmluCisjIC1GaWxlOiBjeGdiNC90NGZ3LTEuMjcu
MC4wLmJpbgorIyAtTGluazogY3hnYjQvdDRmdy5iaW4gLT4gdDRmdy0xLjI3LjAuMC5iaW4KKyMg
K0ZpbGU6IGN4Z2I0L3Q0ZnctMS4yNy4xLjAuYmluCisjICtMaW5rOiBjeGdiNC90NGZ3LmJpbiAt
PiB0NGZ3LTEuMjcuMS4wLmJpbgorIyAgRmlsZTogY3hnYjQvdDVmdy0xLjE0LjQuMC5iaW4KKyMg
IEZpbGU6IGN4Z2I0L3Q1ZnctMS4xNS4zNy4wLmJpbgorIyAtRmlsZTogY3hnYjQvdDVmdy0xLjI3
LjAuMC5iaW4KKyMgLUxpbms6IGN4Z2I0L3Q1ZncuYmluIC0+IHQ1ZnctMS4yNy4wLjAuYmluCisj
IC1GaWxlOiBjeGdiNC90NmZ3LTEuMjcuMC4wLmJpbgorIyAtTGluazogY3hnYjQvdDZmdy5iaW4g
LT4gdDZmdy0xLjI3LjAuMC5iaW4KKyMgK0ZpbGU6IGN4Z2I0L3Q1ZnctMS4yNy4xLjAuYmluCisj
ICtMaW5rOiBjeGdiNC90NWZ3LmJpbiAtPiB0NWZ3LTEuMjcuMS4wLmJpbgorIyArRmlsZTogY3hn
YjQvdDZmdy0xLjI3LjEuMC5iaW4KKyMgK0xpbms6IGN4Z2I0L3Q2ZncuYmluIC0+IHQ2ZnctMS4y
Ny4xLjAuYmluCisjICBGaWxlOiBjeGdiNC9hcTEyMDJfZncuY2xkCisjICBGaWxlOiBjeGdiNC9i
Y204NDgzLmJpbgorIyAgRmlsZTogY3hnYjQvY29uZmlncy90NC1jb25maWctZGVmYXVsdC50eHQK
KyMgQEAgLTg4MSw3ICs4ODEsNyBAQAorIyAgVmVyc2lvbjogNDMuOTVlYjRlOTcuMAorIyAgCisj
ICBGaWxlOiBpd2x3aWZpLTkwMDAtcHUtYjAtamYtYjAtNDYudWNvZGUKKyMgLVZlcnNpb246IDQ2
LjUwZmRiNDJmLjAKKyMgK1ZlcnNpb246IDQ2LmVhMzcyOGVlLjAKKyMgIAorIyAgRmlsZTogaXds
d2lmaS05MjYwLXRoLWIwLWpmLWIwLTMzLnVjb2RlCisjICBWZXJzaW9uOiAzMy42MTAyOTQuMAor
IyBAQCAtODk5LDcgKzg5OSw3IEBACisjICBWZXJzaW9uOiA0My45NWViNGU5Ny4wCisjICAKKyMg
IEZpbGU6IGl3bHdpZmktOTI2MC10aC1iMC1qZi1iMC00Ni51Y29kZQorIyAtVmVyc2lvbjogNDYu
NTBmZGI0MmYuMAorIyArVmVyc2lvbjogNDYuZWEzNzI4ZWUuMAorIyAgCisjICBGaWxlOiBpd2x3
aWZpLWNjLWEwLTQ2LnVjb2RlCisjICBWZXJzaW9uOiA0Ni4zY2ZhYjhkYS4wCisjIEBAIC0xMjkz
LDIyICsxMjkzLDIyIEBACisjICBWZXJzaW9uOiA3NC5hNWU5NTg4Yi4wCisjICAKKyMgIEZpbGU6
IGl3bHdpZmktY2MtYTAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LmY5MmI1ZmVkLjAKKyMgK1Zl
cnNpb246IDc0LjJkZGE4ODBkLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1RdS1iMC1oci1iMC03
Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyArVmVyc2lvbjogNzQuMmRkYTg4
MGQuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLVF1LWIwLWpmLWIwLTc3LnVjb2RlCisjIC1WZXJz
aW9uOiA3NC5mOTJiNWZlZC4wCisjICtWZXJzaW9uOiA3NC4yZGRhODgwZC4wCisjICAKKyMgIEZp
bGU6IGl3bHdpZmktUXUtYzAtaHItYjAtNzcudWNvZGUKKyMgLVZlcnNpb246IDc0LmY5MmI1ZmVk
LjAKKyMgK1ZlcnNpb246IDc0LjJkZGE4ODBkLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS1RdS1j
MC1qZi1iMC03Ny51Y29kZQorIyAtVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyArVmVyc2lvbjog
NzQuMmRkYTg4MGQuMAorIyAgCisjICBGaWxlOiBpd2x3aWZpLVF1Wi1hMC1oci1iMC03Ny51Y29k
ZQorIyAtVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyArVmVyc2lvbjogNzQuMmRkYTg4MGQuMAor
IyAgCisjICBGaWxlOiBpd2x3aWZpLVF1Wi1hMC1qZi1iMC03Ny51Y29kZQorIyAgVmVyc2lvbjog
NzQuZjkyYjVmZWQuMAorIyBAQCAtMTMxNiwxNCArMTMxNiwzNSBAQAorIyAgRmlsZTogaXdsd2lm
aS10eS1hMC1nZi1hMC03Ny51Y29kZQorIyAgVmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyAgCisj
ICtGaWxlOiBpd2x3aWZpLXR5LWEwLWdmLWEwLTc4LnVjb2RlCisjICtWZXJzaW9uOiA3NS4zYmZk
YzU1Zi4wCisjICsKKyMgK0ZpbGU6IGl3bHdpZmktdHktYTAtZ2YtYTAtNzkudWNvZGUKKyMgK1Zl
cnNpb246IDc2LjI3ZjFjMzdiLjAKKyMgKworIyAgRmlsZTogaXdsd2lmaS1zby1hMC1nZjQtYTAt
NzcudWNvZGUKKyMgIFZlcnNpb246IDc0LmY5MmI1ZmVkLjAKKyMgIAorIyArRmlsZTogaXdsd2lm
aS1zby1hMC1nZjQtYTAtNzgudWNvZGUKKyMgK1ZlcnNpb246IDc1LjNiZmRjNTVmLjAKKyMgKwor
IyArRmlsZTogaXdsd2lmaS1zby1hMC1nZjQtYTAtNzkudWNvZGUKKyMgK1ZlcnNpb246IDc2LjI3
ZjFjMzdiLjAKKyMgKworIyAgRmlsZTogaXdsd2lmaS1zby1hMC1nZi1hMC03Ny51Y29kZQorIyAg
VmVyc2lvbjogNzQuZjkyYjVmZWQuMAorIyAgCisjICtGaWxlOiBpd2x3aWZpLXNvLWEwLWdmLWEw
LTc4LnVjb2RlCisjICtWZXJzaW9uOiA3NC4zYmZkYzU1Zi4wCisjICsKKyMgK0ZpbGU6IGl3bHdp
Zmktc28tYTAtZ2YtYTAtNzkudWNvZGUKKyMgK1ZlcnNpb246IDc1LjI3ZjFjMzdiLjAKKyMgKwor
IyAgRmlsZTogaXdsd2lmaS1zby1hMC1oci1iMC03Ny51Y29kZQorIyAgVmVyc2lvbjogNzQuZjky
YjVmZWQuMAorIyArCisjICtGaWxlOiBpd2x3aWZpLXNvLWEwLWhyLWIwLTc5LnVjb2RlCisjICtW
ZXJzaW9uOiA3NS4yN2YxYzM3Yi4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktc28tYTAtamYtYjAt
NzcudWNvZGUKKyMgIFZlcnNpb246IDc0LmY5MmI1ZmVkLjAKKyMgQEAgLTI2NDcsMjMgKzI2Njgs
MzYgQEAKKyMgIEZpbGU6IGFtZGdwdS9nY18xMV8wXzBfbWVzLmJpbgorIyAgRmlsZTogYW1kZ3B1
L2djXzExXzBfMF9wZnAuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTFfMF8wX3JsYy5iaW4KKyMg
K0ZpbGU6IGFtZGdwdS9nY18xMV8wXzJfaW11LmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzBf
Ml9tZS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV8wXzJfbWVjLmJpbgorIyArRmlsZTogYW1k
Z3B1L2djXzExXzBfMl9tZXMxLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzBfMl9tZXMuYmlu
CisjICtGaWxlOiBhbWRncHUvZ2NfMTFfMF8yX3BmcC5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18x
MV8wXzJfcmxjLmJpbgorIyAgRmlsZTogYW1kZ3B1L2Rjbl8zXzFfNV9kbWN1Yi5iaW4KKyMgIEZp
bGU6IGFtZGdwdS9kY25fM18xXzZfZG1jdWIuYmluCisjICBGaWxlOiBhbWRncHUvZGNuXzNfMl8w
X2RtY3ViLmJpbgorIyArRmlsZTogYW1kZ3B1L2Rjbl8zXzJfMV9kbWN1Yi5iaW4KKyMgIEZpbGU6
IGFtZGdwdS9wc3BfMTNfMF8wX3Nvcy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9wc3BfMTNfMF8wX3Rh
LmJpbgorIyAgRmlsZTogYW1kZ3B1L3BzcF8xM18wXzVfYXNkLmJpbgorIyAgRmlsZTogYW1kZ3B1
L3BzcF8xM18wXzVfdGEuYmluCisjICBGaWxlOiBhbWRncHUvcHNwXzEzXzBfNV90b2MuYmluCisj
ICtGaWxlOiBhbWRncHUvcHNwXzEzXzBfN19zb3MuYmluCisjICtGaWxlOiBhbWRncHUvcHNwXzEz
XzBfN190YS5iaW4KKyMgIEZpbGU6IGFtZGdwdS9wc3BfMTNfMF84X2FzZC5iaW4KKyMgIEZpbGU6
IGFtZGdwdS9wc3BfMTNfMF84X3RhLmJpbgorIyAgRmlsZTogYW1kZ3B1L3BzcF8xM18wXzhfdG9j
LmJpbgorIyAgRmlsZTogYW1kZ3B1L3NkbWFfNV8yXzYuYmluCisjICBGaWxlOiBhbWRncHUvc2Rt
YV81XzJfNy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9zZG1hXzZfMF8wLmJpbgorIyArRmlsZTogYW1k
Z3B1L3NkbWFfNl8wXzIuYmluCisjICBGaWxlOiBhbWRncHUvc211XzEzXzBfMC5iaW4KKyMgK0Zp
bGU6IGFtZGdwdS9zbXVfMTNfMF83LmJpbgorIyAgRmlsZTogYW1kZ3B1L3Zjbl8zXzFfMi5iaW4K
KyMgIEZpbGU6IGFtZGdwdS92Y25fNF8wXzAuYmluCisjICtGaWxlOiBhbWRncHUvdmNuXzRfMF80
LmJpbgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFtZGdw
dSBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtMjkzMCw3ICsyOTY0LDEwIEBACisjICBGaWxlOiAi
YnJjbS9icmNtZm1hYzQzMzQwLXNkaW8ubWVlZ29wYWQtdDA4LnR4dCIKKyMgIEZpbGU6ICJicmNt
L2JyY21mbWFjNDMzNDAtc2Rpby5wb3YtdGFiLXAxMDA2dy1kYXRhLnR4dCIKKyMgIEZpbGU6ICJi
cmNtL2JyY21mbWFjNDMzNDAtc2Rpby5wcmVkaWEtYmFzaWMudHh0IgorIyArRmlsZTogImJyY20v
YnJjbWZtYWM0MzM2Mi1zZGlvLldDMTIxLnR4dCIKKyMgIEZpbGU6ICJicmNtL2JyY21mbWFjNDMz
NjItc2Rpby5jdWJpZXRlY2gsY3ViaWV0cnVjay50eHQiCisjICtMaW5rOiBicmNtL2JyY21mbWFj
NDMzNjItc2Rpby5rb2JvLGF1cmEudHh0IC0+IGJyY21mbWFjNDMzNjItc2Rpby5XQzEyMS50eHQK
KyMgK0xpbms6IGJyY20vYnJjbWZtYWM0MzM2Mi1zZGlvLmtvYm8sdG9saW5vLXNoaW5lMmhkLnR4
dCAtPiBicmNtZm1hYzQzMzYyLXNkaW8uV0MxMjEudHh0CisjICBMaW5rOiBicmNtL2JyY21mbWFj
NDMzNjItc2Rpby5sZW1ha2VyLGJhbmFuYXByby50eHQgLT4gYnJjbWZtYWM0MzM2Mi1zZGlvLmN1
YmlldGVjaCxjdWJpZXRydWNrLnR4dAorIyAgRmlsZTogImJyY20vYnJjbWZtYWM0MzQzMGEwLXNk
aW8uaWxpZmUtUzgwNi50eHQiCisjICBGaWxlOiAiYnJjbS9icmNtZm1hYzQzNDMwYTAtc2Rpby5q
dW1wZXItZXpwYWQtbWluaTMudHh0IgorIyBAQCAtMzg1OCwxMyArMzg5NSwxMyBAQAorIyAgRmls
ZTogaW50ZWwvaWJ0LTEyLTE2LnNmaQorIyAgVmVyc2lvbjogQlRfV2luZFN0b3JtUGVha19SRUwx
Mjk5CisjICBGaWxlOiBpbnRlbC9pYnQtMTctMTYtMS5zZmkKKyMgLVZlcnNpb246IEJUX0plZmZl
cnNvblBlYWtfQjBfQjBfUkVMMjAxODIKKyMgK1ZlcnNpb246IEJUX0plZmZlcnNvblBlYWtfQjBf
QjBfUkVMMjAzMzIKKyMgIEZpbGU6IGludGVsL2lidC0xNy0xNi0xLmRkYworIyAtVmVyc2lvbjog
QlRfSmVmZmVyc29uUGVha19CMF9CMF9SRUwyMDE4MgorIyArVmVyc2lvbjogQlRfSmVmZmVyc29u
UGVha19CMF9CMF9SRUwyMDMzMgorIyAgRmlsZTogaW50ZWwvaWJ0LTE3LTIuc2ZpCisjIC1WZXJz
aW9uOiBCVF9KZWZmZXJzb25QZWFrX0IwX0IwX1JFTDIwMTgyCisjICtWZXJzaW9uOiBCVF9KZWZm
ZXJzb25QZWFrX0IwX0IwX1JFTDIwMzMyCisjICBGaWxlOiBpbnRlbC9pYnQtMTctMi5kZGMKKyMg
LVZlcnNpb246IEJUX0plZmZlcnNvblBlYWtfQjBfQjBfUkVMMjAxODIKKyMgK1ZlcnNpb246IEJU
X0plZmZlcnNvblBlYWtfQjBfQjBfUkVMMjAzMzIKKyMgIEZpbGU6IGludGVsL2lidC0xNy0wLTEu
c2ZpCisjICBWZXJzaW9uOiBCVF9KZWZmZXJzb25QZWFrX0EwX0IwX1JFTDAyMDEKKyMgIEZpbGU6
IGludGVsL2lidC0xNy0wLTEuZGRjCisjIEBAIC0zODkwLDY1ICszOTI3LDY1IEBACisjICBGaWxl
OiBpbnRlbC9pYnQtMTgtMS5kZGMKKyMgIFZlcnNpb246IEJUX1RodW5kZXJQZWFrX0EwX0IwX1JF
TDAyMDEKKyMgIEZpbGU6aW50ZWwvaWJ0LTIwLTAtMy5zZmkKKyMgLVZlcnNpb246IEJUX0N5Y2xv
bmVQZWFrX0EwX1JFTDUxODE4CisjICtWZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw1MzI2
MworIyAgRmlsZTppbnRlbC9pYnQtMjAtMC0zLmRkYworIyAtVmVyc2lvbjogQlRfQ3ljbG9uZVBl
YWtfQTBfUkVMNTE4MTgKKyMgK1ZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDUzMjYzCisj
ICBGaWxlOmludGVsL2lidC0yMC0xLTMuc2ZpCisjIC1WZXJzaW9uOiBCVF9DeWNsb25lUGVha19B
MF9SRUw1MTgxOAorIyArVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNTMyNjMKKyMgIEZp
bGU6aW50ZWwvaWJ0LTIwLTEtMy5kZGMKKyMgLVZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JF
TDUxODE4CisjICtWZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw1MzI2MworIyAgRmlsZTpp
bnRlbC9pYnQtMjAtMS00LnNmaQorIyAtVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNTE4
MTgKKyMgK1ZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDUzMjYzCisjICBGaWxlOmludGVs
L2lidC0yMC0xLTQuZGRjCisjIC1WZXJzaW9uOiBCVF9DeWNsb25lUGVha19BMF9SRUw1MTgxOAor
IyArVmVyc2lvbjogQlRfQ3ljbG9uZVBlYWtfQTBfUkVMNTMyNjMKKyMgIEZpbGU6aW50ZWwvaWJ0
LTE5LTAtMC5zZmkKKyMgLVZlcnNpb246IEJUX1F1YXNhcl9SRUw1MTgxOAorIyArVmVyc2lvbjog
QlRfUXVhc2FyX1JFTDUzMjYzCisjICBGaWxlOmludGVsL2lidC0xOS0wLTAuZGRjCisjIC1WZXJz
aW9uOiBCVF9RdWFzYXJfUkVMNTE4MTgKKyMgK1ZlcnNpb246IEJUX1F1YXNhcl9SRUw1MzI2Mwor
IyAgRmlsZTppbnRlbC9pYnQtMTktMC0xLnNmaQorIyAtVmVyc2lvbjogQlRfUXVhc2FyX1JFTDUx
ODE4CisjICtWZXJzaW9uOiBCVF9RdWFzYXJfUkVMNTMyNjMKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5
LTAtMS5kZGMKKyMgLVZlcnNpb246IEJUX1F1YXNhcl9SRUw1MTgxOAorIyArVmVyc2lvbjogQlRf
UXVhc2FyX1JFTDUzMjYzCisjICBGaWxlOmludGVsL2lidC0xOS0wLTQuc2ZpCisjIC1WZXJzaW9u
OiBCVF9IYXJyaXNvblBlYWtfUkVMNTE4MTgKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19S
RUw1MzI2MworIyAgRmlsZTppbnRlbC9pYnQtMTktMC00LmRkYworIyAtVmVyc2lvbjogQlRfSGFy
cmlzb25QZWFrX1JFTDUxODE4CisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTMyNjMK
KyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTE2LTQuc2ZpCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBl
YWtfUkVMNTE4MTgKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MzI2MworIyAgRmls
ZTppbnRlbC9pYnQtMTktMTYtNC5kZGMKKyMgLVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1
MTgxOAorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzMjYzCisjICBGaWxlOmludGVs
L2lidC0xOS0zMi0xLnNmaQorIyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUxODE4Cisj
ICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTMyNjMKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5
LTMyLTEuZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMNTE4MTgKKyMgK1ZlcnNp
b246IEJUX0hhcnJpc29uUGVha19SRUw1MzI2MworIyAgRmlsZTppbnRlbC9pYnQtMTktMzItMC5z
ZmkKKyMgLVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MTgxOAorIyArVmVyc2lvbjogQlRf
SGFycmlzb25QZWFrX1JFTDUzMjYzCisjICBGaWxlOmludGVsL2lidC0xOS0zMi0wLmRkYworIyAt
VmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUxODE4CisjICtWZXJzaW9uOiBCVF9IYXJyaXNv
blBlYWtfUkVMNTMyNjMKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTMyLTQuc2ZpCisjIC1WZXJzaW9u
OiBCVF9IYXJyaXNvblBlYWtfUkVMNTE4MTgKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19S
RUw1MzI2MworIyAgRmlsZTppbnRlbC9pYnQtMTktMzItNC5kZGMKKyMgLVZlcnNpb246IEJUX0hh
cnJpc29uUGVha19SRUw1MTgxOAorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzMjYz
CisjICBGaWxlOmludGVsL2lidC0xOS0yNDAtMS5zZmkKKyMgLVZlcnNpb246IEJUX0hhcnJpc29u
UGVha19SRUw1MTgxOAorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzMjYzCisjICBG
aWxlOmludGVsL2lidC0xOS0yNDAtMS5kZGMKKyMgLVZlcnNpb246IEJUX0hhcnJpc29uUGVha19S
RUw1MTgxOAorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzMjYzCisjICBGaWxlOmlu
dGVsL2lidC0xOS0yNDAtNC5zZmkKKyMgLVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MTgx
OAorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzMjYzCisjICBGaWxlOmludGVsL2li
dC0xOS0yNDAtNC5kZGMKKyMgLVZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw1MTgxOAorIyAr
VmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDUzMjYzCisjICBGaWxlOmludGVsL2lidC0wMDQx
LTAwNDEuc2ZpCisjIC1WZXJzaW9uOiBCVF9UeXBob29uUGVha19SRUw1MjE1OQorIyArVmVyc2lv
bjogQlRfVHlwaG9vblBlYWtfUkVMNTY2ODMKKyMgIEZpbGU6aW50ZWwvaWJ0LTAwNDEtMDA0MS5k
ZGMKKyMgLVZlcnNpb246IEJUX1R5cGhvb25QZWFrX1JFTDUyMTU5CisjICtWZXJzaW9uOiBCVF9U
eXBob29uUGVha19SRUw1NjY4MworIyAgRmlsZTppbnRlbC9pYnQtMDA0MC0wMDQxLnNmaQorIyAt
VmVyc2lvbjogQlRfU29sYXJfR2ZQMl9SRUw1MjE1OQorIyArVmVyc2lvbjogQlRfU29sYXJfR2ZQ
Ml9SRUw1NjY4MworIyAgRmlsZTppbnRlbC9pYnQtMDA0MC0wMDQxLmRkYworIyAtVmVyc2lvbjog
QlRfU29sYXJfR2ZQMl9SRUw1MjE1OQorIyArVmVyc2lvbjogQlRfU29sYXJfR2ZQMl9SRUw1NjY4
MworIyAgRmlsZTppbnRlbC9pYnQtMTA0MC0wMDQxLnNmaQorIyAtVmVyc2lvbjogQlRfU29sYXJG
X0dmUDJfUkVMNTIxNTkKKyMgK1ZlcnNpb246IEJUX1NvbGFyRl9HZlAyX1JFTDU2NjgzCisjICBG
aWxlOmludGVsL2lidC0xMDQwLTAwNDEuZGRjCisjIC1WZXJzaW9uOiBCVF9Tb2xhckZfR2ZQMl9S
RUw1MjE1OQorIyArVmVyc2lvbjogQlRfU29sYXJGX0dmUDJfUkVMNTY2ODMKKyMgIAorIyAgRmls
ZTppbnRlbC9pYnQtMDA0MC0xMDIwLnNmaQorIyAgVmVyc2lvbjogQlRfU29sYXJfSmZQMV9SRUw1
MjE1OQorIyBAQCAtMzk2OSwxMyArNDAwNiwxMyBAQAorIyAgVmVyc2lvbjogQlRfU29sYXJGX0pm
UDJfUkVMNTIxNTkKKyMgIAorIyAgRmlsZTppbnRlbC9pYnQtMDA0MC00MTUwLnNmaQorIyAtVmVy
c2lvbjogQlRfU29sYXJfSHJQMl9SRUw1MjE1OQorIyArVmVyc2lvbjogQlRfU29sYXJfSHJQMl9S
RUw1NjY4MworIyAgRmlsZTppbnRlbC9pYnQtMDA0MC00MTUwLmRkYworIyAtVmVyc2lvbjogQlRf
U29sYXJfSHJQMl9SRUw1MjE1OQorIyArVmVyc2lvbjogQlRfU29sYXJfSHJQMl9SRUw1NjY4Mwor
IyAgRmlsZTppbnRlbC9pYnQtMTA0MC00MTUwLnNmaQorIyAtVmVyc2lvbjogQlRfU29sYXJGX0hy
UDJfUkVMNTIxNTkKKyMgK1ZlcnNpb246IEJUX1NvbGFyRl9IclAyX1JFTDU2NjgzCisjICBGaWxl
OmludGVsL2lidC0xMDQwLTQxNTAuZGRjCisjIC1WZXJzaW9uOiBCVF9Tb2xhckZfSHJQMl9SRUw1
MjE1OQorIyArVmVyc2lvbjogQlRfU29sYXJGX0hyUDJfUkVMNTY2ODMKKyMgIAorIyAgTGljZW5j
ZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5pYnRfZmlybXdhcmUgZm9yIGRldGFpbHMK
KyMgIAorIyBAQCAtNDQ4Niw2ICs0NTIzLDE5IEBACisjICBGaWxlOiBxY2EvbXNidGZ3MTEubWJu
CisjICBGaWxlOiBxY2EvbXNidGZ3MTEudGx2CisjICBGaWxlOiBxY2EvbXNudjExLmJpbgorIyAr
CisjICtMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLlF1YWxjb21tQXRoZXJv
c19hdGgxMGsgYW5kIHFjYS9OT1RJQ0UudHh0IGZvciBkZXRhaWxzCisjICsKKyMgK0RyaXZlcjog
cWNhIC0gUXVhbGNvbW0gQXRoZXJvcyBCbHVldG9vdGggc3VwcG9ydCBmb3IgUUNBMjA2NiBjaGlw
cworIyArCisjICtGaWxlOiBxY2EvaHBidGZ3MjEudGx2CisjICtGaWxlOiBxY2EvaHBudjIxLmJp
bgorIyArRmlsZTogcWNhL2hwbnYyMWcuYmluCisjICtGaWxlOiBxY2EvaHBudjIxLjMwMQorIyAr
RmlsZTogcWNhL2hwbnYyMS4zMDIKKyMgK0ZpbGU6IHFjYS9ocG52MjFnLjMwMQorIyArRmlsZTog
cWNhL2hwbnYyMWcuMzAyCisjICsKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBT
ZWUgTElDRU5TRS5RdWFsY29tbUF0aGVyb3NfYXRoMTBrIGFuZCBxY2EvTk9USUNFLnR4dCBmb3Ig
ZGV0YWlscworIyAgCisjIEBAIC01NTE5LDkgKzU1NjksOSBAQAorIyAgRHJpdmVyOiBtdDc5MjEg
LSBNZWRpYVRlayBNVDc5MjEgV2lyZWxlc3MgTUFDcworIyAgCisjICBGaWxlOiBtZWRpYXRlay9X
SUZJX01UNzk2MV9wYXRjaF9tY3VfMV8yX2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjIxMTA5MTEw
OTE4YQorIyArVmVyc2lvbjogMjAyMjEyMjcxNTA5MTBhCisjICBGaWxlOiBtZWRpYXRlay9XSUZJ
X1JBTV9DT0RFX01UNzk2MV8xLmJpbgorIyAtVmVyc2lvbjogMjAyMjExMDkxMTEwMDUKKyMgK1Zl
cnNpb246IDIwMjIxMjI3MTUwOTU0CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4g
U2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTU1MzAsNyArNTU4
MCw3IEBACisjICBEcml2ZXI6IG10NzkyMSAtIE1lZGlhVGVrIE1UNzkyMSBibHVldG9vdGggY2hp
cHNldAorIyAgCisjICBGaWxlOiBtZWRpYXRlay9CVF9SQU1fQ09ERV9NVDc5NjFfMV8yX2hkci5i
aW4KKyMgLVZlcnNpb246IDIwMjIxMTA5MTExMjEzCisjICtWZXJzaW9uOiAyMDIyMTIyNzE1MTMw
MQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVr
IGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC01NTM5LDkgKzU1ODksOSBAQAorIyAgRHJpdmVyOiBt
dDc5MjIgLSBNZWRpYVRlayBNVDc5MjIgV2lyZWxlc3MgTUFDcworIyAgCisjICBGaWxlOiBtZWRp
YXRlay9XSUZJX01UNzkyMl9wYXRjaF9tY3VfMV8xX2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjIw
OTA4MjAzMjAzYQorIyArVmVyc2lvbjogMjAyMjEyMjcxMjMxNTRhCisjICBGaWxlOiBtZWRpYXRl
ay9XSUZJX1JBTV9DT0RFX01UNzkyMl8xLmJpbgorIyAtVmVyc2lvbjogMjAyMjA5MDgyMDMyNTMK
KyMgK1ZlcnNpb246IDIwMjIxMjI3MTIzMjQzCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0
YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTU1NTAs
NyArNTYwMCw3IEBACisjICBEcml2ZXI6IG10NzkyMiAtIE1lZGlhVGVrIE1UNzkyMiBibHVldG9v
dGggY2hpcHNldAorIyAgCisjICBGaWxlOiBtZWRpYXRlay9CVF9SQU1fQ09ERV9NVDc5MjJfMV8x
X2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjIwOTA4MjExMjM0CisjICtWZXJzaW9uOiAyMDIyMTIy
NzEyMzQyOQorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1l
ZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC01NzM5LDYgKzU3ODksMTkgQEAKKyMgIAor
IyAgQmluYXJ5IGZpbGVzIHN1cHBsaWVkIG9yaWdpbmFsbHkgZnJvbQorIyAgaHR0cHM6Ly9kZXZl
bG9wZXIucXVhbGNvbW0uY29tL2hhcmR3YXJlL2RyYWdvbmJvYXJkLTQxMGMvdG9vbHMKKyMgKwor
IyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgKworIyArRHJpdmVyOiBhZHJlbm8gLSBRdWFsY29tbSBB
ZHJlbm8gR1BVIGZpcm13YXJlCisjICsKKyMgK0ZpbGU6IHFjb20veWFtYXRvX3BmcC5mdworIyAr
RmlsZTogcWNvbS95YW1hdG9fcG00LmZ3CisjICsKKyMgK0xpY2VuY2U6IFJlZGlzdHJpYnV0YWJs
ZSwgQlNELTMtQ2xhdXNlIGxpY2VuY2UsIFNlZSBMSUNFTlNFLnFjb21feWFtYXRvIGZvciBkZXRh
aWxzCisjICsKKyMgK0JpbmFyeSBmaWxlcyBnZW5lcmF0ZWQgZnJvbSBoZWFkZXIgZmlsZXMgaW4g
RWZpa2FNWCBrZXJuZWwgc291cmNlcy4gQSBwcmVmaXggb2YKKyMgK2ZvdXIgemVybyBieXRlcyB3
YXMgcHJlcGVuZGVkIHRvIG1ha2UgdGhlbSB3b3JrIHdpdGggdGhlIERSTSBNU00gZHJpdmVyLiBT
ZWUKKyMgK2h0dHBzOi8vZ2l0aHViLmNvbS9nZW5lc2kvbGludXgtbGVnYWN5L3RyZWUvbWFzdGVy
L2RyaXZlcnMvbXhjL2FtZC1ncHUKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgIAorIyAK
KyMKKwogU1VNTUFSWSA9ICJGaXJtd2FyZSBmaWxlcyBmb3IgdXNlIHdpdGggTGludXgga2VybmVs
IgogSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy8iCiBERVNDUklQVElPTiA9ICJM
aW51eCBmaXJtd2FyZSBpcyBhIHBhY2thZ2UgZGlzdHJpYnV0ZWQgYWxvbmdzaWRlIHRoZSBMaW51
eCBrZXJuZWwgXApAQCAtNzAsNyArNDU3LDcgQEAgTElDRU5TRSA9ICJcCiBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTkNFLkFiaWxpczttZDU9YjVlZTNmNDEwNzgwZTU2NzExYWQ0OGVh
ZGMyMmI4YmMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS5hZHNwX3NzdDtt
ZDU9NjE1YzQ1YjkxYTVhNGE5ZmUwNDZkNmFiOWEyZGY3MjggXAogICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vTElDRU5DRS5hZ2VyZTttZDU9YWYwMTMzZGU2YjRhOWIyNTIyZGVmZDVmMTg4YWZk
MzEgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5hbWRncHU7bWQ1PTQ0YzEx
NjZkMDUyMjI2Y2IyZDZjOGQ3NDAwMDkwMjAzIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTov
L0xJQ0VOU0UuYW1kZ3B1O21kNT1hMjU4OWEwNWVhNWI2YmQyYjdmNGY2MjNjN2U3YTY0OSBcCiAg
ICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLmFtZC11Y29kZTttZDU9NmNhOTBjNTdm
N2IyNDhkZTFlMjVjN2Y2OGZmYzQ2OTggXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElD
RU5TRS5hbWxvZ2ljX3ZkZWM7bWQ1PWRjNDRmNTliZjY0YTgxNjQzZTUwMGFkM2YzOWE0NjhhIFwK
ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UuYXRoZXJvc19maXJtd2FyZTttZDU9
MzBhMTRjNzgyM2JlZWRhYzlmYTM5YzY0ZmRkMDFhMTMgXApAQCAtMTI4LDcgKzUxNSw3IEBAIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOQ0UuQWJpbGlzO21kNT1iNWVlM2Y0MTA3ODBl
NTY3MTFhZDQ4ZWFkYzIyYjhiYyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNF
LnhjNDAwMDttZDU9MGZmNTFkMmRjNDlmY2UwNDgxNGM5MTU1MDgxMDkyZjAgXAogICAgICAgICAg
ICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzUwMDA7bWQ1PTFlMTcwYzEzMTc1MzIzYzMyYzdm
NGQwOTk4ZDUzZjY2IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM1MDAw
YzttZDU9MTJiMDJlZmEzMDQ5ZGI2NWQ1MjRhZWI0MThkZDg3Y2EgXAotICAgICAgICAgICAgICAg
ICAgICBmaWxlOi8vV0hFTkNFO21kNT0ke1dIRU5DRV9DSEtTVU19IFwKKyAgICAgICAgICAgICAg
ICAgICAgZmlsZTovL1dIRU5DRTttZDU9MDVmMWQ5NDE5NzJjZWRhZGJmNjY3YzA1ZjYwMTAzNzgg
XAogICAgICAgICAgICAgICAgICAgICAiCiAjIFdIRU5DRSBjaGVja3N1bSBpcyBkZWZpbmVkIHNl
cGFyYXRlbHkgdG8gZWFzZSBvdmVycmlkaW5nIGl0IGlmCiAjIGNsYXNzLWRldnVwc3RyZWFtIGlz
IHNlbGVjdGVkLgpAQCAtMjA5LDcgKzU5Niw3IEBAIFNSQ19VUkk6Y2xhc3MtZGV2dXBzdHJlYW0g
PSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13CiAj
IFBpbiB0aGlzIHRvIHRoZSAyMDIyMDUwOSByZWxlYXNlLCBvdmVycmlkZSB0aGlzIGluIGxvY2Fs
LmNvbmYKIFNSQ1JFVjpjbGFzcy1kZXZ1cHN0cmVhbSA/PSAiYjE5Y2JkY2E3OGFiMmFkZmQyMTBj
OTFiZTE1YTIyNTY4ZThiOGNhZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImU3OTM3ODNlOTJh
Y2JkZTU0OTk2NTUyMTQ2MmQxZDEzMjc4MjczNjA2NjRjZjI0MmRiZGEwOGYwNzU2NTQzMzEiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZGYxMWUyNWJhMmZiNGQ1MzQzNDczNzU3ZTE3YTNiNGNlZjU5
OTI1MGEyNmIxZjdlMGYwMzg4NTBmMGNiM2Q2NCIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIu
MzcuMwoK

--===============1310256369404029785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/lib/firmware/amdgpu/sdma_6_0_2.bin /lib/firmware/amdgpu/psp_13_0_7_ta.bin /lib/firmware/amdgpu/dcn_3_2_1_dmcub.bin /lib/firmware/amdgpu/gc_11_0_2_imu.bin /lib/firmware/amdgpu/gc_11_0_2_pfp.bin /lib/firmware/amdgpu/vcn_4_0_4.bin /lib/firmware/amdgpu/gc_11_0_2_mes1.bin /lib/firmware/amdgpu/gc_11_0_2_mes.bin /lib/firmware/amdgpu/smu_13_0_7.bin /lib/firmware/amdgpu/psp_13_0_7_sos.bin /lib/firmware/amdgpu/gc_11_0_2_rlc.bin /lib/firmware/amdgpu/gc_11_0_2_me.bin /lib/firmware/amdgpu/gc_11_0_2_mec.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: FILELIST: added "/lib/firmware/brcm/brcmfmac43362-sdio.kobo,aura.txt /lib/firmware/brcm/brcmfmac43362-sdio.WC121.txt /lib/firmware/brcm/brcmfmac43362-sdio.kobo,tolino-shine2hd.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: added "/lib/firmware/iwlwifi-so-a0-gf4-a0-78.ucode /lib/firmware/iwlwifi-so-a0-gf-a0-79.ucode /lib/firmware/iwlwifi-ty-a0-gf-a0-78.ucode /lib/firmware/iwlwifi-ty-a0-gf-a0-79.ucode /lib/firmware/iwlwifi-so-a0-gf4-a0-79.ucode /lib/firmware/iwlwifi-so-a0-gf-a0-78.ucode /lib/firmware/iwlwifi-so-a0-hr-b0-79.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-license: FILELIST: added "/lib/firmware/LICENSE.qcom_yamato"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: FILELIST: added "/lib/firmware/qca/hpnv21.302 /lib/firmware/qca/hpnv21g.301 /lib/firmware/qca/hpnv21g.302 /lib/firmware/qca/hpnv21.301 /lib/firmware/qca/hpnv21.bin /lib/firmware/qca/hpnv21g.bin /lib/firmware/qca/hpbtfw21.tlv"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/lib/firmware/cxgb4/t6fw-1.27.0.0.bin /lib/firmware/cxgb4/t4fw-1.27.0.0.bin /lib/firmware/cxgb4/t5fw-1.27.0.0.bin", added "/lib/firmware/qcom/yamato_pm4.fw /lib/firmware/cxgb4/t6fw-1.27.1.0.bin /lib/firmware/cxgb4/t4fw-1.27.1.0.bin /lib/firmware/cxgb4/t5fw-1.27.1.0.bin /lib/firmware/qcom/yamato_pfp.fw"

--===============1310256369404029785==--

