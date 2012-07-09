Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SoLcA-0004HW-Bz
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 23:35:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 14:24:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175216487"
Received: from unknown (HELO helios.localnet) ([10.252.121.1])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2012 14:24:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 09 Jul 2012 22:23:59 +0100
Message-ID: <2863878.hMO01FTXta@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1207091630380.24097@oneiric>
References: <alpine.DEB.2.02.1207081227430.27741@oneiric>
	<CAK18fxFD1X6tPLsXG-vwRFu-EeEZDTdeKoTKRYAvYrKJfd-_mQ@mail.gmail.com>
	<alpine.DEB.2.02.1207091630380.24097@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: more pedantry -- looking to clarify layers definition, BBPATH, BBFILES, etc.
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
X-List-Received-Date: Mon, 09 Jul 2012 21:35:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 09 July 2012 16:34:20 Robert P. J. Day wrote:
> On Mon, 9 Jul 2012, Andrei Gherzan wrote:
> > It's all about the order the files are searched. As long as you have
> > proper priority set nothing can go wrong.
> 
>   but what if two or more layers have the same priority?  then what?
> it may be that there's no issue here, i'm just pointing out the
> possibility that, given the inconsistent way layers add themelves to
> BBPATH (either prepending or appending) and the order one lists the
> layers in bblayers.conf, is there absolutely no chance that someone
> could experience unexpected behaviour given an unusual combination of
> circumstances?

To avoid confusion, layer priorities are only applicable with regard to 
recipes/bbappends. To respond to your question, if two layers have the same 
priority (which is legal) then if there is a situation where a recipe file is 
provided by both layers, which one "wins" will depend on the order they appear 
in bblayers.conf.

The BBPATH variable is completely independent of this, and is the path that is 
used to find conf and bbclass files; however, the order in which the appends / 
prepends will be applied is of course the order in which they are parsed, 
which is the order in which they appear in bblayers.conf. Most layers should 
be appending to BBPATH rather than prepending but there may be exceptions.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


