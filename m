Return-Path: <brian.avery@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 800C47197E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 21:56:07 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 01 May 2017 14:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,401,1488873600"; d="scan'208";a="82650052"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.5])
	by orsmga004.jf.intel.com with ESMTP; 01 May 2017 14:56:09 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 May 2017 14:58:58 -0700
Message-Id: <cover.1493674443.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] tcf-agent: add -USR2 to stop/kill initscript
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
X-List-Received-Date: Mon, 01 May 2017 21:56:09 -0000

This fixes the tcf-agent init script so /etc/init.d/tcf-agent stop works. It adds a -USR2 to the kill command like upstream does.
-brian


The following changes since commit 381897c64069ea43d595380a3ae913bcc79cf7e1:

  build-appliance-image: Update to master head revision (2017-05-01 08:56:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/tcf-agent/10858
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/tcf-agent/10858

brian avery (1):
  tcf-agent: add -USR2 to stop/kill initscript

 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--
1.9.1

