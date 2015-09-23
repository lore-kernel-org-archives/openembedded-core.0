Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id C68747404E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 18:21:39 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so218014480wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 11:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FohB5bv9eREk7IioLZrV4Ut6yZovLOdeXUNc0kUGAgU=;
	b=KQcd04o6Dt1FUuWQcbl/cU/mLxNQdnJ3appvk7IZoO4r4NaNJxoZS3qRVu3rCcREuI
	hGpsI9Tte/cgtYQ82jTHOUWdgFxmbvEL9+58pXfi/i3GQtTe4T76sBGfkaO68OHr2tIE
	gy4nthmtoVufAzPay7zbr5w3+UGm/q3k4OlusUWGb2mY4ATwdiWOIYLA77wwvrTk4z8D
	cNPowSA/rRl7Zyyc3Apk34W+TqubkNaUHpYyulxIv6SunoO8Mnc7qvG7WJ2dO+WJDBU/
	nqtsqkeaxHe/moWwNp3VkHF1MmCoz3usfW2MpQstWoGT+yoYCeGj/slSX3zQBHi0ZpDt
	n1IA==
X-Received: by 10.194.236.74 with SMTP id us10mr24547871wjc.39.1443032499364; 
	Wed, 23 Sep 2015 11:21:39 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id fz1sm9792584wic.8.2015.09.23.11.21.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 11:21:37 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Sep 2015 11:24:08 -0700
Message-Id: <cover.1443032533.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/3] recipetool/devtool: send errors to stderr
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
X-List-Received-Date: Wed, 23 Sep 2015 18:21:43 -0000

From: Christopher Larson <chris_larson@mentor.com>

This aligns with the behavior of bitbake proper. There is a bit of code
duplication between knotty and scriptutils, but that's not new -- that was the
case before as well. We should consider moving these logger configuration
functions into bb.msg.

The following changes since commit 2ad7308ee7166641eff99f3b9fe6794de143f6bc:

  oeqa/utils/qemurunner.py: Remove duplicate message on LoggingThread start (2015-09-22 18:13:02 +0100)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core scriptutils-log-improvements
  https://github.com/kergoth/openembedded-core/tree/scriptutils-log-improvements

Christopher Larson (3):
  oe.scriptutils: enable color in a more flexible way
  oe.scriptutils: add logger_setup_filters
  recipetool, devtool: set up the logging filters

 scripts/devtool            |  1 +
 scripts/lib/scriptutils.py | 29 +++++++++++++++++++++++------
 scripts/recipetool         |  1 +
 3 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.2.1


