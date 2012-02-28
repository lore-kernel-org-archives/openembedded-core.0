Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S2PRx-0005OZ-CT
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 16:58:49 +0100
Received: by wera1 with SMTP id a1so1474905wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 07:50:22 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.135.214 as permitted sender)
	client-ip=10.216.135.214; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.135.214 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.135.214])
	by 10.216.135.214 with SMTP id u64mr9933273wei.58.1330444222123
	(num_hops = 1); Tue, 28 Feb 2012 07:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=gamma;
	h=mime-version:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=XCqgyI2iXyTdqEZzKsy3GZRTfDRavSZZ/c/WAReL/54=;
	b=c8MyfswEjZyG1kYS/YClxbZsgOXqLpFOIWUHKudQVrGPmzYWd5aBsg/tuzO5Vg1YmS
	EgHHsMCinZXGeKYZ1ghVSEsW7mmFYNgJDLHXZCI9p7/7iWiwjaZaewtRvXeHyIFifGsw
	mZSL0UvKxwF5kz18f4OEdg76fZMjyHrUpIS/U=
MIME-Version: 1.0
Received: by 10.216.135.214 with SMTP id u64mr7868793wei.58.1330444222059;
	Tue, 28 Feb 2012 07:50:22 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id dw7sm29565206wib.4.2012.02.28.07.50.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 07:50:21 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 16:50:15 +0100
Message-Id: <1330444215-14321-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQk+TJhPFe7b8hZ0lvR10lH+Dv01pyFNyHzyPkE9zwpbQEmgDs+afwkdu+RA3Vhnyr69GtE9
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] bootimg bbclass: quoting fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2012 15:58:49 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/bootimg.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 1d1a3d0..c4a4c2a 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -35,8 +35,8 @@ ISODIR = "${S}/iso"
 BOOTIMG_VOLUME_ID   ?= "boot"
 BOOTIMG_EXTRA_SPACE ?= "512"
 
-EFI = ${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}
-EFI_CLASS = ${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "dummy", d)}
+EFI = '${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}'
+EFI_CLASS = '${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "dummy", d)}'
 
 # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
 # contain "efi". This way legacy is supported by default if neither is
-- 
1.7.2.5



