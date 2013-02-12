Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U5DIw-0006ms-Tq
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 11:41:39 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Feb 2013 02:25:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,648,1355126400"; d="scan'208";a="290009306"
Received: from unknown (HELO helios.localnet) ([10.252.120.87])
	by fmsmga002.fm.intel.com with ESMTP; 12 Feb 2013 02:25:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Michael Halstead <michael@yoctoproject.org>
Date: Tue, 12 Feb 2013 10:25:36 +0000
Message-ID: <14326388.Z19Xs56ox2@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-23-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <511A176D.2020207@yoctoproject.org>
References: <50D17BD22A23EE4A887974F6B5882038855FB4BE@ALA-MBB.corp.ad.wrs.com>
	<CAK18fxFJBGM5=bqy=LJuYff0XbSdpTR5poyHLpCs4ySNFcGBTQ@mail.gmail.com>
	<511A176D.2020207@yoctoproject.org>
MIME-Version: 1.0
Cc: openembedded <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 12 Feb 2013 10:41:48 -0000
X-List-Received-Date: Tue, 12 Feb 2013 10:41:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 12 February 2013 02:20:29 Michael Halstead wrote:
> On 02/11/2013 06:57 AM, Andrei Gherzan wrote:
> > On Mon, Feb 11, 2013 at 4:43 PM, Paul Eggleton
> > <paul.eggleton@linux.intel.com <mailto:paul.eggleton@linux.intel.com>>
> > 
> > wrote:
> >     On Monday 11 February 2013 16:01:10 Andrei Gherzan wrote:
> >     > On Mon, Feb 11, 2013 at 3:10 PM, Sarbu, Florin-Ionut (Florin) <
> >     > Florin.Sarbu@windriver.com <mailto:Florin.Sarbu@windriver.com>>
> >     
> >     wrote:
> >     > > On Monday, February 11, 2013 02:51 AM Andrei Gherzan wrote:
> >     > > > In denzil SRC_URI for qt4.8.0 uses:
> >     http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.t
> >     ar.g
> >     <http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-$%7BPV
> >     %7D.tar.g>>     
> >     > > > z
> >     > > > 
> >     > > >  This source seems to be outdated and replaced by:
> >     > > > http://releases.qt-project.org/qt4/source/
> >     > > > 
> >     > > >  The problem is that the new location doesn't include the
> >     
> >     4.8.0 release.
> >     
> >     > > >  qt-everywhere-opensource-src-4.6.4.tar.gz
> >     > > >  qt-everywhere-opensource-src-4.8.1.tar.gz
> >     > > >  qt-everywhere-opensource-src-4.8.2.tar.gz
> >     > > >  qt-everywhere-opensource-src-4.8.3.tar.gz
> >     > > >  qt-everywhere-opensource-src-4.8.4.tar.gz
> >     > > >  
> >     > > >  So right now qt4 in denzil is not fetch-able anymore.
> >     > >  
> >     > >  Use git
> >     > 
> >     > We are not talking about switching of sources. I want to know
> >     
> >     why 4.8.0 is
> >     
> >     > not on yocto mirror.
> >     
> >     It should be there, not sure why it isn't.
> >     
> >     Michael, could you please upload qt 4.8.0 and anything else
> >     downloaded by
> >     "bitbake -c fetchall world" for the denzil-7.0.2 release into the
> >     mirror?
> 
> I ran fetchall world and poky 7.0.2 uses
> qt-everywhere-opensource-src-4.7.4.tar.gz which was already present at
> http://downloads.yoctoproject.org/mirror/sources/. Every file downloaded
> was already present on the mirror.

Ah, now I remember - with denzil, Qt 4.7.4 was the default and 4.8.0 was an 
option.

> I downloaded qt-everywhere-opensource-src-4.8.0.tar.gz from a Fedora
> Project mirror and added it to
> http://downloads.yoctoproject.org/mirror/sources/ so we'd have it.

Thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


