Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SkHh5-000103-1z
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 18:35:47 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Jun 2012 09:24:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117005697"
Received: from unknown (HELO helios.localnet) ([10.252.120.222])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jun 2012 09:24:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 17:24:48 +0100
Message-ID: <10317249.W4Cacltz0J@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <F7D3BA9A-464D-4DC2-BD70-84D2D10FBF16@dominion.thruhere.net>
References: <1340876879-3690-1-git-send-email-jackie.huang@windriver.com>
	<1340876879-3690-2-git-send-email-jackie.huang@windriver.com>
	<F7D3BA9A-464D-4DC2-BD70-84D2D10FBF16@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 2/2] ruby: Add ruby 1.9.3 recipe
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
X-List-Received-Date: Thu, 28 Jun 2012 16:35:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 28 June 2012 18:02:47 Koen Kooi wrote:
> Op 28 jun. 2012, om 11:47 heeft <jackie.huang@windriver.com> 
<jackie.huang@windriver.com> het volgende geschreven:
> > From: Jackie Huang <jackie.huang@windriver.com>
> > 
> > Took ruby 1.8.7 from OE and updated to 1.9.3-p194.
> > Most of the 1.9.3 patches originate from ruby-1.9.3.194-10.1.fc17.src.rpm
> 
> Is ruby something that belongs into oe-core?

I was thinking the same thing - it's not something that everyone needs, so 
really it doesn't belong there IMHO.

Where it should go is another question. If we would expect to add lots of 
supplementary ruby recipes in future then perhaps its own layer would be 
appropriate; otherwise I guess it can go into meta-oe.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


