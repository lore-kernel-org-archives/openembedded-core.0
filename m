Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1BC4060438
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 01:37:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7F1b5pg020172
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 18:37:07 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 14 Aug 2014 18:37:04 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Aug 2014 20:42:46 -0500
Message-ID: <cover.1408066680.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] qemumips.conf: Use mips32r2 tuning definitions
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
X-List-Received-Date: Fri, 15 Aug 2014 01:37:12 -0000
Content-Type: text/plain

This makes two changes, one explicit and one implicit.

Explicit: Change the included tune file.
Implicit: Change the default tune.

qemumips appears to support mips32r2 just fine, and there's not
a huge amount of interest in plain-old mips32. This matters to
me because I have a desire to use a toolchain which supports
mips32r2 but not mips32r1. (At least, in terms of prebuilt
binaries.) But it might generally improve life for people
using qemumips a lot to have it be slightly closer to typical
modern hardware, and I don't think it'll hurt anyone.

The following changes since commit 4321c553d5ae816e566234e981a0815bba046d39:

  SIGGEN_EXCLUDERECIPES_ABISAFE: add initscripts (2014-08-11 17:44:09 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/qemumips32r2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/qemumips32r2

Peter Seebach (1):
  qemumips.conf: Default to (and support) mips32r2

 meta/conf/machine/qemumips.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)


