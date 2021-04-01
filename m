Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.6722.1617309095486561139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 13:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qMFtcirf;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 131KVVCJ112911;
	Thu, 1 Apr 2021 15:31:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617309091;
	bh=zYlys5HejR5BHYeRwN4wNjvf2XSabGtvEClohP90XIc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qMFtcirfPIZ4plXCl1d0r470ESgaIUZzb0ShbK956kWJeVqiPuD/2WXJr77ZfG2WA
	 Sq1deGRdZBOuOfrXx/QBc1SDfdFyHRcXpzYF4mMi8zObi+ti9iiERI3b4ceE/3s7kt
	 NzLQFGxuqoPvUIZ5qYabpbixxPAsc59KqW8mHDTU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 131KVVex029181
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Apr 2021 15:31:31 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 1 Apr
 2021 15:31:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 1 Apr 2021 15:31:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 131KVVqv060496;
	Thu, 1 Apr 2021 15:31:31 -0500
Date: Thu, 1 Apr 2021 15:31:31 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Denys Dmytriyenko <denis@denix.org>,
        Patches and discussions about the
 oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] make-mod-scripts: pass CROSS_COMPILE to configure and build
Message-ID: <20210401203131.6sxb4rnpopuvkzni@upstate>
References: <1617235191-37594-1-git-send-email-denis@denix.org>
 <CADkTA4PmeaiFRZLxFkJ=TJnWLcMHYnEn_tvNUwZ4N+uHV05S-Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4PmeaiFRZLxFkJ=TJnWLcMHYnEn_tvNUwZ4N+uHV05S-Q@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 09:22-20210401, Bruce Ashfield wrote:
> On Wed, Mar 31, 2021 at 8:00 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > Fixes:
> > |   CALL    /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/scripts/checksyscalls.sh
> > |   CALL    /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/scripts/atomic/check-atomics.sh
> > |   LDS     arch/arm64/kernel/vdso/vdso.lds
> > |   CC      arch/arm64/kernel/vdso/vgettimeofday.o
> > |   AS      arch/arm64/kernel/vdso/note.o
> > |   AS      arch/arm64/kernel/vdso/sigreturn.o
> > |   LD      arch/arm64/kernel/vdso/vdso.so.dbg
> > |   VDSOSYM include/generated/vdso-offsets.h
> > |   OBJCOPY arch/arm64/kernel/vdso/vdso.so
> > | objcopy: Unable to recognise the format of the input file `arch/arm64/kernel/vdso/vdso.so.dbg'
> > | /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/arch/arm64/kernel/vdso/Makefile:61: recipe for target 'arch/arm64/kernel/vdso/vdso.so' failed
> >
> > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> I like the lighter touch of this patch. I still can't explain why this
> isn't necessary on one of my builders, but is on the other .. but that
> of course isn't relevant to this!
> 
> I've reviewed and tested this, so no concerns from my end.
> 
> Queue the cheesy -by lines:
> 
> Reviewed-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Tested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> 

Sounds good to me as well.. Thanks for discussing this chain[1].


Tested-by: Nishanth Menon <nm@ti.com>


Though I still don't understand the rationale why would we not move
CROSS_COMPILE from kernel.bbclass to kernel-arch.bbclass instead of
having to duplicate it here? after all KERNEL_CC etc are in that realm
and would'nt CROSS_COMPILE fall in that bucket?

> > Cc: Nishanth Menon <nm@ti.com>
> > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > ---
> >  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > index 92ffa47..b2b50b9 100644
> > --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > @@ -19,7 +19,7 @@ DEPENDS += "bc-native bison-native"
> >  DEPENDS += "gmp-native"
> >
> >  EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
> > -EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}""
> > +EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
> >
> >  # Build some host tools under work-shared.  CC, LD, and AR are probably
> >  # not used, but this is the historical way of invoking "make scripts".
> > --
> > 2.7.4
> >
> 
> 
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

[1] https://lists.openembedded.org/g/openembedded-core/message/150143
