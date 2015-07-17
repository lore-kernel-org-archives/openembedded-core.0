Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9784E75F1F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 17:15:19 +0000 (UTC)
Received: by pacan13 with SMTP id an13so64196699pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 10:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uhm+53OVNIQi1WU4Q7kbnJzkTrXVPjf52VLCSnnoQhU=;
	b=h6i8AV9Hmpk3e7ZhAS1bkgIOtPAoSbmbbzHjn2girz64AQ405OESk3ge+YZtepCvHP
	4smXvOaYK6twWtN/NXBQq31yjfOZPwFCFn1GkW9MUHDrK/gXJvfHoJKrlustrwYK/Uwt
	8urnjYrjBybwcu7b/adFVunA+/LegVWkYe0eiMaun/DxTu/f0kMjCyKHjwAOJ5pbGPE3
	62a0ONbQMpiGJrzR3gfPKVDgL4faY2eHWe0Fz2RtEFF4OCm80teZ0mP9lb5LsILVphpa
	w8UMoxJrQ5KSiDf8xkzlNzF968IAPuMS8rtSnJrGHOUbfSY2a/3InRY1yTIWCw9LmaJO
	ze6w==
X-Received: by 10.69.10.196 with SMTP id ec4mr31845693pbd.69.1437153319533;
	Fri, 17 Jul 2015 10:15:19 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	j4sm11812657pdo.62.2015.07.17.10.15.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jul 2015 10:15:17 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2015 10:15:50 -0700
Message-Id: <cover.1437153291.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/3] A few misc fixes for `recipetool appendsrcfile`
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
X-List-Received-Date: Fri, 17 Jul 2015 17:15:19 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit ff384c084678dab33bbd7eb82ece21a2baa13dfb:

  qemu: upgrade to 2.4.0-rc0 (2015-07-16 20:40:00 +0100)

are available in the git repository at:

  git@github.com:kergoth/openembedded-core recipetool-appendsrcfile-fixes

for you to fetch changes up to 927dba1917b9fa5e2d526b0994d959fc8465800c:

  recipetool: appendsrcfile: handle S == STAGING_KERNEL_DIR (2015-07-17 10:12:10 -0700)

----------------------------------------------------------------
Christopher Larson (3):
      recipetool: appendsrcfile: fix duplicate SRC_URI check
      recipetool: appendsrcfile: use -D, not -d for destdir
      recipetool: appendsrcfile: handle S == STAGING_KERNEL_DIR

 scripts/lib/recipetool/append.py | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

-- 
2.2.1


