Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4362DC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 16:57:43 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.1248.1668704260800351207
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 08:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g+v0/MyG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5so1835008wmo.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 08:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bD0bfsgMBEFEe3vIDGvVcym3odGwnzF8Oa6dbkVTWvc=;
        b=g+v0/MyGgT24tTAddIQe7ySRayKvoWZxul4qUno/ei6DtBSnaiCGVO3duOQ1w5rXzu
         dHR0BdIoTKqiWMFgCd7jz3Z9wzfLl70Vc9Ww91pWKKOcb212YPti3S8lgdNfZVmxSPA2
         MtVk+snee/96Xf9TwTVo2V6fTmgV2UXMFh9cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bD0bfsgMBEFEe3vIDGvVcym3odGwnzF8Oa6dbkVTWvc=;
        b=CNWSqnRrnwOlhO8lRptT3L8DRwcCnATN6cKjarn/8bE3mpEqM2lj7jBmsu06KKZcG9
         Go1ckQR4rJdhHOvJ7kWvOWl3PpqfLLPU0qFEymdr7EjVP+SMXxoU9kyxWXF9VxTrvY/+
         5u2ehh8JvfVATPuMj/gRc3JtbwGmc69kli4TMz5SxcPbauIQELbfxZ6qD9ewW0MGDj83
         tFzj5VtQOXGKkHBD3c14udnMIp7JAw6OHGzH2zp4cLtoIZRHfxgWW+gVjQGsnLvZ31yz
         QoW5yRhKdwPh2+Fs46XEq6sWhmun82FH6MG2mDZhM5U6zEeVYhy35zOE7AdiezlYIt1f
         BFsA==
X-Gm-Message-State: ANoB5pnAdZh5jmht9DMex1Fwj97XpzTWW1HtgypFsqdx29irnmLPAjnZ
	cGDUiyAtSEX7AKgGk6S4kDKIug==
X-Google-Smtp-Source: AA0mqf7rTzR3Pal6WZpddl6e4rv4X23Od7t3dwKEPnQv/zjDXj2srvNqU2ykb5PBxFJ1td9bo4jasQ==
X-Received: by 2002:a1c:2b81:0:b0:3b4:88ba:a74c with SMTP id r123-20020a1c2b81000000b003b488baa74cmr6012426wmr.77.1668704259162;
        Thu, 17 Nov 2022 08:57:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:76d7:bdc9:5165:906c? ([2001:8b0:aba:5f3c:76d7:bdc9:5165:906c])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c458700b003a3170a7af9sm2000010wmo.4.2022.11.17.08.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 08:57:38 -0800 (PST)
Message-ID: <4f16ed270c2b979839830929c703494d221b2228.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/2] image specific configuration with oeqa
 runtime tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2022 16:57:36 +0000
In-Reply-To: <Y3ZVup8YKv6LQzuF@nuoska>
References: <20221117071223.107064-1-mikko.rapeli@linaro.org>
	 <5b79cba0817750882a0ef1f1dd9b9581abc9db28.camel@linuxfoundation.org>
	 <Y3ZVup8YKv6LQzuF@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 16:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173445

On Thu, 2022-11-17 at 17:39 +0200, Mikko Rapeli wrote:
> Hi,
>=20
> On Thu, Nov 17, 2022 at 03:17:43PM +0000, Richard Purdie wrote:
> > On Thu, 2022-11-17 at 09:12 +0200, Mikko Rapeli wrote:
> > > Many runtime tests would need customization for different
> > > machines and images. Currently some tests like parselogs.py are hard
> > > coding machine specific exceptions into the test itself. I think thes=
e
> > > machine specific exceptions fit better as image specific ones, since =
a
> > > single machine config can generate multiple images which behave
> > > differently. Thus create a "testimage_data.json" file format which im=
age
> > > recipes can deploy. This is then used by tests like parselogs.py to f=
ind
> > > the image specific exception list.
> > >=20
> > > Same approach would fit other runtime tests too. For example systemd
> > > tests could include a test case which checks that an image specific l=
ist of
> > > services are running.
> > >=20
> > > I don't know how this data storage would be used with SDK or selftest=
s,
> > > but maybe it could work there too with some small tweaks.
> > >=20
> > > Mikko Rapeli (2):
> > >   oeqa: add utils/data.py with get_data() function
> > >   oeqa parselogs.py: use get_data() to fetch image specific error lis=
t
> > >=20
> > >  meta/lib/oeqa/runtime/cases/parselogs.py | 17 +++++++---
> > >  meta/lib/oeqa/utils/data.py              | 41 ++++++++++++++++++++++=
++
> > >  2 files changed, 54 insertions(+), 4 deletions(-)
> > >  create mode 100644 meta/lib/oeqa/utils/data.py
> >=20
> > This patch looks like it is one side of the equation, i.e. importing
> > the data into the tests. How does the data get into the deploy
> > directory in the first place? I assume there are other patches which do
> > that?
>=20
> Patches in other layers do that, yes.
>=20
> > We have a bit of contention with two approaches to data management in
> > OEQA. One is where the runtime tests are directly run against an image,
> > in which case the datastore is available. You could therefore have
> > markup in the recipe as normal variables and access them directly in
> > the tests.
>=20
> My use case is running tests right after build, but I would like to expor=
t
> them to execute later as well.

When you execute later, are you going to use testexport or will the
metadata still be available? As I mentioned, removing testexport would
be desirable for a number of reasons but I suspect there are people who
might want it.
>=20

> > The second is the "testexport" approach where the tests are run without
> > the main metadata. I know Ross and I would like to see testexport
> > dropped as it complicates things and is a pain.
> >=20
> > This new file "feels" a lot like more extensions in the testexport
> > direction and I'm not sure we need to do that. Could we handle this
> > with more markup in the image recipe?
>=20
> For simple variables this would do but how about a long list of strings
> like poky/meta/lib/oeqa/runtime/cases/parselogs.py:
>=20
> common_errors =3D [
>     "(WW) warning, (EE) error, (NI) not implemented, (??) unknown.",
>     "dma timeout",
>     "can\'t add hid device:",
>     "usbhid: probe of ",
>     "_OSC failed (AE_ERROR)",
>     "_OSC failed (AE_SUPPORT)",
>     "AE_ALREADY_EXISTS",
>     "ACPI _OSC request failed (AE_SUPPORT)",
>     "can\'t disable ASPM",
>     "Failed to load module \"vesa\"",
>     "Failed to load module vesa",
>     "Failed to load module \"modesetting\"",
>     "Failed to load module modesetting",
>     "Failed to load module \"glx\"",
>     "Failed to load module \"fbdev\"",
>     "Failed to load module fbdev",
>     "Failed to load module glx"
> ]
>=20
> Embed json into a bitbake variable? Or embed directly as python code?

I've wondered if we could add some new syntax to bitbake to support
this somehow, does anyone have any ideas to propose?

I'd wondered about both python data and/or json format (at which point
someone will want yaml :/).

Cheers,

Richard

