Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id CEE5F60FEA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 18:21:04 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id c19so3315212ioo.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 11:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=eImsRnIEfzYBPspiXFheqHw1hChmj1dB10l7gxHTt/Y=;
	b=NJVMqK9oZT6uTQyqdAvT99I+eoixmDQTOKQYs7/xx3t+sQVlGVKLpqJy4UO1QoKxvv
	GQvJUm7G/Egq+y8kl2WdKdtcKDmOsX56ntYttvLuM85jWJ21JXKMTtfto/ZxdOYgc7yn
	lYN1rL4YvkAxQRyI7ul5PbxarY8O/xBoLmL+IuDUow/2JtYi8Sz6XbZYNL7yKtwH8Qwk
	Ezzatk1HkqVzmNgFmmpnC8IxFCAtMB9spW297vgZqaaxKaCGhTTL1eNsvc+1tNe1dJoN
	X3q7pnXAZizaoQ9U7ck1Jrl9vFnYp5lLxnx7JjrWxKmyTFtXGcRVHkBXGo2ylVRRI+iq
	yXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=eImsRnIEfzYBPspiXFheqHw1hChmj1dB10l7gxHTt/Y=;
	b=s82A15yyvuZmiRBU9T8wsgIodf0gczMhMdafHj2mElvZneHUV+gvM5IdbDy06Z2xGs
	p+D6azc19LSlf4eEwhT3Q5ckRhcw84cDOA3NoGTbXdaEn+8MMS/2+L83G5wu2Wa+1Bgk
	hQoO3y4upiCy/Pn13Jnh6pTm+z0JcCmnUoz31BH64EjZF0hiJrjV5iUysbyCM7y/awGs
	Rom9LXgEiAYxLjg54gz5lWApPvpQUHO8dzwCu3aXUX5vr2kLeK2t6JACppj3fMVSvObQ
	efjQB7I4xcsT6DFnGl9zg9JLWGNbM9/7RJ7aXjKWenUEHwvjWF9fBWGcjTayYx+rhuiI
	Gm+w==
X-Gm-Message-State: ANhLgQ3kzPgL0VRDqvpLcgP65n2Mj8Sx9BlcQj+6HWNGNyoK3nssFYF9
	C5a+SuTTalaga8fOBS1qJfYUyBm9an7Z65mosXgZDg==
X-Google-Smtp-Source: ADFU+vsIR4BZ6UtDsoYPggj1ElmnYxIaEEDvw+6Ago6kRtjfK3P61tPszOy7yCc17bCp31gpnF1nttoPKBuSBX4wEag=
X-Received: by 2002:a5e:dd43:: with SMTP id u3mr3814057iop.119.1584642065718; 
	Thu, 19 Mar 2020 11:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200319164403.29605-1-brgl@bgdev.pl>
	<21fcbda1e8b274ba75534159179ca9535c618d68.camel@linuxfoundation.org>
In-Reply-To: <21fcbda1e8b274ba75534159179ca9535c618d68.camel@linuxfoundation.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Mar 2020 19:20:54 +0100
Message-ID: <CAMRc=MeF5beTkadXL6WGJhq-AsXTxu_4WC2c+sFeMqm+EsgaHQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Mar 2020 18:21:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

czw., 19 mar 2020 o 18:13 Richard Purdie
<richard.purdie@linuxfoundation.org> napisa=C5=82(a):
>
> On Thu, 2020-03-19 at 17:44 +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > This is a follow-up to the discussion I started on the OE-core
> > mailing
> > list a couple days ago[1]. These patches propose to split the
> > deployment
> > of image artifacts into two stages where the first one includes all
> > "regular" images and takes place before do_image_complete and the
> > second
> > is mostly aimed at wic right now and happens after do_image_complete.
> >
> > These patches work but I'm sending them as RFC mostly to continue the
> > discussion about possible solutions for the circular dependencies
> > between
> > the rootfs and initramfs.
> >
> > [1]
> > http://lists.openembedded.org/pipermail/openembedded-core/2020-March/29=
4094.html
>
> This works fine until we have some new image type which then has to
> depend on happening after wic. We then add a three stage process and so
> on. Basically this feels like we're hardcoding something for one
> specific use case which will later break and not scale to other
> problems/solutions.
>

I understand you see it as controversial but let me try to convince you:

If we'll really get to a point where we need to create a hierarchy of
multiple levels of image deployment, then maybe we should switch to
deploying each image right after it is created in its dedicated
do_image_<type> task, then we could really fine-tune the inter-task
dependencies. But we're not there yet and IMO currently it would be
overkill. The rule of thumb for me is not to add new interfaces nobody
asks for.

The thing with wic is that it's aggregating other deployed images.
What we're dealing with are *two* categories of image artifacts: let's
call them simple and composed types. Obviously composed types may need
to access the simple types and, due to the use-case I described in my
previous thread, it's useful if we can depend on the tasks for simple
and composed images separately. Maybe if I renamed the tasks:
do_image_deploy_simple and do_image_deploy_composed it would look
better than an ambiguous do_image_deploy_late.

This also makes your argument about adding a third category purely
theoretical: I don't see how we would need another category of images
anytime soon. Even if we added another aggregating type (one could
argue that hddimg qualifies as such) it could, with a 99% chance, run
in parallel to wic and thus qualify as a deploy_late/composed image.

> Sorry, I'm not convinced this is the right way to move forward. I will
> try and have a think about what the right way is but sadly I don't get
> much time to spend on specific problems like this :(
>

Please do - I'm open for other ideas. Just please keep in mind:
there's obviously a problem with the current approach. I described it
in detail and it turned out Quentin had encountered it too and dealt
with it using a nasty workaround (fitImage deployed by the image
recipe and not the kernel). I'd like to fix it upstream and proposed a
solution that is IMO not horrible. I'd appreciate if we could reach a
compromise that wouldn't leave us with downstream hacks.

Please also note that sometimes "gets the job done" really is better
than not solving problems. Just look at initcall levels in the linux
kernel - they are similar to what I proposed here and serve as a
surrogate for real dependencies.

Best regards,
Bartosz Golaszewski

