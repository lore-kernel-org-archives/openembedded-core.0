Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 38C7C7726B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:39:19 +0000 (UTC)
Received: by pasz6 with SMTP id z6so82421999pas.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=epdcMPN9DZYCF4UOEcPqTE3XC6mKBfUzusA4zvPYo8o=;
	b=CI6xbKkDpSmzSzhUUDiUpfNE8bAGQBGWJR81GB19dNF0ltCB/q5SItV8ZRVre8qOT1
	I95cJVHYs7VaO4M/9sMkWMMQaN2aaR4aWai8dXkCsds47p1KWEM9Ku2xzp8qEf2dmrro
	HDKwOCHuG0arXpPvp1LwstwQ6YkZeuDGg7NPv4arwE7ev7dLIP6EcqLM2udrx2B7elgC
	fQipPmu7xtr2zUYc5vQ2rJQKgJ6x4U/Wkzj27caZQV+1CwczQX16yilVrnJW4hs9V0QM
	AWL12c6ioAHWpppkCjexX34BwQ4+zHIqIhqJoHh4DrGAOKCzRtMbFjQ0cJaSlgOgQcCn
	FqOg==
X-Received: by 10.68.196.131 with SMTP id im3mr26840135pbc.59.1447371559876;
	Thu, 12 Nov 2015 15:39:19 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	ck9sm16774649pad.28.2015.11.12.15.39.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:39:17 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:39:06 -0700
Message-Id: <cover.1447371033.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 00/11] Misc fixes from Mentor
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
X-List-Received-Date: Thu, 12 Nov 2015 23:39:21 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is the first of three pull requests / patch series from Mentor's queue of
changes destined for oe-core master (not jethro). This series is misc fixes.


The following changes since commit e44ed8c18e395b9c055aefee113b90708e8a8a2f:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:02:57 +0000)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core mentor-misc-fixes-after-jethro
  https://github.com/kergoth/openembedded-core/tree/mentor-misc-fixes-after-jethro

Christopher Larson (11):
  recipetool.append: don't choke on a trailing ; in a url
  qemu.bbclass: correct the fsl ppc QEMU_EXTRAOPTIONS
  qemu.bbclass: fix vardeps of QEMU_OPTIONS
  blkspace: fix ldflags for iowatcher
  tcf-agent: obey LDFLAGS
  latencytop: obey LDFLAGS
  systemd: chown hwdb.bin to root:root for do_rootfs
  systemd: drop unneeded $D check in prerm
  connman: depend on readline
  sysklogd: inhibit updatercd for non-sysvinit
  openjade-native: statically link local libs

 meta/classes/qemu.bbclass                          | 18 +++++++++-----
 meta/recipes-connectivity/connman/connman.inc      |  2 +-
 meta/recipes-core/systemd/systemd_225.bb           |  7 ++----
 .../openjade/openjade-native_1.3.2.bb              | 22 ++++++++++++-----
 .../tcf-agent/tcf-agent/ldflags.patch              | 28 ++++++++++++++++++++++
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |  1 +
 meta/recipes-extended/sysklogd/sysklogd.inc        |  5 ++++
 .../recipes-kernel/blktrace/blktrace/ldflags.patch | 23 ++++++++++++++----
 .../latencytop-0.5/latencytop-makefile.patch       |  2 +-
 scripts/lib/recipetool/append.py                   |  2 ++
 10 files changed, 86 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch

-- 
2.2.1


