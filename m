Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 93E3870259
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:52:16 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6GKxNbu017689 for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 15:59:23 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014071615592400-455724 ;
	Wed, 16 Jul 2014 15:59:24 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 15:59:13 -0500
Message-Id: <cover.1405542432.git.ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/16/2014 03:59:24 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/16/2014 03:59:24 PM,
	Serialize complete at 07/16/2014 03:59:24 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-16_07:2014-07-16, 2014-07-16,
	1970-01-01 signatures=0
Subject: [PATCH 0/5] Various fixes and improvements to initscripts
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
X-List-Received-Date: Wed, 16 Jul 2014 21:52:20 -0000

This patch series contains fixes and improvements we've made to several init 
scripts.  These changes have been thoroughly tested on Dylan and ported to 
master.

The following changes since commit 846bc50fde11bbb36c8eb5b2e3ae6bb644c037f3:

  ltp: use "foreign" automake strictness (2014-07-16 10:27:16 +0100)

are available in the git repository at:

  git://github.com/ni/openembedded-core dev/bshelton/upstream_initscripts
  https://github.com/ni/openembedded-core/tree/dev/bshelton/upstream_initscripts

Blair Elliott (1):
  initscripts: save /etc/timestamp with seconds accuracy

Ken Sharp (1):
  initscripts: Use current date as an additional source of entropy

Richard Tollerton (3):
  initscripts: bootmisc.sh: Make sysctl -p honor VERBOSE
  initscripts: parametrize random seed file location
  initscripts: make hostname.sh coreutils-compatible

 .../initscripts/initscripts-1.0/bootmisc.sh          | 12 +++++++++---
 .../initscripts/initscripts-1.0/hostname.sh          |  2 +-
 .../initscripts/initscripts-1.0/save-rtc.sh          |  2 +-
 .../recipes-core/initscripts/initscripts-1.0/urandom | 20 +++++++++++---------
 4 files changed, 22 insertions(+), 14 deletions(-)

-- 
2.0.1


