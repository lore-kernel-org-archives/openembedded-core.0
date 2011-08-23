Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QvqYX-0000cJ-TU
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 14:58:14 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Aug 2011 05:53:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,269,1312182000"; d="scan'208";a="10145582"
Received: from unknown (HELO helios.localnet) ([10.255.18.129])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2011 05:53:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 23 Aug 2011 13:53:13 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1314096402.git.xiaofeng.yan@windriver.com>
	<201108231318.10118.paul.eggleton@linux.intel.com>
	<63FF64B9-6C5E-4C87-9DFD-7AD9A88A5DD1@dominion.thruhere.net>
In-Reply-To: <63FF64B9-6C5E-4C87-9DFD-7AD9A88A5DD1@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201108231353.13437.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qt4e-demo-image: Fix bug 999
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
X-List-Received-Date: Tue, 23 Aug 2011 12:58:14 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 23 August 2011 13:27:11 you wrote:
> I would lean toward a seperate meta-qt layer, not sure if it should be
> hosted in the oe-core git repo, meta-oe or a completely seperate git repo.

Possibly we should have meta-qt for Qt applications and additional libraries 
such as Qwt (and I'm all for moving our current Qt apps there, they don't 
really belong in OE-core IMHO). If you're suggesting moving out Qt itself 
though, I think Qt belongs in OE-core, certainly as much as GTK+ does.

The purpose of having these images was to have a simple way to test that Qt 
has built correctly and is functional. If Qt is in OE-core I don't think 
that's unreasonable.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


