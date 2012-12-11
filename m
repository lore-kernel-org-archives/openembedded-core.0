Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TiMP2-0006zW-C9
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 10:45:29 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2012 01:30:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,258,1355126400"; d="scan'208";a="232133873"
Received: from unknown (HELO helios.localnet) ([10.252.122.186])
	by orsmga001.jf.intel.com with ESMTP; 11 Dec 2012 01:30:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ciprian Ciubotariu <cheepeero@gmx.net>
Date: Tue, 11 Dec 2012 09:30:53 +0000
Message-ID: <4610754.7ihuexEZvz@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-19-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <6320134.5f19h5zvPL@helios>
References: <1354891455-6846-1-git-send-email-cheepeero@gmx.net>
	<20121211091841.GC11693@jama.jama.net> <6320134.5f19h5zvPL@helios>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagroup-base: use virtual runtime instead of keymap
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
X-List-Received-Date: Tue, 11 Dec 2012 09:45:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 11 December 2012 09:28:47 Paul Eggleton wrote:
> On Tuesday 11 December 2012 10:18:41 Martin Jansa wrote:
> > On Fri, Dec 07, 2012 at 04:44:15PM +0200, Ciprian Ciubotariu wrote:
> > > ---
> > > 
> > >  .../packagegroups/packagegroup-base.bb             |    2 +-
> > >  1 files changed, 1 insertions(+), 1 deletions(-)
> > > 
> > > diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb
> > > b/meta/recipes-core/packagegroups/packagegroup-base.bb index
> > > 347a7e1..3e75190 100644
> > > --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> > > +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> > > @@ -141,7 +141,7 @@ RRECOMMENDS_packagegroup-machine-base =
> > > "${MACHINE_EXTRA_RRECOMMENDS}">
> > > 
> > >  SUMMARY_packagegroup-base-keyboard = "Keyboard support"
> > >  RDEPENDS_packagegroup-base-keyboard = "\
> > > 
> > > -    keymaps"
> > > +    ${VIRTUAL-RUNTIME_keymaps}"
> > 
> > you need to specify default value with weak assignment like
> > packagegroup-core-boot.bb does
> 
> Also, could you please include a commit message explaining why this is
> needed?

Ah, well; not so much why this is needed but explaining that this makes it 
consistent with packagegroup-core-boot.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


