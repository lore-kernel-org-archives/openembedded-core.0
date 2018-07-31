Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 029E6606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 01:06:41 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id y10-v6so9160655uao.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 18:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7mlCmt9z6nJ0IgfIdT3Z45FttDyhUsCaq0yRUwDTMJU=;
	b=otIuhOE09xyR+rjkqIyXcIzf87R5Crs06vXV/GmSYfaHWZHggp8mfVFJ7jVIqC459E
	9N5c5RikAV8hdVvUrkkK8p0XDzisKsThWkjd2rN1c0FsjgYTbEUsvFwEAQE9oAaodK7h
	uC0FvyDEc+vx6p6YvtYFoKxSHt0wW1s+bJea2wZjEop8xoHdiOIk4uJOY4F/pgujMREL
	Hey4nMCfW6Y7q0JbpIgYSmeHm/NAbO4AO2R02o/Cl9u9BiKPrvP3+tMj6OXhbDkdKa17
	MARx1gQGcX2ihtpxNcUFHOSs8O2+RzPXklV0im03VKHQ3DN5mDikCA+9kQPDPl0uEY2Z
	vCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7mlCmt9z6nJ0IgfIdT3Z45FttDyhUsCaq0yRUwDTMJU=;
	b=VRCJ6iCb07aXScDWKbHnWaYnpJB89X3ZeRodulDWPtpB19Si+kjlrA9YTah0xnADy7
	oJlpXl8kKLqBzKomx5/NgF/3ZtmthP6tFjU8mVhby6eVFjUdJpmUarbh58oOTTe0i+JD
	NeoBJPeH2WbEgHMKcuIvNMPALjdCQ8q7O5lxVFJ8cvz7acAJJE+MeUkIka+b7tDQu1H2
	xLCx9GzrTtz1lnIPJHW/wxSAyIq5ax0xiiMuUZzQDnFvsVZVpyxrarz0mxK5A3xHy4v4
	9+HdRu5Hn1bckloUIy2rO6lWAN9CF3WHrFcb5fsMjoJkwzftKf7yUPimsoPoqIr46Er/
	WBeQ==
X-Gm-Message-State: AOUpUlGqY76B8lOQQ58Cpydrjz+NwizU/+AQCCFEozI9iVuvDwapRs+6
	0Gc6L3rxmtaXK8nmHTalQ3X6uGgg75PxCSnFmzA=
X-Google-Smtp-Source: AAOMgpfbuk1W2MF7qp0uxsHdWn2nI+o13A1b1Ghxyg7/dZe0JrmAk/qq8XiC11JcFYQ11aAu8EGwrCC8j9wMQjFvCGI=
X-Received: by 2002:ab0:1544:: with SMTP id
	p4-v6mr13972760uae.81.1532999202756; 
	Mon, 30 Jul 2018 18:06:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Mon, 30 Jul 2018 18:06:42 -0700 (PDT)
In-Reply-To: <44b28ecdf9da3f1edab59861a7b32c4e11d0eead.camel@linuxfoundation.org>
References: <CAJ86T=WuVBc-WEE4+fKSd_qeTKJmd1VTmRGvB03KXqTZvB031Q@mail.gmail.com>
	<44b28ecdf9da3f1edab59861a7b32c4e11d0eead.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 30 Jul 2018 18:06:42 -0700
Message-ID: <CAJ86T=WuS3DBEYkLqrKACKdWQT9CZw6=_LLQj1KWFh3TzFjEcQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Is a dependency on hostperl-runtime-native actually useful?
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
X-List-Received-Date: Tue, 31 Jul 2018 01:06:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 30, 2018 at 3:23 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2018-07-30 at 14:44 -0700, Andre McCurdy wrote:
>> Currently the openssl 1.0 recipe defines a dependency on
>> hostperl-runtime-native and the openssl 1.1 recipe does not. Both run
>> "perl ./Configure ..." as part of do_configure().
>>
>> Since hostperl-runtime-native is included in ASSUME_PROVIDED, is it
>> really useful for the openssl 1.0 recipe to list it in DEPENDS?
>>
>> ie is the openssl 1.0 recipe being unnecessarily complex or is the
>> openssl 1.1 recipe being too simplistic?
>
> It is useful for things to list their dependencies and we did have an
> effort to actually list things out so we know ASSUME_PROVIDED is
> correct. This means we can spot areas we might be able to trim back
> dependencies (amongst other reasons).
>
> With the introduction of HOSTTOOLS, its perhaps less needed than it was
> but in principle it is still useful to know which things need a given
> item, particularly where its more unusual. I'd still be interested in
> trying to cut back HOSTTOOLS a bit more.
>
> The 1.1 recipe was pretty heavily cut back, probably too much so based
> on some of the patches we've been getting...

Thanks. Is there an obvious reason why both recipes shouldn't be using
perl-native rather than hostperl-runtime-native? Building with
perl-native seems to work fine.

