Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1E7417C86A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 12:34:46 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u16so21095249wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 05:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TEdt1/NbaQGfNku4R9xBSf8OyKt/wrh4SVlHq0Pe4+8=;
	b=YzwV7bvKiqFKtRnDLdeoHk6BuchmPxiaqqkQWd4Dt8nzWAohXUpzfQtr/p4qNo8xAA
	4KPzIFPQlyJthV4MPim/pOQrhfLxgi1uMnSUYnMx5/GpyCaxl4Pac1frv3zbm01Dd0Fa
	Nz5Sn69Hy9R3a03btPQs3ks1yQ3z1UnHmlYXQOa8SGsldJtRmiJlIil1XBn5AljYavE4
	q/Z83BGRtQ2RaVaQb+Dz7shSu7aE55rHOVdzH4uKBHq+CKiLEH+05kI/c+jcYlo/GJ3O
	yJrEtXM58JwTR/7WJ5R/LZyg3KQrzua7JEFpjptvJh2v9jpTGmjQEe8XsLZHf+CCqXMd
	M8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TEdt1/NbaQGfNku4R9xBSf8OyKt/wrh4SVlHq0Pe4+8=;
	b=WY9l04jjipEErMmhGUfX8IMkwdGQVLRlr5AJZeolD43EUPUJydnSs71Iz+6FsiZPfV
	7bLqakqG5RButATQOcFGeQUjxNqnFDNI/vDAY5s1QWQkiU6bmbfdz/jY16XIGtfXVwws
	BtNVA7iZiP7+GzxYcRBLrisDc92TYlnRTEHw/8ASlPnfFzNxGkH7sdrcgAifOgjfPeUC
	TAfAMlWI18+FOXFj2dHKieggOP9HoRy/9pWLcQel+QaQkty0kB4C12AfmlgmxCguwNW9
	EIywvtDJ2RpDLvUWWDNY2fb5t6qX2IV1Ic0eB0jf5pzVjrq1DtZM99DW6zyJwj58pBv1
	sRaA==
X-Gm-Message-State: APjAAAUyErgRlFfF2XHfhcxYkXDu+RTTSYYju9vd3OsGNQxKxVCuCKDW
	xZxMuo8zqqbhenCIEm0idNfgSAf68wUo34UPGno=
X-Google-Smtp-Source: APXvYqxaMpxsCkEdbHDz+iY+omv2yPrOY1toGboGhXUYZGOKNvQJx2DY2BKXppLnWA1YRwZYKmutU25lCwOMqTab1vU=
X-Received: by 2002:a5d:448a:: with SMTP id j10mr17508139wrq.82.1567600487468; 
	Wed, 04 Sep 2019 05:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190904014322.96351-1-hongzhi.song@windriver.com>
	<CADkTA4NipOoQ6qWThig_-hRS5W-QwXNv4Vc9=VSv2yA9sCWxmQ@mail.gmail.com>
	<b92e2a4e-1f37-1c89-4316-80c91ddc1b0f@windriver.com>
In-Reply-To: <b92e2a4e-1f37-1c89-4316-80c91ddc1b0f@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Sep 2019 08:34:35 -0400
Message-ID: <CADkTA4PLrV7w-4muqS6nh4OBdRsqXfg3sJud+L6taQPkmT8NFA@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
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
X-List-Received-Date: Wed, 04 Sep 2019 12:34:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 4, 2019 at 6:07 AM Hongzhi, Song <hongzhi.song@windriver.com> wrote:
>
>
> On 9/4/19 11:55 AM, Bruce Ashfield wrote:
> > On Tue, Sep 3, 2019 at 9:43 PM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
> >> There are two errors when compile an out of tree kernel module
> >> using sdk:
> >>
> > This is not universally true. Can you expand on what kernel version
> > and architectures you are building ? I'm able to build kernel modules
> > across all the arches I'm currently testing, so I'd like to capture
> > your exact config in the long log. Neither is the autobuilder showing
> > any errors.
>
> Hi Bruce,
>
>
> kernel version: 5.0.19
>
> git clone poky
>
> echo  TOOLCHAIN_HOST_TASK_append = " nativesdk-openssl-dev
> nativesdk-bison nativesdk-flex"
>           TOOLCHAIN_TARGET_TASK_append = " python-dev kernel-dev
> kernel-devsrc")
>
>           >> conf/local.conf
>
> Other config is default.
>
>
> bitbake core-image-minimal &&  bitbake core-image-minimal -c populate_sdk
>
> ./tmp/deploy/sdk/xxx.sh
>
> cd ${Your SDK path}/sysroots/xxx/usr/src/kernel
>
> make scripts
>
> Then you can build yourself module. And you will meet missing some head
> files and scripts/mod/modpost.
>
>
> I test qemux86-64 and qemuarm.
>
> Both of above arch miss different head files, which all of them
> generated in ${B}/arch/${ARCH}/include/generated/asm
>
> (qemux86-64 needs asm/early_ioremap.h and asm/mmiowb.h
>
> qemuarm needs asm/bitsperlong.h)
>
>
> >
> >> 1. "In file included from ./include/linux/seqlock.h:36:0,
> >>                   from ./include/linux/time.h:6,
> >>                   from ./include/linux/stat.h:19,
> >>                   from ./include/linux/module.h:10,
> >>                   from kernel-module/char.c:1:
> >> ./include/linux/spinlock.h:60:10: fatal error: asm/mmiowb.h: No such
> >> file or directory"
> >>
> >> mmiowb.h is generated to ${B}/arch/${ARCH}/include/generated/asm/.
> >>
> >> And there is only generated/ under ${B}/arch/${ARCH}/include/,
> >> so I copy whole ${B}/arch/${ARCH}/include/ to $kerneldir/build/
> >> in case of other files under generated/ is needed in the future.
> >>
> >> 2. "/bin/sh: scripts/mod/modpost: No such file or directory"
> >>
> >> Copy above files or directory to $kerneldir/build/ fix the errors.
> >>
> >> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> >> ---
> >>   meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> >> index 3900489..feff9f1 100644
> >> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> >> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> >> @@ -80,6 +80,12 @@ do_install() {
> >>
> >>          cp .config $kerneldir/build
> >>
> >> +       if [ -d arch/${ARCH}/include ]; then
> >> +           cp -a --parents arch/${ARCH}/include $kerneldir/build/
> >> +       fi
> > Just copy the files you need, not the entire directory.
>
>
> Just as explained above, exactly speaking I think include/generated is
> necessary.

It shouldn't be. The point of what we include in devsrc is that it can
regenerate all these files either on target, or the SDK.

>
> ps: only generated/ under include/.
>
>
>
> >
> >> +
> >> +       cp --parents scripts/mod/modpost $kerneldir/build/
> > We shouldn't be copying binaries or scripts. They are regenerated on target.
> >
> > Bruce
>
>
> But scripts/mod/modpost is needed when compile a module by sdk.

yes, that is expected. But 'make scripts prepare' should be recreating
them. Is that not working for you ?

We can't copy the binaries, since you'll get QA errors depending on
your host/target arch combination.

Bruce

>
> Otherwise it will show error info:
>
> "
>
> /bin/sh: scripts/mod/modpost: No such file or directory
> scripts/Makefile.modpost:92: recipe for target '__modpost' failed
>
> "
>
>
> --Hongzhi
>
> >
> >> +
> >>          # This scripts copy blow up QA, so for now, we require a more
> >>          # complex 'make scripts' to restore these, versus copying them
> >>          # here. Left as a reference to indicate that we know the scripts must
> >> --
> >> 2.8.1
> >>
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

