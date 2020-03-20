Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id E4A386011C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 13:12:03 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id h8so5896863iob.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=N3+JAKWGtC057ZoJPzQZ8SaD/sfGgksEXqFESyYGwLI=;
	b=btEkd3D5YvW4qSV1IMW/YpifSe3FbGM7ZBkIWLwyRpytNkU467lIcHkFsEgyGFDwSK
	5fw8cuYc1MG80yPsyByOkqWVtruBEGMsU++SHGJJeS12RXwh2drOCgffWtg6lwr3otBz
	TMjkSrpjtY9P+BUNRzEh3sohKrWfvmISS83/eYfUVjEtwHTw5bV34Bt7e6I+IVgnpIwR
	neUYGhAAfwJR/5HepsKAKgDza/DRpB+ZLoCc9vhu5+Jjj4+o/M+lRG0stKchTeQmCsPB
	CQuXvz0OedIm1AnIfBvjbqJ53i46NiLxsUXIR8vQjR1o8970d2swKBcK8pmdq/xQ3eM4
	bm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=N3+JAKWGtC057ZoJPzQZ8SaD/sfGgksEXqFESyYGwLI=;
	b=DREkcjYMnlFBS1hq1P9K4tcXFyNMdKxq0MML2M7JsbsQSgJaWgEEzIvrpxOyHX1zwZ
	YvcZC/GcxNEvLThvqclKwOnKz/QB/7nPq4+oae0J1GC73ltmM05xShllRJFniof4GL29
	c5amaA6vyuy8B5ptjbk9b4TD5lzeqtN3sgU/jFGWd8+ftxblfgF6WfhmjAw3qyK26iRH
	9vml+rYDWTC/pdfGK4OEoOoDAWDUulzl45AvwTYtsC+lfYCxODS3fRf1p1UqrIkjyH5+
	CZCDLpLjMEME0t600d4iep9KG3Duceb0owBAZueq2Lyzm7NlFvbdig74FO+KfJdOsRre
	isKA==
X-Gm-Message-State: ANhLgQ0IR9CbWzVqhK3ypBmBN5H70FGyF0fITG92KiW/ve7qGPm5yW12
	rCqIt7gV4O0xhf0EtLiThvvQEUqR+0qRWaRx7nPRrg==
X-Google-Smtp-Source: ADFU+vtGUUDme4TqltKVegTrsOfFiOBH0TRyyuDmayR8mj+/69DZcusaUZIFF1rvhEa4bpq264gUO6Er9FWsepShgIw=
X-Received: by 2002:a5e:8204:: with SMTP id l4mr7378440iom.31.1584709924584;
	Fri, 20 Mar 2020 06:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200319164403.29605-1-brgl@bgdev.pl>
	<21fcbda1e8b274ba75534159179ca9535c618d68.camel@linuxfoundation.org>
	<CAMRc=MeF5beTkadXL6WGJhq-AsXTxu_4WC2c+sFeMqm+EsgaHQ@mail.gmail.com>
	<c574ae14be64e888fd15102e7145c4d4867667ea.camel@linuxfoundation.org>
In-Reply-To: <c574ae14be64e888fd15102e7145c4d4867667ea.camel@linuxfoundation.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 Mar 2020 14:11:53 +0100
Message-ID: <CAMRc=McG_iDEAJEFEK6N4+kJv-Cr3cwf1DuJQqdmZz9pej0b+A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jerome Neanne <jneanne@baylibre.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Subject: Re: [RFC PATCH 0/2] image.bbclass: support two-stage deployment of image artifacts
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
X-List-Received-Date: Fri, 20 Mar 2020 13:12:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pt., 20 mar 2020 o 00:38 Richard Purdie
<richard.purdie@linuxfoundation.org> napisa=C5=82(a):
>
> On Thu, 2020-03-19 at 19:20 +0100, Bartosz Golaszewski wrote:
> > If we'll really get to a point where we need to create a hierarchy of
> > multiple levels of image deployment, then maybe we should switch to
> > deploying each image right after it is created in its dedicated
> > do_image_<type> task, then we could really fine-tune the inter-task
> > dependencies. But we're not there yet and IMO currently it would be
> > overkill. The rule of thumb for me is not to add new interfaces
> > nobody asks for.
>
> Going back in time I'm the person who split the image pieces off from
> do_rootfs and split the different image commands into different tasks.
> I did this for several reasons but one was we were developing new task
> dependency code inside the image construction which was just crazy.
>
> I was wondering about the option of having the image task deploy the
> image earlier. I think that could be made to work. I think conceptually
> it makes more sense architecturally than adding in arbitrary new task
> levels to the existing structure.
>
> > This also makes your argument about adding a third category purely
> > theoretical: I don't see how we would need another category of images
> > anytime soon.
>
> I often think things like that but then new use cases come along...
>
> > Please do - I'm open for other ideas. Just please keep in mind:
> > there's obviously a problem with the current approach. I described it
> > in detail and it turned out Quentin had encountered it too and dealt
> > with it using a nasty workaround (fitImage deployed by the image
> > recipe and not the kernel). I'd like to fix it upstream and proposed
> > a solution that is IMO not horrible. I'd appreciate if we could reach
> > a compromise that wouldn't leave us with downstream hacks.
>
> I do understand there is a problem. We also have problems with people
> not understanding the code as it works today. Your proposal adds
> something else with is hard to explain to users ("Is my image simple or
> composed?") and whilst we can and do add complexity where we need to,
> I'm not yet convinced this change makes enough sense to have it.
>
> Changing the way image deployment works would in many ways be much
> easier for people to understand and makes the system more flexible
> without adding problematic terminology.
>
> > Please also note that sometimes "gets the job done" really is better
> > than not solving problems. Just look at initcall levels in the linux
> > kernel - they are similar to what I proposed here and serve as a
> > surrogate for real dependencies.
>
> We have piles of "get the job done" and also need to sometimes take a
> step back and see if we can do something better. Right now I think your
> proposal makes things worse and will be hard to explain to people. My
> instinct is we can do better here.
>

Fair enough. I don't quite agree and I'd like to hear other voices too
but I also don't want to waste time arguing either.

As I'm afraid that if I don't follow up on this myself, it will simply
be forgotten, I'm offering to spend some time figuring out per-task
deployment.

I started looking into it and figured that ideally we could have each
image task use a separate local-deploy directory and make them all
part of  SSTATETASKS. Unfortunately a lot of places reference the
IMGDEPLOYDIR variable so it probably has to stay in some form. I
couldn't find any info on that - does bitbake offer anything like
"per-task variables"? Variables that expand to different values
depending on the task that calls them? Otherwise we could replace
IMGDEPLOYDIR calls with some helper function that would return a
different value depending on BB_CURRENTTASK?

Any advice on technicalities is welcome.

Bart

