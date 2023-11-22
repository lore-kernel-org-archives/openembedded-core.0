Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19192C61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:23:18 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.18084.1700655790139659404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:23:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X/i+ApbY;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-547e7de7b6fso1577555a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700655788; x=1701260588; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D8ZlmH2nqSvBnJmU69R2XL/HZqd3R9MAIAInhoc0IlE=;
        b=X/i+ApbYvYFAvG7bxMuZsfse5qSIOwDuEdsx9eU8JXwye4Cf4+/yTInB2UnlLXuE/g
         xbAaAzejUtyDJp2Nt8Gd1NUJjQ4GwzY/X+QZteWV90mfHvPaJjQObpNbEzgg7aTp4MT6
         /IJx3X8GMDTbK0jruL3VGwryhGa5/89ATXkK+uyg5QGMiFAVEpV0gBOQekHDa4TDHbaP
         vIlJJPx11eJa+ZjPSY7nR6if7+Nhe9/EnNDprZnIFRqpsPo5qL5MwlH3noKeOnd81avv
         IGPcI3YMhKVrT0FkqfyufiSbLSRjbJmoY94Ho0vo2G0OjQZnkPfntEgmzvN8pClCiirM
         XZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700655788; x=1701260588;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D8ZlmH2nqSvBnJmU69R2XL/HZqd3R9MAIAInhoc0IlE=;
        b=rpys8fomjs0fZKpZBFjHHYoF7gI8YP0Hqbj+TvapDhm1Ln5JC/ENfTy9/uKoKXq7mr
         UI44L1U8WNma+wTVV3adkGCUFznHKY1eDDL6qCG7gXQ4VefPaaX12AnyuwSnw+rTgMAP
         0RqGNXHfb4CNA3rZkY6NzC33iLs0RJshcMV3E/W1XYPwdKqOyC16TqayTS48/GurplFb
         xMWss8cCiGuWbEVKMyYFFfUJTbfbj1TWAOZB/BmC0BJYAjLPhoYNt7G0TLPdo+aT/dR4
         78w4XWp3oT8Xi229XCrlYTmposULQpgxfqHl9yQXzKeo7LnLmWquR1J0/J8dUmEZJgmK
         WqAA==
X-Gm-Message-State: AOJu0YyDh87w+wTYGXxToz/z667cbuDy5JIqyRXQTrLT3xu0+5Dk8bwr
	XrjMudRkwFaI2Kc/nzCCwkw=
X-Google-Smtp-Source: AGHT+IGJwtszcdLyp2tm1lvIZ8BDHG9mnqRMEEO4/aFs1vk8i+3xu3CJ8E8bSQz7JdH2duY7sWCj4w==
X-Received: by 2002:a05:6402:797:b0:548:e0e1:4a37 with SMTP id d23-20020a056402079700b00548e0e14a37mr1951214edy.6.1700655788224;
        Wed, 22 Nov 2023 04:23:08 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:5488:f785:9061:cf6c? ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id g22-20020aa7c856000000b005487d3fb436sm4682545edt.90.2023.11.22.04.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:23:07 -0800 (PST)
Message-ID: <b3871a691e147ff70ac2145cc5af36a4c4c26837.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v8 3/8] image-combined-dbg: make this the
 default
From: adrian.freihofer@gmail.com
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Christopher Larson
	 <kergoth@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Nov 2023 13:23:06 +0100
In-Reply-To: <DB5PR02MB10213E5FE440BEAB46DA58849EFB4A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
	 <20231101110129.647878-4-adrian.freihofer@siemens.com>
	 <41e4a23f7b8fcbc1da06d9414646aed6d9a33f1a.camel@linuxfoundation.org>
	 <1952881b121248aaae11df8b884caba82d567bec.camel@gmail.com>
	 <b98adc29-7e18-4c68-b94c-4b9b5b2a38db@Spark>
	 <b38107c74191ff9a5fa6fb0a9cf8a42cfed32225.camel@gmail.com>
	 <DB5PR02MB10213E5FE440BEAB46DA58849EFB4A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191074

On Mon, 2023-11-20 at 22:53 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org=C2=A0<openembedded-
> > core@lists.openembedded.org> On Behalf Of Adrian Freihofer
> > Sent: den 15 november 2023 23:33
> > To: Christopher Larson <kergoth@gmail.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH v8 3/8] image-combined-dbg: make this
> > the
> > default
> >=20
> > On Wed, 2023-11-15 at 09:26 -0700, Christopher Larson wrote:
> > >=20
> > > Can you explain your issues with gdb with using a rootfs-dbg,
> > > because
> > > I don=E2=80=99t see any problem with a filesystem that only contains
> > > debug
> > > symbols, given how easily gdb can be configured to look into
> > > alternate paths. I=E2=80=99ll admit I also don=E2=80=99t know the dif=
ference
> > > between
> > > these modes, and also wonder how IMAGE_GEN_DEBUGFS relates.
> > >=20
> > >=20
> > It simply does not find the symbols if only the rootfs-dbg is
> > available. If this class
> > https://git.yoctoproject.org/poky/tree/meta/classes-recipe/image-combin=
ed-dbg.bbclass
> > is added to the build it just works.
> >=20
> > Since this is not too obvious, I wondered if it wouldn't be better
> > if
> > the combined debugfs were the default behavior. Then Ross asked the
> > same question and I developed a patch to simplify this.
> >=20
> > But either way, there are too many unanswered questions to change a
> > well-established default behavior. And there are other ways to deal
> > with it.
> > Thank you for pointing this out.
>=20
> For what it's worth, we have local changes that more or less do this=20
> (predating image-combined-dbg.bbclass), as we have only seen a use=20
> case for the combined debugfs tar ball. So I was rather hoping this=20
> would be accepted, so that we can drop our local changes...
>=20
> //Peter
>=20

In theory, I completely agree with Christopher. That seems to be the
right way to go. But I have tested this again. I am not able to
configure GDB to find the sources with a split rootf + rootfs-dbg. I
tried adding rootfs and rootfs-dbg in different order and with
different paths to the solib search path. Stepping into libraries
contained in rootfs/rootfs-dbg does not work. Maybe I did something
wrong or we could consider this a bug in GDB. But with a combined
rootfs-dbg this works in all the different variants I have tried.

One approach to handle this is to improve GDB's solib search function
to support a shared rootfs dbg. But it's not only about GDB. There are
other tools which most probably have similar issues.=20

From a usability point of view, I would at least like to have an easy
and obvious way to configure a combined rootfs-dbg for an image. It
took me an infinite amount of time to figure out why GDB doesn't work
and that there is an image-combined-dbg.bbclass supposed to fix that.=20
Defaulting to a not combined rootfs-dbg and providing code in a hidden
bbclass is misleading.

What could also help a bit is to make the code of the image-combined-
dbg.bbclass more prominent and more official e.g. by moving it into the
image.bbclass and support to enable it via variable which can be
documented and referred in various sections of the documentation but
also in the local.conf.template. The documentation should then point
out that e.g. stepping with GDB does not work until the binaries are
available from the same rootfs folder as the debug symbols are. Such a
patch would be a minor refactoring only. @Peter: Would this help for
your use case?

This would also allow the default to be changed some when in the
future. The question of who needs a shared dbg rootfs for which use
case, as opposed to those who struggle with simple remote debugging
because of this default behavior, still seems valid to me.

But I also have to say that recent documentation points out that the
rootfs.tar must be extracted into the extracted rootfs-dbg which is a
working solution. The issue which I have is with the SDK which tries to
avoid building the tars and extracting them again just for providing
the debug symbols on the host. This use case is probably new.

Best regards,
Adrian



