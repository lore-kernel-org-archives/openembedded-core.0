Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3C77D58A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 12:03:15 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id m186so2896913itd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 05:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MSDWiA7DDZncqv94113M7ENv8fiTbcXOdWf3ABhhxyI=;
	b=G02EayjTqmn0juvXn/7pjcTKD4Af1MdPo6HDjfGFgpm432WUfto2DJjW29Gy0MYbEl
	AmRxWMiRR6mwrLUgwHielQ8QhKsr+6yiEowEMnymCne9P80sRLlZtjmgSa1OX90BvC96
	At4htLMjMAPIT4G/E0J9JlekTB8FP9P1P/jZjT0RejZ8TBBzbxX0uUlJlyVP57ZfMuNP
	mfAC2LOCnNK1xqa48De2T6r10mfI+aTs0MIAdLlBdbrf8OWD4XOX2czfA0eQ8lolt6T/
	YpQgkrsGzxyysKTkoquF/4ctbH9KpI/44R3y71UScXZ0gkX36PjOFo2zHH/KczFdBZ91
	SNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MSDWiA7DDZncqv94113M7ENv8fiTbcXOdWf3ABhhxyI=;
	b=ndGXQLTBxo2zvzdv5drRbZNFgx/x0oFlw2WaL6uf3mnTJv9omyNSilsztB+LEqErMg
	IktTLuCCS2blJYSNACrIH6EsodmjCrHKIGYSrPQ8OBEPLoMT1RjMlkRM6fS2WCQoEhpT
	IhFFhqXZjw6V792AMcEpZ57A0a7xZu3DJe/HjK9twt9oownOO80Yw7OBVxSK6tqK0TEm
	O+0qzcBDkscETd0Lj0R5rgHId2QdtscFqVwAjSJZG6t11rm7yTUJmbdThg1i1+gtuA+t
	IQhgZDR5z3WWImHPlQxWQXAYpjxV80lkHQ09A16/i2HyIH2IUHy7acLWVYTsOSvEOrsw
	i55A==
X-Gm-Message-State: APjAAAVqLTFzVrkNyO2tmjM/QpC9wtEZqyDGGEuO1BPYcUCx8kmp2U/A
	K4kwwOmi+bwhZA+RXrmsvBgAMEtLG9LZGcZBNBg=
X-Google-Smtp-Source: APXvYqz8Iq48++Aqa6trzBJTQMtvTgZBAQWRRwhTNnYH0vdIsSOXfvePfgsb2p7FcWIJzJRLvbQH0Cx6KOYaTFHLeMo=
X-Received: by 2002:a24:9d46:: with SMTP id f67mr2544564itd.58.1557403397011; 
	Thu, 09 May 2019 05:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190508201335.1732-1-schnitzeltony@gmail.com>
	<CAJTo0LYRyARnYkRfumy_hXXNb6otVKhr0di0fyptBb208wQ4mA@mail.gmail.com>
	<CALbNGRRzzJQVM7-bt6hsq_FQzHxJ+QTjrwfj9NFgmuUWKvQKZw@mail.gmail.com>
In-Reply-To: <CALbNGRRzzJQVM7-bt6hsq_FQzHxJ+QTjrwfj9NFgmuUWKvQKZw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 9 May 2019 14:03:03 +0200
Message-ID: <CALbNGRTqaL-N0hgTrSywEvnuE_wAkP0+CvNssXp0V2AEucXJ+Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meson.bbclass: add MESON_CROSS_EXTRA_PROPS to inject properties into meson.cross
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
X-List-Received-Date: Thu, 09 May 2019 12:03:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2019 at 1:41 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> On Thu, May 9, 2019 at 1:04 PM Burton, Ross <ross.burton@intel.com> wrote=
:
> >
> > On Wed, 8 May 2019 at 21:14, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> > > Some projects rely on (cross)specific properties e.g [1]. By setting
> > >
> > > MESON_CROSS_EXTRA_PROPS=3D"var1=3D'value1' var2=3Dtrue"
> > >
> > > the required properties can be passed to meson.build. The contents of
> > > MESON_CROSS_EXTRA_PROPS behave same as known by e.g EXTRA_OEMESON.
> > >
> > > [1] https://gitlab.gnome.org/GNOME/tracker/blob/master/meson.build#L9=
1
> >
> > Or see https://git.openembedded.org/openembedded-core/commit/?id=3De04e=
0a20cab04966698c50dc79195a8f159248d3
> > for an example of how this is done already.
> >
> Sometimes the sending of patches is the secret attempt to gather informat=
ion :)
>
> Thanks
>
So for me to understand it correctly: adding multiple '--cross-file'
entries in commandline accumulates the contents of the files and it is
not the last that wins?

I am asking because help says 'File describing cross compilation
environment.' so I wouldn't expect this behaviour.

Andreas

