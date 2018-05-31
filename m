Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 52D1874769
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 23:10:48 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id e9-v6so11513255pfi.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 16:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nUd37O3D74AT0E1E3oZdffR8wkj56DxkCTWdcp1VPBw=;
	b=Ce54O7mACBoDrvutPxSB0e7DRzUU/Dh//sn2qo5+HRsVM0udeTzx7WnPNGjW3uE/yp
	TczjcYr2RrtzYYPLqmkE2cSRdA560m0xFLc2V2vA2jayokfB1Y/l1fAK8ZloF+3U+qXp
	K9wupcg0acazs6o9O9bDvVovYOdhL6RX7muNxKrxVL1AGhO/jh5fikm2FFOCvaezZOkL
	r1LMvyigis3Qbu2e9igdrWchwZUkyvXCRFmyEzD7b6eRFUzZB3ziCs4HX4HzfitV03k8
	B0FDzB8Blh8J9azUc+OeuWWP5ftsV/cbJOOgjBwZbqr98K9Cy1PJZ0Q/QhyN5r7fwjKL
	EfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nUd37O3D74AT0E1E3oZdffR8wkj56DxkCTWdcp1VPBw=;
	b=IhoBleTI4UQ1X8QIOqnBgtiDNWnMvYtlz6jEp3A0zU070ok55ynQgrVbXvwImZRJ+/
	LuU1JEAUp4t6nzi3nMpx4kS1p6t2UZpOx6spDwDYYKjVu/lJx22uY4AePCH8nraxfkWE
	DY1AU8K7909eyf59Wg6SwGLXLl8E5kEy3XYHZMJQCguvRRpZEYswJBW3KlMsrq3sViqc
	CNK3U6/BjjrFGl75EJqstIJ+mEhoDnmYBD1da6/5mmOkd8JC10s42K5uCZakhLrr+JiT
	KxfD8GHtcfAvceV6e4SPYKFJ8m5i5WMmviMSRzZjg6T9zbMq9XRaYckPRPrHIGEwinIn
	dvuw==
X-Gm-Message-State: ALKqPweREGY4LqG3Cr7n7K29jVbVRmY7/mX4JMb1XgBa2xHstjZPkPWG
	psC4bE27z5dMV5IL86G3ja+SPQ==
X-Google-Smtp-Source: ADUXVKKu+jVVtWWTRJjf7p/mmQppIM0YjGyaKGfn6LluRV8XTaaWJ0f9hxOUKksqaP+1scXkh6WZYA==
X-Received: by 2002:a63:85c8:: with SMTP id
	u191-v6mr6625421pgd.300.1527808249275; 
	Thu, 31 May 2018 16:10:49 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	x72-v6sm14147333pff.176.2018.05.31.16.10.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 May 2018 16:10:48 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2018 16:10:43 -0700
Message-Id: <1527808243-20215-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] tune-i586-nlp.inc: drop tuning file for Intel Quark/X1000 CPU
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
X-List-Received-Date: Thu, 31 May 2018 23:10:48 -0000

The Quark machine was EOL'ed at the end of 2017 and all support for
it has now been removed from meta-intel. Drop the associated tuning
file from oe-core.

  http://git.yoctoproject.org/cgit.cgi/meta-intel/commit/?id=5dbc69e339588834317b632119717996584b0d6c

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-i586-nlp.inc | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-i586-nlp.inc

diff --git a/meta/conf/machine/include/tune-i586-nlp.inc b/meta/conf/machine/include/tune-i586-nlp.inc
deleted file mode 100644
index 88e5903..0000000
--- a/meta/conf/machine/include/tune-i586-nlp.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-# Settings for the GCC(1) cpu-type "quark":
-#
-#
-#
-DEFAULTTUNE ?= "i586-nlp-32"
-
-# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
-require conf/machine/include/x86/arch-x86.inc
-
-# x86 with no lock prefix
-TUNEVALID[i586-nlp] = "IA32 with Lock Prefix omitted"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'i586-nlp', ' -march=i586 -Wa,-momit-lock-prefix=yes', '', d)}"
-
-# Quark tune feature
-AVAILTUNES = "i586-nlp-32"
-TUNE_FEATURES_tune-i586-nlp-32 = "${TUNE_FEATURES_tune-x86} i586-nlp"
-BASE_LIB_tune-i586-nlp-32 = "lib"
-TUNE_PKGARCH_tune-i586-nlp-32 = "i586-nlp-32"
-PACKAGE_EXTRA_ARCHS_tune-i586-nlp-32 = "i586-nlp-32"
-- 
1.9.1


