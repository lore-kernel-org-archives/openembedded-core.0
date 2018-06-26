Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4173C60745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 19:52:19 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id l64-v6so10762521vkl.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 12:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9woHplijyBNjHH6TwdKYUyy+LkWt8NXla9p0T2w/jb8=;
	b=cI1IVFVNTW9t5ShhE7brKgDOjlinpIGa/jV7xJW2O57qkBYonSbO+IyOim8nhSNe7s
	zLhiEshCzI1PnlefkpMzUI1enzJLGzn/0CTxhn05rvMUhMmwiBIfxdshKiIITBG3Aira
	t99CKoL3HA9b/H/75UX1d5+FdZYKsF8yrpQ+/X4U/xvhc1ogQfE12wRULafgmOs869HM
	RqC2D54sn00DftcFJw7ZyDwoEFjwPjyP9tVHo5ydYjsLJsAtfbgaMT14bMTedPu0hgPR
	1QWENuYMJd4uQgoMS3izGhcLki/chU7gGO/fsDxsCFqkupHCzc9nQn2LUg0tcECvSEFN
	nl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9woHplijyBNjHH6TwdKYUyy+LkWt8NXla9p0T2w/jb8=;
	b=Avta99ilubscHwhPRB2ntSjGQa1EG1C847xB68fUgzHevxLeH+DrWxDXgTvoK1sJGz
	S6v7XOSw/WzznBiruTgx6Md+KU19h6Q4kUqthAqW4PauYH34pVGP1DVTZyouem1+6PbH
	8ZUMU0aofijUx1vtO7LLsN8oB9gQ8/5Ff2ZAflQQq5/NDquxfN1L9ef+l2YeK82MnNQP
	Ku/GTkN204DBZIkeHWpe6moSXUqP/wg/WxuLtA1xU5Z8XKHIspriNa6khVHNdqbqmOhm
	0g2jBAsM+zbtZF5iaid0Z+mPcUZlXAm0M4dxp/0saG3KldIBHQOjH6SQ7ypjXyH8z3Xx
	8q4w==
X-Gm-Message-State: APt69E1904FzXLlvz3lPkYp8c+/1EBbv0tl/dacb2U3m05ng4T8niCGe
	BF6ZxUmpt5XuxGJk0SoLrRn10t37Qq7nTH0P3mc=
X-Google-Smtp-Source: AAOMgpdUmtj0Cllhyo8UntvbX2csKAdX2E/tcWPOyqhZc2U4S7nNqVYCDbCHxLDLuFq28Q7XfjBlKErfmfcIJAZIo+k=
X-Received: by 2002:a1f:9757:: with SMTP id
	z84-v6mr1708173vkd.174.1530042740027; 
	Tue, 26 Jun 2018 12:52:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Tue, 26 Jun 2018 12:52:19 -0700 (PDT)
In-Reply-To: <CAJ86T=XEw_E3kRzzYB0xdS0-Dxxj+qTkKdQGCxmMtYrj6sairw@mail.gmail.com>
References: <FAB9E48578194042BE5C63B8BE47610339CF54BD@MBX.NIKO.LAN>
	<CAMKF1spXXQiP8vpgCt-MJEyXpssH7NQF4Vw+CZVyy6-F6K4a5A@mail.gmail.com>
	<CAJ86T=XEw_E3kRzzYB0xdS0-Dxxj+qTkKdQGCxmMtYrj6sairw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 26 Jun 2018 12:52:19 -0700
Message-ID: <CAJ86T=Uf1Kf3nRZVhU8uKx-7ecDeWTRomc3+upVjwwSwxrcZWg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arch-armv7a.inc: default to Thumb2 instruction set for armv7a and above
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
X-List-Received-Date: Tue, 26 Jun 2018 19:52:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 4, 2018 at 2:33 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, May 22, 2018 at 3:33 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, May 22, 2018 at 5:58 AM,  <Jef.Driesen@niko.eu> wrote:
>>> Andre McCurdy wrote:
>>>> Although there may still be specific cases which can benefit from the
>>>> ARM instruction set, the Thumb2 instruction set is generally a better
>>>> default for armv7a class CPUs. Distros such as Debian and Fedora have
>>>> been targeting Thumb2 by default for some time.
>>>>
>>>> Note that setting ARM_INSTRUCTION_SET has no effect unless
>>>> TUNE_FEATURES contains "thumb" (which is controlled by the "t" suffix
>>>> in DEFAULTTUNE, e.g. armv7vehf-neon -vs- armv7vethf-neon, etc) so out
>>>> of tree machine configs may need to update their DEFAULTTUNE to take
>>>> advantage of this change.
>>>
>>> I recently ran into some major problems due to thumb vs arm. It turns out glibc doesn't support systems with thumb disabled anymore. See this bug report for details:
>>>
>>> https://sourceware.org/bugzilla/show_bug.cgi?id=23031
>>>
>>> This might be useful input for this discussion also.
>>>
>
> Thanks to everyone for the feedback!
>
> I've reviewed Martin's examples of distros which control
> ARM_INSTRUCTION_SET and don't see anything which would conflict with
> this patch.
>
> I've also reviewed the glibc bug (Thumb2 instructions used in glibc
> even when glibc is compiled for ARM) and it's a positive in this
> discussion. It means that anyone running without Thumb support enabled
> in their kernel will already have run into issues simply by using
> glibc in rocko. The glibc bug has therefore "cleaned the pipes" for a
> more formal switch to using Thumb2 instructions in user space.
>
> So, unless there's any further feedback, I think this patch is ready to merge.

Ping.

Richard, Ross, please let me know if anything else needs to be done
before merging this update.

