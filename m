Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id C2B3D79101
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 13:48:26 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id w21-v6so2723298lff.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 06:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wPuPfcOWnIKqoCRkge1CIFZnpvKWWs9Ljgh/ITvOVSE=;
	b=P1lSYWEpUZaalSTUSvqDKBH/p1S5Xl8g9x8CdZx8DFDkZX+XT4vpHxmmWJG8zQ3DvJ
	rS9fx18k8zhBM9VkP4/Tp6zDXo5cAQcv8kVxygIS9kP7xpIeZr3WXnPe9ih0uMKkqP4k
	VscWRMLKHTXBYgaPNsEKbDg+AXtQkO2635R318keDr+bxH197rA8ZeJzzTyTv+5o/kZO
	WrWOvT6t5O4femxjnkBQ753qtkM/tLFvHSeukP2nDD95SycK2EUqmMqpspMKy4PecmHG
	OqKo+moAf86h24YRVv2KO0QEpwbY9DBV9q1d0S9k04jNNAbzJjxzeCipv2bnYLs7lg2T
	ZNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wPuPfcOWnIKqoCRkge1CIFZnpvKWWs9Ljgh/ITvOVSE=;
	b=ms0L6tQkHNbe0gK9Y6BuHaaPQXnsgghIrSNkBaRhiHUFLudF33xv0BG/naenip1rRa
	49zGV2aNlE5K1iidBI/E/CUYlvLFkumuJ0ePf5c15dNUCT9CU/PTNiX0ASPIZHqSWe40
	y7OAHFEUTw6kqaPF5kTcfqgOU30mwarINjJt+yll9QQI0YdXKDboY7e7s4mohP3lIRu+
	KpnCXOwJ1vAD23f8UI29a0YhB610noxhXZUhPAmJv83n8haFbCPTso26XmNzte6qPqVx
	pdihgz3Z7Y9TVo0N8LVQu1KyEPSChzxl4+qzG+OrBPW1U4juwEQsHTrjoHxwiog4zMY8
	FYKQ==
X-Gm-Message-State: APzg51DEGWida6eZs/YT0lu8ofssM6aMzJvNhiSuOlSYCZNzXDKoxYV0
	dhoYovJ0Cq+TqwcfXMFxYc7w5kddk0K/c9PoFwowdQ==
X-Google-Smtp-Source: ANB0VdYC/J6tzmbAVc6TMztvvdTfrCUGqxbaWPBCsD7Y1bwLhWcFk6VJ2CKTcsaB5NYwNmIkmfak1pl1PHTmhnw5FYk=
X-Received: by 2002:a19:6b0b:: with SMTP id
	d11-v6mr5371431lfa.99.1537796907078; 
	Mon, 24 Sep 2018 06:48:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Mon, 24 Sep 2018 06:48:26
	-0700 (PDT)
In-Reply-To: <CADkTA4MfAESbzUV99QR8gCWLaC-R18wuR8fTbS7aWaZWzhttYA@mail.gmail.com>
References: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
	<20180924072539.GE9430@hiutale>
	<CADkTA4MBwLt_7AHDqVfh79KNB_sG58+gGWLz=4KqMg1Qpk1Ngg@mail.gmail.com>
	<20180924121927.GI9430@hiutale>
	<045ad825c6999fe4876a7aa90cb427ca2d0d8c87.camel@linuxfoundation.org>
	<20180924132013.GJ9430@hiutale>
	<36b0c47b199a55e4c385f437aad964980c20dd61.camel@linuxfoundation.org>
	<20180924134234.GK9430@hiutale>
	<aeea3a8ffd2dac5f295e4357a3058505546fa1dd.camel@linuxfoundation.org>
	<CADkTA4MfAESbzUV99QR8gCWLaC-R18wuR8fTbS7aWaZWzhttYA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Sep 2018 09:48:26 -0400
Message-ID: <CADkTA4O_nCQTD-3UrCqk95HYj=XvjqduaCkUR5d6FKeUyBNPmw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: allow exporting files from kernel recipes to sysroot
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
X-List-Received-Date: Mon, 24 Sep 2018 13:48:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 24, 2018 at 9:46 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Mon, Sep 24, 2018 at 9:44 AM,  <richard.purdie@linuxfoundation.org> wrote:
>> On Mon, 2018-09-24 at 13:42 +0000, Mikko.Rapeli@bmw.de wrote:
>>> On Mon, Sep 24, 2018 at 02:38:36PM +0100, richard.purdie@linuxfoundat
>>> ion.org wrote:
>>> > I was replying from the perspective of how this should work in
>>> > general.
>>> > I agree that for this to work with a kernel recipe we do need the
>>> > change that started this thread and that is probably a reasonable
>>> > thing
>>> > to do.
>>>
>>> Good, then my patch is not going in the wrong direction.
>>>
>>> Remaining problem is if file overwrites will be detected or not so
>>> that
>>> accidental overrides of files in linux-libc-headers from kernel
>>> recipes
>>> should not be possible...
>>
>> That is a general problem and the core sstate code shouldn't let that
>> happen these days so I think that is already covered?
>
> Yep, it should be covered. I was just looking for confirmation.
>
> Can everyone have a look at:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5305
>
> And confirm that it can be closed by this .. ? I suggested my approach
> in that bug, but it
> never went anywhere at the time.

Sorry for all the email, I hit send a bit too soon.

The only issue that would remain for that bug is that there's no
standard/default location for those exported extra headers, and it
is up to the kernel recipe packager to make sure that their recipes
know where to look for them.

I'm not convinced there has to be a standard location for them, so
I'll all for closing that old bug.

Bruce

>
> Bruce
>
>>
>> Cheers,
>>
>> Richard
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

