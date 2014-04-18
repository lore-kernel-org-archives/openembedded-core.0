Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9CB65D52
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 20:13:19 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id uy5so2181409obc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 13:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mIv7CvuTue1m/PwH5jmfBBuyVc0dkH+BpA3+rtz9qkA=;
	b=LnKCS4Elo6wFe1/7WpbXazuQnUEP5shHTWfCQxIoDrBa8Ph8pmaGmwWKx2dk/J8tQa
	ot3+fDIVqr/RGlDGnRnJZIzsx0NtAzrMB2EAXJI8BCSOirsMI9gTx5ha8uZm4yYZTgU7
	e08Yu6SfJuZx4kac8HsoRwN3mR/srbacdbg4EidxsY2MOypi4U09HzgUEfAn/ALInOPm
	k8OguQhqHdLirhK+CE1XkAiRxC4EnIs0RMVE/KnqEtHateitkADh7Aji/BPUxBO/d37R
	DZmYuextgVVbuBRpgfrEbv/6nhPI6kI95OOxh1CntK+k5BwMX3M/6Sl5h59cF+2U/k1Y
	125Q==
X-Gm-Message-State: ALoCoQlzslf+6vwfTUEwhRrD2wqIlbn+CUC3lFKm1akao9UyQN4R0Y3IQ7f4+anlSuWKIk4JCGHg
X-Received: by 10.60.51.227 with SMTP id n3mr18667986oeo.33.1397852000760;
	Fri, 18 Apr 2014 13:13:20 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id l5sm54477420obh.15.2014.04.18.13.13.18
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 18 Apr 2014 13:13:20 -0700 (PDT)
From: gary.robertson@linaro.org
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Apr 2014 15:12:45 -0500
Message-Id: <1397851967-24110-1-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Cc: mike.holmes@linaro.org, clark.williams@gmail.com
Subject: [PATCH] rt-tests: bump version 0.87 => 0.89
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
X-List-Received-Date: Fri, 18 Apr 2014 20:13:22 -0000

From: "Gary S. Robertson" <gary.robertson@linaro.org>

cyclictest was updated to correct some problems with CPU affinity selection
and display of help and/or execution details.
These patches were accepted by the maintainer of the cyclictest utility.
The changes were reflected in an updated release of rt-tests - v0.89
The cyclictest changes were successfully tested on both an ARM v7 and x86_64
host environments.
The OE recipe was updated locally to incorporate the updated rt-tests release
and the resulting builds were verified for the same ARM v7 target
and for qemux86.
This patch set was then generated from the local commit for the recipe update
and is now submitted for your review and hopefully your approval.


Anders Roxell (1):
  rt-tests: bump version 0.87 => 0.89

 meta/recipes-rt/rt-tests/rt-tests.inc              |    7 ++-----
 .../{rt-tests_0.87.bb => rt-tests_0.89.bb}         |    0
 2 files changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.87.bb => rt-tests_0.89.bb} (100%)

-- 
1.7.9.5


