Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7355072FFD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 11:11:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2017 03:11:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,262,1486454400"; d="scan'208";a="832281208"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2017 03:11:13 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 73A836A4080;
	Wed,  8 Mar 2017 03:11:09 -0800 (PST)
Date: Wed, 8 Mar 2017 12:57:29 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Daniel Schultz <d.schultz@phytec.de>
Message-ID: <20170308105729.GA22401@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <2791e915-9e22-a01a-ccb5-c629d250edb2@phytec.de>
MIME-Version: 1.0
In-Reply-To: <2791e915-9e22-a01a-ccb5-c629d250edb2@phytec.de>
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
X-List-Received-Date: Wed, 08 Mar 2017 11:11:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 08, 2017 at 10:44:21AM +0100, Daniel Schultz wrote:
> Hi,
> 
> I created two kickstart files (am335x-sdimage.wks, am335x-emmc.wks)
> and added them to the local.conf.
> 
> When I build the image only the first wks in WKS_FILES will be used
> by WIC and the second will be ignored. Is it possible to build two
> images in one build?
>

I don't think it's possible to build more than one image for the same
type. wic is not an exception here.

> Includes of the wks files in local.conf:
> WKS_FILES_ti33x = "am335x-sdimage.wks am335x-emmc.wks "

WKS_FILES variable is to provide possible wks files to use. First one found will
be used to produce an image.

--
Regards,
Ed

