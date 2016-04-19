Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 687026FF23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 14:11:32 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id x190so2367463vka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=IcYLfW7mW+lQtahOUN7lJYJyWuF/u3dajsh879MrYio=;
	b=XsXPDDWViG23+bhDiKYlR+fCFXXJUs8ihvW7KjSqMH6M5p4NhGtjNEzt7nubjtd1vS
	i6ZPFol7uzOncy/umKOsLHJ67R2EyNRLjR1idVIsg7ewVhlhgX89r2mCvvmTFj45FP6X
	nKPK7Crzpijwmcj+hoHlsKDdkxEiOISc89hjKis+4zQf8TzEvp6x3MY62Mw8tFhEhF0a
	gvdYmr1OL9vY3MwEMo0umRcTdwzzSdnF+7DFnM/ds3T711pasEy5H8F7CSy2+9BPAh2r
	A/P6wDF/a5YW0Z/T0FvbjXSKSdb0VfJQw0x/fkHFUhOYgDTkDC4ILYYQ04C8cFWrPjVS
	uxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=IcYLfW7mW+lQtahOUN7lJYJyWuF/u3dajsh879MrYio=;
	b=Kpujb3Qos7s+Kfq2LQd5Js5JGw6zXzkyUf8KsrpaGgrDgLgPl2DynumDceH08jJV3C
	Uw1FCmggjanjZLB9O+htqSeR1l2ihbBSuUTsr7CX4AvyTY4y9rA97oCmoQGjaZRteoNN
	+z8Co7hrSudyAjofWlfBr26ZZzvZAIqcc6nDAfYFzIo/LoIgoYNIXrDIj8zumGVa3VvG
	cFDKeHobtlFRuchlvazuZWnIFObkAEEnoS/uiLvqHgzD9j5eeoNwAILBFlbJu7b6WiVS
	sHzYJyOCwDz9Sqv2fY1Cqwle8LY584YFBJ3Qvg8fvJt/HxY8i3L7e5QUETlxCnVEbi5A
	HElg==
X-Gm-Message-State: AOPr4FUwkkzwOh5nHsKvl0bIivqCaUyU0hkI65kygfrwRu8hDUFVo63ssw5gpua7ciAcINoUVZJunM6JpuVfaA==
MIME-Version: 1.0
X-Received: by 10.31.174.23 with SMTP id x23mr1468678vke.136.1461075092617;
	Tue, 19 Apr 2016 07:11:32 -0700 (PDT)
Received: by 10.176.2.141 with HTTP; Tue, 19 Apr 2016 07:11:32 -0700 (PDT)
In-Reply-To: <5715DF5B.5030406@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
	<571496CC.8010607@windriver.com>
	<CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
	<57149B89.2090607@windriver.com>
	<CALbNGRTgnNYhN68zcDBKrhQ==fxP9wJ7wjj8pQ5jvMEgF=DF4g@mail.gmail.com>
	<5714A30A.9000204@windriver.com>
	<CALbNGRSBJSR4xMqCOUvu2yQcG38E=1UZBehkjmFZLdrtRyfamw@mail.gmail.com>
	<5714AA1E.9020505@windriver.com>
	<CALbNGRSe6B9-QRftL54DEEKrmCjxTt91K7FXk+CUzuGxjTvf5A@mail.gmail.com>
	<5714DC35.7040206@windriver.com>
	<CAJTo0LYTcA-c99-T_Z6q9Kn=X2C9Y1kBX+D6rzHrn+eLMUcSdA@mail.gmail.com>
	<CALbNGRR0ySfXHZFgTAPGCi5sZXehjG3_vUzGobawrTW6-DOOVg@mail.gmail.com>
	<5715DF5B.5030406@windriver.com>
Date: Tue, 19 Apr 2016 16:11:32 +0200
Message-ID: <CALbNGRQB-BUVH6qcQxey9CYOji-z8ydVA==qi5bx-ouBVpGaWw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Tue, 19 Apr 2016 14:11:32 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 19, 2016 at 9:33 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Hi all,
>
> With some investigation, there is an example to explain how to do remote
> debug.
>
> Also file [YOCTO #9481] for document.
>
> Hi Andreas,
>
> Would you please have a look the example, to see if it could fit your case.
>
> Example:
>
> 1. Build a image with gdbserver and gzip installed. The gzip
>    is the debug binary. Append the following to local.conf
> ...
> IMAGE_INSTALL_append = " gdbserver gzip"
> ...
>
> $ bitbake core-image-sato
>
> 2. Build gdb-cross for remote debug on host
>
> $ bitbake gdb-cross-i586
>
> 3. start qemu
>
> $ runqemu qemux86 core-image-sato
>
> 4. On host side, create symlink /usr/src/debug to
>    ${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS} which the
>    location of sources is /usr/src/debug.
>
> $ ln -snf /TOPDIR/tmp/work/i586-poky-linux /usr/src/debug
>
> 5. On target side, ipaddr is 128.224.163.187,
>    run gdbserver to debug "gzip -h"
>
> root@qemux86-64:~# gdbserver localhost:1024 gzip -h
> Process gzip created; pid = 530
> Listening on port 1024
>
> 6. On host side, enter gzip's devshell
> $ bitbake -cdevshell gzip
>
> 7. On host side, run gdb-cross to remote debug gzip
>
> gzip-1.6# i586-poky-linux-gdb ../build/gzip
>
> 8. Use path ${STAGING_DIR_HOST} as the system root for
>    the program being debugged. Any absolute shared
>    library paths will be prefixed with path;
>
> (gdb) set sysroot /TOPDIR/tmp/sysroots/qemux86
>
>
> 9. Start remote target, set break point at help()
>
> (gdb) target remote 128.224.163.187:1024
> (gdb) break gzip.c:325
> (gdb) info break
> Num     Type           Disp Enb Address            What
> 1       breakpoint     keep y   0x0000000000401ec1 in main at
> /usr/src/debug/gzip/1.6-r0/gzip-1.6/gzip.c:325
> (gdb) c
> Continuing.
>
> Breakpoint 1, main (argc=2, argv=0x7fffffffeca8) at
> /usr/src/debug/gzip/1.6-r0/gzip-1.6/gzip.c:465
> 465                 help(); do_exit(OK); break;
> (gdb) list
> 460             case 'd':
> 461                 decompress = 1; break;
> 462             case 'f':
> 463                 force++; break;
> 464             case 'h': case 'H':
> 465                 help(); do_exit(OK); break;
> 466             case 'k':
> 467                 keep = 1; break;
> 468             case 'l':
> 469                 list = decompress = to_stdout = 1; break;
> (gdb) c
> Continuing.
> [Inferior 1 (process 1246) exited normally]
>
>
> 10. On target side, get output of "gzip -h"
> [snip]
> Remote debugging from host 128.224.153.74
> Usage: gzip [OPTION]... [FILE]...
> Compress or uncompress FILEs (by default, compress FILES in-place).
>
> Mandatory arguments to long options are mandatory for short options too.
>
>   -c, --stdout      write on standard output, keep original files unchanged
>   -d, --decompress  decompress
>   -f, --force       force overwrite of output file and compress links
>   -h, --help        give this help
>   -k, --keep        keep (don't delete) input files
>   -l, --list        list compressed file contents
>   -L, --license     display software license
>   -n, --no-name     do not save or restore the original name and time stamp
>   -N, --name        save or restore the original name and time stamp
>   -q, --quiet       suppress all warnings
>   -r, --recursive   operate recursively on directories
>   -S, --suffix=SUF  use suffix SUF on compressed files
>   -t, --test        test compressed file integrity
>   -v, --verbose     verbose mode
>   -V, --version     display version number
>   -1, --fast        compress faster
>   -9, --best        compress better
>
> With no FILE, or when FILE is -, read standard input.
>
> Report bugs to <bug-gzip@gnu.org>.
>
> Child exited with status 0
> GDBserver exiting
> [snip]
>
> //Hongxu
>
thanks a lot for your efforts. Do I understand this right: You suggest
to use build sysroot (on my own risk - as I did before) and make gdb
happy by linking sources?

Problem I see is that we have multiple package archs e.g
ARM/ARMThumb/Machine so ${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}
expands to multiple paths. But a script symlinking all together + set
substitute-path might help here...

I will play around with this in the later...

Andreas

