Return-Path: <darknighte@darknighte.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 78E11786A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 18:16:46 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id i1so15673732qtj.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 10:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=darknighte.com; s=darknighte;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B2gzYosHFWNlEGcLtMlZhiVa109obO/2AaogLl7QclQ=;
	b=JJOMYc3e+pKJkZKd6EqhoHqiQ1n9KTzBrupyPNGyhaOKyLdQD3nS0L5m9MKLGOmZLs
	Y8QlrqSeTRo6aeXnA/TomiSmBx5sSoCyB70jZzB6B0rOAyNb4hLChBkDkPmYAtOBKOQ1
	zDMraQbFxfqnt/KAYEskdVHWfsEZCsdyx+9ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B2gzYosHFWNlEGcLtMlZhiVa109obO/2AaogLl7QclQ=;
	b=n/MLzkryu+Qq67BpuzL+pChElsBpE1wBm1UBNuixGdG+IwicbHQe3ygo/3BJXky2QC
	Gi0g+6ypzyBBSZ4t0/06bTYa1SWXFcsEeXBNSXqIK3qaWi+jJLSDtZo6IxlEq37nBKCX
	vPvX9jX6H8Z53GDThZb9iPEmfDBioNhN1CJ9zaiunO55xCE4r558X9CcGEGpmrzbeHOw
	thceW9rsslF8220/+N+K/EygC6JbwpC5SGpcXY/WyRSr6oymeEI2icYD88nhaWfJSNYb
	kWMYC6wSHn4i/n1DcZoRqTGl1TzAMFljg1FEsjCpkBvLJLcw8Mdcn7VrLAwV1c8Kwul6
	slNg==
X-Gm-Message-State: AKwxyteZ3GDfpg1z22BNHrvfH9Oz6wDqqVIKQ77LP+jPxGlGjNvuM6SR
	WY5onEXEJyZ80jJHiooLcf570sq1ioch4WLHfmTxzg==
X-Google-Smtp-Source: ACJfBos66JoJm6cC4PqbPq6OuGHNN4+m9A9vgyON4npp6oFpaodDDUeznbqgfYY2ksJErzU9F5xJodgRW8F4iH0Ex8g=
X-Received: by 10.200.7.133 with SMTP id l5mr8216487qth.91.1516299407307; Thu,
	18 Jan 2018 10:16:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.190.142 with HTTP; Thu, 18 Jan 2018 10:16:46 -0800 (PST)
X-Originating-IP: [47.220.159.208]
In-Reply-To: <CA+YB3rZ2ZthR+bV0RZR-Af4q4X1OhEWo4oy9YhizVbHDnw+=ug@mail.gmail.com>
References: <137d31ae-329e-53ff-f495-259168b787d5@balister.org>
	<CAGAf8Lws8HfvDvMvdpgXyTvKaVpmf5a1UUTbBc2OrTpw=mgPNA@mail.gmail.com>
	<CAHQecY5FEt0jMY97Cfq7tR4KAETqied0t3zfFgXw=J5YBSz53A@mail.gmail.com>
	<f94fc2c7-032a-651a-a0d2-d5860f133b6c@balister.org>
	<CA+YB3rZ2ZthR+bV0RZR-Af4q4X1OhEWo4oy9YhizVbHDnw+=ug@mail.gmail.com>
From: darknighte <darknighte@darknighte.com>
Date: Thu, 18 Jan 2018 12:16:46 -0600
Message-ID: <CAKM2CVKDwg3-kTRaY87+0v5=n0MCaA34bLE4=roKwvfFGUe0Pg@mail.gmail.com>
To: Jeff Osier-Mixon <jefro@jefro.net>
Cc: Zoran Stojsavljevic <zoran.stojsavljevic@gmail.com>,
	Yocto Project <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [yocto] OpenEmbedded developer meeting Sunday before ELC in Portland
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
X-List-Received-Date: Thu, 18 Jan 2018 18:16:46 -0000
Content-Type: text/plain; charset="UTF-8"

Jefro, That sounds like a reasonable approach to me.  +1

On Thu, Jan 18, 2018 at 12:04 AM, Jeff Osier-Mixon <jefro@jefro.net> wrote:
>
>> We know. It is painful. YP Dev Day is the Thursday after, and I suspect
>> we would lose people waiting until Friday.
>
>
> SCaLE doesn't usually coincide the week before ELC, so this year was just
> bad timing from the universe.
>
> I propose we start with the board meeting at 9:30 and plan OEDAM to start at
> 10:30 to enable people to get there. We can have lunch late and go until 6
> if needed.
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

