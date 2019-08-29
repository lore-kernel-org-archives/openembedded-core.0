Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 46F987F2F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 15:33:07 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id x3so3481242lji.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 08:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UfA1Lg5p+Sfa/HxHFHAUGYfiVet1rEjUzExJDcC41xo=;
	b=RbgiuzWLyY54jgeaQwBpYZrOc95q+kkdjMVG7e8w3VZEBUaSAmUCxhLkac0EuYBD+5
	KXMId1Wayqtf7jXpMKx+Ubq2n3LCjcMogoUFNMc2muhWXlLfmyZTzYxa20kr0RS0/LG0
	NdhGlVzgfVy8enCWfKbG1MKPmaHMCJx3Rnr5zzlwuFkDoWZ2V3K2sINwMqsSAOeWsz1n
	icsYyB1mP7L93Uoxh0U/ZO3tfKsmA0g/xz2Wh3EZbhflVEZyE9tV9Qc4p69LnEuu9X1x
	loWbhTrz9aq7pockiNTeBf+8PX2kNMOixJmV6nApNa4NqtwLKv5cnRD6+mIqMPojn0R1
	hvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UfA1Lg5p+Sfa/HxHFHAUGYfiVet1rEjUzExJDcC41xo=;
	b=a6Tr9GHzMdR/brBEYgTfqIVvW0PEEQJmXsofZMR/r9js4wPn7apr1O0xnvOoiAa54x
	0kPmogf2rwrYQdw9sSgMeIuD2V3u/Dzt6buJvfZED591edIEcABUP9N2V1C/YAG9Dgf4
	n1X9Z8noKhp9Cy4NiRYAxbR+dreRQ5aDSgSQEu0QvE5Zza4QZPsVcqfgfOPSHWMhR4uB
	pZ/sp9nwe9jBhdd5S2gQmOFW0Bw7XHXJHTmUrxp3371lAOM+Uj1pqnArLZbn9Oz/OOhi
	r+2Y9cgatVo+2vi1X9yQtPBndKzU0Vy2uHxOKrEFvQ8MOt2fTV0xk2ct/5CqEJBDAstQ
	MfBg==
X-Gm-Message-State: APjAAAWZEWvn3pPj423upWbv6eiUy7mM8BE8nR5upk9AeYfQHJV82d1l
	fbPoBJvivE0B6+p+yjzSeXvPa9we5qObvV21Ytg=
X-Google-Smtp-Source: APXvYqzxcsqxe8o42LaHalmZqbUHfPV9iu67DEYiZIljoI6PD5kKClAKpk7brpI4BZPVYyKDc6X8+Ig0YVsdlOk0+sY=
X-Received: by 2002:a2e:b048:: with SMTP id d8mr6054620ljl.118.1567092787776; 
	Thu, 29 Aug 2019 08:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
	<28547fae8ada44e4f2383f02bd1d8e0f3ce96b52.camel@linuxfoundation.org>
	<CADkTA4MHrS0y7Movz5JSmrFc9dSKCEdOxOwV=dCteNnktibNCg@mail.gmail.com>
	<CADkTA4ONrm_Xtr9Mcdj359m5xqFqzKTzN8bB=VnRn2PKRxP+Wg@mail.gmail.com>
	<20190829152736.GA4696@joraj-alpa>
	<CADkTA4PybRmDHYumSEjULoaiXKDL9H4oXv6H7jOQv4VfsbOk1g@mail.gmail.com>
In-Reply-To: <CADkTA4PybRmDHYumSEjULoaiXKDL9H4oXv6H7jOQv4VfsbOk1g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Aug 2019 11:32:56 -0400
Message-ID: <CADkTA4Mf9u09J=M5xZx518va22xwUDqr=E4Xyq9jn2S2LLPevw@mail.gmail.com>
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] kernel-yocto: misc build / config changes
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
X-List-Received-Date: Thu, 29 Aug 2019 15:33:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 29, 2019 at 11:31 AM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Thu, Aug 29, 2019 at 11:28 AM Jonathan Rajotte-Julien
> <jonathan.rajotte-julien@efficios.com> wrote:
> >
> > >
> > > FWIW: lttng-ust builds fine for me with the 5.2 kernel + 5.2 headers,
> > > it is one of the things I build and test as part of
> > > core-image-kernel-dev.
> >
> > Even on ppc?
> >
>
> yup. I build all arches for core-image-kernel-dev, which includes all of lttng.

but I've recently switched to RP's master-next branch, so hopefully a
difference in the configs will pop out.

Bruce

>
> Bruce
>
> > It seems related to the y2038 safe socket merge
> > (a98dc6aee784a5daf84a4781dcf02feab9ad5999) from the kernel but from the
> > code I cannot find a reason why SO_SNDTIMEO would be missing. The powerpc
> > socket header relies on the generic one for proper backward definition of
> > SO_SNDTIMEO:
> >
> >  #define SO_SNDTIMEO (sizeof(time_t) == sizeof(__kernel_long_t) ? SO_SNDTIMEO_OLD : SO_SNDTIMEO_NEW)
> >
> > Not sure what is going on here.
> >
> >
> > > I just rebuilt it here this morning and didn't see any errors.
> >
> > >
> > > > >
> > > > > qemuarm is erroring due to /dev/fb0 disappearing, which is probably kernel?
> > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/975
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/976
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/986
> > > > >
> > > > > and we also have an unintended side effect multilib build failure:
> > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/995
> > > > >
> > > > > which might be due to changed dependencies, I need to check into that one further.
> > > > >
> > > > > Cheers,
> > > > >
> > > > > Richard
> > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > > thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> >
> > --
> > Jonathan Rajotte-Julien
> > EfficiOS
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

