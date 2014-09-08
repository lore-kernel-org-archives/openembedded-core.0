Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8B314713C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:23 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id u56so1329850wes.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Sp4YR/nnLR1cOGW7NlIUd6uLomaXoNMeHbQbKSAphmQ=;
	b=RecxWFf7JlwCbmX60+fHK0051fbzJ5AJp3PYHoe8dmPBpTncVCr0dfp+rMPjx6MTIl
	EhmzKGrP9XvdqM4ESWVmr9ojpZlNqdpFkwPBBeqhyy5r461foi2kBovwqNqkbH3A9dFB
	jRScn61YxSrPeIAt9eaYbPX1gnL5gz4W/GH/efCFc4TzS1qCtqZZiIEM5LMpG0n2kLw/
	quqrWK38fAU6l8IlinU6Fo9dWg3aK3GmleuxbxjnhQbzI2c1pBTNS7/fSCh9NRisV11g
	ehGXKuQiZMvg/0ujnhOGBxwSyxFtoOzXRPoHtVp4gU6NlRqahrd845Mfh/8d0Y//tEIL
	Bb4w==
X-Gm-Message-State: ALoCoQnrNDRGpy+f6uQAKG6a2zJ4ID6Szzoo+B9n6LKeIybrmBvtGfXnT98c+4rWGZAbafdU1nq+
X-Received: by 10.194.243.230 with SMTP id xb6mr3872379wjc.100.1410177564255; 
	Mon, 08 Sep 2014 04:59:24 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:43 +0100
Message-Id: <8ee78e047f024388f05035a3cb06c7adbed00ce8.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 25/27] shadow: add Qualcomm and STMicroelectronics SoCs
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:23 -0000

From: Fathi Boudra <fathi.boudra@linaro.org>

Reported-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Reported-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/shadow/files/securetty |   15 +++++++++++++++
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
1.7.10.4


