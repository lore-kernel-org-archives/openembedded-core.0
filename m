Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3569CC4321E
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:38 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.868.1667349636214706401
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZIFqEua/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018435c86264-1596d54b-4e7a-4152-9c94-e452e5711f32-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=agE7kp6+TDhJq+LTLct3RJYAHQWxtycTbDrFfhyP/mM=;
	b=ZIFqEua/LQcqv704o7gBVB2/OVHeML00VSDyNniIS3lYECVM4FlYvFvDkq+FwTY9
	ucEYyrd6xmG1Rkx0rJHJVzuPXBtSKYqGh76JK8LrdgnPq/BNtaSDm9r8f3fk3wGxyNt
	7H+BE6uN3ihttCH8IOW0SLuVA8F9T/qmDhD66xCg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=agE7kp6+TDhJq+LTLct3RJYAHQWxtycTbDrFfhyP/mM=;
	b=SeD79XtTH51jRSLROzCsevBy82wSFOYvIVUz+lhttl1ZNz2rZrdYOgfxoJCVoR44
	5dRV/nslkwIWOccrzt3XSvgPxer7X7R6PI63s8dnQrk6QboU0DTFvwsF1S4lTNw9a7E
	hDmWsXuKWn6AMtnj22cvcY8kXQ2/2f+tXG3jtMsI=
Content-Type: multipart/mixed; boundary="===============6701375833098031691=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20221012 SUCCEEDED
Message-ID: <0101018435c86264-1596d54b-4e7a-4152-9c94-e452e5711f32-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172507

--===============6701375833098031691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20221012* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20220913-20221012.patch
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
--===============6701375833098031691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: SRC_URI changed from "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20220913.tar.xz" to "https://cdn.kernel.org/pub/linux/kernel/firmware/linux-firmware-20221012.tar.xz"
packages/all-poky-linux/linux-firmware: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amdgpu: PKGSIZE changed from 65308282 to 65319418 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-amlogic-vdec: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ath11k: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ath3k: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/dg1_guc_70.bin /lib/firmware/i915/dg1_huc.bin /lib/firmware/i915/tgl_guc_70.bin /lib/firmware/i915/dg2_guc_70.bin /lib/firmware/i915/adlp_guc_70.bin /lib/firmware/i915/tgl_huc.bin"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 22506459 to 24912219 (+11%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-lontium-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-lt9611uxc: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-gpu: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra-k1: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-nvidia-tegra: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 1753268 to 1744896 (-0%)
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a2xx: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a4xx: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a650: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a660: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-audio: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-apq8096-modem: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-audio: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compat: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-compute: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-audio: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sm8250-compute: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.2: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-5.4: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-1.0: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-vpu-2.0: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9113: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rs9116: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8761: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8997: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 190374 to 190990 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20220913" to "20221012"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20220913 [default] to 20221012 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/lib/firmware/cxgb4/t6fw-1.26.6.0.bin /lib/firmware/mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg /lib/firmware/cxgb4/t4fw-1.26.6.0.bin /lib/firmware/cxgb4/t5fw-1.26.6.0.bin /lib/firmware/mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg", added "/lib/firmware/cxgb4/t4fw-1.27.0.0.bin /lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg /lib/firmware/cxgb4/t6fw-1.27.0.0.bin /lib/firmware/qcom/apq8096/a530_zap.mbn /lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg /lib/firmware/cxgb4/t5fw-1.27.0.0.bin /lib/firmware/mediatek/sof/sof-mt8186.ldc /lib/firmware/mediatek/sof-tplg/sof-mt8186.tplg /lib/firmware/mediatek/sof/sof-mt8195.ri /lib/firmware/mediatek/sof/sof-mt8195.ldc"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 217839749 to 218307968 (+0%)
Changes to packages/all-poky-linux/linux-firmware (sysroot):
  /lib/firmware/cxgb4/t4fw.bin changed symlink target from t4fw-1.26.6.0.bin to t4fw-1.27.0.0.bin
  /lib/firmware/cxgb4/t5fw.bin changed symlink target from t5fw-1.26.6.0.bin to t5fw-1.27.0.0.bin
  /lib/firmware/cxgb4/t6fw.bin changed symlink target from t6fw-1.26.6.0.bin to t6fw-1.27.0.0.bin
  /lib/firmware/cxgb4/t4fw-1.27.0.0.bin was added
  /lib/firmware/cxgb4/t5fw-1.27.0.0.bin was added
  /lib/firmware/cxgb4/t6fw-1.27.0.0.bin was added
  /lib/firmware/i915/adlp_guc_70.bin was added
  /lib/firmware/i915/dg1_guc_70.bin was added
  /lib/firmware/i915/dg1_huc.bin was added
  /lib/firmware/i915/dg2_guc_70.bin was added
  /lib/firmware/i915/tgl_guc_70.bin was added
  /lib/firmware/i915/tgl_huc.bin was added
  /lib/firmware/mediatek/sof/sof-mt8186.ldc was added
  /lib/firmware/mediatek/sof/sof-mt8195.ldc was added
  /lib/firmware/mediatek/sof/sof-mt8195.ri was added
  /lib/firmware/mediatek/sof-tplg was added
  /lib/firmware/mediatek/sof-tplg/sof-mt8186.tplg was added
  /lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg was added
  /lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg was added
  /lib/firmware/qcom/apq8096/a530_zap.mbn was added
  /lib/firmware/cxgb4/t4fw-1.26.6.0.bin was removed
  /lib/firmware/cxgb4/t5fw-1.26.6.0.bin was removed
  /lib/firmware/cxgb4/t6fw-1.26.6.0.bin was removed
  /lib/firmware/mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg was removed
  /lib/firmware/mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg was removed

--===============6701375833098031691==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20220913-20221012.patch"

RnJvbSA3YWYyMDgwYzNlZjE1MTczNTI5YjdkNjgxYTQ5OGRjODg1OTk5NjExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxNzo1NDoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
bnV4LWZpcm13YXJlOiB1cGdyYWRlIDIwMjIwOTEzIC0+IDIwMjIxMDEyCgotLS0KIC4uLjIwMjIw
OTEzLmJiID0+IGxpbnV4LWZpcm13YXJlXzIwMjIxMDEyLmJifSB8IDE5NyArKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxOTQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL3tsaW51eC1maXJtd2Fy
ZV8yMDIyMDkxMy5iYiA9PiBsaW51eC1maXJtd2FyZV8yMDIyMTAxMi5iYn0gKDg5JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJl
XzIwMjIwOTEzLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1m
aXJtd2FyZV8yMDIyMTAxMi5iYgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlXzIwMjIwOTEzLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13
YXJlXzIwMjIxMDEyLmJiCmluZGV4IDhmOTIxZTJkMGUuLjBhMjdmN2U2YzEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVfMjAyMjA5
MTMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZV8yMDIyMTAxMi5iYgpAQCAtMSwzICsxLDE5NCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IExJQ0VOU0UuYW1kLXVjb2RlCisjICsrKyBMSUNFTlNFLmFtZC11Y29kZQorIyBAQCAtMSw0ICsx
LDQgQEAKKyMgLUNvcHlyaWdodCAoQykgMjAxMC0yMDE4IEFkdmFuY2VkIE1pY3JvIERldmljZXMs
IEluYy4sIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjICtDb3B5cmlnaHQgKEMpIDIwMTAtMjAyMiBB
ZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuLCBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAgCisj
ICBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkIGJ5IEFkdmFuY2VkIE1pY3JvIERldmljZXMs
IEluYy4gKCJBTUQiKSwKKyMgIGZyZWUgb2YgYW55IGxpY2Vuc2UgZmVlcywgdG8gYW55IHBlcnNv
biBvYnRhaW5pbmcgYSBjb3B5IG9mIHRoaXMKKyMgLS0tIFdIRU5DRQorIyArKysgV0hFTkNFCisj
IEBAIC01MzYsMTQgKzUzNiwxNCBAQAorIyAgCisjICBGaWxlOiBjeGdiNC90NGZ3LTEuMTQuNC4w
LmJpbgorIyAgRmlsZTogY3hnYjQvdDRmdy0xLjE1LjM3LjAuYmluCisjIC1GaWxlOiBjeGdiNC90
NGZ3LTEuMjYuNi4wLmJpbgorIyAtTGluazogY3hnYjQvdDRmdy5iaW4gLT4gdDRmdy0xLjI2LjYu
MC5iaW4KKyMgK0ZpbGU6IGN4Z2I0L3Q0ZnctMS4yNy4wLjAuYmluCisjICtMaW5rOiBjeGdiNC90
NGZ3LmJpbiAtPiB0NGZ3LTEuMjcuMC4wLmJpbgorIyAgRmlsZTogY3hnYjQvdDVmdy0xLjE0LjQu
MC5iaW4KKyMgIEZpbGU6IGN4Z2I0L3Q1ZnctMS4xNS4zNy4wLmJpbgorIyAtRmlsZTogY3hnYjQv
dDVmdy0xLjI2LjYuMC5iaW4KKyMgLUxpbms6IGN4Z2I0L3Q1ZncuYmluIC0+IHQ1ZnctMS4yNi42
LjAuYmluCisjIC1GaWxlOiBjeGdiNC90NmZ3LTEuMjYuNi4wLmJpbgorIyAtTGluazogY3hnYjQv
dDZmdy5iaW4gLT4gdDZmdy0xLjI2LjYuMC5iaW4KKyMgK0ZpbGU6IGN4Z2I0L3Q1ZnctMS4yNy4w
LjAuYmluCisjICtMaW5rOiBjeGdiNC90NWZ3LmJpbiAtPiB0NWZ3LTEuMjcuMC4wLmJpbgorIyAr
RmlsZTogY3hnYjQvdDZmdy0xLjI3LjAuMC5iaW4KKyMgK0xpbms6IGN4Z2I0L3Q2ZncuYmluIC0+
IHQ2ZnctMS4yNy4wLjAuYmluCisjICBGaWxlOiBjeGdiNC9hcTEyMDJfZncuY2xkCisjICBGaWxl
OiBjeGdiNC9iY204NDgzLmJpbgorIyAgRmlsZTogY3hnYjQvY29uZmlncy90NC1jb25maWctZGVm
YXVsdC50eHQKKyMgQEAgLTM5NzEsNyArMzk3MSw3IEBACisjICBGaWxlOiBhbWQtdWNvZGUvbWlj
cm9jb2RlX2FtZF9mYW0xN2guYmluCisjICBWZXJzaW9uOiAyMDIyLTA0LTA4CisjICBGaWxlOiBh
bWQtdWNvZGUvbWljcm9jb2RlX2FtZF9mYW0xOWguYmluCisjIC1WZXJzaW9uOiAyMDIyLTA0LTA4
CisjICtWZXJzaW9uOiAyMDIyLTA5LTMwCisjICBGaWxlOiBhbWQtdWNvZGUvUkVBRE1FCisjICAK
KyMgIExpY2Vuc2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UuYW1kLXVjb2RlIGZvciBk
ZXRhaWxzCisjIEBAIC00NjI5LDYgKzQ2MjksOSBAQAorIyAgRmlsZTogaTkxNS90Z2xfZ3VjXzcw
LjEuMS5iaW4KKyMgIFZlcnNpb246IEd1QyBBUEkvQVBCIHZlciA3MC4xLjEgZm9yIFRpZ2VybGFr
ZQorIyAgCisjICtGaWxlOiBpOTE1L3RnbF9ndWNfNzAuYmluCisjICtWZXJzaW9uOiBHdUMgQVBJ
L0FQQiB2ZXIgNzAuNS4xIGZvciBUaWdlcmxha2UKKyMgKworIyAgRmlsZTogaTkxNS90Z2xfaHVj
XzcuMC4zLmJpbgorIyAgVmVyc2lvbjogSHVjIEFQSS9BUEIgdmVyIDcgcmVsZWFzZSAwIGZvciBU
aWdlcmxha2UKKyMgIAorIyBAQCAtNDY0MSw2ICs0NjQ0LDkgQEAKKyMgIEZpbGU6IGk5MTUvdGds
X2h1Y183LjkuMy5iaW4KKyMgIFZlcnNpb246IEh1QyBBUEkvQVBCIHZlciA3LjkuMyBmb3IgVGln
ZXJsYWtlCisjICAKKyMgK0ZpbGU6IGk5MTUvdGdsX2h1Yy5iaW4KKyMgK1ZlcnNpb246IEh1QyBB
UEkvQVBCIHZlciA3LjkuMyBmb3IgVGlnZXJsYWtlCisjICsKKyMgIEZpbGU6IGk5MTUvcmtsX2Rt
Y192ZXIyXzAyLmJpbgorIyAgVmVyc2lvbjogRE1DIEFQSS9BUEIgdmVyIDIgcmVsZWFzZSAyIGZv
ciBSb2NrZXRsYWtlCisjICAKKyMgQEAgLTQ2NjIsMTIgKzQ2NjgsMTggQEAKKyMgIEZpbGU6IGk5
MTUvZGcxX2d1Y183MC4xLjEuYmluCisjICBWZXJzaW9uOiBHdUMgQVBJL0FQQiB2ZXIgNzAuMS4x
IGZvciBERzEKKyMgIAorIyArRmlsZTogaTkxNS9kZzFfZ3VjXzcwLmJpbgorIyArVmVyc2lvbjog
R3VDIEFQSS9BUEIgdmVyIDcwLjUuMSBmb3IgREcxCisjICsKKyMgIEZpbGU6IGk5MTUvZGcxX2h1
Y183LjcuMS5iaW4KKyMgIFZlcnNpb246IEh1YyBBUEkvQVBCIHZlciA3IHJlbGVhc2UgMSBmb3Ig
REcxCisjICAKKyMgIEZpbGU6IGk5MTUvZGcxX2h1Y183LjkuMy5iaW4KKyMgIFZlcnNpb246IEh1
QyBBUEkvQVBCIHZlciA3LjkuMyBmb3IgREcxCisjICAKKyMgK0ZpbGU6IGk5MTUvZGcxX2h1Yy5i
aW4KKyMgK1ZlcnNpb246IEh1QyBBUEkvQVBCIHZlciA3LjkuMyBmb3IgREcxCisjICsKKyMgIEZp
bGU6IGk5MTUvYWRsc19kbWNfdmVyMl8wMS5iaW4KKyMgIFZlcnNpb246IERNQyBBUEkvQVBCIHZl
ciAyIHJlbGVhc2UgMSBmb3IgQWxkZXJsYWtlIFMKKyMgIAorIyBAQCAtNDY5NSwxMSArNDcwNywx
NyBAQAorIyAgRmlsZTogaTkxNS9hZGxwX2d1Y183MC4xLjEuYmluCisjICBWZXJzaW9uOiBHdUMg
QVBJL0FQQiB2ZXIgNzAuMS4xIGZvciBBbGRlcmxha2UgUAorIyAgCisjICtGaWxlOiBpOTE1L2Fk
bHBfZ3VjXzcwLmJpbgorIyArVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjUuMSBmb3IgQWxk
ZXJsYWtlIFAKKyMgKworIyAgRmlsZTogaTkxNS9kZzJfZ3VjXzcwLjEuMi5iaW4KKyMgIFZlcnNp
b246IEd1QyBBUEkvQVBCIHZlciA3MC4xLjIgZm9yIERHMgorIyAgCisjICBGaWxlOiBpOTE1L2Rn
Ml9ndWNfNzAuNC4xLmJpbgorIyAgVmVyc2lvbjogR3VDIEFQSS9BUEIgdmVyIDcwLjQuMSBmb3Ig
REcyCisjICsKKyMgK0ZpbGU6IGk5MTUvZGcyX2d1Y183MC5iaW4KKyMgK1ZlcnNpb246IEd1QyBB
UEkvQVBCIHZlciA3MC41LjEgZm9yIERHMgorIyAgCisjICBGaWxlOiBpOTE1L2RnMl9kbWNfdmVy
Ml8wNi5iaW4KKyMgIFZlcnNpb246IERNQyBBUEkvQVBCIHZlciAyIHJlbGVhc2UgNiBmb3IgREcy
CisjIEBAIC01MTkyLDExICs1MjEwLDExIEBACisjICBGaWxlOiBtZWRpYXRlay9tdDgxODMvc2Nw
LmltZworIyAgVmVyc2lvbjogdjIuMC4xMzMyNAorIyAgRmlsZTogbWVkaWF0ZWsvbXQ4MTg2L3Nj
cC5pbWcKKyMgLVZlcnNpb246IHYwLjAuNgorIyArVmVyc2lvbjogdjAuMC45CisjICBGaWxlOiBt
ZWRpYXRlay9tdDgxOTIvc2NwLmltZworIyAgVmVyc2lvbjogdjIuMC44NTQ4CisjICBGaWxlOiBt
ZWRpYXRlay9tdDgxOTUvc2NwLmltZworIyAtVmVyc2lvbjogdjIuMC4xMzMyNAorIyArVmVyc2lv
bjogdjIuMC4xMTk1NgorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNF
TkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC01MzQ4LDkgKzUzNjYsOSBAQAor
IyAgRHJpdmVyOiBtdDc5MjEgLSBNZWRpYVRlayBNVDc5MjEgV2lyZWxlc3MgTUFDcworIyAgCisj
ICBGaWxlOiBtZWRpYXRlay9XSUZJX01UNzk2MV9wYXRjaF9tY3VfMV8yX2hkci5iaW4KKyMgLVZl
cnNpb246IDIwMjIwNjA4MjEwODM5YQorIyArVmVyc2lvbjogMjAyMjA5MDgyMTA5MTlhCisjICBG
aWxlOiBtZWRpYXRlay9XSUZJX1JBTV9DT0RFX01UNzk2MV8xLmJpbgorIyAtVmVyc2lvbjogMjAy
MjA2MDgyMTA5MjIKKyMgK1ZlcnNpb246IDIwMjIwOTA4MjExMDIxCisjICAKKyMgIExpY2VuY2U6
IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAK
KyMgQEAgLTUzNTksNyArNTM3Nyw3IEBACisjICBEcml2ZXI6IG10NzkyMSAtIE1lZGlhVGVrIE1U
NzkyMSBibHVldG9vdGggY2hpcHNldAorIyAgCisjICBGaWxlOiBtZWRpYXRlay9CVF9SQU1fQ09E
RV9NVDc5NjFfMV8yX2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjIwNjA4MjExMTExCisjICtWZXJz
aW9uOiAyMDIyMDkwODIxMTIzNAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFibGUuIFNl
ZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC01MzY4LDkgKzUzODYs
OSBAQAorIyAgRHJpdmVyOiBtdDc5MjIgLSBNZWRpYVRlayBNVDc5MjIgV2lyZWxlc3MgTUFDcwor
IyAgCisjICBGaWxlOiBtZWRpYXRlay9XSUZJX01UNzkyMl9wYXRjaF9tY3VfMV8xX2hkci5iaW4K
KyMgLVZlcnNpb246IDIwMjIwNTIzMTAzMzQ1YQorIyArVmVyc2lvbjogMjAyMjA5MDgyMDMyMDNh
CisjICBGaWxlOiBtZWRpYXRlay9XSUZJX1JBTV9DT0RFX01UNzkyMl8xLmJpbgorIyAtVmVyc2lv
bjogMjAyMjA1MjMxMDM0NDcKKyMgK1ZlcnNpb246IDIwMjIwOTA4MjAzMjUzCisjICAKKyMgIExp
Y2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMu
CisjICAKKyMgQEAgLTUzNzksNyArNTM5Nyw3IEBACisjICBEcml2ZXI6IG10NzkyMiAtIE1lZGlh
VGVrIE1UNzkyMiBibHVldG9vdGggY2hpcHNldAorIyAgCisjICBGaWxlOiBtZWRpYXRlay9CVF9S
QU1fQ09ERV9NVDc5MjJfMV8xX2hkci5iaW4KKyMgLVZlcnNpb246IDIwMjIwNTIzMTAzODMyCisj
ICtWZXJzaW9uOiAyMDIyMDkwODIxMTIzNAorIyAgCisjICBMaWNlbmNlOiBSZWRpc3RyaWJ1dGFi
bGUuIFNlZSBMSUNFTkNFLm1lZGlhdGVrIGZvciBkZXRhaWxzLgorIyAgCisjIEBAIC01NTk3LDYg
KzU2MTUsNyBAQAorIyAgRmlsZTogcWNvbS9hNTMwX3phcC5iMDEKKyMgIEZpbGU6IHFjb20vYTUz
MF96YXAuYjAyCisjICBGaWxlOiBxY29tL2E1MzBfemFwLm1kdAorIyArRmlsZTogcWNvbS9hcHE4
MDk2L2E1MzBfemFwLm1ibgorIyAgRmlsZTogcWNvbS9hNjMwX2dtdS5iaW4KKyMgIEZpbGU6IHFj
b20vYTYzMF9zcWUuZncKKyMgIEZpbGU6IHFjb20vc2RtODQ1L2E2MzBfemFwLm1ibgorIyBAQCAt
NTk1OSw5ICs1OTc4LDE1IEBACisjICBEcml2ZXI6IG10ay1zb2YgLSBNZWRpYVRlayBTb3VuZCBP
cGVuIEZpcm13YXJlIGRyaXZlcgorIyAgCisjICBGaWxlOiBtZWRpYXRlay9zb2Yvc29mLW10ODE4
Ni5yaQorIyAtRmlsZTogbWVkaWF0ZWsvc29mL3NvZi1tdDgxODYtbXQ2MzY2LWRhNzIxOS1tYXg5
ODM1Ny50cGxnCisjIC1GaWxlOiBtZWRpYXRlay9zb2Yvc29mLW10ODE4Ni1tdDYzNjYtcnQxMDE5
LXJ0NTY4MnMudHBsZworIyAtVmVyc2lvbjogdjAuMi4wCisjICtGaWxlOiBtZWRpYXRlay9zb2Yv
c29mLW10ODE4Ni5sZGMKKyMgK0ZpbGU6IG1lZGlhdGVrL3NvZi10cGxnL3NvZi1tdDgxODYudHBs
ZworIyArVmVyc2lvbjogdjAuMi4xCisjICsKKyMgK0ZpbGU6IG1lZGlhdGVrL3NvZi9zb2YtbXQ4
MTk1LnJpCisjICtGaWxlOiBtZWRpYXRlay9zb2Yvc29mLW10ODE5NS5sZGMKKyMgK0ZpbGU6IG1l
ZGlhdGVrL3NvZi10cGxnL3NvZi1tdDgxOTUtbXQ2MzU5LXJ0MTAxOS1ydDU2ODIudHBsZworIyAr
RmlsZTogbWVkaWF0ZWsvc29mLXRwbGcvc29mLW10ODE5NS1tdDYzNTktcnQxMDE5LXJ0NTY4Mi1k
dHMudHBsZworIyArVmVyc2lvbjogdjAuNC4xCisjICAKKyMgIExpY2VuY2U6IFJlZGlzdHJpYnV0
YWJsZS4gU2VlIExJQ0VOQ0UubWVkaWF0ZWsgZm9yIGRldGFpbHMuCisjICAKKyMgCisjCisKIFNV
TU1BUlkgPSAiRmlybXdhcmUgZmlsZXMgZm9yIHVzZSB3aXRoIExpbnV4IGtlcm5lbCIKIEhPTUVQ
QUdFID0gImh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvIgogREVTQ1JJUFRJT04gPSAiTGludXggZmly
bXdhcmUgaXMgYSBwYWNrYWdlIGRpc3RyaWJ1dGVkIGFsb25nc2lkZSB0aGUgTGludXgga2VybmVs
IFwKQEAgLTcxLDcgKzI2Miw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOQ0Uu
QWJpbGlzO21kNT1iNWVlM2Y0MTA3ODBlNTY3MTFhZDQ4ZWFkYzIyYjhiYyBcCiAgICAgICAgICAg
ICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLmFkc3Bfc3N0O21kNT02MTVjNDViOTFhNWE0YTlmZTA0
NmQ2YWI5YTJkZjcyOCBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLmFnZXJl
O21kNT1hZjAxMzNkZTZiNGE5YjI1MjJkZWZkNWYxODhhZmQzMSBcCiAgICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9MSUNFTlNFLmFtZGdwdTttZDU9NDRjMTE2NmQwNTIyMjZjYjJkNmM4ZDc0MDAw
OTAyMDMgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5hbWQtdWNvZGU7bWQ1
PTNjNTM5OWRjOTE0OGQ3ZjBlMWY0MWUzNGI2OWNmMTRmIFwKKyAgICAgICAgICAgICAgICAgICAg
ZmlsZTovL0xJQ0VOU0UuYW1kLXVjb2RlO21kNT02Y2E5MGM1N2Y3YjI0OGRlMWUyNWM3ZjY4ZmZj
NDY5OCBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLmFtbG9naWNfdmRlYztt
ZDU9ZGM0NGY1OWJmNjRhODE2NDNlNTAwYWQzZjM5YTQ2OGEgXAogICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vTElDRU5DRS5hdGhlcm9zX2Zpcm13YXJlO21kNT0zMGExNGM3ODIzYmVlZGFjOWZh
MzljNjRmZGQwMWExMyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLmF0bWVs
O21kNT1hYTc0YWMwYzYwNTk1ZGVlNGQ0ZTIzOTEwN2VhNzdhMyBcCkBAIC0xMjgsNyArMzE5LDcg
QEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5DRS5BYmlsaXM7bWQ1PWI1ZWUzZjQx
MDc4MGU1NjcxMWFkNDhlYWRjMjJiOGJjIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJ
Q0VOQ0UueGM0MDAwO21kNT0wZmY1MWQyZGM0OWZjZTA0ODE0YzkxNTUwODEwOTJmMCBcCiAgICAg
ICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNTAwMDttZDU9MWUxNzBjMTMxNzUzMjNj
MzJjN2Y0ZDA5OThkNTNmNjYgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54
YzUwMDBjO21kNT0xMmIwMmVmYTMwNDlkYjY1ZDUyNGFlYjQxOGRkODdjYSBcCi0gICAgICAgICAg
ICAgICAgICAgIGZpbGU6Ly9XSEVOQ0U7bWQ1PSR7V0hFTkNFX0NIS1NVTX0gXAorICAgICAgICAg
ICAgICAgICAgICBmaWxlOi8vV0hFTkNFO21kNT1kNmQ5ZDc0YTM0NGE3ODAyOGU2YjBmMWRmODBk
YjE0YiBcCiAgICAgICAgICAgICAgICAgICAgICIKICMgV0hFTkNFIGNoZWNrc3VtIGlzIGRlZmlu
ZWQgc2VwYXJhdGVseSB0byBlYXNlIG92ZXJyaWRpbmcgaXQgaWYKICMgY2xhc3MtZGV2dXBzdHJl
YW0gaXMgc2VsZWN0ZWQuCkBAIC0yMDksNyArNDAwLDcgQEAgU1JDX1VSSTpjbGFzcy1kZXZ1cHN0
cmVhbSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmly
bXcKICMgUGluIHRoaXMgdG8gdGhlIDIwMjIwNTA5IHJlbGVhc2UsIG92ZXJyaWRlIHRoaXMgaW4g
bG9jYWwuY29uZgogU1JDUkVWOmNsYXNzLWRldnVwc3RyZWFtID89ICJiMTljYmRjYTc4YWIyYWRm
ZDIxMGM5MWJlMTVhMjI1NjhlOGI4Y2FlIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjZmZDAw
ZjJkOGU5NmM0YWY2ZjQ0MjY5YTZiODkzZWI4NTcyNTMwNDRmNzVhZDI4ZWY2NzA2YTIyNTBjZDhl
OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlOWQxNzRhZjcyOTUxMWM4Y2NjYjYwZWM0ZTBiMjIz
YjNjNDRiNjdkODEzYjQyZDFhYjk4MTNhY2ZhNjY3ZmE1IgogCiBpbmhlcml0IGFsbGFyY2gKIAot
LSAKMi4zMS4xCgo=

--===============6701375833098031691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGSIZE changed from 22506459 to 24912219 (+11%)
packages/all-poky-linux/linux-firmware/linux-firmware-i915: FILELIST: added "/lib/firmware/i915/dg1_huc.bin /lib/firmware/i915/dg2_guc_70.bin /lib/firmware/i915/tgl_huc.bin /lib/firmware/i915/tgl_guc_70.bin /lib/firmware/i915/adlp_guc_70.bin /lib/firmware/i915/dg1_guc_70.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/lib/firmware/cxgb4/t5fw-1.26.6.0.bin /lib/firmware/cxgb4/t6fw-1.26.6.0.bin /lib/firmware/cxgb4/t4fw-1.26.6.0.bin /lib/firmware/mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg /lib/firmware/mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg", added "/lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg /lib/firmware/mediatek/sof/sof-mt8186.ldc /lib/firmware/cxgb4/t4fw-1.27.0.0.bin /lib/firmware/mediatek/sof/sof-mt8195.ldc /lib/firmware/qcom/apq8096/a530_zap.mbn /lib/firmware/cxgb4/t5fw-1.27.0.0.bin /lib/firmware/mediatek/sof/sof-mt8195.ri /lib/firmware/mediatek/sof-tplg/sof-mt8186.tplg /lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg /lib/firmware/cxgb4/t6fw-1.27.0.0.bin"
Changes to packages/all-poky-linux/linux-firmware (sysroot):
  /lib/firmware/cxgb4/t4fw.bin changed symlink target from t4fw-1.26.6.0.bin to t4fw-1.27.0.0.bin
  /lib/firmware/cxgb4/t5fw.bin changed symlink target from t5fw-1.26.6.0.bin to t5fw-1.27.0.0.bin
  /lib/firmware/cxgb4/t6fw.bin changed symlink target from t6fw-1.26.6.0.bin to t6fw-1.27.0.0.bin
  /lib/firmware/cxgb4/t4fw-1.27.0.0.bin was added
  /lib/firmware/cxgb4/t5fw-1.27.0.0.bin was added
  /lib/firmware/cxgb4/t6fw-1.27.0.0.bin was added
  /lib/firmware/i915/adlp_guc_70.bin was added
  /lib/firmware/i915/dg1_guc_70.bin was added
  /lib/firmware/i915/dg1_huc.bin was added
  /lib/firmware/i915/dg2_guc_70.bin was added
  /lib/firmware/i915/tgl_guc_70.bin was added
  /lib/firmware/i915/tgl_huc.bin was added
  /lib/firmware/mediatek/sof/sof-mt8186.ldc was added
  /lib/firmware/mediatek/sof/sof-mt8195.ldc was added
  /lib/firmware/mediatek/sof/sof-mt8195.ri was added
  /lib/firmware/mediatek/sof-tplg was added
  /lib/firmware/mediatek/sof-tplg/sof-mt8186.tplg was added
  /lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg was added
  /lib/firmware/mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg was added
  /lib/firmware/qcom/apq8096/a530_zap.mbn was added
  /lib/firmware/cxgb4/t4fw-1.26.6.0.bin was removed
  /lib/firmware/cxgb4/t5fw-1.26.6.0.bin was removed
  /lib/firmware/cxgb4/t6fw-1.26.6.0.bin was removed
  /lib/firmware/mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg was removed
  /lib/firmware/mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg was removed

--===============6701375833098031691==--

