Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1Rif8F-0003Sx-U1
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 05:40:52 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jan 2012 20:33:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108920508"
Received: from edwin-gen.sh.intel.com (HELO edwin-gen) ([10.239.36.111])
	by fmsmga002.fm.intel.com with SMTP; 04 Jan 2012 20:33:27 -0800
Received: by edwin-gen (sSMTP sendmail emulation);
	Thu, 05 Jan 2012 12:32:42 +0800
Date: Thu, 5 Jan 2012 12:32:42 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120105043242.GB10415@edwin-gen>
References: <cover.1325145929.git.edwin.zhai@intel.com>
	<4F0395C0.4020805@linux.intel.com> <4F03A2A3.80408@intel.com>
	<1325676148.3555.127.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1325676148.3555.127.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 0/2] Bug fixes
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
X-List-Received-Date: Thu, 05 Jan 2012 04:40:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 04, 2012 at 11:22:28AM +0000, Richard Purdie wrote:
> On Wed, 2012-01-04 at 08:51 +0800, Zhai, Edwin wrote:
> > On 01/04/2012 07:56 AM, Saul Wold wrote:
> > > On 12/29/2011 12:09 AM, edwin.zhai@intel.com wrote:
> > >> From: Zhai Edwin<edwin.zhai@intel.com>
> > >>
> > >> All,
> > >> Patch of gnome-keyring to fix gsettings-data-convert seg fault,
> > >> modified according to Saul's comments.
> > >> Another patch of matchbox-wm to remove the dependence between window
> > >> manager and X session.
> > >>
> > >> The following changes since commit
> > >> 6a1b5c28f22bb07a0b7102eb88441d05768ec52e:
> > >>
> > >> self-hosted-image: Add builder user and mini X (2011-12-29 10:42:07
> > >> +0800)
> > >>
> > >> are available in the git repository at:
> > >> git://git.pokylinux.org/poky-contrib gzhai/build-appliance2
> > >> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/build-appliance2
> > >>
> > >>
> > >> Zhai Edwin (2):
> > >> gnome-keyring: fix gsettings_data_convert seg fault
> > >
> > > Merged this one to OE-Core
> > >
> > >> matchbox-wm: Remove x-session-manager handling
> > >>
> > > We need a little more explaintion about why you are removing the U-A
> > > code from the matchbox-wm?
> > 
> > matchbox-wm should not handles x-session, or else it conflict with 
> > mini-x-session. i.e. mini-x-session set x-session to mini-X, then 
> > matchbox-wm overrides it as matchbox-session. Without matchbox-session 
> > installed, mini-X fail start.
> > 
> > I have tested this patch and found no regression...
> 
> What I don't understand is that this is using update-alternatives so
> surely you can just install an alternative that overrides this?
> 
> Looking at the code, shouldn't we move this alternative to the
> matchbox-session recipe?

There are indential code in matchbox-session already. This patch is just 
removing duplicated code. I'll send out new patch to promote mini-x's 
alternative priority over matchbox-session.

Thanks,
Edwin

> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
best rgds,
edwin


