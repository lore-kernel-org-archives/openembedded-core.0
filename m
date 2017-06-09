Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DD0CA78286
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 07:36:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2017 00:36:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="1158465126"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2017 00:36:14 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id C631558029B;
	Fri,  9 Jun 2017 00:36:12 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 10:36:10 +0300
Message-Id: <cover.1496993458.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] Small fixes
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
X-List-Received-Date: Fri, 09 Jun 2017 07:36:17 -0000

A host path leak fix for diff and a build optimization for numpy.

Cheers,
 Jussi


The following changes since commit 4a7612c7a12b9a381fb8343ba9586272b889fc15:

  buildhistory: skip tests if GitPython module is missing (2017-06-07 16:00:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib numpy-parallel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=numpy-parallel

Jussi Kukkonen (2):
  Enable parallel compilation for python3-numpy
  diffutils: prevent host path leaks, set pr path

 meta/recipes-devtools/python-numpy/python3-numpy_1.11.2.bb | 2 ++
 meta/recipes-extended/diffutils/diffutils_3.5.bb           | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.1.4


