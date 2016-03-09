Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 04C7D65CBB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 04:49:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 08 Mar 2016 20:49:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,310,1455004800"; d="scan'208";a="929876750"
Received: from mlim-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.143.14])
	by orsmga002.jf.intel.com with ESMTP; 08 Mar 2016 20:49:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:48:47 +1300
Message-Id: <cover.1457498464.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH v2 0/8] recipetool create improvements
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
X-List-Received-Date: Wed, 09 Mar 2016 04:49:26 -0000

Changes since v1:
 * Set PKGV and SUMMARY per package for split npm packages so they get
   the values appropriate to the module they contain. PKGV is
   particularly important so that the image manifests have the
   appropriate version for each module.
 * Create shrinkwrap/lockdown files next to npm recipes and add
   references to them within the recipe
 * Don't fail if license value in an npm module's package.json isn't a
   simple string (more complicated license definitions are allowed
   according to the npm documentation).
 

The following changes since commit 0d02159c8d66bb136f7da2c10fda7d1a57f40cec:

  image.bbclass: fix incomplete .rootfs customization (2016-03-07 22:01:16 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/recipetool3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/recipetool3

Paul Eggleton (8):
  recipetool: create: be more tolerant of spacing in configure.ac
  recipetool: create: improve mapping for autotools program macros
  recipetool: create: match *LICENSE* as a license file
  recipetool: create: add license file crunching
  recipetool: create: split npm module dependencies into packages
  recipetool: create: check if npm available if npm:// URL specified
  recipetool: create: support creation of additional files by plugins
  recipetool: create: shrinkwrap and lockdown npm modules

 meta/classes/npm.bbclass                  |  20 ++++
 meta/lib/oe/package.py                    |  32 +++++++
 scripts/lib/devtool/standard.py           |   6 +-
 scripts/lib/recipetool/create.py          | 146 +++++++++++++++++++++++++++++-
 scripts/lib/recipetool/create_buildsys.py |  54 ++++++++---
 scripts/lib/recipetool/create_npm.py      | 114 ++++++++++++++++++++++-
 6 files changed, 349 insertions(+), 23 deletions(-)

-- 
2.5.0


