Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id CDB0C60766
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 21:41:20 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id u19so13079144pfa.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 13:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tg3/Unlz7HD1cN7qzzgFKgu7O3mGJLx4k7nZT6Y/M8s=;
	b=ckJVzDj3i5JPqbClwmHaOkRuJQXBkzZNBvuEvtptyZ+VXWbRGEMjQ3S/Yv1gimpWcD
	HEakRQptMVExGU1sGwa4fXb26vBn1FDmeCd5premUUH3xU7IkgHiSvA4sujMYlsOMygd
	9P6FoKNbQdbbYZaAeYnbstOY522EB5Rh1CZmh3pxdBeHMgj1UZsXMCBrBWTLTrvKHK+L
	KPHqqPCiBLsF3AHx99QYSCA3HAlV5MNrsWjlVoWPQ+8NZOiB2yqukIxw6kESoPOw3+Db
	Hn32z8x2MzxJs47JjBMsg8WE724fOROb0/62pwNMeT6m55swlLIGSze3a/bazCWawRjP
	ifkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tg3/Unlz7HD1cN7qzzgFKgu7O3mGJLx4k7nZT6Y/M8s=;
	b=JRC8uKSSutGT+eqT44pmlDPix5Ab1Lub4aTXqTwuqHYJfvVw5UhFsWsd4ttgJ0SOOI
	TrD7VWoIqi7HKpffuRkzfhZCe0mDQAn/P9heQbRwBMDJVqxIOXjvDb0TIMIRhC8CMUFK
	C3+y8xfGbvsOgDjBH+KL5zA9xvv0NEZdrUSV14XBn+bdhb4XIpjgJfHM62L44dLZ58Zb
	OKRW5HDR/AMv53/OaQSEqCgtSl8gHjzFYmvWRgYQ71fjs96CFtonLCjIexmJwH8WArds
	t2q509aHyFPofwMNppgV4YuNc9TozPRCxPYQTBv6GzkO/azvQfKFSmL5b6L7+7OYeYFI
	8Zng==
X-Gm-Message-State: AKGB3mIboPw/mWQaOTJfr0FBzNbcYoHqpb+zwTGe/nMy1i2Jk4nyL2OK
	4v7worPj8B4xXDDQw9M3M9XrkQ==
X-Google-Smtp-Source: ACJfBouOw3v3kE+6cEBoaZWQjiUJ3pdSF8x87OYQ6+vUMg7M7+XQhSeQW8YehS90ow/1XId56f+zMg==
X-Received: by 10.101.90.199 with SMTP id d7mr7391319pgt.265.1513806081468;
	Wed, 20 Dec 2017 13:41:21 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	i186sm33789296pfg.178.2017.12.20.13.41.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Dec 2017 13:41:20 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Dec 2017 13:41:12 -0800
Message-Id: <1513806072-324-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] systemd: drop obsolete workaround for ARM + gcc 5.2
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
X-List-Received-Date: Wed, 20 Dec 2017 21:41:21 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/systemd/systemd_234.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 778b868..9a10a31 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -183,9 +183,6 @@ EXTRA_OECONF = " \
 # per the systemd README, define VALGRIND=1 to run under valgrind
 CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG', 'valgrind', ' -DVALGRIND=1', '', d)}"
 
-# disable problematic GCC 5.2 optimizations [YOCTO #8291]
-FULL_OPTIMIZATION_append_arm = " -fno-schedule-insns -fno-schedule-insns2"
-
 COMPILER_NM ?= "${HOST_PREFIX}gcc-nm"
 COMPILER_AR ?= "${HOST_PREFIX}gcc-ar"
 COMPILER_RANLIB ?= "${HOST_PREFIX}gcc-ranlib"
-- 
1.9.1


