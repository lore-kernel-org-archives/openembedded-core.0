Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8F79D607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 11:11:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jul 2016 04:11:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,439,1464678000"; d="scan'208";a="1031434458"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jul 2016 04:11:51 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 89A7C6A4080;
	Fri, 29 Jul 2016 04:11:39 -0700 (PDT)
Date: Fri, 29 Jul 2016 13:35:22 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20160729103522.GA376@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <alpine.LFD.2.20.1607281728250.18613@localhost.localdomain>
	<20160729082501.GB32340@linux.intel.com>
	<alpine.LFD.2.20.1607290614570.22106@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1607290614570.22106@localhost.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: does "wic" allow one to actually format physical devices?
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
X-List-Received-Date: Fri, 29 Jul 2016 11:11:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 29, 2016 at 06:19:13AM -0400, Robert P. J. Day wrote:
> On Fri, 29 Jul 2016, Ed Bartosh wrote:
> 
> > On Thu, Jul 28, 2016 at 05:30:14PM -0400, Robert P. J. Day wrote:
> > >
> > >   never used "wic" before, and i'm wondering if it has the ability
> > > to not create dd-able images so much as partition and format
> > > physical target devices. surely, the underlying logic would be the
> > > same, i just want to work with the target hard drive and bypass
> > > creating the image itself.
> >
> > The only purpose of wic is to create images. I'm afraid it doesn't
> > have the functionality you're looking for.
> 
>   i thought that was the case, just wanted to make sure. and perhaps
> i'm just missing it, but where is the canonical documentation for wic,
> it might still be useful for what i'm doing.
The documentation is here:
http://www.yoctoproject.org/docs/2.1/mega-manual/mega-manual.html#creating-partitioned-images

you can get also gert some info from wic help overview|plugins|kickstart output.

> rday
> 
> p.s. i'm assuming you can use 'wic' only in the context of an OE
> build, yes? at least it appears that way.
Yes, wic is tightly coupled with OE.

--
Regards,
Ed

