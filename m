Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TYE9v-00046x-Ee
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 11:55:59 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2012 02:42:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,765,1344236400"; d="scan'208";a="248308582"
Received: from unknown (HELO helios.localnet) ([10.252.122.166])
	by fmsmga002.fm.intel.com with ESMTP; 13 Nov 2012 02:42:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <philb@gnu.org>
Date: Tue, 13 Nov 2012 10:42:02 +0000
Message-ID: <1509472.8pSTkUQEym@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <1352758235.6869.152.camel@x121e.pbcl.net>
References: <12301427.Yf0uchSh3U@helios>
	<1352758235.6869.152.camel@x121e.pbcl.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: OE-Classic recipe migration status
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
X-List-Received-Date: Tue, 13 Nov 2012 10:55:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 12 November 2012 22:10:35 Phil Blundell wrote:
> On Sun, 2012-11-11 at 19:11 +0000, Paul Eggleton wrote:
> >     136 PERL
> 
> I encountered the horror that is the perl modules a few weeks ago while
> I was working on mythtv.  At the time it seemed as though there were
> more like 13600 recipes but I imagine your figure is probably the
> accurate one.  It looks as though I managed to fix up 37 recipes to work
> with oe-core before the tedium got too much.

I'm only counting recipes with "perl" in the name, there could be others but I 
suspect that has caught most of them.

> I think this stuff probably wants to go into a dedicated
> meta-perl-modules layer since in most cases there is no obvious
> functional grouping.  

Sounds good.

> I could publish those 37 as a starting point and
> anybody else who wants to add more is welcome to do so.

Great, thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


