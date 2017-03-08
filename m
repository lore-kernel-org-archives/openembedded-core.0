Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E20F860069
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 13:57:32 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2017 05:57:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,264,1486454400"; d="scan'208";a="233713579"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 08 Mar 2017 05:57:33 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id BB0086A4080;
	Wed,  8 Mar 2017 05:57:29 -0800 (PST)
Date: Wed, 8 Mar 2017 15:43:49 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20170308134349.GA16099@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <2791e915-9e22-a01a-ccb5-c629d250edb2@phytec.de>
	<20170308105729.GA22401@linux.intel.com>
	<7d4a770f-25c6-5747-5a5c-370c822f2efb@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <7d4a770f-25c6-5747-5a5c-370c822f2efb@mlbassoc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Create more than one image with WIC
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
X-List-Received-Date: Wed, 08 Mar 2017 13:57:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 08, 2017 at 02:41:10PM +0100, Gary Thomas wrote:
> On 2017-03-08 11:57, Ed Bartosh wrote:
> >On Wed, Mar 08, 2017 at 10:44:21AM +0100, Daniel Schultz wrote:
> >>Hi,
> >>
> >>I created two kickstart files (am335x-sdimage.wks, am335x-emmc.wks)
> >>and added them to the local.conf.
> >>
> >>When I build the image only the first wks in WKS_FILES will be used
> >>by WIC and the second will be ignored. Is it possible to build two
> >>images in one build?
> >>
> >
> >I don't think it's possible to build more than one image for the same
> >type. wic is not an exception here.
> >
> >>Includes of the wks files in local.conf:
> >>WKS_FILES_ti33x = "am335x-sdimage.wks am335x-emmc.wks "
> >
> >WKS_FILES variable is to provide possible wks files to use. First one found will
> >be used to produce an image.
> 
> Would it work to add/define this variable in the corresponding *image*.bb recipe
> rather than local.conf?

Yes, it would if image recipe is unique, i.e. images of the same type
can be produced for different recipes.

WKS_FILES makes sense to set only if there are multiple wks files that
can be used to produce an image. The most obvious use case is using
multiple layers with different wks files in each and specifying all of
them in WKS_FILES.

If this is not the case then setting WKS_FILE is enough.

--
Regards,
Ed

