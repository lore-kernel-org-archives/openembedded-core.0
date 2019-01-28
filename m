Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id BA33E7C47F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 16:25:31 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x10so18711878wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 08:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=8uYs1QwU1I7wo4fRGEOQ8IqWaLIhSLgazvpoEXmxGCg=;
	b=lwcLUain2UA7H9r5uaj4nNhv/8VoHa/u8Y9v/oIJg7EwqdL+gyt4DwmXSAyawcHsEa
	BPjVbtYSrHN9OOCvC3A2eopyEkKVH0hrAHCoRnvH6Wtil9ZKLvEq+lQm5sUXQkBokS06
	a+IxF/OdrHoIfGiy/54svIObUf96qFRPIjSRJR/FlBiaYF3UOvr/4sH1tUjdz+N5/gtm
	JenGW3fN5kIlDCZN+KboBsXi0yH8w3Rcl1pU/fTwEOJDXbXMAmeJ5rvBuHVIJUH6Xru8
	Z3PenOb0fTSw3S/YQnWg+lA7l0gHJCxDKkBx45Y/DeNPcrebc2diS/6T23cYTE8l8jkL
	G6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8uYs1QwU1I7wo4fRGEOQ8IqWaLIhSLgazvpoEXmxGCg=;
	b=XgUbZjz2muMZedrdmqA3A0OafNIsTPagjOrvmsUsp+JydyPfv453J1xMGEM1TVILfM
	ZKyKi2b5i8Qvw4x46UWYfwe9/zz+r0sZZ77p7BLkh8xuDj7zij/JEG3NxXh7IjYS9t7v
	fzKiumHV4VdJ2dNEN17XAC7P8o1BydAzaJbFkyzaW8W+oMj4IYNoxPKh9a/f37lLTNoZ
	i0WFq+HOy/K+8/k1+W0eAv6Jn1yTSz21BwSs8of9WjdEA9S63Nu9ibPF5P2HVGgRduPA
	ZFnyHYhckn/dvB3W/JvrpUzqBMHtNYeEpfptyvu1pi2FGxKGhauj06E4sd4vg/xA2vUq
	aYQg==
X-Gm-Message-State: AJcUukfme5a4sRjL/NHC0WkFw/Bil/CTrGc+yDqBvXSDkPuMJexmVUYH
	P7jLDaj+cG3KQ4og1A80RQNr/AIV180=
X-Google-Smtp-Source: ALg8bN4+0Xi221QejnLeobVvMYp1OyremC+JIN6zMlJxPFw+D2RYgL8fsYfSk1eQd/ail85Jf0E4lw==
X-Received: by 2002:adf:93e2:: with SMTP id 89mr23232471wrp.129.1548692731848; 
	Mon, 28 Jan 2019 08:25:31 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d16sm94557969wru.52.2019.01.28.08.25.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 08:25:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 16:25:27 +0000
Message-Id: <20190128162528.3009-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] linux-firmware: recommend split up packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2019 16:25:32 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index ef8bae9f0c6..2e5d0f3e945 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -920,13 +920,13 @@ RDEPENDS_${PN} += "${PN}-whence-license"
 # Make linux-firmware-ibt depend on all of the split-out ibt packages.
 python populate_packages_prepend () {
     firmware_pkgs = oe.utils.packages_filter_out_system(d)
-    d.appendVar('RDEPENDS_linux-firmware', ' ' + ' '.join(firmware_pkgs))
+    d.appendVar('RRECOMMENDS_linux-firmware', ' ' + ' '.join(firmware_pkgs))
 
     iwlwifi_pkgs = filter(lambda x: x.find('-iwlwifi-') != -1, firmware_pkgs)
-    d.appendVar('RDEPENDS_linux-firmware-iwlwifi', ' ' + ' '.join(iwlwifi_pkgs))
+    d.appendVar('RRECOMMENDS_linux-firmware-iwlwifi', ' ' + ' '.join(iwlwifi_pkgs))
 
     ibt_pkgs = filter(lambda x: x.find('-ibt-') != -1, firmware_pkgs)
-    d.appendVar('RDEPENDS_linux-firmware-ibt', ' ' + ' '.join(ibt_pkgs))
+    d.appendVar('RRECOMMENDS_linux-firmware-ibt', ' ' + ' '.join(ibt_pkgs))
 }
 
 # Firmware files are generally not ran on the CPU, so they can be
-- 
2.11.0


