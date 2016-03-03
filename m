Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0FA4E602D9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 11:14:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Mar 2016 03:14:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,532,1449561600"; d="scan'208";a="900262779"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.14.114])
	by orsmga001.jf.intel.com with ESMTP; 03 Mar 2016 03:14:02 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Mar 2016 11:13:54 +0000
Message-Id: <cover.1457003468.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [jethro][PATCH 0/7] Consolidated jethro pull request
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
X-List-Received-Date: Thu, 03 Mar 2016 11:14:02 -0000

As I was in the list archives scooping up security patches I took the liberty
of also pulling outstanding non-security jethro patches together. Please
consider this series for merge.

Regards,

Joshua

The following changes since commit c99ed6b73f397906475c09323b03b53deb83de55:

  openssl: Security fix CVE-2016-0800 (2016-03-03 10:38:38 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/jethro
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/jethro

Arnold Csorvasi (1):
  image_types_uboot: add cpio.gz.uboot to supported IMAGE_TYPES

Christopher Larson (1):
  image_types: improve wks path specification

Craig McQueen (1):
  os-release: put double-quotes around variable contents

Mariano Lopez (1):
  image_types.bbclass: Rebuild when WICVARS change

Noor Ahsan (1):
  wic: rawcopy: Copy source file to build folder

Ross Burton (2):
  libsdl: expand PACKAGECONFIG and enable native builds
  conf/local.conf.sample: comment out ASSUME_PROVIDED=libsdl-native

 meta/classes/image_types.bbclass              | 37 ++++++++++++++++++++++-----
 meta/classes/image_types_uboot.bbclass        |  2 +-
 meta/conf/local.conf.sample                   |  7 ++---
 meta/recipes-core/os-release/os-release.bb    |  2 +-
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 35 +++++++++++++------------
 scripts/lib/wic/plugins/source/rawcopy.py     |  7 ++---
 6 files changed, 58 insertions(+), 32 deletions(-)

--
2.5.0

