Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id E1F7D607AB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 01:10:07 +0000 (UTC)
Received: by oiww189 with SMTP id w189so19045837oiw.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 17:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C/Sx1hkVSSlP61PanaF5WxPdvfuxRbIMoynsJMwUaU4=;
	b=xV4R6iL+Ro+Nw5UW4y9sBrXDTKZlzXKmeZTfjD+uDz/MSsN4A+vIPN86GeXSEOWLgO
	P5ORzrWrbrYJZ1HrRqazHA8wkrv5q/8CoIy9kW7k/jea98Z+8ggaL+QK413OzzNF2C29
	YsNqWQmnpJ0ZPGqlQmQR6M0K4xhpcuHhE/9OLm8DrvF/R5NiPwElPeMAL49k4gUjf9O6
	AkZNOrMWuFfdwSI9Eq1zrFqjURtbCIvN6XsIFe9lyoCeUx/sTtr4oSbs1YJ+cw9fKf5k
	Tphft8MNluJufCg8xSkq4MJ50t7dRtfKIXF0+7E5wMAsbQ2ExF/Vi/e/YiNf0I8vg3BK
	d4KQ==
X-Received: by 10.202.81.87 with SMTP id f84mr2194288oib.0.1449623408423;
	Tue, 08 Dec 2015 17:10:08 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id t84sm2540098oie.1.2015.12.08.17.10.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 17:10:07 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 17:09:56 -0800
Message-Id: <1449623398-29127-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1449623398-29127-1-git-send-email-armccurdy@gmail.com>
References: <1449623398-29127-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/3] feature-arm-thumb.inc: drop ARM -vs- thumb comments
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
X-List-Received-Date: Wed, 09 Dec 2015 01:10:10 -0000

Comments are old and specific to thumb1. Since oe-core CPU tuning
files aren't really the right place to fully document ARM -vs- thumb,
drop the comments instead of trying to update them.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 5632171..0a9545c 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -1,9 +1,3 @@
-# The instruction set the compiler should use when generating application
-# code. The kernel is always compiled with arm code at present. arm code
-# is the original 32 bit ARM instruction set, thumb code is the 16 bit
-# encoded RISC sub-set. Thumb code is smaller (maybe 70% of the ARM size)
-# but requires more instructions (140% for 70% smaller code) so may be
-# slower.
 TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
 ARM_THUMB_OPT = "${@['arm', 'thumb'][d.getVar('ARM_INSTRUCTION_SET', True) == 'thumb']}"
 ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4',  't',  '', d)}"
-- 
1.9.1


