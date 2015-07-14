Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 39BE065C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 15:57:03 +0000 (UTC)
Received: by pachj5 with SMTP id hj5so7749863pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 08:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=g39ov2YZP5anfZ77nrmX7HfP1qB5O+yfeHoj/C8AcN8=;
	b=OhGrFP8WjP8Hz115d/T1QTziLQddKG+hxzqCppAg0xXqC8isw6Uu096c2AH1vCbPP1
	h6Q9LZDpYt3uTz/UqezUArRvXQFd+gb6eZhKXLgcrwFZjNBxtilaG5FOr3OnVRjmlmM2
	GmU2eo39krvltBOEv8ByK4juKqWYYFrprj/ojQPcGttXlUliQf1I+PaSu/I1MOMVANHi
	B6F4LqgicggXNPkOfyP2vsaBAjDf3KIWdXKsewvL/MHgRGXZZbSLM61cRYoHPiI1G9qs
	u5usZzqNlvId6BMeF6/u5lly0WReo4EkClNu+QqufU0LDWyJIg+KlIr1ZP/LUDdGwWIL
	uEGA==
X-Received: by 10.66.146.226 with SMTP id tf2mr82802574pab.4.1436889423540;
	Tue, 14 Jul 2015 08:57:03 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id x7sm1785880pas.28.2015.07.14.08.57.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jul 2015 08:57:02 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 08:57:14 -0700
Message-Id: <cover.1436889188.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/6] recipetool/devtool/oe-selftest: pull from BBPATH
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
X-List-Received-Date: Tue, 14 Jul 2015 15:57:04 -0000

From: Christopher Larson <chris_larson@mentor.com>

Ensures that recipetool and devtool pull plugins from layers, and
oe-selftest will pull tests from layers.

Unrelated to that, also prevents a traceback on parsing failure, and adds
a tiny feature to appendsrc to facilitate reuse by other sub-commands.

[YOCTO #7625]

The following changes since commit 6be698b7270f73f40d38713ecf13f12aec0ced61:

  dpkg: Fix for Fedora22 and new versions of tar (2015-07-13 13:46:45 +0100)

are available in the git repository at:

  git@github.com:kergoth/openembedded-core yocto-bug-7625

for you to fetch changes up to ab9d004953408688ed82d1b8de1ae0887f9989b5:

  oe-selftest: add libdirs from BBPATH to sys.path (2015-07-13 12:31:29 -0700)

----------------------------------------------------------------
Christopher Larson (6):
      recipetool: catch BBHandledException from parsing
      recipetool.append: add extralines arg to appendsrc
      recipetool: also load plugins from BBPATH
      devtool: also load plugins from BBPATH
      oe-selftest: obey oeqa.selftest.__path__
      oe-selftest: add libdirs from BBPATH to sys.path

 scripts/devtool                  | 57 ++++++++++++++++++++++++----------------
 scripts/lib/devtool/__init__.py  |  4 +--
 scripts/lib/devtool/deploy.py    |  6 ++---
 scripts/lib/devtool/standard.py  | 15 +++++------
 scripts/lib/recipetool/append.py |  4 +--
 scripts/oe-selftest              | 18 +++++++++----
 scripts/recipetool               | 56 ++++++++++++++++++++++++---------------
 7 files changed, 96 insertions(+), 64 deletions(-)

-- 
2.2.1


