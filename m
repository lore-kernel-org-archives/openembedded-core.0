Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 72E646FFA4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 09:43:43 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jun 2016 02:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="121534090"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga004.fm.intel.com with ESMTP; 14 Jun 2016 02:43:43 -0700
Date: Tue, 14 Jun 2016 07:50:58 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20160614045058.GB22248@mbabyjoh-desk.ger.corp.intel.com>
References: <cover.1465719878.git.liezhi.yang@windriver.com>
	<4f1364dec6b9be5b84991ed3811d4ce0172087ae.1465719878.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4f1364dec6b9be5b84991ed3811d4ce0172087ae.1465719878.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 07/11] gnu-efi: 3.0.3 -> 3.0.4
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
X-List-Received-Date: Tue, 14 Jun 2016 09:43:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sun, Jun 12, 2016 at 01:25:09AM -0700, Robert Yang wrote:
> * Remove gnu-efi-Make-setjmp.S-portable-to-ARM.patch since it is already
>   in the source.
> 
> * Updated LIC_FILES_CHKSUM
>   - The following files are gone:
>     lib/arm/div64.S
>     lib/arm/lib1funcs.S
>   - Updated md5sum for other files, they add the following words, which are
>     still GPLv2+:
>     Redistribution and use in source and binary forms, with or without
>     modification, are permitted provided that the following conditions
>     are met:
>     1. Redistributions of source code must retain the above copyright
>        notice and this list of conditions, without modification.
>     2. The name of the author may not be used to endorse or promote products
>        derived from this software without specific prior written permission.
> 
>     Alternatively, this software may be distributed under the terms of the
>     GNU General Public License as published by the Free Software Foundation;
>     either version 2 of the License, or (at your option) any later version.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> - 	ldmia	r0, {r3-r12,r14}
> --- 
> -1.9.1
> -
> diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
> similarity index 60%
> rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
> rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
> index 6b130a2..6a4acfb 100644
> --- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
> +++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb

gnu-efi-3.0.4 build failed on qemux86-64 (Build host Debian-8.5)
http://errors.yoctoproject.org/Errors/Details/69406/

Best Regards,
Maxin

