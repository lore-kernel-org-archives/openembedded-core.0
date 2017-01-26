Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 62AEB606A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 13:26:52 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d140so50640966wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 05:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=g7BrBL7Y6djTTWord+UkqR+X27GofapuhspfCXTKLXg=;
	b=UAVkFnWoU/7niIX3n2u8qTitkk5lb5IeRhjLyVtdHjaN1RMCYxh6DxlGxEsUYko30j
	+U5tn0z3/Mq0qQSl/FJoIqAGrQb+N63d8HeU4Z3k0UKTxjJv9DBBp4PysETjAEaDlYiy
	+eO0Z/h1Glqe/9pHqQJURkl4+yANGM83iBC5a8S+x8ynbebgN3vRTv9Cmt64yiVo6s9w
	1ViR+poitZt+f9rxv5Y/jECifDsrzhaUZAVkbDCVB/DeA9JzkRdCct2MvqtiUgvrPE5E
	bDbRweQH7/BC2Ix3psIma3IiU6k0iuT6Fdgs80PfZsYesxU5J1rqeAicRpGSlTy/rS6C
	WYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g7BrBL7Y6djTTWord+UkqR+X27GofapuhspfCXTKLXg=;
	b=e6KVe+KDJLnVqbTpM25R8DYFz3ldNt0taC0Ozcw4+UQepjTchmMrctmdhSRfR7pts2
	pRzDDUhV6hxTVWEnOw3ONdClZrZSoJeq/n70OmxRgubl9oczHLZFhiwVkTf7AlinWdTb
	GUHOkfSl017jy3vvpELHWlgXGe6mE3x4ZCuefirL1U1OEWrTZcwpZ+ZOEGkMHxdm4Kev
	Dnd6Um+HBtL1B3bhnGGhLA+rfnasnS68sJtYSGPd1+8Itr9XI7NTUBNMus2134/GMEGM
	qcsfP/rJBoCLNHdO72epNaycGkP2JMfEg6Pp90UVO6VgVe1EOzc/PsAAC6R94oWeIJ82
	kCQg==
X-Gm-Message-State: AIkVDXJHBwg2ED7/UgiRHns6XvSZumeOmbCVgnTQ74hKdFJArT4EljJQviVvMMatyPbxxQ==
X-Received: by 10.28.65.132 with SMTP id o126mr2533235wma.14.1485437212530;
	Thu, 26 Jan 2017 05:26:52 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.150])
	by smtp.gmail.com with ESMTPSA id 40sm2602769wry.22.2017.01.26.05.26.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 05:26:51 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 14:26:43 +0100
Message-Id: <1485437204-9530-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH V2] meta: remove remaining True option to getVar calls
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
X-List-Received-Date: Thu, 26 Jan 2017 13:26:57 -0000

From: Ming Liu <liu.ming50@gmail.com>

This is the V2 set of this patch, please ignore the origninal one, I had
some charset issues on my computer, so the patch was messed up, sorry for
the disturbing.

Ming Liu (1):
  meta: remove remaining True option to getVar calls

 meta/classes/kernel-module-split.bbclass   | 4 ++--
 meta/classes/packagefeed-stability.bbclass | 2 +-
 meta/classes/populate_sdk_base.bbclass     | 2 +-
 meta/classes/rootfs-postcommands.bbclass   | 4 ++--
 meta/classes/testsdk.bbclass               | 4 ++--
 meta/lib/oeqa/core/utils/misc.py           | 2 +-
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb  | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

-- 
1.9.1


