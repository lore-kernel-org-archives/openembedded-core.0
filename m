Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id A96846157B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 13:36:26 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id c26so24833457eds.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 05:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UmLmjRghGzsf8fQ4roBBD/V9FB49flFBGoz4SSHRE5k=;
	b=PxxCo56/7sSogcW3TbESaH7/IcUs2xHBm4lgzOYR1xM8aqJ62/XbjCSvb63HtcAkHx
	cwOy7N3vkULLs3f88j+VzVzALpH4et+XFVlEMw2vwpEeKslsOnk5ZFbLbWSv99ipWp37
	7a2EMldnAMfkEy08APBLzVi2cjoRf+P2c3VI/geS6PAnDdql5VDNj28JiJLvfO3aQxvd
	0J9tmjDSGOjKu9qJNlNJmLZ0ywxK/ec88G6uqpq6MCFIaIFu16+r4V0S5fjFZq9Thc0o
	8skkqVMEXYoCYWbsHV2PgTvWKmTKIkhNHZdUhLPkSvwF9RC9Yf95STB6UH3adV9/8r/S
	P0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UmLmjRghGzsf8fQ4roBBD/V9FB49flFBGoz4SSHRE5k=;
	b=GfQ1uBgyclRuZ/yyLROpwFIXmVmKvTuSA+ef/+2lbdgC7cKYPlqMQPkm2meEo0SMeb
	0fSS4Lshro8dPkF+ImRVjjHXoHSkpx5FuavIQNab0ZSL6Zay5EB/Z3osVtd1omdLIy2W
	OpOwEZgS83SCLpQZxyVrvnBpkEs1ZqkWVeyL+WGQEuSZXjU//yE1NaMIUcD7iy5XtkLi
	o94y18U3qiZuVRSTtuTYNkJDJTo1Hqf4Fo+BNI9CkIVp82wWsiscSE7NOeZpm32Jxu23
	dR66ak9BYtSFT0aUO22Y7XB5wcP0Uj1sayHZ104TxgaVySL2wjgXYhcMngC75/A+jwic
	DiYA==
X-Gm-Message-State: APjAAAXAnwB3T1FTFlFHyu90J6CKg9YBdLmZGuFL1wEl+5xIvrnceMfb
	jO9jqD1aZQohxXplMljWn0rXZxkgZezYu1AuKXU9N7eS
X-Google-Smtp-Source: APXvYqw8mSPDF7BYUoiCVZ5VzVbio23My8f5Se7swAGhmIde02Wz6H0i3lAC282xKS79jmMR8usd86GJxsG8Micn9Lc=
X-Received: by 2002:a50:ee8d:: with SMTP id f13mr18287983edr.347.1582032987177;
	Tue, 18 Feb 2020 05:36:27 -0800 (PST)
MIME-Version: 1.0
References: <1581991613-30949-1-git-send-email-li.zhou@windriver.com>
	<CADkTA4Oo=uvRps0UUcbrk+eZDhaN3Fi8M-RDcdKuLz-zAOGM3A@mail.gmail.com>
	<342f0a1b-aec2-932a-2a49-cd2b896d8822@windriver.com>
In-Reply-To: <342f0a1b-aec2-932a-2a49-cd2b896d8822@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 18 Feb 2020 08:36:15 -0500
Message-ID: <CADkTA4Mp8rTZf2z3cCehWipMT66BXhyhkzfZQaB1LGqS88OEXw@mail.gmail.com>
To: zhou li <li.zhou@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: fix missing generated files from the packet
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
X-List-Received-Date: Tue, 18 Feb 2020 13:36:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 17, 2020 at 10:58 PM zhou li <li.zhou@windriver.com> wrote:
>
>
> On 2/18/20 10:12 AM, Bruce Ashfield wrote:
> > On Mon, Feb 17, 2020 at 9:07 PM Li Zhou <li.zhou@windriver.com> wrote:
> >> The file arch/arm/include/generated/asm/unistd-nr.h is needed by some
> >> external kernel module. Error occurs when building the module with
> >> the SDK.
> >>
> >> Add arch/${ARCH}/include/generated dir and files under it to
> >> kernel-devsrc package to solve this issue.
> >>
> >> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> >> ---
> >>   meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> >> index b6f2dbc..8621fe1 100644
> >> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> >> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> >> @@ -108,6 +108,12 @@ do_install() {
> >>          fi
> >>
> >>          cp -a include $kerneldir/build/include
> >> +
> >> +       if [ -d arch/${ARCH}/include/generated ]; then
> >> +           mkdir -p $kerneldir/build/arch/${ARCH}/include
> >> +           cp -r arch/${ARCH}/include/generated $kerneldir/build/arch/${ARCH}/include
> >> +       fi
> > This is just papering over the real problem.
> >
> > Anything that is generated, should be regenerated when the headers are
> > used/prepared.
> >
> > What is missing and/or why isn't that happening with this ?
> >
> > Bruce
>
>
> In some old version yocto, the file
> arch/arm/include/generated/asm/unistd-nr.h can be directly used from our
> sdk. So now it isn't permitted any more? And we should figure out how to

Anything in the generated subdirectories of the kernel build should be
regenerated when we do the make prepare/scripts/modules_prepare steps.
If it isn't being regenerated, then we are missing something in devsrc
that can regenerate them (either a step in the preparation, a
Makefile, a script ..).

If we start pulling bits and pieces out of generated, we'll end up
constantly having to take more and more, when the right thing (by the
way our minimal devsrc is designed) is to have it regenerated.

It's valid to use it, but we shouldn't need to copy it if it can be
generated. If it can't be generated, we should document why with a
comment in the code and in the commit message of the change.

Bruce


> generate it again when developing the external kernel modules? Thank you.
>
>
> >
> >> +
> >>       )
> >>
> >>       # now grab the chunks from the source tree that we need
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> --
> Best Regards!
> Zhou Li
> Phone number: 86-10-84778511
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

