Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 23FA26AC85
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 06:22:35 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id n15so2557275lbi.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 23:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=31TadIXLFLikGUM+GZhcULliOj8ioGfWa4JjefU935s=;
	b=HvmMYymo8C5rQSpNQJc9GLmI17iAwGpXJ9ndaAci4XzL+ENvon48twCcuKbGC0jQsQ
	7vJmVJFo1N0ptcIOexRD6wZtx++odq1EyYm047aggbanvLn0GLxFwLfTGvPs9+OefIRM
	zL5no3zHikJDjJi1V9ckSf/53YFZ+kCJXTOSncRK0CGtewkBZ3IDOveF4gtbxVGS3+F9
	ifErlhuUaDnPYorT92l6Or61OvDaIJyK6Oxo+fED0SsXcFMbFv6eUWSCG5UYAxFyW+rZ
	CESLxDP1/d2zlVWhCfksffoMHjUBQ84SXGXkODxklsQJ3hKOS8urQMD7XEdCtBgAwkBg
	hh7Q==
X-Gm-Message-State: ALoCoQnLNDqtudLlt7Irn5orZ8wTa/kBX1TI3jdqUgg8RqBcIXsIhr+kIFfiUTxFr/+aThfXJsEU
X-Received: by 10.112.217.2 with SMTP id ou2mr506625lbc.101.1409120556016;
	Tue, 26 Aug 2014 23:22:36 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id n11sm9022106lbl.13.2014.08.26.23.22.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Aug 2014 23:22:35 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Aug 2014 09:22:24 +0300
Message-Id: <1409120544-32555-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] shadow: add Qualcomm and STMicroelectronics SoCs
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
X-List-Received-Date: Wed, 27 Aug 2014 06:22:36 -0000

Reported-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Reported-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-extended/shadow/files/securetty | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-extended/shadow/files/securetty b/meta/recipes-extended/shadow/files/securetty
index d919993..7fecda1 100644
--- a/meta/recipes-extended/shadow/files/securetty
+++ b/meta/recipes-extended/shadow/files/securetty
@@ -14,12 +14,27 @@ ttyAMA1
 ttyAMA2
 ttyAMA3
 
+# QCOM Socs
+ttyHSL0
+ttyHSL1
+ttyHSL2
+ttyHSL3
+ttyMSM0
+ttyMSM1
+ttyMSM2
+
 # Samsung ARM SoCs
 ttySAC0
 ttySAC1
 ttySAC2
 ttySAC3
 
+# STM SoCs
+ttyAS0
+ttyAS1
+ttyAS2
+ttyAS3
+
 # TI OMAP SoCs
 ttyO0
 ttyO1
-- 
2.1.0


