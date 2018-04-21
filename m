Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id F293374620
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 08:08:24 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id 186-v6so5143542itu.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 01:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9uHtBEt7tql7pBs1aTV+G5K4v8jTakX7IdjPUSMwKwU=;
	b=M8H5nwRQ3VwIA1al8dgO9HXVbYaNe5krlCKKYkBGbSkPVfRpCs4C/mFYPQG1euAW3a
	bXn6lTrzZoVYyBRFHmH0HJcsBeXFwdjmKd2urTAvRhivwz/irPjRit8WdcoAGBBrwj1r
	co7EVnyXN0cRD9RgZAkdb4/izkgZhWpHQH9H9LBnXyRV3dslE1/RHbVNp3xrYUfYJ1/d
	k7VWLmyQ+q3zMQb/AakLh5O3yrduwEun1yfhezQe8j7ics1X3DY5YMN5IFpGxDyt3PZJ
	2r0fLXcZzJp4ZAA+iLZelj/Dyzqdbmg07e1mNi73j6lYzgAFyIeAGP/kC9Za1e1xNzto
	EA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9uHtBEt7tql7pBs1aTV+G5K4v8jTakX7IdjPUSMwKwU=;
	b=cMoRzR4e9J7IvZEOqaWkaui1NrCFhDxx4PWRp2gxwa5ekDSTDCl/hNkz+KVcaO+5+A
	qDoRa8e92phukXbpTV9RL9PmyIp1hVUHM3ok4PTxlSsRliDYMZTvF48tj85UrXFhPPaQ
	qo87ZMyIRwhkFp2yGzyJcKZkxKzbmZjf9bW+lcxhyQKIfmDDGRhw0s1dQnSghOkkAEXw
	bNwR2FE8/trpEor1m9yLWS8zkOwBipYLyCUSWjhsy7YeBxv/9v8gwIYnHNhMK2FNBOZe
	SpoYzRh3bFYJQzv6vTDKGF5+am21Snz44xeNpPKClLEzzE672FaaYhhQflNX1EReLIvF
	4Q0A==
X-Gm-Message-State: ALQs6tAjRvbSL7zStz+Uokc9IZETdz4PKAhBuHh9mtuDtnHr7TV6j6Vu
	iS+xL84+Zd666nw5I8x6tkjRWY4UXJ6FSPJ8adPfWA==
X-Google-Smtp-Source: AIpwx49q+CGHCVBAYPWKW6SP5acvLz480Fxi+t+VjBqzScWz/sH+/Jl8TIXcIlcIAQkFNfFX2IeAa13ISz5fo//KJEI=
X-Received: by 2002:a24:730e:: with SMTP id
	y14-v6mr6414256itb.45.1524298105680; 
	Sat, 21 Apr 2018 01:08:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Sat, 21 Apr 2018 01:08:05 -0700 (PDT)
In-Reply-To: <CAJ86T=VfGDpng=GRuZVDBLm_2Pgh6pEKm3+1KpeN+kXAweLyvg@mail.gmail.com>
References: <CAJTo0LYPdtHXqbKR5nm_EVzQ07Pju476n3Tahxp_zf=STW=LRw@mail.gmail.com>
	<CAJ86T=VfGDpng=GRuZVDBLm_2Pgh6pEKm3+1KpeN+kXAweLyvg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 21 Apr 2018 09:08:05 +0100
Message-ID: <CAJTo0LbD2vOaKQW7_afZXzRtY5a665mUxThgO+LPjHEAyowbBg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of Sumo
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
X-List-Received-Date: Sat, 21 Apr 2018 08:08:25 -0000
Content-Type: text/plain; charset="UTF-8"

On 20 April 2018 at 23:09, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Fri, Apr 20, 2018 at 2:57 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> Hi,
>>
>> We'll hopefully be firing the 2.5 RC build on Monday, so I did a build
>> today to see where we stand. As is typical we got two new failures on
>> the autobuilder...  My test build included the pseudo bump which
>> caused an almost complete rebuild, which is a great way to shake out
>> intermittent failures.
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12704
>> Go appears to be using the target CFLAGS when using the host compiler,
>> with predictable failures when the host is old and doesn't support new
>> flags.
>
> Maybe worth resurrecting something like:
>
>   http://lists.openembedded.org/pipermail/openembedded-core/2016-February/118212.html
>
> to flush out similar issues?

Thank you for finding that, I remembered there was a patch but
couldn't find it. :)

Ross

