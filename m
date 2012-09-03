Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8UVM-0006qH-N8
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 13:07:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Sep 2012 03:55:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="188178842"
Received: from unknown (HELO helios.localnet) ([10.252.121.155])
	by azsmga001.ch.intel.com with ESMTP; 03 Sep 2012 03:55:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <philb@gnu.org>
Date: Mon, 03 Sep 2012 11:54:30 +0100
Message-ID: <1554049.jPb4PTGYOQ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1346669402.2673.122.camel@phil-desktop>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
	<2466289.CAG9RzjSbc@helios>
	<1346669402.2673.122.camel@phil-desktop>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 15/28] packagegroup-base: remove openswan from packagegroup-base-ipsec
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
X-List-Received-Date: Mon, 03 Sep 2012 11:07:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 03 September 2012 11:50:01 Phil Blundell wrote:
> On Mon, 2012-09-03 at 11:37 +0100, Paul Eggleton wrote:
> > On Monday 03 September 2012 11:35:24 Phil Blundell wrote:
> > > On Mon, 2012-09-03 at 11:30 +0100, Paul Eggleton wrote:
> > > > openswan was only ever provided in unmaintained form in meta-demoapps
> > > > which has been removed, so we never really provided it in OE-Core.
> > > 
> > > Isn't packagegroup-base-ipsec rather useless without it?
> > 
> > If you ignore the RRECOMMENDS line that follows, yes.
> 
> Is there a meaningful use-case where installing kernel-module-ipsec
> without any user-space support is a desirable thing to do?  And, even if
> the answer is yes, is it really valuable to have a
> packagegroup-base-ipsec which just recommends a single other package
> without doing anything else?

The idea is supposed to be that just having "ipsec" in DISTRO_FEATURES brings 
in what we can to support IPsec, assuming your image uses packagegroup-base 
that is.

I'd be more than happy if we went the other way and decided that IPsec was 
something worth fully supporting in OE-Core, and brought in the corresponding 
user-space bits as a result; but that's somewhat outside of the scope of this 
work.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


