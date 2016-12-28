Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 013F47197B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 23:25:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 28 Dec 2016 15:25:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,423,1477983600"; d="scan'208";a="1077143103"
Received: from ranerica-desktop.sc.intel.com (HELO [10.3.52.169])
	([10.3.52.169])
	by orsmga001.jf.intel.com with ESMTP; 28 Dec 2016 15:25:02 -0800
Message-ID: <1482967502.106950.69.camel@ranerica-desktop>
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Wed, 28 Dec 2016 15:25:02 -0800
In-Reply-To: <1482961124.106950.55.camel@ranerica-desktop>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<ce57b729e9ac830d808040b7e3ff1fc128475420.1482324587.git.patrick.ohly@intel.com>
	<1482961124.106950.55.camel@ranerica-desktop>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/9] ovmf: deploy firmware in image directory
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
X-List-Received-Date: Wed, 28 Dec 2016 23:25:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-12-28 at 13:38 -0800, Ricardo Neri wrote:
> >  do_install_class-target() {
> > -    OVMF_DIR_SUFFIX="X64"
> > -    if [ "${TARGET_ARCH}" != "x86_64" ] ; then
> > -        OVMF_DIR_SUFFIX="Ia32" # Note the different capitalization
> > -    fi
> > +    # Traditional location.
> >      install -d ${D}${datadir}/ovmf
> > +    install -m 0755 ${WORKDIR}/ovmf/OVMF.fd
> ${D}${datadir}/ovmf/bios.bin
> 
> Now that I think about it. Installing here does not sever any purpose.
> Thus, I think this can be removed by perhaps doing do_install[noexec]
> =
> "1"

I take back this. I seems that scripts/runqemu does look for OVMF in
STAGING_DIR_HOST/NATIVE. Perhaps this can be changed how that you are
also updating runqemu.


