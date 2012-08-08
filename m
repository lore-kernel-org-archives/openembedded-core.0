Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sz7l2-0005Xp-9M
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 17:01:12 +0200
Received: by eekb57 with SMTP id b57so217586eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=gL1HwWM9EUwCP6J2XNOuiu80/oe873D4QyrPPQ+4XPI=;
	b=jlHxA5aaKdHH5WFyAdsOILtPzphE95pNUOmkLUj9iwtanAFHa40SoraccU9b709jGf
	sHyyh9cKSoXnH10ZnazyRUQIsk+oRsZz9HXY3s52bcKtTAw8q5IXtCWBLKwAU4em53Gk
	s2OZAvJhrOBgm7hXNzCtqB3FYFaJ+Ftr6DCrw3mjkk1/NENkqq4Ih1TILCYSUgwwj1XU
	Ex6tfo9YoIeIgSSIOhYWUj39HMd7BjXSeVawQcwNu3LjlronUqvEwf6+fwToQUX2d1/e
	zxMR385xmG5DKOPTWsXP3jTHA0eZw5Ex/pYVfQgagWpEFBF9Os5ijW3syKW3OlYHqV3K
	ShuQ==
Received: by 10.14.213.137 with SMTP id a9mr163027eep.38.1344437365163; Wed,
	08 Aug 2012 07:49:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Wed, 8 Aug 2012 07:48:54 -0700 (PDT)
In-Reply-To: <CAJTo0LY9f-nAD7+eO=jDJqD0qYRa8FPUhB-VkWDum0Urq3q=7A@mail.gmail.com>
References: <1344374781-21240-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LY9f-nAD7+eO=jDJqD0qYRa8FPUhB-VkWDum0Urq3q=7A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Aug 2012 07:48:54 -0700
Message-ID: <CAMKF1sos9p8Y8Q3mBMT9RZkbzwDGpuifUowKs9gyMkdYw61vGQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: Enable threaded linking with gold
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2012 15:01:12 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 8, 2012 at 6:17 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Hi Khem,
>
> On 7 August 2012 22:26, Khem Raj <raj.khem@gmail.com> wrote:
>> This options will let gold spawn multiple
>> threads for linking and speeding up linking
>> on multicore build hosts.
>
> I turned on the DISTRO_FEATURE ld-is-gold and rebuild my toolchain and
> then webkit-gtk, but there was no improvement in build time (I'm
> attributing a 20s difference in build time to noise considering the
> build was 24 minutes).  Is there something else I need to change, as I
> was expecting WebKit would be a good winner with this.
>

hmm, yes I would think so too. My experiments were on a i386 box with
2G RAM I see considerable improvement on app linked with boost that I
tried. Can you recheck if ld is pointing to gold in
the cross toolchain install ?

> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


