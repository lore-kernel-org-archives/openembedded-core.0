Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RiujQ-0002SQ-6B
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 22:20:16 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Jan 2012 13:12:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="93407338"
Received: from miles.jf.intel.com (HELO localhost) ([10.7.199.152])
	by orsmga001.jf.intel.com with ESMTP; 05 Jan 2012 13:12:52 -0800
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 13:12:49 -0800
Message-Id: <cover.1325797875.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Urgent fix for insane.bbclass.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jan 2012 21:20:16 -0000

Hello,

This fixes the error:

AttributeError: 'module' object has no attribute 'check_output'

which currently is breaking builds for hosts using Python < 2.7.
Please apply it ASAP.

Thanks,

Scott

The following changes since commit 563828bad19a242bba9ce3db461bb5807037dfdf:

  multilib: Abstract class extension code into classextend.py (2012-01-05 12:36:08 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgarman/qa-fix-final
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/qa-fix-final

Scott Garman (1):
  insane.bbclass: use bb.process.Popen instead of
    subprocess.check_output

 meta/classes/insane.bbclass |   16 ++++++----------
 1 files changed, 6 insertions(+), 10 deletions(-)

-- 
1.7.5.4



