Return-Path: <alistair23@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id C4E6678837
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 19:38:07 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id 100so3271443wrb.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 11:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=LKofY10SEIoIkE2iGhOp1RwdV1tgjmlJSyoREAwF+tM=;
	b=IlWQiYbSvmCxsHq7wFSI99t0h32cohbmxgoTEUCBI0Zp+LQqAdev6sGGdDiOOI2pZj
	zw6v6cbWrnkUFdzh4VyYx2uOsWbYnR1BfHU3ik9rgMdVIuPVGGGWL/MNj5FO/0vuoo0K
	jTpZHT85fsrOUs00+0T09CeeDLttuY/Byn9mc5CQLi4j/BmD2wCpj4pwGAg9rdIrmGGm
	ISlBNWZQw6GgwdS+1zk7N6CSLnf2F/bYRGy2Rb6X83TLNx8sVcFeK3xNIQ1Vxzko7GUr
	+BRSVPGP6pmNB9KADNcPfuw14IbFHzX1nunAiSK77joys5OjpXCA53HzSPwsv94IwTCn
	izzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=LKofY10SEIoIkE2iGhOp1RwdV1tgjmlJSyoREAwF+tM=;
	b=ssdN8p4+tJvywcO33Oa5EhqfEPUA47zkGQ7PS2prwgqA2USLjvqVKGXlLpFVWqVQqU
	mlBr8I3FQWAIH0uj7a+Y8qD8fEKSC3JgxEKNC7gsIH5vutff1F3qyOe/lA/ZL1nky47g
	CybfbKiOiXTNt5DflaiwXc8/LpvF1ykmmXvQ0XwCzI0rVVb+zKw+VJ712BGNtSgPZKde
	e5YtqFAoUsuis7fNA/+yuy8U+6gmfN0UJTvH35xFIpwiFWgTJweUog8+LnCrQJVCJV/Z
	iX/MoY2WoTKu/ZnGdumsbrvDG/FXFO9ixOagwajpsK6Sfff1R4NgmRmTwaExgyP7C84J
	TOhA==
X-Gm-Message-State: AKGB3mJnrzQkkWyPiwE61te/hbmTAsqs4x96vcJ/tDZAFlGs3mVHdtBt
	H7oXIKf3iGyRYupnSmMWiq49YlQvA5pJ5niIgB4=
X-Google-Smtp-Source: ACJfBosZKdabodrKsjhOS9do7plUFdEZ65gk+az6BEoLvxRo5KPqM6dbfjVIyUvB5vUEDMe7Kk3BgZuCu+DG8h3c8zQ=
X-Received: by 10.223.132.165 with SMTP id 34mr14930433wrg.219.1515699488426; 
	Thu, 11 Jan 2018 11:38:08 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.164.69 with HTTP; Thu, 11 Jan 2018 11:37:37 -0800 (PST)
In-Reply-To: <CAKmqyKOHCqmYs=_o0S=F3LCmw=VOPE2NMmczVDgxe8o0=bcocA@mail.gmail.com>
References: <20171221215634.26019-1-alistair.francis@xilinx.com>
	<CAKmqyKO0DpoCCzDzoJf9WELTE0fcE7rRS279xbLLPVV5bvff6A@mail.gmail.com>
	<1515055530.5525.176.camel@linuxfoundation.org>
	<CAKmqyKMGTAJuocNKid-mnSAg-bbtoaTH7ih8JjsA-DP5aRYHdA@mail.gmail.com>
	<1515198127.29722.16.camel@linuxfoundation.org>
	<CAKmqyKO8P6uYTLxDM4xAFCxHA7+Hi9xkTqabJ1FSeGfLRXZpOQ@mail.gmail.com>
	<1515233731.29722.20.camel@linuxfoundation.org>
	<CAKmqyKOHCqmYs=_o0S=F3LCmw=VOPE2NMmczVDgxe8o0=bcocA@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 11 Jan 2018 11:37:37 -0800
X-Google-Sender-Auth: qWBaGl41f1gBsYOWSnBszYKxkhU
Message-ID: <CAKmqyKNYVwe6mOu972Vg1=dLKYz6s7-2W53E0ADVLeYMLK_WJQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 11 Jan 2018 19:38:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 8, 2018 at 3:45 PM, Alistair Francis <alistair23@gmail.com> wrote:
> On Sat, Jan 6, 2018 at 2:15 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Fri, 2018-01-05 at 18:18 -0800, Alistair Francis wrote:
>>> On Fri, Jan 5, 2018 at 4:22 PM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>> > > Do you have an easy way to reproduce this hang?
>>> > Was this a musl build you tried to reproduce in?
>>> Ah, it was not. I'll have to figure out how to do a musl build next
>>> week and try again.
>>
>> TCLIBC="musl"
>
> Thanks. Unfortunately I'm still unable to build at all on master so I
> can't reproduce the hang.

Ok, got it. I can reproduce the successful build on master and the
hang. I'm investigating now.

Alistair

>
> Alistair
>
>>
>> Cheers,
>>
>> Richard
>>
>>

