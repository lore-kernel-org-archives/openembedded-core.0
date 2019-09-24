Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB806D52B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 22:00:59 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id u8so8316908iom.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 15:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QBDA1SXmGiJ8E3a8q4ztmSOcwPimKFB1jM5WxOrUYug=;
	b=P8vY66zZjSGfNutDYAeBBDIP+umKilrD4oaAavC+2p5yKphfr2XefslFYZkAd1n71O
	L7UhDidueNllZ6tB2Zob/Ecw5j32vLUoQtmn6RabvU4wVGdKOYyoO+sClRsZ6EPL09DH
	Gwjt4xP/u2GCLp30fVHBfvI0vMiQiclHp0TLHtk2x/ty7Id2y/r38F9bpt+6qHgbzSK7
	QmrdVH47rVrZWNk9qh9fbxol6aZq2JouY4JaYKZ74yj+I2Fkwke+mVPu6dXdRzWliL0C
	kEGOKgjXgrMzDhrWZ3/PY2Rq5P/L1uXxyaBlEJ0r8/EMsWn1dk1ItC83Fwpt/TxuWLZ4
	APAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QBDA1SXmGiJ8E3a8q4ztmSOcwPimKFB1jM5WxOrUYug=;
	b=TugfKknFaAjuyo+Ip9yChZjMxXNrm3cXcY2wXC8QcWN54zPXO6JOErVKNaD4q2qRnW
	x484ySz5a0ntwuvV+RxTIf9NjZ2MayAUVcaIQzplHx6QtlAsKfqN3DzA7+pddMKtgg6U
	TzmTSImWYSkZmV8uMbvIlZsQttH5jS8Fyvv2OI1faGyDSOf16DL8c8jhBO/hY6uMUbey
	r79apciyExeJ3Q366sBpKIRKaVJ1IM8RdRNZ5kmMaF3+8No1F25gxDrEtiY7eVeNLJew
	UrxSk7UbirY/HJ6m9Yd/S9LvR09R9wfQo7UNZ557ArY5Xhd5dqPZmj7AC7hNSpgGmQle
	i61g==
X-Gm-Message-State: APjAAAVSO5tZU/vGTkEp0fwO9kogzCvW4rSkp+z2htKFfdVpXqipPclN
	++W/peNuev+oDuWxqJV/i5GGYOQGmO4bdg==
X-Google-Smtp-Source: APXvYqwYO52IPtuS425akp4Z8NeuMJCoKKgjpp0Hp3tjOSNGRcW2cZ8tsOu9WpUzuWs0tfHA6bJRrg==
X-Received: by 2002:a6b:6101:: with SMTP id v1mr5756893iob.153.1569362460173; 
	Tue, 24 Sep 2019 15:01:00 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	x12sm3040895ioh.76.2019.09.24.15.00.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 15:00:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue, 24 Sep 2019 18:00:53 -0400
Message-Id: <cover.1569362299.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: -stable updates
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
X-List-Received-Date: Tue, 24 Sep 2019 22:00:59 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the latest round of -stable updates. I haven't found any issues
with my build and boot tests with these .. but as you know, we sometimes
do find corner cases.

I've left all my 5.2 -stable bumps as separate commits, since they
represent a set of SRCREVs that I've tested, and that should be preserved
in the history in case we have issues.

Cheers,

Bruce

The following changes since commit 81f9e815d36848761a9dfa94b00ad998bb39a4a6:

  build-appliance-image: Update to master head revision (2019-09-19 20:32:53 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/5.2: update to v5.2.13
  linux-yocto/4.19: update to v4.19.72
  linux-yocto/5.2: update to v5.2.14
  linux-yocto/5.2: update to v5.2.16

 .../linux/linux-yocto-rt_4.19.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_4.19.bb            |  8 +++----
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
 6 files changed, 35 insertions(+), 35 deletions(-)

-- 
2.19.1


