Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E18167705F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 15:34:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2016 08:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,544,1464678000"; d="scan'208";a="1017407551"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.178])
	by orsmga001.jf.intel.com with ESMTP; 19 Aug 2016 08:34:58 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 16:34:45 +0100
Message-Id: <cover.1471620482.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/5] security_flags: additions in line with common practice
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
X-List-Received-Date: Fri, 19 Aug 2016 15:35:01 -0000

This series tidies up the security_flags include to:
* remove an invalid option
* update the flags to be more in-line with the common options in use on major distros such as Ubuntu and Fedora

This series has been tested on qemuarm, qemuarm64 and qemux86-64 building core-image-minimal, core-image-sato, core-image-lsb, core-image-lsb-dev and core-image-lsb-sdk images for poky-lsb distro.

Regards,

Joshua

The following changes since commit d3e5c1d17f80b3dd7a6d85e07b5c0c516f09ae93:

  local.conf.sample: Disable ARM and PPC due to prelink test case failures (2016-08-19 10:23:31 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/secflags
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/secflags

Joshua Lock (5):
  security_flags: remove invalid linker option
  security_flags: pass ssp-buffer-size param to stack protector
  security_flags: link position independent executables
  security_flags: update comment header
  security_flags: ensure changes to SHARED_OBJECTS cause recompile

 meta/conf/distro/include/security_flags.inc | 333 ++++++++++++++++++++++++++--
 1 file changed, 320 insertions(+), 13 deletions(-)

-- 
2.7.4

