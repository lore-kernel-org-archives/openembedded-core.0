Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id D2A6A6025E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 06:00:26 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id g127so9628206vsd.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2019 23:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5SGdpAE+UCJON9o+YhomVVmuo+cwiIyvO9pMD2KabB4=;
	b=AGXIsd9Grs+HZDcm6FnJin6RL/08T3j03alCjHGWHkFYr1B7wqSfZ8spWIoz4oRKS5
	mOYv2bR3CmxWD5tAqKlfV3ebO2I7kaVgvftW7WCCOjCx9g1VGNM1xiVSNXFoqFntcI5a
	ntPKoVtEbQHkxprSlQbWYetF5qhjUsnuKFE9N8m4BWpKtu36x7SKcADnBEODy/+yHmqg
	Azg8wEEd3pNHDV75J2cgHDhVNu4YL3ST0xQsAxfqHrenH+IGkbEiR8pYpR/VX6b0uplc
	gthvabWDw9oBS7YXwEYiIsMcnNJsL3Dr2z+79nct5ItDRf+HFJmLuH5yYvAXGiPyWc5L
	xdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5SGdpAE+UCJON9o+YhomVVmuo+cwiIyvO9pMD2KabB4=;
	b=EEu/MHXCPnzfHRTpmzJaXHaTWYbC1FcZFTFPIPfyfcbBYp7DHE7XIjeu3icF0VVuq5
	sRtLcHfFwvLlG/Sn36p0Ro8Zw40D0GrjwRZbXtujzKZpeK1gdBCtBeKviWcMhUVfRAes
	svID4wy+Yh9rLlXeSLn3PD/rpQkqClrt44bXQmdP+pkdH1xZ41Yus4mRy9vkAP+RJf84
	hPTsFtRN2rGfKH+l7FjALxERk77TtHdOZGzxZthyVN7Q230QivYZliwgm2Y6i+mN9HJA
	FlJnucXH+ulmGppYAZChi0Y1AyuVau/7aFJ1PfPFd4yzJ2nX57SZKNZS3Mbgurp24Cef
	fzKA==
X-Gm-Message-State: APjAAAUqdgE3EYVafXQciBHOLKWmvFdVaJqfziP5zoeSbwAMCc3byUZx
	cQRzGUDrLQ58XmkOECHim6ZJKEewFHQj6EcAlYU=
X-Google-Smtp-Source: APXvYqwY8zUTDeZEiv0FrX0jUv/Wl0L8hX9stldWIM7bnkitL7lvcVfHGuTarC05yNG/SOg64Y0OYaKgyhfankrue3U=
X-Received: by 2002:a67:af10:: with SMTP id v16mr9791083vsl.149.1557208827511; 
	Mon, 06 May 2019 23:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190503164850.130865-1-alex.kiernan@gmail.com>
	<3ddf9772-185b-2f7a-6a27-c8dffaf8bc62@norrbonn.se>
	<a07a16cb88284954a5d1b3774a6b2fcd@XBOX04.axis.com>
In-Reply-To: <a07a16cb88284954a5d1b3774a6b2fcd@XBOX04.axis.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 7 May 2019 07:00:15 +0100
Message-ID: <CAO5Uq5R2TeT0+vHa9mw8WFRE_uu8ZRH8n33ptnU-nAnrJ86fKA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Default to non-stateless images
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
X-List-Received-Date: Tue, 07 May 2019 06:00:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 6, 2019 at 11:28 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> > core-bounces@lists.openembedded.org> On Behalf Of Jonas Bonn
> > Sent: den 6 maj 2019 06:54
> > To: Alex Kiernan <alex.kiernan@gmail.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [OE-Core][PATCH] systemd: Default to non-
> > stateless images
> >
> > Hi Alex,
> >
> > The below is fine and looks good.  The one thing that bothers me about
> > this is that "stateless" isn't really a property of the "distro",
> > rather
> > it's a property of the image/machine.  I suspect, in the same sense
> > that
> > we have readonly-rootfs, that we should probably have image features
> > "stateless-rootfs" (no /etc, no /var) and "volatile-rootfs" (no /var).
> >
> > Furthermore, if you want to boot with 'ro' on the command-line, I
> > really
> > think you need to build your image with the "readonly-rootfs" feature
> > set.  The default should be writable+persistent /etc as that's the
> > configuration used 99% of the time (currently).  "readonly-rootfs" does
> > a bit more than just creating machine-id but it's all relevant to the
> > 'ro' case where /etc isn't writable.
> >
> > Just for clarification:
> >
> > i)  volatile-rootfs:  means there's no point in prepopulating /var
> > because it's on a tmpfs and needs to be populated at boot time
>
> This doesn't really say anything about the state of the rootfs outside
> of /var, i.e., is it writable or read-only?
>
> > ii)  stateless-rootfs:  means there's no point in prepopulating neither
> > /etc nor /var because they are on a tmpfs and need to be populated at
> > boot time
>
> Same here.
>
> > iii)  readonly-rootfs:  means that /etc is really not writable so it's
> > important that: the systemd first-boot stuff needs to be done at build
> > time:  machine-id, unit files set up, all tmpfiles.d snippets that
> > touch /etc and /var need to be done in advance.
> >
> > /Jonas
>
> Maybe we need some more generic way of describing the intended
> structure of the image? E.g., what are the expected behavior of
> /etc, /var and the rest of the rootfs? For each they can typically
> be "read-only", "persistent" (writable and survives reboots) or
> "volatile" (writable, but doesn't survive a reboot).
>

That feels like a useful direction...

Certainly there's constraints in a systemd world as to what's
allowable (which is basically the three models: stateful, volatile and
stateless) - violate those and you end up with all kinds of things you
didn't expect happening (like a new journal being created everytime
you reboot with a new machine id until you run out of disk...)


--
Alex Kiernan

