Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id E55AD65C8F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 05:07:05 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id i19so5464839pfd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 22:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S+nM5qC41hhjtZTPG3Veb6KW3v2uGTRxdVgVoP5GCYY=;
	b=P0MzOQ9J4iXItwEF3rkpncCnO10SNFTmllm4CKlr75dynHTnpifpuvCKlTWBBqvvLd
	36uj/Fmk4RT7lBIto6pLeSo87dlDrpUTxwCB5le+w7ZSA7/mTpr/YYVNaTZF5jpmic5M
	NBMkx5U60sX/9i8FUzP+xoFvGisIZLjDXrczak+SeZdLvV6WF3Wyk+PO8tvWsiMfwb69
	Kc9WJGrxkR8XS0oWjDG2/d27bLERZep/rUb4/NhJEve7TxrMS4oGv+X8tHNq3q7Ad9QR
	IqmanPT7TwlpzS+zkH9mrbftKKkV2sLkysW9YqR7WOOu4WAoqbfKBDddhX/ZjX4zh+zN
	iFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S+nM5qC41hhjtZTPG3Veb6KW3v2uGTRxdVgVoP5GCYY=;
	b=evM8Ih1eGDpAJk4m0d9dQc9sp3tZDvwoclPYEYSJyWW4+idcT/AHHnxtUGb2ilOm2u
	OHenykIvjLovgzQaqmDkKDQ4utZ1LZ/YlweV7xg7VlKYs5TtrXD6past2mug51yR+VED
	lFq/YkxBM5HswsveCTcHGZYAFUTM3q+VrX+6/EQI6Dr1v1pcnGdFMVj7DCdJNGHF9u2F
	E21fEy0cGBV/Y3PJPZ+zlSCMTxOIGvc4UGFVs0iwfr5LTitCR5K3ACwZ+rKD8eRyCFhP
	Kfd0FePTxnYGHLz7j9KZsMfNyjam9Bosl0670Xo4atylC7p69Y5p80fPXVkK5SqqBzcL
	Umiw==
X-Gm-Message-State: APjAAAUY/z9TeNy6nMgY9FxvDT1YRbH2feXfuBW28WSr8JsjC8uuwwVt
	eD1hDfrO0xiSeelxF5GXTqu4WgAk
X-Google-Smtp-Source: APXvYqyVCexxTD3mXFUchFl/yDv/WDi1oxTJmKMyo+ZmyULWF6CXtMd4L616fRvZCoRcgUxvcuk+9w==
X-Received: by 2002:a17:902:e5:: with SMTP id
	a92mr2134429pla.326.1552626426390; 
	Thu, 14 Mar 2019 22:07:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b8f7])
	by smtp.gmail.com with ESMTPSA id s6sm1082558pfe.37.2019.03.14.22.07.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Mar 2019 22:07:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2019 22:06:51 -0700
Message-Id: <20190315050651.22466-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH] arch-armv5-dsp.inc: Check for dsp only to enable 'e' in package arches
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
X-List-Received-Date: Fri, 15 Mar 2019 05:07:06 -0000
Content-Transfer-Encoding: 8bit

armv5 is not a specific tune feature anymore, there is no need to check
it, since having dsp will define if 'e' should be added or not

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/machine/include/arm/arch-armv5-dsp.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-armv5-dsp.inc b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
index 1f16085fcd..d117af1520 100644
--- a/meta/conf/machine/include/arm/arch-armv5-dsp.inc
+++ b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
@@ -1,4 +1,4 @@
-ARMPKGSFX_DSP = "${@bb.utils.contains('TUNE_FEATURES', [ 'armv5', 'dsp' ], 'e', '', d)}"
+ARMPKGSFX_DSP = "${@bb.utils.contains('TUNE_FEATURES', [ 'dsp' ], 'e', '', d)}"
 TUNEVALID[dsp] = "ARM DSP functionality"
 
 require conf/machine/include/arm/arch-armv5.inc
-- 
2.21.0


