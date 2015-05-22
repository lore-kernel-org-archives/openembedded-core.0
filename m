Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 47D7B609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 08:37:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 22 May 2015 01:37:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,474,1427785200"; d="scan'208";a="496945461"
Received: from gfois-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.27.18])
	by FMSMGA003.fm.intel.com with ESMTP; 22 May 2015 01:37:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 09:37:07 +0100
Message-Id: <cover.1432283684.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Fix packagegroup-core-qt4e for recent gstreamer 0.10 removal
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
X-List-Received-Date: Fri, 22 May 2015 08:37:15 -0000

The following change since commit fe7780a9bbbfa4dcbbe457618a0842e91a3c6a0e:

  libxdmcp: make libbsd usage deterministic (2015-05-21 10:48:41 +0100)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/pkggrp-qt4e
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/pkggrp-qt4e

Paul Eggleton (1):
  packagegroup-core-qt4e: make phonon-gstreamer plugin optional

 meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.1.0


