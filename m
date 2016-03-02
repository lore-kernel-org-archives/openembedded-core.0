Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 74BA975E80
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 10:45:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 02 Mar 2016 02:45:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,528,1449561600"; d="scan'208";a="756622364"
Received: from sgominde-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.23])
	by orsmga003.jf.intel.com with ESMTP; 02 Mar 2016 02:44:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2016 23:44:20 +1300
Message-Id: <a6ab23f9d4282fc25495f41783cce46bbc15bd4e.1456915391.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456915391.git.paul.eggleton@linux.intel.com>
References: <cover.1456915391.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456915391.git.paul.eggleton@linux.intel.com>
References: <cover.1456915391.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] devtool: build-image: rename module
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
X-List-Received-Date: Wed, 02 Mar 2016 10:45:01 -0000

Hyphens aren't allowed in python identifiers, so you shouldn't use them
in module names or they are more difficult to import.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/{build-image.py => build_image.py} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename scripts/lib/devtool/{build-image.py => build_image.py} (100%)

diff --git a/scripts/lib/devtool/build-image.py b/scripts/lib/devtool/build_image.py
similarity index 100%
rename from scripts/lib/devtool/build-image.py
rename to scripts/lib/devtool/build_image.py
-- 
2.5.0


