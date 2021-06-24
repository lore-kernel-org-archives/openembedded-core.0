Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
 by mx.groups.io with SMTP id smtpd.web11.7961.1624543408166635707
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jun 2021 07:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@synopsys.com header.s=mail header.b=mUGFVGl7;
 spf=pass (domain: synopsys.com, ip: 149.117.73.133, mailfrom: alexey.brodkin@synopsys.com)
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2651C41016;
	Thu, 24 Jun 2021 14:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1624543407; bh=JtFCR7lanTBQEQT4vTukme4nAtUIUHbkh64et6oQtyE=;
	h=From:To:Cc:Subject:Date:From;
	b=mUGFVGl7k9dH3Yr0hu9SsDg1eRhl+q8ApvDx4gcsanyFSG+qqgQBdf7eo9Ofcysgd
	 sBnmuCBbGt8PzfJ3Nii/1ebtfXtJbzvDXV7n/pryyAJKcMk+W8szbyYaFQnTWY8c8w
	 ebUq7Hh/h1x4q4JEEigzmIbvhd+Uq/ApDywP8IBrQ4OLaK7tq/Y95rF6Ryfysvn6j6
	 ocs8xbJH3IawsmIMENDTedaAtobyhmTGiwnZw+d7oq9SPjq0H3aPRUkdh2L/YHgh6Q
	 1DoQ1+tUxL2C+waW/XYU7FFkH2Jx/wIz463r9mFP8/wTi/F9uU0Eq6KXB91qY9waGz
	 RMlY/lgKu6lHg==
Received: from us01odcres-abrodkin-0009.internal.synopsys.com (us01odcres-abrodkin-0009.sg.us01-p01.synopsys.com [10.195.24.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 46759A006D;
	Thu, 24 Jun 2021 14:03:24 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: "Alexey Brodkin" <abrodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] default-distrovars.inc: Remove seccomp for ARC
Date: Thu, 24 Jun 2021 07:03:09 -0700
Message-Id: <20210624140309.819-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2

libseccomp needs too be ported to ARC first

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index ac10245767..e0726fa3bb 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -13,6 +13,9 @@ LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
 # seccomp is not yet ported to rv32
 DISTRO_FEATURES_DEFAULT_remove_riscv32 = "seccomp"
 
+# seccomp is not yet ported to ARC
+DISTRO_FEATURES_DEFAULT_remove_arc = "seccomp"
+
 DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp"
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
-- 
2.16.2

