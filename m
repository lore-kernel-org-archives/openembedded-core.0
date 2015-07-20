Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id EC52F65CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 22:14:57 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so62357016pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 15:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YwyknFaMYQpteOWehS/s+l7jYgMdz+t0pkclIDiWaUw=;
	b=tvomLSLmpLI1CJovXxrTxnhBiVSQ8I/QYy3jg2jIo/u/OFugcKFsJyqRW/5v5Qnrwe
	VTBb21V51fBr8UU7ELY7JFXqSslUhugfC0NlpesrcWUDUKb9AWvzGJZUVbt56pB1fQXd
	afUy9xhc+hHNBtsm5TIkxB+i1Gm36ZirQ8aCmZAgxWbYUQz37mcbJPZy+FSQ7YoLjk3K
	L/4WMjseGsODe5wn6oKzIMktJqylzQUIzvKRmZJX2CJo1PSKmgckG/AKJiJXkEgP+NVA
	thfOI14JZyPNqPhGhNwxAoke+yh6voYfNPLGVr6UV+NksJGLuI7Zz88VUUDLEr0BkCpj
	/rdA==
X-Received: by 10.66.65.229 with SMTP id a5mr66037195pat.11.1437430497565;
	Mon, 20 Jul 2015 15:14:57 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	j3sm23582838pdf.76.2015.07.20.15.14.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jul 2015 15:14:56 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jul 2015 15:15:38 -0700
Message-Id: <cover.1437430369.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 0/6] recipetool/devtool/oe-selftest: pull from BBPATH
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
X-List-Received-Date: Mon, 20 Jul 2015 22:14:58 -0000

From: Christopher Larson <chris_larson@mentor.com>

Ensures that recipetool and devtool pull plugins from layers, and
oe-selftest will pull tests from layers.

Unrelated to that, also prevents a traceback on parsing failure, and adds
a tiny feature to appendsrc to facilitate reuse by other sub-commands.

[v2 Update] `devtool: also load plugins from BBPATH` was fixed, so it no longer
breaks the devtool selftests.


The following changes since commit b283b82ec59a2137cf717811172765848fa813fa:

  core-image-lsb-sdk: use kernel-devsrc to ensure kernel module builds work (2015-07-20 10:39:02 +0100)

are available in the git repository at:

  git@github.com:kergoth/openembedded-core yocto-bug-7625

for you to fetch changes up to 35a9ce57747248192dc5c0dd7916e15e58a5835e:

  oe-selftest: add libdirs from BBPATH to sys.path (2015-07-20 15:11:59 -0700)

----------------------------------------------------------------
Christopher Larson (6):
      recipetool: catch BBHandledException from parsing
      recipetool.append: add extralines arg to appendsrc
      recipetool: also load plugins from BBPATH
      devtool: also load plugins from BBPATH
      oe-selftest: obey oeqa.selftest.__path__
      oe-selftest: add libdirs from BBPATH to sys.path

 scripts/devtool                  | 57 +++++++++++++++++++++++++---------------
 scripts/lib/devtool/__init__.py  |  4 +--
 scripts/lib/recipetool/append.py |  4 +--
 scripts/oe-selftest              | 18 +++++++++----
 scripts/recipetool               | 56 ++++++++++++++++++++++++---------------
 5 files changed, 88 insertions(+), 51 deletions(-)

-- 
2.2.1


