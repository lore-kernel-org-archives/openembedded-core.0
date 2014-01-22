Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9CBA3615AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:36:13 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id r15so3333189ead.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 16:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=TBT+rz+h4Rg5qsvI1N3XuUhnZAiNryXIPAIamNc7K0M=;
	b=bMxaJPwEktzMvQEtgA8UiV6cLV4xc2WUp1f3yqu1zgnoqoQVzqBSZtanxDoLtunhrU
	CkgmOLEtoTjH6ALeE/+WmXmDGji7zzFuBqJaPctdtoywriR/Nz9ESJdpeSGPE/OgG4qI
	9CPwUbPwYm/y1v+qeEhjpFixidQ7qNuK5EY6dJGDlNBvSTV8vuJE5IJwsvRAeH4RJshJ
	RMlQ43i2ZdklM5Vttrg+vXRjY21IDfqM2DQH2B25GtM+y3AR1mSrjJKvHrquhqPyMIfN
	OHiXzjpwU1tMjmzLvz8AWTcxZ3AlyxamOhpmSpUlsgGCWBTfIwj9ZL3qlFaBV2Cru1rD
	97IA==
X-Received: by 10.15.91.3 with SMTP id r3mr27004214eez.18.1390350974176;
	Tue, 21 Jan 2014 16:36:14 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id n7sm20616612eef.5.2014.01.21.16.36.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 16:36:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 01:36:05 +0100
Message-Id: <cover.1390350823.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH][RFC][WIP 0/6] thumb tune feature improvements
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
X-List-Received-Date: Wed, 22 Jan 2014 00:36:14 -0000

Only first patch was properly tested, the rest is just something I've
noticed when looking at feature-arm-thumb.inc and there was similar
request from Andrei last week

http://lists.openembedded.org/pipermail/openembedded-core/2014-January/088207.html

The following changes since commit 4659d29b1040349116549644e45035a5b37d9311:

  sstate.bbclass: remove previous version's stamp (2014-01-21 10:36:23 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/tune
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/tune

Andrei Gherzan (1):
  tune-cortexm3.inc: Cortex-M3 doesn't support ARM instructions

Martin Jansa (5):
  feature-arm-thumb.inc: Fix missing t2 suffix for armv7a MACHINEs
  feature-arm-thumb.inc: Replace inner quotes with apostrophes
  feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding thumb
    suffix
  feature-arm-thumb.inc, arch-armv4.inc: Add "arm" to TUNE_FEATURES
  tune-cortexr4.inc: Add thumb and arm to TUNE_FEATURES

 meta/conf/machine/include/arm/arch-armv4.inc       |  2 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc | 30 ++++++++++++++--------
 meta/conf/machine/include/tune-cortexm3.inc        |  2 +-
 meta/conf/machine/include/tune-cortexr4.inc        |  2 +-
 4 files changed, 23 insertions(+), 13 deletions(-)

-- 
1.8.5.3


