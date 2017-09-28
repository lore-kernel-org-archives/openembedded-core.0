Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id C7EC060125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 18:01:14 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id v72so1298768ywa.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 11:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=urq0nL3OOAsZoKjfh1d5rizs/plnCIJfbCU3Kkp9qCI=;
	b=Sr5TUT+9RS7DCTedjuCoaopI09qSAmM7ksIwfbWNeM6wXy0r8AEg4S19XAU58+vkzF
	6WlX+Xy7LpAR7XaqmHjEbCl64hn2hW+4kFM+Gzj8NcKlwdrCEZJFEuxQY3WCHJviGzI1
	x4A2ffLZqzD7FOkqp0T64tBnHS1kKNwz0OsDUXYMlw0bOTAmmtDMQ8xFbDmjT1DC/9Gs
	kjZIb63X2UUsl6XedRl2Itw5oBTQ0/ivW9JBCIBj+yUhFOAR4Ic3wdG9Wkjc1v7LBnrY
	6uNhoH/OzWjfs+uJib1Fy7oxf/hMYbx9cC3XQQuIRExvPEai3yQfQy8+fAXRyxrcENXi
	cNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=urq0nL3OOAsZoKjfh1d5rizs/plnCIJfbCU3Kkp9qCI=;
	b=ANrPWJANUEgBwQAZE6n/GtHyyB8oW5Mltsv9VjxCndFyL06vGWezeLU3z3y/IrHOT1
	SMOTj0O7QJo4BtC2hKbWuY0G/xOklgneaXbYe5R25+muF6gXNrg8dhwREUd20Yyx+DMV
	rdE6gn4YtXEe0WuijovuWPtGgARXKBYNphPhHoXE8KKct0NepuFaVPVLp9IvGFHGrCE8
	LL6LdrE8VJRi8b7aYuqNpqfilUTugodYuOI3LKTON43+ddW7uYe5WCNMpRxP2+KmK8+Y
	eSAa+83PtvsNuPpG57PgIahPDr2wgvJkPI33lQTDSBbCgOyTjFBrT2SNMangULT+Xe6w
	Pv6g==
X-Gm-Message-State: AHPjjUhTRKa40SkKuhIlg8AL18ASNgH1xysVZmzOlZ7IW0QorSr9XlOl
	eihBzns1If4pOjl/IadDoB9Js83/
X-Received: by 10.37.219.77 with SMTP id g74mr4633202ybf.494.1506621675620;
	Thu, 28 Sep 2017 11:01:15 -0700 (PDT)
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com.
	[209.85.218.44]) by smtp.gmail.com with ESMTPSA id
	x185sm834657ywa.73.2017.09.28.11.01.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Sep 2017 11:01:14 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f44.google.com with SMTP id f3so887464oia.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 11:01:14 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDxTIkg7vaaLUNRMF6qwW8djubXmZtUodaEI25nTHS/rjBGVmRWuk7gl3ieTZIMsoYJpIXlHbS3yKvRLYqUO/U=
X-Received: by 10.157.8.134 with SMTP id 6mr1448594otf.189.1506621673853; Thu,
	28 Sep 2017 11:01:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Thu, 28 Sep 2017 11:01:13 -0700 (PDT)
In-Reply-To: <20170928175915.GQ3112@bill-the-cat>
References: <1505923407-31734-1-git-send-email-trini@konsulko.com>
	<20170928154707.362zfbhccbydkdox@linux.intel.com>
	<20170928174429.GO3112@bill-the-cat>
	<CAP9ODKrACBBvDGYSMUW1mv=UxMUUOnwK9k5g7d6rEL=Mdm3wuw@mail.gmail.com>
	<20170928174942.GP3112@bill-the-cat>
	<CAP9ODKrN8R_BpNobDUQNw33vEeQVJKF7g9mGK3-m=TUiyRukSQ@mail.gmail.com>
	<20170928175915.GQ3112@bill-the-cat>
Date: Thu, 28 Sep 2017 15:01:13 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoWKvzf9eKAbjPCe4MY5d8f2EsBSjXbA87Ouw46QHP+=w@mail.gmail.com>
Message-ID: <CAP9ODKoWKvzf9eKAbjPCe4MY5d8f2EsBSjXbA87Ouw46QHP+=w@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Generate startup.nsh for EFI cases if none found
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
X-List-Received-Date: Thu, 28 Sep 2017 18:01:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 28, 2017 at 2:59 PM, Tom Rini <trini@konsulko.com> wrote:
> On Thu, Sep 28, 2017 at 02:57:04PM -0300, Otavio Salvador wrote:
>> On Thu, Sep 28, 2017 at 2:49 PM, Tom Rini <trini@konsulko.com> wrote:
>> > On Thu, Sep 28, 2017 at 02:46:23PM -0300, Otavio Salvador wrote:
>> >> Hello Tom,
>> >>
>> >> On Thu, Sep 28, 2017 at 2:44 PM, Tom Rini <trini@konsulko.com> wrote:
>> >> > On Thu, Sep 28, 2017 at 06:47:07PM +0300, Ed Bartosh wrote:
>> >> >> On Wed, Sep 20, 2017 at 12:03:27PM -0400, Tom Rini wrote:
>> >> >> > In the case of non-wic images there is logic today to generate a
>> >> >> > startup.nsh file that will be executed by EFI to run the loader that the
>> >> >> > image contains.  In the WIC case is currently depends on that file being
>> >> >> > generated elsewhere and placed in DEPLOY_DIR_IMAGE and only used if
>> >> >> > present there.
>> >> >>
>> >> >> What's wrong with this approach?
>> >> >
>> >> > No one ever provides a startup.nsh and everyone that wants one creates
>> >> > the same one line trivial example.  The end result is that no WIC images
>> >> > are Just Bootable on UEFI systems unless you first go and spell that out
>> >> > as the desired booting device.  This isn't an awesome workflow which is
>> >> > why the non-WIC cases make the required startup.nsh :)
>> >>
>> >> I think it could be done as we did for u-boot-extlinux support.
>> >
>> > That's complete overkill for a static one line file.
>>
>> No, it is not. It allows for reproducable builds.
>
> Either solution would allow for reproducible builds.  Perhaps it would
> be clearer if the patch just always generated that content instead like
> the systemd and grub2 classes do?

No; if the file is generated by wic it is external of the build and
thus can change without the image change.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

