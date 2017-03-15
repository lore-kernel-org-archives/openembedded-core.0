Return-Path: <brian.avery@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4DD6A776D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 00:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489536145; x=1521072145;
	h=from:to:cc:subject:date:message-id;
	bh=+ii9bm6qFnoFv1GRNP/EZ5CTR0dgHBxC/8ZDUOX90MY=;
	b=oYFs4bCbNYnf5FrN868O/qVKr5EFxC5aLySd6nM50JN5ooTk1q6Ux1WE
	TUe5atMT80Ma/GVIfBnXZ92XhsO9sQ==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Mar 2017 17:02:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,166,1486454400"; d="scan'208";a="60421841"
Received: from bavery-ws-desk.jf.intel.com ([10.7.198.85])
	by orsmga002.jf.intel.com with ESMTP; 14 Mar 2017 17:02:24 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 17:04:29 -0700
Message-Id: <cover.1489534872.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] gen-lockedsig-cache: catch os.link error
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
X-List-Received-Date: Wed, 15 Mar 2017 00:02:23 -0000

If your sstate-cache directory is on a different filesystem from the one your build is on, gen-lockedsig-cache fails which causes the esdk creation to fail. This catches the hard link failure and does a copy in those cases.

-brian


The following changes since commit 6e20b31d5d17133e0fca086e12a0ad06ab5c4cc8:

  wic: selftest: account for occasional newline in debugfs file names (2017-03-14 14:42:18 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/gen-sigs-linkfix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/gen-sigs-linkfix

brian avery (1):
  gen-lockedsig-cache: catch os.link error

 scripts/gen-lockedsig-cache | 6 ++++++
 1 file changed, 6 insertions(+)

--
1.9.1

