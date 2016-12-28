Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D1DEF719F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 14:45:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2016 06:45:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,422,1477983600"; d="scan'208";a="23724294"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 28 Dec 2016 06:45:41 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 21F6E6A4006;
	Wed, 28 Dec 2016 06:44:49 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2016 16:45:28 +0200
Message-Id: <cover.1482936066.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] ppp build fix for musl + 4.9 headers
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
X-List-Received-Date: Wed, 28 Dec 2016 14:45:41 -0000

These patches should apply to master but are meant for current
ross/mut: ppp fails to build on musl when the 4.9 headers are used.

Thanks to Khem for the patch suggestion.

Jussi

The following changes since commit 1dc1894e05ef0f3aeeefa61ed89613f17bba2e83:

  cairo: set license for cairo-doc (2016-12-22 20:29:28 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/ppp-fix-for-mut
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/ppp-fix-for-mut

Jussi Kukkonen (2):
  ppp: Partly remove patch that doesn't make sense any more
  ppp: Add patch to fix build with musl and 4.9 headers

 ...01-ppp-Fix-compilation-errors-in-Makefile.patch | 51 ++--------------------
 .../ppp/ppp/0001-ppp-Remove-unneeded-include.patch | 43 ++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |  1 +
 3 files changed, 47 insertions(+), 48 deletions(-)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-ppp-Remove-unneeded-include.patch

-- 
2.1.4


