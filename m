Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 596ED6A9D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 13:39:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Oct 2014 06:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,717,1406617200"; d="scan'208";a="618395742"
Received: from gtotamun-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.192])
	by orsmga002.jf.intel.com with ESMTP; 14 Oct 2014 06:39:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Oct 2014 14:39:09 +0100
Message-Id: <cover.1413293907.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/1] OpenSSH + systemd + screen fix
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
X-List-Received-Date: Tue, 14 Oct 2014 13:39:35 -0000

The following changes since commit fcbd1b19383daf5e160a864df1418130da01be28:

  build-appliance-image: Update to dizzy head revision (2014-10-11 08:11:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/openssh-systemd-killmode
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/openssh-systemd-killmode

Paul Eggleton (1):
  openssh: avoid screen sessions being killed on disconnect with systemd

 meta/recipes-connectivity/openssh/openssh/sshd@.service | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.3


