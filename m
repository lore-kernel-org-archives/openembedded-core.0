Return-Path: <jdmason@kudzu.us>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id DF1407E7E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 19:26:59 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id w25so819813ioc.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 12:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/+LmrzPbh32qAgb1QtATOEgIRjFV0l91B4JJDVO2VEo=;
	b=DHNn6sG422xSmb6cl5E3TGytCS3YYE3wKuMpFPyJgIJWJ3CLxzfTURL0x7gihFlUyD
	4WO8hlZpAsMyysazkKDOiIP4d+bAEs5mAXPmWCKGhHu2dbM2JGJ0fVCFhMSznFg74xTr
	60tuRlKnymVKxCOt2C3iWBVxlu6GlSsSco+fylnqPZBohLuesQ9f6/R/3sNdmFpn/+6h
	PWfCXKjFGpWja5rgog95Ld/NI+bh97xw2FpeQVgRVskaF54Tq095HuUGyhHasHfqddyA
	YywEYab5joBgqPMl+WM0UEeT/MpgaodN7r4LKFq7E3BIsds+Ca5EE14joahDHHJMsUdk
	UsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/+LmrzPbh32qAgb1QtATOEgIRjFV0l91B4JJDVO2VEo=;
	b=me9pRzdKr6YRXGboBErGEE/hN3dBSeqNuH4qr9NGuH1B6cxwQzkxr0c7GprghqPiVt
	QB78UHMxhkQFPUxXrvaczio2FivOkas3KwXqFl9OWGwqBgd3SS240rdj70y/izwm8ZqO
	HN7x+3bMRInS6f0D5XS6JnmAwnguBv3/1rAVwzZY1XUONlO9+VXjJKhoGJRq+8zUF/+v
	QTCVdHVGrHCmwcm45MRLJpV6Inw8o0LZp/9mSmk2doJSweyO609Fpb6IkOKUTZp9FGN+
	FzbT8fKgubpUa1nMpa/Usa5iGjDkhg5s+9dN0goYEy6RN5fTcitmL17y2jH6dRawrWAk
	DwhQ==
X-Gm-Message-State: APjAAAVBYNNW3EIG3KpIGWbu8fY9KeBmsKJ6+0XF8y2dTGIRyubsLr+H
	Wq+/gOqfBDNmkY56U4+EPlCKV2HXCkv4z6qm4B2ORRSa+DA=
X-Google-Smtp-Source: APXvYqzMDjJvd1ZFhxf2Ob/LIzDwn100sK2xGkg08SGp4TpyWbFRMfs68dMKMBNh+v3kr4zjY647WGYJY3P2oddlb1c=
X-Received: by 2002:a5d:8f86:: with SMTP id l6mr3400394iol.97.1561145220640;
	Fri, 21 Jun 2019 12:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190621154213.12761-1-jdmason@kudzu.us>
	<eea8e0445b82a8fd472fa9333a665555a990728a.camel@linuxfoundation.org>
	<CAPoiz9zekGpeDRd=PMCneuzNeBgEBzHjgoKvcrR5WjnWHUDSiw@mail.gmail.com>
	<1a9c38dca2be655c935d435a6cf6f52ae8342bf6.camel@linuxfoundation.org>
	<CAPoiz9z-5w_jGUtzJVtAfByUroGAo+6-rkuDP+WkKk1s89r3HA@mail.gmail.com>
In-Reply-To: <CAPoiz9z-5w_jGUtzJVtAfByUroGAo+6-rkuDP+WkKk1s89r3HA@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 21 Jun 2019 15:26:49 -0400
Message-ID: <CAPoiz9y+hqO5CNxxkL3XdpHMDJoEeF3LrGU_kFzhrhxiQacR-w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe_syslog.py: Handle syslogd/klogd restart race
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
X-List-Received-Date: Fri, 21 Jun 2019 19:27:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 21, 2019 at 1:44 PM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Fri, Jun 21, 2019 at 12:58 PM <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2019-06-21 at 12:39 -0400, Jon Mason wrote:
> > > On Fri, Jun 21, 2019 at 12:14 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Fri, 2019-06-21 at 11:42 -0400, Jon Mason wrote:
> > > > >
> > > > Thanks, I think this is reasonable however I think we may need to
> > > > make
> > > > the above a function and then call it from other places in the
> > > > tests in
> > > > that file.
> > > >
> > > > test_syslog_restart should check it did restart using the above
> > > >
> > > > test_syslog_startup_config does a second restart which we should
> > > > also
> > > > check?
> > >
> > > Seems reasonable.  I'll crank out v2 shortly.
> > >
> > > > Out of interest were you able to see error codes being returned in
> > > > status in your tests?
> > >
> > > I used code to force every error path during development, but not
> > > that
> > > the testcase will fail.  So, your question did cause me to notice a
> > > bug in the code when verifying that the old ones are no longer
> > > running.  That should return 0 if still running, which wouldn't cause
> > > the assert outside of the loop.  So, I'll need to tweak this there.
> > > v2 will have this fix as well.
> >
> > The reason I ask is that its far from clear that busybox's starts-stop-
> > daemon would notice if the daemon didn't restart so I don't think we
> > can reliably trust status to be set correctly.
> >
> > Is there any reason we can't run these checks regardless of status?
>
> The current code logic would work regardless of whether it failed or
> not.  I we can run it every time, and it would not hurt anything.
>
> > I realise there is slightly more overhead but it might give us more
> > chance of fixing all the races?
>
> 4 extra function calls would almost be statistical noise.  I'll code
> it up to do the check every time regardless and add it for each
> syslogd/klogd call.

A timed run of testimage on a Cortex A57x4 system (with KVM enabled)
went from ~1m21s (1m23s, 1m22s,1m20s) to ~1m23s (1m22s, 1m25s, 1m24s).
Without KVM enabled, it went from 20m6s to 20m56s. It's possible with
a larger sample size that they would converge even more, but I think
this is sufficient to show it's not a deal breaker to run it every
time.

Thanks,
Jon


>
> >
> > Cheers,
> >
> > Richard
> >

