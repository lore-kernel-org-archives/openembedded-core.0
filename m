Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6796665CF3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 15:18:59 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z39so2682680qtz.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 07:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9YiUI2Wz+1hms0l4NsyYewL+hpHAYoBsggrKp2U9L7A=;
	b=oLbudxHmhYX7SL53m09FjAkN+YB6IclzheBm+4z5Ucc14bJYz5qT36JHN+xdg0w+DT
	k/ov1mh8VQge6ZyiAoty+KAq30c39rfbz+hP5B67ZfwNWLovscghHjVttxgyhWbdAXBZ
	KaGa73IzuDAqszL9E8EKoDK3s6ZoaLdTwrLP7tskQhF/xO1Z5MFxF1YNRtOwaFKvd3rJ
	83UiEsEvnOCqXB7Ilh/a6GvG8nQMmIFCgorHkvuoOWIKgfbGJ5kqi9AmSYCUTAepWBcI
	YhLbPbChpfps02i8YoSfYeHCmJRBTARUT6+BXSthNqD+6vsRi2BFTbi2yJVyGpPbFcKo
	yFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9YiUI2Wz+1hms0l4NsyYewL+hpHAYoBsggrKp2U9L7A=;
	b=UKPdHt+R2eDBooB7zku9dRycbZLniCWlJMfjlTtUkNIh2o9elIWpGwIgNjibAHMWWN
	GedVk9QxSb0ezZI/Tb5ptP3FTBpbsjAEU2HpRuCLtgdeC239PzsMp9HkPCfYcAzyU091
	yK2l6+7evv+i/0HV4owqpTK4+qT3hhfu0vdrIr7N8013H5t3vG8SFFJWDp7dJzneFipY
	eh4RCdCrjC3YEuyN5QYwSiQcQcKcqvWugNgmBhwDqmZDOPuq0nZ6jxbD66x7VyHx5MTi
	dobybzT1winVyoYvCdPa7loMoSDF3KekjWFncZew+cNMazerY52mKHkj9WFJPlv2YUo1
	HhUA==
X-Gm-Message-State: AHQUAubwrVPag59IK1rLqFmkpNZi1uPo3qrmPrOV1FIDn9zneXpyohhK
	/hjJ9RWI+iTO+ThEqsTVz6GMfuInJC804B8eNbM=
X-Google-Smtp-Source: AHgI3IY744jJEc+CpB9cAENcnUHiqivracoq2Siq9HfheaYT1SGl+rM9y0UWPf4727I0tkHuknO3Hyk7I7z+oANqJ/c=
X-Received: by 2002:ac8:2c51:: with SMTP id e17mr4414360qta.254.1549898339973; 
	Mon, 11 Feb 2019 07:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20181207120605.11344-1-richard.purdie@linuxfoundation.org>
	<20181207120605.11344-2-richard.purdie@linuxfoundation.org>
	<fae0fb29acedc0c26cf9d5860e053d1427316cb8.camel@linuxfoundation.org>
	<857809ce-49de-16c2-f26d-805acc3601c2@siemens.com>
	<31abffa69bca5ee313a7d6c30dd7fc06011a14e5.camel@linuxfoundation.org>
	<8ac88775-35f9-e3f6-a0c6-f218aa697e70@siemens.com>
	<81618ab958486def551d22764d960944fb09b73d.camel@linuxfoundation.org>
	<b269e78b-ebc9-751a-1253-dacf881f0a36@electromag.com.au>
	<CAMKF1srR3zd+-wC3npBO+ULJxjEzYRMVejw+vNHcQ8p=n9KGRQ@mail.gmail.com>
	<8ecd7e5d936576e19915df658461bd416fef4160.camel@linuxfoundation.org>
In-Reply-To: <8ecd7e5d936576e19915df658461bd416fef4160.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Feb 2019 07:18:33 -0800
Message-ID: <CAMKF1spvfVLejOXsA4binoUaPNxW56=ke7TTZS6C_jDLLE8E3A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] nativesdk-*-provides-dummy: Fixes to allow correct operation with opkg
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
X-List-Received-Date: Mon, 11 Feb 2019 15:18:59 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard

my case is with master infact master-next

On Mon, Feb 11, 2019 at 6:45 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2019-02-11 at 06:35 -0800, Khem Raj wrote:
> > On Wed, Feb 6, 2019 at 6:39 PM Phil Reid <preid@electromag.com.au>
> > wrote:
> > > On 3/01/2019 9:59 pm, Richard Purdie wrote:
> > > > On Mon, 2018-12-31 at 20:56 +0100, Andrej Valek wrote:
> > > > > Your previous solution is working for me, so I was not working
> > > > > on
> > > > > fixing
> > > > > this. I thought, that You will just add missing packages, and
> > > > > that
> > > > > is.
> > > > > I don't have setup for failing machine.
> > > > >
> > > > > Is there any simple way to get all missing perl packages?
> > > >
> > > > I reworked the patch a bit, tested and just merged a working
> > > > version of
> > > > it:
> > > >
> > > > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=d4e27863f3874fb7dc543eed8dcf6a8c4d146fb5
> > > >
> > > > Cheers,
> > > >
> > > > Richard
> > > >
> > >
> > > This patch seems to trigger the following new warning for me during
> > > populate_sdk
> > >
> > > Collected errors:
> > >   * Solver encountered 1 problem(s):
> > >   * Problem 1/1:
> > >   *   - package busybox-dev-1.29.2-r0.4.cortexa9t2hf-neon requires
> > > busybox = 1.29.2-r0.4, but none of the providers can be installed
> > >   *
> > >   * Solution 1:
> > >   *   - allow deinstallation of target-sdk-provides-dummy-1.0-
> > > r0.9.sdk-provides-dummy-target
> > >
> > >   *   - do not ask to install a package providing target-sdk-
> > > provides-dummy-dev
> > >
> > >   * Solution 2:
> > >   *   - do not ask to install a package providing busybox-dev
> > >
> > >
> > > Not sure what is request busybox-dev to be istalled in the sdk.
> > > Any thoughts?
> > >
> >
> > Richard
> >
> > I am seeing same failure as well. I solved it by adding
> >
> > RDEPENDS_${PN}-dev = "" in busybox recipe.
> >
> > I am not sure if thats right solution, busybox-dev seems to be empty
> > package.
>
> Its not. The real question is why busybox is being installed into the
> SDK (which in turn pulls in busybox-dev). I don't think it is being
> pulled in on our test images so its probably both your local
> configurations that trigger something we don't see on the autobuilder.
> Perhaps something is missing from target-sdk-provides-dummy.bb?
>
> I'm also guessing this is thud so its possible we're missing a backport
> of a related patch...
>
> Cheers,
>
> Richard
>

