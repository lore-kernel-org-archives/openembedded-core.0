Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6A21F78690
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 01:06:22 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id l64-v6so860596vkl.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 18:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XFGSRpII+t9l1dNB76a9O52xzx3vVh1dvQpIOtjYlsk=;
	b=RfpVIRESrGk6kYlCw0yOEaSyzsAcrCAjbohAauqYDWm5FeORIjEkzwKGW9t6x/qx4v
	6sjGKSyotrKQVXijgU3tUED/AgkDXmMdMazCY6qJQYhSADohAsgFkxS71ODFb89RQDlJ
	B5n6Dp1g1qfl8tLnoIWiZMkCs+WBuTLLDy3ylJ8Jy5uuSEFMhKHKmIDXQ9BHX+eLCg6y
	wY7YN9LJlPJ0ci3QxLnDWwsbFENfn/nPddivTS2DkKrxFI/RHYDueBYD/Bdh4tcfMr+l
	wvdYQtzZWo+qUHqscsTwEolEcFBS2OMDK+FVRXUAW7T/EixFT5IFT52Dfp8MVfYgP0c+
	XZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XFGSRpII+t9l1dNB76a9O52xzx3vVh1dvQpIOtjYlsk=;
	b=CfP4c3SpBqt14VJizbQrtrrU3Qu/C1IRIlEJu5nm4Ye4r/j9aOr6D/j4uxUJQt14CQ
	/H/GnQOjILndTjVpWzDikO91D58ijBy6v55SjIkAC0cHoPvD59l9CwljvJm7zaK2JrBd
	lODwCWii8LaMTOrD/hZuamExc/va0VSNRjBbBK6hO+XZOEVbGsjusYRAfNr3aTXkuDnl
	fg9u+q3/TUtFqMoB7ZFdsH8eVQzbn/JCuuojJ7StnsUM44VQbghN1HWv0O5DtIOBzX08
	vhksS8ybBoLUwnPDG6bUnxqvBR4aZViEIfQdfOf+rGNdB+/iyGQlHfMHcAvf2CZ3HTpI
	SFHQ==
X-Gm-Message-State: APt69E13UmTJKAr0mpsPDL+bTE5vF0o9/VTzOEHUE25mLokqAKdT9i+s
	+az3nWJKp0mYFV9CpGg/+L+vs+st1WlD6t3c4FY=
X-Google-Smtp-Source: ADUXVKLhxgD0BKnwjo1CgOb6sUl40nabqLHyj8rZN9K8hTfs4FGj2LVNEfFSPhewUWdc7IfmaEAoSZxhjFhADwQF9ws=
X-Received: by 2002:a1f:4b86:: with SMTP id
	y128-v6mr12995687vka.146.1529543182981; 
	Wed, 20 Jun 2018 18:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20180620052106.22306-1-raj.khem@gmail.com>
	<CAJ86T=Ux4NWkdBcSG68bCprxuDcjacwQJOgoTmQBMufveXXskg@mail.gmail.com>
In-Reply-To: <CAJ86T=Ux4NWkdBcSG68bCprxuDcjacwQJOgoTmQBMufveXXskg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Jun 2018 18:05:56 -0700
Message-ID: <CAMKF1sqTb0NdK=qXya+mTutAOhgwis6rFB2r-i_HOthi5SmniQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-target: Enable fp arch extention when fpu is available
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
X-List-Received-Date: Thu, 21 Jun 2018 01:06:22 -0000
Content-Type: text/plain; charset="UTF-8"

No, it wont AFAICT, I guess we need to move this into gcc-8.0.bb
On Wed, Jun 20, 2018 at 4:33 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Tue, Jun 19, 2018 at 10:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > This is especially needed when defaulting to hard-float ABI
> > Fixes errors e.g.
> > cc1: error: -mfloat-abi=hard: selected processor lacks an FPU
> >
> > Fixes [YOCTO #12795]
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-target.inc | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
> > index 56e4b95af4..92cad28b7a 100644
> > --- a/meta/recipes-devtools/gcc/gcc-target.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> > @@ -14,9 +14,9 @@ EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
> >  # specific). For example, for ARM, ARMv6+ adds atomic instructions that may
> >  # affect the ABI in the gcc-runtime libs. Since we can't rely on gcc on the
> >  # target to always be passed -march etc, its built-in default needs to be safe.
> > -EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
> > -EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
> > -EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve"
> > +EXTRA_OECONF_append_armv6 = " --with-arch=armv6${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
> > +EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
> > +EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
>
> Does this work for gcc7?
>
> >  # libcc1 requres gcc_cv_objdump when cross build, but gcc_cv_objdump is
> >  # set in subdir gcc, so subdir libcc1 can't use it, export it here to
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

