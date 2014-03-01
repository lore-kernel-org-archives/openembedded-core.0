Return-Path: <net147@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id DB3236BD13
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 11:29:17 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id rr13so1888131pbb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Mar 2014 03:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=V+wcN+xZbMsKfw6dS/c/8ELy0CRIuJpmTfpwH+bDPRg=;
	b=xevGASzdtdgUeWy/Gj8rBUhggPRHrscrp+h/905IX2gpf4qCZBl5vF8knSmPeUpPHm
	isjjCV3GWuApHAp0s7oz/E1U7AkGdPg4DmvbsaEn0WRKl6Xe9wzI86Rfn8Pu40/GO2nH
	b6NjFFA6mgtXON4fvvsTRV4LBFBOHSuIFF9ZIvn8/IkYOzQQWvZRrDz7wtgwRnFQyFAR
	RzzYnw0OuTBvXzorbEG3+o6NfTcrLQxKSfA8qRVQ/4paedeV3lfCaQRy66nyhGtsmSKU
	qgff9swnztzR8SZF8YgaM90J4M5JjJYFHCHCQx+JkwoVof8+RP8CBhArESekMkqStHEB
	edcw==
X-Received: by 10.68.129.5 with SMTP id ns5mr83837pbb.147.1393673358402;
	Sat, 01 Mar 2014 03:29:18 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id e3sm15473467pbc.17.2014.03.01.03.29.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Mar 2014 03:29:17 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Mar 2014 22:33:45 +1100
Message-Id: <1393673625-20996-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] image.bbclass: add BAD_RECOMMENDATIONS/NO_RECOMMENDATIONS rootfs vardeps
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
X-List-Received-Date: Sat, 01 Mar 2014 11:29:18 -0000

Changes to BAD_RECOMMENDATIONS or NO_RECOMMENDATIONS require the rootfs
for the image to be rebuilt.

[YOCTO #5898]

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 28b68f9..64f4359 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -70,6 +70,7 @@ LDCONFIGDEPEND_libc-uclibc = ""
 do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND}"
 do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_packagedata"
+do_rootfs[vardeps] += "BAD_RECOMMENDATIONS NO_RECOMMENDATIONS"
 
 do_build[depends] += "virtual/kernel:do_deploy"
 
-- 
1.9.0


