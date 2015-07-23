Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 894D67623A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 20:07:26 +0000 (UTC)
Received: by pdbnt7 with SMTP id nt7so1367508pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 13:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TSN1Ja2y9NOt4sh+Wod+s9AFthFou6VFuqgJsZHekDQ=;
	b=RfwgGkSfQtY8mTLtWqYUsfmI/uFmeDcWT1azpDOF0h+N4H9RbZGhTTHHqbO+sHAZek
	t4TBqZkW9w5ioh4Otu95g0pWNTlN2dAyoCMOSj0cY32e7TwRS/T2CLHiaLocrhpGjtMM
	+H5nIrfXj3CEcdnXgGX1e/pqZmtaRCeqSPMlNhUwy5X1aj0D2V5yUYIp/c8D+t8WSLYK
	tt6LGMb+oALvFva6vGPUkafO5TTNI3Lqu+nUM/oQ4PdDsnw4/fH9m2BqvSMcj4x0UPY+
	hfoxJgoMWPeUjXybdLwzbGJmyhjxszWTe7lgyIoJfKZJv6kC0i8xZICtFrXpMNl+GcoI
	shjw==
X-Received: by 10.66.197.234 with SMTP id ix10mr17662070pac.152.1437682047153; 
	Thu, 23 Jul 2015 13:07:27 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	pe3sm10473781pdb.55.2015.07.23.13.07.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 13:07:26 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 13:08:22 -0700
Message-Id: <cover.1437681596.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/3] oeqa/recipetool: add tests for appendsrcfile(s)
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
X-List-Received-Date: Thu, 23 Jul 2015 20:07:27 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit 3143920c541b55b543b9dcc12b18af4e0e4b7ae1:

  linux-libc-headers: update to 4.1 (2015-07-23 08:47:52 +0100)

are available in the git repository at:

  git@github.com:kergoth/openembedded-core recipetool-tests

for you to fetch changes up to 97dcd3c3e44840196962b2f5a909c5a7f016b99b:

  oeqa/recipetool: allow templayerdir override (2015-07-23 08:19:15 -0700)

----------------------------------------------------------------
Christopher Larson (3):
      oeqa/recipetool: refactor / split out RecipetoolBase
      oeqa/recipetool: add tests for appendsrcfile(s)
      oeqa/recipetool: allow templayerdir override

 meta/lib/oeqa/selftest/recipetool.py | 221 ++++++++++++++++++++++++++++++-----
 1 file changed, 195 insertions(+), 26 deletions(-)

-- 
2.2.1


