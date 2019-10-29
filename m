Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 58AEB7FA21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 20:42:37 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id n17so3238800ioa.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 13:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9o4YEPrLd255vly5N+DTfqT9Ok4ZNgqNIYQvSbm8+1M=;
	b=KTY5vv8DbWuLkS3PvjhXr48ADQlz0H6yuzxYCAapXJ6o8at14TsgE4+woweGRYE+9i
	WwqIzxX7WCMi7XBnUgSyLYK/k11LL+sNcP8L6jsBSWtv8NFJcch69I7+hvjDnl15pGpD
	czlqHHtQUyfhGeykFsHEVipp6zchOtFFBM7MAdicyExv48RwTXlONEC3vpESyD4SWcIP
	ULwbuIaou5mxIewp+gaXQjyaSh0kda+dFzxz7pMpQ5e948933OFEuN4ehpWJKKbX4WbG
	Kcs0kZieHFkYESz/sKOAK7oStSvRAe9vK+SpcB/Sx9DD9Q46yLHEXUnlrKSLxsthf4ja
	3DHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9o4YEPrLd255vly5N+DTfqT9Ok4ZNgqNIYQvSbm8+1M=;
	b=YQLXCOX8jUvge1nqlvdofyNF+mMQeOQOkfj0Aly9e3D6j3GP2TXJp0jXURNG8vIu79
	y5o/XrGZ62Fn7rSTl6UztSM+kXnrum/L223H2FxumphAx8iHtyC/+LmHX6kY4mGwtpwz
	vgS6EZJKv0Ks5jiU02ZHyTUFbD+MJE5qdWQeZFGAalVkqpdyDRam/0cUoyojPT8qKRR1
	6uIqA0ttaIX/jgKwljlzIj7PL+V1yKfrQxOEKZKngvZh1Eh0Y9sxqRj/+/IGZOsPGPPv
	U0xptQ7jL2uUugmoCBlNc2c+i4yGzT1wj70V9SVDCjJeXK+zR5+v9WsPl9wXI2njRLwz
	CZUg==
X-Gm-Message-State: APjAAAVZRm4u551jJ+m6kxocPaJKUWlHdNsbMKsKK66cWjhOgS40l/ta
	HrnlAZPTmza+mjwE1utly1A2MoL8pFFhq7Kl0O0=
X-Google-Smtp-Source: APXvYqwAA43Ph3GmoAD13Aoums3Mx86vPUAj6oPdA0ED4ESdFLLIunPGP3R386ZuqO5pdjwub5aW5Ya5PaHLD1ym8Cs=
X-Received: by 2002:a6b:d201:: with SMTP id q1mr3913862iob.302.1572381758335; 
	Tue, 29 Oct 2019 13:42:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:aa09:0:0:0:0:0 with HTTP; Tue, 29 Oct 2019 13:42:37
	-0700 (PDT)
In-Reply-To: <c66d5833-ffb1-327d-6297-ca41c5dcfd59@gmail.com>
References: <CAA=hcWTH9VCNgbDbU+ai3sydbWWKNR9HfnuGKu3oQ7XsHN6JBQ@mail.gmail.com>
	<de0e9a45-522a-be55-120a-b3cbd398ec6c@gmail.com>
	<CAA=hcWSTFCUBniK19V-2d0o87PjLN1dkpsWCXhjMXfBQiFvtEw@mail.gmail.com>
	<47af37ed-25aa-65aa-cea7-febfada814f7@gmail.com>
	<CAA=hcWQ8xjT03MC9MQPXgFVB04ZdbE5=Nd8LOE=6w308r44kGg@mail.gmail.com>
	<e91e63ef-9da5-3110-17d2-6f78bf09c904@gmail.com>
	<CAA=hcWTF5GVrEQ6WtjgLoHovrtyNKUUt_aHYpiaQ9pzHtqt7nQ@mail.gmail.com>
	<8733775b-ae58-30a3-2b11-daf8abed85b4@gmail.com>
	<CAA=hcWTucG_LwdAPBX4AA3wAv44Y-h3zqEMn9af8pWEQQFG8tg@mail.gmail.com>
	<c66d5833-ffb1-327d-6297-ca41c5dcfd59@gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Wed, 30 Oct 2019 07:42:37 +1100
Message-ID: <CAA=hcWR_X2WLhmX0EEwKqvF4i0qkGEJYpWbrgSaNEYq7iowhaQ@mail.gmail.com>
To: Ferry Toth <fntoth@gmail.com>
Cc: public-openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@plane.gmane.org,
	public-public-openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9-wOFGN7rlS/M9smdsby/KFg@plane.gmane.org,
	openembedded-core@lists.openembedded.org
Subject: Re: zimage Initramfs booting stuck at Start Kernel
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
X-List-Received-Date: Tue, 29 Oct 2019 20:42:37 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ferry,

On 10/30/19, Ferry Toth <fntoth@gmail.com> wrote:
> Op 29-10-2019 om 11:25 schreef JH:
>> Hi Ferry,
>>
>> On 10/29/19, Ferry Toth <fntoth@gmail.com> wrote:
>>>
>>> https://github.com/edison-fw/meta-intel-edison/blob/master/meta-intel-edison-bsp/conf/machine/edison.conf
>>>
>>> And there is the max size!
>>
>> Are you able to run u-boot to start kernel in the large size 64 MB?
>
> No, the largest I had was 18MB compressed and it didn't boot. After I
> brought it back to 10MB or so it boots again. Like I said, I don't know
> where the limit comes from.

Oh, so no one could boot zImage-initramfs in a size larger than 10 MB?
And no one concerns?
If anyone could provide more information about kernel.bbclass bundle
function, I would like to help to solve this problem.

> I think you should be able to make the initramfs minimal and put the
> rest in a separate file system same as I do and your problem will be
> solved. But it looks like if you want to trace the root cause and solve
> it, you are on your own.

I have already got zImage-initramfs running in a small size of 8MB
without rootfs bundle.

Thank you.

Kind regards,

- jh

