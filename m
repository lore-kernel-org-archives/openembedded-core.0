Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RsOeL-0001hv-78
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 02:06:13 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 Jan 2012 16:58:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118835779"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.149])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2012 16:58:17 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2012 16:58:12 -0800
Message-Id: <cover.1328057677.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/3] Misc fixes - pciutils and syslogd
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
X-List-Received-Date: Wed, 01 Feb 2012 01:06:13 -0000

All,

Here are a couple of patches to fix issues in test builds I've been running
today.

The first fixes our patched configure script in pciutils for users of the dash
shell. The second ensures sysklogd is a little more useful out of the box.

Cheers,
Joshua

The following changes since commit d7b13cd42ab8d5f44f97e119b73ec2e363677d26:

  useradd.bbclass: Fix missing quote (2012-01-27 23:57:33 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/fixes

Joshua Lock (3):
  pciutils: fix configure script for dash
  sysklogd: various fixes so it starts/stops cleanly
  distro_tracking_fields: take sysklogd off Saul's plate

 .../conf/distro/include/distro_tracking_fields.inc |    2 +-
 .../pciutils/pciutils-3.1.9/configure.patch        |    2 +-
 meta/recipes-extended/sysklogd/files/sysklogd      |    2 +-
 meta/recipes-extended/sysklogd/files/syslog.conf   |    6 +++---
 meta/recipes-extended/sysklogd/sysklogd.inc        |   14 ++++++++++----
 meta/recipes-extended/sysklogd/sysklogd_1.5.bb     |    2 +-
 6 files changed, 17 insertions(+), 11 deletions(-)

-- 
1.7.7.6



