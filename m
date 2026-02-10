Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498B1EA812D
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 15:20:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22117.1770736814581775274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 07:20:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=eLOdMBV4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 755CA4E40BFF;
	Tue, 10 Feb 2026 15:20:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A0AF606BD;
	Tue, 10 Feb 2026 15:20:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C047510B920E4;
	Tue, 10 Feb 2026 16:20:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770736811; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fOqMS76aacyOBFUy7aAXhPXD82B6XoicMheQT1dc9BM=;
	b=eLOdMBV4Z5DTME5TXIzra6CXJ/yzu5HpepyRQlWXIsdMLipmUFk0pm8ieqNYUV7p7tvNx1
	jOeyHPZSpA9lDVQxyJ+6ThUtz3+OsdhfNp6galIwvVYIsaq9MRPrEDZeLaoH58emylyidQ
	BoXsiudr0zhC66kKpzHXVP6QKyP46X3WRhO2G6BoTQzdGDHgIqy8H/LVVtnG/yWqxwFzTX
	kD4Yi+lDwr6ErJQeZpXb+JpnBl5TOGP2SDkzgBLI7120neqmKtWgcrZ+DhReknryX4obUg
	msiRRMfHMD17APWTjXc4i8Q1g9k6PADNtZ1aVmVVl+CGUOjGqC3KCGCRWx4OdQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 16:20:10 +0100
Message-Id: <DGBDT8JNFUMH.30YMHYO3TK1V7@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH 0/13] kernel-yocto: 6.18 updates and 6.12/6.16
 removal
Cc: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 =?utf-8?q?Jan-Simon_M=C3=B6ller?= <jsmoeller@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
 <DGB77NZHNM3V.2EJ7FXYV0OH5Q@bootlin.com>
 <e8f2e5e39f2ced4d3fd25d33159ce8bdaaa5313a.camel@linuxfoundation.org>
 <CADkTA4Nn8UA1Y9raEU4d+GT8q6yTKKxvCnmW1fDBwOHGitC_xQ@mail.gmail.com>
 <DGBCAE5TXZG4.2B7KRHDG5GBV4@bootlin.com>
 <CADkTA4Mwt=Vq4ODNxkY=V7nJN47TM60jTAtKCrOdvAXhm1VExQ@mail.gmail.com>
In-Reply-To: <CADkTA4Mwt=Vq4ODNxkY=V7nJN47TM60jTAtKCrOdvAXhm1VExQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 15:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230909

On Tue Feb 10, 2026 at 3:18 PM CET, Bruce Ashfield via lists.openembedded.o=
rg wrote:
> On Tue, Feb 10, 2026 at 9:08=E2=80=AFAM Mathieu Dubois-Briand <
> mathieu.dubois-briand@bootlin.com> wrote:
>
>> Just a note about the process while we are at it: picking this series
>> was not straightforward, at least with b4: it got confused by patches
>> 1-4 appearing twice (1 oe-core, 1 meta-yocto). It was not a big deal and
>> I have no suggestion for a better process so far, but it would be
>> helpful if patch numbers were unique.
>>
>
> My export scripts are doing that numbering on purpose, so I can definitel=
y
> change it if it helps the picking of them.
>
> I can also just send them to the two separate lists, but I'm trying to
> simulate
> the unified series so that we don't miss coordinating between the two
> lists (and that's why the numbering is individual).
>
> I do have a "flat mode" in the tools, and that would just number them fro=
m
> 0-N through the entire series.
>
> I'm open to either option. I can send 0-N to the single list, or do the t=
wo
> 0-N sends on separate lists and let the coordination happen on your end
> between the two.
>
> Just let me know which you prefer and I'll switch to it.
>
> Bruce
>

I do not have any strong opinion here.

Having two separate 0-N series on the two separate lists is probably the
easiest one to pick on my side, but I can understand the advantage of a
single series to make sure all patches are picked in coordination. A
single series is also a working solution.

So I will let others share their opinions.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


