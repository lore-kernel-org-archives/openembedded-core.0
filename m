Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0C60278077
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 17:53:34 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id g13so3246765pfm.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 10:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sVWtzC1GseDZ8ftqxrQOsWIfSStvBumgXqQ3oKt6tys=;
	b=B1Qjx1C+JmpJGpTD7J7XeVojRf5kg3DRbmlNee50kGN7jZJUbIQN9qawTh6oCMZB1J
	I0RarmgSa2ApZzUR8ADeeyXPRxDJRv9m+2xXfET6V17/VIyWDrwRTjiAif9z6R+VrSD9
	gyVRcXeJaGk0S4Gz/k+AKWK5AOENcbV6zkpZAy062VMDk9BG0qjpZTk5vPhb5jxKP031
	OZtjSQPhKx+cWBAHvjKH4FEorL2OLp9ANW5ulYrQ4aMao2PcPDsNNR74U8k2jQraI+8h
	WN+8EranoLDROpH2si8o0DOF6GSBaaRoYc0WRbIqk5zKTaxb6v8XaMIRYYNWgHpEzeS7
	OQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sVWtzC1GseDZ8ftqxrQOsWIfSStvBumgXqQ3oKt6tys=;
	b=s+pKQwsJxhovfky61TzedNFHU9glJcOoi410TbtE1UQ3Qz/XwHrYmMMpwKrB4iNNDy
	zjPNbXR8DUztXVfzOLgpetyFp33hu3kBbV4zV+b0rjrLThl3SR5SuwZDHobnTy4EiLMc
	74+sJupMBtFYjZp7wKwcm6tRFFu2a4nFo9cv/PmiGXekV11Vn8jhiJn77VIkkq6j7cPN
	xzk1FEp0Ykc9g7onIJ3ycvkDvQm9Hhpq9VY08d2/VFlPmSykr3JsI8TK/bIhuTJ6bdwp
	MzqC9C7OAz4x2ZuXoQ/eHKrgI0KaH+Oq/qNt5l+oqmZMm+ck5Fdn+WVUOf9XhSz9lMEm
	0rxw==
X-Gm-Message-State: AHYfb5gwf6hblrfh/XkR0C/iKZRqxIOlUA2JZAOlqVTy/XRUwqUHUkkE
	uIuvTFKbP0pwGZwZWnMnvlA236xoIA==
X-Received: by 10.84.217.137 with SMTP id p9mr1719363pli.404.1503942816387;
	Mon, 28 Aug 2017 10:53:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 28 Aug 2017 10:53:05 -0700 (PDT)
In-Reply-To: <1503850064.32591.275.camel@linuxfoundation.org>
References: <CAHUNapTr=oOvVTHvwxGJ2uPZB7Kbs4rBh9U8ZGzdNd0HuHi=1g@mail.gmail.com>
	<1503423645.32591.120.camel@linuxfoundation.org>
	<96bce0e3-a699-4993-3748-a0fc19684ffa@linux.intel.com>
	<CAHUNapRMGUyRN0omktP7x2sgk1QuHh9C-j13Am4Wo3eWYe04=w@mail.gmail.com>
	<e165f760-1c1e-1a5f-2fba-f8c293a16278@intel.com>
	<1503849667.32591.272.camel@linuxfoundation.org>
	<1503850064.32591.275.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Aug 2017 10:53:05 -0700
Message-ID: <CAMKF1spfDsEoQUADFiHu2yB-=m1MEk9ywSNPHqp3Keh9wAXp3g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alexander.kanavin@intel.com>
Subject: Re: long (never ending?) do_install for adwaita-icon-theme
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
X-List-Received-Date: Mon, 28 Aug 2017 17:53:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 27, 2017 at 9:07 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2017-08-27 at 17:01 +0100, Richard Purdie wrote:
>> On Wed, 2017-08-23 at 15:46 +0300, Alexander Kanavin wrote:
>> >
>> > On 08/22/2017 09:46 PM, Trevor Woerner wrote:
>> > > $ strace -p 43675
>> Process 43675 attached
>> read(1025,
>
> And the answer is staring me in the face. select() only supports FDs up
> to 1024. 1025 > 1024 which is > FD_SETSIZE.
>
> Therefore pseudo hangs when we run into large numbers of fds :/.
>
> https://access.redhat.com/solutions/488623
>
> So I think we might at least understand what is breaking. It may be
> using poll/epoll would work instead?
>

I think your explanation looks plausible. I am getting build hung in
do_package_data
tasks too after few days on box ( make -j20 and 44 tasks in parallel).
Then I reboot the box resume the build and it works
again.

> Cheers,
>
> Richard
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

