Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7A4D761BEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 17:27:43 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id d15so2755386iog.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 10:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OR69CxGzZ6e4MPo6A0UEvfeqDf29yuH8IUqtIjNHFaY=;
	b=J0TVYN0ka+DqxJvfdw0LOXgxhqbKQU4YJIDUYI6Mrp7ZKfVyT1gW7+lCYLL/e3S45F
	x4iqZPd0necEZtcZebVI+uqg6w3VFdzooI+NYfc8z9McA8KC5BPs2nUjJW049N7ad4HL
	/GcdhML7N+Ee3SlGnnupm+B9oiYnpMWSzCE8HSW6UMWiMnbCKVIvkyulcYFKu5OQTxjZ
	hK268cnYGBtjntHI22Oj3mGghj+A1WwuvQZ8PbUxGbsPVzpIsiSwjU9m2CCccPNmiS0f
	lFMzI4PxsChQyAMy8+Tz6jM4zK5u1o2kki6EEQCKV3rRXQgX4fOf01dACnKro7Q0PW1p
	OTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OR69CxGzZ6e4MPo6A0UEvfeqDf29yuH8IUqtIjNHFaY=;
	b=ie5CGZRQXmV5ErbHDB1UpnRSPI8iSbhAGBxbUBZhNhqZVoHeeC8xJhLO4l7abeFFo7
	xeR4C+h6PI/EgU7JvuQ41+NfqrhOkUN7tQ2QR4BldcboE9nhuKdCjTUyCuM1AdGqKutI
	efhv68vP0MzTV9O7wYqaXq5t4V+Bb60YPsGJoS7Qv26ddCnCi8IjtETa3+JDDg7u+k7b
	p7nY0nPDboEiNxtg4sWLQhfv1qIAYRtXtEWpRPBrTrDQRjXfQJMzbHYjxFBEhF+YrN7t
	hTj5xWkOlSTAn1SOOTOm9b29m5d0xrscX413SfbCvQXbV0soJGKDStqhKfrvgYVqZ0fF
	9wmg==
X-Gm-Message-State: ANhLgQ1dXyYlPiwXivJ1CAC3tF/ffEwir43Csmb0bHnjNOY7a+2305T+
	EZJTmvQ+0oSBSlFU/EsnPpBQhJj8odQhDxm5EVE=
X-Google-Smtp-Source: ADFU+vtW1TENfIAi7+tvuYkoWIIuH8ynJPPGNfxjDVRhi/Q+UfhcKMwXYp3lV7jvgDfJBcXE16FGwwW0UKYjxd92SvM=
X-Received: by 2002:a5d:9694:: with SMTP id m20mr3868219ion.48.1583947664240; 
	Wed, 11 Mar 2020 10:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAO5Uq5ROxZsnZxJd=a6vUJTmAnMLb82XJmxjJYjiBjt24ToC7w@mail.gmail.com>
	<5e5adb83812fe98a76b8207588325f7996e33c85.camel@linuxfoundation.org>
In-Reply-To: <5e5adb83812fe98a76b8207588325f7996e33c85.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 11 Mar 2020 17:27:33 +0000
Message-ID: <CAO5Uq5RCVcvmqgEr2ypgMwg9LvnBskynMaQjKHzV-_JcgnrdGQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: psplash activation state w/ systemd
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
X-List-Received-Date: Wed, 11 Mar 2020 17:27:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 11, 2020 at 5:20 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-03-09 at 15:18 +0000, Alex Kiernan wrote:
> > I've a branch with systemd 245 on it which fails testing because
> > psplash gets restarted all the time.
> >
> > But ignoring the systemd 245 piece, it looks to me like psplash could
> > be restarted under systemd 244 too as the main process exits and our
> > units aren't marked RemainAfterExit. I haven't figured out what's
> > triggering it in 245 and not 244, but I suspect it's something
> > similar
> > to this:
> >
> > https://github.com/systemd/systemd/commit/9fd32ff7d363945fbf8fdae0128702b995127558
> >
> > Given where we are in the release cycle and how painful psplash has
> > obviously been, I'm inclined to leave it until after dunfell ships
> > and then do it as part of the whole 245 upgrade?
> >
> > Equally if you see psplash flapping during tests, it's almost
> > certainly this problem.
>
> Thanks for the report. The weird thing is that master is working with
> this as far as I can see, certainly no test failures since the last fix
> I pushed a few days ago.
>
> Is there some specific change to the unit files we should make? I'm a
> little reluctant to pull this out now given we feel like we're close to
> it working.
>

It's basically trivial (add RemainAfterExit=yes to both units), but as
you say, given where we are and it appears to work, I don't think
now's the time to do it.

I suspect something's changed in 245 which makes it far more likely
that you see units retriggered, but I can't for the life of me work
out which commit it is (I should stop trying to do it by inspection
and bisect it out...).

-- 
Alex Kiernan

