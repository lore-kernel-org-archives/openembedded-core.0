Return-Path: <alistair23@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9AFD678816
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 19:16:00 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r78so4248736wme.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jan 2018 11:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CRt4wIwCSYCI3W7eZh685Gtg2IYjkCJVFRV0p+nb29Q=;
	b=QADoq2l/Y+pDni18/WhNn6hvrYwmEWF3ODyUtREvP9aj/6PIiejJs7l9yK+ArTGkxw
	BZLEoYgiYH3tN5XHSqXlE9SK+qR4w0oXVxhcZSAvDd249dmhhgumbSzDO53F+jFYIy2j
	LVkAH3otmHB3/CFygx2ZkM5syPMGTEcul5ZP0xO6eluymXnr87T9FX7aCrQ21Wc4iR3E
	dVAu5SM8sDE2we4Im5+GtDrvh4Mp9OjAbbhUUHURAnq8kZOICTHk2TN0nQFttuJ/mowd
	vIAm94bro8a7QwaSKUMQVgz+F8cHjEjAHe1W+LjpfxI4vL2FpbpNxCHIpPELTBD1BGQa
	6FKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CRt4wIwCSYCI3W7eZh685Gtg2IYjkCJVFRV0p+nb29Q=;
	b=WOqjQDfM7Tg+xFQ6wqKg/um2/7a1wxeWWUaFu4233W6KvLd7FBgJheCT2naqwLAx05
	hPj5P9ECqZVuYBokVOyO1LSpA4zZHNeiLir/bGxijMgx78WFbDc3bLic+s2VSwHnICF3
	saKpJDSu9rD1/WypGP8mwCkioHQBr6G6pbsykMBYEoKin8s79CvevRkxhFW5P34G91JR
	7ma0DIqzGFE9giIwmhxKkVoHWl5v9ZmlrN5W9+kMyvMFSPqFpLPoMhRGO4V3Fzr2Nh4c
	/RCtYw4GoCGyhqTU9mYKxsmCOMcs2PFybF+MbBEGHVEvdIXpvBMl7VoUfUj9i/AG07DB
	t5rg==
X-Gm-Message-State: AKGB3mJL5AoFP6c2SqxmM/4zp/IY/6NpEuAsc0DzsKHzNd5/sXP8djot
	R2up4i41Jqp5j5Eift5P7sSOkvTRMvb3nGetp7k=
X-Google-Smtp-Source: ACJfBovKZTlrW4BlWvVzGWgU5wAsSEYzzuPuD6q/iWczr10IwzFpjM0iTVt5tkIKsdtnD4Xz//By+0JjINszB5VETpg=
X-Received: by 10.28.231.8 with SMTP id e8mr2922682wmh.16.1515179761425; Fri,
	05 Jan 2018 11:16:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 5 Jan 2018 11:15:30 -0800 (PST)
In-Reply-To: <1515055530.5525.176.camel@linuxfoundation.org>
References: <20171221215634.26019-1-alistair.francis@xilinx.com>
	<CAKmqyKO0DpoCCzDzoJf9WELTE0fcE7rRS279xbLLPVV5bvff6A@mail.gmail.com>
	<1515055530.5525.176.camel@linuxfoundation.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2018 11:15:30 -0800
Message-ID: <CAKmqyKMGTAJuocNKid-mnSAg-bbtoaTH7ih8JjsA-DP5aRYHdA@mail.gmail.com>
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
X-List-Received-Date: Fri, 05 Jan 2018 19:16:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2018 at 12:45 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2018-01-02 at 14:58 -0800, Alistair Francis wrote:
>> On Thu, Dec 21, 2017 at 1:56 PM, Alistair Francis
>> <alistair.francis@xilinx.com> wrote:
>> >
>> > Use the latest QEMU release 2.11. Remove all patches that are no
>> > longer
>> > required as they have been merged into the 2.11 releaese. One patch
>> > had
>> > to be updated to apply to thet 2.11 tree.
>> >
>> > Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> Ping!
>>
>
> I ran the qemu upgrade in some builds and both hang in nightly-musl
> whilst trying to build webkitgtk:
>
> https://autobuilder.yocto.io/builders/nightly-musl/builds/688/steps/Build=
Images/logs/stdiohttps://autobuilder.yocto.io/builders/nightly-musl/builds/=
687/steps/BuildImages/logs/stdio
>
> Given all the stability issues we've had recently and the trouble I've
> had getting stable builds, this issue is going to have to be resolved
> before we can take this upgrade.
>
> FWIW they're hanging in qemu user mode:
>
> run.do_compile.=E2=94=80=E2=94=80=E2=94=80cmake=E2=94=80=E2=94=80=E2=94=
=80make=E2=94=80=E2=94=80=E2=94=80make=E2=94=80=E2=94=80=E2=94=80make=E2=94=
=80=E2=94=80=E2=94=80sh=E2=94=80=E2=94=80=E2=94=80g-ir-scanner-wr=E2=94=80=
=E2=94=80=E2=94=80python3=E2=94=80=E2=94=80=E2=94=80g-ir-scanner-qe=E2=94=
=80=E2=94=80=E2=94=80qemu-i386=E2=94=80=E2=94=80=E2=94=802*[{qemu-i386}]

Hmm...

I don't see any hangs. With master webkitgk fails to build with a
missing header fil (GL/gl.h) and with this patch I still see the
problem.

Do you have an easy way to reproduce this hang?

Alistair

>
> Cheers,
>
> Richard

