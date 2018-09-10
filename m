Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id EFDD76079F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 18:09:36 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id h138-v6so14982090qke.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 11:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Yag14NWg9tWWczuGPfco0fh0WU5TvDdK8dhCYF3tVKc=;
	b=imsTCeIK1IbzoVybVBDa49c0Yq/Lr87+/34u/23vAS29Ag2pNnvJt7eh18zX7GuDSr
	jRae7LTaljaSxNiWfAToEIQOwhivkfqGMCeHrt6gMJT5b93OneV8BrQmvy8/vDTdErQL
	A9KhjDPexAe4VfwsGWlI4Qf1GYG7uX5eTs/9cwEZujfFwSQSlvqBuU+d3spijgyIqqGk
	Id66AMi8RZRxVACaZN5kO5/b9802rRSbZE+MrM7y1pRaF2VxMexzBJ2SnVh3OZDWwqga
	3FXzHbnu14HRlrxKZhUBTtMr5KjTf1rL1XrI5t87hi4hU/nYaC6PMroTRAlhGLFqgqLn
	5Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Yag14NWg9tWWczuGPfco0fh0WU5TvDdK8dhCYF3tVKc=;
	b=F4QNalMCh8dP0cSr89FtyDop+D119dvO9ed0TRTjdKpZW2A3ZyBEJQ8C6JnlcEoh15
	ZqHE1z8CoB3QsvoIXC4gFi73FnoBojirTwH2jhZqXO2pgmBRVuKgGPLAISjDep9iYT1V
	6FTjq5ykryK/hasP/eCsil84f1AHDSPY2P1GD+bRUYbjQmPJP9C8lmqyWbUwuLsUhLnp
	CPvLdkAZfo0n4gi/YVK8nNKoyt7kmRFSwyYx2ZiwbRgaf6y2Gv+K9m63rlxpsIT237a2
	Zf8+e8gEUoC+LJwogtiwHBSo6ylEHmPf0oIOyxNXDXZtT+/okS7/74MqQBNLSfTqbkAd
	WxsA==
X-Gm-Message-State: APzg51DN+iGIafGqyffxOPsz539tzIEOh17W866qZToynqYUK1yd3Jfy
	9Ez1CTh9OuwFtDqLvvUk3YzE6SIFzMq1n6yNHF4=
X-Google-Smtp-Source: ANB0Vdb0Zo5Jdq0iR1GVRESWl9xNQzQj6GT8ROJFUUP8BdraxSY/ICrxO1qyhB2QekUOj3k5y9zh4vEzAOdWvmdMny8=
X-Received: by 2002:a37:ac02:: with SMTP id e2-v6mr16292843qkm.2.1536602977411;
	Mon, 10 Sep 2018 11:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
	<CA+chaQfSBfzWoDKkWH0arU388zqewFMVKQ+bJwo4TMABZhAiog@mail.gmail.com>
	<a12df2950bb8cbe607429ba26247543ba63367af.camel@linuxfoundation.org>
	<CAMKF1spTfZD2B19zQFH+PhAytChCe1k-05ma2QQ9TCVp3TNrgw@mail.gmail.com>
	<fbe407b0f91278f2d416884eb1d737af30a20808.camel@linuxfoundation.org>
	<CAMKF1sp9uBnKKKu5nTKu_dS2=onTJvOgeroNDQtNx4DrWqBeRg@mail.gmail.com>
	<CAJ86T=V2QTuiz=KzNzZeyLKyvZd6m+ZPKmkP+tZwhfM_=fTASg@mail.gmail.com>
	<CAMKF1sqWuf8sQj7TA_G-prWpOB5mtXo7F8k_K0bj2ufHXRa6Yg@mail.gmail.com>
	<CANNYZj9rQ-vFT09JPs0pJ46HEYK8_UNzA5Di9G6OXosHOKt3mQ@mail.gmail.com>
	<20180905085322.GA1795@jama>
	<e7847d5e6eb6103ddf02e6da14a1449227e5665a.camel@linuxfoundation.org>
	<CAMKF1sqynK2-5b9ex5fcLW3s2XTH086Ajps_-50stxVvGX9xLQ@mail.gmail.com>
	<CAJ86T=V78dXJH8rOdN2LAshL8UqsC5aJ_njU8Dra9M=tCcBhgg@mail.gmail.com>
	<CA+chaQdkmKDwrAT1Cq-tYApxMKHrSx36QDdLEAHaXp4GO+h0UA@mail.gmail.com>
	<CAJ86T=VhxA4nq=UhBcU24qPci5E7C8PRHtG=rrhSCT8AjLSRZA@mail.gmail.com>
In-Reply-To: <CAJ86T=VhxA4nq=UhBcU24qPci5E7C8PRHtG=rrhSCT8AjLSRZA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Sep 2018 11:09:10 -0700
Message-ID: <CAMKF1somSiGY20w3duezeikj-8Rpha6_J1QkHHtdqcgKaOCgcg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/6] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Mon, 10 Sep 2018 18:09:39 -0000
Content-Type: text/plain; charset="UTF-8"

we are good with fixes in master-next
On Mon, Sep 10, 2018 at 10:54 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Wed, Sep 5, 2018 at 8:55 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > https://wiki.debian.org/OpenSSL-1.1 says it will cause runtime bugs like
> > segmentation faults or just misbehaving applications.
> >
> > On Wed, Sep 5, 2018 at 5:45 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> >>
> >> On Wed, Sep 5, 2018 at 8:15 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >> > On Wed, Sep 5, 2018 at 7:45 AM Richard Purdie
> >> > <richard.purdie@linuxfoundation.org> wrote:
> >> >>
> >> >> On Wed, 2018-09-05 at 10:53 +0200, Martin Jansa wrote:
> >> >> > But patching the components to use libssl10 might actually work
> >> >> > (unlike
> >> >> > just changing DEPENDS to openssl10).
> >> >> >
> >> >> > It's not only conflicting in build-time in RSS, but it will conflict
> >> >> > on target as well. You either need to migrate all components included
> >> >> > in image to 1.1 or all stay on 1.0.
> >> >>
> >> >> That isn't quite the case. For OE-Core we have images using both 1.0
> >> >> (openssh) and 1.1 installed together. Its true there are some issues if
> >> >> you try and parallel install both the -dev packages but normal target
> >> >> images are working.
> >> >>
> >> >> We could probably "fix" the -dev images to an extent by making 1.1
> >> >> replace 1.0 dev pieces.
> >> >>
> >> >> The build time sysroot problem is harder unfortunately, I've ideas
> >> >> about things we might be able to do but haven't experimented as yet.
> >> >>
> >> >
> >> > If runtime conflicts are clear
> >>
> >> I don't think the runtime issues are clear.
> >>
> >> Being able to install both versions of openssl on the target and have
> >> them be used by different applications is one case (already solved by
> >> different sonames).
> >>
> >> But the builds that are failing in meta-oe are a different case - a
> >> single application is indirectly linked against both versions of
> >> openssl. Loading two versions of openssl into the same address space
> >> at runtime hasn't been solved... and may not be realistically solvable
> >> - e.g. what happens if code in an app compiled against openssl 1.1
> >> tries to share an openssl data type with code in a library compiled
> >> against openssl 1.0?
> >>
>
> Any further comments?
>
> How are the meta-oe world builds looking now after the recent fixes?
> Are there still issues?

