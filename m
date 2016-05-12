Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 997596FFF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 19:32:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 12 May 2016 12:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,610,1455004800"; d="scan'208";a="952039801"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2016 12:32:33 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 11:28:11 +0000
Message-Id: <cover.1463052157.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCHv2 0/3] Add extract() method to package manager
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
X-List-Received-Date: Thu, 12 May 2016 19:32:32 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Sometimes it is needed to have the content of a package outside of an image,
these series add this capability using a temp directory.

Changes in v2:

- Add default values when parsing package information. This way it won't
  throw an exception when trying to save an undefined variable


The following changes since commit 28433319ad8299aa23b1fcfdddbe100b29e86517:

  bitbake: toaster: tests browser Add test for creating a project (2016-05-11 11:32:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug9569v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug9569v2

Mariano Lopez (3):
  package_manager.py: Move opkg_query() outside of Indexer class
  package_manager.py: Add extract() method for opkg and dpkg
  package_manager.py: Add extract() method for RPM package manager

 meta/lib/oe/package_manager.py | 321 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 266 insertions(+), 55 deletions(-)

-- 
2.6.6


