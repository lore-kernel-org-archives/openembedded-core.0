Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id F3E717E4B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 18:05:15 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id o2so8510992qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 11:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o49Toy6fG6fPNkGJpuYelQDvIUTMRXsf6uVrO4WhNxU=;
	b=PVgJniUw67jY8xjpuooApDPeg9mrqJWVK8Mb4+BQHLVR43+UzaAbyGLSL6V8CRBCn/
	fZxpDLBlwpPt6ra4XZxDzOBtTHKOYigNeiskDnRZvOs6amFhGRDKDtIVgDWtXfxCzRDm
	FLIGSA47wZWuIjUUxwBJXiuFgyucIfKQoIiZGnQ/WbjHhZd/9yuBNDqlfPhJlQ/NjJ8O
	TbjbsTAlt8k6juRDt7k8epsUlLTW0xcJiJOnseTyPC7v1bH2ENy86dZ32WiV+cA9qf97
	T8vmxGnUwW6n5dHtCOcC0joqCw2GhAkl+q9G4QJDnOun+sn7OxFVRb1iT53rYukm3+mh
	3Hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o49Toy6fG6fPNkGJpuYelQDvIUTMRXsf6uVrO4WhNxU=;
	b=CLfQDRxTlMK9bTL4mpymgZaGIMI63NCnB87GHIBG/NVAWUkA0OfdPTy1MBp8+imSUG
	pOSefiwUehEZj+9iwo+gt7rxIp+e4C4cytAqW5qljncOWk9fxywnWeDsJVN6o30uOati
	sm7BoQCjX+fPAvwVIjPwprghqD3ohfOUx1XWTWb032SfeEuKCqjoAUfYMvqVBVfHTavn
	D1pofO8UFWTuOctADs22RlgqKV0tHmipP5YIQAVwIUcqhj34FlA/X7T+OnLaytXi6mOZ
	CX9QKp6vZd9MnzM8tEwQvB6QagXN0dwSAmzXNGWcUSE5BKjz7w0VD5muelv1ZdIBoe5R
	c3EQ==
X-Gm-Message-State: APjAAAXAPeTUfBwvtW56iCrg2kUbOjutcVkl5Nde9UFW3KKK5f0oYA5P
	qGLbUPbvvZbl6DN2TTVFgP1oTTggKqykm12uKXo=
X-Google-Smtp-Source: APXvYqx9n9DQV32b2xUUh5V2hR7Rr/IxpbO3BPSUakc5DqhSqY1wz6QEqjaL3v6T/n6JaFPkhFebH45MKeBJhp1U26E=
X-Received: by 2002:a37:59c7:: with SMTP id n190mr82108510qkb.24.1558721116754;
	Fri, 24 May 2019 11:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190523103352.GA25084@localhost>
	<CAJTo0LaErQVjmJoAFr3e45fZ75+TiZFi_hDS2f-KUGuLyC3hTA@mail.gmail.com>
	<45b3b2b0-02c0-1073-df0b-2ab03df1bb29@windriver.com>
	<f9b4e583-3e93-6e6e-ebaf-891093a135b3@gmail.com>
	<20190524101211.GA25912@localhost>
	<f10fea91-06a4-529a-1b42-0c12dc46f54c@gmail.com>
	<20190524172737.GA6813@localhost>
	<CAMKF1sp8H7pOMvHLw+xJhOEE8KyPASmSrQJYxib-ugqrP-OS0Q@mail.gmail.com>
	<20190524175859.GB6813@localhost>
In-Reply-To: <20190524175859.GB6813@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 May 2019 11:04:50 -0700
Message-ID: <CAMKF1sr-JCp6HM1BwYE5T-hgK_2T2j7rfNiRZcD0r_AuC2F7LA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should systemd be marked as incompatible with musl?
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
X-List-Received-Date: Fri, 24 May 2019 18:05:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 24, 2019 at 10:59 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Fri, May 24, 2019 at 10:31:25AM -0700, Khem Raj wrote:
> > On Fri, May 24, 2019 at 10:27 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > On Fri, May 24, 2019 at 09:13:08AM -0700, Khem Raj wrote:
> > > > On 5/24/19 3:12 AM, Adrian Bunk wrote:
> > > > > On Thu, May 23, 2019 at 07:16:53PM -0700, Khem Raj wrote:
> > > > > > ...
> > > > > > but I think dropping
> > > > > > systemd support completely from musl is not an option I would like to go
> > > > > > with, there are cases where this makes sense. Especially when you have to
> > > > > > cater to different set of devices from small to big, userspace remaining
> > > > > > same is big advantage atleast in the world I am in.
> > > > > > ...
> > > > >
> > > > > That's a good point - when arguing against systemd as default init system.
> > > > >
> > > > > systemd is bigger than glibc, therefore on very small systems where the
> > > > > size of the C library matters using systemd is usually not an option.
> > > >
> > > > Yes, design-wise I concur, in practice, desktop distros rule the linux world
> > > > and systemd is quite prevalent there,
> > >
> > > Desktop distros don't use musl - it wouldn't make sense.
> >
> > Yes,  what I was saying is that decisions on init systems and like that are
> > influenced by desktops too. Since the apps are being written for across the
> > board portfolio where some platforms are desktop/server driven some are
> > more embedded
>
> The point is that most of the time using musl doesn't make sense.
>
> Definitely not on a desktop, and also not with systemd as init system.
>
> I haven't done exact measurements and it would also depend on the
> architecture, but the only real-world benefit of using musl instead
> of glibc for an OE user is something like "3 MB smaller in an -Os build".
>
> On many of todays embedded systems such a small size difference is
> irrelevant. In these cases the correct solution that stays compatible
> with everything else is to use glibc.

No, there is DRAM use difference too.

>
> And on really tiny systems where every single MB counts,
> all other design choices also have a high emphasis on size.
>
> Using systemd instead of busybox init (or some other small init system)
> would cost you much more space than what the C library choice gave.
>
> And the current sad state of the systemd musl patching that makes it
> compile but creates misbehaving functions and security vulnerabilities
> makes it an even worse idea to use systemd with musl.
>

I think we should put in plan for 2.8 and define the scope, since we
are switching
poky defaults to systemd, this might have testing implications for
musl especially from
CI perpective

> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

