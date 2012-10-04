Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TJlbs-0000Ua-7u
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 15:37:04 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so310231wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2012 06:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=BMxOPXCGKXBuf4Rp8TuYmQZdM/NfhlFcO9KsABnf9Ek=;
	b=XPJRvuEXfqozskQ4GrluwhLzqo+BoiXCcb3b7E/UqaQDHloU3gWaJn8/FpPJ8XpTGU
	Qc5Fi7zSDLbeih38mx8Li+w6CiAfBSzWWFN/1DyDNNBxv0Ad5x9xjEpxEbjXcc7oQz1p
	XqE8wDG89Y8XLMuH0kmDmTF9mk0A05+diADhgJpFF4rOR87hDygyAz6+pISu+E/+hH2F
	qHwGTkdRYffFyvxSKxaX05kNtXAmrtFZGJQRjbGS2ZOYHB0uxB2E80gs1W6oJfitPevM
	2Gj1fM6ptNjLIAzVoCSwBR92/ZEo7PSA8SwVWhdxXpc/IxbeIVtlW7Kcuts0nI3iphkZ
	h1qQ==
Received: by 10.216.212.225 with SMTP id y75mr3315550weo.39.1349357045616;
	Thu, 04 Oct 2012 06:24:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p4sm14651972wix.0.2012.10.04.06.24.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 06:24:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2012 15:23:37 +0200
Message-Id: <53f928714022bd495807ea6f138063fde85a11ac.1349356755.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1349356755.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<cover.1349356755.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1349356755.git.Martin.Jansa@gmail.com>
References: <cover.1349356755.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/7] tune-cortexr4: fix march value
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
X-List-Received-Date: Thu, 04 Oct 2012 13:37:04 -0000

* probably copy&paste error from tune-cortexm3.conf
  commit 789dcb8e68a2ab9784ac10ab36815010c61af2fc
  Author: Richard Purdie <richard.purdie@linuxfoundation.org>
  Date:   Mon Jul 25 19:03:24 2011 +0100

    Add ARM tune file overhaul based largely on work from Mark Hatle

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/tune-cortexr4.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-cortexr4.inc b/meta/conf/machine/include/tune-cortexr4.inc
index d1fc607..c8c2bfb 100644
--- a/meta/conf/machine/include/tune-cortexr4.inc
+++ b/meta/conf/machine/include/tune-cortexr4.inc
@@ -7,7 +7,7 @@ TUNEVALID[cortexr4] = "Enable Cortex-R4 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "cortexr4", "-mtune=cortex-r4", "", d)}"
 
 TUNEVALID[armv7r] = "Enable Cortex-R4 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7r", "-march=armv7-m", "", d)}"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7r", "-march=armv7-r", "", d)}"
 
 AVAILTUNES += "cortexr4"
 TUNE_FEATURES_tune-cortexr4 = "armv7r vfp cortexr4"
-- 
1.7.12



