Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Si4oV-00049l-5n
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 16:26:19 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Jun 2012 07:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115042937"
Received: from unknown (HELO helios.localnet) ([10.252.120.123])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Jun 2012 07:15:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2012 15:15:29 +0100
Message-ID: <3297658.NN3oiPzfJJ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
MIME-Version: 1.0
Subject: RFC: removing buildhistory support for flat versioned package info
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
X-List-Received-Date: Fri, 22 Jun 2012 14:26:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

One feature carried over from packagehistory.bbclass into buildhistory.bbclass 
was the ability for it to optionally output PE:PV-PR named package info files 
and then create a "latest" symlink to the latest one, which was useful in the 
absence of the integration with git which buildhistory now has. This can 
currently be enabled by setting BUILDHISTORY_KEEP_VERSIONS to 1.

I suspect not many people even know this feature exists let alone use it, and 
looking at the code it could be simplified a bit by not supporting it at all. 
Are there any objections to removing it?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


