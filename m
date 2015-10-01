Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id A0D7174242
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 16:38:38 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so80855564pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 09:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GNfLVHMl3cIQhE2mCjMJnvSwYFohwg7WrSKd86V9WYM=;
	b=0xcWhl7RxKa/xG84x4wYJbM3QFgUQlT9HDfPNwk43d53RdJOzm7x0jDeUb+VEHHwLR
	+NFAV4clwFiE4to0VoLu5JVq5YKF0yRP9xGRt6DzDfVr6mrbjPlIqnhOfMqEFRKaxNhw
	3z6WlqE5ThOUMBU8beE7FMrRLV+Q+LqLtjCrGxwrVCTF4SyTEdz/Fou20cu5L+0KTK/O
	4x5WZ/GVELZ1/xZfgyhMSgi7cw9BVOfYm1WEUCsU5erqXFXxTshzTOmn3/Ld2NIdon0w
	kHig6wMzimLXUcF0/XmyTBOuKJaP9LbiMRD6zUaciGpgnU5MROFkDgAahGacGgiHKKgJ
	P9Lw==
X-Received: by 10.68.109.2 with SMTP id ho2mr13482803pbb.158.1443717518325;
	Thu, 01 Oct 2015 09:38:38 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	kh7sm7563956pbc.93.2015.10.01.09.38.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Oct 2015 09:38:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Oct 2015 09:38:34 -0700
Message-Id: <1443717514-31684-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH] ThunderX: Add initial tune file
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
X-List-Received-Date: Thu, 01 Oct 2015 16:38:45 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/conf/machine/include/tune-thunderX.inc | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-thunderX.inc

diff --git a/meta/conf/machine/include/tune-thunderX.inc b/meta/conf/machine/include/tune-thunderX.inc
new file mode 100644
index 0000000..89fcaf7
--- /dev/null
+++ b/meta/conf/machine/include/tune-thunderX.inc
@@ -0,0 +1,19 @@
+require conf/machine/include/arm/arch-armv8.inc
+
+DEFAULTTUNE ?= "thunderX"
+AVAILTUNES += "thunderX thunderX_be"
+
+TUNEVALID[thunderX] = "Enable instructions for Cavium ThunderX"
+
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "thunderX", " -mcpu=thunderx ", "",d)}"
+
+ARMPKGARCH_tune-thunderX ?= "thunderX"
+ARMPKGARCH_tune-thunderX_be ?= "thunderX_be"
+
+TUNE_FEATURES_tune-thunderX ?= "${TUNE_FEATURES_tune-aarch64} thunderX"
+TUNE_FEATURES_tune-thunderX_be ?= "${TUNE_FEATURES_tune-thunderX} bigendian"
+BASE_LIB_tune-thunderX = "lib64"
+BASE_LIB_tune-thunderX_be = "lib64"
+
+PACKAGE_EXTRA_ARCHS_tune-thunderX = "aarch64 thunderX"
+PACKAGE_EXTRA_ARCHS_tune-thunderX_be = "aarch64_be thunderX_be"
-- 
2.3.5


