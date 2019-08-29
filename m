Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id ADC3A7F333
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 15:31:17 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id n19so2835109lfe.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 08:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pDhRWi2VGQUeMiRGpT4BPss7yzBFn3RqvKMRhsMK+ho=;
	b=mXY7d8nnxOVvlrNYVqlq4FVqzwbj5NUtWJhgwFXWkHmJhzn3Cu2iYv7drgUAJDaMxE
	ArenEJPGJI7InTtvMF723OU6uBnHxX1+nmWeGn2K3/liegq3I/xQHg9EqlEdVgqn3yoD
	dWJpHQl1TYB3T5kwmAbcD/P9Un19tY7iDrxM4BBCG5nQer5ShL1i5o4VahusIFJoVEwt
	/laRqYtsqMu0tm2x1/lGMTmmjnF7iAqZ7GLZgQofd+FZBgGrXjHvdlxSXTYP9oqwkS/b
	ufS8rYJ/FSHcSmj4T5ddWeSfl5S3jM2FTCQE9Or5Q1ckq3ISGImrrI7nni0Cok4wKCmV
	C72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pDhRWi2VGQUeMiRGpT4BPss7yzBFn3RqvKMRhsMK+ho=;
	b=ZsKFDd07QduBiTX8ruPpdhaPjGQoQZHP3PD4JQfgdiH5RPSebR09WKnCxjvEscuZrI
	uLkMz+j5QMKyXhAgjcpwRVlawnElIQWvJZI9rKgxifIyhmlSgpejFriBiY9L/lg042vC
	M62Blw6MuDbdOSRZIxaH2GRIxxxaxFZflWGCifWiDBQXBNju6pYw2fcHThJzF5B0vNUZ
	/ODuiS5TJ0jikhrxZ5nBR3PxJcqO+ngRMXI2UkHczGFYKpbo3hgn+1l2bAvvLk+wONNd
	uiD9/HlR34iitEDcxydv23x834N96Gpd+eL4T16j5LWklLqkIT8iX8D34dcEqdYxA5b1
	48/g==
X-Gm-Message-State: APjAAAUSJJQStp7ZhdB4MPfgBY15ycHWN+PQgzUCw7FcvD4HPHUDTB4T
	PCdh3WvGg1RZbNTjPlxz7DWxsiDVDV+nKi7D9yI=
X-Google-Smtp-Source: APXvYqx/UnFtTHGNb5BdbjTH/duXWD46WoI9BbF7pGxsYsP07njO5rqYnzKNxbzQ4Mgg73lKqFlBu4yGHWO5k9qj6Y0=
X-Received: by 2002:a19:428f:: with SMTP id p137mr6735886lfa.149.1567092678054;
	Thu, 29 Aug 2019 08:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
	<28547fae8ada44e4f2383f02bd1d8e0f3ce96b52.camel@linuxfoundation.org>
	<CADkTA4MHrS0y7Movz5JSmrFc9dSKCEdOxOwV=dCteNnktibNCg@mail.gmail.com>
	<CADkTA4ONrm_Xtr9Mcdj359m5xqFqzKTzN8bB=VnRn2PKRxP+Wg@mail.gmail.com>
	<20190829152736.GA4696@joraj-alpa>
In-Reply-To: <20190829152736.GA4696@joraj-alpa>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Aug 2019 11:31:06 -0400
Message-ID: <CADkTA4PybRmDHYumSEjULoaiXKDL9H4oXv6H7jOQv4VfsbOk1g@mail.gmail.com>
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
X-List-Received-Date: Thu, 29 Aug 2019 15:31:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 29, 2019 at 11:28 AM Jonathan Rajotte-Julien
<jonathan.rajotte-julien@efficios.com> wrote:
>
> >
> > FWIW: lttng-ust builds fine for me with the 5.2 kernel + 5.2 headers,
> > it is one of the things I build and test as part of
> > core-image-kernel-dev.
>
> Even on ppc?
>

yup. I build all arches for core-image-kernel-dev, which includes all of lttng.

Bruce

> It seems related to the y2038 safe socket merge
> (a98dc6aee784a5daf84a4781dcf02feab9ad5999) from the kernel but from the
> code I cannot find a reason why SO_SNDTIMEO would be missing. The powerpc
> socket header relies on the generic one for proper backward definition of
> SO_SNDTIMEO:
>
>  #define SO_SNDTIMEO (sizeof(time_t) == sizeof(__kernel_long_t) ? SO_SNDTIMEO_OLD : SO_SNDTIMEO_NEW)
>
> Not sure what is going on here.
>
>
> > I just rebuilt it here this morning and didn't see any errors.
>
> >
> > > >
> > > > qemuarm is erroring due to /dev/fb0 disappearing, which is probably kernel?
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/975
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/976
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/986
> > > >
> > > > and we also have an unintended side effect multilib build failure:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/995
> > > >
> > > > which might be due to changed dependencies, I need to check into that one further.
> > > >
> > > > Cheers,
> > > >
> > > > Richard
> > > >
> > > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
> --
> Jonathan Rajotte-Julien
> EfficiOS



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

