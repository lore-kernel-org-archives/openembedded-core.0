Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43353C77B6D
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:46 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.10299.1676508398379534722
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JW+NpYgM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018657afffa2-25dafc2d-a990-4602-a43c-e24a4ed99eca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w623F8GzX1xqSA3pTevSZ7jjvzCdfTPlg0X8fQrZfOk=;
	b=JW+NpYgMJTewKd5gRgxGrx5zStj868hCPj7RrHC75uf/t24r1dkTCPNQoAeLabOd
	4dgn3Vu9oYdDPmwK1NOepB+UqwzNuqzFpjDSvFk5Y5dhCEg423Nkpqsh0unIrSVwq00
	89TlSl/sb5TFNTLMebvszA5lZzMlXFZPlCLAszYA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w623F8GzX1xqSA3pTevSZ7jjvzCdfTPlg0X8fQrZfOk=;
	b=P3uLQGsf9zr3P9NEhH8XxxXY58y01VtnServv5XjZ9xaMd0WZWwEcsjOYih6f/5v
	0Xa5wMi0nwaDtE/VyCvwJFzF59zBnyFfVXxFZEHDg2dNfe0MDZ2kRAPIHAalH3/MQGV
	uvAy9vcx/Krjp0vrXmkLG1xpDcQathdPE45a8Bt8=
Content-Type: multipart/mixed; boundary="===============5270369061565033519=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20230210 SUCCEEDED
Message-ID: <0101018657afffa2-25dafc2d-a990-4602-a43c-e24a4ed99eca-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:37 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177264

--===============5270369061565033519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20230210* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20230117-20230210.patch
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
--===============5270369061565033519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230117.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230210.tar.xz"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 72109590 to 74723142 (+4%)
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/lib/firmware/amdgpu/gc_11_0_1_imu.bin /lib/firmware/amdgpu/vcn_4_0_2.bin /lib/firmware/amdgpu/gc_11_0_1_pfp.bin /lib/firmware/amdgpu/gc_11_0_1_mes.bin /lib/firmware/amdgpu/psp_13_0_4_ta.bin /lib/firmware/amdgpu/sdma_6_0_1.bin /lib/firmware/amdgpu/psp_13_0_4_toc.bin /lib/firmware/amdgpu/gc_11_0_1_mec.bin /lib/firmware/amdgpu/gc_11_0_1_rlc.bin /lib/firmware/amdgpu/dcn_3_1_4_dmcub.bin /lib/firmware/amdgpu/gc_11_0_1_mes1.bin /lib/firmware/amdgpu/gc_11_0_1_me.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGSIZE changed from 246791 to 253748 (+3%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 25605463 to 25732475 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/adlp_dmc.bin /lib/firmware/i915/mtl_dmc.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGSIZE changed from 444128 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: FILELIST: removed all items "/lib/firmware/iwlwifi-6000g2a-5.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGSIZE changed from 460236 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: FILELIST: removed all items "/lib/firmware/iwlwifi-6000g2b-5.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGSIZE changed from 463692 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: FILELIST: removed all items "/lib/firmware/iwlwifi-6050-4.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGSIZE changed from 3097888 to 1036772 (-67%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: FILELIST: removed "/lib/firmware/iwlwifi-7265D-22.ucode /lib/firmware/iwlwifi-7265D-27.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGSIZE changed from 11535240 to 4876980 (-58%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: FILELIST: removed "/lib/firmware/iwlwifi-8000C-31.ucode /lib/firmware/iwlwifi-8000C-22.ucode /lib/firmware/iwlwifi-8000C-27.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGSIZE changed from 11231028 to 4877412 (-57%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: FILELIST: removed "/lib/firmware/iwlwifi-8265-22.ucode /lib/firmware/iwlwifi-8265-27.ucode /lib/firmware/iwlwifi-8265-31.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGSIZE changed from 14514260 to 6717640 (-54%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: FILELIST: removed "/lib/firmware/iwlwifi-9000-pu-b0-jf-b0-33.ucode /lib/firmware/iwlwifi-9000-pu-b0-jf-b0-41.ucode /lib/firmware/iwlwifi-9000-pu-b0-jf-b0-43.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 221488336 to 119452804 (-46%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: removed "/lib/firmware/iwlwifi-9260-th-b0-jf-b0-41.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-63.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-71.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-55.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-68.ucode /lib/firmware/iwlwifi-Qu-c0-hr-b0-62.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-53.ucode /lib/firmware/iwlwifi-Qu-c0-hr-b0-48.ucode /lib/firmware/iwlwifi-so-a0-gf4-a0-67.ucode /lib/firmware/iwlwifi-so-a0-gf4-a0-68.ucode /lib/firmware/iwlwifi-so-a0-gf4-a0-71.ucode /lib/firmware/iwlwifi-9260-th-b0-jf-b0-33.ucode /lib/firmware/iwlwifi-9260-th-b0-jf-b0-43.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0-71.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-48.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-53.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-55.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-62.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-63.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-68.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0
 -48.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0-53.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0-55.ucode /lib/firmware/iwlwifi-so-a0-gf-a0-64.ucode /lib/firmware/iwlwifi-so-a0-gf-a0-67.ucode /lib/firmware/iwlwifi-so-a0-gf-a0-68.ucode /lib/firmware/iwlwifi-so-a0-hr-b0-64.ucode /lib/firmware/iwlwifi-so-a0-hr-b0-68.ucode /lib/firmware/iwlwifi-so-a0-jf-b0-64.ucode /lib/firmware/iwlwifi-so-a0-jf-b0-68.ucode /lib/firmware/iwlwifi-ty-a0-gf-a0-62.ucode /lib/firmware/iwlwifi-ty-a0-gf-a0-63.ucode /lib/firmware/iwlwifi-ty-a0-gf-a0-67.ucode /lib/firmware/iwlwifi-ty-a0-gf-a0-68.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0-62.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0-63.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0-68.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-71.ucode /lib/firmware/iwlwifi-QuZ-a0-jf-b0-48.ucode /lib/firmware/iwlwifi-QuZ-a0-jf-b0-53.ucode /lib/firmware/iwlwifi-QuZ-a0-jf-b0-55.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-67.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-68.ucode /lib/firmware/iwlwifi-1000-3.ucode /
 lib/firmware/iwlwifi-5000-1.ucode /lib/firmware/iwlwifi-5000-2.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-71.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-48.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-53.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-55.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-62.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-63.ucode /lib/firmware/iwlwifi-QuZ-a0-jf-b0-62.ucode /lib/firmware/iwlwifi-QuZ-a0-jf-b0-63.ucode /lib/firmware/iwlwifi-QuZ-a0-jf-b0-68.ucode /lib/firmware/iwlwifi-QuZ-a0-jf-b0-71.ucode /lib/firmware/iwlwifi-ty-a0-gf-a0-71.ucode /lib/firmware/iwlwifi-3168-22.ucode /lib/firmware/iwlwifi-3168-27.ucode /lib/firmware/iwlwifi-cc-a0-46.ucode /lib/firmware/iwlwifi-cc-a0-48.ucode /lib/firmware/iwlwifi-cc-a0-53.ucode /lib/firmware/iwlwifi-cc-a0-55.ucode /lib/firmware/iwlwifi-cc-a0-62.ucode /lib/firmware/iwlwifi-cc-a0-63.ucode /lib/firmware/iwlwifi-cc-a0-67.ucode /lib/firmware/iwlwifi-cc-a0-68.ucode /lib/firmware/iwlwifi-cc-a0-71.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-48.uco
 de /lib/firmware/iwlwifi-Qu-c0-hr-b0-53.ucode /lib/firmware/iwlwifi-Qu-c0-hr-b0-55.ucode /lib/firmware/iwlwifi-Qu-c0-hr-b0-71.ucode /lib/firmware/iwlwifi-so-a0-gf-a0-71.ucode /lib/firmware/iwlwifi-so-a0-hr-b0-71.ucode /lib/firmware/iwlwifi-so-a0-jf-b0-71.ucode /lib/firmware/iwlwifi-Qu-c0-hr-b0-63.ucode /lib/firmware/iwlwifi-Qu-c0-hr-b0-68.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-62.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 206748 to 202866 (-2%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20230117" to "20230210"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 257889038 to 257919894 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20230117 [default] to 20230210 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431e12.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8995.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8995.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8994.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431e12.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8994.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20230117" to "20230210"

--===============5270369061565033519==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20230117-20230210.patch"

RnJvbSBiMGE2ZGQ1MzUyZjgzOTYwZmY3ZTZhMTEwNGRjOTZmMWFiYWNiNmEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMjI6MDM6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aW51eC1maXJtd2FyZTogdXBncmFkZSAyMDIzMDExNyAtPiAyMDIzMDIxMAoKLS0tCiAuLi4yMDIz
MDExNy5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIzMDIxMC5iYn0gfCA1MzAgKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNTI4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS97bGludXgtZmlybXdh
cmVfMjAyMzAxMTcuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyMzAyMTAuYmJ9ICg3OSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZV8yMDIzMDExNy5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyMzAyMTAuYmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8yMDIzMDExNy5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIzMDIxMC5iYgppbmRleCBmYTllNmY2MDRiLi40NWIzNzJmODQwIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjMw
MTE3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyMzAyMTAuYmIKQEAgLTEsMyArMSw1MjkgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBXSEVOQ0UKKyMgKysrIFdIRU5DRQorIyBAQCAtNzU0LDQyICs3NTQsMjQgQEAKKyMgIEZpbGU6
IGl3bHdpZmktNDk2NS0yLnVjb2RlCisjICBWZXJzaW9uOiAyMjguNjEuMi4yNAorIyAgCisjIC1G
aWxlOiBpd2x3aWZpLTUwMDAtMS51Y29kZQorIyAtVmVyc2lvbjogNS40LkEuMTEgKGFrYSA1LjQu
MS4xNikKKyMgLQorIyAtRmlsZTogaXdsd2lmaS01MDAwLTIudWNvZGUKKyMgLVZlcnNpb246IDgu
MjQuMi4xMgorIyAtCisjICBGaWxlOiBpd2x3aWZpLTUwMDAtNS51Y29kZQorIyAgVmVyc2lvbjog
OC44My41LjEKKyMgIAorIyAgRmlsZTogaXdsd2lmaS01MTUwLTIudWNvZGUKKyMgIFZlcnNpb246
IDguMjQuMi4yCisjICAKKyMgLUZpbGU6IGl3bHdpZmktMTAwMC0zLnVjb2RlCisjIC1WZXJzaW9u
OiAxMjguNTAuMy4xCisjIC0KKyMgIEZpbGU6IGl3bHdpZmktMTAwMC01LnVjb2RlCisjICBWZXJz
aW9uOiAzOS4zMS41LjEKKyMgIAorIyAgRmlsZTogaXdsd2lmaS02MDAwLTQudWNvZGUKKyMgIFZl
cnNpb246IDkuMjIxLjQuMQorIyAgCisjIC1GaWxlOiBpd2x3aWZpLTYwNTAtNC51Y29kZQorIyAt
VmVyc2lvbjogOS4yMDEuNC4xCisjIC0KKyMgIEZpbGU6IGl3bHdpZmktNjA1MC01LnVjb2RlCisj
ICBWZXJzaW9uOiA0MS4yOC41LjEKKyMgIAorIyAtRmlsZTogaXdsd2lmaS02MDAwZzJhLTUudWNv
ZGUKKyMgLVZlcnNpb246IDE3LjE2OC41LjMKKyMgLQorIyAgRmlsZTogaXdsd2lmaS02MDAwZzJh
LTYudWNvZGUKKyMgIFZlcnNpb246IDE4LjE2OC42LjEKKyMgIAorIyAtRmlsZTogaXdsd2lmaS02
MDAwZzJiLTUudWNvZGUKKyMgLVZlcnNpb246IDE3LjE2OC41LjEKKyMgLQorIyAgRmlsZTogaXds
d2lmaS02MDAwZzJiLTYudWNvZGUKKyMgIFZlcnNpb246IDE4LjE2OC42LjEKKyMgIAorIyBAQCAt
ODE3LDExNCArNzk5LDQyIEBACisjICBGaWxlOiBpd2x3aWZpLTcyNjUtMTcudWNvZGUKKyMgIFZl
cnNpb246IDE3LmJmYjU4NTM4LjAKKyMgIAorIyAtRmlsZTogaXdsd2lmaS03MjY1RC0yMi51Y29k
ZQorIyAtVmVyc2lvbjogMjIuMzkxNzQwLjAKKyMgLQorIyAtRmlsZTogaXdsd2lmaS03MjY1RC0y
Ny51Y29kZQorIyAtVmVyc2lvbjogMjcuNTQxMDMzLjAKKyMgLQorIyAgRmlsZTogaXdsd2lmaS03
MjY1RC0yOS51Y29kZQorIyAgVmVyc2lvbjogMjkuZjIzOTBhYTguMAorIyAgCisjIC1GaWxlOiBp
d2x3aWZpLTMxNjgtMjIudWNvZGUKKyMgLVZlcnNpb246IDIyLjM5MTc0MC4wCisjIC0KKyMgLUZp
bGU6IGl3bHdpZmktMzE2OC0yNy51Y29kZQorIyAtVmVyc2lvbjogMjcuNTQxMDMzLjAKKyMgLQor
IyAgRmlsZTogaXdsd2lmaS0zMTY4LTI5LnVjb2RlCisjICBWZXJzaW9uOiAyOS4wYmQ4OTNmMy4w
CisjICAKKyMgLUZpbGU6IGl3bHdpZmktODAwMEMtMjIudWNvZGUKKyMgLVZlcnNpb246IDIyLjM5
MTc0MC4wCisjIC0KKyMgLUZpbGU6IGl3bHdpZmktODAwMEMtMjcudWNvZGUKKyMgLVZlcnNpb246
IDI3LjU0MTAzMy4wCisjIC0KKyMgLUZpbGU6IGl3bHdpZmktODAwMEMtMzEudWNvZGUKKyMgLVZl
cnNpb246IDMxLjU2MDQ4NC4wCisjIC0KKyMgIEZpbGU6IGl3bHdpZmktODAwMEMtMzQudWNvZGUK
KyMgIFZlcnNpb246IDM0LjYxMDI4OC4wCisjICAKKyMgIEZpbGU6IGl3bHdpZmktODAwMEMtMzYu
dWNvZGUKKyMgIFZlcnNpb246IDM2LmNhN2I5MDFkLjAKKyMgIAorIyAtRmlsZTogaXdsd2lmaS04
MjY1LTIyLnVjb2RlCisjIC1WZXJzaW9uOiAyMi4zOTE3NDAuMAorIyAtCisjIC1GaWxlOiBpd2x3
aWZpLTgyNjUtMjcudWNvZGUKKyMgLVZlcnNpb246IDI3LjU0MTAzMy4wCisjIC0KKyMgLUZpbGU6
IGl3bHdpZmktODI2NS0zMS51Y29kZQorIyAtVmVyc2lvbjogMzEuNTYwNDg0LjAKKyMgLQorIyAg
RmlsZTogaXdsd2lmaS04MjY1LTM0LnVjb2RlCisjICBWZXJzaW9uOiAzNC42MTAyODguMAorIyAg
CisjICBGaWxlOiBpd2x3aWZpLTgyNjUtMzYudWNvZGUKKyMgIFZlcnNpb246IDM2LmNhN2I5MDFk
LjAKKyMgIAorIyAtRmlsZTogaXdsd2lmaS05MDAwLXB1LWIwLWpmLWIwLTMzLnVjb2RlCisjIC1W
ZXJzaW9uOiAzMy42MTAyOTQuMAorIyAtCisjICBGaWxlOiBpd2x3aWZpLTkwMDAtcHUtYjAtamYt
YjAtMzQudWNvZGUKKyMgIFZlcnNpb246IDM0LmJhNTAxYjExLjAKKyMgIAorIyAgRmlsZTogaXds
d2lmaS05MDAwLXB1LWIwLWpmLWIwLTM4LnVjb2RlCisjICBWZXJzaW9uOiAzOC43NTVjZmRkOC4w
CisjICAKKyMgLUZpbGU6IGl3bHdpZmktOTAwMC1wdS1iMC1qZi1iMC00MS51Y29kZQorIyAtVmVy
c2lvbjogNDEuZmMxYTdhZWEuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLTkwMDAtcHUtYjAtamYt
YjAtNDMudWNvZGUKKyMgLVZlcnNpb246IDQzLjk1ZWI0ZTk3LjAKKyMgLQorIyAgRmlsZTogaXds
d2lmaS05MDAwLXB1LWIwLWpmLWIwLTQ2LnVjb2RlCisjICBWZXJzaW9uOiA0Ni5lYTM3MjhlZS4w
CisjICAKKyMgLUZpbGU6IGl3bHdpZmktOTI2MC10aC1iMC1qZi1iMC0zMy51Y29kZQorIyAtVmVy
c2lvbjogMzMuNjEwMjk0LjAKKyMgLQorIyAgRmlsZTogaXdsd2lmaS05MjYwLXRoLWIwLWpmLWIw
LTM0LnVjb2RlCisjICBWZXJzaW9uOiAzNC5iYTUwMWIxMS4wCisjICAKKyMgIEZpbGU6IGl3bHdp
ZmktOTI2MC10aC1iMC1qZi1iMC0zOC51Y29kZQorIyAgVmVyc2lvbjogMzguNzU1Y2ZkZDguMAor
IyAgCisjIC1GaWxlOiBpd2x3aWZpLTkyNjAtdGgtYjAtamYtYjAtNDEudWNvZGUKKyMgLVZlcnNp
b246IDQxLmZjMWE3YWVhLjAKKyMgLQorIyAtRmlsZTogaXdsd2lmaS05MjYwLXRoLWIwLWpmLWIw
LTQzLnVjb2RlCisjIC1WZXJzaW9uOiA0My45NWViNGU5Ny4wCisjIC0KKyMgIEZpbGU6IGl3bHdp
ZmktOTI2MC10aC1iMC1qZi1iMC00Ni51Y29kZQorIyAgVmVyc2lvbjogNDYuZWEzNzI4ZWUuMAor
IyAgCisjIC1GaWxlOiBpd2x3aWZpLWNjLWEwLTQ2LnVjb2RlCisjIC1WZXJzaW9uOiA0Ni4zY2Zh
YjhkYS4wCisjIC0KKyMgLUZpbGU6IGl3bHdpZmktY2MtYTAtNDgudWNvZGUKKyMgLVZlcnNpb246
IDQ4LjRmYTAwNDFmLjAKKyMgLQorIyAtRmlsZTogaXdsd2lmaS1RdS1iMC1oci1iMC00OC51Y29k
ZQorIyAtVmVyc2lvbjogNDguNGZhMDA0MWYuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLVF1LWIw
LWpmLWIwLTQ4LnVjb2RlCisjIC1WZXJzaW9uOiA0OC40ZmEwMDQxZi4wCisjIC0KKyMgLUZpbGU6
IGl3bHdpZmktUXUtYzAtaHItYjAtNDgudWNvZGUKKyMgLVZlcnNpb246IDQ4LjRmYTAwNDFmLjAK
KyMgLQorIyAtRmlsZTogaXdsd2lmaS1RdS1jMC1qZi1iMC00OC51Y29kZQorIyAtVmVyc2lvbjog
NDguNGZhMDA0MWYuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLVF1Wi1hMC1oci1iMC00OC51Y29k
ZQorIyAtVmVyc2lvbjogNDguNGZhMDA0MWYuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLVF1Wi1h
MC1qZi1iMC00OC51Y29kZQorIyAtVmVyc2lvbjogNDguNGZhMDA0MWYuMAorIyAtCisjICBGaWxl
OiBpd2x3aWZpLWNjLWEwLTUwLnVjb2RlCisjICBWZXJzaW9uOiA1MC4zZTM5MWQzZS4wCisjICAK
KyMgQEAgLTk0Niw0OCArODU2LDYgQEAKKyMgIEZpbGU6IGl3bHdpZmktUXVaLWEwLWpmLWIwLTUw
LnVjb2RlCisjICBWZXJzaW9uOiA1MC4zZTM5MWQzZS4wCisjICAKKyMgLUZpbGU6IGl3bHdpZmkt
Y2MtYTAtNTMudWNvZGUKKyMgLVZlcnNpb246IDUzLmMzMWFjNjc0LjAKKyMgLQorIyAtRmlsZTog
aXdsd2lmaS1RdS1iMC1oci1iMC01My51Y29kZQorIyAtVmVyc2lvbjogNTMuYzMxYWM2NzQuMAor
IyAtCisjIC1GaWxlOiBpd2x3aWZpLVF1LWIwLWpmLWIwLTUzLnVjb2RlCisjIC1WZXJzaW9uOiA1
My5jMzFhYzY3NC4wCisjIC0KKyMgLUZpbGU6IGl3bHdpZmktUXUtYzAtaHItYjAtNTMudWNvZGUK
KyMgLVZlcnNpb246IDUzLmMzMWFjNjc0LjAKKyMgLQorIyAtRmlsZTogaXdsd2lmaS1RdS1jMC1q
Zi1iMC01My51Y29kZQorIyAtVmVyc2lvbjogNTMuYzMxYWM2NzQuMAorIyAtCisjIC1GaWxlOiBp
d2x3aWZpLVF1Wi1hMC1oci1iMC01My51Y29kZQorIyAtVmVyc2lvbjogNTMuYzMxYWM2NzQuMAor
IyAtCisjIC1GaWxlOiBpd2x3aWZpLVF1Wi1hMC1qZi1iMC01My51Y29kZQorIyAtVmVyc2lvbjog
NTMuYzMxYWM2NzQuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLWNjLWEwLTU1LnVjb2RlCisjIC1W
ZXJzaW9uOiA1NS5kOTY5ODA2NS4wCisjIC0KKyMgLUZpbGU6IGl3bHdpZmktUXUtYjAtaHItYjAt
NTUudWNvZGUKKyMgLVZlcnNpb246IDU1LmQ5Njk4MDY1LjAKKyMgLQorIyAtRmlsZTogaXdsd2lm
aS1RdS1iMC1qZi1iMC01NS51Y29kZQorIyAtVmVyc2lvbjogNTUuZDk2OTgwNjUuMAorIyAtCisj
IC1GaWxlOiBpd2x3aWZpLVF1LWMwLWhyLWIwLTU1LnVjb2RlCisjIC1WZXJzaW9uOiA1NS5kOTY5
ODA2NS4wCisjIC0KKyMgLUZpbGU6IGl3bHdpZmktUXUtYzAtamYtYjAtNTUudWNvZGUKKyMgLVZl
cnNpb246IDU1LmQ5Njk4MDY1LjAKKyMgLQorIyAtRmlsZTogaXdsd2lmaS1RdVotYTAtaHItYjAt
NTUudWNvZGUKKyMgLVZlcnNpb246IDU1LmQ5Njk4MDY1LjAKKyMgLQorIyAtRmlsZTogaXdsd2lm
aS1RdVotYTAtamYtYjAtNTUudWNvZGUKKyMgLVZlcnNpb246IDU1LmQ5Njk4MDY1LjAKKyMgLQor
IyAgRmlsZTogaXdsd2lmaS1jYy1hMC01OS51Y29kZQorIyAgVmVyc2lvbjogNTkuNjAxZjNhNjYu
MAorIyAgCisjIEBAIC0xMDA5LDgyICs4NzcsMTMgQEAKKyMgIEZpbGU6IGl3bHdpZmktUXVaLWEw
LWpmLWIwLTU5LnVjb2RlCisjICBWZXJzaW9uOiA1OS42MDFmM2E2Ni4wCisjICAKKyMgLUZpbGU6
IGl3bHdpZmktc28tYTAtZ2YtYTAtNjQudWNvZGUKKyMgLVZlcnNpb246IDY0Ljk3YmJlZTBhLjAK
KyMgLQorIyAtRmlsZTogaXdsd2lmaS1zby1hMC1nZi1hMC02Ny51Y29kZQorIyAtVmVyc2lvbjog
NjcuOGY1OWI4MGIuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLXNvLWEwLWdmNC1hMC02Ny51Y29k
ZQorIyAtVmVyc2lvbjogNjcuOGY1OWI4MGIuMAorIyAtCisjICBGaWxlOiBpd2x3aWZpLXNvLWEw
LWdmLWEwLnBudm0KKyMgIAorIyAgRmlsZTogaXdsd2lmaS1zby1hMC1nZjQtYTAucG52bQorIyAt
CisjIC1GaWxlOiBpd2x3aWZpLXNvLWEwLWhyLWIwLTY0LnVjb2RlCisjIC1WZXJzaW9uOiA2NC45
N2JiZWUwYS4wCisjIC0KKyMgLUZpbGU6IGl3bHdpZmktc28tYTAtamYtYjAtNjQudWNvZGUKKyMg
LVZlcnNpb246IDY0Ljk3YmJlZTBhLjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS10eS1hMC1nZi1h
MC01OS51Y29kZQorIyAgVmVyc2lvbjogNTkuNjAxZjNhNjYuMAorIyAgCisjIC1GaWxlOiBpd2x3
aWZpLWNjLWEwLTYyLnVjb2RlCisjIC1WZXJzaW9uOiA2Mi40OWVlYjU3Mi4wCisjIC0KKyMgLUZp
bGU6IGl3bHdpZmktUXUtYjAtaHItYjAtNjIudWNvZGUKKyMgLVZlcnNpb246IDYyLjQ5ZWViNTcy
LjAKKyMgLQorIyAtRmlsZTogaXdsd2lmaS1RdS1iMC1qZi1iMC02Mi51Y29kZQorIyAtVmVyc2lv
bjogNjIuNDllZWI1NzIuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLVF1LWMwLWhyLWIwLTYyLnVj
b2RlCisjIC1WZXJzaW9uOiA2Mi40OWVlYjU3Mi4wCisjIC0KKyMgLUZpbGU6IGl3bHdpZmktUXUt
YzAtamYtYjAtNjIudWNvZGUKKyMgLVZlcnNpb246IDYyLjQ5ZWViNTcyLjAKKyMgLQorIyAtRmls
ZTogaXdsd2lmaS1RdVotYTAtaHItYjAtNjIudWNvZGUKKyMgLVZlcnNpb246IDYyLjQ5ZWViNTcy
LjAKKyMgLQorIyAtRmlsZTogaXdsd2lmaS1RdVotYTAtamYtYjAtNjIudWNvZGUKKyMgLVZlcnNp
b246IDYyLjQ5ZWViNTcyLjAKKyMgLQorIyAtRmlsZTogaXdsd2lmaS10eS1hMC1nZi1hMC02Mi51
Y29kZQorIyAtVmVyc2lvbjogNjIuNDllZWI1NzIuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLWNj
LWEwLTYzLnVjb2RlCisjIC1WZXJzaW9uOiA2My5jMDRmMzQ4NS4wCisjIC0KKyMgLUZpbGU6IGl3
bHdpZmktY2MtYTAtNjcudWNvZGUKKyMgLVZlcnNpb246IDY3LjhmNTliODBiLjAKKyMgLQorIyAt
RmlsZTogaXdsd2lmaS1RdS1iMC1oci1iMC02My51Y29kZQorIyAtVmVyc2lvbjogNjMuYzA0ZjM0
ODUuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLVF1LWIwLWpmLWIwLTYzLnVjb2RlCisjIC1WZXJz
aW9uOiA2My5jMDRmMzQ4NS4wCisjIC0KKyMgLUZpbGU6IGl3bHdpZmktUXUtYzAtaHItYjAtNjMu
dWNvZGUKKyMgLVZlcnNpb246IDYzLmMwNGYzNDg1LjAKKyMgLQorIyAtRmlsZTogaXdsd2lmaS1R
dS1jMC1qZi1iMC02My51Y29kZQorIyAtVmVyc2lvbjogNjMuYzA0ZjM0ODUuMAorIyAtCisjIC1G
aWxlOiBpd2x3aWZpLVF1Wi1hMC1oci1iMC02My51Y29kZQorIyAtVmVyc2lvbjogNjMuYzA0ZjM0
ODUuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLVF1Wi1hMC1oci1iMC02Ny51Y29kZQorIyAtVmVy
c2lvbjogNjcuOGY1OWI4MGIuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLVF1Wi1hMC1qZi1iMC02
My51Y29kZQorIyAtVmVyc2lvbjogNjMuYzA0ZjM0ODUuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZp
LXR5LWEwLWdmLWEwLTYzLnVjb2RlCisjIC1WZXJzaW9uOiA2My5jMDRmMzQ4NS4wCisjIC0KKyMg
IEZpbGU6IGl3bHdpZmktY2MtYTAtNjYudWNvZGUKKyMgIFZlcnNpb246IDY2LmYxYzg2NGUwLjAK
KyMgIAorIyBAQCAtMTEwOCw4MSArOTA3LDYgQEAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS10eS1h
MC1nZi1hMC02Ni51Y29kZQorIyAgVmVyc2lvbjogNjYuZjFjODY0ZTAuMAorIyAtCisjIC1GaWxl
OiBpd2x3aWZpLXR5LWEwLWdmLWEwLTY3LnVjb2RlCisjIC1WZXJzaW9uOiA2Ny44ZjU5YjgwYi4w
CisjIC0KKyMgLUZpbGU6IGl3bHdpZmktY2MtYTAtNjgudWNvZGUKKyMgLVZlcnNpb246IDY4LjAx
ZDMwYjBjLjAKKyMgLQorIyAtRmlsZTogaXdsd2lmaS1RdS1iMC1oci1iMC02OC51Y29kZQorIyAt
VmVyc2lvbjogNjguMDFkMzBiMGMuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLVF1LWIwLWpmLWIw
LTY4LnVjb2RlCisjIC1WZXJzaW9uOiA2OC4wMWQzMGIwYy4wCisjIC0KKyMgLUZpbGU6IGl3bHdp
ZmktUXUtYzAtaHItYjAtNjgudWNvZGUKKyMgLVZlcnNpb246IDY4LjAxZDMwYjBjLjAKKyMgLQor
IyAtRmlsZTogaXdsd2lmaS1RdS1jMC1qZi1iMC02OC51Y29kZQorIyAtVmVyc2lvbjogNjguMDFk
MzBiMGMuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLVF1Wi1hMC1oci1iMC02OC51Y29kZQorIyAt
VmVyc2lvbjogNjguMDFkMzBiMGMuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLVF1Wi1hMC1qZi1i
MC02OC51Y29kZQorIyAtVmVyc2lvbjogNjguMDFkMzBiMGMuMAorIyAtCisjIC1GaWxlOiBpd2x3
aWZpLXR5LWEwLWdmLWEwLTY4LnVjb2RlCisjIC1WZXJzaW9uOiA2OC4wMWQzMGIwYy4wCisjIC0K
KyMgLUZpbGU6IGl3bHdpZmktc28tYTAtZ2Y0LWEwLTY4LnVjb2RlCisjIC1WZXJzaW9uOiA2OC4w
MWQzMGIwYy4wCisjIC0KKyMgLUZpbGU6IGl3bHdpZmktc28tYTAtZ2YtYTAtNjgudWNvZGUKKyMg
LVZlcnNpb246IDY4LjAxZDMwYjBjLjAKKyMgLQorIyAtRmlsZTogaXdsd2lmaS1zby1hMC1oci1i
MC02OC51Y29kZQorIyAtVmVyc2lvbjogNjguMDFkMzBiMGMuMAorIyAtCisjIC1GaWxlOiBpd2x3
aWZpLXNvLWEwLWpmLWIwLTY4LnVjb2RlCisjIC1WZXJzaW9uOiA2OC4wMWQzMGIwYy4wCisjIC0K
KyMgLUZpbGU6IGl3bHdpZmktY2MtYTAtNzEudWNvZGUKKyMgLVZlcnNpb246IDcxLjA1ODY1M2Y2
LjAKKyMgLQorIyAtRmlsZTogaXdsd2lmaS1RdS1iMC1oci1iMC03MS51Y29kZQorIyAtVmVyc2lv
bjogNzEuMDU4NjUzZjYuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLVF1LWIwLWpmLWIwLTcxLnVj
b2RlCisjIC1WZXJzaW9uOiA3MS4wNTg2NTNmNi4wCisjIC0KKyMgLUZpbGU6IGl3bHdpZmktUXUt
YzAtaHItYjAtNzEudWNvZGUKKyMgLVZlcnNpb246IDcxLjA1ODY1M2Y2LjAKKyMgLQorIyAtRmls
ZTogaXdsd2lmaS1RdS1jMC1qZi1iMC03MS51Y29kZQorIyAtVmVyc2lvbjogNzEuMDU4NjUzZjYu
MAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLVF1Wi1hMC1oci1iMC03MS51Y29kZQorIyAtVmVyc2lv
bjogNzEuMDU4NjUzZjYuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLVF1Wi1hMC1qZi1iMC03MS51
Y29kZQorIyAtVmVyc2lvbjogNzEuMDU4NjUzZjYuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLXR5
LWEwLWdmLWEwLTcxLnVjb2RlCisjIC1WZXJzaW9uOiA3MS4wNTg2NTNmNi4wCisjIC0KKyMgLUZp
bGU6IGl3bHdpZmktc28tYTAtZ2Y0LWEwLTcxLnVjb2RlCisjIC1WZXJzaW9uOiA3MS4wNTg2NTNm
Ni4wCisjIC0KKyMgLUZpbGU6IGl3bHdpZmktc28tYTAtZ2YtYTAtNzEudWNvZGUKKyMgLVZlcnNp
b246IDcxLjA1ODY1M2Y2LjAKKyMgLQorIyAtRmlsZTogaXdsd2lmaS1zby1hMC1oci1iMC03MS51
Y29kZQorIyAtVmVyc2lvbjogNzEuMDU4NjUzZjYuMAorIyAtCisjIC1GaWxlOiBpd2x3aWZpLXNv
LWEwLWpmLWIwLTcxLnVjb2RlCisjIC1WZXJzaW9uOiA3MS4wNTg2NTNmNi4wCisjICAKKyMgIEZp
bGU6IGl3bHdpZmktY2MtYTAtNzIudWNvZGUKKyMgIFZlcnNpb246IDcyLmRhYTA1MTI1LjAKKyMg
QEAgLTI2NjgsNiArMjM5MiwxMyBAQAorIyAgRmlsZTogYW1kZ3B1L2djXzExXzBfMF9tZXMuYmlu
CisjICBGaWxlOiBhbWRncHUvZ2NfMTFfMF8wX3BmcC5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18x
MV8wXzBfcmxjLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzBfMV9pbXUuYmluCisjICtGaWxl
OiBhbWRncHUvZ2NfMTFfMF8xX21lLmJpbgorIyArRmlsZTogYW1kZ3B1L2djXzExXzBfMV9tZWMu
YmluCisjICtGaWxlOiBhbWRncHUvZ2NfMTFfMF8xX21lcy5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9n
Y18xMV8wXzFfbWVzMS5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9nY18xMV8wXzFfcGZwLmJpbgorIyAr
RmlsZTogYW1kZ3B1L2djXzExXzBfMV9ybGMuYmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTFfMF8y
X2ltdS5iaW4KKyMgIEZpbGU6IGFtZGdwdS9nY18xMV8wXzJfbWUuYmluCisjICBGaWxlOiBhbWRn
cHUvZ2NfMTFfMF8yX21lYy5iaW4KKyMgQEAgLTI2NzUsMTIgKzI0MDYsMTUgQEAKKyMgIEZpbGU6
IGFtZGdwdS9nY18xMV8wXzJfbWVzLmJpbgorIyAgRmlsZTogYW1kZ3B1L2djXzExXzBfMl9wZnAu
YmluCisjICBGaWxlOiBhbWRncHUvZ2NfMTFfMF8yX3JsYy5iaW4KKyMgK0ZpbGU6IGFtZGdwdS9k
Y25fM18xXzRfZG1jdWIuYmluCisjICBGaWxlOiBhbWRncHUvZGNuXzNfMV81X2RtY3ViLmJpbgor
IyAgRmlsZTogYW1kZ3B1L2Rjbl8zXzFfNl9kbWN1Yi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9kY25f
M18yXzBfZG1jdWIuYmluCisjICBGaWxlOiBhbWRncHUvZGNuXzNfMl8xX2RtY3ViLmJpbgorIyAg
RmlsZTogYW1kZ3B1L3BzcF8xM18wXzBfc29zLmJpbgorIyAgRmlsZTogYW1kZ3B1L3BzcF8xM18w
XzBfdGEuYmluCisjICtGaWxlOiBhbWRncHUvcHNwXzEzXzBfNF90YS5iaW4KKyMgK0ZpbGU6IGFt
ZGdwdS9wc3BfMTNfMF80X3RvYy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9wc3BfMTNfMF81X2FzZC5i
aW4KKyMgIEZpbGU6IGFtZGdwdS9wc3BfMTNfMF81X3RhLmJpbgorIyAgRmlsZTogYW1kZ3B1L3Bz
cF8xM18wXzVfdG9jLmJpbgorIyBAQCAtMjY5MiwxMSArMjQyNiwxMyBAQAorIyAgRmlsZTogYW1k
Z3B1L3NkbWFfNV8yXzYuYmluCisjICBGaWxlOiBhbWRncHUvc2RtYV81XzJfNy5iaW4KKyMgIEZp
bGU6IGFtZGdwdS9zZG1hXzZfMF8wLmJpbgorIyArRmlsZTogYW1kZ3B1L3NkbWFfNl8wXzEuYmlu
CisjICBGaWxlOiBhbWRncHUvc2RtYV82XzBfMi5iaW4KKyMgIEZpbGU6IGFtZGdwdS9zbXVfMTNf
MF8wLmJpbgorIyAgRmlsZTogYW1kZ3B1L3NtdV8xM18wXzcuYmluCisjICBGaWxlOiBhbWRncHUv
dmNuXzNfMV8yLmJpbgorIyAgRmlsZTogYW1kZ3B1L3Zjbl80XzBfMC5iaW4KKyMgK0ZpbGU6IGFt
ZGdwdS92Y25fNF8wXzIuYmluCisjICBGaWxlOiBhbWRncHUvdmNuXzRfMF80LmJpbgorIyAgCisj
ICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTlNFLmFtZGdwdSBmb3IgZGV0YWls
cy4KKyMgQEAgLTI4ODksNyArMjYyNSw2IEBACisjICBGaWxlOiBicmNtL2JyY21mbWFjNDMzMC1z
ZGlvLmJpbgorIyAgRmlsZTogYnJjbS9icmNtZm1hYzQzMzQtc2Rpby5iaW4KKyMgIEZpbGU6IGJy
Y20vYnJjbWZtYWM0MzM1LXNkaW8uYmluCisjIC1GaWxlOiBicmNtL2JyY21mbWFjNDMzOS1zZGlv
LmJpbgorIyAgRmlsZTogYnJjbS9icmNtZm1hYzQzMjQxYjAtc2Rpby5iaW4KKyMgIEZpbGU6IGJy
Y20vYnJjbWZtYWM0MzI0MWI0LXNkaW8uYmluCisjICBGaWxlOiBicmNtL2JyY21mbWFjNDMyNDFi
NS1zZGlvLmJpbgorIyBAQCAtMjg5OSwxMCArMjYzNCw3IEBACisjICBGaWxlOiBicmNtL2JyY21m
bWFjNDM0MzBhMC1zZGlvLmJpbgorIyAgRmlsZTogYnJjbS9icmNtZm1hYzQzNTBjMi1wY2llLmJp
bgorIyAgRmlsZTogYnJjbS9icmNtZm1hYzQzNTAtcGNpZS5iaW4KKyMgLUZpbGU6IGJyY20vYnJj
bWZtYWM0MzU0LXNkaW8uYmluCisjICBGaWxlOiBicmNtL2JyY21mbWFjNDM1NjkuYmluCisjIC1G
aWxlOiBicmNtL2JyY21mbWFjNDM1Ni1wY2llLmJpbgorIyAtRmlsZTogYnJjbS9icmNtZm1hYzQz
NTYtc2Rpby5iaW4KKyMgIEZpbGU6IGJyY20vYnJjbWZtYWM0MzU4LXBjaWUuYmluCisjICBGaWxl
OiBicmNtL2JyY21mbWFjNDM2MDItcGNpZS5iaW4KKyMgIEZpbGU6IGJyY20vYnJjbWZtYWM0MzYw
Mi1wY2llLmFwLmJpbgorIyBAQCAtNDE0Niw3ICszODc4LDcgQEAKKyMgIEZpbGU6IGFtZC11Y29k
ZS9taWNyb2NvZGVfYW1kX2ZhbTE3aC5iaW4KKyMgIFZlcnNpb246IDIwMjItMDQtMDgKKyMgIEZp
bGU6IGFtZC11Y29kZS9taWNyb2NvZGVfYW1kX2ZhbTE5aC5iaW4KKyMgLVZlcnNpb246IDIwMjIt
MDktMzAKKyMgK1ZlcnNpb246IDIwMjMtMDEtMzEKKyMgIEZpbGU6IGFtZC11Y29kZS9SRUFETUUK
KyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5TRS5hbWQtdWNvZGUg
Zm9yIGRldGFpbHMKKyMgQEAgLTQ4ODgsNiArNDYyMCw5IEBACisjICBGaWxlOiBpOTE1L2FkbHBf
ZG1jX3ZlcjJfMTYuYmluCisjICBWZXJzaW9uOiBETUMgQVBJL0FQQiB2ZXIgMiByZWxlYXNlIDE2
IGZvciBBbGRlcmxha2UgUAorIyAgCisjICtGaWxlOiBpOTE1L2FkbHBfZG1jLmJpbgorIyArVmVy
c2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAxOCBmb3IgQWxkZXJsYWtlIFAKKyMgKwor
IyAgRmlsZTogaTkxNS9hZGxwX2d1Y182Mi4wLjMuYmluCisjICBWZXJzaW9uOiBHdUMgQVBJL0FQ
QiB2ZXIgNjIuMC4zIGZvciBBbGRlcmxha2UgUAorIyAgCisjIEBAIC00OTIzLDYgKzQ2NTgsOSBA
QAorIyAgCisjICBGaWxlOiBpOTE1L210bF9kbWNfdmVyMl8xMC5iaW4KKyMgIFZlcnNpb246IERN
QyBBUEkvQVBCIHZlciAyIHJlbGVhc2UgMTAgZm9yIE1ldGVvcmxha2UKKyMgKworIyArRmlsZTog
aTkxNS9tdGxfZG1jLmJpbgorIyArVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAx
MSBmb3IgTWV0ZW9ybGFrZQorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBM
SUNFTlNFLmk5MTUgZm9yIGRldGFpbHMKKyMgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisjIEBAIC01NTY5
LDkgKzUzMDcsOSBAQAorIyAgRHJpdmVyOiBtdDc5MjEgLSBNZWRpYVRlayBNVDc5MjEgV2lyZWxl
c3MgTUFDcworIyAgCisjICBGaWxlOiBtZWRpYXRlay9XSUZJX01UNzk2MV9wYXRjaF9tY3VfMV8y
X2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjIxMjI3MTUwOTEwYQorIyArVmVyc2lvbjogMjAyMzAx
MTcxNzA4NTVhCisjICBGaWxlOiBtZWRpYXRlay9XSUZJX1JBTV9DT0RFX01UNzk2MV8xLmJpbgor
IyAtVmVyc2lvbjogMjAyMjEyMjcxNTA5NTQKKyMgK1ZlcnNpb246IDIwMjMwMTE3MTcwOTQyCisj
ICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9y
IGRldGFpbHMuCisjICAKKyMgQEAgLTU1ODAsNyArNTMxOCw3IEBACisjICBEcml2ZXI6IG10Nzky
MSAtIE1lZGlhVGVrIE1UNzkyMSBibHVldG9vdGggY2hpcHNldAorIyAgCisjICBGaWxlOiBtZWRp
YXRlay9CVF9SQU1fQ09ERV9NVDc5NjFfMV8yX2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjIxMjI3
MTUxMzAxCisjICtWZXJzaW9uOiAyMDIzMDExNzE3MTE1MgorIyAgCisjICBMaWNlbmNlOiBSZWRp
c3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBA
IC02MTkzLDYgKzU5MzEsMTAgQEAKKyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNh
bGktMTAzYzg5OTEuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjODk3Mi5iaW4KKyMg
IExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzg5OTIuYmluIC0+IGNzMzVs
NDEtZHNwMS1zcGstcHJvdC0xMDNjODk3Mi5iaW4KKyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLWNhbGktMTAzYzg5OTIuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDNjODk3
Mi5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzg5OTQuYmlu
IC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjODk3My5iaW4KKyMgK0xpbms6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzg5OTQuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstY2Fs
aS0xMDNjODk3My5iaW4KKyMgK0xpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAz
Yzg5OTUuYmluIC0+IGNzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDNjODk3My5iaW4KKyMgK0xpbms6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzg5OTUuYmluIC0+IGNzMzVsNDEtZHNw
MS1zcGstY2FsaS0xMDNjODk3My5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3Br
LXByb3QtMTAzYzg5YzYtcjAuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1j
YWxpLTEwM2M4OWM2LXIwLmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDNjODljNi1sMC5iaW4KKyMgQEAgLTYyOTAsNiArNjAzMiwxNiBAQAorIyAgRmlsZTogY2ly
cnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWYxMi1zcGtpZDAtcjAuYmluCisjICBGaWxl
OiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxZjEyLXNwa2lkMS1sMC5iaW4KKyMg
IEZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFmMTItc3BraWQxLXIwLmJp
bgorIyArTGluazogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQzMWUxMi53bWZ3IC0+
IGNzMzVsNDEvdjYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArTGlu
azogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWUxMi53bWZ3IC0+IGNzMzVsNDEv
djYuNjEuMS9oYWxvX2NzcGxfUkFNX3JldkIyXzI5LjYzLjEud21mdworIyArRmlsZTogY2lycnVz
L2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWUxMi1zcGtpZDAtbDAuYmluCisjICtGaWxlOiBj
aXJydXMvY3MzNWw0MS1kc3AxLXNway1jYWxpLTEwNDMxZTEyLXNwa2lkMC1yMC5iaW4KKyMgK0Zp
bGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTA0MzFlMTItc3BraWQxLWwwLmJpbgor
IyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstY2FsaS0xMDQzMWUxMi1zcGtpZDEtcjAu
YmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwNDMxZTEyLXNwa2lk
MC1sMC5iaW4KKyMgK0ZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTA0MzFlMTIt
c3BraWQwLXIwLmJpbgorIyArRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJvdC0xMDQz
MWUxMi1zcGtpZDEtbDAuYmluCisjICtGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90
LTEwNDMxZTEyLXNwa2lkMS1yMC5iaW4KKyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxl
LiBTZWUgTElDRU5TRS5jaXJydXMgZm9yIGRldGFpbHMuCisjICAKKyMgCisjCisKIFNVTU1BUlkg
PSAiRmlybXdhcmUgZmlsZXMgZm9yIHVzZSB3aXRoIExpbnV4IGtlcm5lbCIKIEhPTUVQQUdFID0g
Imh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvIgogREVTQ1JJUFRJT04gPSAiTGludXggZmlybXdhcmUg
aXMgYSBwYWNrYWdlIGRpc3RyaWJ1dGVkIGFsb25nc2lkZSB0aGUgTGludXgga2VybmVsIFwKQEAg
LTEzMCw3ICs2NTYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTkNFLkFiaWxp
czttZDU9YjVlZTNmNDEwNzgwZTU2NzExYWQ0OGVhZGMyMmI4YmMgXAogICAgICAgICAgICAgICAg
ICAgICBmaWxlOi8vTElDRU5DRS54YzQwMDA7bWQ1PTBmZjUxZDJkYzQ5ZmNlMDQ4MTRjOTE1NTA4
MTA5MmYwIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM1MDAwO21kNT0x
ZTE3MGMxMzE3NTMyM2MzMmM3ZjRkMDk5OGQ1M2Y2NiBcCiAgICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9MSUNFTkNFLnhjNTAwMGM7bWQ1PTEyYjAyZWZhMzA0OWRiNjVkNTI0YWViNDE4ZGQ4N2Nh
IFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL1dIRU5DRTttZDU9JHtXSEVOQ0VfQ0hLU1VN
fSBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7bWQ1PWFhZGIzY2NjYmRlMWU1
M2ZjMjQ0YTQwOWU5YmQ1YTIyIFwKICAgICAgICAgICAgICAgICAgICAgIgogIyBXSEVOQ0UgY2hl
Y2tzdW0gaXMgZGVmaW5lZCBzZXBhcmF0ZWx5IHRvIGVhc2Ugb3ZlcnJpZGluZyBpdCBpZgogIyBj
bGFzcy1kZXZ1cHN0cmVhbSBpcyBzZWxlY3RlZC4KQEAgLTIxMiw3ICs3MzgsNyBAQCBTUkNfVVJJ
OmNsYXNzLWRldnVwc3RyZWFtID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9maXJtdwogIyBQaW4gdGhpcyB0byB0aGUgMjAyMjA1MDkgcmVsZWFzZSwgb3Zl
cnJpZGUgdGhpcyBpbiBsb2NhbC5jb25mCiBTUkNSRVY6Y2xhc3MtZGV2dXBzdHJlYW0gPz0gImIx
OWNiZGNhNzhhYjJhZGZkMjEwYzkxYmUxNWEyMjU2OGU4YjhjYWUiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJkZjExZTI1YmEyZmI0ZDUzNDM0NzM3NTdlMTdhM2I0Y2VmNTk5MjUwYTI2YjFmN2Uw
ZjAzODg1MGYwY2IzZDY0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZlM2Q5ZThkNTJjZmZjNGVj
MGRiZTg1MzNhODQ0NTMyOGUwNTI0YTIwZjE1OWE1YjYxYzI3MDZmOTgzY2UzOGEiCiAKIGluaGVy
aXQgYWxsYXJjaAogCi0tIAoyLjM3LjMKCg==

--===============5270369061565033519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: FILELIST: added "/lib/firmware/amdgpu/psp_13_0_4_toc.bin /lib/firmware/amdgpu/gc_11_0_1_rlc.bin /lib/firmware/amdgpu/gc_11_0_1_mec.bin /lib/firmware/amdgpu/dcn_3_1_4_dmcub.bin /lib/firmware/amdgpu/gc_11_0_1_pfp.bin /lib/firmware/amdgpu/gc_11_0_1_mes1.bin /lib/firmware/amdgpu/gc_11_0_1_me.bin /lib/firmware/amdgpu/gc_11_0_1_imu.bin /lib/firmware/amdgpu/vcn_4_0_2.bin /lib/firmware/amdgpu/gc_11_0_1_mes.bin /lib/firmware/amdgpu/psp_13_0_4_ta.bin /lib/firmware/amdgpu/sdma_6_0_1.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/mtl_dmc.bin /lib/firmware/i915/adlp_dmc.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGSIZE changed from 444128 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: FILELIST: removed all items "/lib/firmware/iwlwifi-6000g2a-5.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGSIZE changed from 460236 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: FILELIST: removed all items "/lib/firmware/iwlwifi-6000g2b-5.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGSIZE changed from 463692 to 0 (-100%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: FILELIST: removed all items "/lib/firmware/iwlwifi-6050-4.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGSIZE changed from 3097888 to 1036772 (-67%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: FILELIST: removed "/lib/firmware/iwlwifi-7265D-22.ucode /lib/firmware/iwlwifi-7265D-27.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGSIZE changed from 11535240 to 4876980 (-58%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: FILELIST: removed "/lib/firmware/iwlwifi-8000C-27.ucode /lib/firmware/iwlwifi-8000C-31.ucode /lib/firmware/iwlwifi-8000C-22.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGSIZE changed from 11231028 to 4877412 (-57%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: FILELIST: removed "/lib/firmware/iwlwifi-8265-31.ucode /lib/firmware/iwlwifi-8265-22.ucode /lib/firmware/iwlwifi-8265-27.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGSIZE changed from 14514260 to 6717640 (-54%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: FILELIST: removed "/lib/firmware/iwlwifi-9000-pu-b0-jf-b0-43.ucode /lib/firmware/iwlwifi-9000-pu-b0-jf-b0-33.ucode /lib/firmware/iwlwifi-9000-pu-b0-jf-b0-41.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGSIZE changed from 221488336 to 119452804 (-46%)
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: FILELIST: removed "/lib/firmware/iwlwifi-9260-th-b0-jf-b0-41.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0-71.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-48.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0-48.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-62.ucode /lib/firmware/iwlwifi-so-a0-gf4-a0-67.ucode /lib/firmware/iwlwifi-so-a0-gf4-a0-68.ucode /lib/firmware/iwlwifi-so-a0-gf4-a0-71.ucode /lib/firmware/iwlwifi-Qu-c0-hr-b0-63.ucode /lib/firmware/iwlwifi-Qu-c0-hr-b0-68.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-48.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-62.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-63.ucode /lib/firmware/iwlwifi-Qu-c0-hr-b0-53.ucode /lib/firmware/iwlwifi-Qu-c0-hr-b0-55.ucode /lib/firmware/iwlwifi-Qu-c0-hr-b0-62.ucode /lib/firmware/iwlwifi-Qu-c0-hr-b0-71.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-71.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-55.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-62.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-63.uco
 de /lib/firmware/iwlwifi-QuZ-a0-hr-b0-67.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-68.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-63.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-68.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-53.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-55.ucode /lib/firmware/iwlwifi-Qu-b0-jf-b0-71.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0-62.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0-63.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0-68.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0-53.ucode /lib/firmware/iwlwifi-Qu-b0-hr-b0-55.ucode /lib/firmware/iwlwifi-9260-th-b0-jf-b0-33.ucode /lib/firmware/iwlwifi-9260-th-b0-jf-b0-43.ucode /lib/firmware/iwlwifi-1000-3.ucode /lib/firmware/iwlwifi-5000-1.ucode /lib/firmware/iwlwifi-5000-2.ucode /lib/firmware/iwlwifi-3168-22.ucode /lib/firmware/iwlwifi-cc-a0-67.ucode /lib/firmware/iwlwifi-cc-a0-71.ucode /lib/firmware/iwlwifi-cc-a0-68.ucode /lib/firmware/iwlwifi-3168-27.ucode /lib/firmware/iwlwifi-cc-a0-46.ucode /lib/firmware/iwlwifi-cc-a0-48.ucode /lib/firmware/iwlw
 ifi-cc-a0-53.ucode /lib/firmware/iwlwifi-cc-a0-55.ucode /lib/firmware/iwlwifi-cc-a0-62.ucode /lib/firmware/iwlwifi-cc-a0-63.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-71.ucode /lib/firmware/iwlwifi-QuZ-a0-jf-b0-48.ucode /lib/firmware/iwlwifi-QuZ-a0-jf-b0-53.ucode /lib/firmware/iwlwifi-QuZ-a0-jf-b0-55.ucode /lib/firmware/iwlwifi-QuZ-a0-jf-b0-62.ucode /lib/firmware/iwlwifi-QuZ-a0-jf-b0-63.ucode /lib/firmware/iwlwifi-QuZ-a0-jf-b0-68.ucode /lib/firmware/iwlwifi-QuZ-a0-jf-b0-71.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-48.ucode /lib/firmware/iwlwifi-QuZ-a0-hr-b0-53.ucode /lib/firmware/iwlwifi-ty-a0-gf-a0-71.ucode /lib/firmware/iwlwifi-so-a0-hr-b0-71.ucode /lib/firmware/iwlwifi-so-a0-jf-b0-71.ucode /lib/firmware/iwlwifi-so-a0-jf-b0-68.ucode /lib/firmware/iwlwifi-ty-a0-gf-a0-62.ucode /lib/firmware/iwlwifi-ty-a0-gf-a0-63.ucode /lib/firmware/iwlwifi-ty-a0-gf-a0-67.ucode /lib/firmware/iwlwifi-so-a0-hr-b0-68.ucode /lib/firmware/iwlwifi-so-a0-gf-a0-68.ucode /lib/firmware/iwlwifi-so-a0-gf-a0-67.uco
 de /lib/firmware/iwlwifi-ty-a0-gf-a0-68.ucode /lib/firmware/iwlwifi-so-a0-hr-b0-64.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-68.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-53.ucode /lib/firmware/iwlwifi-Qu-c0-jf-b0-55.ucode /lib/firmware/iwlwifi-so-a0-jf-b0-64.ucode /lib/firmware/iwlwifi-Qu-c0-hr-b0-48.ucode /lib/firmware/iwlwifi-so-a0-gf-a0-64.ucode /lib/firmware/iwlwifi-so-a0-gf-a0-71.ucode"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8994.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8994.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431e12.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-10431e12-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431e12.wmfw /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-l0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-103c8995.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid1-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-prot-10431e12-spkid0-r0.bin /lib/firmware/cirrus/cs35l41-dsp1-spk-cali-103c8995.bin"

--===============5270369061565033519==--

