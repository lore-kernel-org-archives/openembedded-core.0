Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id B1D127F262
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 11:37:08 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id a4so19629808ljk.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 04:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HClqUBVHLLXOBAx5hRnl0cjocJI0Lq7bZtUU29auSP8=;
	b=t+tkKtB37U/uAjSkJUcLMj2niu0VnXnAn3owcnuGQlbyyiHVvY4CefnfIcDNWBrj0W
	5vTNkQpZGqJ0fJjKOsIcK+brtXgZ4/KCrmDPgiTSL5qFNYpgued+rkVjqdZ31rLdBvss
	BizWUDooe44DaQkr3dLPcSeOtapUfxnJUP6V8PwkVqaDN8zL4jYF8+yplVw4+gMehFrN
	X+2u6GspR3EFFqS5zUQon1PODWFu5lLoQkxyMpzognTfTOC1v0cEnniuMSdYW8NOyTrl
	CAQPP/eAlJKwNkDw3QF2reA7CWpwV7Yz69+TWQR6rr8NcAPYZ4VXulVmj7//qqkxbmzR
	6QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HClqUBVHLLXOBAx5hRnl0cjocJI0Lq7bZtUU29auSP8=;
	b=sbi/tM+Ga92kJrZiKm4I8Cybvy6JTk3WFMuK13TRRzLQb2D2ZuExsFUKorAVkmGg50
	+hzjib6rARH1Zrx/3OhAyXNkRUx9HlCGttn91Amb+fCoruCgrqbnLKfiXyBsyOHUx/E8
	u72VZnTJZmqncjvNRZARfkjpoGdaJ8ppvs9YZzPbSZLYalOkwj3+zYS+fw2NC8+Dqc4E
	4D5V/VvVa13nPTK2zaeLgjWi+/ocmBLDAN2KEM+I1M8cW70d11brqplcCzzrXjpP3ygj
	yDlEXqxDmz8XxLHmuxpQCt0a/JY2wCWDwUBdMYNxdfmRMUf8yBAHCwCleqIKeucDp3vX
	+9xQ==
X-Gm-Message-State: APjAAAVQusJlnRkywo+pAQXjbayeP1EBNkyJ5OFTItsEnK6VlrBX9CxF
	yFF6G2eQEKIF0QUaWWvQSRyc63P8ZiGn7OJdy2M=
X-Google-Smtp-Source: APXvYqxU7QvQq5atm0DWBr+b5maUCxABjPiM2J/rcp8MK9THFIqkJXRTU3iFePsAqO4Mm4GqW/nqqZMbmnUKFuoug/0=
X-Received: by 2002:a2e:3c0b:: with SMTP id j11mr23077666lja.78.1568201828763; 
	Wed, 11 Sep 2019 04:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190904014322.96351-1-hongzhi.song@windriver.com>
	<CADkTA4NipOoQ6qWThig_-hRS5W-QwXNv4Vc9=VSv2yA9sCWxmQ@mail.gmail.com>
	<b92e2a4e-1f37-1c89-4316-80c91ddc1b0f@windriver.com>
	<CADkTA4PLrV7w-4muqS6nh4OBdRsqXfg3sJud+L6taQPkmT8NFA@mail.gmail.com>
	<ee438438-7885-2b12-666d-0b026166b97d@windriver.com>
	<7754de2c-b4c8-f9c8-8574-f6112e6b1cd8@windriver.com>
In-Reply-To: <7754de2c-b4c8-f9c8-8574-f6112e6b1cd8@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 11 Sep 2019 07:36:57 -0400
Message-ID: <CADkTA4N8y=C--kAD0OD3Lr7+N31XhOhTsE0R_kFiJAoCvUqvVA@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Sep 2019 11:37:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 11, 2019 at 5:10 AM Hongzhi, Song
<hongzhi.song@windriver.com> wrote:
>
>
> On 9/6/19 11:10 AM, Hongzhi, Song wrote:
> >
> > On 9/4/19 8:34 PM, Bruce Ashfield wrote:
> >> On Wed, Sep 4, 2019 at 6:07 AM Hongzhi, Song
> >> <hongzhi.song@windriver.com> wrote:
> >>>
> >>> On 9/4/19 11:55 AM, Bruce Ashfield wrote:
> >>>> On Tue, Sep 3, 2019 at 9:43 PM Hongzhi.Song
> >>>> <hongzhi.song@windriver.com> wrote:
> >>>>> There are two errors when compile an out of tree kernel module
> >>>>> using sdk:
> >>>>>
> >>>> This is not universally true. Can you expand on what kernel version
> >>>> and architectures you are building ? I'm able to build kernel modules
> >>>> across all the arches I'm currently testing, so I'd like to capture
> >>>> your exact config in the long log. Neither is the autobuilder showing
> >>>> any errors.
> >>> Hi Bruce,
> >>>
> >>>
> >>> kernel version: 5.0.19
> >>>
> >>> git clone poky
> >>>
> >>> echo  TOOLCHAIN_HOST_TASK_append = " nativesdk-openssl-dev
> >>> nativesdk-bison nativesdk-flex"
> >>>            TOOLCHAIN_TARGET_TASK_append = " python-dev kernel-dev
> >>> kernel-devsrc")
> >>>
> >>>            >> conf/local.conf
> >>>
> >>> Other config is default.
> >>>
> >>>
> >>> bitbake core-image-minimal &&  bitbake core-image-minimal -c
> >>> populate_sdk
> >>>
> >>> ./tmp/deploy/sdk/xxx.sh
> >>>
> >>> cd ${Your SDK path}/sysroots/xxx/usr/src/kernel
> >>>
> >>> make scripts
> >>>
> >>> Then you can build yourself module. And you will meet missing some head
> >>> files and scripts/mod/modpost.
> >>>
> >>>
> >>> I test qemux86-64 and qemuarm.
> >>>
> >>> Both of above arch miss different head files, which all of them
> >>> generated in ${B}/arch/${ARCH}/include/generated/asm
> >>>
> >>> (qemux86-64 needs asm/early_ioremap.h and asm/mmiowb.h
> >>>
> >>> qemuarm needs asm/bitsperlong.h)
> >>>
> >>>
> >>>>> 1. "In file included from ./include/linux/seqlock.h:36:0,
> >>>>>                    from ./include/linux/time.h:6,
> >>>>>                    from ./include/linux/stat.h:19,
> >>>>>                    from ./include/linux/module.h:10,
> >>>>>                    from kernel-module/char.c:1:
> >>>>> ./include/linux/spinlock.h:60:10: fatal error: asm/mmiowb.h: No such
> >>>>> file or directory"
> >>>>>
> >>>>> mmiowb.h is generated to ${B}/arch/${ARCH}/include/generated/asm/.
> >>>>>
> >>>>> And there is only generated/ under ${B}/arch/${ARCH}/include/,
> >>>>> so I copy whole ${B}/arch/${ARCH}/include/ to $kerneldir/build/
> >>>>> in case of other files under generated/ is needed in the future.
> >>>>>
> >>>>> 2. "/bin/sh: scripts/mod/modpost: No such file or directory"
> >>>>>
> >>>>> Copy above files or directory to $kerneldir/build/ fix the errors.
> >>>>>
> >>>>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> >>>>> ---
> >>>>>    meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
> >>>>>    1 file changed, 6 insertions(+)
> >>>>>
> >>>>> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> >>>>> b/meta/recipes-kernel/linux/kernel-devsrc.bb
> >>>>> index 3900489..feff9f1 100644
> >>>>> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> >>>>> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> >>>>> @@ -80,6 +80,12 @@ do_install() {
> >>>>>
> >>>>>           cp .config $kerneldir/build
> >>>>>
> >>>>> +       if [ -d arch/${ARCH}/include ]; then
> >>>>> +           cp -a --parents arch/${ARCH}/include $kerneldir/build/
> >>>>> +       fi
> >>>> Just copy the files you need, not the entire directory.
> >>>
> >>> Just as explained above, exactly speaking I think include/generated is
> >>> necessary.
> >> It shouldn't be. The point of what we include in devsrc is that it can
> >> regenerate all these files either on target, or the SDK.
> >>
> >>> ps: only generated/ under include/.
> >>>
> >>>
> >>>
> >>>>> +
> >>>>> +       cp --parents scripts/mod/modpost $kerneldir/build/
> >>>> We shouldn't be copying binaries or scripts. They are regenerated
> >>>> on target.
> >>>>
> >>>> Bruce
> >>>
> >>> But scripts/mod/modpost is needed when compile a module by sdk.
> >> yes, that is expected. But 'make scripts prepare' should be recreating
> >> them. Is that not working for you ?
> >
> >
> > Even without this patch, 'make scripts prepare' works.
> >
> > So 2.7doc maybe need to be update, because 2.6doc uses 'make scripts'.
> >
> > https://www.yoctoproject.org/docs/2.6/mega-manual/mega-manual.html#building-out-of-tree-modules-on-the-target
> >
> >
> >
> > --Hongzhi
>
>
> Hi Bruce,
>
> I found 2.7 and 2.6 doc all use "make scripts". And now "make scripts"
> doesn't work.
>
> Should the doc be change to "make scripts prepare" ?

Yes they should be. We need to open a bug and get ScottR to look into it.

We've (Richard, myself, and others) have been using make scripts
prepare as a requirement for on kernel building for quite some time
now. The docs should reflect this.

Bruce

>
>
> --Hongzhi
>
>
> >
> >
> >>
> >> We can't copy the binaries, since you'll get QA errors depending on
> >> your host/target arch combination.
> >>
> >> Bruce
> >>
> >>> Otherwise it will show error info:
> >>>
> >>> "
> >>>
> >>> /bin/sh: scripts/mod/modpost: No such file or directory
> >>> scripts/Makefile.modpost:92: recipe for target '__modpost' failed
> >>>
> >>> "
> >>>
> >>>
> >>> --Hongzhi
> >>>
> >>>>> +
> >>>>>           # This scripts copy blow up QA, so for now, we require a
> >>>>> more
> >>>>>           # complex 'make scripts' to restore these, versus
> >>>>> copying them
> >>>>>           # here. Left as a reference to indicate that we know the
> >>>>> scripts must
> >>>>> --
> >>>>> 2.8.1
> >>>>>
> >>
> >>



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

