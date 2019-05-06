Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 567BC7C79F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 13:09:30 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id g127so8075903vsd.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2019 06:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fE32cCizL6gvao/DML9FcV7o3i4K04iDg+iuV9vi6VM=;
	b=YEv+PyTGSI3H4t1xHR6fyCVfapERFpcKejovnv/QU1j63PXyLgaG7tHiJ+9WCZgTzX
	qJ3F7b3k5hom4S4z4QHUUqB7i0T8zyIhULKvrXM3gSoiqNSJ8+MwlEjpDwhfAN2ugUUW
	ymfffxaMuc7DzJAjOxEd+eMriETH5SNGLL1ZBG1nmm45jdO9rWrX2RVcQ2Oplxq5xYQl
	N/7KGxZkCCjefTlGvH76gEPLnL6DXV6xoqM3ePRqYyvpTRxG5M+OnKmkwhSIsOPOWvDs
	c76P4POcW9XndB0TjksSwk7nPhMlZDxDHlYQZun3TVwhAyrXg5D35X4DplJJeMsqxPpu
	He0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fE32cCizL6gvao/DML9FcV7o3i4K04iDg+iuV9vi6VM=;
	b=OxUhpDbbCeRsdOrJNBLv49tYICuZrS2SCaNHsMn1ors4bEZ3ax5cOGzBrBJXNKRF5N
	GPdMw0FNElWL8xno0LzOXR/HjKxDzfP283OzK3SlZVpxDY8tGgsbXnTRFm2TJenrerkn
	xALQ1JSgVmPfL4uyUFVvReHfjVMU7Ijt6/kXpgBuzEVzHhgMwG/QLgZaAwJ31x8QNy46
	/BIELijhrbR1RfPANcIEdO3VHzKS4SNSI5yveqSQu55WFLOo/U1L4IBlWTNeWWk/JqdK
	ZzHqV35WuphUqDRl6UyBVxRB8dLjNpAKBiZHUyivT2lzzG/m/R+I6kgUJ0HRhHmOPJKd
	pk5g==
X-Gm-Message-State: APjAAAV1GMmkhalF7TksTgeNzlCuESzc7XyggnCmqNYit8nhaD9WCXMj
	gmcQTztgXIFPPXCGScL1UJlHZ73KFcHnTLHMAgp0Ww==
X-Google-Smtp-Source: APXvYqwpT7Degao/X6/y3DvBmDCJ53+2FLplu5ZFHNi9UMbR9UbHZ4djwuNBoLmqjqRNPkPBNivwNn6uuXfIrE84kxU=
X-Received: by 2002:a67:ca8f:: with SMTP id a15mr10017253vsl.22.1557148171023; 
	Mon, 06 May 2019 06:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190503164850.130865-1-alex.kiernan@gmail.com>
	<3ddf9772-185b-2f7a-6a27-c8dffaf8bc62@norrbonn.se>
	<CAO5Uq5QL1i3gBmprySJBHBRQRiRVjWbKL11+-vn7qsmLqRD9Mw@mail.gmail.com>
	<db105b21-d7b8-9b51-e026-48199339e500@norrbonn.se>
In-Reply-To: <db105b21-d7b8-9b51-e026-48199339e500@norrbonn.se>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 6 May 2019 14:09:19 +0100
Message-ID: <CAO5Uq5Sh-un+M6y4DYAaLuUh_rN2JosRhmi9iBtrDokummmb_g@mail.gmail.com>
To: Jonas Bonn <jonas@norrbonn.se>
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 06 May 2019 13:09:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 6, 2019 at 12:18 PM Jonas Bonn <jonas@norrbonn.se> wrote:
>
> Hi Alex,
>
> On 06/05/2019 11:36, Alex Kiernan wrote:
> > On Mon, May 6, 2019 at 5:54 AM Jonas Bonn <jonas@norrbonn.se> wrote:
> >>
> >> Hi Alex,
> >>
> >> The below is fine and looks good.  The one thing that bothers me about
> >> this is that "stateless" isn't really a property of the "distro", rather
> >> it's a property of the image/machine.
> >
> > I agree it should be part of image, I'll respin it.
> >
> >>   I suspect, in the same sense that
> >> we have readonly-rootfs, that we should probably have image features
> >> "stateless-rootfs" (no /etc, no /var) and "volatile-rootfs" (no /var).
> >>
> >
> > That makes sense to me
> >
> >> Furthermore, if you want to boot with 'ro' on the command-line, I really
> >> think you need to build your image with the "readonly-rootfs" feature
> >> set.  The default should be writable+persistent /etc as that's the
> >> configuration used 99% of the time (currently).  "readonly-rootfs" does
> >> a bit more than just creating machine-id but it's all relevant to the
> >> 'ro' case where /etc isn't writable.
> >>
> >
> > I think there's (at least) two use cases for ro boot:
> >
> > - systems which boot ro and stay that way
> > - systems which transition to rw during systemd-remount-fs
> >
> > I'm in the second case as I have no initramfs and need the filesystem
> > readonly until it's fscked/remounted rw.
>
> I'd argue that you are abusing systemd for this because systemd
> explicity requires /etc to be writable.  The fact that it works on a
> read-only /etc is both incidental and fragile.
>

Not sure... systemd is explicit in its machinery for some parts of
this ro->rw transition (e.g. systemd-machine-id-commit.service),
though it's admittedly silent on what the state of the rest of /etc
is.

> That said, I understand why you want to do this.  Have you considered
> putting the fsck in a "systemd generator" that doesn't return until fsck
> finishes?  Generators are kind of like units that run before systemd
> starts... or, at least, they can be (ab)used in this way.  Systemd won't
> start until all the generators are finished (the idea being that the
> generators may be responsible for creating units dynamically).
>

If systemd comes along and breaks it yes... or I'll teach
ostree-prepare-root how to do it, but right now the sequencing is all
there in systemd.


--
Alex Kiernan

