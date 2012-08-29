Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T6lpe-0002gS-CA
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 19:13:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Aug 2012 10:01:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,335,1344236400"; d="scan'208";a="186514607"
Received: from unknown (HELO helios.localnet) ([10.252.121.163])
	by azsmga001.ch.intel.com with ESMTP; 29 Aug 2012 10:01:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Aug 2012 18:01:16 +0100
Message-ID: <4976204.OdG2Ohk3KU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
	<CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2012 17:13:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 29 August 2012 17:57:16 Burton, Ross wrote:
> On 29 August 2012 17:50, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > Ehm, I *really* want it to be a symlink, that way you easily check what
> > the timezone is without needing to boot the device or compare md5sums.
> > The last thing the TSC said on the split /usr was something along the
> > lines of "would be nice, but only if it doesn't make things worse". A cp
> > instead of ln would make things worse IMO.
>
> I'm all in favour of dropping the / and /usr split.  If we get a
> definitive direction we can stop these arguments. :)

Well, the TSC as a group is still keen on supporting it last time it was 
discussed (a few meetings ago) as Koen mentions.

Surely this specific situation is pretty easy to solve for everyone using a 
postinst which is able to apply some logic - i.e. if the file is on a separate 
filesystem then cp the file, otherwise symlink it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


