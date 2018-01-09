Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7AD9E784D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 11:43:33 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id b76so20202819wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jan 2018 03:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vAhOp5v/rhm6KWOxpNEBpYHwHMU3HhuU/wwmw4erJXY=;
	b=bgKYpqhF+QOXsQPP2pQ3H4bK+0x6pyhZMSQOKE0vgTwduowVQWWtOBXba1a/NVmU7Z
	8xTFOU3b3plflpA5JnPlDzV4dUeQ+XVQtcV+XkJ5NV+DdHnVBI7foa2YVgg1ee6fj2mW
	WiXqDiXqF2koowHgJ8vprsl/Ub8tRnT/i151UZnz+zL8hY74+V3tgUbPCxXmGdWo9/u7
	wnB6Tbht2h2SnnOQ3wjtxnLlH+1pmIPS9ZGjn8koQbT0/RoUWlw+L0YRQpja0XUhiRsX
	QcihwEYtHzuJVr/AbMQrdW7fGP67wSZvrrhCxbmi1zhMykvxugmYSRnqc9JjSCj+VggF
	83DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vAhOp5v/rhm6KWOxpNEBpYHwHMU3HhuU/wwmw4erJXY=;
	b=De1z7lA597csbzwsPrcPrcIqxMYf+q9DCV0LAlWs5zTfkkBerryYjpc/dwtRWJaQKn
	FtlZO5/JwHavEIvrkeWfkGli1F09kZv6jOnF47Xq1IetSKIjvZkSPcZRO8NObZjYDEJz
	p2U+NQTt9Ig5Z9pRN7LiRow70EcYvdL/RaaX4O/qV8q0M/E+BKwvF5m72gFtvRahYcQO
	xTEzClRvLScWcVRtvbUQjGWeGXovEIvjWa0iPIgb6OzIZhn3pc9BZ/skBeSjovR6jIXI
	A3yzjsJO7FTjBRqw2X7Uxxp7Ee0bAtZ+VwZpKW1xwdMwHGbXcK/AhUH0hb4PZy7WP5YV
	maiA==
X-Gm-Message-State: AKGB3mJctO6x/z+XhhQ+hDE/gdsKqwKTjk2ii0zmEWaFQNSEu5xGQ9wM
	V34Q5akyMAwWNy6DN74xru1yFVD9GzAbVTRdWuEvCg==
X-Google-Smtp-Source: ACJfBos/nnSKwrJI0AX+rnQ9MN6rkjVSZPJ5jjgyw4bfNbbvzJSlvNY6VfjOlqiFx3X+IDskF0rM7Is/Wzmm51oaj48=
X-Received: by 10.28.45.83 with SMTP id t80mr11405498wmt.90.1515498213986;
	Tue, 09 Jan 2018 03:43:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.182.79 with HTTP; Tue, 9 Jan 2018 03:43:33 -0800 (PST)
In-Reply-To: <CALbNGRSz59HjuPX3=TLxxVoJEPrKnSmYMZu9RBf0YnCKU_SJOQ@mail.gmail.com>
References: <CAPyrkgxupO+=0+bmA=+JO+zs=t_i=Pm06GJyRFvYfTb5sXjSBA@mail.gmail.com>
	<1a0bbfc2-7b0a-c347-23eb-7cb1087ffb33@balister.org>
	<CALbNGRSz59HjuPX3=TLxxVoJEPrKnSmYMZu9RBf0YnCKU_SJOQ@mail.gmail.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Tue, 9 Jan 2018 11:43:33 +0000
Message-ID: <CAPyrkgxymZishKFSi3L4b3ms71_82kx_p_w4z2DJm6S3s99Hug@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-members@lists.openembedded.org, yocto <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Slideshow for FOSDEM
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
X-List-Received-Date: Tue, 09 Jan 2018 11:43:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2018 at 1:22 PM, Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
> On Wed, Jan 3, 2018 at 6:29 PM, Philip Balister <philip@balister.org> wro=
te:
>>
>> On 01/03/2018 09:47 AM, Paul Barker wrote:
>> > Hi all,
>> >
>> > As we've only got one table at FOSDEM this year we're not going to
>> > have space for as many bits of hardware as usual. I'd still like us to
>> > show off the project and what people are building with OpenEmbedded &
>> > Yocto Project though. Given the limited space I think the best way to
>> > do this would be to put a slideshow on my laptop.
>> >
>> > I've made a start on this here:
>> >
>> > https://docs.google.com/presentation/d/1KYxhsxO-8GxhAreE0GKnTOCPdY6_4u=
XYIEp6Lc55MB8/edit?usp=3Dsharing
>> >
>> > I've made this publicly editable so please feel free to add slides for
>> > any OE features you want to show off and any projects (professional or
>> > hobbyist) built with OE. If anyone can add a slide on project history
>> > that would also be great. I'd also like a slide on the latest release
>> > and the new features added. Photos of hardware projects using OE and
>> > features like Toaster would be especially welcome!
>> >
>> > I'll give this a final edit before FOSDEM and the put it on rotation
>> > on a laptop at the stand. Hopefully it will be useful for future
>> > events as well.
>>
>> Can we build a small board with a largish screen so we can run the show
>> on a device running an image built by OpenEmbedded?
>>
>> Philip
>>
> Hi,
>
> currently I am putting together something like a
> 'diy-rpi-notebook-on-tripod' - WIP no photos yet. Would like to put a mus=
ic
> keyboard in front of it. Area required 1-2 square meters - no table
> required. Is such thing accepted / of interest?
>
> Andreas

Sadly I think we won't have space for this. We'll have one table and
likely tables for other projects on both sides of us.

You're welcome to bring the setup along anyway but I can't guarantee
we'll be able to fit it in.

Thanks,

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

