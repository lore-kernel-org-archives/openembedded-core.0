Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QMMvi-0008Qf-QC
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 18:15:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 May 2011 09:12:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,226,1304319600"; d="scan'208";a="437595454"
Received: from unknown (HELO helios.localnet) ([10.255.16.110])
	by azsmga001.ch.intel.com with ESMTP; 17 May 2011 09:12:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Organization: Intel Corporation (UK)
To: "Yu, Ke" <ke.yu@intel.com>
Date: Tue, 17 May 2011 17:12:31 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
MIME-Version: 1.0
Message-Id: <201105171712.31423.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Qt4 mips-relocate.patch
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
X-List-Received-Date: Tue, 17 May 2011 16:15:32 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi there,

I was going through patches for Qt4 and found that (among others) mips-
relocate.patch was not being applied for Qt 4.7.x. From the comment it seems 
it was intended to fix a link-time error when building qt4-x11-free for mips - 
some kind of issue with binutils 2.20 [1]. However I just built qt4-x11-free 
4.7.3 with MACHINE=qemumips without the patch and it built just fine. We're 
using binutils 2.21 now, I checked and there is nothing relevant that I can 
see in the binutils changelog to suggest that a mips/symbolic-functions issue 
was fixed, and we are apparently still enabling the option that originally 
triggered the problem when building Qt 4.7.x.

Ke / anyone else, any ideas? If the problem can no longer reproduced can we 
simply remove this patch?

Cheers,
Paul

[1] http://bugzilla.pokylinux.org/show_bug.cgi?id=271

-- 

Paul Eggleton
Intel Open Source Technology Centre


