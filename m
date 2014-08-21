Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 458F070EA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 19:49:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7LJn5Yo019450
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 12:49:06 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 21 Aug 2014 12:49:05 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Aug 2014 14:54:54 -0500
Message-ID: <cover.1408649791.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Thu, 21 Aug 2014 19:49:06 -0000
Content-Type: text/plain

The various cortex chips generally support thumb code, so the armv7at
tunings are a better default for them than the plain armv7a tunings.
The armv7at tuning allows generation of both arm and thumb code, while
armv7a only allows arm code, which is typically significantly bigger.
(It may be faster in some cases, but the tradeoffs aren't totally
obvious, because smaller code fits in caches better.) Since they
all had armv7a-neon as default, change them to armv7at-neon.

The following changes since commit 47d1fc9f5c38f3d092937c47bd4c2f45adaa7fe6:

  qemu: fix Darwin cross-compilation (2014-08-18 20:43:24 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/armv7at
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/armv7at

Peter Seebach (1):
  tune-cortexa*.inc: use armv7at by default

 meta/conf/machine/include/tune-cortexa15.inc |    2 +-
 meta/conf/machine/include/tune-cortexa5.inc  |    2 +-
 meta/conf/machine/include/tune-cortexa7.inc  |    2 +-
 meta/conf/machine/include/tune-cortexa8.inc  |    2 +-
 meta/conf/machine/include/tune-cortexa9.inc  |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)


