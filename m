Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SWyeU-0005SE-Cf
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 01:38:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 May 2012 16:27:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146495023"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.180])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 16:27:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 00:27:53 +0100
Message-Id: <cover.1337729156.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Implement file checksums (OE-Core part)
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
X-List-Received-Date: Tue, 22 May 2012 23:38:06 -0000

The remaining third of the changes to implement local file checksums -
the other 2/3 are against BitBake and have been sent to the
bitbake-devel mailing list.


The following change since commit e6333825c3482a559a0c0499e17f8f48d3042ddf:

  tune-mips64.inc: Add new tune file for mips64 big-endian (2012-05-20 20:24:37 -0700)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/file-checksum-oecore
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/file-checksum-oecore

Paul Eggleton (1):
  classes/base: add checksum file list at parse time

 meta/classes/base.bbclass |    1 +
 1 file changed, 1 insertion(+)

-- 
1.7.9.5



