Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 74F1376FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 16:54:31 +0000 (UTC)
Received: by qkcj187 with SMTP id j187so23878180qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 09:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HM31zhAVcf0Us0NZFdDFSjThd3/kPXqBAIBhRZFjt7k=;
	b=FWizAS5ZJ6oWXP6f3jHa3mFPmlttmih524PasTKFKKG3A02nBIeWcjOGNK/T0j1bIS
	qAT3ow9CSvWp60hGCD26RAwfCgXzVHScKLXaRBMUB9CBYYMB6JBRJd9VOLYIgwBL07Dd
	Nt+3K+7ZKFLPjHI2Gbd2gyHDo/arYK+J1Rgjj8n6oUo5GG69xc/VT+vPt75AhJyNSK0a
	AeRwjZn2mHgcWAxb31f8Pbr1n+EgFfyc6OC9qMun2yvlsVq1T/qYIlf96RX2ReafyZqV
	EORwy2yUiD6hHbxPZiZWTJK+1kYpX4xd9FSP1ffubCtHJRH1z8NX6Jb6fcpfvAAEd00M
	136w==
X-Received: by 10.55.33.74 with SMTP id h71mr40008146qkh.71.1441299271973;
	Thu, 03 Sep 2015 09:54:31 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	a73sm15203897qkj.27.2015.09.03.09.54.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Sep 2015 09:54:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 16:54:27 +0000
Message-Id: <cover.1441299182.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH 0/1] Busybox fix for utmpx
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
X-List-Received-Date: Thu, 03 Sep 2015 16:54:32 -0000

Patch busybox to use utmpx if libc offers it

The following changes since commit bdeb32b4cdbe316f17c2fd854d59e05e8f2e8ffc:

  rt-tests: drop unnecessary added-missing-dependencies.patch (2015-09-01 11:43:38 +0100)

are available in the git repository at:

  git://github.com/kraj/openembedded-core kraj/busybox_utmpx
  https://github.com/kraj/openembedded-core/tree/kraj/busybox_utmpx

Khem Raj (1):
  busybox: Use UTMPX instead of legacy UTMP

 .../busybox/0001-Switch-to-POSIX-utmpx-API.patch   | 388 +++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.23.2.bb        |   1 +
 2 files changed, 389 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch

-- 
2.5.1


