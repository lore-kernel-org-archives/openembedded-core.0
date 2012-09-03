Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8RcF-0003bG-K7
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 10:02:39 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2012 00:50:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217452608"
Received: from unknown (HELO helios.localnet) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 00:50:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 03 Sep 2012 08:49:26 +0100
Message-ID: <1624899.nqBzdK1tX0@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <20120903072317.GD3205@jama.jama.net>
References: <cover.1346584261.git.Martin.Jansa@gmail.com>
	<3830362.NxTCTzAyLx@helios> <20120903072317.GD3205@jama.jama.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] sstate-cache-management.sh: look in meta* above oe-core dir when looking for available tunes
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
X-List-Received-Date: Mon, 03 Sep 2012 08:02:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 03 September 2012 09:23:17 Martin Jansa wrote:
> On Sun, Sep 02, 2012 at 01:07:53PM +0100, Paul Eggleton wrote:
> > On Sunday 02 September 2012 13:13:20 Martin Jansa wrote:
> > > * many layouts have other layers on the same level as oe-core checkout
> > 
> > This is beginning to indicate that this script really needs to actually
> > know something about your configuration rather than trying to guess it.
> You can pass more layers to script with:
> 
>   --extra-layer=<layer1>,<layer2>...<layern>
>         Specify the layer which will be used for searching the archs,
>         it will search the meta and meta-* layers in the top dir by
>         default, and will search meta, meta-*, <layer1>, <layer2>,
>         ...<layern> when specified. Use "," as the separator.
> 
> But nobody says what is "top dir", in my bblayers.conf it's the
> directory with oe-core and meta-* checkouts and I think this is common
> layout if you're not using some combo tool to merge all layers to
> oe-core checkout.
> 
> So this change only makes default search path a bit more usefull and
> then it filteres available arch anyway.

I don't dispute that your change is an improvement, I just think it would be a 
good future improvement to pick up the configuration from bitbake rather than 
working in the way it currently does.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


