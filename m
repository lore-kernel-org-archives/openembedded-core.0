Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 25B5E7F2DB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 03:56:02 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id a4so3148002ljk.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 20:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1ChiYA40yPa2W+dTQUXO+be2n65g+ub0NYEyz0haQCE=;
	b=fpCggpoQ3CDpxxOefiawk8kF7AqKb2YCPlFbe6BXhC8sOgcHw6O2nIFenRHo+JtY6k
	wal4WS5L/WOR9XBWH6Zbeoat5qBpLQPllUGulhdUWpX6UQj4kMBePLhT/dxbyZC/Hdfc
	Dyd5L1aY7zZJ08rpGC4hXqjSzq+hjOg16wgDPf5GGi4gB3smP6cWqoe7LfHaRVppHIM/
	/Z2ecoPfTTi0fr/heApFlIfsVHNVkqPl9UpJbObWyMBc1EiWQZdhZUSL9kQITETkNV5B
	kAbchkn65Y1FXkHEuyZ4mjLUrtU+IEXVMlZv9OJjviOyziYK4MkQOtAkAB9fkvFOiRE2
	8ITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1ChiYA40yPa2W+dTQUXO+be2n65g+ub0NYEyz0haQCE=;
	b=btH6DENh3LdlxQ6pluZxaMTH2M1/6z/Fj3Z3m9PJz68Iku3KUcvm6mvTouGb8JdNRN
	Cy2CgZB3jw6tzWs2kJ3iG8naowTN2Y4NgUtd40eiuNcL3VSN4nBBwAQuDzTkJ4g92yyQ
	lqMcNXozDc8fdmPSkw9Bv4jRX0g+GZa2QtHhjHIbBgo3YVTR0nvcBsiaSic/NDWfnr/t
	n5FnG056IroKRjj1ebQ8PHwQ6UffzYTd3etEzyBaOSiAQSxPwtAn4dSehdLmJgAnbZun
	sIab9EqIRFIgnXmLp7+ZivoSMoK5dyG0sMGKAL0qs3giKnYDkHZykk+C+cXgibnBaovg
	2VLw==
X-Gm-Message-State: APjAAAWZTJsXQItYdhDqvShun4tcvrKVW6DM7PwQLw6PgQG/xMcHbxrP
	zlfu1XWN+o1WnVTma27VG+o3A8X1LYtlY0006WvwOVCn
X-Google-Smtp-Source: APXvYqxPlYKSRVY6T0z75md1rNHpYphi2ujv01wlP28U4CMK9LoJHLlCzcQqOkaySgBFKCmzaWfKqcScZfzSxDrlEZg=
X-Received: by 2002:a2e:9214:: with SMTP id k20mr5356607ljg.232.1567569363307; 
	Tue, 03 Sep 2019 20:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190904014322.96351-1-hongzhi.song@windriver.com>
In-Reply-To: <20190904014322.96351-1-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 23:55:52 -0400
Message-ID: <CADkTA4NipOoQ6qWThig_-hRS5W-QwXNv4Vc9=VSv2yA9sCWxmQ@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: copy mmiowb.h and modpost from ${B} of kernel
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
X-List-Received-Date: Wed, 04 Sep 2019 03:56:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 3, 2019 at 9:43 PM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>
> There are two errors when compile an out of tree kernel module
> using sdk:
>

This is not universally true. Can you expand on what kernel version
and architectures you are building ? I'm able to build kernel modules
across all the arches I'm currently testing, so I'd like to capture
your exact config in the long log. Neither is the autobuilder showing
any errors.

> 1. "In file included from ./include/linux/seqlock.h:36:0,
>                  from ./include/linux/time.h:6,
>                  from ./include/linux/stat.h:19,
>                  from ./include/linux/module.h:10,
>                  from kernel-module/char.c:1:
> ./include/linux/spinlock.h:60:10: fatal error: asm/mmiowb.h: No such
> file or directory"
>
> mmiowb.h is generated to ${B}/arch/${ARCH}/include/generated/asm/.
>
> And there is only generated/ under ${B}/arch/${ARCH}/include/,
> so I copy whole ${B}/arch/${ARCH}/include/ to $kerneldir/build/
> in case of other files under generated/ is needed in the future.
>
> 2. "/bin/sh: scripts/mod/modpost: No such file or directory"
>
> Copy above files or directory to $kerneldir/build/ fix the errors.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 3900489..feff9f1 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -80,6 +80,12 @@ do_install() {
>
>         cp .config $kerneldir/build
>
> +       if [ -d arch/${ARCH}/include ]; then
> +           cp -a --parents arch/${ARCH}/include $kerneldir/build/
> +       fi

Just copy the files you need, not the entire directory.

> +
> +       cp --parents scripts/mod/modpost $kerneldir/build/

We shouldn't be copying binaries or scripts. They are regenerated on target.

Bruce

> +
>         # This scripts copy blow up QA, so for now, we require a more
>         # complex 'make scripts' to restore these, versus copying them
>         # here. Left as a reference to indicate that we know the scripts must
> --
> 2.8.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

