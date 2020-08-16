Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.19825.1597558933579082593
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7280DE02039; Sat, 15 Aug 2020 23:22:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE,URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08C25E0207C
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:44 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] linux-firmware: upgrading to 20200721 SUCCEEDED
Message-Id: <20200816062213.7280DE02039@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:22:13 -0700 (PDT)
X-Groupsio-MsgNum: 141513
Content-Type: multipart/mixed; boundary="===============4653162791122038030=="

--===============4653162791122038030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *linux-firmware* to *20200721* has Succeeded.

Next steps:
    - apply the patch: git am 0001-linux-firmware-upgrade-20200619-20200721.patch
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

--===============4653162791122038030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/linux-firmware: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-adsp-sst: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ar3k: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ar9170: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ath10k: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ath6k: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ath9k: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-atheros-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm-0bb4-0306: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43143: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43236b: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b0: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b4: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43241b5: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43242a: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329-fullmac: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4329: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4330: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4334: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43340: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4335: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43362: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4339: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43430a0: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43455: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4350c2: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4354: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356-pcie: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4356: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43569: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43570: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4358: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43602: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366b: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4366c: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4371: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm4373: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx-hdr: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bcm43xx: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-bnx2-mips: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-broadcom-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-carl9170: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-cypress-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-dbg: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-dev: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-doc: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-gplv2-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-i915-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-i915: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-11-5: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-12-16: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGSIZE changed from 2591886 to 2592222 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-17: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGSIZE changed from 2219007 to 2257599 (+2%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-20: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-7: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-hw-37-8: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGSIZE changed from 9248907 to 9365019 (+1%)
packages/all-poky-linux/linux-firmware/linux-firmware-ibt-misc: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ibt: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ice-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ice: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx6q: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-imx7d: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-imx-sdma-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-135-6: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-10: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-12: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-13: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-16: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-17: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-7: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-8: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-3160-9: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000-4: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-5: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2a-6: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-5: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6000g2b-6: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-4: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-6050-5: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7260: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-7265d: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8000c: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-8265: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-9000: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi-misc: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-iwlwifi: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-liquidio: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-locale: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-marvell-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-mt7601u: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-netronome: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8897: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-pcie8997: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-qat-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-qat: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGSIZE changed from 927992 to 963263 (+4%)
packages/all-poky-linux/linux-firmware/linux-firmware-qca: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a3xx: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a530: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-adreno-a630: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-audio: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-compute: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-sdm845-modem: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-1.8: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-qcom-venus-4.2: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-radeon: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ralink: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8168: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8188: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192ce: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192cu: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8192su: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8723: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-rtl8821: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8686: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8688: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8787: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8797: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8801: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8887: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-sd8897: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-src: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-src: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-staticdev: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-ti-connectivity-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-usb8997: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-vt6656: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGSIZE changed from 155520 to 155737 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware-whence-license: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-wl18xx: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware-wlcommon: PKGV changed from 20200619 [default] to 20200721 [default]
packages/all-poky-linux/linux-firmware/linux-firmware: PV changed from "20200619" to "20200721"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from 314720060 to 315781808 (+0%)
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/atmel/wilc1000_wifi_firmware-1.bin /lib/firmware/amdgpu/oland_uvd.bin /lib/firmware/amdgpu/verde_uvd.bin /lib/firmware/amd/amd_sev_fam17h_model3xh.sbin /lib/firmware/amdgpu/pitcairn_uvd.bin /lib/firmware/amdgpu/tahiti_uvd.bin"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGV changed from 20200619 [default] to 20200721 [default]
Changes to packages/all-poky-linux/linux-firmware (sysroot):
  /lib/firmware/amd/amd_sev_fam17h_model3xh.sbin was added
  /lib/firmware/amdgpu/oland_uvd.bin was added
  /lib/firmware/amdgpu/pitcairn_uvd.bin was added
  /lib/firmware/amdgpu/tahiti_uvd.bin was added
  /lib/firmware/amdgpu/verde_uvd.bin was added
  /lib/firmware/atmel/wilc1000_wifi_firmware-1.bin was added

--===============4653162791122038030==
Content-Type: text/x-diff; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-linux-firmware-upgrade-20200619-20200721.patch"

RnJvbSAyNjhlM2VlYjhlYjZhMzU2OTU3OTdhMmM3MmM0ZTVmZTRjYWI1MzJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQGF1aC55b2N0b3Byb2plY3Qu
b3JnPgpEYXRlOiBTdW4sIDE2IEF1ZyAyMDIwIDAyOjM3OjA1ICswMDAwClN1YmplY3Q6IFtQQVRD
SF0gbGludXgtZmlybXdhcmU6IHVwZ3JhZGUgMjAyMDA2MTkgLT4gMjAyMDA3MjEKCi0tLQogLi4u
MjAyMDA2MTkuYmIgPT4gbGludXgtZmlybXdhcmVfMjAyMDA3MjEuYmJ9IHwgMjI2ICsrKysrKysr
KysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDIyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUve2xpbnV4LWZp
cm13YXJlXzIwMjAwNjE5LmJiID0+IGxpbnV4LWZpcm13YXJlXzIwMjAwNzIxLmJifSAoODYlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmly
bXdhcmVfMjAyMDA2MTkuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xp
bnV4LWZpcm13YXJlXzIwMjAwNzIxLmJiCnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmVfMjAyMDA2
MTkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtZmlybXdhcmUvbGludXgt
ZmlybXdhcmVfMjAyMDA3MjEuYmIKaW5kZXggYmYyNWZmOGI3MC4uMjVjYmI5YzdjMSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZV8y
MDIwMDYxOS5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWZpcm13YXJlL2xpbnV4
LWZpcm13YXJlXzIwMjAwNzIxLmJiCkBAIC0xLDMgKzEsMjI1IEBACisjIEZJWE1FOiB0aGUgTElD
X0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFk
ZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFu
ZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1
ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBt
ZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1V
cGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIwor
IyAtLS0gV0hFTkNFCisjICsrKyBXSEVOQ0UKKyMgQEAgLTIwNTQsNiArMjA1NCw3IEBACisjICBG
aWxlOiBhbWRncHUvdGFoaXRpX3BmcC5iaW4KKyMgIEZpbGU6IGFtZGdwdS90YWhpdGlfcmxjLmJp
bgorIyAgRmlsZTogYW1kZ3B1L3RhaGl0aV9zbWMuYmluCisjICtGaWxlOiBhbWRncHUvdGFoaXRp
X3V2ZC5iaW4KKyMgIEZpbGU6IGFtZGdwdS9waXRjYWlybl9jZS5iaW4KKyMgIEZpbGU6IGFtZGdw
dS9waXRjYWlybl9rX3NtYy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9waXRjYWlybl9tYy5iaW4KKyMg
QEAgLTIwNjEsNiArMjA2Miw3IEBACisjICBGaWxlOiBhbWRncHUvcGl0Y2Fpcm5fcGZwLmJpbgor
IyAgRmlsZTogYW1kZ3B1L3BpdGNhaXJuX3JsYy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9waXRjYWly
bl9zbWMuYmluCisjICtGaWxlOiBhbWRncHUvcGl0Y2Fpcm5fdXZkLmJpbgorIyAgRmlsZTogYW1k
Z3B1L3ZlcmRlX2NlLmJpbgorIyAgRmlsZTogYW1kZ3B1L3ZlcmRlX2tfc21jLmJpbgorIyAgRmls
ZTogYW1kZ3B1L3ZlcmRlX21jLmJpbgorIyBAQCAtMjA2OCw2ICsyMDcwLDcgQEAKKyMgIEZpbGU6
IGFtZGdwdS92ZXJkZV9wZnAuYmluCisjICBGaWxlOiBhbWRncHUvdmVyZGVfcmxjLmJpbgorIyAg
RmlsZTogYW1kZ3B1L3ZlcmRlX3NtYy5iaW4KKyMgK0ZpbGU6IGFtZGdwdS92ZXJkZV91dmQuYmlu
CisjICBGaWxlOiBhbWRncHUvaGFpbmFuX2NlLmJpbgorIyAgRmlsZTogYW1kZ3B1L2hhaW5hbl9r
X3NtYy5iaW4KKyMgIEZpbGU6IGFtZGdwdS9oYWluYW5fbWMuYmluCisjIEBAIC0yMDgyLDYgKzIw
ODUsNyBAQAorIyAgRmlsZTogYW1kZ3B1L29sYW5kX3BmcC5iaW4KKyMgIEZpbGU6IGFtZGdwdS9v
bGFuZF9ybGMuYmluCisjICBGaWxlOiBhbWRncHUvb2xhbmRfc21jLmJpbgorIyArRmlsZTogYW1k
Z3B1L29sYW5kX3V2ZC5iaW4KKyMgIEZpbGU6IGFtZGdwdS9zaTU4X21jLmJpbgorIyAgRmlsZTog
YW1kZ3B1L2JhbmtzX2tfMl9zbWMuYmluCisjICBGaWxlOiBhbWRncHUvYm9uYWlyZV9jZS5iaW4K
KyMgQEAgLTMwNjIsMTAgKzMwNjYsMTAgQEAKKyMgIFZlcnNpb246IDAuMC4xCisjICAKKyMgIEZp
bGU6IHJ0bF9uaWMvcnRsODEyNWItMS5mdworIyAtVmVyc2lvbjogMC4wLjEKKyMgK1ZlcnNpb246
IDAuMC4yCisjICAKKyMgIEZpbGU6IHJ0bF9uaWMvcnRsODEyNWItMi5mdworIyAtVmVyc2lvbjog
MC4wLjEKKyMgK1ZlcnNpb246IDAuMC4yCisjICAKKyMgIExpY2VuY2U6CisjICAgKiBDb3B5cmln
aHQgwqkgMjAxMS0yMDEzLCBSZWFsdGVrIFNlbWljb25kdWN0b3IgQ29ycG9yYXRpb24KKyMgQEAg
LTM0MDQsMTMgKzM0MDgsMTMgQEAKKyMgIEZpbGU6IGludGVsL2lidC0xMi0xNi5zZmkKKyMgIFZl
cnNpb246IEJUX1dpbmRTdG9ybVBlYWtfUkVMMDMwNgorIyAgRmlsZTogaW50ZWwvaWJ0LTE3LTE2
LTEuc2ZpCisjIC1WZXJzaW9uOiBCVF9KZWZmZXJzb25QZWFrX0IwX0IwX1JFTDgzNTYKKyMgK1Zl
cnNpb246IEJUX0plZmZlcnNvblBlYWtfQjBfQjBfUkVMMTAxODMKKyMgIEZpbGU6IGludGVsL2li
dC0xNy0xNi0xLmRkYworIyAtVmVyc2lvbjogQlRfSmVmZmVyc29uUGVha19CMF9CMF9SRUw4MzU2
CisjICtWZXJzaW9uOiBCVF9KZWZmZXJzb25QZWFrX0IwX0IwX1JFTDEwMTgzCisjICBGaWxlOiBp
bnRlbC9pYnQtMTctMi5zZmkKKyMgLVZlcnNpb246IEJUX0plZmZlcnNvblBlYWtfQjBfQjBfUkVM
ODM1NgorIyArVmVyc2lvbjogQlRfSmVmZmVyc29uUGVha19CMF9CMF9SRUwxMDE4MworIyAgRmls
ZTogaW50ZWwvaWJ0LTE3LTIuZGRjCisjIC1WZXJzaW9uOiBCVF9KZWZmZXJzb25QZWFrX0IwX0Iw
X1JFTDgzNTYKKyMgK1ZlcnNpb246IEJUX0plZmZlcnNvblBlYWtfQjBfQjBfUkVMMTAxODMKKyMg
IEZpbGU6IGludGVsL2lidC0xNy0wLTEuc2ZpCisjICBWZXJzaW9uOiBCVF9KZWZmZXJzb25QZWFr
X0EwX0IwX1JFTDAyMDEKKyMgIEZpbGU6IGludGVsL2lidC0xNy0wLTEuZGRjCisjIEBAIC0zNDIw
LDEzICszNDI0LDEzIEBACisjICBGaWxlOiBpbnRlbC9pYnQtMTctMS5kZGMKKyMgIFZlcnNpb246
IEJUX0plZmZlcnNvblBlYWtfQTBfQjBfUkVMMDIwMQorIyAgRmlsZTogaW50ZWwvaWJ0LTE4LTE2
LTEuc2ZpCisjIC1WZXJzaW9uOiBCVF9UaHVuZGVyUGVha19CMF9CMF9SRUw4MzU2CisjICtWZXJz
aW9uOiBCVF9UaHVuZGVyUGVha19CMF9CMF9SRUwxMDE4MworIyAgRmlsZTogaW50ZWwvaWJ0LTE4
LTE2LTEuZGRjCisjIC1WZXJzaW9uOiBCVF9UaHVuZGVyUGVha19CMF9CMF9SRUw4MzU2CisjICtW
ZXJzaW9uOiBCVF9UaHVuZGVyUGVha19CMF9CMF9SRUwxMDE4MworIyAgRmlsZTogaW50ZWwvaWJ0
LTE4LTIuc2ZpCisjIC1WZXJzaW9uOiBCVF9UaHVuZGVyUGVha19CMF9CMF9SRUw4MzU2CisjICtW
ZXJzaW9uOiBCVF9UaHVuZGVyUGVha19CMF9CMF9SRUwxMDE4MworIyAgRmlsZTogaW50ZWwvaWJ0
LTE4LTIuZGRjCisjIC1WZXJzaW9uOiBCVF9UaHVuZGVyUGVha19CMF9CMF9SRUw4MzU2CisjICtW
ZXJzaW9uOiBCVF9UaHVuZGVyUGVha19CMF9CMF9SRUwxMDE4MworIyAgRmlsZTogaW50ZWwvaWJ0
LTE4LTAtMS5zZmkKKyMgIFZlcnNpb246IEJUX1RodW5kZXJQZWFrX0EwX0IwX1JFTDAyMDEKKyMg
IEZpbGU6IGludGVsL2lidC0xOC0wLTEuZGRjCisjIEBAIC0zNDM2LDUzICszNDQwLDUzIEBACisj
ICBGaWxlOiBpbnRlbC9pYnQtMTgtMS5kZGMKKyMgIFZlcnNpb246IEJUX1RodW5kZXJQZWFrX0Ew
X0IwX1JFTDAyMDEKKyMgIEZpbGU6aW50ZWwvaWJ0LTIwLTAtMy5zZmkKKyMgLVZlcnNpb246IEJU
X0N5Y2xvbmVQZWFrX0EwX1JFTDgzMDEKKyMgK1ZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JF
TDk5MTYKKyMgIEZpbGU6aW50ZWwvaWJ0LTIwLTAtMy5kZGMKKyMgLVZlcnNpb246IEJUX0N5Y2xv
bmVQZWFrX0EwX1JFTDgzMDEKKyMgK1ZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDk5MTYK
KyMgIEZpbGU6aW50ZWwvaWJ0LTIwLTEtMy5zZmkKKyMgLVZlcnNpb246IEJUX0N5Y2xvbmVQZWFr
X0EwX1JFTDgzMDEKKyMgK1ZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDk5MTYKKyMgIEZp
bGU6aW50ZWwvaWJ0LTIwLTEtMy5kZGMKKyMgLVZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JF
TDgzMDEKKyMgK1ZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDk5MTYKKyMgIEZpbGU6aW50
ZWwvaWJ0LTIwLTEtNC5zZmkKKyMgLVZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDgzMDEK
KyMgK1ZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDk5MTYKKyMgIEZpbGU6aW50ZWwvaWJ0
LTIwLTEtNC5kZGMKKyMgLVZlcnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDgzMDEKKyMgK1Zl
cnNpb246IEJUX0N5Y2xvbmVQZWFrX0EwX1JFTDk5MTYKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTAt
MC5zZmkKKyMgLVZlcnNpb246IEJUX1F1YXNhcl9SRUw4MzAxCisjICtWZXJzaW9uOiBCVF9RdWFz
YXJfUkVMOTkxNgorIyAgRmlsZTppbnRlbC9pYnQtMTktMC0wLmRkYworIyAtVmVyc2lvbjogQlRf
UXVhc2FyX1JFTDgzMDEKKyMgK1ZlcnNpb246IEJUX1F1YXNhcl9SRUw5OTE2CisjICBGaWxlOmlu
dGVsL2lidC0xOS0wLTEuc2ZpCisjIC1WZXJzaW9uOiBCVF9RdWFzYXJfUkVMODMwMQorIyArVmVy
c2lvbjogQlRfUXVhc2FyX1JFTDk5MTYKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTAtMS5kZGMKKyMg
LVZlcnNpb246IEJUX1F1YXNhcl9SRUw4MzAxCisjICtWZXJzaW9uOiBCVF9RdWFzYXJfUkVMOTkx
NgorIyAgRmlsZTppbnRlbC9pYnQtMTktMC00LnNmaQorIyAtVmVyc2lvbjogQlRfSGFycmlzb25Q
ZWFrX1JFTDgzMDEKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw5OTE2CisjICBGaWxl
OmludGVsL2lidC0xOS0wLTQuZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMODMw
MQorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDk5MTYKKyMgIEZpbGU6aW50ZWwvaWJ0
LTE5LTE2LTQuc2ZpCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMODMwMQorIyArVmVy
c2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDk5MTYKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTE2LTQu
ZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMODMwMQorIyArVmVyc2lvbjogQlRf
SGFycmlzb25QZWFrX1JFTDk5MTYKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTMyLTEuc2ZpCisjIC1W
ZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMODMwMQorIyArVmVyc2lvbjogQlRfSGFycmlzb25Q
ZWFrX1JFTDk5MTYKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTMyLTEuZGRjCisjIC1WZXJzaW9uOiBC
VF9IYXJyaXNvblBlYWtfUkVMODMwMQorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDk5
MTYKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTMyLTAuc2ZpCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNv
blBlYWtfUkVMODMwMQorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDk5MTYKKyMgIEZp
bGU6aW50ZWwvaWJ0LTE5LTMyLTAuZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVM
ODMwMQorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDk5MTYKKyMgIEZpbGU6aW50ZWwv
aWJ0LTE5LTMyLTQuc2ZpCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMODMwMQorIyAr
VmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDk5MTYKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTMy
LTQuZGRjCisjIC1WZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtfUkVMODMwMQorIyArVmVyc2lvbjog
QlRfSGFycmlzb25QZWFrX1JFTDk5MTYKKyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTI0MC0xLnNmaQor
IyAtVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDgzMDEKKyMgK1ZlcnNpb246IEJUX0hhcnJp
c29uUGVha19SRUw5OTE2CisjICBGaWxlOmludGVsL2lidC0xOS0yNDAtMS5kZGMKKyMgLVZlcnNp
b246IEJUX0hhcnJpc29uUGVha19SRUw4MzAxCisjICtWZXJzaW9uOiBCVF9IYXJyaXNvblBlYWtf
UkVMOTkxNgorIyAgRmlsZTppbnRlbC9pYnQtMTktMjQwLTQuc2ZpCisjIC1WZXJzaW9uOiBCVF9I
YXJyaXNvblBlYWtfUkVMODMwMQorIyArVmVyc2lvbjogQlRfSGFycmlzb25QZWFrX1JFTDk5MTYK
KyMgIEZpbGU6aW50ZWwvaWJ0LTE5LTI0MC00LmRkYworIyAtVmVyc2lvbjogQlRfSGFycmlzb25Q
ZWFrX1JFTDgzMDEKKyMgK1ZlcnNpb246IEJUX0hhcnJpc29uUGVha19SRUw5OTE2CisjICAKKyMg
IAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5pYnRfZmlybXdhcmUg
Zm9yIGRldGFpbHMKKyMgQEAgLTM1NzksNyArMzU4Myw5IEBACisjICBEcml2ZXI6IGNjcCAtIFBs
YXRmb3JtIFNlY3VyaXR5IFByb2Nlc3NvciAoUFNQKSBkZXZpY2UKKyMgIAorIyAgRmlsZTogYW1k
L2FtZF9zZXZfZmFtMTdoX21vZGVsMHhoLnNiaW4KKyMgLVZlcnNpb246IDIwMTktMDItMTMKKyMg
K1ZlcnNpb246IDIwMjAtMDctMjEKKyMgK0ZpbGU6IGFtZC9hbWRfc2V2X2ZhbTE3aF9tb2RlbDN4
aC5zYmluCisjICtWZXJzaW9uOiAyMDIwLTA3LTIxCisjICAKKyMgIExpY2Vuc2U6IFJlZGlzdHJp
YnV0YWJsZS4gU2VlIExJQ0VOU0UuYW1kLXNldiBmb3IgZGV0YWlscworIyAgCisjIEBAIC00NDk5
LDYgKzQ1MDUsOCBAQAorIyAgRmlsZTogYXRtZWwvd2lsYzEwMDBfYXBfZncuYmluCisjICBGaWxl
OiBhdG1lbC93aWxjMTAwMF9wMnBfZncuYmluCisjICBGaWxlOiBhdG1lbC93aWxjMTAwMF93aWZp
X2Zpcm13YXJlLmJpbgorIyArRmlsZTogYXRtZWwvd2lsYzEwMDBfd2lmaV9maXJtd2FyZS0xLmJp
bgorIyArVmVyc2lvbjogMTUuNAorIyAgCisjICBMaWNlbnNlOiBSZWRpc3RyaWJ1dGFibGUuIFNl
ZSBMSUNFTlNFLmF0bWVsIGZvciBkZXRhaWxzCisjICAKKyMgQEAgLTQ1ODUsNyArNDU5Myw3IEBA
CisjICBGaWxlOiBtZWRpYXRlay9tdDc2NjhwcjJoLmJpbgorIyAgVmVyc2lvbjogMjAxODA1MTcx
ODE4MzQKKyMgIEZpbGU6IG1lZGlhdGVrL210NzY2M3ByMmguYmluCisjIC1WZXJzaW9uOiA3NjYz
bXAxODAyLTIwMDMyMTEyMjkKKyMgK1ZlcnNpb246IDc2NjNlMmNjbjA0LTIwMDYwMzAyNDcKKyMg
IAorIyAgTGljZW5jZTogUmVkaXN0cmlidXRhYmxlLiBTZWUgTElDRU5DRS5tZWRpYXRlayBmb3Ig
ZGV0YWlscy4KKyMgIAorIyBAQCAtNDYzOSw3ICs0NjQ3LDcgQEAKKyMgIERyaXZlcjogbXQ3NjE1
ZSAtIE1lZGlhVGVrIE1UNzYxNWUgV2lyZWxlc3MgTUFDcworIyAgCisjICBGaWxlOiBtZWRpYXRl
ay9tdDc2MTVfbjkuYmluCisjIC1WZXJzaW9uOiAyMDIwMDEzMQorIyArVmVyc2lvbjogMjAyMDA2
MjkKKyMgIEZpbGU6IG1lZGlhdGVrL210NzYxNV9jcjQuYmluCisjICBWZXJzaW9uOiAyMDE5MDEx
NAorIyAgRmlsZTogbWVkaWF0ZWsvbXQ3NjE1X3JvbV9wYXRjaC5iaW4KKyMgQEAgLTQ2NjMsOSAr
NDY3MSw5IEBACisjICBEcml2ZXI6IG10NzY2MyAtIE1lZGlhVGVrIE1UNzY2MyBXaXJlbGVzcyBN
QUNzCisjICAKKyMgIEZpbGU6IG1lZGlhdGVrL210NzY2M3ByMmguYmluCisjIC1WZXJzaW9uOiA3
NjYzbXAxODAyLTIwMDMyMTEyMjkKKyMgK1ZlcnNpb246IDc2NjNlMmNjbjA0LTIwMDYwMzAyNDcK
KyMgIEZpbGU6IG1lZGlhdGVrL210NzY2M19uOV92My5iaW4KKyMgLVZlcnNpb246IDc2NjNtcDE4
MjctMjAyMDAzMjYxMzAzMTcKKyMgK1ZlcnNpb246IHYzLjEuMQorIyAgCisjICBGaWxlOiBtZWRp
YXRlay9tdDc2NjNwcjJoX3JlYmIuYmluCisjICBWZXJzaW9uOiA3NjYzZTItMTgwMi0xOTA5MTQw
NDMzOGI4MDkKKyMgCisjCisKIFNVTU1BUlkgPSAiRmlybXdhcmUgZmlsZXMgZm9yIHVzZSB3aXRo
IExpbnV4IGtlcm5lbCIKIFNFQ1RJT04gPSAia2VybmVsIgogCkBAIC0xMjYsNyArMzQ4LDcgQEAg
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5DRS5BYmlsaXM7bWQ1PWI1ZWUzZjQxMDc4
MGU1NjcxMWFkNDhlYWRjMjJiOGJjIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VO
Q0UueGM0MDAwO21kNT0wZmY1MWQyZGM0OWZjZTA0ODE0YzkxNTUwODEwOTJmMCBcCiAgICAgICAg
ICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTkNFLnhjNTAwMDttZDU9MWUxNzBjMTMxNzUzMjNjMzJj
N2Y0ZDA5OThkNTNmNjYgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5DRS54YzUw
MDBjO21kNT0xMmIwMmVmYTMwNDlkYjY1ZDUyNGFlYjQxOGRkODdjYSBcCi0gICAgICAgICAgICAg
ICAgICAgIGZpbGU6Ly9XSEVOQ0U7bWQ1PWQzNzNkMzAxODhjMzhkYWJmZmVjMGQzY2M4N2FiYmZk
IFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL1dIRU5DRTttZDU9NzYyN2EwYmE5YTc4ZTdl
NTU2YWZjZjE1YjA5NzEwMTYgXAogICAgICAgICAgICAgICAgICAgICAiCiAKICMgVGhlc2UgYXJl
IG5vdCBjb21tb24gbGljZW5zZXMsIHNldCBOT19HRU5FUklDX0xJQ0VOU0UgZm9yIHRoZW0KQEAg
LTE5OCw3ICs0MjAsNyBAQCBQRSA9ICIxIgogCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJP
Un0vbGludXgva2VybmVsL2Zpcm13YXJlLyR7QlBOfS0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI5NjJkM2FlMTk3ZDIyNmM4MjU5ZjljYzc3NDZmN2VmMTJhOWQyMzc4N2Nk
NTZiZDI3MzAyMDIxYmE2MzM5NzIyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg5OGMzMzRiMGRh
N2RlNmVhMTczODk5YmViNjk2ZmFkNjQ3ZGNlMGMwNjk2MGQ3MzY4YmE0ZDRlODAyZmI4NjAiCiAK
IGluaGVyaXQgYWxsYXJjaAogCi0tIAoyLjE3LjEKCg==

--===============4653162791122038030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: added "/lib/firmware/amdgpu/oland_uvd.bin /lib/firmware/amdgpu/tahiti_uvd.bin /lib/firmware/atmel/wilc1000_wifi_firmware-1.bin /lib/firmware/amdgpu/verde_uvd.bin /lib/firmware/amd/amd_sev_fam17h_model3xh.sbin /lib/firmware/amdgpu/pitcairn_uvd.bin"
Changes to packages/all-poky-linux/linux-firmware (sysroot):
  /lib/firmware/amd/amd_sev_fam17h_model3xh.sbin was added
  /lib/firmware/amdgpu/oland_uvd.bin was added
  /lib/firmware/amdgpu/pitcairn_uvd.bin was added
  /lib/firmware/amdgpu/tahiti_uvd.bin was added
  /lib/firmware/amdgpu/verde_uvd.bin was added
  /lib/firmware/atmel/wilc1000_wifi_firmware-1.bin was added

--===============4653162791122038030==--
