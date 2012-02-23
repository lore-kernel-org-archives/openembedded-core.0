Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S0asi-0003ev-Ss
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 16:46:57 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Feb 2012 07:38:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="111227746"
Received: from unknown (HELO helios.localnet) ([10.252.123.61])
	by orsmga001.jf.intel.com with ESMTP; 23 Feb 2012 07:38:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 15:38:33 +0000
Message-ID: <2076050.yMvNPjVBiI@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <2217377.xs2ypPJBB4@helios>
References: <CAMvUbCwy5UL3YWXS=2SkeKff2WDQE9EX7-CGUv9s5SH+9uSK1g@mail.gmail.com>
	<20120223163032.0822e104@eb-e6520> <2217377.xs2ypPJBB4@helios>
MIME-Version: 1.0
Subject: Re: bitbake parsing of IMAGE_INSTALL += # tslib mtd-utils" extremely user unfriendly.
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
X-List-Received-Date: Thu, 23 Feb 2012 15:46:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 23 February 2012 15:32:47 Paul Eggleton wrote:
> > Basically I had :
> > XSERVER += "    <==== missing \
> > 
> > 	xf86-input-tslib \
> > 	"
> > 
> > and bitbake exit with :
> > ERROR: Command execution failed: Exited with 1
> > et nothing more.
> 
> This got broken last night and fixed last night, so if you update you should
> have the fix.

Er, actually that's completely false. However I do have a bitbake patch ready 
to submit to fix this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


