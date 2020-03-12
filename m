Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 713F760CB9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 09:07:50 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id v3so4849190iom.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 02:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=viQDC6Doxx6NPAuKrK/HG46toCXSiA0w+WZwFlu1fGQ=;
	b=csrB6KMP2nLOO/7qABqjypgqSOs5NCSoQ7FSMhiA0o0+WZM67+JAeZIvO/Z8G7uWB5
	5O5pIejLAMYUa8dMcTWKTWn8jvo/qJODu1OtaoAuT80+fe6aGAHPlAeaRJrzhhED/Xb0
	Wxy7OUWeRuvN5pHsEvbgeYpPzunx/7PjEsieMsFGyH76HIH0UOWjyc+MdpWylzDkNlHn
	j8Kn8l1RTRIxH/vMN7AVMu7VqYY99YOJbr2ubhkpRtS8YC+Xs2vBaGF9oGUzNOVNxkwU
	1AvxU2OwnaLh1bOt2k61jY9uppXmcFypaPYGQKFsz5hYGspSM4Nq3e+q1yhXQyyfEAbK
	N/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=viQDC6Doxx6NPAuKrK/HG46toCXSiA0w+WZwFlu1fGQ=;
	b=fBSRtNTU0ZrqoNAwS777VfE0YawF2BI+C4GaIk97y2U4VJHzHFpXlIbwxBHqWNG0lr
	/0D9LQLMSu8KHRsknLtQJh1wZzlPclaanF9ZXStbRp4hsZ7R+gAIjL8b4uoP2JJfo6jz
	Hpo65fBwjnNM9/1j2QfnTwr3VFj/W/Vg1dVZDiGpFAcPq3z7WtXgV6SHRvP8j8PmkQC/
	ITDwsafcr3Jlg0fzwdr7oiGN6cvdnjgkP8VB7EZTmjjvsJB1L+J5FJxaYMqzdvsh07v2
	VjerqYQdqzFLrvq6pZZSzD2y3w7XGDoD3JkTSwMJVrVe98l3026XSYi/vWxb9r60sMKu
	kanQ==
X-Gm-Message-State: ANhLgQ0lXQNLwfbkdEvE6E7fN8B4RAL/JzMW1AX3jCigtGHviTSARVnR
	cb5uk0HVOWr1SjfZ4EBEQGzLp9kbB5lUeQFpa+k=
X-Google-Smtp-Source: ADFU+vt28L390tBhL9DvtnN8WG1jDTAEkA4pxNfJHFui/6R/JurFZgamovFtq1col/1soU4oyRh4G04Ukvyj4mfhuO8=
X-Received: by 2002:a02:3b09:: with SMTP id c9mr6668616jaa.122.1584004071159; 
	Thu, 12 Mar 2020 02:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAO5Uq5ROxZsnZxJd=a6vUJTmAnMLb82XJmxjJYjiBjt24ToC7w@mail.gmail.com>
	<5e5adb83812fe98a76b8207588325f7996e33c85.camel@linuxfoundation.org>
	<CAO5Uq5RCVcvmqgEr2ypgMwg9LvnBskynMaQjKHzV-_JcgnrdGQ@mail.gmail.com>
In-Reply-To: <CAO5Uq5RCVcvmqgEr2ypgMwg9LvnBskynMaQjKHzV-_JcgnrdGQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 12 Mar 2020 09:07:40 +0000
Message-ID: <CAO5Uq5T9VjVgmPBKGvPyBesxsgOnTbijMEZYevZkMieOYakNbQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 12 Mar 2020 09:07:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 11, 2020 at 5:27 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Wed, Mar 11, 2020 at 5:20 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2020-03-09 at 15:18 +0000, Alex Kiernan wrote:
> > > I've a branch with systemd 245 on it which fails testing because
> > > psplash gets restarted all the time.
> > >
> > > But ignoring the systemd 245 piece, it looks to me like psplash could
> > > be restarted under systemd 244 too as the main process exits and our
> > > units aren't marked RemainAfterExit. I haven't figured out what's
> > > triggering it in 245 and not 244, but I suspect it's something
> > > similar
> > > to this:
> > >
> > > https://github.com/systemd/systemd/commit/9fd32ff7d363945fbf8fdae0128702b995127558
> > >
> > > Given where we are in the release cycle and how painful psplash has
> > > obviously been, I'm inclined to leave it until after dunfell ships
> > > and then do it as part of the whole 245 upgrade?
> > >
> > > Equally if you see psplash flapping during tests, it's almost
> > > certainly this problem.
> >
> > Thanks for the report. The weird thing is that master is working with
> > this as far as I can see, certainly no test failures since the last fix
> > I pushed a few days ago.
> >
> > Is there some specific change to the unit files we should make? I'm a
> > little reluctant to pull this out now given we feel like we're close to
> > it working.
> >
>
> It's basically trivial (add RemainAfterExit=yes to both units), but as
> you say, given where we are and it appears to work, I don't think
> now's the time to do it.
>
> I suspect something's changed in 245 which makes it far more likely
> that you see units retriggered, but I can't for the life of me work
> out which commit it is (I should stop trying to do it by inspection
> and bisect it out...).
>

Looks like it's:

https://github.com/systemd/systemd/commit/097537f07a2fab3cb73aef7bc59f2a66aa93f533

which I found via:

https://github.com/systemd/systemd/issues/15091

Definitely ignore this issue for now... I suspect we do actually want
the RemainAfterExit, but for now wait and watch where upstream systemd
ends up on this seems like the sensible approach.

-- 
Alex Kiernan

