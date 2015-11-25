Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52B5F65D4A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 22:42:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAPMgJ1F002747
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 14:42:19 -0800 (PST)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 25 Nov 2015 14:42:19 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Nov 2015 16:42:16 -0600
Message-ID: <cover.1448491263.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] fix silly getmntent() bug
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
X-List-Received-Date: Wed, 25 Nov 2015 22:42:19 -0000
Content-Type: text/plain

This is a backport of a bug in getmntent() which we were only
actually bitten by on MIPS, but which is clearly a real bug on
most targets, where empty lines can cause buffer underrun. Just
a backport of upstream patch. Verified to fix observed failure.

The following changes since commit 80b3974081c4a8c604e23982a6db8fb32c616058:

  sstate: Ensure siginfo and sig files are also touched (2015-11-25 08:08:51 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/getmntent
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/getmntent

Peter Seebach (1):
  glibc/0029-fix-getmnt-empty-lines.patch: fix getmntent()

 .../glibc/0029-fix-getmntent-empty-lines.patch     | 40 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb              |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0029-fix-getmntent-empty-lines.patch

-- 
2.3.1


