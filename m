Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 06CDF77306
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 22:13:16 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id l126so14118155vkh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 14:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bbBKb9g+FQFfmSvU+Q1+GkzZJ0eO/XSEfKsbsLeMR34=;
	b=dm6z1ZoEn0pXhDNKlhngLD5EqyUjAMUcVlCr0hdsbTgzE2egGqsIsbAn+c9QVLJJKF
	Tkv+/5RYClsIThda9YGC8dCC1djO/OvlVkf5LE7Ayvg0B2AWO7ZSnN/zZmmLQeY0+Plf
	2JHaz3PdMIU1X+tJdX+wwROOvfbfsgC52ZbYd3Prjom009lleZt+8Sn3bV51usHSZj6f
	hy7Z0XYUknzD7gx5oCG19U5F5R90yljIqr7U5odmUrscKoIIgIF6HWJVP2e8WyhZv6+H
	jpyUSgycp7e2VeWR+Z8ekh8PZlLRgGYsOBdsNZ0Rc2SNUoOkrVhJbXyreecNoMrKQ0vA
	LwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bbBKb9g+FQFfmSvU+Q1+GkzZJ0eO/XSEfKsbsLeMR34=;
	b=Q2M9KuuAbEJvkq8qZP8ZmZIC+HK51InERHKQzRzN4kZiSfA16zMbTi+vz38SJLvibL
	6XZfqAHSVztrNUcMujpEBZGHT3DRmLV/NTeeXL9qP1cx7qcccrNzr6Zt0mkb1/oG6KWP
	H/M3Q2egIYPHWgpI/tQBQanFxB7o/FFTa90sE6pMyArbI3fFbO477+6ZPPmFgw/51Xjl
	GKqdt8/gfGF7zpgNM9KCHUo4cMr53AdNpj59lgmRWEx5MZFo+I2gN2SwSsuELd2QV1HA
	X0Rl1RXjttYWOv/6hA4IVmDEPuiwC9AxsHSCMFSOWCqwWeiszWFWDb9kUdO20T2GHdL7
	f7GQ==
X-Gm-Message-State: AIkVDXIgg2/LZIvZjMsHtxTmSahlY3gDQIJgsyCU7mJE0qVRlOqYv/P7gix3Rfed9ALagpZsUJOWwzR6x+cDrA==
X-Received: by 10.31.115.205 with SMTP id o196mr6933128vkc.139.1482185598157; 
	Mon, 19 Dec 2016 14:13:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Mon, 19 Dec 2016 14:12:47 -0800 (PST)
In-Reply-To: <CAHUNapSAEd4zuvQCna+QOMxaGDFck5OQbjvsVe6hr9voN7o1=w@mail.gmail.com>
References: <1481599839-114211-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20161219152324.GA1056@openSUSE-i7.site>
	<CAJTo0LYV2qMTBVpm8ASDb7BdwwezWfysAn6fJbM7Xwh6FXCcyg@mail.gmail.com>
	<20161219214258.GA16333@openSUSE-i7.site>
	<CAJTo0La1zRwQspKAgPvRxaTryEZSjSSwXf+O0XLadAe5p0VnDA@mail.gmail.com>
	<CAJTo0LYuH==F4jbo3chSbaJHkCu8VWmOS+PxT3A6qwTzJoxwXA@mail.gmail.com>
	<CAHUNapSAEd4zuvQCna+QOMxaGDFck5OQbjvsVe6hr9voN7o1=w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Dec 2016 14:12:47 -0800
Message-ID: <CAMKF1sq7fePZCEaZdcN1P_VmZ3Sb8UNmAcCyUDALaRy0p7yfeg@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: 2.28.1 -> 2.29
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
X-List-Received-Date: Mon, 19 Dec 2016 22:13:17 -0000
Content-Type: text/plain; charset=UTF-8

its detecting ncurses

checking ncursesw... (v6) yes
checking ncursesw/ncurses.h usability... yes
checking ncursesw/ncurses.h presence... yes
checking for ncursesw/ncurses.h... yes
checking for ncurses.h... (cached) yes
checking for use_default_colors in -lncursesw... yes
checking for resizeterm in -lncursesw... yes

but then not linking may be ?
Ross, can you check if its same for you.

On Mon, Dec 19, 2016 at 2:01 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Mon, Dec 19, 2016 at 4:53 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> Definitely works here:
>
> :-(
>
>>> Can you share the do_configure log?
>
> sure, attached
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

