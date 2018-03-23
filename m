Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3107778866
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 16:06:47 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id z7-v6so5703382iti.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 09:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KBSp+4XoH7QfTJdn6dETWZR0FRVOIWLpXi8lGC9ZO1E=;
	b=Kiw4l9k3avH/KaYHTAfFTCeukeLaMcw27hxxZrCJfcJ2cj6QpBAruRgzcjDgMy7HzW
	CW9+NWWPKpfnE+XULjcff0a2awUR3vFlKk8zY3bQZERD6Pqvinjh9OGMLdbFKTl00wqm
	4tepzY8+KiYJegYQlHUc+Nw0mfgRSVj9gTcl6pXj0nFn3KwNZoavOj3vsAylxRTAhGiW
	+XxQUn0iYP8BHzz4qOFTBYQ/2DNrCGY6nRsSTCWbVvNBR9A0uvVAfknSIqeueCmw0dom
	MTe39gI87Rc8GrCb+N1BS5+d14I+T/9fhjXpqgimYCm0oFs/nbd0n0ALL2nvuCNBWJHP
	GzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KBSp+4XoH7QfTJdn6dETWZR0FRVOIWLpXi8lGC9ZO1E=;
	b=qIldhgqaidCIKk2CXbl32NViLMbM0mvYwH4g3v4bT8K1a48xvAKAZKhGsSrelLie6d
	Dp8AmMaqUEVYG0q5kFoTJfbIoQzGslyoConDrU8T7z0zly+N2OVEq9ecFB+R4INGuBIR
	WclzV7v97tvBVZKbA6GzycLysUPi9Ge5wbpW5ZKjBc1wAOa76hsZZvP9aDLv9fdsQFex
	3fiBTW6luv2h+hGVwnfV1qZCKl+Qfx+RkvMAKEu2WVOR6qR8eEd1JC2aLaA5tYx/benZ
	1272umacC6C+CmqMrnBkVlPPrUtz6hWso/9eYys8pFSEKQ9gHbwgZQNvSc7zqmBBNhCT
	8b9Q==
X-Gm-Message-State: AElRT7Fw2lPu/Hl6UyvASwu6bOXmHcKHobPvL7AtHkZ2GO4CrwuVcqeD
	FbtNOzD8yR5HY3hbLwfAucgGQxKwdAqjOeslIws6YA==
X-Google-Smtp-Source: AG47ELu99OMLN/fAxU8180/5lOlSLpHSdKaq6El9CcLZ9hizmAuVkOw45zSV9vPNzZX6L4qkbwF4JFWaVfZfzLTmfck=
X-Received: by 2002:a24:22c2:: with SMTP id
	o185-v6mr14224940ito.60.1521821209096; 
	Fri, 23 Mar 2018 09:06:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Fri, 23 Mar 2018 09:06:28 -0700 (PDT)
In-Reply-To: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Mar 2018 16:06:28 +0000
Message-ID: <CAJTo0LbqnZk6K2AEbRSFREXOLb3jM=mnoDCJhA74mKRyomo_JQ@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Fri, 23 Mar 2018 16:06:48 -0000
Content-Type: text/plain; charset="UTF-8"

Ah, I just read this other message of yours, which includes the fact
that you're on F27.

Yes, something in F27 has just broken pseudo quite dramatically.  No
idea what, so far.

Ross

On 23 March 2018 at 15:33, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Hello,
>
> in some packages (e.g. ncurses or glibc) I get package-qa warnings due
> to host user contamination; e.g.
>
> | WARNING: ncurses-6.0+20170715-r0 do_package_qa: QA Issue: ncurses: /ncurses-terminfo-base/etc/terminfo/a/ansi is owned by uid 505, which is the same as the user running bitbake. This may be due to host contamination
> | ncurses: /ncurses-terminfo-base/etc/terminfo/d/dumb is owned by uid 505, which is the same as the user running bitbake. This may be due to host contamination
> | ...
> | ncurses: /ncurses-terminfo-base/etc/terminfo/x/xterm-256color is owned by uid 505, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
>
>
> This is 100% reproducible by 'bitbake ncurses -c cleansstate && bitbake
> ncurses'.
>
>
> Pseudo log contains
>
> | debug_logfile: fd 2
> | pid 16096 [parent 16095], doing new pid setup and server start
> | Setup complete, sending SIGUSR1 to pid 16095.
> | path mismatch [2 links]: ino 382716451 db '/dev/shm/sem.mp-6eoy3v9n' req '/dev/shm/8JXYzj'.
> | inode mismatch: '..../ncurses/6.0+20170715-r0/image/usr/share/terminfo/a/ansi' ino 39261519 in db, 39262517 in request.
> | symlink mismatch: '..../ncurses/6.0+20170715-r0/image/usr/share/terminfo/a/ansi' [39261519] db mode 0100644, header mode 0120777 (unlinking db)
>
> for all the reported files.and a lot of
>
> | path mismatch [91 links]: ino 1605070 db ...
>
> like messages for unrelated files (e.g  sysroot components).
>
>
> Seen on recent rocko and master (1-2 weeks before).
>
> System is Fedora 27 in a docker container; rootfs is on an overlaysfs,
> recipes on a bind-mounted btrfs fs and build (TMPDIR) happens in an ext4
> fs.  SELinux is active.
>
>
>
> Is this issue known resp. does a solution exist?
>
>
>
> Enrico
> --
> SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
> Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
> 09128 Chemnitz
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

