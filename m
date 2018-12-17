Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id D055279FD0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 14:37:58 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id l10so9595080lfh.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 06:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9jYOTmm/S6Zi+G0LFxUdJIAqeQ9D+xF+C3S2ofeO8Ws=;
	b=R9mafEAqQ5iLE+1IO5DWyXsMkc/Nn+zo9YusfId6PtxoEuMvruYlVnjpIx2U+/9OPt
	pQV7h9RBMz0u/nzw93XzFa0JGjcue4ghqoKE9fCST9kcl8ztMCth5xtmfKxN+NrTk12X
	pMqjkMgrfEk3aXQajnvojt6wskxy+8ombpM9niUqR7nMBNGESkRLxyECh3DZqzRKR7oo
	lQ29nmUDkUfDJqUVUN56/u9xQwOI9s3mhii33yeJ3JhJOZzsl52KnoKCWmOwCF5uzrI8
	UuaMEznDfBIbSP7fL2OUqa6fnGyiseP/AO1z+bnvhJolYYDtj+p4FfjKtxDORd5zMJaZ
	Wccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9jYOTmm/S6Zi+G0LFxUdJIAqeQ9D+xF+C3S2ofeO8Ws=;
	b=RyvFy/ugpTienTfGam5CQTrzi86AAuSXyor6nFNdssZC6L2osDca244Mn8z0xAiaeS
	h9k/L1j2/3ISR5ujirutu8oD1feTEEPboVPfJQiNGeIeD1zvNNtXlIwzi26DEP8ctUka
	LN8i/jiAeMJda+kHFBRzH01Qpq8MnP1M0ja9V1VmMeDDM9okmui8d50/3RVmuMSlOY2V
	xDSMGnGbxm4a7rsej28f6axx3qxS9EKWvrhDULvFo8tkJ2QslzKXZDH+8weNkC9Qf7SI
	6fjw5ieVjfV9dAVZO7TfEVmQsC14QGC0JBGCbs8eqUW0dbk4NF25twA7kaLA0CGd03Wo
	B+pw==
X-Gm-Message-State: AA+aEWZ2g0sQbcXH/M0F9Xi1vtOHEXjblQDZLDFolJDJlxFToKv26eSH
	JwCBqsZgNBOVaXA1F0BHB4a+8jgIpczuamRXAiA=
X-Google-Smtp-Source: AFSGD/U1vGBwuHZ3bEJ+Bi1I7Ysnhf02/VXHEFQdVNbkqeBi5J3yQb8FyP6NHkX8f9VR+Gn1RvF23ybeukhA8rqm20Y=
X-Received: by 2002:a19:5059:: with SMTP id z25mr7336403lfj.120.1545057479150; 
	Mon, 17 Dec 2018 06:37:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
	<7fc18a5b076eaf0c9e089ece60ed6845f2d36fbc.camel@linuxfoundation.org>
	<CADkTA4P5h=ErgMF4W-oHcdgQ8BYQNK6SgdHgC5wdmY3p=4Zysw@mail.gmail.com>
	<e0db46c5e24ebf77fc634c515ac3e2025e11fd55.camel@linuxfoundation.org>
In-Reply-To: <e0db46c5e24ebf77fc634c515ac3e2025e11fd55.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Dec 2018 09:37:47 -0500
Message-ID: <CADkTA4O7u=owiR5B8jCCnAO1dpqpoLOi4RVcve5FFRMLQDPEyw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/17] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 17 Dec 2018 14:37:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 17, 2018 at 8:46 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2018-12-17 at 08:37 -0500, Bruce Ashfield wrote:
> > On Mon, Dec 17, 2018 at 7:26 AM <richard.purdie@linuxfoundation.org>
> > wrote:
> > > Hi Bruce,
> > >
> > > On Sun, 2018-12-16 at 22:38 -0500, Bruce Ashfield wrote:
> > > > Here is the latest linux-yocto consolidated pull request. Some of
> > > > these commits are re-sends of changes that didn't make the
> > > > release,
> > > > and others are new.
> > > >
> > > > Most are routine -stable bumps, configuration cleanups, etc, and
> > > > shouldn't cause any issues.
> > > >
> > > > The more interesting part of this queue is the introduction of
> > > > 4.19
> > > > reference kernels to replace 4.14 as the LTS version in master.
> > > > I've
> > > > built and booted it on qemu*, so it is sane from that point of
> > > > view.
> > > >
> > > > I'm trying to separate out the kernel bumps into distict pull
> > > > requests so I can deal with one set of issues at a time:
> > > >
> > > >  - I'm not removing 4.18 yet, since it will be replaced by 4.20+
> > > > as
> > > > the "latest" kernel in the next release. Plus our h/w reference
> > > > BSPs
> > > > need to be updated before I can drop it.
> > > >
> > > >  - I'm not bumping libc-headers in this pull, I'll do that in my
> > > > next
> > > > queue, and we'll jump to 4.20 for the libc-headers at that time.
> > > > There will be one more bump to match the 'latest' reference
> > > > kernel
> > > > for the release.
> > > >
> > > > I will also follow up to the appropriate list with a bump to the
> > > > poky-lsb distro
> > > > builds that are using 4.14 as their default kernel version.
> > > >
> > > > I'm not convinced this is issue free (i.e. did I miss some
> > > > reference
> > > > to a 4.14 kernel ??),
> > >
> > > The bbappend in meta-yocto-bsp? ;-)
> > >
> > > (I deleted it)
> >
> > ahaha. Did you want me to add that to my queue (a delete of it),
> > since I'll have
> > a look at the 4.18 version bump and see what happened to qemumips64.
> >
> > Or I can send an incremental 4.18 patch (since I see there's another
> > version
> > bump for it available now), and take care of that issue without
> > resending the
> > queue. Whatever is easiest for you.
>
> At this point an incremental patch is probably easiest since I have the
> other patches in -next, thanks!

will do.

The "good" news, is that qemumips64 also fails the same way with 4.19.
So this isn't something that came in only with the -stable update to
4.18.

I poked on the autobuilder, and it looks like master last built 14
hours ago for qemumips64 (build 101), I couldn't clearly see the
config in that build, but I assume that was 4.18.x

Cheers,

Bruce

>
> Cheers,
>
> Richard
>
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

