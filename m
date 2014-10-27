Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9449C65D59
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 15:23:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Oct 2014 08:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,796,1406617200"; d="scan'208";a="596967966"
Received: from tlankage-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.isw.intel.com) ([10.252.121.248])
	by orsmga001.jf.intel.com with ESMTP; 27 Oct 2014 08:23:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Oct 2014 15:23:22 +0000
Message-Id: <cover.1414423342.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [daisy][PATCH 0/2] A couple of backported fixes for daisy
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
X-List-Received-Date: Mon, 27 Oct 2014 15:23:36 -0000

The following changes since commit 0692743b51f7daa0154fd4d8982236b4702ea2da:

  gnupg: CVE-2013-4242 (2014-10-23 21:42:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/daisy-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/daisy-fixes

Paul Eggleton (2):
  python: force off_t size to 8 to enable large file support
  openssh: avoid screen sessions being killed on disconnect with systemd

 meta/recipes-connectivity/openssh/openssh/sshd@.service | 1 +
 meta/recipes-devtools/python/python_2.7.3.bb            | 3 +++
 2 files changed, 4 insertions(+)

-- 
1.9.3


