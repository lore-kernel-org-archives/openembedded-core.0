Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 16AB471A3E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 17:47:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Feb 2017 09:47:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="1123357124"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.85.39])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2017 09:47:43 -0800
Message-ID: <1486489663.26702.43.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 07 Feb 2017 09:47:43 -0800
In-Reply-To: <CAMKF1sqhL0K+-Q53drSo1Mz=_Qs6GTX_QzVRh1jy11F7x3Vc3A@mail.gmail.com>
References: <1486414751-24947-1-git-send-email-sgw@linux.intel.com>
	<1486414751-24947-4-git-send-email-sgw@linux.intel.com>
	<CAMKF1spjcD8X=oxK4HHeO05PxRsn_ieRoDhpA3QpNOxKLXCbtg@mail.gmail.com>
	<1486478723.26702.27.camel@linux.intel.com>
	<CAMKF1sqhL0K+-Q53drSo1Mz=_Qs6GTX_QzVRh1jy11F7x3Vc3A@mail.gmail.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] meta-intel.inc: Enable linux-intel and 4.9 by default for meta-intel hardware
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
X-List-Received-Date: Tue, 07 Feb 2017 17:47:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-02-07 at 08:50 -0800, Khem Raj wrote:
> On Tue, Feb 7, 2017 at 6:45 AM, Saul Wold <sgw@linux.intel.com>
> wrote:
> > 
> > On Mon, 2017-02-06 at 13:02 -0800, Khem Raj wrote:
> > > 
> > > On Mon, Feb 6, 2017 at 12:59 PM, Saul Wold <sgw@linux.intel.com>
> > > wrote:
> > > > 
> > > > 
> > > > Enable the linux-intel production kernel for meta-intel by
> > > > default
> > > > for 4.9,
> > > > this will enable using the Intel production kernel.
> > > > 
> > > > This is a well tested 4.9 tree that will start to include
> > > > additional
> > > > support for the Apollolake and Joule hardware.
> > > > 
> > > > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > > > ---
> > > >  conf/machine/include/meta-intel.inc | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/conf/machine/include/meta-intel.inc
> > > > b/conf/machine/include/meta-intel.inc
> > > > index 21587fb..eb759c4 100644
> > > > --- a/conf/machine/include/meta-intel.inc
> > > > +++ b/conf/machine/include/meta-intel.inc
> > > > @@ -9,8 +9,8 @@
> > > >  #
> > > > 
> > > >  # Soft set linux-yocto as preferred kernel like x86-base.inc
> > > > -PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
> > > > -PREFERRED_VERSION_linux-yocto ?= "4.8%"
> > > > +PREFERRED_PROVIDER_virtual/kernel ?= "linux-intel"
> > > 
> > > whats the difference between linux-yocto and linux-intel ?
> > > 
> > Sorry for sending this to the wrong list.
> > 
> > This is a valid question, the difference will be faster integration
> > and
> > better testing /validation of upstream (or possibly pending
> > upstream )
> > patches for Intel Hardware.
> > 
> > Since the kernel will be coming from an Intel Source, it will be
> > fully
> > tested on more hardware that the current linux-yocto kernel gets
> > tested
> > against.
> > 
> > The update rate maybe about the same, with security updates as
> > needed
> > for more severe issues
> > 
> > As other vendors maintain kernels for their meta-vendor specific
> > layer,
> > Intel has chosen to maintain an Intel kernel based on the current
> > LTS
> > version (4.9) plus upstreamed patches. All content will be
> > backports
> > from internally maintained tracking trees being regularly updated.
> > 
> > meta-intel will likely continue to contain the linux-yocto-<latest> 
> > for
> > a non-LTS kernel.
> > 
> > Hope that clarifies this.
> 
> yes it does. So this is not a clone of linux-yocto but based directly
> on linux-stable.
> 
Correct, this is based directly on linux-stable and will have patches
that are backports from maintained tracking trees. As the new LTS is
defined each year, linux-intel and meta-intel will update to that newer
version. The older version will continue to be available and be updated
with stable updates as they are available.

Sau!

> > 
> > 
> > Sau!
> > 
> > > 
> > > > 
> > > > 
> > > > +PREFERRED_VERSION_linux-intel ?= "4.9%"
> > > > 
> > > >  # for Xserver older than 1.13.0
> > > >  OLD_XSERVER_X86_EXT = "xserver-xorg-extension-dri \
> > > > --
> > > > 2.7.4
> > > > 
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-cor
> > > > e

