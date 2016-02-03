Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A9AFD7719E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 15:43:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 03 Feb 2016 07:44:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,391,1449561600"; d="scan'208";a="904774943"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 03 Feb 2016 07:43:59 -0800
Date: Wed, 3 Feb 2016 17:46:32 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160203154632.GB21051@mbabyjoh-mobl.fi.intel.com>
References: <1454495408-23334-1-git-send-email-maxin.john@intel.com>
	<20160203150256.GA2567@jama>
	<20160203150847.GB20736@mbabyjoh-mobl.fi.intel.com>
	<20160203153024.GC2567@jama>
MIME-Version: 1.0
In-Reply-To: <20160203153024.GC2567@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] formfactor: add machconfig for qemumips64 and beaglebone
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Feb 2016 15:44:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

On Wed, Feb 03, 2016 at 04:30:24PM +0100, Martin Jansa wrote:
> On Wed, Feb 03, 2016 at 05:08:47PM +0200, Maxin B. John wrote:
> > Hi Martin,
> > 
> > On Wed, Feb 03, 2016 at 04:02:56PM +0100, Martin Jansa wrote:
> > > On Wed, Feb 03, 2016 at 12:30:08PM +0200, Maxin B. John wrote:
> > > > We need machconfig file to automatically choose between physical and virtual
> > > > keyboards.
> > > > 
> > > > [YOCTO #9027]
> > > > 
> > > > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > > > ---
> > > >  meta/recipes-bsp/formfactor/files/beaglebone/machconfig |  3 +++
> > > 
> > > I still don't understand why beaglebone specific file should be included
> > > in oe-core, all other BSP layers are providing own machconfig for their
> > > MACHINEs, why should beaglebone be first exception for oe-core?
> > >
> > Apart from what Ross mentioned before,
> 
> Is this for oe-core or meta-yocto-bsp? The subject doesn't say which and
> path looks like for oe-core.

qemumips64 belongs in oe-core and beaglebone change should be in meta-yocto.
Will split it and send those to corresponding lists.

> And if it's for meta-yocto-bsp, does it belong to yocto ML? There is no
> README in meta-yocto-bsp root.

Yes, beaglebone part belongs to the Yocto ML. 

> 
> > commit 76b1d595cd7104797495067cc8c59db631edb75d
> > Author: Denys Dmytriyenko <denys@ti.com>
> > Date:   Wed Mar 26 15:21:10 2014 -0400
> > 
> > added beaglebone to meta-yocto-bsp. Before that, ARM reference board was
> > beagleboard.
> > 
> > commit 7254dfb642cb0262c7e14ef2a4c8a7a42afada60
> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date:   Fri Mar 28 18:07:01 2014 +0000
> > 
> >     Drop beagleboard, replaced by beaglebone
> > 
> > > >  meta/recipes-bsp/formfactor/files/qemumips64/machconfig | 10 ++++++++++
> > > >  2 files changed, 13 insertions(+)
> > > >  create mode 100755 meta/recipes-bsp/formfactor/files/beaglebone/machconfig
> > > >  create mode 100755 meta/recipes-bsp/formfactor/files/qemumips64/machconfig
> > > > 
> > > > diff --git a/meta/recipes-bsp/formfactor/files/beaglebone/machconfig b/meta/recipes-bsp/formfactor/files/beaglebone/machconfig
> > > > new file mode 100755
> > > > index 0000000..ffce012
> > > > --- /dev/null
> > > > +++ b/meta/recipes-bsp/formfactor/files/beaglebone/machconfig
> > > > @@ -0,0 +1,3 @@
> > > > +# Assume a USB mouse and keyboard are connected
> > > > +HAVE_TOUCHSCREEN=0
> > > > +HAVE_KEYBOARD=1
> > > > diff --git a/meta/recipes-bsp/formfactor/files/qemumips64/machconfig b/meta/recipes-bsp/formfactor/files/qemumips64/machconfig
> > > > new file mode 100755
> > > > index 0000000..56777b6
> > > > --- /dev/null
> > > > +++ b/meta/recipes-bsp/formfactor/files/qemumips64/machconfig
> > > > @@ -0,0 +1,10 @@
> > > > +HAVE_TOUCHSCREEN=1
> > > > +HAVE_KEYBOARD=1
> > > > + 
> > > > +DISPLAY_CAN_ROTATE=0
> > > > +DISPLAY_ORIENTATION=0
> > > > +DISPLAY_WIDTH_PIXELS=640
> > > > +DISPLAY_HEIGHT_PIXELS=480
> > > > +DISPLAY_BPP=16
> > > > +DISPLAY_DPI=150
> > > > +#DISPLAY_SUBPIXEL_ORDER=vrgb
> > > > -- 
> > > > 2.4.0
> > > > 
> > > > -- 
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > > 
> > > -- 
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > 
> > Best Regards,
> > Maxin
> > 

Best Regards,
Maxin


