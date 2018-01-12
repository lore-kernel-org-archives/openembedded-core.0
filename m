Return-Path: <alistair23@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B9A5171C0F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 20:40:30 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id p6so6370666wrd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 12:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=SUeCtWiK5JM0T+Wqa1dTfWSfUqgKedjMFcDZ7ui6sa8=;
	b=GIAav2ETBSCzcYbSB72KixT2SCXZOb6DZHiosqf7Cpl6nzfHMJ0w8a/13K3em+/6U7
	2heEmhg0MvSdNCKYr62sA/5n1/ixX0mWe0VotJnDIWbQ3Qqfxa30WbQqlR77BXQwg74D
	pMOO4gQNJTCSotGK9BZbZzb1RwKVKSUFzbSyDpYJ5dFOPwA5Np6FhYklXapD014YKh5x
	UB9kjaakXlrW+2ItcSPqYuGvvijMWeIwpJtTszjcn03h3dQhQAZWqIZ7wJ9nPpu6EdwG
	kjAlOcmHVtz78Jv2vTK5IRixxvL2HeDQbWux7nLzBpAOlLb1zobGk7sTX9ex6h3eFS61
	gtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=SUeCtWiK5JM0T+Wqa1dTfWSfUqgKedjMFcDZ7ui6sa8=;
	b=e2uEisvfsmnKnaU1kjUNNWTLZeldOU4zOhahslLpBKa/aXsj13pmBUKuPwzrF59aTg
	UjYweKF0iN36fjhxbc3cYjiOZc7bIihlalGnKk5Dre8W0UcCkxo7rRgcbZTrtydamleY
	A2fQggQqdMQ3fwzQQvlX4K5aZP2tr88MlRWMNfRomrx3nHEiQDosQdQU3lRjFwdbc5qI
	Ujqpsavonxy3cBEo74Kgb4bLwCAtGUDWfqb6n5OaxW6IS4trRKkSa5GNBCLWZxxzYhS/
	qcomDMfgygrm1kFwCPUcTSivBqxNecWdjUQ/P6QmN2il2fnhOjqJ2H6v8JhUT/S3J+Lq
	VREg==
X-Gm-Message-State: AKwxytf0thc7tnakjw755w4iY3fEr3TrPoUb+tNqSJGbY310+Q41Vnrm
	tXSiK9wpqqcOJ8N2/1YDKXfbP8QlNfgnKOgDA+I=
X-Google-Smtp-Source: ACJfBouPBJj5v8Q2DqhamWNnt5/CHDH9fq9qCNeHga33MD07ICGRLY6+KcC4mrFpxu3lsW8+zRPxRIt/JDWDbaDpBmw=
X-Received: by 10.223.176.79 with SMTP id g15mr13080378wra.34.1515789631462;
	Fri, 12 Jan 2018 12:40:31 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.164.69 with HTTP; Fri, 12 Jan 2018 12:40:00 -0800 (PST)
In-Reply-To: <CAKmqyKNYVwe6mOu972Vg1=dLKYz6s7-2W53E0ADVLeYMLK_WJQ@mail.gmail.com>
References: <20171221215634.26019-1-alistair.francis@xilinx.com>
	<CAKmqyKO0DpoCCzDzoJf9WELTE0fcE7rRS279xbLLPVV5bvff6A@mail.gmail.com>
	<1515055530.5525.176.camel@linuxfoundation.org>
	<CAKmqyKMGTAJuocNKid-mnSAg-bbtoaTH7ih8JjsA-DP5aRYHdA@mail.gmail.com>
	<1515198127.29722.16.camel@linuxfoundation.org>
	<CAKmqyKO8P6uYTLxDM4xAFCxHA7+Hi9xkTqabJ1FSeGfLRXZpOQ@mail.gmail.com>
	<1515233731.29722.20.camel@linuxfoundation.org>
	<CAKmqyKOHCqmYs=_o0S=F3LCmw=VOPE2NMmczVDgxe8o0=bcocA@mail.gmail.com>
	<CAKmqyKNYVwe6mOu972Vg1=dLKYz6s7-2W53E0ADVLeYMLK_WJQ@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 12 Jan 2018 12:40:00 -0800
X-Google-Sender-Auth: DFy8PwWr5MleJFVBDRY8TsxOllg
Message-ID: <CAKmqyKMWDsfAz6AmhF3eWxg2=BOqo8DPHth=e-mUEQgEXemWJQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
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
X-List-Received-Date: Fri, 12 Jan 2018 20:40:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 11, 2018 at 11:37 AM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Mon, Jan 8, 2018 at 3:45 PM, Alistair Francis <alistair23@gmail.com> wrote:
>> On Sat, Jan 6, 2018 at 2:15 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Fri, 2018-01-05 at 18:18 -0800, Alistair Francis wrote:
>>>> On Fri, Jan 5, 2018 at 4:22 PM, Richard Purdie
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> > > Do you have an easy way to reproduce this hang?
>>>> > Was this a musl build you tried to reproduce in?
>>>> Ah, it was not. I'll have to figure out how to do a musl build next
>>>> week and try again.
>>>
>>> TCLIBC="musl"
>>
>> Thanks. Unfortunately I'm still unable to build at all on master so I
>> can't reproduce the hang.
>
> Ok, got it. I can reproduce the successful build on master and the
> hang. I'm investigating now.

V2 with the issue fixed was just sent.

Alistair

>
> Alistair
>
>>
>> Alistair
>>
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>

