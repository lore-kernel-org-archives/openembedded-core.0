Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U4uqq-0001jC-Df
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 15:59:25 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 11 Feb 2013 06:43:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,643,1355126400"; d="scan'208";a="255435802"
Received: from unknown (HELO helios.localnet) ([10.252.120.60])
	by azsmga001.ch.intel.com with ESMTP; 11 Feb 2013 06:43:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Michael Halstead <michael@yoctoproject.org>
Date: Mon, 11 Feb 2013 14:43:23 +0000
Message-ID: <3827804.EL3IkEV3FJ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-23-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <CAK18fxFaVeETyzWOCK0j3q3iVZUZxygbwoiREPcK-jfbsWNAjg@mail.gmail.com>
References: <50D17BD22A23EE4A887974F6B5882038855FB4BE@ALA-MBB.corp.ad.wrs.com>
	<CAK18fxFaVeETyzWOCK0j3q3iVZUZxygbwoiREPcK-jfbsWNAjg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [denzil] qt 4.8.0 is not available from source anymore
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
X-List-Received-Date: Mon, 11 Feb 2013 14:59:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 11 February 2013 16:01:10 Andrei Gherzan wrote:
> On Mon, Feb 11, 2013 at 3:10 PM, Sarbu, Florin-Ionut (Florin) <
> Florin.Sarbu@windriver.com> wrote:
> > On Monday, February 11, 2013 02:51 AM Andrei Gherzan wrote:
> > > 
> > > In denzil SRC_URI for qt4.8.0 uses:
> > > http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.g
> > > z
> > > 
> > >  This source seems to be outdated and replaced by:
> > > http://releases.qt-project.org/qt4/source/
> > > 
> > >  The problem is that the new location doesn't include the 4.8.0 release.
> > >  qt-everywhere-opensource-src-4.6.4.tar.gz
> > >  qt-everywhere-opensource-src-4.8.1.tar.gz
> > >  qt-everywhere-opensource-src-4.8.2.tar.gz
> > >  qt-everywhere-opensource-src-4.8.3.tar.gz
> > >  qt-everywhere-opensource-src-4.8.4.tar.gz
> > >  
> > >  So right now qt4 in denzil is not fetch-able anymore.
> > 
> >  Use git
> 
> We are not talking about switching of sources. I want to know why 4.8.0 is
> not on yocto mirror.

It should be there, not sure why it isn't.

Michael, could you please upload qt 4.8.0 and anything else downloaded by 
"bitbake -c fetchall world" for the denzil-7.0.2 release into the mirror?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


