Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1UT9E7-0005uu-I0
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 13:11:40 +0200
Received: from cpebcc8100de718-cmbcc8100de715.cpe.net.cable.rogers.com
	([99.240.144.66]:58894 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1UT8x7-00024s-Th; Fri, 19 Apr 2013 06:54:01 -0400
Date: Fri, 19 Apr 2013 06:53:59 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <2331359.GEXl2c1JQe@helios>
Message-ID: <alpine.DEB.2.02.1304190647010.5423@oneiric>
References: <alpine.DEB.2.02.1304180833040.10184@oneiric>
	<51701918.8070001@windriver.com>
	<alpine.DEB.2.02.1304181311590.32433@oneiric>
	<2331359.GEXl2c1JQe@helios>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 19 Apr 2013 11:11:48 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 19 Apr 2013, Paul Eggleton wrote:

> On Thursday 18 April 2013 13:14:51 Robert P. J. Day wrote:
> >   if one created a BSP for the MIPS SEAD-3, where would it go? i
> > notice there's no current MIPS-related OE layer anywhere. i'm
> > assuming http://layers.openembedded.org/layerindex/ is the
> > canonical source these days for layer locations, yes? the only
> > MIPS match one gets there is for the qemumips machine.
>
> I guess there isn't one yet, so if you'd like to create and publish
> one, go for it. There's some info on how that should be done in the
> OE layers FAQ:
> http://www.openembedded.org/Layers_FAQ

  short note -- the wiki page "Creating a new Layer":

http://www.openembedded.org/wiki/Creating_a_new_Layer

seems out of date, in that the "Best practices" section refers to
qt4.inc and the QT_SQL_DRIVER_FLAGS variable:

"An example here would be the way Qt 4 database support plugins are
configured - OE-core doesn't have MySQL or PostgreSQL, however meta-oe
does, so meta-oe uses .bbappends to modify a variable
QT_SQL_DRIVER_FLAGS to enable the appropriate plugins. This variable
was added to qt4.inc in OE-core specifically to allow meta-oe to be
able to control which plugins are built."

  i don't think so:

$ git show 64c6887ca19d2ce52e538186c93163dddf68438f
commit 64c6887ca19d2ce52e538186c93163dddf68438f
Author: Paul Eggleton <paul.eggleton@linux.intel.com>
Date:   Wed Apr 10 15:57:59 2013 +0000

    qt4: remove bbappend content

    These changes to Qt's configuration need to be applied in distro layers,
    not in meta-oe.

    (We have to preserve the PRINC value to avoid PR going backwards.)

    Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

  might want to pick a different example.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



