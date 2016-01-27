Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 511E77713E;
	Wed, 27 Jan 2016 17:24:04 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id cl12so9338551lbc.1;
	Wed, 27 Jan 2016 09:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HE9oQU8amdGIznoFuWunWUSyLDpM7YshxxRjxS72Hs0=;
	b=jaCCBPVJaRIPZ1bgbf2lwLMhXNTkMK+8LbQMXEFko8BRDnvLaMDYbu2a3zIrlbvMmU
	+wPEgl0qtORtBhLqgpnFOA5zYhvp4LUVpp20Yss9o/Sfq5fKYHlOIqIy4JvB1BvCbxdr
	o58bocYwMgTWZWNr0iyYU39XzheXuEXLvFP54YzAIPwTRfFJfpYJZ9YjOVAUvWoB8P3v
	Zq0vecs5SOiBToWA1gXsSJ8F24KHP/HFFswW2wyA8SEdI7Tu1kGl9Y3C1/as2g7x3DNN
	hyR3fLyG1C65X3qbRvqguAkyapHpKfK0n+Zxq1n+ZxVqRGRe3U+lPL1TdYULbbaznzFV
	NtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=HE9oQU8amdGIznoFuWunWUSyLDpM7YshxxRjxS72Hs0=;
	b=JQsl+lgN8C6xlTHHJcgiXSHe/8D4KmlENDBBqrE9mi7ruafnXidkiQ/zz2Zw9aSfOE
	o6jY2KPhnfM0NHWysW+j1GAK/0DiQLX2gLbpr/5Mky1unDDKWZ7T8If2ah9zMK7JfOaV
	I8F1cgImNbzRyxRlVhsux8Lr8ongQjHGoRoVNoojB+kPEvQorCEPP/XDwNuImnw+l5Uj
	IEPmdXggONkN85mQ3Ub3mHUYg2jNyWScc0YJRoo1XogA2JYhpf4ZTC/kjCtb/NIdCezy
	hyZdumvG0HiW2gMcGM1Kasg9KVsb9n6sqmhYnO51GDwQ+P8srNft4nXnArC1tY1rz1E4
	VGrw==
X-Gm-Message-State: AG10YOQBabr5AAwzZBrKCEdCeBl2AhAyRV/dQgHFxOdMwFObiDHDO4mfLZSOL7YN/1cj24kxjRXaG64IV+39sQ==
MIME-Version: 1.0
X-Received: by 10.112.148.131 with SMTP id ts3mr11331571lbb.102.1453915443554; 
	Wed, 27 Jan 2016 09:24:03 -0800 (PST)
Received: by 10.114.19.35 with HTTP; Wed, 27 Jan 2016 09:24:03 -0800 (PST)
In-Reply-To: <20160127154621.GJ2574@jama>
References: <20160127141013.GE2574@jama>
	<CAJTo0LaD+n3yj+wQit+BQ+7jvsYPc2P8aUyLzC9kNwp8u2uChQ@mail.gmail.com>
	<20160127154621.GJ2574@jama>
Date: Wed, 27 Jan 2016 18:24:03 +0100
Message-ID: <CAAQYJAuNkirG4zRbHMZ1zVug2tUt=4YJs8zEN5Aq+Gj87d2gqA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2016-01-25
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
X-List-Received-Date: Wed, 27 Jan 2016 17:24:04 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 27, 2016 at 4:46 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Jan 27, 2016 at 03:31:53PM +0000, Burton, Ross wrote:
>> On 27 January 2016 at 14:10, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> >     * /openembedded-core/meta/recipes-kernel/cryptodev/
>> > cryptodev-module_1.8.bb, do_make_scripts
>> >     * /openembedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb,
>> > do_make_scripts
>> >
>>
>> I can't replicate these with qemux86-64 and current oe-core master.  Do you
>> have any idea what could be causing this?
>
> linux-yocto is failing for me in various ways for last few months/years,
> it could be related to some conflicts with linux-yocto-tiny-kexecboot
>
> http://errors.yoctoproject.org/Errors/Details/30878/
> http://errors.yoctoproject.org/Errors/Details/30887/

First thing, this recipe has been built for years.

A couple of weeks ago (Failed tasks 2016-01-09) the error was related
to a kernel bug and this should have been fixed in the meantime (
https://lkml.org/lkml/2015/7/12/163 ).

The logs you got seem showing that indeed building the recipe without
having a specific defconfig in the bsp does now lead to a failure
building the cpio.
I say 'seem' because I didn't have yet the time to really check it.

This is a new error and is possibly related to the last INITRAMFS_
blah changes: more are upcoming (see ML).
FWIW there have been some new bugs/changes in oe-core concerning
xz/lzma cpio images in the last days. I'm looking at the commit
history but hey..there are really too many patches flowing around even
if we are in RC phase.

I'll try to fire a build for qemuXXX asap and if I see a quick
solution I'll send it to the ML.

Otherwise I see two possible alternatives:
1) add a defconfig for linux-yocto-tiny-kexecboot for qemu* (Normally
this is done in the BSP layers...)

2) collapse all -kexecboot and -klibc stuff in meta-handheld for I
don't think there are many users apart Zaurus community (this proposal
was already done but someone did reject saying they were using
meta-initramfs)

My 2 cents

Andrea


>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

