Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6366FC4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 15:04:41 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.13937.1668783873679600505
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 07:04:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZmIjvQhw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id v7so3827089wmn.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 07:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ap+NDRge2BNzmSblzvfnjwY4qZbqj2sRHOxgG3XIlNo=;
        b=ZmIjvQhw4xBPmi6x6bMHx1bud1rOX0V/E9ssNvcLZBYRNCo6o33G6GccvLQlM+Xq5p
         PNUMoP0JTvcOHxAj6TNL1xTsGejbhwd/WnccE1Yqck9/eSHZtVVjIvQnoputqgLJpzD2
         9fc/9xUdTIc3jxGKt5ApfizgzSUQFs8JQGC/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ap+NDRge2BNzmSblzvfnjwY4qZbqj2sRHOxgG3XIlNo=;
        b=d54OGPBU2AISWpPx4N2p73jFW2i3fiidScUiTF7t09V/BjQ1SYam12ogxKRXXImccc
         L4eikSR6ncvwVA0PZlRXiCVH2ZwRZO/Hybi1w/zHZxa6mUhdsxWjPROST+hdkPNSEZiD
         s4Ivs0J4dCQKBJxi1JAFpz6Y7k35vJIBUBJDZgf3BLahm5IDmiO4sNedFVjEMVn+cIdI
         8EqOlUIWlTLidaimpmlt4dqRE8MLDaf3V1hyorthBkY5mLh+hUKVuSRVQc7JYhP27D+a
         AGabVz2HL7CIvLfd4OoErv8HTrOymihDmLrdpUbdEXapx6m6CAruC9HVYEGKdT4EOV0z
         USsA==
X-Gm-Message-State: ANoB5pmWmqyzl9GGhNZm4djbP4Sewj2E1vsTu5S64FHsWPOjVIhQF04O
	Vzs6LBA716KxXp1W2Bdcgw5GUA==
X-Google-Smtp-Source: AA0mqf7us9+tT+vgxw6RGx6FxhUS/KyJP5Hazk5rQ+Xi4R/PMaO0wxeVl56hNvR3HvrbV1McFJVQGA==
X-Received: by 2002:a05:600c:3acd:b0:3cf:550e:d7a2 with SMTP id d13-20020a05600c3acd00b003cf550ed7a2mr5129574wms.97.1668783871919;
        Fri, 18 Nov 2022 07:04:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a603:eef1:6736:def4? ([2001:8b0:aba:5f3c:a603:eef1:6736:def4])
        by smtp.gmail.com with ESMTPSA id z2-20020a1c4c02000000b003cfe1376f68sm4708606wmf.9.2022.11.18.07.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 07:04:31 -0800 (PST)
Message-ID: <6b088587f876fd2cf76ad8b1b13fac6a7c92cfc6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/2] image specific configuration with oeqa
 runtime tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 18 Nov 2022 15:04:29 +0000
In-Reply-To: <Y3eXdWibCGQBV6Wt@nuoska>
References: <20221117071223.107064-1-mikko.rapeli@linaro.org>
	 <5b79cba0817750882a0ef1f1dd9b9581abc9db28.camel@linuxfoundation.org>
	 <Y3ZVup8YKv6LQzuF@nuoska>
	 <4f16ed270c2b979839830929c703494d221b2228.camel@linuxfoundation.org>
	 <Y3eXdWibCGQBV6Wt@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 15:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173465

On Fri, 2022-11-18 at 16:32 +0200, Mikko Rapeli wrote:
> Hi,
>=20
> On Thu, Nov 17, 2022 at 04:57:36PM +0000, Richard Purdie wrote:
> > On Thu, 2022-11-17 at 17:39 +0200, Mikko Rapeli wrote:
> > > Hi,
> > >=20
> > > On Thu, Nov 17, 2022 at 03:17:43PM +0000, Richard Purdie wrote:
> > > > On Thu, 2022-11-17 at 09:12 +0200, Mikko Rapeli wrote:
> > > > > Many runtime tests would need customization for different
> > > > > machines and images. Currently some tests like parselogs.py are h=
ard
> > > > > coding machine specific exceptions into the test itself. I think =
these
> > > > > machine specific exceptions fit better as image specific ones, si=
nce a
> > > > > single machine config can generate multiple images which behave
> > > > > differently. Thus create a "testimage_data.json" file format whic=
h image
> > > > > recipes can deploy. This is then used by tests like parselogs.py =
to find
> > > > > the image specific exception list.
> > > > >=20
> > > > > Same approach would fit other runtime tests too. For example syst=
emd
> > > > > tests could include a test case which checks that an image specif=
ic list of
> > > > > services are running.
> > > > >=20
> > > > > I don't know how this data storage would be used with SDK or self=
tests,
> > > > > but maybe it could work there too with some small tweaks.
> > > > >=20
> > > > > Mikko Rapeli (2):
> > > > >   oeqa: add utils/data.py with get_data() function
> > > > >   oeqa parselogs.py: use get_data() to fetch image specific error=
 list
> > > > >=20
> > > > >  meta/lib/oeqa/runtime/cases/parselogs.py | 17 +++++++---
> > > > >  meta/lib/oeqa/utils/data.py              | 41 ++++++++++++++++++=
++++++
> > > > >  2 files changed, 54 insertions(+), 4 deletions(-)
> > > > >  create mode 100644 meta/lib/oeqa/utils/data.py
> > > >=20
> > > > This patch looks like it is one side of the equation, i.e. importin=
g
> > > > the data into the tests. How does the data get into the deploy
> > > > directory in the first place? I assume there are other patches whic=
h do
> > > > that?
> > >=20
> > > Patches in other layers do that, yes.
>=20
> Note to self and anyone else interested in this, it is rather
> tricky to get SRC_URI and do_deploy() working in image recipes.
> Something like this will do it though:
>=20
> SUMMARY =3D "Test image"
> LICENSE =3D "MIT"
>=20
> SRC_URI =3D "file://testimage_data.json"
>=20
> inherit deploy
>=20
> # re-enable SRC_URI handling, it's disabled in image.bbclass
> python __anonymous() {
>     d.delVarFlag("do_fetch", "noexec")
>     d.delVarFlag("do_unpack", "noexec")
> }
> ...
> do_deploy() {
>     # to customise oeqa tests
>     mkdir -p "${DEPLOYDIR}"
>     install "${WORKDIR}/testimage_data.json" "${DEPLOYDIR}"
> }
> # do_unpack needed to run do_fetch and do_unpack which are disabled by im=
age.bbclass.
> addtask deploy before do_build after do_rootfs do_unpack

Since the image code doesn't need SRC_URI and has it's own handling of
deployment, we didn't really anyone should be needing to do that :/.

> > >=20
> > When you execute later, are you going to use testexport or will the
> > metadata still be available? As I mentioned, removing testexport would
> > be desirable for a number of reasons but I suspect there are people who
> > might want it.
>=20
> I was planning to use testexport and also make sure all images and other
> things needed for running tests are in the output of a build.

I guess that means if we were to propose patches removing testexport
functionality you'd be very much opposed then? :(


>=20
> > > > The second is the "testexport" approach where the tests are run wit=
hout
> > > > the main metadata. I know Ross and I would like to see testexport
> > > > dropped as it complicates things and is a pain.
> > > >=20
> > > > This new file "feels" a lot like more extensions in the testexport
> > > > direction and I'm not sure we need to do that. Could we handle this
> > > > with more markup in the image recipe?
> > >=20
> > > For simple variables this would do but how about a long list of strin=
gs
> > > like poky/meta/lib/oeqa/runtime/cases/parselogs.py:
> > >=20
> > > common_errors =3D [
> > >     "(WW) warning, (EE) error, (NI) not implemented, (??) unknown.",
> > >     "dma timeout",
> > >     "can\'t add hid device:",
> > >     "usbhid: probe of ",
> > >     "_OSC failed (AE_ERROR)",
> > >     "_OSC failed (AE_SUPPORT)",
> > >     "AE_ALREADY_EXISTS",
> > >     "ACPI _OSC request failed (AE_SUPPORT)",
> > >     "can\'t disable ASPM",
> > >     "Failed to load module \"vesa\"",
> > >     "Failed to load module vesa",
> > >     "Failed to load module \"modesetting\"",
> > >     "Failed to load module modesetting",
> > >     "Failed to load module \"glx\"",
> > >     "Failed to load module \"fbdev\"",
> > >     "Failed to load module fbdev",
> > >     "Failed to load module glx"
> > > ]
> > >=20
> > > Embed json into a bitbake variable? Or embed directly as python code?
> >=20
> > I've wondered if we could add some new syntax to bitbake to support
> > this somehow, does anyone have any ideas to propose?
> >=20
> > I'd wondered about both python data and/or json format (at which point
> > someone will want yaml :/).
>=20
> This sounds pretty far fetched currently.

Not really. If we can find a syntax that works, the rest of the code in
bitbake can support that fairly easily. The datastore already handles
objects of different types.

> json files are quite simple to work with in python so I'd just stick to=
=C2=A0
> this. If this approach is ok I could update the testimage.bbclass=C2=A0
> documentation with these details.
> I really want to re-use tests and infratructure for running them but I ne=
ed
> to customize various details.

My concern is having multiple different file formats and data streams.
It means we no longer have one definitive data mechanism but two, then
the argument for people also shipping yaml and other files with recipes
also becomes difficult. We'd also have people wanting to query from one
to the other eventually.

The real issue here seems to be that our data format (.bb) is
struggling with some forms of data. I've therefore a preference for
fixing that rather than encouraging working around it.

Cheers,

Richard






