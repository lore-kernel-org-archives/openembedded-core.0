Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C81286ACB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 09:20:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 14 Oct 2014 02:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="399903772"
Received: from gtotamun-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.192])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Oct 2014 02:13:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Oct 2014 10:20:23 +0100
Message-Id: <cover.1413278343.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/1] Fix Python large file file support on 32-bit systems
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
X-List-Received-Date: Tue, 14 Oct 2014 09:20:39 -0000

The following change since commit fcbd1b19383daf5e160a864df1418130da01be28:

  build-appliance-image: Update to dizzy head revision (2014-10-11 08:11:11 +0100)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/python-largefile
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/python-largefile

Paul Eggleton (1):
  python: force off_t size to 8 to enable large file support

 meta/recipes-devtools/python/python_2.7.3.bb | 3 +++
 1 file changed, 3 insertions(+)

-- 
1.9.3


