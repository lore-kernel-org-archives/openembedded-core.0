Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D6D0A6A4D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:19:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2013 09:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="357336968"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.97])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2013 09:19:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 17:19:01 +0100
Message-Id: <cover.1372436217.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/6] Add python-git module
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
X-List-Received-Date: Fri, 28 Jun 2013 16:19:13 -0000

This patchset adds python-git and dependencies, which has been required
on the host by buildhistory-diff since it was introduced; thus we need
it in the build appliance and buildtools-tarball.


The following changes since commit ff65497cd9a96d5ab49b16ba1f7e30a216ff4a42:

  classes/insane: remove la2 check which no longer exists from ERROR_QA (2013-06-28 16:33:05 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/python-git
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/python-git

Paul Eggleton (6):
  python-async: add recipe
  python-smmap: add recipe
  python-gitdb: add recipe
  python-git: add recipe
  buildtools-tarball: add python-git
  packagegroup-self-hosted: add python-git

 meta/recipes-core/meta/buildtools-tarball.bb       |  1 +
 .../packagegroups/packagegroup-self-hosted.bb      |  1 +
 meta/recipes-devtools/python/python-async_0.6.1.bb | 17 +++++++++++++++++
 .../python/python-git_0.3.2.RC1.bb                 | 22 ++++++++++++++++++++++
 meta/recipes-devtools/python/python-gitdb_0.5.4.bb | 18 ++++++++++++++++++
 meta/recipes-devtools/python/python-smmap_0.8.2.bb | 20 ++++++++++++++++++++
 6 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-async_0.6.1.bb
 create mode 100644 meta/recipes-devtools/python/python-git_0.3.2.RC1.bb
 create mode 100644 meta/recipes-devtools/python/python-gitdb_0.5.4.bb
 create mode 100644 meta/recipes-devtools/python/python-smmap_0.8.2.bb

-- 
1.8.1.2


