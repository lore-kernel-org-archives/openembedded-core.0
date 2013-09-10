Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C01666C052
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 17:55:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Sep 2013 10:55:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,879,1371106800"; d="scan'208";a="401335105"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.201.62]) ([10.7.201.62])
	by orsmga002.jf.intel.com with ESMTP; 10 Sep 2013 10:54:54 -0700
Message-ID: <1378835694.19978.128.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Yunguo Wei <yunguo.wei@windriver.com>
Date: Tue, 10 Sep 2013 10:54:54 -0700
In-Reply-To: <522E9996.8000107@windriver.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<4562a00806c5a6573b5aa650764ad12bc93edda7.1378339881.git.dvhart@linux.intel.com>
	<CAJTo0LY-oi+tQy7rs84axy4R71Y4j=HtEgXALN20aVdATwzVdg@mail.gmail.com>
	<1378392729.14029.73.camel@dvhart-mobl4.amr.corp.intel.com>
	<5229303F.1090209@windriver.com>
	<1378780640.19978.69.camel@dvhart-mobl4.amr.corp.intel.com>
	<522E9996.8000107@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Poky <poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] xf86-video-mga: Pull in Matrox MGA support from meta-intel
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
X-List-Received-Date: Tue, 10 Sep 2013 17:55:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-09-10 at 12:01 +0800, Yunguo Wei wrote:
> On 09/10/2013 10:37 AM, Darren Hart wrote:
> > On Fri, 2013-09-06 at 09:30 +0800, Yunguo Wei wrote:
> >> On 09/05/2013 10:52 PM, Darren Hart wrote:
> >>> On Thu, 2013-09-05 at 10:57 +0100, Burton, Ross wrote:
> >>>> On 5 September 2013 01:18, Darren Hart <dvhart@linux.intel.com> wrote:
> >>>>> In support of the more generic x86 BSPs, pull in the Matrox driver
> >>>>> recipe from meta-intel.
> >>>> What machine is this for in particular?
> >>> This was reported when someone was testing on a Romley machine.
> >> Yes, it is Intel SDP S2R3, Romley-EP IVY refresh.
> >>>>     In discussion with Nitin
> >>>> about MGA a few weeks back the conclusion was that the vesa driver
> >>>> should be sufficient.  As far as I'm aware the reference platforms
> >>>> don't ship with MGA hardware so it's up to the owner of the platform
> >>>> to install whatever they have to hand (mga, nvidia, ATI, etc), or am I
> >>>> wrong about that?
> >>> Nitin?
> >>>
> >>> Yunguo?
> >> We thought vesa is supposed to work.
> >>
> >> Intel OSVe team reported this problem against WRLinux 5.0.1, and I fixed
> >> it by adding mga package.
> >> Note that, mga kernel driver was not built-in or as a module.
> > I missed that the kernel module was missing. Oops. That's easy enough to
> > add to the common-pc graphics fragment. But what we need to know is if
> > we should try to get MGA into oe-core or not. I honestly don't
> > understand why we shouldn't, with intel and omap in there already. It
> > seems silly to have a special layer for the xorg driver when mesa and
> > the kernel already build their part for the same hardware....
> Not sure if adding MGA to config fragment could fix this issue, but in 
> my memory it was not working.
> That's why I added MGA user space package.
> 
> But you can try, any Romley-EP machine could reproduce it.

I don't have one personally. Nitin, could you forward this information
along to someone who does? Can they test with Vesa?

--
Darren

> 
> Regards,
> Yunguo
> 
> >
> > Are there any compelling arguments for not including the mga driver in
> > oe-core?
> >
> >>
> >> Regards,
> >> Yunguo
> >>>>> Remove the checkfile patch from Ross as this is now handled adequately
> >>>>> with the configure prepend hack which assumes success for any checkfile
> >>>>> calls.
> >>>> Assuming success in an distro where opengl isn't enabled will result
> >>>> in the driver believing that DRI is enabled when it isn't, so expect
> >>>> to see build failures from this.
> >>> Should we be adding a distro depends on opengl for this driver as is
> >>> being done for others currently?
> >>>
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



