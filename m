Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 743B97064C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 21:57:18 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6HLvJwJ023301 for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 16:57:19 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014071716571964-513272 ;
	Thu, 17 Jul 2014 16:57:19 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jul 2014 16:56:51 -0500
Message-Id: <cover.1405633546.git.ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/17/2014 04:57:19 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/17/2014 04:57:19 PM,
	Serialize complete at 07/17/2014 04:57:19 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-17_06:2014-07-17, 2014-07-17,
	1970-01-01 signatures=0
Subject: [PATCH v2 0/6] Various fixes and improvements to initscripts
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
X-List-Received-Date: Thu, 17 Jul 2014 21:57:21 -0000

This patch series contains fixes and improvements we've made to several init 
scripts.  These changes have been thoroughly tested on Dylan and ported to 
master.

Changes made in v2:
  - Updated /etc/timestamp generated at build time to use seconds accuracy
  - Added a patch I missed the first time to source /etc/default/urandom 
    from /etc/init.d/urandom

The following changes since commit a449598a839e677e2a094aa4bd9a68003de6e42e:

  bdwgc: Add PACKAGECONFIG for libatomic-ops (2014-07-17 15:04:07 +0100)

are available in the git repository at:

  git://github.com/ni/openembedded-core dev/bshelton/upstream_initscripts
  https://github.com/ni/openembedded-core/tree/dev/bshelton/upstream_initscripts

Blair Elliott (1):
  initscripts: save /etc/timestamp with seconds accuracy

Ken Sharp (1):
  initscripts: Use current date as an additional source of entropy

Richard Tollerton (4):
  initscripts: bootmisc.sh: Make sysctl -p honor VERBOSE
  initscripts: parametrize random seed file location
  initscripts: make hostname.sh coreutils-compatible
  initscripts: Add support for /etc/default/urandom

 meta/classes/image.bbclass                          |  2 +-
 .../initscripts/initscripts-1.0/bootmisc.sh         | 12 +++++++++---
 .../initscripts/initscripts-1.0/hostname.sh         |  2 +-
 .../initscripts/initscripts-1.0/save-rtc.sh         |  2 +-
 .../initscripts/initscripts-1.0/urandom             | 21 ++++++++++++---------
 5 files changed, 24 insertions(+), 15 deletions(-)

-- 
2.0.2


