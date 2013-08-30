Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9F86BCB8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 13:12:30 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id ec20so1531892lab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 06:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gIbqSoCT5B82cpFJnokMgT+zGZ6YlrCg79IHjTnEGEo=;
	b=k4INknkT9zb6z6QGobFwRwqXF8b8U9DNJxpQ9GYUNjiXJ9eIEL0jYLYJTU4iQo1Glv
	wqKvLjFMzEGbfHbdOF6zDs0CTru33ojtOoWn4NBgD1WyAcDXfqnEDtApajkRojiPTjFz
	NH2MmUahfXjQ4EC01hL3P3u5hRmwWNhYsWzR1B5XWCLgZQESKX0o5dEFJz4xsm9LJEJO
	PGn5ctCJ+rnNXTRHFWtUqTaeu/CPXvosBI+s+asd4F2Gb5k+xFkhsC/4c7nnQvHI7Hq8
	6TqsSHndzPQvQo/eWeqjs3RD6neBHPCiRA1u5V+0hfl7QhdQM2TibU3eIxVMhSYYUuTl
	M4ZQ==
MIME-Version: 1.0
X-Received: by 10.112.11.20 with SMTP id m20mr4257lbb.56.1377868351239; Fri,
	30 Aug 2013 06:12:31 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Fri, 30 Aug 2013 06:12:31 -0700 (PDT)
In-Reply-To: <CAOMwXhOd5JUf1HiEkcHXW5Tj3DrYqAnjq0KCQe3Up7RuL0=L9g@mail.gmail.com>
References: <CAOMwXhN=mJMrePAXftb8CX_WOshN=S6ufC3BaXwfjY9WYGat+A@mail.gmail.com>
	<CADkTA4MAD8vB4EEdbSSfKSFuF4bRRmUxoft_y=VQLAZo3gb3Gw@mail.gmail.com>
	<CAOMwXhOd5JUf1HiEkcHXW5Tj3DrYqAnjq0KCQe3Up7RuL0=L9g@mail.gmail.com>
Date: Fri, 30 Aug 2013 09:12:31 -0400
Message-ID: <CADkTA4Okp9VLW3+Gkagf2O8XQezOWcD0LOzX_biCr2D0V0Sn8A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Bug: 5089
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
X-List-Received-Date: Fri, 30 Aug 2013 13:12:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 30, 2013 at 9:02 AM, Laszlo Papp <lpapp@kde.org> wrote:
> On Fri, Aug 30, 2013 at 1:47 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>> On Fri, Aug 30, 2013 at 7:45 AM, Laszlo Papp <lpapp@kde.org> wrote:
>> > Hi,
>> >
>> > there was this change which also goes undocumented. Unfortunately, this
>> > is
>> > causing a lot of headache for me, but I expect that for others, too.
>> >
>> > I would like to propose the default kernel and module name from:
>> >
>> > uImage--3.2.1...
>> >
>> > to:
>> >
>> > uImage-3.2.1...
>> >
>> > This would avoid a lot of work for people. I have been trying to fix
>> > issues
>> > for one day due to this which is unfortunate.
>> >
>> > Also, the double dash on its looks silly IMO. It should be either '-0-'
>> > or
>> > '-'. I prefer the latter for compatibility reasons, although someone
>> > could
>> > argue about that the former is more readable.
>>
>> Having maintained several systems when the default name was changed
>> to include PE, it didn't cause any problems here. Both dependent recipes
>> and scripts picked up the change easily and convenience symlinks made
>> the -- or -0- not something that needed to be dealt with.
>
>
> That makes me think you have too flexible scripts which will cause issues
> elsewhere due to the flexibility. I had been on that front, too. That was a
> gate in my case for a lot of issues where something was expected, but the
> script was too flexible to verify properly. Either, when you use an accurate
> script, i.e. you follow the name format specified, it will cause you issues
> when updated. It is likely that you just have not provided accurate enough
> pattern matching.
>

Everyone's workflow is different, and I'm confident that the infrastructure
I use around the build is solid .. it's chugged along for over three
years now :)
But I don't disagree that output and format changes impact everyone differently.

Cheers,

Bruce

> Anyway, I will not insist on this much if people think breaking this for
> many scripts is fine, and extending the documentation should be enough.
>
> -- Laszlo



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

