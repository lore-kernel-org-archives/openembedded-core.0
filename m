Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id CA1B47555F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 15:08:02 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id 31-v6so5513680plc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 08:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=M+2FFe+r+N/M2zAtabNyauT6QN5eD2rYnPGDYOGTYmk=;
	b=sxcMmqkDRlJS11CE9oWNWpap/ofU+kUGK8qwhpov/QnRU79VMpCSNC+fNy12MHv5c1
	qERKxhxC11MZSqfLhx954VBPMSuSU7DhyBFe1NbJeZ6uHepFX0eWWs9X2LIcyXkFfHd5
	IXZhr6Yaql4Wx3gzExQM0iYuPhZlCo6kKBTUqa7yaHhgqv5xrVcmhQZuh2ZgjNQxQyON
	mfWDw21ew6mEmzvT8J9O5UBCn5RLP0x1Y1vFt9a+Bw5j+IPRfyRDpV5YXsTDsV7iLVkD
	e5HNFdhSaNfScLMt8X90FdkKqz+XbseMDxjY0/cpAsh+/ljZJftmotJdAoDLq/mUzdoQ
	laVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M+2FFe+r+N/M2zAtabNyauT6QN5eD2rYnPGDYOGTYmk=;
	b=rfgTAp7L7xzYflJDAygQdiGplF1Mlg4phejgkQvypZdE2qZfzyYqSlhW6lAA/p45nM
	dvBYhHAEpdzV2GgWkPT3B28HfFcg6IOQofxxEdES+zXPPDT1VgZFEcnThAWH97gXqHSN
	pSUYL7rJaclcpJBxma3uA8WGcNmXTcYcyqiQ6ws3HjkyhubnnB6j7uYzBcLPbXFHJ1Hk
	j3Wa9HA7axAd06iP19Tp66pMkLU2SOxOsWM/fPtwXXAdbl12jZCeWdgPfMOzbRMLNAZm
	qh5GLnzhRW4Uqs04vbVg6mmS7tNQLyileYSK9gbTXeNkN/wMJNSvoiryJj+vdZj1qNSw
	Fc9A==
X-Gm-Message-State: APt69E0z0x4UuDf2g+Kp6FisFytW07D9RC1tWO6nbQ24eAURmpNTFwd4
	EFDYSBFRlgVDnDMr8vGxyaCqlQ==
X-Google-Smtp-Source: ADUXVKJPDVdmk5jACY044c1lTNX1gWYT5Clc15y7XmyTGTGept2lzK/uCNZukpYRAfbl+VosMS70Eg==
X-Received: by 2002:a17:902:bd8f:: with SMTP id
	q15-v6mr2511365pls.161.1529075283567; 
	Fri, 15 Jun 2018 08:08:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	y81-v6sm13295778pfd.178.2018.06.15.08.08.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jun 2018 08:08:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2018 08:08:02 -0700
Message-Id: <cover.1529075133.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/3] GCC fixes and enable llvmpipe in mesa for x86
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
X-List-Received-Date: Fri, 15 Jun 2018 15:08:02 -0000

Fixes gcc for xscale march/mcpu issue
Drop redundant patch
enable llvmpipe for mesa

The following changes since commit 8ab5b439ea82ac775494a0ce7a6f3615b61c94be:

  linux-yocto/4.14/4.15: fix gcc8 mips compilation issues (2018-06-11 23:38:17 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/master
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/master

Andre McCurdy (1):
  gcc8: drop stray uClibc specific patch

Khem Raj (2):
  mesa: Enable gallium-llvm on x86 and x86_64
  gcc-8: Fix spurious mcpu/march conflict for xscale

 meta/recipes-devtools/gcc/gcc-8.1.inc         |  2 +-
 .../gcc/gcc-8.1/0002-c99-snprintf.patch       | 28 ---------
 ...003-build-failures-with-with-cpu-xsc.patch | 61 +++++++++++++++++++
 meta/recipes-graphics/cairo/cairo.inc         |  3 +-
 meta/recipes-graphics/mesa/mesa.inc           |  3 +
 5 files changed, 67 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0002-c99-snprintf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch

-- 
2.17.1


