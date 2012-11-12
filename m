Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TXq0u-0007Ym-IQ
	for openembedded-core@lists.linuxtogo.org;
	Mon, 12 Nov 2012 10:09:10 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Nov 2012 00:54:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,761,1344236400"; d="scan'208";a="218182674"
Received: from unknown (HELO helios.localnet) ([10.252.122.159])
	by orsmga001.jf.intel.com with ESMTP; 12 Nov 2012 00:54:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Nov 2012 08:54:03 +0000
Message-ID: <5245949.8fOfhN9Jo3@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <CAP9ODKoiaAJzAZEcH0doQkNZSXuqaOzM0_rsopLCswR-uHOOAA@mail.gmail.com>
References: <12301427.Yf0uchSh3U@helios> <4701269.Boc8pSq2zM@helios>
	<CAP9ODKoiaAJzAZEcH0doQkNZSXuqaOzM0_rsopLCswR-uHOOAA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.linuxtogo.org,
	Martin Jansa <martin.jansa@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [oe] OE-Classic recipe migration status
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
X-List-Received-Date: Mon, 12 Nov 2012 09:09:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 11 November 2012 21:24:55 Otavio Salvador wrote:
> On Sun, Nov 11, 2012 at 6:49 PM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
> > On Sunday 11 November 2012 21:16:13 Martin Jansa wrote:
> > > I've noticed e.g this:
> > > libfsobasics  [distro]
> > > libfsoresource        [distro]
> > > libfsosystem  [distro]
> > > libfsotransport       [distro]
> > > but those are now provided by single libfsoframework recipe and I've
> > > forgot this change
> > 
> > https://github.com/shr-distribution/meta-smartphone/commit/0298befc97dc5dc
> > a2> 
> > > a3721fb0ff9d4caf8d24f84
> > > 
> > > So I'll just update [distro] flag to something like obsoleted by
> > > libfsoframework.
> > 
> > Ah ok, sounds good.

FYI I've updated these entries now.

> > > The rest is probably also not 1:1 like qfsodbusxml2cpp-native
> > > ./meta-fso/recipes-freesmartphone/freesmartphone/qfsodbusxml2cpp_git.bb
> > > 
> > > Maybe you can try to update scripts to show matches after "-native"
> > > suffix strip?
> > 
> > I'd prefer to handle this manually - there are cases when newer recipes
> > haven't been BBCLASSEXTENDed to handle -native so I've been checking this
> > by hand.
> 
> You might grep for it and match it properly. So it drops a manual step.

OK, I've added some script code to check for BBCLASSEXTEND and have added 
notes next to the following items that I had missed:

cup-native
devio-native
jamvm-native
jlex-native
python-pygobject-native
qfsodbusxml2cpp-native
usbpath-native

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


