Return-Path: <brian.avery@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E945360116
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 16:23:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 09 Sep 2016 09:23:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,305,1470726000"; d="scan'208";a="1027481003"
Received: from bavery-ws-desk.jf.intel.com ([10.7.201.28])
	by orsmga001.jf.intel.com with ESMTP; 09 Sep 2016 09:23:52 -0700
From: bavery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Sep 2016 09:25:11 -0700
Message-Id: <cover.1473437950.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] testimage:add createrepo-native to depends
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
X-List-Received-Date: Fri, 09 Sep 2016 16:23:53 -0000

This adds the createrepo-native to the depends for testimage.  Without this,
if you just make the dependencies you need for testimage (for instance if you
already have the image to test) you would be missing the createrepo-native needed
by testimage.

-b

The following changes since commit 2679a347c576f5411fbe802d2f6201c94036ecb2:

  maintainers.inc: rename gtk-doc-stub to gtk-doc, reassign to me (2016-09-09 12:12:59 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/fix-createrepo-native-missing
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/fix-createrepo-native-missing

bavery (1):
  testimage: add createrepo-native to testimage depends

 meta/classes/testimage.bbclass | 1 +
 1 file changed, 1 insertion(+)

--
1.9.1

