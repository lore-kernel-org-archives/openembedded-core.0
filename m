Return-Path: <jpewhacker@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 31ACE787A7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 20:22:46 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id x6-v6so15340811otg.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 13:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i8QtbxbQzwv32z5gVADSonV40L+80+djNGfr5d6rU3c=;
	b=FDnGHhzfXB7INFjhNl0QML6dyrmjYfaaQe/nr/vfT9WdHF4JVeYajI3y93IgBJHgRl
	J7tp4wqzxzfCgDlVCrt8bDBLjK3mN4+C+Z0AI8Bs3tW/K3C2zyFFn6HTqrDyWaOdrOd8
	+5Q4wK6utQ/Qx/fHFOtHc0l2/Xc1SgOi4Q+uGrJnI6w1nYymL1/3wPzGLaJVOjN9rSoU
	YKCyavXTjIWo9V7ePvx98CY8FfMPAxGhHjZNpTpVCoZOdtAw3bQIF+LZElNAnASmXXAX
	Xp6v/YUKS7xzA/bvu8RSpAjO24pcKJjrQRQQec8xfZNAZWrp2kPDQorxF3i4/xgYEEow
	Sjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i8QtbxbQzwv32z5gVADSonV40L+80+djNGfr5d6rU3c=;
	b=N9OeIqa14fGnT5IfvQtlvTIpclKo1N3sT1tk0waJyQ9ir50nAp0a2ix/uKtpL8nY+3
	Uf7ombh8AZa9jP/SOjZ0A0NgM9VFl+YkUi6RZA9i7O4tK4yt3sNZsgEZ7Quxg9whz7UY
	gCh03ln1rm4QzfmpsHAiH1c0+mAMh+OYzMxbKaxuJ1MMXF/Ibqr960u7vuaKVkfAZr5v
	0YTLBBVrUPej6XSsfFfCztttJq5xYY3jTt1s0y2G8m7D51YzchpYZzd7gSRTJPsUSLZD
	TzHm1/gUKld4ZzwLglV84sn34a4YnH7NT9xe3ynP9/Ogm/qLKWKhF5MEniEP/flfM4/w
	Lo4A==
X-Gm-Message-State: AElRT7HNdixh/Peprmqm7q1nDySz9ioriXVkmOP3t1hghbjUkl/lfyHg
	YfvuoatCjD6ecV2KwTIKRWiTNQcqNDhxAZU322A=
X-Google-Smtp-Source: AG47ELvfLJHVsPkUvhRCGSm/5tbzn6pMqJ8ll7JCi5g07xBj6FwHUYT0CceC11xm0hX2+utaXIKTqrLNda5joScukMU=
X-Received: by 2002:a9d:1db9:: with SMTP id
	y54-v6mr20351761otd.367.1521922968117; 
	Sat, 24 Mar 2018 13:22:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:57c7:0:0:0:0:0 with HTTP; Sat, 24 Mar 2018 13:22:47
	-0700 (PDT)
In-Reply-To: <20180324145044.168f7e3f@seebsdell>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
	<20180323185655.51d96c05@seebsdell>
	<1521894988.11431.42.camel@linuxfoundation.org>
	<CAJTo0LbahOFYjBjonmfn5on78fFinG1Vk7R4kKtKX2mpmriEMA@mail.gmail.com>
	<20180324122357.668e6afc@seebsdell>
	<CAJ86T=Xcee6ivhoSc0adMR2q95ozsMXwSYL41mK7O5PN4CsWqw@mail.gmail.com>
	<20180324132246.28c2f8cd@seebsdell>
	<CAJ86T=VA6bR8v5+g6Y5e5HWQjU5r=E503gNdHCaco4PioPdW=Q@mail.gmail.com>
	<20180324142427.53da953d@seebsdell>
	<CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
	<20180324145044.168f7e3f@seebsdell>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 24 Mar 2018 15:22:47 -0500
Message-ID: <CAJdd5Gb0VWNqUN0ci-4-w6KJ6j4E5fLvNk0Tshp_pDeKXvJ7Og@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sat, 24 Mar 2018 20:22:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 24, 2018 at 2:50 PM, Seebs <seebs@seebs.net> wrote:
> On Sat, 24 Mar 2018 12:42:45 -0700
> Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> Right. The musl example is to show how it's possible to transparently
>> intercept and pass on any call to the syscall() ABI without
>> interpreting anything.
>
> Yes, if you don't need to interpret things, and aren't making
> additional other unrelated system calls after doing so.
>
>> Those details are all taken care of within the libc implementation of
>> syscall(). It's not something we need to care about at all in a
>> wrapper for it.
>
> I don't think that's correct.
>
> musl's call sequence:
>         real_syscall() // sets a3
>         return
>
> pseudo's call sequence:
>         various_setup()
>         real_syscall() // sets a3
>         other system calls // also set a3
>         return
>
> In the case where pseudo is actually *disabled*, we just return
> right away after the real call. In every other case, we're making
> other calls some of which imply system calls, and those system calls
> could potentially overwrite things that the libc implementation of
> syscall took care of. (Mutex and signal mask operations.)
>
> So for that to work, I would in principle have to stash the value
> stored in, for instance, "a3", wait until after the other system calls,
> and then restore it. Unless *only* syscall() itself actually sets
> that register, and other system calls don't, and nothing else is
> using it either.

I don't think that is true. libc's syscall() must conform to the *C*
ABI for the system... if the kernel does things that aren't in line
with the C ABI (like return things in registers that aren't expected,
fail to preserve registers that require preservation, or whatever),
wouldn't the libc syscall() be *required* to paper over it so that it
looks like a valid C call? Otherwise, it could never be safely called
from C code.

So as long as pseudo's replacement of syscall() conformed to the C
ABI, and pseudo calls the libc syscall() (which conforms to the C ABI)
as the real syscall, I think everything should be OK.

That of course doesn't deal with the reentrancy, signal masks, mutexs,
etc. IMHO, the number of syscalls we would actually consider doing
this for is necessarily pretty limited, so perhaps it would just need
some careful evaluation?

>
> -s
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

