Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 070B37F89A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:40:22 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id m8so22821261edi.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 08:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HCG71BgwdQberSORktWNRzHPRkCa1odzB1TOHIyIC0U=;
	b=T2+QQk/l7cwgVUE0cNhDdJjA+YQiPYLX6MXkamsWC/dMEfFgikgrlJLufWE2p/8L7y
	8StnjjhO4KzAV6PmJ0DKZPwdIhy/aVAoFsZCcgYZepnShTlYeets6WS20tZcfk5x00iJ
	i0iJFYvUx1sw8tV60D353H49HN4HQuFXUNgRjFOunfquNlWB1jcGoT+silECYZoyzU+P
	eNZCBLMGsuP3Wkfk/XytKVOsfLl0cnJqLnbn7yOxF/wXhIlUsrmBTslgFxUnZZD0RzBF
	RFcqz+NvlIUSD/kOndiWEmAwswlEgq0iCHOsHhqaxSqzWar5VLruTFFSGCPStbJBZ5/8
	xsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HCG71BgwdQberSORktWNRzHPRkCa1odzB1TOHIyIC0U=;
	b=pXegwQVGmN93dy8scwUEQ2dJ3nW8vjKNZPFcvRqm4t2Q/g5gEkGF/ihTdpjuJBHKdD
	yvgXd+ljK+LFX1DyvcnJzaQxEDdu3ykx4XT3uuOoxVC3gzYND34E6uflJPYEgO5V7Tmd
	2Cv+hD6kVhymSzZ8Y5MtxNKWvgtTUFXBU/Hui7GDMiI2p5X0v53U7Vr/ejCFsWtfMfoQ
	xJij/vS7s1Za+wPQCuWuIRZ7wY874O3JTo3c4AaLI0xNz6+f5yaivl1SabqcXjeBiXJL
	T6ghYzoRfamSlbjX5kvFZKiP+YOgA9nhy/Vz0mDzyCndxCD1xaXKly60XTdLMq0QAlAO
	4y8w==
X-Gm-Message-State: APjAAAVeVBieYhAFik1kkl/e7nCOLgOO368b2YO9/wvJajheNKrGPQtI
	hzHUYXqUlZUboUm8pvhutKEBnXijO8NSEO/nklo=
X-Google-Smtp-Source: APXvYqynAyVMVw6gB9F9QS7JISiB3yU0Y7E6d0TtFwP3gPcnV6ePCB2J34Hi5sqXAgq8gtVpB3DMyqG9kg2Hf9RXlzU=
X-Received: by 2002:aa7:cf81:: with SMTP id z1mr4815150edx.234.1579279223622; 
	Fri, 17 Jan 2020 08:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20190904014322.96351-1-hongzhi.song@windriver.com>
	<CADkTA4NipOoQ6qWThig_-hRS5W-QwXNv4Vc9=VSv2yA9sCWxmQ@mail.gmail.com>
	<b92e2a4e-1f37-1c89-4316-80c91ddc1b0f@windriver.com>
	<CADkTA4PLrV7w-4muqS6nh4OBdRsqXfg3sJud+L6taQPkmT8NFA@mail.gmail.com>
	<ee438438-7885-2b12-666d-0b026166b97d@windriver.com>
	<7754de2c-b4c8-f9c8-8574-f6112e6b1cd8@windriver.com>
	<CADkTA4N8y=C--kAD0OD3Lr7+N31XhOhTsE0R_kFiJAoCvUqvVA@mail.gmail.com>
	<b7d4cf83-c7a9-2d69-7ef5-357f88641372@cisco.com>
In-Reply-To: <b7d4cf83-c7a9-2d69-7ef5-357f88641372@cisco.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 Jan 2020 11:40:12 -0500
Message-ID: <CADkTA4P4ir4n13cPL50pgcDUgNeDnCBUX=cuK89ZagUg1+Ni3A@mail.gmail.com>
To: Ruslan Bilovol <rbilovol@cisco.com>
Cc: "Hongzhi, Song" <hongzhi.song@windriver.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 17 Jan 2020 16:40:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 17, 2020 at 10:49 AM Ruslan Bilovol <rbilovol@cisco.com> wrote:
>
> On 9/11/19 2:36 PM, Bruce Ashfield wrote:
> > On Wed, Sep 11, 2019 at 5:10 AM Hongzhi, Song
> > <hongzhi.song@windriver.com> wrote:
> >>
> >>
> >> On 9/6/19 11:10 AM, Hongzhi, Song wrote:
> >>>
> >>> On 9/4/19 8:34 PM, Bruce Ashfield wrote:
> >>>> On Wed, Sep 4, 2019 at 6:07 AM Hongzhi, Song
> >>>> <hongzhi.song@windriver.com> wrote:
> >>>>>
> >>>>> On 9/4/19 11:55 AM, Bruce Ashfield wrote:
> >>>>>> On Tue, Sep 3, 2019 at 9:43 PM Hongzhi.Song
> >>>>>> <hongzhi.song@windriver.com> wrote:
> >>>>>>> There are two errors when compile an out of tree kernel module
> >>>>>>> using sdk:
> >>>>>>>
> >>>>>> This is not universally true. Can you expand on what kernel version
> >>>>>> and architectures you are building ? I'm able to build kernel modules
> >>>>>> across all the arches I'm currently testing, so I'd like to capture
> >>>>>> your exact config in the long log. Neither is the autobuilder showing
> >>>>>> any errors.
> >>>>> Hi Bruce,
> >>>>>
> >>>>>
> >>>>> kernel version: 5.0.19
>
> I met the same issue with modpost recently. This is because kernel 5.0
> commit
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=60df1aee2aecb53efb4218b4dfdf7d6c80a5a3de
> moved modpost out of 'scripts' target.
>
> >> Hi Bruce,
> >>
> >> I found 2.7 and 2.6 doc all use "make scripts". And now "make scripts"
> >> doesn't work.
> >>
> >> Should the doc be change to "make scripts prepare" ?
> >
> > Yes they should be. We need to open a bug and get ScottR to look into it.
> >
> > We've (Richard, myself, and others) have been using make scripts
> > prepare as a requirement for on kernel building for quite some time
> > now. The docs should reflect this.
> >
>
> Looking at kernel sources, there is better alternative for "make scripts
> prepare" requirement: "modules_prepare". It's a special Linux Kernel
> target to prepare building external modules.
> What it does is actually "scripts+prepare" for older kernels (like 3.10)
> and "prepare" (which has "scripts" as indirect dependency) in recent
> kernels (v5.4 for example)
>
> So instead of custom "make scripts prepare" lets change it in the doc to
> official "modules_prepare" target for modules building preparations.
>
> Any objections?

We used to use modules_prepare (and many still do use it), but moved
to scripts/prepare to cover more use cases in our standardized
testing.

Whatever works for people is fine, it is just a documentation question.

Bruce

>
> Thanks,
> Ruslan
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

