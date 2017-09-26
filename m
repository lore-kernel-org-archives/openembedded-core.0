Return-Path: <sgw@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C1D15782E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 00:46:11 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 25 Sep 2017 17:46:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,438,1500966000"; d="scan'208";a="132277434"
Received: from swold-mobl2.jf.intel.com ([10.254.78.59])
	by orsmga004.jf.intel.com with ESMTP; 25 Sep 2017 17:46:12 -0700
Message-ID: <1506386772.24844.45.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 25 Sep 2017 17:46:12 -0700
In-Reply-To: <1505981757.18640.155.camel@linuxfoundation.org>
References: <20170919182734.15741-1-sgw@linux.intel.com>
	<20170919182734.15741-2-sgw@linux.intel.com>
	<1505981757.18640.155.camel@linuxfoundation.org>
X-Mailer: Evolution 3.24.5 (3.24.5-1.fc26) 
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] arch-x86: Add x86-x32 to MACHINEOVERRIDES
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
X-List-Received-Date: Tue, 26 Sep 2017 00:46:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-09-21 at 09:15 +0100, Richard Purdie wrote:
> On Tue, 2017-09-19 at 11:27 -0700, Saul Wold wrote:
> > This is needed as an x32 more generic x32 override later in the
> > OVERRIDES, currently linux-gnux32 is the first override, but we
> > need a stronger (later in the list) x32 override to deal with some
> > needed x32 dependency overrides.
> > 
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >  meta/conf/machine/include/x86/arch-x86.inc | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/conf/machine/include/x86/arch-x86.inc
> > b/meta/conf/machine/include/x86/arch-x86.inc
> > index e51d595f74..31d30b3304 100644
> > --- a/meta/conf/machine/include/x86/arch-x86.inc
> > +++ b/meta/conf/machine/include/x86/arch-x86.inc
> > @@ -26,6 +26,7 @@ TUNE_LDARGS += "${@bb.utils.contains('TUNE_FEATUR
> > ES', 'mx32', '-m elf32_x86_64',
> >  TUNE_ASARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-
> > x32', '', d)}"
> >  # user mode qemu doesn't support x32
> >  MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contai
> > ns('TUNE_FEATURES', 'mx32', 'qemu-usermode', '', d)}"
> > +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'mx32',
> > 'x86_x32:', '' ,d)}"
> >  
> >  # ELF64 ABI
> >  TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
> 
> I was ok with this until I realised the patch does not do what it
> says
> in the commit message, it adds "x86_x32", not "x86-x32". Since "_" is
> the override modifier, I worry about how this reacts with the rest of
> the system and I suspect its a bad idea. Is there a reason you didn't
> use "x86-x32" (following the example of x86-64)?
> 
Typo, possibly or had not considered the override issue.

v2 in flight shortly.

Sau!

> Cheers,
> 
> Richard

