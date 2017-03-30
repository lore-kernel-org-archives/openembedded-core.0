Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 647D3719AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490861384; x=1522397384;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=vWcHUnQ87Z8sFWewNvjVDSlNv/G5xDnEZTTtlaC3LCY=;
	b=fe7grd7OBtEjMZrR7PWX8DJFqTOL5VM8h7vh/Apb6I1igfD2ILPKCqFe
	6sPgPxUW06JlW6lvnk64kvyOrs9QTg==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2017 01:09:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,245,1486454400"; d="scan'208";a="66801748"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 30 Mar 2017 01:09:41 -0700
Date: Thu, 30 Mar 2017 11:09:56 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20170330080955.GA403@mbabyjoh-desk.ger.corp.intel.com>
References: <1490789493.18519.18.camel@codethink.co.uk>
	<CAJ86T=VYpCkzddgtVkT++N+gxj5oi8iuzb29Cm9N_0=7RrG_1A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VYpCkzddgtVkT++N+gxj5oi8iuzb29Cm9N_0=7RrG_1A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libjpeg-turbo: fix build on aarch64 or non-intel build hosts
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
X-List-Received-Date: Thu, 30 Mar 2017 08:09:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tristan,

On Wed, Mar 29, 2017 at 06:44:38PM -0700, Andre McCurdy wrote:
> On Wed, Mar 29, 2017 at 5:11 AM, Tristan Van Berkom
> <tristan.vanberkom@codethink.co.uk> wrote:
> > This is already filed in the appropriate bugzilla:
> >    https://bugzilla.yoctoproject.org/show_bug.cgi?id=11240
> >
> > Just notifying the list as the custom goes...
> >
> > libjpeg-turbo in recipes-graphics has an unconditional dependency on
> > nasm-native, which is intel specific and wont be provided on non intel
> > arches.

Yes, nasm is intel specific. However, we should be able to run nasm on other
archs like arm/aarch64 as it claims to be a portable 80x86 assembler.

> > Attaching a patch which fixes this by only requiring nasm-native when
> > targeting intel architectures.
> 
> Even with this patch, trying to build for an x86 target on an aarch64
> host will still fail, right?

Agree with Andre here. I would suggest to update nasm recipe to support
build for other archs as well (tested on arm and it works as expected. Will
require more testing on other archs).

> > Cheers,
> >     -Tristan

Best Regards,
Maxin

