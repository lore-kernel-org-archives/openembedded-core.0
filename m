Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48947C7EE26
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:02 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.32138.1680384534966378332
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lSGoJOGN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101873eb92e18-f9a7c526-f1b6-44c1-b974-d0a1646bfaf9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+VhK1vM5LSTqWAQvPVlTz+p3N11+UWaNF6pOwNsuigo=;
	b=lSGoJOGNAgyBKZRflMHJzXTdJESAHesMeuOLlcPUeEK76z+4SFcMQgn65ulwtzQv
	psnNlgukAZBXlY2Pv9s5Aa9DtFUnQjCJP5KU+SSZpKKlqRjnY28E0Qj2kH+cf3hPZ0f
	OmpT6gFsj2bw9ObbAMxeokzmiB2XTl/VfHrvONgk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+VhK1vM5LSTqWAQvPVlTz+p3N11+UWaNF6pOwNsuigo=;
	b=TWRWF2tHkgpubfoHZOQdjNBrr3b6FGWhqqYLFiij9oHi0aZodqmwgErFTTq+VH2U
	4vESBK4a5HUxIPMMc2yVf0v550u3Ctq0qEbU4sw0SVrRvqIcTue2hIlgawKVFR9yK+w
	h0gtJfBQr3YdGOCAtslMPV34va+7mUnBu/DnTwe4=
Content-Type: multipart/mixed; boundary="===============1830232196745519618=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20230310 SUCCEEDED
Message-ID: <010101873eb92e18-f9a7c526-f1b6-44c1-b974-d0a1646bfaf9-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179546

--===============1830232196745519618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20230310* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20230210-20230310.patch
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
--===============1830232196745519618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230210.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20230310.tar.xz"
packages/all-poky-linux/linux-firmware: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGSIZE changed from 6362673 to 6362678 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: RDEPENDS: added "linux-firmware"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGSIZE changed from 15624208 to 15679876 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: FILELIST: added "/lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b13 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b10 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b11 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b14 /lib/firmware/ath11k/IPQ5018/hw1.0/m3_fw.mdt /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.mdt /lib/firmware/ath11k/IPQ5018/hw1.0/Notice.txt /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b09 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b08 /lib/firmware/ath11k/IPQ5018/hw1.0/m3_fw.flist /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.flist /lib/firmware/ath11k/IPQ5018/hw1.0/m3_fw.b01 /lib/firmware/ath11k/IPQ5018/hw1.0/m3_fw.b00 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b00 /lib/firmware/ath11k/IPQ5018/hw1.0/m3_fw.b02 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b01 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b02 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b03 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b04 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b05 /lib/firmware/
 ath11k/IPQ5018/hw1.0/q6_fw.b07 /lib/firmware/ath11k/IPQ5018/hw1.0/board-2.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGSIZE changed from 44124274 to 53289884 (+21%)
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: FILELIST: added "/lib/firmware/brcm/brcmfmac4356-pcie.Intel Corporation-CHERRYVIEW D1 PLATFORM.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGSIZE changed from 627603 to 630698 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 157939 to 135358 (-14%)
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: FILELIST: removed "/lib/firmware/liquidio/lio_23xx_vsw.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGSIZE changed from 25463952 to 5029544 (-80%)
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGSIZE changed from 2041 to 1878 (-8%)
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: FILELIST: added "/lib/firmware/qat_4xxx_mmp.bin /lib/firmware/qat_4xxx.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGSIZE changed from 1453722 to 2269162 (+56%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-yamato-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 202866 to 203894 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20230210" to "20230310"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/rtlwifi/rtl8710bufw_SMIC.bin /lib/firmware/intel/avs/cnl/dsp_basefw.bin /lib/firmware/intel/catpt/bdw/dsp_basefw.bin /lib/firmware/intel/avs/apl/dsp_basefw.bin /lib/firmware/rtl_bt/rtl8821cs_config.bin /lib/firmware/brcm/brcmfmac43241b4-sdio.Advantech-MICA-071.txt /lib/firmware/rtl_bt/rtl8821cs_fw.bin /lib/firmware/intel/avs/skl/dsp_basefw.bin /lib/firmware/intel/avs/skl/dsp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin /lib/firmware/rtlwifi/rtl8710bufw_UMC.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20230210 [default] to 20230310 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 257919894 to 259537750 (+1%)

--===============1830232196745519618==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20230210-20230310.patch"

RnJvbSBlMjUxODdhYTU5ZjRlYWUwZjQ5ZTNkNDFkYTdiZWJmOWFiNTNhZTViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxODoyNTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
bnV4LWZpcm13YXJlOiB1cGdyYWRlIDIwMjMwMjEwIC0+IDIwMjMwMzEwCgotLS0KIC4uLjIwMjMw
MjEwLmJiID0+IGxpbnV4LWZpcm13YXJlXzIwMjMwMzEwLmJifSB8IDM2NSArKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzNjIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL3tsaW51eC1maXJtd2Fy
ZV8yMDIzMDIxMC5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIzMDMxMC5iYn0gKDgwJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJl
XzIwMjMwMjEwLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1m
aXJtd2FyZV8yMDIzMDMxMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjMwMjEwLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13
YXJlXzIwMjMwMzEwLmJiCmluZGV4IGJmNWQ0ZjU0ZTYuLjMxZjliNTQyZGUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVfMjAyMzAy
MTAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIzMDMxMC5iYgpAQCAtMSwzICsxLDM2MiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IExJQ0VOQ0UucWF0X2Zpcm13YXJlCisjICsrKyBMSUNFTkNFLnFhdF9maXJtd2FyZQorIyBAQCAt
MSw0ICsxLDQgQEAKKyMgLUNvcHlyaWdodCAoYykgMjAxNCwgSW50ZWwgQ29ycG9yYXRpb24uCisj
ICtDb3B5cmlnaHQgKGMpIDIwMTQtMjAyMyBJbnRlbCBDb3Jwb3JhdGlvbi4KKyMgIEFsbCByaWdo
dHMgcmVzZXJ2ZWQuCisjICAKKyMgIFJlZGlzdHJpYnV0aW9uLiAgUmVkaXN0cmlidXRpb24gYW5k
IHVzZSBpbiBiaW5hcnkgZm9ybSwgd2l0aG91dAorIyBAQCAtMTgsMTIgKzE4LDkgQEAKKyMgIHJv
eWFsdHktZnJlZSwgbm9uLWV4Y2x1c2l2ZSBsaWNlbnNlIHVuZGVyIHBhdGVudHMgaXQgbm93IG9y
IGhlcmVhZnRlcgorIyAgb3ducyBvciBjb250cm9scyB0byBtYWtlLCBoYXZlIG1hZGUsIHVzZSwg
aW1wb3J0LCBvZmZlciB0byBzZWxsIGFuZAorIyAgc2VsbCAoIlV0aWxpemUiKSB0aGlzIHNvZnR3
YXJlLCBidXQgc29sZWx5IHRvIHRoZSBleHRlbnQgdGhhdCBhbnkKKyMgLXN1Y2ggcGF0ZW50IGlz
IG5lY2Vzc2FyeSB0byBVdGlsaXplIHRoZSBzb2Z0d2FyZSBhbG9uZSwgb3IgaW4KKyMgLWNvbWJp
bmF0aW9uIHdpdGggYW4gb3BlcmF0aW5nIHN5c3RlbSBsaWNlbnNlZCB1bmRlciBhbiBhcHByb3Zl
ZCBPcGVuCisjIC1Tb3VyY2UgbGljZW5zZSBhcyBsaXN0ZWQgYnkgdGhlIE9wZW4gU291cmNlIElu
aXRpYXRpdmUgYXQKKyMgLWh0dHA6Ly9vcGVuc291cmNlLm9yZy9saWNlbnNlcy4gIFRoZSBwYXRl
bnQgbGljZW5zZSBzaGFsbCBub3QgYXBwbHkgdG8KKyMgLWFueSBvdGhlciBjb21iaW5hdGlvbnMg
d2hpY2ggaW5jbHVkZSB0aGlzIHNvZnR3YXJlLiAgTm8gaGFyZHdhcmUgcGVyCisjIC1zZSBpcyBs
aWNlbnNlZCBoZXJldW5kZXIuCisjICtzdWNoIHBhdGVudCBpcyBuZWNlc3NhcnkgdG8gVXRpbGl6
ZSB0aGUgc29mdHdhcmUgYWxvbmUuIFRoZSBwYXRlbnQKKyMgK2xpY2Vuc2Ugc2hhbGwgbm90IGFw
cGx5IHRvIGFueSBvdGhlciBjb21iaW5hdGlvbnMgd2hpY2ggaW5jbHVkZSB0aGlzCisjICtzb2Z0
d2FyZS4gTm8gaGFyZHdhcmUgcGVyIHNlIGlzIGxpY2Vuc2VkIGhlcmV1bmRlci4KKyMgIAorIyAg
RElTQ0xBSU1FUi4gIFRISVMgU09GVFdBUkUgSVMgUFJPVklERUQgQlkgVEhFIENPUFlSSUdIVCBI
T0xERVJTIEFORAorIyAgQ09OVFJJQlVUT1JTICJBUyBJUyIgQU5EIEFOWSBFWFBSRVNTIE9SIElN
UExJRUQgV0FSUkFOVElFUywgSU5DTFVESU5HLAorIyAtLS0gV0hFTkNFCisjICsrKyBXSEVOQ0UK
KyMgQEAgLTM5NSw3ICszOTUsNyBAQAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUu
IFNlZSBMSUNFTkNFLnFsYTJ4eHggZm9yIGRldGFpbHMKKyMgIAorIyAtQXZhaWxhYmxlIGZyb20g
aHR0cDovL2xkcml2ZXIucWxvZ2ljLmNvbS9maXJtd2FyZS8gCisjICtBdmFpbGFibGUgZnJvbSBo
dHRwOi8vbGRyaXZlci5xbG9naWMuY29tL2Zpcm13YXJlLworIyAgCisjICAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQorIyAgCisjIEBAIC05MzAsNyArOTMwLDcgQEAKKyMgIFZlcnNpb246IDcyLmRhYTA1MTI1
LjAKKyMgIAorIyAgRmlsZTogaXdsd2lmaS10eS1hMC1nZi1hMC03Mi51Y29kZQorIyAtVmVyc2lv
bjogNzIuZGFhMDUxMjUuMAorIyArVmVyc2lvbjogNzIuYTc2NGJhYWMuMAorIyAgCisjICBGaWxl
OiBpd2x3aWZpLXNvLWEwLWdmNC1hMC03Mi51Y29kZQorIyAgVmVyc2lvbjogNzIuZGFhMDUxMjUu
MAorIyBAQCAtMTAwMiw3ICsxMDAyLDcgQEAKKyMgIFZlcnNpb246IDc0LmE1ZTk1ODhiLjAKKyMg
IAorIyAgRmlsZTogaXdsd2lmaS10eS1hMC1nZi1hMC03NC51Y29kZQorIyAtVmVyc2lvbjogNzQu
YTVlOTU4OGIuMAorIyArVmVyc2lvbjogNzQuZmUxNzQ4NmUuMAorIyAgCisjICBGaWxlOiBpd2x3
aWZpLXNvLWEwLWdmNC1hMC03NC51Y29kZQorIyAgVmVyc2lvbjogNzQuYTVlOTU4OGIuMAorIyBA
QCAtMTA3MiwxMCArMTA3Miw2IEBACisjICAKKyMgIEZpbGU6IGl3bHdpZmktc28tYTAtamYtYjAt
NzcudWNvZGUKKyMgIFZlcnNpb246IDc0LmY5MmI1ZmVkLjAKKyMgLQorIyAtRmlsZTogaXdsd2lm
aS1zby1hMC1nZi1hMC5wbnZtCisjIC0KKyMgLUZpbGU6IGl3bHdpZmktc28tYTAtZ2Y0LWEwLnBu
dm0KKyMgIAorIyAgRmlsZTogaXdsd2lmaS10eS1hMC1nZi1hMC5wbnZtCisjICAKKyMgQEAgLTI1
NjMsMjkgKzI1NTksMjkgQEAKKyMgIERyaXZlcjogdWVhZ2xlLWF0bSAtIERyaXZlciBmb3IgVVNC
IEFEU0wgTW9kZW1zIGJhc2VkIG9uIEVhZ2xlIEksSUksSUlJCisjICAKKyMgIEZpbGU6IHVlYWds
ZS1hdG0vOTMwLWZwZ2EuYmluCisjIC1GaWxlOiB1ZWFnbGUtYXRtL0NNVmVpV08uYmluICAgIAor
IyAtRmlsZTogdWVhZ2xlLWF0bS9DTVZlcEZSMTAuYmluICAKKyMgLUZpbGU6IHVlYWdsZS1hdG0v
RFNQOXAuYmluCQorIyArRmlsZTogdWVhZ2xlLWF0bS9DTVZlaVdPLmJpbgorIyArRmlsZTogdWVh
Z2xlLWF0bS9DTVZlcEZSMTAuYmluCisjICtGaWxlOiB1ZWFnbGUtYXRtL0RTUDlwLmJpbgorIyAg
RmlsZTogdWVhZ2xlLWF0bS9lYWdsZUlJSS5mdworIyAtRmlsZTogdWVhZ2xlLWF0bS9hZGk5MzAu
ZncgICAgIAorIyAtRmlsZTogdWVhZ2xlLWF0bS9DTVZlcC5iaW4gICAgICAKKyMgLUZpbGU6IHVl
YWdsZS1hdG0vQ01WZXBGUi5iaW4gICAgCisjICtGaWxlOiB1ZWFnbGUtYXRtL2FkaTkzMC5mdwor
IyArRmlsZTogdWVhZ2xlLWF0bS9DTVZlcC5iaW4KKyMgK0ZpbGU6IHVlYWdsZS1hdG0vQ01WZXBG
Ui5iaW4KKyMgIEZpbGU6IHVlYWdsZS1hdG0vRFNQZWkuYmluCisjIC1GaWxlOiB1ZWFnbGUtYXRt
L0NNVjlpLmJpbiAgICAgCisjIC1GaWxlOiB1ZWFnbGUtYXRtL0NNVmVwRVMwMy5iaW4gIAorIyAt
RmlsZTogdWVhZ2xlLWF0bS9DTVZlcElULmJpbiAgICAKKyMgK0ZpbGU6IHVlYWdsZS1hdG0vQ01W
OWkuYmluCisjICtGaWxlOiB1ZWFnbGUtYXRtL0NNVmVwRVMwMy5iaW4KKyMgK0ZpbGU6IHVlYWds
ZS1hdG0vQ01WZXBJVC5iaW4KKyMgIEZpbGU6IHVlYWdsZS1hdG0vRFNQZXAuYmluCisjIC1GaWxl
OiB1ZWFnbGUtYXRtL0NNVjlwLmJpbiAgICAgCisjIC1GaWxlOiB1ZWFnbGUtYXRtL0NNVmVwRVMu
YmluICAgIAorIyAtRmlsZTogdWVhZ2xlLWF0bS9DTVZlcFdPLmJpbiAgICAKKyMgK0ZpbGU6IHVl
YWdsZS1hdG0vQ01WOXAuYmluCisjICtGaWxlOiB1ZWFnbGUtYXRtL0NNVmVwRVMuYmluCisjICtG
aWxlOiB1ZWFnbGUtYXRtL0NNVmVwV08uYmluCisjICBGaWxlOiB1ZWFnbGUtYXRtL2VhZ2xlSS5m
dworIyAtRmlsZTogdWVhZ2xlLWF0bS9DTVZlaS5iaW4gICAgIAorIyAtRmlsZTogdWVhZ2xlLWF0
bS9DTVZlcEZSMDQuYmluICAKKyMgLUZpbGU6IHVlYWdsZS1hdG0vRFNQOWkuYmluCSAgICAKKyMg
K0ZpbGU6IHVlYWdsZS1hdG0vQ01WZWkuYmluCisjICtGaWxlOiB1ZWFnbGUtYXRtL0NNVmVwRlIw
NC5iaW4KKyMgK0ZpbGU6IHVlYWdsZS1hdG0vRFNQOWkuYmluCisjICBGaWxlOiB1ZWFnbGUtYXRt
L2VhZ2xlSUkuZncKKyMgIFZlcnNpb246IDEuMQorIyAgCisjIC1MaWNlbmNlOiBSZWRpc3RyaWJ1
dGFibGUuIEJhc2VkIG9uIAorIyArTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBCYXNlZCBvbgor
IyAgICAgICAgICAgaHR0cHM6Ly9tYWlsLmduYS5vcmcvcHVibGljL2VhZ2xldXNiLWRldi8yMDA0
LTExL21zZzAwMTcyLmh0bWwKKyMgIAorIyAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgQEAgLTI2OTAs
NiArMjY4Niw3IEBACisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VO
Q0UuY3lwcmVzcyBmb3IgZGV0YWlscy4KKyMgIAorIyArRmlsZTogImJyY20vYnJjbWZtYWM0MzI0
MWI0LXNkaW8uQWR2YW50ZWNoLU1JQ0EtMDcxLnR4dCIKKyMgIEZpbGU6ICJicmNtL2JyY21mbWFj
NDMyNDFiNC1zZGlvLkludGVsIENvcnAuLVZBTExFWVZJRVcgQzAgUExBVEZPUk0udHh0IgorIyAg
RmlsZTogImJyY20vYnJjbWZtYWM0MzMwLXNkaW8uUHJvd2lzZS1QVDMwMS50eHQiCisjICBGaWxl
OiAiYnJjbS9icmNtZm1hYzQzMzQwLXNkaW8uQVNVU1RlSyBDT01QVVRFUiBJTkMuLVRGMTAzQ0Uu
dHh0IgorIyBAQCAtMjcyNiw2ICsyNzIzLDcgQEAKKyMgIExpbms6IGJyY20vYnJjbWZtYWM0MzQ1
NS1zZGlvLlJhc3BiZXJyeVwgUGlcIEZvdW5kYXRpb24tUmFzcGJlcnJ5XCBQaVwgQ29tcHV0ZVwg
TW9kdWxlXCA0LnR4dCAtPiBicmNtZm1hYzQzNDU1LXNkaW8ucmFzcGJlcnJ5cGksNC1tb2RlbC1i
LnR4dAorIyAgRmlsZTogImJyY20vYnJjbWZtYWM0MzQ1NS1zZGlvLk1JTklYLU5FTyBaODMtNC50
eHQiCisjICBGaWxlOiAiYnJjbS9icmNtZm1hYzQzNTYtcGNpZS5ncGQtd2luLXBvY2tldC50eHQi
CisjICtGaWxlOiAiYnJjbS9icmNtZm1hYzQzNTYtcGNpZS5JbnRlbCBDb3Jwb3JhdGlvbi1DSEVS
UllWSUVXIEQxIFBMQVRGT1JNLnR4dCIKKyMgIEZpbGU6ICJicmNtL2JyY21mbWFjNDM1Ni1wY2ll
LlhpYW9taSBJbmMtTWlwYWQyLnR4dCIKKyMgIEZpbGU6IGJyY20vYnJjbWZtYWM0MzU2LXNkaW8u
QVA2MzU2Uy50eHQKKyMgIExpbms6IGJyY20vYnJjbWZtYWM0MzU2LXNkaW8uZmlyZWZseSxmaXJl
Zmx5LXJrMzM5OS50eHQgLT4gYnJjbWZtYWM0MzU2LXNkaW8uQVA2MzU2Uy50eHQKKyMgQEAgLTI5
ODAsMTkgKzI5NzgsNiBAQAorIyAgCisjICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAgCisjIC1Ecml2
ZXI6IHI4NzIzYXUgLSBSZWFsdGVrIDgwMi4xMW4gV0xBTiBkcml2ZXIgZm9yIFJUTDg3MjNBVQor
IyAtCisjIC1JbmZvOiBUYWtlbiBmcm9tIFJlYWx0ZWsgZHJpdmVyIHJ0bDg3MjNBX1dpRmlfbGlu
dXhfdjQuMS4zXzYwNDQuMjAxMjEyMjQKKyMgLSAgICAgIEZpcm13YXJlIGlzIGVtYmVkZGVkIGlu
IHRoZSBkcml2ZXIgYXMgZGF0YSBzdGF0ZW1lbnRzLiBUaGlzIGluZm8KKyMgLSAgICAgIGhhcyBi
ZWVuIGV4dHJhY3RlZCBpbnRvIGEgYmluYXJ5IGZpbGUuCisjIC1GaWxlOiBydGx3aWZpL3J0bDg3
MjNhdWZ3X0EuYmluCisjIC1GaWxlOiBydGx3aWZpL3J0bDg3MjNhdWZ3X0IuYmluCisjIC1GaWxl
OiBydGx3aWZpL3J0bDg3MjNhdWZ3X0JfTm9CVC5iaW4KKyMgLQorIyAtTGljZW5jZTogUmVkaXN0
cmlidXRhYmxlLiBTZWUgTElDRU5DRS5ydGx3aWZpX2Zpcm13YXJlLnR4dCBmb3IgZGV0YWlscy4K
KyMgLQorIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgLQorIyAgRHJpdmVyOiBydGw4MTg4ZWUgLSBS
ZWFsdGVrIDgwMi4xMW4gV0xBTiBkcml2ZXIgZm9yIFJUTDgxODhFRQorIyAgCisjICBJbmZvOiBU
YWtlbiBmcm9tIFJlYWx0ZWsgdmVyc2lvbiBydGxfOTJjZV85MnNlXzkyZGVfODcyM2FlXzg4ZWVf
bGludXhfbWFjODAyMTFfMDAxMC4wMTA5LjIwMTMKKyMgQEAgLTMxMzQsNiArMzExOSwxMSBAQAor
IyAgICAgICAgRmlybXdhcmUgd2FzIGVtYmVkZGVkIGluIHRoZSBkcml2ZXIgYXMgZGF0YSBzdGF0
ZW1lbnRzLiBUaGlzIGluZm8KKyMgICAgICAgIGhhcyBiZWVuIGV4dHJhY3RlZCBpbnRvIGEgYmlu
YXJ5IGZpbGUuCisjICBGaWxlOiBydGx3aWZpL3J0bDgxODhmdWZ3LmJpbgorIyArCisjICtGaWxl
OiBydGx3aWZpL3J0bDg3MTBidWZ3X1NNSUMuYmluCisjICtWZXJzaW9uOiAxNi4wCisjICtGaWxl
OiBydGx3aWZpL3J0bDg3MTBidWZ3X1VNQy5iaW4KKyMgK1ZlcnNpb246IDE2LjAKKyMgIAorIyAg
TGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5ydGx3aWZpX2Zpcm13YXJlLnR4
dCBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtMzM0NSw3ICszMzM1LDcgQEAKKyMgIFZlcnNpb246
IFdMQU4uUk0uNC40LjEtMDAyODgtUUNBUk1TV1BaLTEKKyMgIEZpbGU6IGF0aDEway9RQ0E2MTc0
L2h3My4wL25vdGljZV9hdGgxMGtfZmlybXdhcmUtNi50eHQKKyMgIEZpbGU6IGF0aDEway9RQ0E2
MTc0L2h3My4wL2Zpcm13YXJlLXNkaW8tNi5iaW4KKyMgLVZlcnNpb246IFdMQU4uUk1ILjQuNC4x
LTAwMDc3CisjICtWZXJzaW9uOiBXTEFOLlJNSC40LjQuMS0wMDE3NAorIyAgRmlsZTogYXRoMTBr
L1FDQTYxNzQvaHczLjAvbm90aWNlX2F0aDEwa19maXJtd2FyZS1zZGlvLTYudHh0CisjICBGaWxl
OiBhdGgxMGsvUUNBOTM3Ny9odzEuMC9ib2FyZC5iaW4KKyMgIEZpbGU6IGF0aDEway9RQ0E5Mzc3
L2h3MS4wL2JvYXJkLTIuYmluCisjIEBAIC0zNDM2LDcgKzM0MjYsNyBAQAorIyAgRmlsZTogYXRo
MTFrL1dDTjY4NTUvaHcyLjAvYm9hcmQtMi5iaW4KKyMgIEZpbGU6IGF0aDExay9XQ042ODU1L2h3
Mi4wL2Ftc3MuYmluCisjICBGaWxlOiBhdGgxMWsvV0NONjg1NS9odzIuMC9tMy5iaW4KKyMgLVZl
cnNpb246IFdMQU4uSFNQLjEuMS0wMzEyNS1RQ0FIU1BTV1BMX1YxX1YyX1NJTElDT05aX0xJVEUt
My42NTEwLjkKKyMgK1ZlcnNpb246IFdMQU4uSFNQLjEuMS0wMzEyNS1RQ0FIU1BTV1BMX1YxX1Yy
X1NJTElDT05aX0xJVEUtMy42NTEwLjIzCisjICBGaWxlOiBhdGgxMWsvV0NONjg1NS9odzIuMC9O
b3RpY2UudHh0CisjICBMaW5rOiBhdGgxMWsvV0NONjg1NS9odzIuMS9yZWdkYi5iaW4gLT4gLi4v
aHcyLjAvcmVnZGIuYmluCisjICBMaW5rOiBhdGgxMWsvV0NONjg1NS9odzIuMS9ib2FyZC0yLmJp
biAtPiAuLi9odzIuMC9ib2FyZC0yLmJpbgorIyBAQCAtMzQ2MCw2ICszNDUwLDI5IEBACisjICBG
aWxlOiBhdGgxMWsvV0NONjc1MC9odzEuMC93cHNzLm1kdAorIyAgVmVyc2lvbjogV0xBTi5NU0wu
MS4wLjEtMDA4ODctUUNBTVNMU1dQTFotMQorIyAgRmlsZTogYXRoMTFrL1dDTjY3NTAvaHcxLjAv
Tm90aWNlLnR4dAorIyArRmlsZTogYXRoMTFrL0lQUTUwMTgvaHcxLjAvYm9hcmQtMi5iaW4KKyMg
K0ZpbGU6IGF0aDExay9JUFE1MDE4L2h3MS4wL20zX2Z3LmIwMAorIyArRmlsZTogYXRoMTFrL0lQ
UTUwMTgvaHcxLjAvbTNfZncuYjAxCisjICtGaWxlOiBhdGgxMWsvSVBRNTAxOC9odzEuMC9tM19m
dy5iMDIKKyMgK0ZpbGU6IGF0aDExay9JUFE1MDE4L2h3MS4wL20zX2Z3LmZsaXN0CisjICtGaWxl
OiBhdGgxMWsvSVBRNTAxOC9odzEuMC9tM19mdy5tZHQKKyMgK0ZpbGU6IGF0aDExay9JUFE1MDE4
L2h3MS4wL3E2X2Z3LmIwMAorIyArRmlsZTogYXRoMTFrL0lQUTUwMTgvaHcxLjAvcTZfZncuYjAx
CisjICtGaWxlOiBhdGgxMWsvSVBRNTAxOC9odzEuMC9xNl9mdy5iMDIKKyMgK0ZpbGU6IGF0aDEx
ay9JUFE1MDE4L2h3MS4wL3E2X2Z3LmIwMworIyArRmlsZTogYXRoMTFrL0lQUTUwMTgvaHcxLjAv
cTZfZncuYjA0CisjICtGaWxlOiBhdGgxMWsvSVBRNTAxOC9odzEuMC9xNl9mdy5iMDUKKyMgK0Zp
bGU6IGF0aDExay9JUFE1MDE4L2h3MS4wL3E2X2Z3LmIwNworIyArRmlsZTogYXRoMTFrL0lQUTUw
MTgvaHcxLjAvcTZfZncuYjA4CisjICtGaWxlOiBhdGgxMWsvSVBRNTAxOC9odzEuMC9xNl9mdy5i
MDkKKyMgK0ZpbGU6IGF0aDExay9JUFE1MDE4L2h3MS4wL3E2X2Z3LmIxMAorIyArRmlsZTogYXRo
MTFrL0lQUTUwMTgvaHcxLjAvcTZfZncuYjExCisjICtGaWxlOiBhdGgxMWsvSVBRNTAxOC9odzEu
MC9xNl9mdy5iMTMKKyMgK0ZpbGU6IGF0aDExay9JUFE1MDE4L2h3MS4wL3E2X2Z3LmIxNAorIyAr
RmlsZTogYXRoMTFrL0lQUTUwMTgvaHcxLjAvcTZfZncuZmxpc3QKKyMgK0ZpbGU6IGF0aDExay9J
UFE1MDE4L2h3MS4wL3E2X2Z3Lm1kdAorIyArVmVyc2lvbjogV0xBTi5ISy4yLjYuMC4xLTAwODYx
LVFDQUhLU1dQTF9TSUxJQ09OWi0xCisjICtGaWxlOiBhdGgxMWsvSVBRNTAxOC9odzEuMC9Ob3Rp
Y2UudHh0CisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuUXVh
bGNvbW1BdGhlcm9zX2F0aDEwayBmb3IgZGV0YWlscworIyAgCisjIEBAIC0zNzY5LDYgKzM3ODIs
OCBAQAorIyAgRmlsZTogcnRsX2J0L3J0bDg3MjNkX2NvbmZpZy5iaW4KKyMgIEZpbGU6IHJ0bF9i
dC9ydGw4ODIxY19mdy5iaW4KKyMgIEZpbGU6IHJ0bF9idC9ydGw4ODIxY19jb25maWcuYmluCisj
ICtGaWxlOiBydGxfYnQvcnRsODgyMWNzX2Z3LmJpbgorIyArRmlsZTogcnRsX2J0L3J0bDg4MjFj
c19jb25maWcuYmluCisjICBGaWxlOiBydGxfYnQvcnRsODgyMmN1X2Z3LmJpbgorIyAgRmlsZTog
cnRsX2J0L3J0bDg4MjJjdV9jb25maWcuYmluCisjICBGaWxlOiBydGxfYnQvcnRsODgyMmNzX2Z3
LmJpbgorIyBAQCAtMzkyNiw3ICszOTQxLDcgQEAKKyMgIAorIyAgICBUaGlzIFNERCAoIlN0YXRp
YyBEeW5hbWljIERhdGEiKSBmaWxlIGlzIGxpY2Vuc2VkIHN0cmljdGx5IGZvciB1c2Ugd2l0aAor
IyAgICB0aGUgU2FncmFkIFdpRmkgbW9kdWxlcyAoc3VjaCBhcyB0aGUgU0c5MDEtMTA5MS8xMDk4
KSB0aGF0IHV0aWxpemUgdGhlCisjIC0gIGN3MTIwMCBkcml2ZXIuIFRoZXJlIGlzIG5vIHdhcnJh
bnR5IGV4cHJlc3NlZCBvciBpbXBsaWVkIGFib3V0IGl0cyAKKyMgKyAgY3cxMjAwIGRyaXZlci4g
VGhlcmUgaXMgbm8gd2FycmFudHkgZXhwcmVzc2VkIG9yIGltcGxpZWQgYWJvdXQgaXRzCisjICAg
IGZpdG5lc3MgZm9yIGFueSBwdXJwb3NlLgorIyAgCisjICAgIFBlcm1pc3Npb24gaXMgaGVyZWJ5
IGdyYW50ZWQgZm9yIHRoZSBkaXN0cmlidXRpb24gb2YgdGhpcyBTREQgZmlsZSBhcworIyBAQCAt
Mzk3Miw2ICszOTg3LDggQEAKKyMgIEZpbGU6IHFhdF9jNjJ4LmJpbgorIyAgRmlsZTogcWF0X2M2
MnhfbW1wLmJpbgorIyAgTGluazogcWF0X21tcC5iaW4gLT4gcWF0Xzg5NXhjY19tbXAuYmluCisj
ICtGaWxlOiBxYXRfNHh4eC5iaW4KKyMgK0ZpbGU6IHFhdF80eHh4X21tcC5iaW4KKyMgIAorIyAg
TGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5xYXRfZmlybXdhcmUgZm9yIGRl
dGFpbHMKKyMgIAorIyBAQCAtNDA0MywxMiArNDA2MCwzMiBAQAorIyAgCisjICAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQorIyAgCisjIC1Ecml2ZXI6IHNuZF9zb2Nfc3N0X2FjcGkKKyMgLQorIyAtRmlsZTog
aW50ZWwvSW50Y1NTVDIuYmluCisjIC1WZXJzaW9uOiA4LjQuMS43NworIyArRHJpdmVyOiBzbmRf
c29jX2NhdHB0IC0tIEludGVsIEF1ZGlvRFNQIGRyaXZlciBmb3IgSFNXL0JEVyBwbGF0Zm9ybXMK
KyMgKworIyArRmlsZTogaW50ZWwvY2F0cHQvYmR3L2RzcF9iYXNlZncuYmluCisjICtWZXJzaW9u
OiA0NGI4MWM0ZDUzOTdhNjMxMDgzNTZmNThmMDM2OTUzZDliMjg4YzRlCisjICtMaW5rOiBpbnRl
bC9JbnRjU1NUMi5iaW4gLT4gY2F0cHQvYmR3L2RzcF9iYXNlZncuYmluCisjICAKKyMgIExpY2Vu
c2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuSW50Y1NTVDIgZm9yIGRldGFpbHMKKyMg
KworIyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKyMgKworIyArRHJpdmVyOiBzbmRfc29jX2F2cyAtLSBJ
bnRlbCBBdWRpb0RTUCBkcml2ZXIgZm9yIGNBVlMgcGxhdGZvcm1zCisjICsKKyMgK0ZpbGU6IGlu
dGVsL2F2cy9za2wvZHNwX2Jhc2Vmdy5iaW4KKyMgK0ZpbGU6IGludGVsL2F2cy9za2wvZHNwX21v
ZF83Q0FEMDgwOC1BQjEwLUNEMjMtRUY0NS0xMkFCMzRDRDU2RUYuYmluCisjICtWZXJzaW9uOiA5
LjIxLjAwLjQ4OTkKKyMgK0xpbms6IGludGVsL2RzcF9md19yZWxlYXNlLmJpbiAtPiBhdnMvc2ts
L2RzcF9iYXNlZncuYmluCisjICtMaW5rOiBpbnRlbC9kc3BfZndfa2JsLmJpbiAtPiBhdnMvc2ts
L2RzcF9iYXNlZncuYmluCisjICtGaWxlOiBpbnRlbC9hdnMvYXBsL2RzcF9iYXNlZncuYmluCisj
ICtWZXJzaW9uOiA5LjIyLjAxLjQ5MDgKKyMgK0xpbms6IGludGVsL2RzcF9md19ieHRuLmJpbiAt
PiBhdnMvYXBsL2RzcF9iYXNlZncuYmluCisjICtMaW5rOiBpbnRlbC9kc3BfZndfZ2xrLmJpbiAt
PiBhdnMvYXBsL2RzcF9iYXNlZncuYmluCisjICtGaWxlOiBpbnRlbC9hdnMvY25sL2RzcF9iYXNl
ZncuYmluCisjICtWZXJzaW9uOiAxMC4yMy4wMC44NTUxCisjICtMaW5rOiBpbnRlbC9kc3BfZndf
Y25sLmJpbiAtPiBhdnMvY25sL2RzcF9iYXNlZncuYmluCisjICsKKyMgK0xpY2Vuc2U6IFJlZGlz
dHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuYWRzcF9zc3QgZm9yIGRldGFpbHMKKyMgIAorIyAgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KKyMgIAorIyBAQCAtNDA3Niw3ICs0MTEzLDYgQEAKKyMgIFZlcnNpb246
IDguMjAuMDAuOTY5CisjICBGaWxlOiBpbnRlbC9kc3BfZndfcmVsZWFzZV92MzQwMi5iaW4KKyMg
IFZlcnNpb246IDkuMjEuMDAuMzQwMl8xNjEKKyMgLUxpbms6IGludGVsL2RzcF9md19yZWxlYXNl
LmJpbiAtPiBkc3BfZndfcmVsZWFzZV92MzQwMi5iaW4KKyMgIAorIyAgTGljZW5zZTogUmVkaXN0
cmlidXRhYmxlLiBTZWUgTElDRU5DRS5hZHNwX3NzdCBmb3IgZGV0YWlscworIyAgCisjIEBAIC00
MDg0LDcgKzQxMjAsNiBAQAorIyAgVmVyc2lvbjogOS4yMi4wMS4yMjE5XzY0CisjICBGaWxlOiBp
bnRlbC9kc3BfZndfYnh0bl92MzM2Ni5iaW4KKyMgIFZlcnNpb246IDkuMjIuMDEuMzM2Nl8xNTcK
KyMgLUxpbms6IGludGVsL2RzcF9md19ieHRuLmJpbiAtPiBkc3BfZndfYnh0bl92MzM2Ni5iaW4K
KyMgIAorIyAgTGljZW5zZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5hZHNwX3NzdCBm
b3IgZGV0YWlscworIyAgCisjIEBAIC00MTAyLDcgKzQxMzcsNiBAQAorIyAgVmVyc2lvbjogOS4y
MS4wMC4zNDIwXzE2MworIyAgRmlsZTogaW50ZWwvZHNwX2Z3X2tibF92MzQwMi5iaW4KKyMgIFZl
cnNpb246IDkuMjEuMDAuMzQwMl8xNjEKKyMgLUxpbms6IGludGVsL2RzcF9md19rYmwuYmluIC0+
IGRzcF9md19rYmxfdjM0MDIuYmluCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4g
U2VlIExJQ0VOQ0UuYWRzcF9zc3QgZm9yIGRldGFpbHMKKyMgIAorIyBAQCAtNDExNCwxMyArNDE0
OCwxMSBAQAorIyAgVmVyc2lvbjogOS4yMi4wMS4yNzY4CisjICBGaWxlOiBpbnRlbC9kc3BfZndf
Z2xrX3YzMzY2LmJpbgorIyAgVmVyc2lvbjogOS4yMi4wMS4zMzY2XzE1NworIyAtTGluazogaW50
ZWwvZHNwX2Z3X2dsay5iaW4gLT4gZHNwX2Z3X2dsa192MzM2Ni5iaW4KKyMgIAorIyAgRmlsZTog
aW50ZWwvZHNwX2Z3X2NubF92MTE5MS5iaW4KKyMgIFZlcnNpb246IDEwLjAwLjAwLjExOTEKKyMg
IEZpbGU6IGludGVsL2RzcF9md19jbmxfdjE4NTguYmluCisjICBWZXJzaW9uOiAxMC4yMy4wMC4x
ODU4CisjIC1MaW5rOiBpbnRlbC9kc3BfZndfY25sLmJpbiAtPiBkc3BfZndfY25sX3YxODU4LmJp
bgorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLmFkc3Bfc3N0
IGZvciBkZXRhaWxzCisjICAKKyMgQEAgLTQyNzYsOSArNDMwOCw2IEBACisjICBEcml2ZXI6IGxp
cXVpZGlvIC0tIENhdml1bSBMaXF1aWRJTyBkcml2ZXIKKyMgIAorIyAgRmlsZTogbGlxdWlkaW8v
bGlvXzIzeHhfbmljLmJpbgorIyAtVmVyc2lvbjogdjEuNy4yCisjIC0KKyMgLUZpbGU6IGxpcXVp
ZGlvL2xpb18yM3h4X3Zzdy5iaW4KKyMgIFZlcnNpb246IHYxLjcuMgorIyAgCisjICBGaWxlOiBs
aXF1aWRpby9saW9fMjEwbnZfbmljLmJpbgorIyBAQCAtNTMwNyw5ICs1MzM2LDkgQEAKKyMgIERy
aXZlcjogbXQ3OTIxIC0gTWVkaWFUZWsgTVQ3OTIxIFdpcmVsZXNzIE1BQ3MKKyMgIAorIyAgRmls
ZTogbWVkaWF0ZWsvV0lGSV9NVDc5NjFfcGF0Y2hfbWN1XzFfMl9oZHIuYmluCisjIC1WZXJzaW9u
OiAyMDIzMDExNzE3MDg1NWEKKyMgK1ZlcnNpb246IDIwMjMwMzAyMTUwOTE2YQorIyAgRmlsZTog
bWVkaWF0ZWsvV0lGSV9SQU1fQ09ERV9NVDc5NjFfMS5iaW4KKyMgLVZlcnNpb246IDIwMjMwMTE3
MTcwOTQyCisjICtWZXJzaW9uOiAyMDIzMDMwMjE1MDk1NgorIyAgCisjICBMaWNlbmNlOiBSZWRp
c3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBA
IC01MzE4LDcgKzUzNDcsNyBAQAorIyAgRHJpdmVyOiBtdDc5MjEgLSBNZWRpYVRlayBNVDc5MjEg
Ymx1ZXRvb3RoIGNoaXBzZXQKKyMgIAorIyAgRmlsZTogbWVkaWF0ZWsvQlRfUkFNX0NPREVfTVQ3
OTYxXzFfMl9oZHIuYmluCisjIC1WZXJzaW9uOiAyMDIzMDExNzE3MTE1MgorIyArVmVyc2lvbjog
MjAyMzAzMDIxNTEzNTUKKyMgIAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElD
RU5DRS5tZWRpYXRlayBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNTkwNSw4ICs1OTM0LDYgQEAK
KyMgIExpbms6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzg5OTUud21mdyAtPiBj
czM1bDQxL3Y2LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgIExpbms6
IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLXByb3QtMTAzYzg5YzYud21mdyAtPiBjczM1bDQxL3Y2
LjYxLjEvaGFsb19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgIExpbms6IGNpcnJ1cy9j
czM1bDQxLWRzcDEtc3BrLWNhbGktMTAzYzg5YzYud21mdyAtPiBjczM1bDQxL3Y2LjYxLjEvaGFs
b19jc3BsX1JBTV9yZXZCMl8yOS42My4xLndtZncKKyMgLUZpbGU6IGNpcnJ1cy9jczM1bDQxLWRz
cDEtc3BrLWNhbGktMTAzYzg5NzEuYmluCisjIC1GaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNw
ay1wcm90LTEwM2M4OTcxLmJpbgorIyAgRmlsZTogY2lycnVzL2NzMzVsNDEtZHNwMS1zcGstcHJv
dC0xMDNjODk3MS5iaW4KKyMgIEZpbGU6IGNpcnJ1cy9jczM1bDQxLWRzcDEtc3BrLWNhbGktMTAz
Yzg5NzEuYmluCisjICBGaWxlOiBjaXJydXMvY3MzNWw0MS1kc3AxLXNway1wcm90LTEwM2M4OTcy
LmJpbgorIyAKKyMKKwogU1VNTUFSWSA9ICJGaXJtd2FyZSBmaWxlcyBmb3IgdXNlIHdpdGggTGlu
dXgga2VybmVsIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cua2VybmVsLm9yZy8iCiBERVNDUklQ
VElPTiA9ICJMaW51eCBmaXJtd2FyZSBpcyBhIHBhY2thZ2UgZGlzdHJpYnV0ZWQgYWxvbmdzaWRl
IHRoZSBMaW51eCBrZXJuZWwgXApAQCAtMTA4LDcgKzQ2Nyw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOQ0UuQWJpbGlzO21kNT1iNWVlM2Y0MTA3ODBlNTY3MTFhZDQ4ZWFkYzIy
YjhiYyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLk9MUEM7bWQ1PTViOTE3
ZjlkOGMwNjE5OTFiZTRmNmY1ZjEwODcxOWNkIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTov
L0xJQ0VOQ0Uub3Blbi1hdGg5ay1odGMtZmlybXdhcmU7bWQ1PTFiMzNjOWY0ZDE3YmM0ZDQ1N2Jk
YjIzNzI3MDQ2ODM3IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UucGhhbmZ3
O21kNT05NTRkY2VjMGUwNTFmOTQwOTgxMmI1NjFlYTc0M2JmYSBcCi0gICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9MSUNFTkNFLnFhdF9maXJtd2FyZTttZDU9OWU3ZDhiZWE3NzYxMmQ3Y2M3ZDll
OWI1NGI2MjMwNjIgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS5xYXRfZmly
bXdhcmU7bWQ1PTcyZGU4M2RmZDliODdiZTc2ODVlZDA5OWEzOWZiZWE0IFwKICAgICAgICAgICAg
ICAgICAgICAgZmlsZTovL0xJQ0VOU0UucWNvbTttZDU9MTY0ZTMzNjJhNTM4ZWIxMWQzYWM1MWU4
ZTEzNDI5NGIgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5xY29tX3lhbWF0
bzttZDU9ZDBkZTBlZWNjYWYxODQzYTg1MGJmN2E2Nzc3ZWVjNWMgXAogICAgICAgICAgICAgICAg
ICAgICBmaWxlOi8vTElDRU5DRS5xbGExMjgwO21kNT1kNjg5NTczMmU2MjJkOTUwNjA5MDkzMjIz
YTJjNGY1ZCBcCkBAIC0xMzAsNyArNDg5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5DRS5BYmlsaXM7bWQ1PWI1ZWUzZjQxMDc4MGU1NjcxMWFkNDhlYWRjMjJiOGJjIFwKICAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOQ0UueGM0MDAwO21kNT0wZmY1MWQyZGM0OWZj
ZTA0ODE0YzkxNTUwODEwOTJmMCBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNF
LnhjNTAwMDttZDU9MWUxNzBjMTMxNzUzMjNjMzJjN2Y0ZDA5OThkNTNmNjYgXAogICAgICAgICAg
ICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzUwMDBjO21kNT0xMmIwMmVmYTMwNDlkYjY1ZDUy
NGFlYjQxOGRkODdjYSBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7bWQ1PSR7
V0hFTkNFX0NIS1NVTX0gXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vV0hFTkNFO21kNT02
M2NlZjNlNjdjNzJhMmNkY2IyMDI4ZjViMTU5YmQzYiBcCiAgICAgICAgICAgICAgICAgICAgICIK
ICMgV0hFTkNFIGNoZWNrc3VtIGlzIGRlZmluZWQgc2VwYXJhdGVseSB0byBlYXNlIG92ZXJyaWRp
bmcgaXQgaWYKICMgY2xhc3MtZGV2dXBzdHJlYW0gaXMgc2VsZWN0ZWQuCkBAIC0yMTIsNyArNTcx
LDcgQEAgU1JDX1VSSTpjbGFzcy1kZXZ1cHN0cmVhbSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXcKICMgUGluIHRoaXMgdG8gdGhlIDIwMjIwNTA5
IHJlbGVhc2UsIG92ZXJyaWRlIHRoaXMgaW4gbG9jYWwuY29uZgogU1JDUkVWOmNsYXNzLWRldnVw
c3RyZWFtID89ICJiMTljYmRjYTc4YWIyYWRmZDIxMGM5MWJlMTVhMjI1NjhlOGI4Y2FlIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNmUzZDllOGQ1MmNmZmM0ZWMwZGJlODUzM2E4NDQ1MzI4ZTA1
MjRhMjBmMTU5YTViNjFjMjcwNmY5ODNjZTM4YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1OTY4
ZDRlNTE3OGNhMWVjYWQzYzQxYzM2YmJhNDYwMmMyODhmMjVjN2E0OGVlYWE3NDExMzUzNzU3ODE5
OWIyIgogCiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi4zOS4yCgo=

--===============1830232196745519618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: RDEPENDS: added "linux-firmware"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: FILELIST: added "/lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b13 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b11 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b10 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b14 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.mdt /lib/firmware/ath11k/IPQ5018/hw1.0/m3_fw.mdt /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b08 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b09 /lib/firmware/ath11k/IPQ5018/hw1.0/board-2.bin /lib/firmware/ath11k/IPQ5018/hw1.0/m3_fw.b00 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b00 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b02 /lib/firmware/ath11k/IPQ5018/hw1.0/m3_fw.b02 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b03 /lib/firmware/ath11k/IPQ5018/hw1.0/m3_fw.b01 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b04 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b01 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b05 /lib/firmware/ath11k/IPQ5018/hw1.0/q6_fw.b07 /lib/firmware/ath11k/IPQ5018/hw1.0/m3_fw.flist /lib/firmware/a
 th11k/IPQ5018/hw1.0/q6_fw.flist /lib/firmware/ath11k/IPQ5018/hw1.0/Notice.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGSIZE changed from 44124274 to 53289884 (+21%)
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: FILELIST: added "/lib/firmware/brcm/brcmfmac4356-pcie.Intel Corporation-CHERRYVIEW D1 PLATFORM.txt"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGSIZE changed from 157939 to 135358 (-14%)
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: FILELIST: removed "/lib/firmware/liquidio/lio_23xx_vsw.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGSIZE changed from 25463952 to 5029544 (-80%)
packages/all-poky-linux/linux-firmware/linux-firmware-qat: FILELIST: added "/lib/firmware/qat_4xxx_mmp.bin /lib/firmware/qat_4xxx.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGSIZE changed from 1453722 to 2269162 (+56%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/intel/catpt/bdw/dsp_basefw.bin /lib/firmware/intel/avs/skl/dsp_basefw.bin /lib/firmware/intel/avs/skl/dsp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin /lib/firmware/rtl_bt/rtl8821cs_fw.bin /lib/firmware/brcm/brcmfmac43241b4-sdio.Advantech-MICA-071.txt /lib/firmware/rtl_bt/rtl8821cs_config.bin /lib/firmware/intel/avs/cnl/dsp_basefw.bin /lib/firmware/rtlwifi/rtl8710bufw_SMIC.bin /lib/firmware/intel/avs/apl/dsp_basefw.bin /lib/firmware/rtlwifi/rtl8710bufw_UMC.bin"

--===============1830232196745519618==--

