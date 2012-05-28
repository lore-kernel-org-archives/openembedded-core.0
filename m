Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SZ3d4-0004Qk-5I
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 19:21:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 May 2012 10:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157958439"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.22])
	by fmsmga001.fm.intel.com with ESMTP; 28 May 2012 10:10:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2012 18:10:49 +0100
Message-Id: <cover.1338224754.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] sanity.bbclass improvements for Hob
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
X-List-Received-Date: Mon, 28 May 2012 17:21:14 -0000

The following changes since commit 363424cdc78cafa278008f973c2b4288297ebf8c:

  image.bbclass: Ensure ${S} is cleaned at the start of rootfs generation (2012-05-25 11:28:00 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/hob-sanity-oecore
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/hob-sanity-oecore

Paul Eggleton (2):
  classes/sanity: send sanity check failure as a separate event for Hob
  classes/sanity: fix a couple of grammatical errors in messages

 meta/classes/sanity.bbclass |   20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

-- 
1.7.9.5



