Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q4HRf-0005U9-2t
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 20:45:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Mar 2011 11:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,257,1299484800"; d="scan'208";a="726114603"
Received: from scimitar.isw.intel.com (HELO [10.237.224.30]) ([10.237.224.30])
	by orsmga001.jf.intel.com with ESMTP; 28 Mar 2011 11:43:44 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Mar 2011 19:43:43 +0100
In-Reply-To: <201103281944.03722.schnitzeltony@gmx.de>
References: <cover.1301322225.git.josh@linux.intel.com>
	<201103281944.03722.schnitzeltony@gmx.de>
X-Mailer: Evolution 2.91.92 (2.91.92-1.fc15) 
Message-ID: <1301337825.6397.15.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 0/4] Recipes for Clutter 1.6
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
X-List-Received-Date: Mon, 28 Mar 2011 18:45:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-28 at 19:44 +0200, Andreas Mueller wrote:
> On Monday 28 March 2011 16:28:23 Joshua Lock wrote:
> > From: Joshua Lock <josh@linux.intel.com>
> > 
> > The attached series of patches adds recipes for Clutter 1.6 and versions of
> > clutter-box2d and clutter-gst which build against it.
> > 
> > Pull URL: git://git.openembedded.org/openembedded-core-contrib
> >   Branch: josh/clutter
> >   Browse:
> > http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh
> > /clutter
> > 
> > Thanks,
> >     Joshua Lock <josh@linux.intel.com>
> > ---
> > 
> > 
> > Joshua Lock (4):
> >   clutter: add 1.6.8
> >   clutter-gst: add 1.3.6 for use with clutter 1.6
> >   clutter-box2d: add version 0.10.0 for use with clutter 1.6
> >   clutter-gtk: remove duplicate gtk+ DEPENDS entry
> > 
> >  meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb |   25
> > +++++++++++++++++ .../clutter/clutter-box2d-1.6_0.10.0.bb            |  
> > 20 ++++++++++++++ meta/recipes-graphics/clutter/clutter-box2d.inc    |   
> > 4 +-
> >  .../clutter-box2d/fix-disable-introspection.patch  |   28
> > ++++++++++++++++++++ meta/recipes-graphics/clutter/clutter-box2d_git.bb | 
> >   2 +-
> >  .../clutter/clutter-gst-1.6_1.3.6.bb               |   16 +++++++++++
> >  meta/recipes-graphics/clutter/clutter-gst.inc      |    3 +-
> >  .../clutter/clutter-gtk-1.4_git.bb                 |    2 +-
> >  8 files changed, 95 insertions(+), 5 deletions(-)
> >  create mode 100644 meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
> >  create mode 100644
> > meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb create mode
> > 100644
> > meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patc
> > h create mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb
> Is version in recipe name really required (it clutters all the dependent 
> recipes)?

I'm just following precedent set by the existing recipes in oe-core. I'm
not particularly fond of it myself either.

I'm not sure if we're able to set a specific recipe version in the
DEPENDS without doing something like this, however. At least if we can
do it I've not seen it.

Regards,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



