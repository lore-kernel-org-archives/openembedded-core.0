Return-Path: <alistair23@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 25DD47882D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jan 2018 02:19:02 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id w107so5775501wrb.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jan 2018 18:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pHfMrhMFRuyYcSnGzFrMubQmeUxGCWK8vuUq8/QgPIo=;
	b=aapeGg5tgrcmb9xXbmQRL20ZnXfANXsh9Fq3c+ZAhIo6mkImoeHTaMHcppPhc8tySi
	5MnYoTNbDCH2D8jWeNhbC9SFdt7j9Qhm4iqNU9VcozpnQpt8582mTtouA+2Kv7Wsddz1
	VQIqwSEpP7OUiKwFoBpUPPBl1yjk5A3cZa0NGPZerPm3tCJpLmZPhN11vFKY/F0W1Zii
	a7pYKrJSy46K+WVe0TYurbiUwjVrlV+PYEH2ZkWFncmnv44mEu9by/GqJoArjpPOBMI/
	KkI4/Yx55eotgu5HLOXWpVoA0YVGAhvARBjlKcclfxeZOw/vz4CgCsCdvPeN4lsX6ZQJ
	hVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pHfMrhMFRuyYcSnGzFrMubQmeUxGCWK8vuUq8/QgPIo=;
	b=g/AD1cmC4sMZhIXD3oMoyGx8pTZ/KW/WuWdj1qYTuULgWqVtOMQA+xD/8/tKNRBIXF
	/NdORBZPNLBstocGisD1X7m0VHtAm20xzDwiIk+X8oPY2OWmgRlsuzDF5nN6fuBFSeIO
	Xt7zcGo17fDXf4TXeY9vftmv8iwZklUYwTSRKH5keil7JZlooaFLe5XzDhVVFd/VXPFk
	3UlCfS4w7N4Ygn0bvmvZ5cs/kzngJymZnPZUVY41s8OhaZvgQ9Ww/M7n1KNXo0lfhEMh
	vipBSPzSFkdk2lIi9bWUnig9juIFj7suyVJuySaUChhmTqzOI7733cbFOSHCHEdnQTPm
	howA==
X-Gm-Message-State: AKGB3mKtTUuLfEUPJ6iNurhYiWSajzXWshURzy2kowrd3J6KxZix6YoX
	0p/e1QjA8IiZJMP/S2fFw68bkbiCJ5IyMMvzxs8=
X-Google-Smtp-Source: ACJfBovlVrVybU+jRa77+hpv1l2g69OW7rEMpwfdQmSurDXzHvNvLlZAt03By4Te7Hrn5jrLO8ozS/JSm1ht8mTGBRY=
X-Received: by 10.223.197.69 with SMTP id s5mr4642912wrf.96.1515205144043;
	Fri, 05 Jan 2018 18:19:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 5 Jan 2018 18:18:33 -0800 (PST)
In-Reply-To: <1515198127.29722.16.camel@linuxfoundation.org>
References: <20171221215634.26019-1-alistair.francis@xilinx.com>
	<CAKmqyKO0DpoCCzDzoJf9WELTE0fcE7rRS279xbLLPVV5bvff6A@mail.gmail.com>
	<1515055530.5525.176.camel@linuxfoundation.org>
	<CAKmqyKMGTAJuocNKid-mnSAg-bbtoaTH7ih8JjsA-DP5aRYHdA@mail.gmail.com>
	<1515198127.29722.16.camel@linuxfoundation.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2018 18:18:33 -0800
Message-ID: <CAKmqyKO8P6uYTLxDM4xAFCxHA7+Hi9xkTqabJ1FSeGfLRXZpOQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: vineethchowz.chowdary@xilinx.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] receipes-devtools: QEMU: Bump to version 2.11.0
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
X-List-Received-Date: Sat, 06 Jan 2018 02:19:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 5, 2018 at 4:22 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2018-01-05 at 11:15 -0800, Alistair Francis wrote:
>> On Thu, Jan 4, 2018 at 12:45 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > I ran the qemu upgrade in some builds and both hang in nightly-musl
>> > whilst trying to build webkitgtk:
>> >
>> > https://autobuilder.yocto.io/builders/nightly-musl/builds/688/steps
>> > /BuildImages/logs/stdiohttps://autobuilder.yocto.io/builders/nightl
>> > y-musl/builds/687/steps/BuildImages/logs/stdio
>> >
>> > Given all the stability issues we've had recently and the trouble
>> > I've
>> > had getting stable builds, this issue is going to have to be
>> > resolved
>> > before we can take this upgrade.
>> >
>> > FWIW they're hanging in qemu user mode:
>> >
>> > run.do_compile.=E2=94=80=E2=94=80=E2=94=80cmake=E2=94=80=E2=94=80=E2=
=94=80make=E2=94=80=E2=94=80=E2=94=80make=E2=94=80=E2=94=80=E2=94=80make=E2=
=94=80=E2=94=80=E2=94=80sh=E2=94=80=E2=94=80=E2=94=80g-ir-scanner-
>> > wr=E2=94=80=E2=94=80=E2=94=80python3=E2=94=80=E2=94=80=E2=94=80g-ir-sc=
anner-qe=E2=94=80=E2=94=80=E2=94=80qemu-i386=E2=94=80=E2=94=80=E2=94=802*[{=
qemu-i386}]
>> Hmm...
>>
>> I don't see any hangs. With master webkitgk fails to build with a
>> missing header fil (GL/gl.h) and with this patch I still see the
>> problem.
>>
>> Do you have an easy way to reproduce this hang?
>
> Was this a musl build you tried to reproduce in?

Ah, it was not. I'll have to figure out how to do a musl build next
week and try again.

Alistair

>
> Cheers,
>
> Richard

