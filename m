Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3E61C76DF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 15:04:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 29 Jan 2016 07:04:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,364,1449561600"; d="scan'208";a="891900207"
Received: from mshai-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.30.5])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jan 2016 07:04:31 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jan 2016 17:04:28 +0200
Message-Id: <1454079871-4658-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] correctly clean ${B] when externalsrc and {B}=${S}
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
X-List-Received-Date: Fri, 29 Jan 2016 15:04:48 -0000

This patchset aims in fixing a build failure when B=S and externalsrc is used.
The build failure was caused by build artefacts from a previous build not being
cleaned up when MACHINE was changed.

[YOCTO #8950]

The following changes since commit 2a6e061712cfe9cb4738806a0c351a64e0d30144:

  cmake: update to 3.4.2 (2016-01-26 22:48:57 +0000)

are available in the git repository at:

  contrib-git marquiz/externalsrc

for you to fetch changes up to 58bb2b3bd3195af2715e8dd594326dfa73fc72e9:

  externalsrc: use shared CONFIGURESTAMPFILE if B=S (2016-01-29 16:53:19 +0200)


Markus Lehtonen (3):
  autotools.bbclass: use oe_runmake instead of ${MAKE}
  Make sure that the directory for CONFIGURESTAMPFILE exists
  externalsrc: use shared CONFIGURESTAMPFILE if B=S

 meta/classes/autotools.bbclass   |  4 ++--
 meta/classes/base.bbclass        |  1 +
 meta/classes/externalsrc.bbclass | 11 +++++++++++
 3 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.1.4


