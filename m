Return-Path: <asselsm@gmail.com>
Received: from mail-yb0-f177.google.com (mail-yb0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id D0294782F6;
	Mon, 18 Dec 2017 20:53:17 +0000 (UTC)
Received: by mail-yb0-f177.google.com with SMTP id 5so12082089ybp.4;
	Mon, 18 Dec 2017 12:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h05KZZydWJE7Hzu+JicHRtRHYaxaizZMmWFHroFvV24=;
	b=IfuZNtaQ3k6oMcMwQVoG5UqDwAMZk5XekdsiYJDwxWXlHh/XZILZUn61/Hjowu7aH+
	U7DZa8ZPWoqIsivD11GWGMeZDYemaBdBYucoAudefmkGrXHL9TK+1QndfxrqYuBCI/Gh
	4jtvHzYY7BLl35cvAy7QQPxJ1ecNJ7wm4A+EKhDIbGrwTLrrolfbVj79H8vs4itaJB1z
	8UA9TZbIl3aSMO/cw73YJNl3cv6RApsJ6FyKBUl1eikAThVU59uqMQqXkFQqR5vZEIm/
	gdLoq2GVTOjlqbgcDtHbUcebNwLCBIsy2CXv7pu+px5GygPfAKFNaekF2VitCYsZYk4F
	Tvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=h05KZZydWJE7Hzu+JicHRtRHYaxaizZMmWFHroFvV24=;
	b=JedI5L0qSJjTu4GFgClksmizK4TBHPb9xR1N+gpDcgXvyy4FFSKgbvYSnJ4L1UXfo6
	djZNmlhmzmsPnKzUyxDW6hqFMn5sNLoLRSXCWsopfDqCHGBCef0HtMU83TLhnuA/a2Oh
	CWINYvYtNYppQfplqZaPHkmcBmTk+3HWTUmx685TXOdmwaeVE4pydHgeQV+mpYP9skoN
	2op+dWORc3d+Gq2ciXep71ZO6pIq01Pa0xmSCe4zlQPFxvQzc3A8mHfbqWFjEISu1aXC
	QWQ/wdVJGMY4BYBbB5ghERyCS4TO4T+wNnr/Q8IBs5dGBKAP4Trst8N+oAgKYEW7AAgK
	mrsQ==
X-Gm-Message-State: AKGB3mIL6iwjRR6p1HMSQIxaftllxXSJkpdSnrN80sR5dCNHlaGNhY2Z
	QjteOCg+cIPuxPhuEPodZygBF6mXc+v2xQ87Yj0z7w==
X-Google-Smtp-Source: ACJfBovoXVHpVKQSLl6mpQmhnJ5P4Yq3qksPbPqUClUnoj1KY9AK5eg5RFQXssu0VMpW+7YhL0ua7hgkygE3L2cmDGs=
X-Received: by 10.37.19.69 with SMTP id 66mr906808ybt.77.1513630398582; Mon,
	18 Dec 2017 12:53:18 -0800 (PST)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.37.189.69 with HTTP; Mon, 18 Dec 2017 12:53:18 -0800 (PST)
In-Reply-To: <CADNbA1psOtOeCcsLaSM4VWJV5PXqe=HmE9BuxcR4UYkJp5Erdw@mail.gmail.com>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
	<CAPuovEKdqQP35XwP3bgBrE4EFbM2LwpHrHzxF3my9qaWfAaCbA@mail.gmail.com>
	<CABcZANku-aE5a69GpJxXmd2F0+uYVhiRZB3Uut7F2RG1e3R9EA@mail.gmail.com>
	<CAPuovEJNf=qefXX6wKJGaH+HkM6aan49AgVQ3TEWVWPSCn3cNw@mail.gmail.com>
	<711527ad-77fa-947f-2186-1d7835e1783e@linux.intel.com>
	<CAPuovE+yd0kA_MmT4GuqXgvNDASsKLszL4uiypKDSa31icwgXg@mail.gmail.com>
	<CADNbA1psOtOeCcsLaSM4VWJV5PXqe=HmE9BuxcR4UYkJp5Erdw@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 18 Dec 2017 15:53:18 -0500
X-Google-Sender-Auth: rgbk5rf2zvpYxiu7Ge5SlfpQYzc
Message-ID: <CAPuovELsa-u4tW6EJx+TahzYktRVDA5k5QduUKgXMVfefeXEUA@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH] python-pyroute2: uprev to v0.4.21 (from 0.3.22)
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
X-List-Received-Date: Mon, 18 Dec 2017 20:53:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 18, 2017 at 3:17 PM, Derek Straka <derek@asterius.io> wrote:
> I have several customers who have optimized for space and would like to see
> the capability maintained unless core removes the ability to split python
> packages out.  They also remove the *.py files in favor of *.pyo files (via
> a custom packaging mechanism).  I have automated tests that go through the
> module importing on each of the meta-python packages to ensure it works on
> minimal python installations.  When other contributors don't do provide
> that functionality, I either catch it when I do package update or when it
> breaks for one of my customers.  I'm fine if you don't want to perform the
> checks yourself and it breaks my use case with missing dependencies, but I
> would prefer that you don't remove the dependencies that are currently in
> place.  Thanks.

I can respect this approach. I will put the RDEPENDS back and send out a V2.

As for the overall approach being applied to all python recipes, my
opinion still stands that this is such a small subset that we are
devoting time better spent elsewhere to service the few.

Mark

>
> -Derek
>
> On Mon, Dec 18, 2017 at 11:56 AM, Mark Asselstine <
> mark.asselstine@windriver.com> wrote:
>
>> On Mon, Dec 18, 2017 at 11:37 AM, Alexander Kanavin
>> <alexander.kanavin@linux.intel.com> wrote:
>> > On 12/18/2017 06:15 PM, Mark Asselstine wrote:
>> >>
>> >> On Mon, Dec 18, 2017 at 10:36 AM, Christopher Larson <kergoth@gmail.com
>> >
>> >> wrote:
>> >>>
>> >>> All our python recipes should be explicitly listing the python module
>> >>> packages they require. No python module recipes should be depending on
>> >>> python-modules or python3-modules, but explicitly what they require.
>> >>
>> >>
>> >> This is a giant PITA for little gain in my opinion. The typical python
>> >> 'vehicles' to define dependencies, things like setup.py, requires.txt,
>> >> requirements.txt..., never bother to list stdlibs. These are standard
>> >> libs that are just expected to be there. If a system is being
>> >> installed with only select python modules it will behave differently
>> >> than python found on any other system violating the rule of least
>> >> surprise. On top of this most of these modules are ~40K in size and
>> >> there are roughly 60 in the stdlib so the size gain in installing a
>> >> few vs. all of them is extremely negligible. All of this seems to add
>> >> way more work and churn that outweighs any real benefit.
>> >
>> >
>> > I tend to agree with this. Add also the situation that the yocto project
>> > needs to upgrade oe-core to python 3.6 as soon as possible, and to 3.7
>> soon
>> > after, no one has enough time to do this rather non-trivial job, and I'm
>> > beginning to wonder if the best way out is to remove the module splitting
>> > altogether, and write a clean, simple and maintainable python3 recipe
>> from
>> > scratch with minimal amount of custom patching and hopefully no
>> write-only
>> > hacks.
>> >
>> > Alex
>>
>> Thanks Alex for the support. To get a better idea as to what the size
>> delta is I took the installed sizes from a rootfs logfile and the
>> total size for all modules (python2.7) is 6.5M python-misc is almost
>> 2M of this and python-codecs contributing over 0.5M. The savings will
>> never be the full 6.5M as there will always be python-lang and some
>> other modules needed. There was a time where 32M restrictions existed
>> are some systems but are we really seeing devices with these
>> restrictions any more? what about exploring not shipping the pyc
>> files? I would much rather see this than imposing so much work and
>> churn for very little gain. Anyways, maybe this isn't the best forum
>> for this and it should be brought up to the architecture group.
>>
>> Mark
>>
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

