Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4167077074
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 15:43:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 08:43:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; d="scan'208";a="1020782678"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.3.89])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2016 08:43:12 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 16:43:04 +0100
Message-Id: <cover.1472225461.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] Preserve extended attributes in sstate objects
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
X-List-Received-Date: Fri, 26 Aug 2016 15:43:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This small series is part of a larger, on-going, effort to better support  extended attributes (xattr).

The goal of sending these two patches before the whole is complete is to improve support for distros with features that rely on xattr that wish to use meta-swupd.

meta-swupd creates sstate objects of update artefacts so that an OS update delta can be generated against a previous OS release without having to have the full build history in TMPDIR — this is especially useful for CI workflows.
Without these changes sstate objects don't preserve xattr and thus swupd updates artefacts are incorrect/incomplete.

Regards,

Joshua

The following changes since commit 00027aee12f4bbc9a4ba607c91fcc1e0e8257fa2:

  core-image-kernel-dev.bb: Standardize use of _append and leading space. (2016-08-25 23:03:26 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/xattr
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/xattr

Joshua Lock (2):
  buildtools-tarball: add tar
  oe.path: preserve xattr in copytree() and copyhardlinktree()

 meta/lib/oe/path.py                          | 11 ++++++++---
 meta/recipes-core/meta/buildtools-tarball.bb |  1 +
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.7.4

