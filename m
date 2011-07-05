Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qe8Xc-0000Zd-4d
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 18:32:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Jul 2011 09:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,480,1304319600"; d="scan'208";a="23636812"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.114])
	by orsmga001.jf.intel.com with ESMTP; 05 Jul 2011 09:28:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 17:28:09 +0100
Message-Id: <cover.1309883050.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] combo-layer tool v3
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
X-List-Received-Date: Tue, 05 Jul 2011 16:32:04 -0000

This is the third version of Yu Ke's combo-layer tool. Changes since v2:
 * Fix splitpatch so that it handles commits that only affect some of the
   components (reports the ones that have been skipped and avoids writing
   out empty patches)
 * A few fixes to the help text & comments


The following changes since commit f05b7ee7716d1e5cc1ba0bbab57e91c3a0569e9e:

  x-load: Update to 1.5.0 (2011-07-05 14:16:33 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/combo-layer-v3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/combo-layer-v3

Yu Ke (1):
  combo-layer-tool: add tool to manipulate combo layers

 scripts/combo-layer                 |  366 +++++++++++++++++++++++++++++++++++
 scripts/combo-layer-hook-default.sh |   13 ++
 scripts/combo-layer.conf.example    |   37 ++++
 3 files changed, 416 insertions(+), 0 deletions(-)
 create mode 100755 scripts/combo-layer
 create mode 100755 scripts/combo-layer-hook-default.sh
 create mode 100644 scripts/combo-layer.conf.example

-- 
1.7.4.1



