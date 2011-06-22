Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QZNCU-0008R5-Uv
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 15:10:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jun 2011 06:06:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,406,1304319600"; d="scan'208";a="21415343"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2011 06:06:58 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2011 21:08:07 +0800
Message-Id: <cover.1308747461.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chris Larson <clarson@kergoth.com>, Paul Eggleton <paul.eggleton@intel.com>
Subject: [PATCH 0/1] RFC: combo layer tool v2
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
X-List-Received-Date: Wed, 22 Jun 2011 13:10:35 -0000

This is the V2 RFC patch of combo layer tool.

Thanks for Paul and Chris's valuable review, the version includes all
their comments:

- fix several grammar issue
- fix the incorrect patch range
- print the component repo name when updating
- delete the temporary directory when it is done
- use the python ConfigParser class to simplify the parsing

The following changes since commit b30cb584a738915113e88b7db1028d53b2bae5f9:
  Richard Purdie (1):
        Revert "gcc: rebase the patch to avoid patch rejection"

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kyu3/combo-layer-v3
  http://git.pokylinux.org/cgit.cgi//log/?h=kyu3/combo-layer-v3

Yu Ke (1):
  combo-layer-tool: add tool to manipulate combo layer

 scripts/combo-layer                 |  360 +++++++++++++++++++++++++++++++++++
 scripts/combo-layer-hook-default.sh |   13 ++
 scripts/combo-layer.conf.example    |   37 ++++
 3 files changed, 410 insertions(+), 0 deletions(-)
 create mode 100755 scripts/combo-layer
 create mode 100755 scripts/combo-layer-hook-default.sh
 create mode 100644 scripts/combo-layer.conf.example



