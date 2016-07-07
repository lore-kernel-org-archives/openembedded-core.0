Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1A96013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 18:14:34 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id dx3so2335335pab.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2016 11:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AL6CgsmcnUVMorv7JTejRhzbgD2vOPOGDCKi0Banffw=;
	b=EUqaCF5DmcRVQYeiMOiFt5H0IpYrATs7owv9EJOuFpoV8MZxVDgAi8yYSvj5HuXEH1
	lAbWkEtfI6/izxYKfKOy2rbrixaoVMWCBn/ZYWTG3v7QcylOVfaKg8UHzaxv6F9Lw+rg
	fxmkGaH5fzfYqp2KlSteHwaShFs/2Z+zMM0SSfR9uQQFzVGj3X30lbtJ9RPTH11zNdQ1
	YfaDEnJ+08ImkBnB+oU5oaDmy9NNi1NaMGQ4CTNXad5YX7NS8/12mCeUF0fmh5twvm9z
	3vnuWAcEviq/9E2RgPKTrHAIDvFaK/IUYMVmkeNpjJDjLwE+M7VmXhuBE5/UGExpUXsi
	I+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AL6CgsmcnUVMorv7JTejRhzbgD2vOPOGDCKi0Banffw=;
	b=PCV3GQBZ8to2s8sxMRxIX8B6sOACPocdFl237JVMUakM60ueG96U70zMQtnIns4QO4
	UJq+HZkCby6Vtl615FjgY0oNVRLVmezBrns7y5DHCQ5ts/0+Cj7i0n39HkQgZ2v9x7vY
	eu6jEWSq4l05i8V6Vf5QNRy8+kqP9rGCXssu2D6+TJxeMqdnYfnRADL6ng+QBUy/HY5K
	sHnFsRXjK6lt1z9TZmKPh0W0nkS4Y74X0GqGKzqN86grPsYxXA6ZOUhn9niU5eXoDsXe
	wuj7nYRP4XpQXsbU05bBpz18v/SFa7NbIf1VbN/xGYqvRxAH8ND860aYTBku0TVIQokI
	dwbQ==
X-Gm-Message-State: ALyK8tJ9mFwmNnsqQE51O0p8AvSOTchS416+AtShjqQytEAd9s0ncJuzchDuAFWuOmLbpg==
X-Received: by 10.66.52.11 with SMTP id p11mr2424339pao.155.1467914906370;
	Thu, 07 Jul 2016 11:08:26 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o12sm6003461pfg.10.2016.07.07.11.08.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jul 2016 11:08:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 11:08:19 -0700
Message-Id: <cover.1467914773.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH 0/4] musl/glibc/binutils updates
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
X-List-Received-Date: Thu, 07 Jul 2016 18:14:35 -0000

Fix gcc5 hang in SDK with -mmusl
Update musl to 1.1.15 release
Update binutils to 2.26.1
Update glibc to latest on 2.24 freeze tree

Khem Raj (4):
  gcc-5.4: Fix hang with mmusl option on cmdline
  glibc: Upgrade to latest tip of master
  musl: Update to v1.1.15 release
  bunutils: Upgrade to 2.26.1

 meta/classes/libc-package.bbclass                  |   4 +-
 .../glibc/cross-localedef-native_2.24.bb           |   2 +-
 meta/recipes-core/glibc/glibc_2.24.bb              |   2 +-
 meta/recipes-core/musl/musl_git.bb                 |   4 +-
 meta/recipes-devtools/binutils/binutils-2.26.inc   |   3 +-
 ...ISA-override-not-lifting-ABI-restrictions.patch | 273 ---------------------
 ...l-as-a-musl-libc-specifier-and-the-necess.patch |  72 +++---
 7 files changed, 43 insertions(+), 317 deletions(-)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/MIPS-GAS-Fix-an-ISA-override-not-lifting-ABI-restrictions.patch

-- 
2.9.0


