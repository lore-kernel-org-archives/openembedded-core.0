Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U4ryz-0005Bn-ND
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 12:55:38 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Feb 2013 03:39:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,641,1355126400"; d="scan'208";a="284138693"
Received: from unknown (HELO helios.localnet) ([10.252.120.60])
	by orsmga002.jf.intel.com with ESMTP; 11 Feb 2013 03:39:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 11 Feb 2013 11:39:36 +0000
Message-ID: <7962536.2U1dKqZXgW@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-23-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <CAK18fxHKRNBWXuY+p7R1uxsQwJVFh-aKLG=WMQNqtxT5bCeh+Q@mail.gmail.com>
References: <CAK18fxFg2a-H5ss43PGNzaK4kEsr0igKpg=3o+xLfiKOPUi+yQ@mail.gmail.com>
	<1360581039.6793.3.camel@ted>
	<CAK18fxHKRNBWXuY+p7R1uxsQwJVFh-aKLG=WMQNqtxT5bCeh+Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 11 Feb 2013 11:55:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 11 February 2013 13:33:19 Andrei Gherzan wrote:
> On Mon, Feb 11, 2013 at 1:10 PM, Richard Purdie <
> 
> richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2013-02-11 at 12:50 +0200, Andrei Gherzan wrote:
> > > In denzil SRC_URI for qt4.8.0 uses:
> > http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.g
> > z
> > 
> > > This source seems to be outdated and replaced
> > > by: http://releases.qt-project.org/qt4/source/
> > > 
> > > The problem is that the new location doesn't include the 4.8.0
> > > release.
> > > qt-everywhere-opensource-src-4.6.4.tar.gz
> > > qt-everywhere-opensource-src-4.8.1.tar.gz
> > > qt-everywhere-opensource-src-4.8.2.tar.gz
> > > qt-everywhere-opensource-src-4.8.3.tar.gz
> > > qt-everywhere-opensource-src-4.8.4.tar.gz
> > > 
> > > So right now qt4 in denzil is not fetch-able anymore.
> > 
> > It should be fetchable from the source mirror at least. Isn't the build
> > falling back to that?
> 
> Seems not. Hm. The real problem is not picking up the mirror as other
> packages fail in the same way too: connman, kmod etc.

Can you check to make sure MIRRORS are still set in your configuration?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


