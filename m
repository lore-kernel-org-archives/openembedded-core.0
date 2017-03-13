Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9AF4D77718
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 10:01:51 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id j90so61389373lfk.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=BkgJESu5YXG7z/sk/tBfcJf45/Z8C0CeVH9QvOy8bAU=;
	b=lZhhkuJK5fWUrL23YoCv49Qsp4EULchiZJThzRmmcp5MjJqA2cSLwkkXCHnSKGlJsh
	1I8OOk7sDaNJfwi1uBLSazSKjiR9ynF/IlZO7uh0NssZVtLXIqP3u6oPYSPsIrG2V0fk
	y1VEFiownWY6mXMSvA0zEJpuXl42GcGEjdwzq0ZmNMrwkOr6pjbDjnn7Hk+TAEKGbkFP
	oie/wZRp1MAzcKJ7ByUn2pNYU8RbWLNJM5mqVkJqWGOx7rMMpEoFycEJHktn7hjCfNBG
	7DFH9mlGhhdJeBNcOJy5jbktjGPd2MgIqxb4647pG6HGwHi/ULCYdawnLmU94Vus3xZ2
	NJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BkgJESu5YXG7z/sk/tBfcJf45/Z8C0CeVH9QvOy8bAU=;
	b=I0iwQTwANxqqENSHOZKytuJoSujmQyA5Xd0AP3apdBhaPNAJ43M1Ei4W+5D3sYYW8T
	WakN4xtyPm60FMH+YXHrrboZvCieS2XaFL6cAecP7fKBjYBfGFgV2RCCh7yngTJrdcN9
	HZMnC8PbeIt/6So9kwPTD/GLrxyQHL/yYapPlRuojeCliMEizuzA8B1cVRtdmCWXo1C6
	YhxPl4Sf26E9by6DcxYRgo6XoNVcfzthHHHjFGHny7kGYldoDxV4c0xOlSv84tBpnOjw
	GB2P2EjF0hgYFE7vgtsxSCdKvKk7QFF6guIyo8FJvz7DfByLD9UlfvTrLlNE4WE+hTrL
	43rA==
X-Gm-Message-State: AMke39nn3uhyFO+/ahmEUP7l3Jb8xlit83d21TtAD/HP6sUKU6Cv/8B/0NyRAsLRb/HcSA==
X-Received: by 10.46.72.1 with SMTP id v1mr9475754lja.48.1489399312166;
	Mon, 13 Mar 2017 03:01:52 -0700 (PDT)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id 4sm3528801ljf.33.2017.03.13.03.01.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Mar 2017 03:01:51 -0700 (PDT)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 11:01:45 +0100
Message-Id: <cover.1489399045.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v2 0/2] devtool/recipetool: allow installation of devDependencies
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
X-List-Received-Date: Mon, 13 Mar 2017 10:01:52 -0000

This allows the conditional addition of devDependencies to DEPENDS, as well asi
installation to the recipes WORKDIR.

changes from v1:

* A number of patches was merged.

* Make the addition of devDependencies from package.json optional in create_npm.py
from recipetool.

The following changes since commit a47e64d985a610535449730806651f5bfd75d9ec:

  libcomps: add a recipe (2017-03-11 16:08:50 +0000)

are available in the git repository at:

  git://github.com/darander/openembedded-core npm
  https://github.com/darander/openembedded-core/tree/npm

Anders Darander (2):
  devtool/recipetill: npm install of devDependencies
  classes/npm: allow installation of devDependencies

 meta/classes/npm.bbclass             | 13 +++++++++++--
 scripts/lib/devtool/standard.py      |  3 +++
 scripts/lib/recipetool/create.py     |  6 ++++++
 scripts/lib/recipetool/create_npm.py | 23 ++++++++++++++++++-----
 4 files changed, 38 insertions(+), 7 deletions(-)

-- 
2.10.2


