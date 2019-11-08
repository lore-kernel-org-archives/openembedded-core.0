Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 585D37F847
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 23:02:11 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id m9so7844270ljh.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2019 15:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hGgXoyg4enY6kU5wQOS4zSg1lhHyLA6C2nwigwUWsCw=;
	b=C1+FYK7ilbi9iN6yhU38ijRh3kR/2Hqh0oNNK9b8ENs450uKF5LNmZTnlmrkDCJB7u
	oDl/5iHT6ILd5PVd+dhKFh1ZmPY2spVj7NZD34/bYcKYg7DoZ8k3hYb+wc0lCqz6GmOR
	9+WNmMG1748Kyg204pcJKVoN3mgesS6IBSWm9SNuMVGptTxPBVfjF5VsaWCpkM2E57V0
	2NN2kCNhtRCZRK3DVXRY2mGSLF/idTjNPXpOCleBMAEx/UfEJOw7LuswwbW/IHhSQFVR
	yTb8blow9Mz9TgqbOUx/UFUC9WknNoRywCHCBBDjITO7yTjW4uSDmWl7+csOXX8qdfeF
	jLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hGgXoyg4enY6kU5wQOS4zSg1lhHyLA6C2nwigwUWsCw=;
	b=NmH3hvJT+HMMhrE+64iAhpazP7v2FfYbyGaNRvOiRMdjd6TOcrG4kIB+yIlI8M8Anx
	9ZibqzGJ+41ljwFIAgGegTTdTwVfjdcEbG/eRXfwiC0dGB7L40Tw91g0THeO98sRC/1d
	Tk2ZlK2Mh5TRtkW/lbdzn5xiIa8e0cEDJs9cXvQak3hesoFpaXxM+ytH9MW1X81gsltE
	MQMC5WcJLAOaRigi73TiFzfY6zWbRg6mrJLBc7z4z4kA6h25b5b1tutgb7iBE1Fqp/p2
	NspWKRmLjifmseXJun1IKaNuRgNT+G8ohW0mv7SythO5D9deEeJEQwYSN4qbIbKnHEB0
	NjZQ==
X-Gm-Message-State: APjAAAUyJHvaOD7VF6t8Um+7CzqPFWTil9S94902k8W1QSjkHMYIqPIy
	fm+ndxAu41wy+31Ed429f6ska5vMsc9LCwVaI6c=
X-Google-Smtp-Source: APXvYqwoFzO+UAMk+6AYHERSp7yrOPcpTr34cP2MRzC73K4s2iqrNxcW5y2ty7szSwfQkV5YEhw5M9kS7QoHMyVhGxs=
X-Received: by 2002:a2e:7301:: with SMTP id o1mr216676ljc.16.1573254131751;
	Fri, 08 Nov 2019 15:02:11 -0800 (PST)
MIME-Version: 1.0
References: <20191104224805.3149-1-alistair.francis@wdc.com>
	<fd81b5bc-cb84-8857-ea5e-bce2c931750b@intel.com>
	<CAMKF1srMzPL4pBAQYscX6fxPPL2SExcYFw+Ti2B656nK3hyH0g@mail.gmail.com>
In-Reply-To: <CAMKF1srMzPL4pBAQYscX6fxPPL2SExcYFw+Ti2B656nK3hyH0g@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 8 Nov 2019 15:01:45 -0800
Message-ID: <CAKmqyKNtUpuqodwxjsseOwdQn3AhG+yU0kJx1K0DCXH3sc4VBw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Fri, 08 Nov 2019 23:02:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 8, 2019 at 10:13 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Nov 8, 2019 at 2:32 AM Ross Burton <ross.burton@intel.com> wrote:
> >
> > On 04/11/2019 22:48, Alistair Francis wrote:
> > > From: Alistair Francis <alistair@alistair23.me>
> > >
> > > Upgrade mesa and mesa-gl to 19.2.1.
> > >
> > > The license hash change was a trivial new line removal.
> > >
> > > The glx-tls option was removed as it isn't included in the meson.build
> > > file. It has been replaced with 'use-elf-tls' instead.
> >
> > I think this has regressed something, this is a new warning on musl builds:
> >
> > do_package_qa: QA Issue: ELF binary
> > '[...]libgles2-mesa/usr/lib/libGLESv2.so.2.0.0' has relocations in .text
> > [textrel]
> >
> > (ditto for libGLESv1_CM.so.1.1.0 libGL.so.1.2.0 libglapi.so.0.0.0)
> >
>
> right this means glx-tls is not working anymore, and it will fail on
> musl at runtime
> see
> https://gitlab.freedesktop.org/mesa/mesa/issues/966

So what do we do here?

There are some patches in that issue, but they don't cleanly apply and
seem hacky anyway. Can we have two versions of mesa? One for musl and
one for others until this is fixed upstream?

Alistair

>
> > Ross
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

