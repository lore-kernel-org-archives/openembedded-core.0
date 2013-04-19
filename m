Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UT9TN-0007Il-IG
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 13:27:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Apr 2013 04:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,508,1363158000"; d="scan'208";a="297454765"
Received: from unknown (HELO helios.localnet) ([10.255.13.209])
	by orsmga001.jf.intel.com with ESMTP; 19 Apr 2013 04:09:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 19 Apr 2013 12:09:07 +0100
Message-ID: <2375821.Mtker55D4M@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1304190647010.5423@oneiric>
References: <alpine.DEB.2.02.1304180833040.10184@oneiric>
	<2331359.GEXl2c1JQe@helios>
	<alpine.DEB.2.02.1304190647010.5423@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: tweaking insane.bbclass to handle MIPS SEAD-3?
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
X-List-Received-Date: Fri, 19 Apr 2013 11:28:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 19 April 2013 06:53:59 Robert P. J. Day wrote:
> On Fri, 19 Apr 2013, Paul Eggleton wrote:
> > On Thursday 18 April 2013 13:14:51 Robert P. J. Day wrote:
> > >   if one created a BSP for the MIPS SEAD-3, where would it go? i
> > > 
> > > notice there's no current MIPS-related OE layer anywhere. i'm
> > > assuming http://layers.openembedded.org/layerindex/ is the
> > > canonical source these days for layer locations, yes? the only
> > > MIPS match one gets there is for the qemumips machine.
> > 
> > I guess there isn't one yet, so if you'd like to create and publish
> > one, go for it. There's some info on how that should be done in the
> > OE layers FAQ:
> > http://www.openembedded.org/Layers_FAQ
> 
>   short note -- the wiki page "Creating a new Layer":
> 
> http://www.openembedded.org/wiki/Creating_a_new_Layer
> 
> seems out of date, in that the "Best practices" section refers to
> qt4.inc and the QT_SQL_DRIVER_FLAGS variable:
> 
> "An example here would be the way Qt 4 database support plugins are
> configured - OE-core doesn't have MySQL or PostgreSQL, however meta-oe
> does, so meta-oe uses .bbappends to modify a variable
> QT_SQL_DRIVER_FLAGS to enable the appropriate plugins. This variable
> was added to qt4.inc in OE-core specifically to allow meta-oe to be
> able to control which plugins are built."
> 
>   i don't think so:
> 
> $ git show 64c6887ca19d2ce52e538186c93163dddf68438f
> commit 64c6887ca19d2ce52e538186c93163dddf68438f
> Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> Date:   Wed Apr 10 15:57:59 2013 +0000
> 
>     qt4: remove bbappend content
> 
>     These changes to Qt's configuration need to be applied in distro layers,
> not in meta-oe.
> 
>     (We have to preserve the PRINC value to avoid PR going backwards.)
> 
>     Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
>   might want to pick a different example.

Ah yes, I looked at that recently and made a mental note to change it which I 
then promptly forgot. It's fixed now (using the same example, but mentioning 
where the appends should go), thanks for pointing this out.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


