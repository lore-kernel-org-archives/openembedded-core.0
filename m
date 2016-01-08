Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 86B1C6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 18:00:03 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id q21so293660905iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 10:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Zvsdnd16z6FlunND4/6bPfEHZTggNN02PNddBWSmf+M=;
	b=oFNqk4We/2+Naj/FEDVb2lm5TU5Ot5orXRlYnkEsMERRklD3IwAoyctfhfy/mpHFRi
	3FIbKmdQ1CfiYKX3X/x0pt06Tlnp0+h5vAoU4UQ4E25YMo6sP8FInE8beDWdDGD26dMc
	zUkRtiNSjG9zdIqckKHhk3pY5FSBE09ta2EeA4u/U15unNJQlZ2igDVMjsD/VtylkOMC
	5fPhC+USMBBvcZZh4aLjMo4VfQ5i9MPeFY17h1Gj6sfNNzaYaXxpidcMn/u9sjkzgvW6
	rn5igO+qPe7hJpXLI6rGkMd+VvtW6fY4xqV9fSEddBEyCFILCh7fmSfw5gIp7uGR840p
	/J3g==
X-Received: by 10.107.165.14 with SMTP id o14mr14516326ioe.49.1452276004743;
	Fri, 08 Jan 2016 10:00:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 8 Jan 2016 09:59:35 -0800 (PST)
In-Reply-To: <CAJTo0Laga86qGDjuxoApENiqRS_j0-8cPLNfhs5J=QSdTZWOyg@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<CAJTo0Laga86qGDjuxoApENiqRS_j0-8cPLNfhs5J=QSdTZWOyg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Jan 2016 09:59:35 -0800
Message-ID: <CAMKF1srj+K5DriCcDDRC20kL5OG4BciteJ7MaRJh4rL8=xsyzw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Fri, 08 Jan 2016 18:00:04 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 8, 2016 at 6:56 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 January 2016 at 10:19, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> This set of fixes let core-image-full-cmdline build with musl along with
>> core-image-sato
>> and core-image-weston
>
>
> The postinst intercepts that are ran at rootfs time using user-mode qemu
> don't work with musl:
>
> NOTE: Running intercept scripts:
> NOTE: > Executing update_font_cache intercept ...
> /lib/ld-musl-i386.so.1: No such file or directory
> /data/poky-master/tmp/work/qemux86-poky-linux-musl/core-image-sato/1.0-r0/rootfs/usr/bin/fc-cache:
> Invalid ELF image for this architecture
> WARNING: The postinstall intercept hook 'update_font_cache' failed (exit
> code: 255)! See log for details!
> WARNING: The postinstalls for the following packages will be postponed for
> first boot: liberation-fonts
> NOTE: > Executing update_icon_cache intercept ...
> NOTE: > Executing update_pixbuf_cache intercept ...
> /lib/ld-musl-i386.so.1: No such file or directory
> /data/poky-master/tmp/work/qemux86-poky-linux-musl/core-image-sato/1.0-r0/rootfs/usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders:
> Invalid ELF image for this architecture

this is something new, havent seen it yet. will try to reproduce it here

>
> Ross

