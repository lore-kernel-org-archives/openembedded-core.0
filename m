Return-Path: <paul.eggleton@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 18CCD601F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 10:00:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Feb 2018 02:00:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,468,1511856000"; d="scan'208";a="27678304"
Received: from nmohdpit-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.135])
	by fmsmga004.fm.intel.com with ESMTP; 06 Feb 2018 02:00:09 -0800
From: Paul Eggleton <paul.eggleton@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 06 Feb 2018 23:00:06 +1300
Message-ID: <1627979.bbRn6r2elb@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CAJTo0LZ9XAFNGmw9m3c-3a9MznVTzh1PWHUXyg-ANHSXhczDPA@mail.gmail.com>
References: <20180205182112.GF2786@denix.org> <20180205221300.GG2786@denix.org>
	<CAJTo0LZ9XAFNGmw9m3c-3a9MznVTzh1PWHUXyg-ANHSXhczDPA@mail.gmail.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: WARNING: Variable key %s (%s) replaces original key %s (%s).
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
X-List-Received-Date: Tue, 06 Feb 2018 10:00:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 6 February 2018 11:25:08 AM NZDT Burton, Ross wrote:
> On 5 February 2018 at 22:13, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > On Mon, Feb 05, 2018 at 09:53:44PM +0000, Burton, Ross wrote:
> > > On 5 February 2018 at 18:21, Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > > Am I supposed to see bunch of these warnings (3 during parsing and 20
> > more
> > > > during build):
> > > >
> > > > WARNING: Variable key RDEPENDS_${KERNEL_PACKAGE_NAME}-base
> > > > (${KERNEL_PACKAGE_NAME}-image) replaces original key
> > RDEPENDS_kernel-base
> > > > (kernel-devicetree).
> > > >
> > > >
> > > > From kernel.bbclass:
> > > >
> > > > # Allow machines to override this dependency if kernel image files are
> > > > # not wanted in images as standard
> > > > RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image"
> > > >
> > >
> > > That's your kernel recipe not liking the new multiple-name kernel
> > classes,
> > > and if your problem is the same as oe-core's qemu* machines then this is
> > > the fix:
> > >
> > > -RDEPENDS_kernel-base = ""
> > > +RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""
> >
> > Ah, I see, thanks! I assume all other operations with that variable (like
> > appends) would have to be changed similarly?
> >
> 
> Yes.
> 
> CCing Paul, master of release notes, to ensure this gets into the migration
> guide. :)

I've added this to:

  https://wiki.yoctoproject.org/wiki/FutureMigrationGuide

There must be a load missing from there for 2.5 so if you can think of 
anything that needs adding, in whatever raw form you can, go for it.

Cheers,
Paul

-- 
Paul Eggleton
Intel Open Source Technology Centre

