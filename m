Return-Path: <bruno.bottazzini@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DBE9E6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 14:05:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 11 May 2015 07:04:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,407,1427785200"; d="scan'208";a="708381852"
Received: from ragonzag-mobl1.amr.corp.intel.com (HELO [10.218.98.23])
	([10.218.98.23])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2015 07:04:26 -0700
Message-ID: <1431353057.3137.1.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Anders Darander <anders@chargestorm.se>
Date: Mon, 11 May 2015 11:04:17 -0300
In-Reply-To: <20150511060614.GA13549@ad.chargestorm.se>
References: <1431016840-26287-1-git-send-email-bruno.bottazzini@intel.com>
	<1431016840-26287-4-git-send-email-bruno.bottazzini@intel.com>
	<554BB5F2.8090004@opendreambox.org>
	<1431038749.29137.15.camel@bottazzini-ThinkPad-T430>
	<20150511060614.GA13549@ad.chargestorm.se>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 3/3] systemd: split modules into packages
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
X-List-Received-Date: Mon, 11 May 2015 14:05:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Seg, 2015-05-11 at 08:06 +0200, Anders Darander wrote:
> * Bottazzini, Bruno <bruno.bottazzini@intel.com> [150508 00:46]:
> 
> > On Qui, 2015-05-07 at 20:58 +0200, Andreas Oberritter wrote:
> > > On 07.05.2015 18:40, Bruno Bottazzini wrote:
> > > > +                   vconsole \
> > > > +                   update \
> > > > +                   timesyncd \
> > > > +                   rfkill \
> > > > +                   quota \
> > > > +                   fuse \
> > > > +                   firstboot \
> > > > +                   dbus \
> > > > +                   binfmt \
> > > > +                   backlight \
> > > > +                   ask-password \
> 
> > > I think it may be better to sort this quite long list alphabetically.
> 
> > > Are these options already enabled today? 
> 
> > Yes, it is enabled. 
> 
> > This is the default packages enabled in the current recipe.
> 
> > > Because of the new
> > > packageconfig entries, I would have expected changes to EXTRA_OECONF and
> > > DEPENDS, which I don't see in your patch.
> 
> > Some packages does not have EXTRA_OECONF.
> 
> > You can see what this recipe DEPENDS by looking at ${PN}-services-base.
> 
> What Andreas is asking about, is e.g. for the kmod PACKAGECONFIG:
> 
> > > > +PACKAGECONFIG[kmod] = "--enable-kmod,--disable-kmod,kmod"
> 
> Here, if kmod is enabled in PACKAGECONFIG, kmod (the 3rd parameter),
> will be added to DEPENDS. Thus, you should remove kmod from the static
> DEPENDS (as now it's dynamically added using PACKAGECONFIGS).

You're right. I will make DEPENDS to be dynamically too.

> 
> The same is likely true for a number of the other PACKAGECONFIGs that
> you're adding (which, by the way is a _good_ thing to add).

Yeap! I will check the others

Thanks

> 
> Cheers,
> Anders
> 



