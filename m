Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 885556BCB0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 09:19:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Sep 2013 02:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,897,1371106800"; d="scan'208";a="402776573"
Received: from unknown (HELO helios.localnet) ([10.252.123.177])
	by orsmga002.jf.intel.com with ESMTP; 13 Sep 2013 02:19:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2013 10:19:51 +0100
Message-ID: <1628869.GrtJx7trgC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-29-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20130913084724.GC11500@jama>
References: <1379054574-8526-1-git-send-email-sgw@linux.intel.com>
	<20130913084724.GC11500@jama>
MIME-Version: 1.0
Cc: bjorn.arnelid@xdin.com
Subject: Re: [PATCH] qemu.inc: Fix typo for KERNEL_FEATURES
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
X-List-Received-Date: Fri, 13 Sep 2013 09:19:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 13 September 2013 10:47:24 Martin Jansa wrote:
> On Thu, Sep 12, 2013 at 11:42:54PM -0700, Saul Wold wrote:
> > Thans to Bjorn Arnelid for finding this
> > 
> > Cc: bjorn.arnelid@xdin.com
> > 
> > [YOCTO #5173]
> > 
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> > 
> >  meta/conf/machine/include/qemu.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/conf/machine/include/qemu.inc
> > b/meta/conf/machine/include/qemu.inc index a78622d..8557777 100644
> > --- a/meta/conf/machine/include/qemu.inc
> > +++ b/meta/conf/machine/include/qemu.inc
> > @@ -26,4 +26,4 @@ PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
> > 
> >  EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
> >  
> >  # Provide the nfs server kernel module for all qemu images
> > 
> > -KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
> > +KERNEL_FEATURES_append_pn_linux-yocto = " features/nfsd/nfsd-enable.scc"
> 
> Wait a minute, isn't _pn-foo correct override?

It is. Bjorn and I discussed this on IRC already, this patch shouldn't be 
applied. He's switched back to the linux-yocto 3.2 kernel and I guess that 
feature is not available/working there, thus this change did fix his build 
failure as it effectively disabled the line. Perhaps we should fix the 
underlying bug instead? Bruce, any suggestions?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

