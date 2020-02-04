Return-Path: <marek.belisko@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 92AD060F3F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 11:42:57 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id p23so19488386edr.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 03:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KbfL034VQkbHAWgjItwwq3ATA6aLFO+/v0sswBUpbMY=;
	b=u7FrB5ji4PewY/l9ItSZad96DtfXc6CFwLOFmLxEgIQFJ/59pvuRCA4om3HVbWvauZ
	0Z5VFiiyMHVrosXB9LX6NXtUTXUBPJtRCgxBgVaJhHA80Cz/NuvbbziXIVXIi9YcE1VX
	MKR4HAV9HEbbU8/Xsny/MRj7ykynhtLKB/D0+U2an/Wlp4mcvJ+3kXwKV4gCpQYvCXBv
	1TBjRs+Y1a7fFjXRI/nuhntg0yLJG/sMCW47FMsgvxOWlgHhII3j9rUKNICT9K5gcDgp
	QlK6wn4s87kwoL6oPrlja/t5B2qpzfSa/eXXP3c4MU81F/d+EBn5fg34KeRuLF3XzFgu
	ebnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KbfL034VQkbHAWgjItwwq3ATA6aLFO+/v0sswBUpbMY=;
	b=Gm3vdRormGnoCqGMrevN8JnlLPkGZdtE+sBb09z1DSHoICY5wvulGIqun6O8a/SyT2
	Dntq6SOOQn98i6dBtVeGOQaxClRM3Xew5RWAProxa5xrXc3n0kCiHXfcYUH8Vfanr83K
	w6i0oEokYgXIX8U0LzIkm+ZzNyG5ERX6KUH0atPZyWN9q9PXp8Hw9RLIYIymaUytIBkb
	JJi/HSKJb5QddUeBQcopQR+OKCKoYep07sTlc+c4t1aJVx1pR/u+5hIMyyx+cajHZNiW
	NTmf4AE7ne+3gOGoOucw0c9nf9JAd2JRf6DPVirj5kVWzO5SuRbH+W0DxcP2ChMjjuTd
	occw==
X-Gm-Message-State: APjAAAVfkNatQ44BP1C2/vB0ZnQIgopL2qRG8WQ1eRGWzTQoVEf05aAl
	Dl2/cN5+JfmOgqW5C479J4ih0yOGwKo2jrbAkM4=
X-Google-Smtp-Source: APXvYqye6FNP6+KzVlmIOQmY1RBRDH5SIE/umdWQvGjLL4GDc8O2Fo4fWkfrkCKFBqswuVDQqjv5Jl1aP29xJ35TAek=
X-Received: by 2002:aa7:d9c2:: with SMTP id v2mr16783012eds.88.1580816578225; 
	Tue, 04 Feb 2020 03:42:58 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWQVh1JoDSL7f2yXbpWBkGZkwDU=dqPxRF8Ojq_YnRoOfw@mail.gmail.com>
	<CAAfyv36q3v0jLJU7yi-9Jjnx_hfNkH-+z9X+B9ebN87rYcqEzA@mail.gmail.com>
	<CAA=hcWR6iDJ-fZrVtfiuQsM1U5q9VCW4b62qj-AJoRfp2Qo92Q@mail.gmail.com>
In-Reply-To: <CAA=hcWR6iDJ-fZrVtfiuQsM1U5q9VCW4b62qj-AJoRfp2Qo92Q@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 4 Feb 2020 12:42:47 +0100
Message-ID: <CAAfyv37D_x+vpAydvVRw3i7ZA5kUr6AE4SYRcgCP6Smhde9G7g@mail.gmail.com>
To: JH <jupiter.hce@gmail.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Which package for nandbiterrs?
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
X-List-Received-Date: Tue, 04 Feb 2020 11:42:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 4, 2020 at 12:22 PM JH <jupiter.hce@gmail.com> wrote:
>
> On 2/4/20, Belisko Marek <marek.belisko@gmail.com> wrote:
> > On Tue, Feb 4, 2020 at 12:09 PM JH <jupiter.hce@gmail.com> wrote:
> >>
> >> Hi,
> >>
> >> I built the image in thud to include following MTD receipts:
> >>
> >> mtd-utils
> >> mtd-utils-ubifs
> >> mtd-utils-tests
> >>
> >> But the nandbiterrs is still missing, which package for nandbiterrs?
> > Are you referring to this one:
> > https://elixir.bootlin.com/linux/latest/source/drivers/mtd/tests/nandbiterrs.c
> > Then it's in kernel (not sure if tests are build though).
>
> I think so, I have enabled CONFIG_MTD_TESTS=y, it still does not have
> nandbiterrs. I built it with kernel 4.19.75, did you mean the that
> build could not include that test file?
Well did you check build directory if it was really build (check
.config)? Or better try to build as module and install kernel-modules
and then you can modprobe it.
>
> Thanks marek,
>
> - jh

BR,

marek

