Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1EC2A605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 08:06:04 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 09 Nov 2016 00:06:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,465,1473145200"; d="scan'208";a="29204149"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 09 Nov 2016 00:06:06 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 5500D6A4006;
	Wed,  9 Nov 2016 00:05:27 -0800 (PST)
Date: Wed, 9 Nov 2016 10:05:26 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: John Hawley <john.hawley@intel.com>
Message-ID: <20161109080526.GA10546@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1477910801-9169-1-git-send-email-ed.bartosh@linux.intel.com>
	<CD1ACFFA-619F-4C36-99AC-76D6A6068E74@gmail.com>
	<20161107230047.GA7754@linux.intel.com>
	<32b3605d-9c79-d1be-c6cc-80309cad7a1a@gmail.com>
	<ede7d850-e1ac-d998-ed98-e1236fd052bd@linux.intel.com>
	<77d63518-4bd4-0688-438b-07778f754733@intel.com>
MIME-Version: 1.0
In-Reply-To: <77d63518-4bd4-0688-438b-07778f754733@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mkefidisk.sh: add deprecation warning to the output
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
X-List-Received-Date: Wed, 09 Nov 2016 08:06:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 08, 2016 at 01:05:23PM -0800, John Hawley wrote:
> On 11/08/2016 12:44 PM, Randy Witt wrote:
> >>>> We should also document, the wic steps in wiki pages e.g.
> >>>> http://wiki.minnowboard.org/Yocto_Project
> >>> It's already documented in README.hardware:
> >>> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/README.hardware
> >>>
> >>> And in Yocto manual:
> >>> http://www.yoctoproject.org/docs/2.2/mega-manual/mega-manual.html#building-an-image-for-hardware
> >>>
> >>
> >> Thanks, now can you also nudge the minnowboard.org to do the same ?
> >>
> > 
> > Pinging you John. :)
> 
> So two obvious questions in reading the documentation off the YP site:
> 
> 1) Does WIC actually handle the EFI partition for booting off of UEFI
> systems? (guessing yes, but wanted to double check)
Yes, it does.

> 2) I assume it only creates MBR based images, seeing as the suggestion
> is to DD the image down, how does GPT based images work since you can't
> (exactly) DD a GPT image down and have it work "correctly"?
>
Please, elaborate on "correctly". Do you mean that kernel will complain
that backup GPT header is not at the end of disk? This is not handled by
wic obviously. However, even without this image is bootable and
functional.

> Sorry, I'm sure that's covered somewhere else, just want to double check
> this will be ok before I update the documentation on MB


--
Regards,
Ed

