Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 45B7077240
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:47:50 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id f144so22796253pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=DlQq0/6dmRywwFNOQC404nBRyRh+Y/PoUEp+XDgmsbw=;
	b=OHse9kelk72VREiL0nMHh3EYatTG7bFuLchHV5lDSTYlwBkkG7JA6+pQjKhUv72EVn
	Bl36ebWdrSLLTucCKRjjtOu3HSNv81e8Gp8iOkIphZkCsCrKMLYc0fZtl5bm+98+Qyc8
	c4fCd/j91oBupQ1rYsYzU5gQOmFmd8g+3yMSvkzXMVT73/D2PaymiJ/+09eP5+DtriwX
	8UylpzgmtwlliOtz5hP0Lw8Lc1QuZqDU++3N+Yzyhqpype+Fsrxq/rTeCQ6Tu0fxtjDf
	emQEriB4DEui1LVkTdRaWJKvNqVr9b6Qn3gW4QaM7UEXLT+zBtC1LDJBvI46H93ZC9Bf
	mJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=DlQq0/6dmRywwFNOQC404nBRyRh+Y/PoUEp+XDgmsbw=;
	b=RsUIFO+jIJZTmJCahbGVFnD9Au9DFHqtRZpgTh/0yd7aXzMNrgswjLmYncK+x0amMz
	9Lc9rAwAPNpBpTItTug0R+c/JaA/2aV9DLxSn3O+B8/Cp+MGC7pHkadm+6ezmZShUkyb
	FBifBFdScoyzVlhSoSOD+YkB5eIFagBDHhBDbEyVutOpjHaBELvH8pMW1tgohs5gPTP8
	FFAnyB0OMmiYmIbiFE2WFkg3rTRoHU8HyEzSNiy+ZVQopGxr0WBzE0FxzMqX9KC48K1b
	AzyrU/8ZGMSI0TflWTIfggtX2rAdKxNWAq7ulLsQHA7DtwqcBILpVeg0ZIRev91xe1SZ
	fKQQ==
X-Gm-Message-State: AIkVDXKmOmPp13LSCRAjAHzK/k+qdroJG8AetdKrPAGifqTxcW0iKBGLA2H6MPA216jXPQ==
X-Received: by 10.84.179.194 with SMTP id b60mr30088320plc.147.1485762470946; 
	Sun, 29 Jan 2017 23:47:50 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65])
	by smtp.gmail.com with ESMTPSA id 21sm29668145pfy.4.2017.01.29.23.47.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:47:50 -0800 (PST)
Date: Mon, 30 Jan 2017 17:47:45 +1000
Message-Id: <20170130074745.584-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 0/4] Enable libgcrypt nativesdk, add PACKAGECONFIG and allow binconfig
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
X-List-Received-Date: Mon, 30 Jan 2017 07:47:53 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This series enables nativesdk for libgcrypt and libgpg-error (one of its
dependencies), enables binconfig to be used when configuring to build
against libgcrypt and additionally adds a 'capabilities' PACKAGECONFIG
option.

Nathan Rossi (4):
  libgpg-error_1.25.bb: Enable nativesdk
  libgcrypt.inc: Enable nativesdk
  libgcrypt.inc: Add PACKAGECONFIG for 'capabilities'
  libgcrypt.inc: Enable use of binconfig

 meta/recipes-support/libgcrypt/libgcrypt.inc           | 11 +++++++----
 meta/recipes-support/libgpg-error/libgpg-error_1.25.bb |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.11.0

