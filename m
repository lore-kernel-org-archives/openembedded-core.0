Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB8160110
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 11:42:00 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP; 15 Nov 2016 03:42:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,494,1473145200"; d="scan'208";a="31158960"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 15 Nov 2016 03:42:01 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 83FD36A4006;
	Tue, 15 Nov 2016 03:41:21 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 13:41:57 +0200
Message-Id: <2746a0f36a1d8066e0f0c76493115db57b13da4b.1479130124.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1479130124.git.jussi.kukkonen@intel.com>
References: <cover.1479130124.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] xserver-nodm-init: Bump PV to ensure upgrade from 2.0
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
X-List-Received-Date: Tue, 15 Nov 2016 11:42:00 -0000

meta-oe provides a 2.0 version of this recipe, but this one now
does everything the meta-oe version does.

There's one exception though: xserver-common is not a runtime
dependency. This needs to be added elsewhere for the platforms that
require it.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../x11-common/{xserver-nodm-init.bb => xserver-nodm-init_3.0.bb}         | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/x11-common/{xserver-nodm-init.bb => xserver-nodm-init_3.0.bb} (100%)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
similarity index 100%
rename from meta/recipes-graphics/x11-common/xserver-nodm-init.bb
rename to meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
-- 
2.1.4


