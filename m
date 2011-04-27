Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEn-0005QG-W4
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:42 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Apr 2011 00:30:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="914945871"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2011 00:30:11 -0700
Message-Id: <5057ea6d3d394842dfa120687cd5126a372434d8.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Tue, 26 Apr 2011 16:30:04 -0700
Date: Wed, 27 Apr 2011  0:30:11 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 49/52] tidy: move old clutter demo to meta-demoapps
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Apr 2011 07:32:42 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-graphics/clutter/tidy.inc              |    0
 .../recipes-graphics/clutter/tidy/autofoo.patch    |    0
 .../clutter/tidy/tidy-enable-tests.patch           |    0
 .../recipes-graphics/clutter/tidy_git.bb           |    0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta => meta-demoapps}/recipes-graphics/clutter/tidy.inc (100%)
 rename {meta => meta-demoapps}/recipes-graphics/clutter/tidy/autofoo.patch (100%)
 rename {meta => meta-demoapps}/recipes-graphics/clutter/tidy/tidy-enable-tests.patch (100%)
 rename {meta => meta-demoapps}/recipes-graphics/clutter/tidy_git.bb (100%)

diff --git a/meta/recipes-graphics/clutter/tidy.inc b/meta-demoapps/recipes-graphics/clutter/tidy.inc
similarity index 100%
rename from meta/recipes-graphics/clutter/tidy.inc
rename to meta-demoapps/recipes-graphics/clutter/tidy.inc
diff --git a/meta/recipes-graphics/clutter/tidy/autofoo.patch b/meta-demoapps/recipes-graphics/clutter/tidy/autofoo.patch
similarity index 100%
rename from meta/recipes-graphics/clutter/tidy/autofoo.patch
rename to meta-demoapps/recipes-graphics/clutter/tidy/autofoo.patch
diff --git a/meta/recipes-graphics/clutter/tidy/tidy-enable-tests.patch b/meta-demoapps/recipes-graphics/clutter/tidy/tidy-enable-tests.patch
similarity index 100%
rename from meta/recipes-graphics/clutter/tidy/tidy-enable-tests.patch
rename to meta-demoapps/recipes-graphics/clutter/tidy/tidy-enable-tests.patch
diff --git a/meta/recipes-graphics/clutter/tidy_git.bb b/meta-demoapps/recipes-graphics/clutter/tidy_git.bb
similarity index 100%
rename from meta/recipes-graphics/clutter/tidy_git.bb
rename to meta-demoapps/recipes-graphics/clutter/tidy_git.bb
-- 
1.7.1.1



