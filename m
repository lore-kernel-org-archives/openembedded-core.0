Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QtTfW-0007gT-Ia
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 02:07:38 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2011 17:02:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,236,1312182000"; 
   d="scan'208";a="7928888"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.13.244])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2011 17:02:59 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 17:02:48 -0700
Message-Id: <cover.1313539219.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] Switch SRC_URI for shadow as current uri is not avaiable
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
X-List-Received-Date: Wed, 17 Aug 2011 00:07:38 -0000

When running a build this afternoon I was unable to fetch shadow, checking
the shadow home page I saw their download page lists a differen URI than we
have in the metadata so this patch changes the metadata to match the URI
referred to on the shadow home page.

Cheers,
Joshua

The following changes since commit 13db5f420ca9bff98561f80d78958278734ad1f4:

  distro-tracking: Update info for gpgme, libassuan, apr... after last upgrade. (2011-08-15 15:26:04 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/work
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work

Joshua Lock (1):
  shadow: switch to a fetchable SRC_URI

 .../shadow/shadow-native_4.1.4.3.bb                |    2 +-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.6



