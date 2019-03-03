Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 10B837CCBD
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 22:20:59 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id o17so3478872wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 14:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wm9ZDRRVBHXmQOC4JHqyk5sSWY15yl5gtzaNUIXrl10=;
	b=tBOx121S9+vNW4ajW1WPbj3SBf2epNaxNGXro0+J1xamMxC3YriKqHr69wOi6t865s
	XegWc5yfvs2Ds9fipMWoF3df1jBwPfJkArDs7TRtsvq6ntE8n/+0RcZ2L2Rejq6Ld6lI
	VvZ2xhBDeEHfefcmSK38eLfLTpa6hv7y0SCnNfzAqTN9Bi2EnP/bQIpcYcqVQbaIrzp9
	xZgLyL2iW/iac6/L8oMziSOnZbkngo5qVohDv3KpC8TehU6WFuScCgP5MsqXrQ5qTCsT
	KqzEJ/sa6ZvSOezm1uMTAhU+ySvjZO+LJMqbl9ViaNnzKTuk3UJHcsbmlBty3AQcVHc0
	l8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wm9ZDRRVBHXmQOC4JHqyk5sSWY15yl5gtzaNUIXrl10=;
	b=MXE2mQaTzqQCeWNcMuxayoBpsQs/WkR5HDCGgNOB9ChrTTC55LPHxLtiZ4DgnBSok7
	rtgR+1Eyw6AhhkWU6QETcWuZnHzdQDfYK03Z7iJPzkcsSqZUA8xGoZj9Uvk4i6SVqOQ2
	OtINxRxvfXr40Hgj7yWkpxWKgSKTK623ZuA94BkpB9waz3k8pUPJaS8B9Z8wUoogEV06
	P95LdGTtTRWgEvIOH8GxXYEDU1Txc5/3LHOcwxYyBROi/CrrbrCbSX5nVBixLPrcaoWs
	xKVIFiGhOWJL8lJTtBe8qH4jEjfs2IHTl/6/5CcMDHNbZMHkaRSWP9LcWvq5K7gwWdKC
	6V4w==
X-Gm-Message-State: APjAAAURrJXD7Aty9f2EBjnyG3g7tIvsFCeSv911RmN9iveKqw9JxcKz
	XNxwSHgqJymB66fB9Jl9E2CaRT+TIVdMYKpiBfw=
X-Google-Smtp-Source: APXvYqztQCKOF4H0Heh3D+HN+ZETMjB/OW2zdRY4giKWYu8cslEZlbLaBptBzRk9sqYwpR/9Bv/1ltYDoYYtj6NpP48=
X-Received: by 2002:a5d:620f:: with SMTP id y15mr9972522wru.101.1551651660653; 
	Sun, 03 Mar 2019 14:21:00 -0800 (PST)
MIME-Version: 1.0
References: <20190303204731.GK5026@bill-the-cat>
	<CAJdd5GYLLN4OB+wRsFGN10Cs2ybvKNcM_TP5pMHRdycf0M_Lsg@mail.gmail.com>
	<20190303212515.GL5026@bill-the-cat>
	<CAJdd5GbdpUCenci29Pk16vzhFDR=rMb_sd9CWD15pHreFPQfDw@mail.gmail.com>
In-Reply-To: <CAJdd5GbdpUCenci29Pk16vzhFDR=rMb_sd9CWD15pHreFPQfDw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 3 Mar 2019 16:20:49 -0600
Message-ID: <CAJdd5GaOk=asx=r1yVOEokMbiVPsk_8bdArYq1KzrNR22_LcNQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sstate hash equivalence breaks rm_work
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
X-List-Received-Date: Sun, 03 Mar 2019 22:21:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 3, 2019 at 4:11 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> On Sun, Mar 3, 2019 at 3:25 PM Tom Rini <trini@konsulko.com> wrote:
> >
> > On Sun, Mar 03, 2019 at 03:21:12PM -0600, Joshua Watt wrote:
> > > On Sun, Mar 3, 2019, 2:47 PM Tom Rini <trini@konsulko.com> wrote:
> > >
> > > > Hey all,
> > > >
> > > > As part of the packagegroup-core-base-utils series I noticed that
> > > > with rm_work enabled like I usually have, every build was starting over
> > > > with rebuilding linux-libc-headers and going down from there.  I
> > > > finished bisecting this now and it comes down to:
> > >
> > > Just for reference, are you trying to use hash equivalence? It sounds like
> > > not, but I would like to make sure.
> >
> > I am not.
> >
> > > Also, it there an AB build that uses rm_work that would have seen this?
> >
> > OK, so I see I forgot a step that was clear to me, but, uh, not in the
> > email.  What breaks is for example:
> > bitbake core-image-minimal && bitbake core-image-minimal
> > That second build, rather than see "nothing to do" (or at least, almost
> > nothing to do) says "Oh, I need to build linux-libc-headers from
> > scratch" and possibly other stuff too, but that's the first thing I
> > notice.
>
> Ok. I've started a build to test it. Would you mind opening a Bugzilla
> for it and assigning it to me?
>
> For posterity, the poky commit SHA is adc37721a86c

Hmm, FWIW I just tried this on my setup with rm_work enabled and it
worked as expected (e.g. did not rebuild unnecessarily).... would you
be able to share more of your setup (local.conf, layers.conf,
site.conf)?

>
> >
> > --
> > Tom

