Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 37B1D6D88C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 13:42:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Dec 2013 05:42:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,833,1378882800"; d="scan'208";a="445150682"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.191])
	by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2013 05:42:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ross Burton <ross.burton@intel.com>
Date: Thu, 05 Dec 2013 13:42:17 +0000
Message-ID: <3367513.n7IfYzbTrl@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1386250374.25847.16.camel@ted>
References: <1386248161-7086-1-git-send-email-ross.burton@intel.com>
	<1386250374.25847.16.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] documentation.conf: remove unused IMAGETEST variable
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
X-List-Received-Date: Thu, 05 Dec 2013 13:42:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 05 December 2013 13:32:54 Richard Purdie wrote:
> On Thu, 2013-12-05 at 12:55 +0000, Ross Burton wrote:
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> > 
> >  meta/conf/documentation.conf |    1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> > index 6666648..db3701b 100644
> > --- a/meta/conf/documentation.conf
> > +++ b/meta/conf/documentation.conf
> > @@ -118,7 +118,6 @@ IMAGE_LINGUAS[doc] = "Specifies the list of locales to
> > install into the image du> 
> >  IMAGE_OVERHEAD_FACTOR[doc] = "Defines a multiplier that the build system
> >  applies to the initial image size for cases when the multiplier times
> >  the returned disk usage value for the image is greater than the sum of
> >  IMAGE_ROOTFS_SIZE and IMAGE_ROOTFS_EXTRA_SPACE."
> >  IMAGE_ROOTFS_EXTRA_SPACE[doc] = "Defines additional free disk space
> >  created in the image in Kbytes. By default, this variable is set to
> >  '0'." IMAGE_ROOTFS_SIZE[doc] = "Defines the size in Kbytes for the
> >  generated image."> 
> > -IMAGETEST[doc] = "Enable test booting of virtual machine images under the
> > qemu emulator after any root filesystems are created and run tests
> > against those images."> 
> >  INC_PR[doc] = "Helps define the recipe revision for recipes that share a
> >  common include file." INHIBIT_PACKAGE_STRIP[doc] = "If set to "1",
> >  causes the build to not strip binaries in resulting packages."
> >  INHERIT[doc] = "Causes the named class to be inherited at this point
> >  during parsing. The variable is only valid in configuration files."
>
> Isn't it actually IMAGE_TEST ?

If you mean what it is now, it's TEST_IMAGE.

If we're removing the old IMAGETEST variable (and we should) we should also 
remove TEST_SCEN at the same time.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

