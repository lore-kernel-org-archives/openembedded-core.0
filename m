Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9759.1611053594867115194
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 02:53:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A552B1042;
	Tue, 19 Jan 2021 02:53:13 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.9.194])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 682863F68F;
	Tue, 19 Jan 2021 02:53:12 -0800 (PST)
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: openembedded-core@lists.openembedded.org,
	Lakshmi.Kailasanathan@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [meta-oe][PATCH v2 0/3] kernel-fitimage: adding support for Initramfs bundle and u-boot script
Date: Tue, 19 Jan 2021 10:53:00 +0000
Message-Id: <20210119105303.20592-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This is the version 2 of adding support to Initramfs bundles and u-boot script in the FIT image.

This patchset provides the following:

- Initramfs bundle support in the FIT image kernel class
- Allowing to use the Initramfs bundle with the FIT image in the kernel class
- A self-contained test case allowing to validate the Initramfs bundle support in the FIT image
- u-boot script support in the FIT image kernel class

A 4th patch will be sent to the Yocto documentation which describes the new features.

Abdellatif El Khlifi (3):
  kernel-fitimage: adding support for Initramfs bundle and u-boot script
  kernel: skip installing fitImage when using Initramfs bundles
  oeqa/selftest/imagefeatures: adding fitImage initramfs bundle testcase

 meta/classes/kernel-fitimage.bbclass     | 160 +++++++++++++++++++----
 meta/classes/kernel.bbclass              |  16 ++-
 meta/lib/oeqa/selftest/cases/fitimage.py | 132 +++++++++++++++++++
 3 files changed, 284 insertions(+), 24 deletions(-)

-- 
2.17.1

