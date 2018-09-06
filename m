Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5788579519
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 08:18:16 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id y10-v6so8045211uao.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 01:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kDM6qrNSfWPK/HF04+ECkPr9m6bk1DchsxGQ22mnl4c=;
	b=BvgzY8Kuu2zcgDvtlknQW2SZ5YkUrb3RiPOYhUYT9E7A0h0YXexSjDnj37YZKmzPJK
	+/VYk9fQeIOajSTpJ5dIhQNMxYACSlyQDIl4DOwHk1Lti+dRGEcOXGzo26HFaBiOD9a8
	VN0HwW2j+JwrA7dzjeHy8JAG55b7ImT2yw2X8ApZFLbh1hKN7XKnrB/YLs3iXnkN2nvn
	dKm8ZrZ8yWOit7QBVJoGc6xn1kYItb74PwEzmcgLI68Qyc5SMWu2dJiwpzVG+THxgheK
	ChLeOk3xoCRcfNUE9YIMIoWOhn9tyutzd1nNIfRxQGEHQweCTkoSB2l9LywMUygD7MhL
	ennw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kDM6qrNSfWPK/HF04+ECkPr9m6bk1DchsxGQ22mnl4c=;
	b=WndSfgTCiNyB307j9yBqFknp3XB/cF9JTNpVzKRqY2y1IrFeHgBDDmVTmj49nq9giH
	6Nxh33zBSduzgKaF8XAqAWP75xbxFwSdE9vai4YbVEFQchocZlLuJxY97C029U3payW0
	BPc8giSGjmCZqm7kFxlDXxAXR+zi5TUJKbw1VGptHbyxhZyjQCn1dmj3g6j0432dwnk+
	B41A9QrMrtnHFa0YfJkFOv9IRR0OJQ+DUrRdo420/xH6LFVprrsdZUYCKnWVBIMSh7OR
	3t4D1F+VuEgXEGejmWfN2dDKy6BYVkTNZR2oZyipuxm0SUjLqtJdFNMGIVxGLqV+YuoU
	ftDQ==
X-Gm-Message-State: APzg51AjCcTRghmEk49+qfmnaUfxPzG8G/vli5yq9zz8a2j3tz4xLSmO
	8h1roG+Fcdlxtv5HVsbpFwyMUA43X6Es795ub7U=
X-Google-Smtp-Source: ANB0VdbvA8t+eX/Somuw8eLuXlyr1to22LAIru+YzKRPZECBDGWItSMwrAXsoMH29zGwYOTaspksmWVm8vm1Jztx2Z4=
X-Received: by 2002:a9f:24ae:: with SMTP id 43-v6mr553517uar.181.1536221897162;
	Thu, 06 Sep 2018 01:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAO5Uq5SjWvxmEXisPRmgM92JaGRHgAdd0qoCsTb=P=1PDzh+fg@mail.gmail.com>
	<4b1aadc2-475b-df41-270c-ffbfbcf086c1@siemens.com>
	<e24b16d0-eab7-da62-d4a6-aa517809158b@gmail.com>
In-Reply-To: <e24b16d0-eab7-da62-d4a6-aa517809158b@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 6 Sep 2018 09:18:05 +0100
Message-ID: <CAO5Uq5QY2nb3ygKzPGNrtf+7wpqtpy6jAb=91y6nyf2mT4ryDw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: systemd/busybox fsck fail to run
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
X-List-Received-Date: Thu, 06 Sep 2018 08:18:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 5, 2018 at 9:25 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 9/5/18 5:46 AM, Andrej Valek wrote:
> > Hi Alex,
> >
> > There could be multiple options, how to handle this.
> >
> > My 2cents about this problem:
> >  1. Use update-alternatives to handle this
> >  2. Rework busybox itself to handle this option
> >  3. Just create a patch to ignore this option
> >
>
> I am not sure if systemd-fsck is supposed to work with anything other
> than util-linux and e2progfs tools. So lets add a hard dependency in
> systemd for this.
>

I started prepping this change and then realised why I'm seeing
this... I've been chopping away at image size so am running with
NO_RECOMMENDATIONS in my image recipe and we currently have
util-linux-fsck as a RRECOMMENDS not an RDEPEND, so I end up not
taking it.

But... my feeling is we should probably still make it a hard
dependency as it doesn't seem to me that it meets the definition of
"packages that extends the usability of a package being built".

> > Cheers,
> > Andrej
> >
> > On 09/05/18 10:37, Alex Kiernan wrote:
> >> I've just come across a box with a corrupt filesystem which wasn't
> >> being cleaned (using systemd and busybox):
> >>
> >> Aug 29 16:03:22 localhost systemd-fsck[143]: read_bad_blocks_file: No
> >> such file or directory while trying to open -M
> >> Aug 29 16:03:22 localhost systemd-fsck[143]: Warning: fsck.ext4
> >> /dev/mmcblk0p4 terminated by signal 8
> >> Aug 29 16:03:22 localhost systemd-fsck[143]: fsck failed with exit status 8.
> >> Aug 29 16:03:22 localhost systemd-fsck[143]: Ignoring error.
> >> Aug 29 16:03:22 localhost systemd[1]:
> >> systemd-fsck@dev-mmcblk0p4.service: cgroup is empty
> >> Aug 29 16:03:22 localhost systemd[1]:
> >> systemd-fsck@dev-mmcblk0p4.service: Child 143 belongs to
> >> systemd-fsck@dev-mmcblk0p4.service.
> >> Aug 29 16:03:22 localhost systemd[1]:
> >> systemd-fsck@dev-mmcblk0p4.service: Main process exited, code=exited,
> >> status=0/SUCCESS
> >> Aug 29 16:03:22 localhost systemd[1]:
> >> systemd-fsck@dev-mmcblk0p4.service: Changed start -> exited
> >> Aug 29 16:03:22 localhost systemd[1]:
> >> systemd-fsck@dev-mmcblk0p4.service: Job
> >> systemd-fsck@dev-mmcblk0p4.service/start finished, result=done
> >> Aug 29 16:03:22 localhost systemd[1]: Started File System Check on
> >> /dev/mmcblk0p4.
> >>
> >> It turns out systemd-fsck unconditionally passes `-l` to lock the filesystem:
> >>
> >> https://github.com/systemd/systemd/blame/master/src/fsck/fsck.c#L408
> >>
> >> which busybox fsck doesn't interpret and so passes on to fsck.ext4,
> >> which then interprets it as a badblocks file...
> >>
> >> What's the right answer here? Add a patch to busybox fsck so it just
> >> ignores `-l`, or do we need something more sophisticated?
> >>
> >> Obviously swapping in util-linux-fsck works around the problem.
> >>
>


-- 
Alex Kiernan

