Received: from mail-lb0-f182.google.com ([209.85.217.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UBQLa-0003Tb-Lt
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 14:50:17 +0100
Received: by mail-lb0-f182.google.com with SMTP id gg6so2198993lbb.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 05:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=g6pwBfKYETpWXJZxEhpAs3NPF6lzxyNuFQAqVlE6sms=;
	b=sz7qEW1PvWyMJzGuGpxe/wKkd6QxuccoXiij/+RY+a5jCM/T/XA1VJyrgp5j+GnLyB
	um3xCmRWeUA1bFz3vUOpTWOyFjHspl4pRtLsYZGOcPOvlZUwW52lgCcgXaDxBrJaKiP0
	A7QR11p+w+xJ+dfDWOTxqBjX+mdn4eIxM5AZT/TIS5yEUaBfpVln2nn2Ikm8loSkd7On
	XXjKu7N30GR2Jerjt1Lr3p+oeqjTUQZvnyehyretiNJbZJ5VUSDE1VdyCJFUUpTJJ5Wj
	ZlpXv5+pluVGyB8Sq8yM3rH+w4o7jcLe5J55yh6Gn/zlHLVTExiZhK2htiM1kT5MTbs6
	TgZw==
MIME-Version: 1.0
X-Received: by 10.112.40.228 with SMTP id a4mr777627lbl.26.1362144819118; Fri,
	01 Mar 2013 05:33:39 -0800 (PST)
Received: by 10.112.61.3 with HTTP; Fri, 1 Mar 2013 05:33:38 -0800 (PST)
In-Reply-To: <51309549.8010502@communistcode.co.uk>
References: <51309549.8010502@communistcode.co.uk>
Date: Fri, 1 Mar 2013 08:33:38 -0500
Message-ID: <CADkTA4PcJitHND_Nj2vD3tDSHk11eeN-w7uWqBQ9Yht1fp3C7g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] U-Boot Recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 13:50:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 1, 2013 at 6:47 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> Today I was building an image for the beaglebone with oe-core +
> meta-beagleboard. meta-beagleboard pretty much provides the machine
> definition and the kernel. In order to build the correct u-boot (2013.01+) I
> had to add u-boot 2013.01 to oe-core. Whilst during this I noticed the mess
> that the u-boot directory had become, I think we need to have a show of
> hands who uses what u-boot recipes and can they migrate to newer (common)
> versions.

The mpc8315e-rdb reference uses v2012.04, and a quick survey didn't turn up
any other explicit preferred versions in the layers that I have around my
development machine.

So for now v2012.04 needs to stay, but as we bump that board to the 3.8 kernel,
we can give another bootloader a test run.

>
> When I submit a patch to get 2013.01 supported, that would make 4 different
> releases of u-boot; which seems a bit excessive.

Most releases that I've ever used have kept compatibility fairly well, so I'm
all for keeping the number of active versions to a minimum. I'd say three is
a good number, since that matches the number of active kernel versions in
oe-core as well.

Cheers,

Bruce

>
> Thoughts?
>
> --
>
>   Jack Mitchell (jack@embed.me.uk)
>   Embedded Systems Engineer
>   http://www.embed.me.uk
>
> --
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


