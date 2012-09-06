Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T9U1c-00069c-DU
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 06:49:08 +0200
Received: by iebc11 with SMTP id c11so2406251ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 21:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Zs23OnViinEN/+zLyHuBIeiLC7X/grrJWKs9t/0q0mI=;
	b=0BH8oEyTdx2wOS6BJWRbtmUtj+IreoohrUbyijOZCq4Dul/Bu+IYj+jsgTI2Crfjxz
	pUWu1c7k4igYipN6OWWPkBG9p7A84quh6IyM2guj+wbUr02rvsN5J4jj1zk8JISX0jyo
	lOAdF4E69cjtGUUUtL8O4uY2rc8RsiWZ8Nh52xZAq+H72yQTIl27O9wzGTOHGXZlqN0G
	PQU2OnJl0GsWRKo37SiEDjNBBS9oWa5CDmOLjCGpDo1+FWg0HOq0E4dF1dLOSDN6OAtP
	Nq7NJJA+XcTA2k64I6ti0PEknNzRdIqWoAS/5Ty9N+I073EePyv4sE219wLsgV7oTTfH
	HELg==
Received: by 10.43.48.129 with SMTP id uw1mr644311icb.10.1346906204142;
	Wed, 05 Sep 2012 21:36:44 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id xm2sm2662687igb.3.2012.09.05.21.36.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 21:36:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2012 21:35:46 -0700
Message-Id: <d03f827089e5f02d847602cb66394582647a0160.1346905978.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <5c54fcdb91d19909f8658b6a6e8d6e6cac934cf2.1346905978.git.raj.khem@gmail.com>
References: <5c54fcdb91d19909f8658b6a6e8d6e6cac934cf2.1346905978.git.raj.khem@gmail.com>
In-Reply-To: <cover.1346905978.git.raj.khem@gmail.com>
References: <cover.1346905978.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] arch-armv4.inc: On armv4 add --fix-v4bx to linker flags for kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 04:49:08 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv4.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index a09c323..cb747ac 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -4,6 +4,7 @@ ARMPKGARCH ?= "armv4"
 
 TUNEVALID[armv4] = "Enable instructions for ARMv4"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=armv4${ARMPKGSFX_THUMB}", "", d)}"
+TARGET_LD_KERNEL_ARCH += "${@bb.utils.contains("TUNE_FEATURES", "armv4", "--fix-v4bx", "", d)}"
 MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv4", ":armv4", "" ,d)}"
 
 require conf/machine/include/arm/arch-arm.inc
-- 
1.7.9.5



