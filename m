Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TiMMz-0006ur-EY
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 10:43:21 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Dec 2012 01:28:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,258,1355126400"; d="scan'208";a="260410318"
Received: from unknown (HELO helios.localnet) ([10.252.122.186])
	by fmsmga001.fm.intel.com with ESMTP; 11 Dec 2012 01:28:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ciprian Ciubotariu <cheepeero@gmx.net>
Date: Tue, 11 Dec 2012 09:28:47 +0000
Message-ID: <6320134.5f19h5zvPL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-19-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <20121211091841.GC11693@jama.jama.net>
References: <1354891455-6846-1-git-send-email-cheepeero@gmx.net>
	<20121211091841.GC11693@jama.jama.net>
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
X-List-Received-Date: Tue, 11 Dec 2012 09:43:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 11 December 2012 10:18:41 Martin Jansa wrote:
> On Fri, Dec 07, 2012 at 04:44:15PM +0200, Ciprian Ciubotariu wrote:
> > ---
> > 
> >  .../packagegroups/packagegroup-base.bb             |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb
> > b/meta/recipes-core/packagegroups/packagegroup-base.bb index
> > 347a7e1..3e75190 100644
> > --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> > +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> > @@ -141,7 +141,7 @@ RRECOMMENDS_packagegroup-machine-base =
> > "${MACHINE_EXTRA_RRECOMMENDS}"> 
> >  SUMMARY_packagegroup-base-keyboard = "Keyboard support"
> >  RDEPENDS_packagegroup-base-keyboard = "\
> > 
> > -    keymaps"
> > +    ${VIRTUAL-RUNTIME_keymaps}"
> 
> you need to specify default value with weak assignment like
> packagegroup-core-boot.bb does

Also, could you please include a commit message explaining why this is needed?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


