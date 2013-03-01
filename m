Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UBRbJ-0006YU-27
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 16:10:46 +0100
Received: by mail-la0-f47.google.com with SMTP id fj20so3039779lab.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 06:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=KNZS9hACVn8Z275wHSDT0fLEnadT6pDUtMiQuAfaj20=;
	b=BZBEBASCwQkVPAXz+P9sAcDGxOOHLM6Os/LvmoCtLlAHI1pwv/xF/0J5u+j4nq9NDL
	5vG0wimeigO1VXF3EmwcYdZIyd/KqSLb260Ml/XzPXQ9IBt3s7K7zyn4YerVoQl3VKY4
	0ublhvfHxyjFq6kfSQm6ti6BolKtymSl2Ds32sS9HXWsbiNcBRTWgxnMBOc8dX5QtD7Q
	82M14xDErJZ4xbwF3bxetOu5vKD+HKH14jL0UknvmAgHHWtl4CZkyuG9n2T1Vgf4LxGT
	KOZnms9XP9daK/Mnqe12DOCBV5qGmzQVjG1fL3gYt79/HROxcJRMor/iGi/ERwJK7fMF
	VHPg==
MIME-Version: 1.0
X-Received: by 10.152.113.164 with SMTP id iz4mr9331796lab.50.1362149634395;
	Fri, 01 Mar 2013 06:53:54 -0800 (PST)
Received: by 10.112.61.3 with HTTP; Fri, 1 Mar 2013 06:53:54 -0800 (PST)
In-Reply-To: <1362148961.1055.57.camel@ted>
References: <51309549.8010502@communistcode.co.uk>
	<CADkTA4PcJitHND_Nj2vD3tDSHk11eeN-w7uWqBQ9Yht1fp3C7g@mail.gmail.com>
	<1362148961.1055.57.camel@ted>
Date: Fri, 1 Mar 2013 09:53:54 -0500
Message-ID: <CADkTA4OPqbNrwxHdOTAWdWfMJ3v7iaw-BLuKTy4Tfh45DC+mQA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Fri, 01 Mar 2013 15:10:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 1, 2013 at 9:42 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2013-03-01 at 08:33 -0500, Bruce Ashfield wrote:
>> On Fri, Mar 1, 2013 at 6:47 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> > Today I was building an image for the beaglebone with oe-core +
>> > meta-beagleboard. meta-beagleboard pretty much provides the machine
>> > definition and the kernel. In order to build the correct u-boot (2013.01+) I
>> > had to add u-boot 2013.01 to oe-core. Whilst during this I noticed the mess
>> > that the u-boot directory had become, I think we need to have a show of
>> > hands who uses what u-boot recipes and can they migrate to newer (common)
>> > versions.
>>
>> The mpc8315e-rdb reference uses v2012.04, and a quick survey didn't turn up
>> any other explicit preferred versions in the layers that I have around my
>> development machine.
>>
>> So for now v2012.04 needs to stay, but as we bump that board to the 3.8 kernel,
>> we can give another bootloader a test run.
>>
>> >
>> > When I submit a patch to get 2013.01 supported, that would make 4 different
>> > releases of u-boot; which seems a bit excessive.
>>
>> Most releases that I've ever used have kept compatibility fairly well, so I'm
>> all for keeping the number of active versions to a minimum. I'd say three is
>> a good number, since that matches the number of active kernel versions in
>> oe-core as well.
>
> I think one u-boot would be nice. Lets see if we can bump up the
> mpc8315e-rdb version...

That's always the goal, but time and effort comes into play .. I've got
my hands full with my current items and won't commit to a bump, since
I won't commit .. and then miss.

If someone else does the bump, that's an option .. but I have no idea
who that someone else would be.

One random thought (for no real reson is that this is one particular area that
commercial and upstream differ .. we almost never bump our u-boot versions
once they work, since there's no benefit and only risk to updating the firmware
and reflashing the board (heck, even *building* uboot) when it is  older and
doesn't have any missing functionality.

That being said, I'll see what I can do, but no promises. In the mean time, the
version called out in the reference board should stay around.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


