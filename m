Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id E09B96FF97
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 20:53:20 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id o62so316125342oif.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 12:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3zVZ83/GPQy+zVOmlABXM0Zi+QV8rQ2S1y+2o6V1F2g=;
	b=DlBBYAEV/JDFJdXXzf/iNQ6eiWSaOXTPNJxP4rUlYdFTpfcUJLsoo4ZTARyBuu7ka5
	+MzoRcv4u8lGIOCXotBe5VqyE/v6F2D0p51zTHNODwOkg+gyAPwb98I5b0ME5gLBoqaG
	xajEfVWXWO0bXebLPjvBZZYipXKBdx8Py9gyay/pE+KskpE02l0JoK0ShQeVLkogwtB7
	ep0z/9JmBpopYmwN7Uk/m7EenW5IE7U1Cr67gEolcRoglB4Yepu64Gsqi6sP2cBhR+2e
	hbRoE9xlw9qVcwlYRrg7Mu+huAqLoqWQJqP+MUvyLXBp44y4pZY3AFiZwW7fpTB5t4y4
	qABw==
X-Received: by 10.202.73.213 with SMTP id w204mr76995926oia.0.1452200001268;
	Thu, 07 Jan 2016 12:53:21 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	mm4sm42079156obb.1.2016.01.07.12.53.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 12:53:20 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 12:53:09 -0800
Message-Id: <1452199993-3885-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/4] duplicate armv7a over-rides for armv7ve
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
X-List-Received-Date: Thu, 07 Jan 2016 20:53:21 -0000

The _armv7a over-ride is no longer enabled for machines based on
tune-cortexa7.inc and tune-cortexa15.inc. These machines now enable
the _armv7ve over-ride instead.

Andre McCurdy (4):
  qemu.bbclass: duplicate armv7a over-ride for armv7ve
  gcc-configure-common.inc: duplicate armv7a over-ride for armv7ve
  libav.inc: duplicate armv7a over-rides for armv7ve
  libpostproc: duplicate armv7a over-rides for armv7ve

 meta/classes/qemu.bbclass                          | 1 +
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
 meta/recipes-multimedia/libav/libav.inc            | 2 ++
 meta/recipes-multimedia/libav/libpostproc_git.bb   | 2 ++
 4 files changed, 6 insertions(+)

-- 
1.9.1


