Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id EDAEB783F7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 18:12:20 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r131so1889737wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 11:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xGscwcZDHTKMCJZBr4FSz6yBCWOw9J2knW3Rjkh8Atk=;
	b=aN1pDwcdOeKKHEiLQXL3k1CtSWO/1YtIIksiuP0EnNTsJWZpH9hL2Wn5TYs2oB0IFo
	sF3uSePSAyha/sCDpfQkieHiOK54yJyZawdAXPTzqjAFpQoEoNxK92de8MIw7HFvrwRz
	dkbP3hWWkcxX/ZsnR/Ze/pYe3tsSIq0hbcjQmsA0yI5tJ0vgG2ZoMINGR91Q5LYAovpu
	1E2i6xG9S4shm7kSVpJyaU+FKYib2khxR3IyWSSTnuLsFNu8ADej8Oyx2RtUt4TblTPF
	y69iZ4eA8YsdTVbpic21CZDLkMb+13wjEfDh/w+Z3BvwiHBZoNTGc8V2xSQZLG1L6Rug
	NB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xGscwcZDHTKMCJZBr4FSz6yBCWOw9J2knW3Rjkh8Atk=;
	b=IreyIF1rurUmHAtKiUpq5ufYDzmYd0I9iPJO1X8tD5KGSiPS5XxOFGj05+/icSuS3h
	TVJDR3jFZvKZZfz5My6BJ794DqfHXgjeqDb3NyTOMoIp1+9TYaqMo+CjyspI3dXM29dr
	d9XnuKjkQh5iWL0KKXToBx8Bzf6XxISxVo1rtbWYkuSrEaWYD3ykfI5CMO8R4nq8RObG
	ILMYJgTka3HjAV+AebhO7/BvMyQcFDHt59ZsxkHcu/mVmtK+iYEU0lW57rVeNwi2JsNy
	yqwTlhLKoeZyXkuJs/z3BPutskHTzWsCD5XG1P3/VvC9MMHXbyfn8mVHtYSYvh1Y4yo9
	p1fA==
X-Gm-Message-State: AElRT7Eso0h5BubI/n+N6CctO5sSrhtkYJgGLyRi9GRVXa9EUnV6Uq4J
	6CwM9xFn549QEnYt4rfFziTE+EzW8D+j1W7bbAw=
X-Google-Smtp-Source: AG47ELul3Z2qYiDDSu/tXYoLyeapNP9O2CMazZut7ZticrU1kIhQ1/W6hoiHzL2VBZ4Viu0LNX1WSpC1UGTbFXSWUbw=
X-Received: by 10.28.170.205 with SMTP id t196mr11980451wme.42.1521915141461; 
	Sat, 24 Mar 2018 11:12:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Sat, 24 Mar 2018 11:12:20 -0700 (PDT)
In-Reply-To: <20180324122357.668e6afc@seebsdell>
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
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sat, 24 Mar 2018 11:12:20 -0700
Message-ID: <CAJ86T=Xcee6ivhoSc0adMR2q95ozsMXwSYL41mK7O5PN4CsWqw@mail.gmail.com>
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
X-List-Received-Date: Sat, 24 Mar 2018 18:12:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 24, 2018 at 10:23 AM, Seebs <seebs@seebs.net> wrote:
> On Sat, 24 Mar 2018 17:10:47 +0000
> "Burton, Ross" <ross.burton@intel.com> wrote:
>> On 24 March 2018 at 12:36, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > I think, at least in principle, pseudo could wrap that and intercept
>> > this particular syscall, check syscall_number (the numbering having
>> > its own set of issues) and then only handle the specific problem
>> > case we have.
>>
>> And to make things easier I think we could even just ENOTSUPP
>> renameat2 in the short term (i.e. for 2.5)

If you can successfully intercept the libc syscall() API and return
ENOTSUPP for the one specific case of renameat2 but pass on all other
callers transparently then haven't you've already solved the bulk of
the problem (for the non-Go case)?

Or are you suggesting unconditionally returning ENOTSUPP for every
syscall called via the libc syscall() API?

>>, before looking at a more
>> comprehensive intercepting
>> which could solve the Go issue.
>
> In the Go case, we would basically have to do something more like
> debugger traps. They're not using libc *at all*, and unless something's
> built with cgo or requires C-type libraries, it's not even going to be
> dynamically linked. No dynamic linker => LD_PRELOAD is irrelevant.

Right, Go (and statically linked libc apps) are a completely different
problem and need a different solution.

>> I filed a bug with coreutils yesterday.  "Just intercept syscall()"
>> they said.
>
> If they can describe a mechanism for intercepting syscall that they can
> guarantee will work across all Linux architectures including possible
> future architectures not yet in use, I'd love to know what it is.

It's basically exactly what the musl syscall() wrapper does. ie fetch
6 register sized vaargs values from the caller and pass them on in the
same order to the next syscall().

  http://git.musl-libc.org/cgit/musl/tree/src/misc/syscall.c

> See syscall(2) for some examples of the kinds of things that could be
> concerns, such as the EABI calling convention. We can sort of hope for
> the best if we just treat everything as a chain of unsigned longs, but
> that's really *not* safe, and it should not be expected to work
> reliably across architectures.

None of that matters if you don't need to interpret the arguments -
you just need to pass them on in the same order you received them.

> Honestly, reading it more closely, I don't think we can actually
> produce behavior that precisely mimics the behavior of syscall() for
> generic cases on architectures we currently run on. There's magic like
> setting values in other registers, clobbering registers, and so on,
> because *this function does not obey general architecture calling
> conventions*. And if the wrapper does, the wrapper will break at least
> some of the expected behaviors, by not behaving the same way.

I don't see any evidence to support all this doom and gloom, but if
there is a corner case which fails then it will also fail when running
on musl - so at least you won't be debugging it on your own :-)

> Basically: I don't think we can promise that we will correctly pass
> through both parameters to syscall() and returns from it in on existing
> architectures we're actually running on today, for the whole set of
> possible syscalls. So if we intercept syscall(), at least some
> previously-valid programs break.

Since the libc syscall() API is only going to be used for syscalls
which don't have an libc wrapper, it's unlikely to get used very much.
The LWN article has a list of the potential syscalls which are likely
to come via this API and it's not a long list. In practice, getrandom
and renameat2 may be the only syscalls which currently get called that
way - and getrandom now has a wrapper in libc so over time that will
migrate away from using syscall().

  https://lwn.net/Articles/655028/

