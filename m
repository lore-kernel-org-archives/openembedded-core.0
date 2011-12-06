Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RXoRi-0005Om-No
	for openembedded-core@openembedded.org; Tue, 06 Dec 2011 07:24:06 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Dec 2011 22:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="83881063"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.199])
	by orsmga002.jf.intel.com with ESMTP; 05 Dec 2011 22:16:14 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Mon,  5 Dec 2011 22:16:11 -0800
Message-Id: <cover.1323148082.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/2] Small fixes (could be for M1)
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
X-List-Received-Date: Tue, 06 Dec 2011 06:24:07 -0000

Richard,

These are a couple of things I found in distro_tracking (with
Jiajun's help) and wget was pointing to the wrong place, would
be good for the self-hosted build.

Sau!

The following changes since commit 0a7a8597be05c8def8af58eecab49d963dc9d757:

  libsdl: Disable pulseaudio explicitly (2011-12-05 23:03:23 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (2):
  distro_tracking: fix manual entries
  wget: Fix wget alternative path to be /usr/bin not /bin

 .../conf/distro/include/distro_tracking_fields.inc |    4 ++--
 meta/recipes-extended/wget/wget.inc                |    6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.7.6.4



