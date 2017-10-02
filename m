Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2E99760190
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 10:59:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Oct 2017 03:59:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,469,1500966000"; d="scan'208";a="1020595464"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 02 Oct 2017 03:59:09 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 810FF580321;
	Mon,  2 Oct 2017 03:59:08 -0700 (PDT)
Date: Mon, 2 Oct 2017 12:59:18 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20171002095918.i6qrs6u57z6zhs53@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1506531609-5917-1-git-send-email-trini@konsulko.com>
	<1506695299-30364-1-git-send-email-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <1506695299-30364-1-git-send-email-trini@konsulko.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] image_types: Fix bmaptool support for RSS
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
X-List-Received-Date: Mon, 02 Oct 2017 10:59:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 29, 2017 at 10:28:19AM -0400, Tom Rini wrote:
> With RSS we need to ensure that when making a bmap image that the
> python3 that we created is found via /usr/bin/env rather than the host
> python3.  Otherwise we're relying on the build host to have bmaptool
> support installed.
> 

Thank you for the patch.

+1

> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
> Changes in v2:
> - Switch to checking for '.bmap' not 'bmap', per Ed Bartosh.
> ---
>  meta/classes/image_types.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 61dca626311e..b373b217145f 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -311,3 +311,6 @@ DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
>  # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
>  # images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdddirect, hddimg, iso, etc.
>  IMAGE_TYPES_MASKED ?= ""
> +
> +# bmap requires python3 to be in the PATH
> +EXTRANATIVEPATH += "${@'python3-native' if d.getVar('IMAGE_FSTYPES').find('.bmap') else ''}"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
--
Regards,
Ed

