Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A807C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 13:15:02 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.42539.1669900497503741750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 05:14:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=an/nFk6m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 125-20020a1c0283000000b003d076ee89d6so1202569wmc.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 05:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nPdjUQA54IkedIRAp/zkJniU5FU32XlvhjUWGGbm8CQ=;
        b=an/nFk6mzUOid1TkOxaQJCYXN7NUiB1vyJ+a1xUgTmZm87LjvcqZjcITP84/iPeWrI
         6zcDqFk9zZeaileNh+7IEAhEhH4dXi3QO1d6JoyzJqSrbnpICegCFN9i6KMz9ckJ5/xR
         MAHC0k9oXBBuhAyVHIrtDujKBvsuxb5mRVOlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nPdjUQA54IkedIRAp/zkJniU5FU32XlvhjUWGGbm8CQ=;
        b=j5BbxP9KqxmtGdTNu0fROvN9vND2PBvQa6Ozxgj9insNdZ4hFbYA7kTqiho8rvpxF7
         /yNHyE0nSzo51mOPw/69xQhbLD9ZkfTdYetu6hZW/wQ3rwsY2FER8wVaD6ELbPVCNUhp
         NDKJL8Y6mikM3szPNQDRs4VOjHs5sDiSoV5QRy5ZMd+lEAUOsgDfL3la7eqJg+PpqaEL
         g0A6vw22dLZN6dXcZDAvIA8xwDfJ/knO98mqrxzUvqoW3hxz7K9Lkmyi2I9hMJ9oUXqW
         hUtCYPOwhYMzdHWpC+eV35yVpy/j3weV3AlkV7UzC3lEdYpFolsd67AMeO4JI85MMyy3
         NMkw==
X-Gm-Message-State: ANoB5pkdhemVL3riA71iq2S8+2S2K04C3ilcZbNZUKDljh2qX5Gi1l5I
	uHl+qGK2dBeK/aJRboGHCRCykg==
X-Google-Smtp-Source: AA0mqf69who1UnRAA4Zc0zsqK3RcKyUWcRIxCp2QQZsIP9C6h4lkZsO4BhT+8gohdl2nEbK0MjUNTA==
X-Received: by 2002:a05:600c:3514:b0:3cf:a985:7692 with SMTP id h20-20020a05600c351400b003cfa9857692mr41691898wmq.104.1669900495796;
        Thu, 01 Dec 2022 05:14:55 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3f4c:de93:c029:9984? ([2001:8b0:aba:5f3c:3f4c:de93:c029:9984])
        by smtp.gmail.com with ESMTPSA id a1-20020adffac1000000b0024194bba380sm4539825wrs.22.2022.12.01.05.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 05:14:55 -0800 (PST)
Message-ID: <a695e77fb8a6dbb8d9deec953b2767750aa3bbfd.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv9 1/4] graphene: import from meta-oe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, "f_l_k@t-online.de"
 <f_l_k@t-online.de>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2022 13:14:53 +0000
In-Reply-To: <0496E9D1-8A87-4F2C-9C6E-43CA4929D17E@arm.com>
References: <20221201075324.353632-1-f_l_k@t-online.de>
	 <0496E9D1-8A87-4F2C-9C6E-43CA4929D17E@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 13:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174058

On Thu, 2022-12-01 at 12:34 +0000, Ross Burton wrote:
> I=E2=80=99m a big GNOME fan[1] but I wonder if moving pieces of the
> GTK4/GNOME4 stack into oe-core because we want to upgrade epiphany is
> the right thing to do.
>=20
> It=E2=80=99s not the full GNOME stack as we=E2=80=99re just picking the b=
uild
> dependencies for Epiphany, so anyone who wants to use the GNOME stack
> will need meta-gnome. It=E2=80=99s not really a proper test of GTK4 becau=
se
> epiphany isn=E2=80=99t in any images, so will only get built in the few w=
orld
> builds on the autobuilder.  Because it is in no images there is no
> runtime QA for it, we could carry a GTK4 in oe-core that crashes on
> startup for a long time before anyone noticed.

There are a variety of pressures which say "lets move X or Y out of
core".=C2=A0It would be less work for me and for anyone else working on OE-
Core so there are advantages.

The downside to doing that is that we lose "real world" testing of
larger components and integration of them. webkit is a pain but in some
ways having large painful C++ code in core helps stress test that. By
real world I don't just mean someone using the end browser but even
just building it, enduring we don't have leakage of build paths into
C++ libraries, ensuring such things remain reproducible and so on. I've
said before that we do need a graphics stack somewhere in our tests
since in general graphics is important.

I think it partly depends on where we go with OE-Core. If sato stays on
gtk3+, we have a problem since that is a bit of a dead end. There is
still value there since it pulls together so many pieces of software
but as you say, gtk4 mixed with gtk3 like that isn't great.

If over time we see some pieces of sato using gtk4, that changes the
equation, this move could be a start of changes which put us in a
better position in the future.

Should we get rid of sato? I'm reluctant as we don't have a good
replacement plan. Ideas have been proposed but nobody is willing to
step up, propose and maintain something. We have a number of areas
where we could spend time and there are probably higher priority
issues. How much work is gtk4 in sato? No idea to be honest.

I do think OE-Core needs to have enough variety and represent enough of
the software ecosystem that it is useful in it's own right and is able
to test a good cross section of the software world people work with.

> WebKit supports both GTK3 and GTK4[2], so it=E2=80=99s easy enough for oe=
-
> core to either have one recipe with  PACKAGECONFIGs, or a well
> written flexible recipe that has a GTK3 variation in core and a GTK4
> variation in meta-gnome.  I believe webkitgtk also ships a dumb-
> browser application that would be enough to verify that webkitgtk
> actually works, because in production use the choice of browser will
> be based on more than just what is in core: maybe a custom shell
> using webkit, maybe chromium, maybe something else entirely.
>=20
> I=E2=80=99d even go as far as saying that maybe the meta-gnome maintainer=
s
> should talk to the autobuilder maintainers and get meta-gnome added
> to the autobuilder test matrix.  GNOME has strong support for
> installed tests so we can execute the ptests on the autobuilder, and
> have some basic runtime tests to verify that GNOME starts.

I would like to see more testing other layers on the autobuilder. There
are some potential points of contention:

a) OE-Core's test matrix often isn't what some other layer maintainer
wish to maintain (e.g. ppc or mips?).

b) the layers can influence the tests, for example would we need
reproducible builds tests with and without the layer?

c) What level of response can we expect to failures or issues?

d) Would those layers want to match the "quality" metrics we've been
aiming for in core (e.g. all recipes have MAINTAINER/HOMEPAGE etc.)?

We've had quite a bit of success putting a high quality bar on core and
we're trying to lead by example to other areas of the ecosystem but I
can see this creating tensions depending on how we set things up with
the autobuilder.

Cheers,

Richard

