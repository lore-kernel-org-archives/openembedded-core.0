Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id D8522761D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 19:57:02 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so1223875pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 12:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XNQbvfDPGJMgpBxH5U4DfCnG32O80R34NRXSKn1C9d8=;
	b=GFoNOiz3KdHi5MbXlseNcYFJPw8OoyvRmYdYeiGE10IDlhj0THpAXQoEf/+GvttbGN
	ng5bv4Oz33xcQCRyPHOGhUgPTs9WaeD6VNKvZhY+jv05s1rm2Y152UvopCkSW7JaA4Xf
	/VLKi67129X7FkhOOgqBzrRWXZDppQrlaUp/WN6NU5dAJgMGLy+v0m2Z/SuRqXnyFGfn
	6jjf6o2fIVZis22zJiX5ltL8InZGgcqXj+N2oSWhPXESxMJ+PzBmZhDxdz/qfWY8Hdjo
	Fjwgpbc1e5s7Nw+tIsONvuD8uNDC+4AgMR8pH5jriv+qN5NgTW4ZVqJK7/TXqL5ZGmff
	/TrQ==
X-Received: by 10.66.66.130 with SMTP id f2mr22727795pat.120.1437681422360;
	Thu, 23 Jul 2015 12:57:02 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	kw5sm10533370pab.29.2015.07.23.12.57.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 12:57:01 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 12:57:55 -0700
Message-Id: <cover.1437663603.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv3 0/6] recipetool/devtool/oe-selftest: pull from BBPATH
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
X-List-Received-Date: Thu, 23 Jul 2015 19:57:03 -0000

From: Christopher Larson <chris_larson@mentor.com>

Ensures that recipetool and devtool pull plugins from layers, and
oe-selftest will pull tests from layers.

Unrelated to that, also prevents a traceback on parsing failure, and adds
a tiny feature to appendsrc to facilitate reuse by other sub-commands.

[v3 Update] Fixed the commit message for `devtool: also load plugins from
BBPATH` to match the implementation. Split up `recipetool: also load plugins
from BBPATH` into two commits with clear commit messages.

[v2 Update] `devtool: also load plugins from BBPATH` was fixed, so it no longer
breaks the devtool selftests.

The following changes since commit 3143920c541b55b543b9dcc12b18af4e0e4b7ae1:

  linux-libc-headers: update to 4.1 (2015-07-23 08:47:52 +0100)

are available in the git repository at:

  git@github.com:kergoth/openembedded-core yocto-bug-7625

for you to fetch changes up to 6ac90ef048adff65b6dce1e4102156ccb365964a:

  oe-selftest: add libdirs from BBPATH to sys.path (2015-07-23 07:59:18 -0700)

----------------------------------------------------------------
Christopher Larson (7):
      recipetool: catch BBHandledException from parsing
      recipetool.append: add extralines arg to appendsrc
      recipetool: also load plugins from BBPATH
      recipetool: parse global args early
      devtool: also load plugins from BBPATH
      oe-selftest: obey oeqa.selftest.__path__
      oe-selftest: add libdirs from BBPATH to sys.path

 scripts/devtool                  | 57 +++++++++++++++++++++++++---------------
 scripts/lib/devtool/__init__.py  |  4 +--
 scripts/lib/recipetool/append.py |  4 +--
 scripts/oe-selftest              | 18 +++++++++----
 scripts/recipetool               | 57 +++++++++++++++++++++++++---------------
 5 files changed, 89 insertions(+), 51 deletions(-)

-- 
2.2.1


