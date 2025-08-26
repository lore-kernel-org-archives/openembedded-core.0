Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EACECA0FE9
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 06:57:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.58528.1756191466545286265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 23:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sbL6EPbB;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 11389C8F1F2
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:57:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2980A606A7;
	Tue, 26 Aug 2025 06:57:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F9541C22D309;
	Tue, 26 Aug 2025 08:57:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756191463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/etKIKlWbmlRh5WLJqqH6kXGb+YWLexP47MbDSUnXx8=;
	b=sbL6EPbBRQd9xX4IuIyaK9If2vp2IgXSOwPLtdNbYafG7vOx3j8cJzxVqFoGQFlfSeHD9b
	+eF769GBrcUCl+JYDkaG2A+A8pFKo4vFOIbkNa6j4UHxrJCnvYjCBP+8eRHXcmCGXRCW9q
	HUmaLnIopFKEmoT5A79VQhnQuYs6/BZywbRmKNaGASI2eJSxudF1mqAmUg9eXl8oQ52570
	WM/rh8h+lNDYmgI4w9GX5ta04PeQ0NHQ0alzPv95qTLtTWIFTuKLsvU2TpdPO4Z4Ng9y1D
	IDL/UCxvf2sWxsQ1hUBSjco9l8coRijf0lA2qLxiAGHGAe4juZnKm0YOUshgPQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 Aug 2025 08:57:35 +0200
Message-Id: <DCC5WWTW563Y.2C98H7RECJK06@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/4] kernel-yocto: -stable and new reference
 kernel
Cc: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1755784780.git.bruce.ashfield@gmail.com>
 <DC92RWVBN7V4.30RLT0SCEWDPC@bootlin.com>
 <CADkTA4MVTtjd0bRyVHhS8AiWmN+zw7bj2QZcgoUEhcV9zhHVVQ@mail.gmail.com>
In-Reply-To: <CADkTA4MVTtjd0bRyVHhS8AiWmN+zw7bj2QZcgoUEhcV9zhHVVQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222431

On Tue Aug 26, 2025 at 4:03 AM CEST, Bruce Ashfield wrote:
> On Fri, Aug 22, 2025 at 12:52=E2=80=AFPM Mathieu Dubois-Briand <
> mathieu.dubois-briand@bootlin.com> wrote:
>
>> On Thu Aug 21, 2025 at 4:03 PM CEST, Bruce Ashfield via
>> lists.openembedded.org wrote:
>> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >
>> > Richard,
>> >
>> > Here's the next set of updates to the linux-yocto kernel.
>> >
>> > The plan is to introduce 6.16 as the latest reference kernel, and keep
>> > 6.12 around (since it is a LTS).
>> >
>> > This isn't ready to be the default for builds, but it has passed my
>> > core-iamge-kernel-dev testing, so I wanted to make the recipes availab=
le
>> > as visibility to where we are headed for the release (plus, I'm out of
>> > the office on holidays until the first week of September, so making it
>> > the default would be a bad idea from me being able to support issues).
>> >
>>
>> Hi Bruce,
>>
>> Thanks for the series.
>>
>> I understand this isn't fully ready, but I did launch a full build
>> anyway: most builders succeed, we just have one warning on config
>> fragments:
>>
>> WARNING: linux-yocto-6.16.2+git-r0 do_kernel_configcheck: [kernel config=
]:
>> specified values did not make it into the kernel's final configuration:
>> ...
>> [INFO]: config 'CONFIG_CRYPTO_LIB_CHACHA' was set, but it wasn't
>> assignable, check (parent) dependencies
>> ...
>> [INFO]: config 'CONFIG_CRYPTO_CHACHA20_NEON' was set, but it wasn't
>> assignable, check (parent) dependencies
>> ...
>> [INFO]: the following symbols were not found in the active configuration=
:
>>      - CONFIG_CRYPTO_SHA2_ARM_CE
>>      - CONFIG_CRYPTO_CRC32_ARM_CE
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/2248
>
>
> I always find it odd that I can't click on any of the AB tabs (in the lin=
k
> you sent) and see what the MACHINE value is for that build.
>

Hum, that's raising an interesting point, I had the same issue at the
very beginning. I'm now familiar with each steps and know where I have
to look at, but maybe we can do something better about it.

I will add this idea somewhere on my TODO list.

> I looked at the writeconfig step of the build and it looks to be qemuarm.
> Which is odd, since I'm not seeing the same warning for that here.
>
Yes, I confirm, we have MACHINE =3D "qemuarm".

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


