Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1801D7DDAA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 05:23:26 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q21so843928pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 22:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YJJkWPXGycbqGiAdDkGJfTBceWdeayu6n+473LCtgvM=;
	b=XPLNlpfJwZZbNUWk8yJtuJtVpUKMIiCO0cXb93C/besMqcs2KOa9LO0fmLhIWQRg6s
	+xHGWLOK8i2+i+x4Sw1rjzmPi0IBvYve4Id5wUSVkeeacJeuFIC0tb9S5PKoQyl7O2XZ
	lDeIeF4B/IcmmMFQCFsSTB3ySUnD2kRFjZzkkT14g9I7j8yPgsXEj8Of/5/gSJ5/+8ok
	HhE9iJ7DhpUtpdmbQ8W84p8/Zty1NDKmxaeqW+49yzuvwqQyiRcGwU1DyasAvDCYQ1Xx
	6Hkz+rLbd2bH+tRDux1qNl3JfGDBKPxVE/PYokYIePhg3jowVY+KtteOEBNrTut5/82O
	42Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YJJkWPXGycbqGiAdDkGJfTBceWdeayu6n+473LCtgvM=;
	b=MTjnR0lRMbz/1vh41CjV1kibzGcUdsxbRL5F7GYhDCXRhhL1oYepK99w/UL0tvrt/M
	+2WLmvHoZuz81sijapuIFSOkSVcymHXytueNWn6z/kkyaF2dxVru9dMNm9bBUnLbKGog
	+cy0fq8Gm4AvqfcFNDsAws5yP+HD4riNwiTMhMnAGKyLtFKJ27n+v9WbDFfj0FFa6xXf
	BvXAXXXZVVCXbprt5k3+nvknbEE3Jijrw/8/qfydRyTPU2ruq2C1ZjZBnjCxXqtPNiBF
	0Y9xoyBJMuASWqLryIBzD/tc7B2okzDNx7pX9iHvdJJ+4YWGyPgoumAv3fVt/1sGjiTr
	K5ww==
X-Gm-Message-State: APjAAAWY8+OS9DUaBv2a09U7x/1rSWg4j9dwDRTbDixXVOI013ps7DdP
	2DFZB2hBqkn9f6RAex5Go3heHDhnUk8=
X-Google-Smtp-Source: APXvYqxiVPneo82VAD6XXRn0Q0ZzA2S1IXPTaa3yidBTXScWXkwn7AoCRgMcvCI2YfXHEXbHcBy6YA==
X-Received: by 2002:a63:7b4d:: with SMTP id k13mr15487356pgn.182.1567229006594;
	Fri, 30 Aug 2019 22:23:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	131sm6493221pge.37.2019.08.30.22.23.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 22:23:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 22:23:12 -0700
Message-Id: <20190831052314.19974-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190831052314.19974-1-raj.khem@gmail.com>
References: <20190831052314.19974-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] tune-riscv: Drop littleendian and introduce bigendian tune
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
X-List-Received-Date: Sat, 31 Aug 2019 05:23:26 -0000
Content-Transfer-Encoding: 8bit

Default riscv is little-endian moreover most of other arches define
bigendian as tune and treats absense as litteendian, this make risc-v
fall in line

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index 1e3a1081e0..25d0463492 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -3,16 +3,16 @@ require conf/machine/include/riscv/arch-riscv.inc
 TUNEVALID[riscv64] = "Enable 64-bit RISC-V optimizations"
 TUNEVALID[riscv32] = "Enable 32-bit RISC-V optimizations"
 
-TUNEVALID[littleendian] = "Little endian mode"
+TUNEVALID[bigendian] = "Big endian mode"
 
 AVAILTUNES += "riscv64 riscv32"
 
-TUNE_FEATURES_tune-riscv64 = "riscv64 littleendian"
+TUNE_FEATURES_tune-riscv64 = "riscv64"
 TUNE_ARCH_tune-riscv64 = "riscv64"
 TUNE_PKGARCH_tune-riscv64 = "riscv64"
 PACKAGE_EXTRA_ARCHS_tune-riscv64 = "riscv64"
 
-TUNE_FEATURES_tune-riscv32 = "riscv32 littleendian"
+TUNE_FEATURES_tune-riscv32 = "riscv32"
 TUNE_ARCH_tune-riscv32 = "riscv32"
 TUNE_PKGARCH_tune-riscv32 = "riscv32"
 PACKAGE_EXTRA_ARCHS_tune-riscv32 = "riscv32"
-- 
2.23.0


