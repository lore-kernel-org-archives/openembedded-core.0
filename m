Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id AAE79784DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 20:12:19 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id d1so119634wrj.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 13:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eozFYY0s2FEW+dvFotNK9MZwl7UARzi5Bjh+H3HgenM=;
	b=pHrV3w2FMMiYN0Q4HUGl0derES9AvQR50YfeW2Zbw3LSI+Fv7IxmJP9PZudDEVcsM1
	m09fNX6nKUEpjtYawgpzeEalDOXFLD2b8BT1vfK6lY9C2aitIYfqxLLzIU32j82xvXrU
	lfS/s+q+ULoiZyhu2MF7iv9AdIK5mrYm3yNRE1ZsG+hwr7T5nCBFWx130QY6M/9W4K5Q
	hcJccgo354YSbBVubHNGYi4ETzQIWGnRESoPFhLqD16995qomNbr6jZpNTebCMNN8jMj
	np8Nd3DgORTNd4aelzs0fSWiyjbVOg4YJd68/G4xWdAxJgXx/0s0fXVSPadIx6XOKXw7
	mPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eozFYY0s2FEW+dvFotNK9MZwl7UARzi5Bjh+H3HgenM=;
	b=PgfPM/2AdUfAkZlUjPyrh/B+d28/WU2Dy67IKSB61xt+Q0Z2uKeXa+Wym0l7oGKPPX
	aI6AxyslM74UQ0LMGqUTz9PdR431RbcRGeUueylfMB4uC/CiB54Gf+EoDk3SgzNbzbNp
	z+KjNQs/Zs/eeW/a9RRhl75Z4rgugXe6d0TqVHkmnOahjIJBD9L5xOMbETLAWWH/VLKR
	Fslj/7492gcTgHn+1VzwGrMu5mPHGWnNDXdL/87l0cT5bEwV8EXZ+yUg4qUjhyJrXHLV
	+OqyY5aor+c4a2DRgmD/0jop4cfGzevPvnIBdVksxiVH9d+NI0SOqsYUtsAyPARp1NIY
	XVGA==
X-Gm-Message-State: AElRT7EAUC8jTDKsi49f67Q4b+lhT9GOJGprGm26dZ2w9JPSpnoTqJUI
	wH3enBlt0wW+lknCpaNxY+PN29btZRTKmCzNOpO94g==
X-Google-Smtp-Source: AIpwx4+P95IXStj0VDQx5wrbancMKXW0AQnXnGN+dKnO2bEwTIjm3usKJnICvzScb6lAKB4TdAg9ya3Op380UfJPodA=
X-Received: by 10.223.182.132 with SMTP id j4mr629233wre.66.1522181540536;
	Tue, 27 Mar 2018 13:12:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Tue, 27 Mar 2018 13:12:19 -0700 (PDT)
In-Reply-To: <20180327142230.15f1abf9@seebsdell>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<alpine.LRH.2.00.1803241637120.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=VB0axF8Lc-fEGuodFOLF_=UexUoGVoHt6+A9+m3bVs4w@mail.gmail.com>
	<alpine.LRH.2.00.1803242204010.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=WBP_Cw133Z1s0LxjL-sgp3YQmuYGx7eBxUFACUJP++nw@mail.gmail.com>
	<CALbNGRREDMPeqY5WXmen77eEDQJwVu_QnkbDFCyPz0BOyUsL4A@mail.gmail.com>
	<20180326143107.48f153a5@seebsdell>
	<CAJ86T=X4u0=82wPCdwngRwQL-==trUDVfuH-4FGC-2G6AmfVgg@mail.gmail.com>
	<20180326160746.1dce7ae9@seebsdell>
	<CAJ86T=VaJyJYbBTkjR1yUTSJPCFSjgZCZZkYbyGEaTWYCg+u7A@mail.gmail.com>
	<20180326203209.2da967eb@seebsdell>
	<CAJ86T=VqLZrmyLBYD4ovQc9eNJQx5Rqp8YK+=3hPHgmjqqa55w@mail.gmail.com>
	<20180326210734.165ac038@seebsdell>
	<CAJ86T=X8bq6MKdvnq7sPFzjKN3ZgEJL70xHGCgSNBuC7ppi51w@mail.gmail.com>
	<20180326234108.4b52c066@seebsdell>
	<CAJ86T=VtdUAahO+PE2w8BzuPHAJCM1PEyWaYwg4SSGHU6jtm=A@mail.gmail.com>
	<20180327142230.15f1abf9@seebsdell>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 27 Mar 2018 13:12:19 -0700
Message-ID: <CAJ86T=V=b2jsSuVEicQbbgrax+8iV7HV0B=cKWDaejLq-Dh2eQ@mail.gmail.com>
To: Seebs <seebs@seebs.net>
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
X-List-Received-Date: Tue, 27 Mar 2018 20:12:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 27, 2018 at 12:22 PM, Seebs <seebs@seebs.net> wrote:
>
> I was wondering about 64-bit EABI. The man page didn't say "32-bit
> EABI", it said "EABI".

EABI is just a name (Embedded ABI) which on ARM is used to distinguish
between the original ABI (now referred to as OABI, or Old ABI) and the
current one.

As far as I know, only one ABI exists for 64bit ARM and it's just
called the AArch64 ABI, not 64bit EABI etc.

Where the manpage says "EABI" it means ARM 32bit EABI, nothing else.

> The information that you don't need to do that
> on at least some ARM EABI arguably makes this *worse*, rather than
> *better*, from the standpoint of "how do I write correct code for
> this". So this appears to be at least partially a documentation error,
> although it's quite possible that the text predates the question having
> come up.
>
> But it does also mean that it should be harmless to us in this case.

You've lost me here...

> My basic concern is that I don't think I have enough information to
> produce a Provably Correct handling for syscall arguments in the
> presence of at least one architecture where argument order can change
> for at least one syscall.

Not sure what you mean by "handling of syscall arguments".

If you mean forwarding arguments through a wrapper without
interpreting them then I don't know what your concern is. Forwarding
arguments can be handled completely generically - for any architecture
and any syscall. See the musl implementation.

If you mean interpreting the arguments of a particular syscall then
yes - for each particular syscall, the C code calling libc syscall()
(and any code within libc syscall() which needs to interpret the
arguments) must be aware of the argument order for that particular
syscall as defined by the kernel for each architecture/ABI.

However the good news is that code in a syscall() wrapper doesn't need
to be any *more* aware of argument ordering than the C code calling
syscall(). In this particular case, if the code in gnulib calling
syscall(SYS_renameat2, ...) doesn't do anything architecture specific
then either it's not needed (and therefore also not needed in a
syscall() wrapper which wants interpret renameat2 syscalls) or there's
a portability bug in gnulib. ie there is no case where architecture
specific awareness is required in a syscall() wrapper but not in the
original C code which calls syscall().

