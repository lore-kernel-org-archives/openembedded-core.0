Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2A8600E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 02:59:09 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p9so6355541wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 19:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FpD0DIV9Veh/HVQs5loq80jqKECGj2Gmv4CDGeU7HlU=;
	b=EPKdfevsMLkr2x5C7CyaqT6/3h0hSxPjLk3dN4BK2Fk2pE4jgSMmelatTCAqzbuN8k
	jgcANambKTaui3c1p+ikEbuW972UL0fIfqfOvlv7VtjNExl6wmzo1PTD1vDcaiUsCMbB
	CccBELslYIrKI3fEmpYsm6PbEcuad6KMaeNZy4lF4ssz3hwiXxRZnbfhgXVXwkB5434k
	1AsNmYt9Y3NVnqo5wBUiKdyHJXDbi1iZd2m9YfzotoLN5CNyQJkaSDDVG1SEXEoL/Mbo
	xM8q66cuAYXaWQiYQIWrRLkATA19zAFelCngbfR6feo2bBLYJnQpB1VrJDTRPXmuGkY5
	FZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FpD0DIV9Veh/HVQs5loq80jqKECGj2Gmv4CDGeU7HlU=;
	b=NMWl8mAOiju4zdanZcD1YREoUzypWCCYTwtZ+fOUYxs1etI0zqVc14VJZnUGiJ87Y4
	CGVVrSgCyRr+OKekvRa72hhI9r7olSUuejl36QYKm5m0a1QO6WUX+c9vIQp8E7Gjt6tW
	9vR/zZCCzS9dxT/N8BHDYI4sf2KDMWnTtexZjdhBCS0nzlmXDgYuuFy+JGAjdsJtu9Ex
	qnsAIHiAD+4GJvjs4mxIaXVihsnWGjLcF3IRVc8Dq4d/BDSBRCCJ7JKlmPU95+qGjfh+
	MPAjZ0iXrN3WkWw3aVIdB9aEgb9S1WnS0JTcVRKTlZGaRSDCf4xdy9+jSAeufcmWTFfP
	5pbQ==
X-Gm-Message-State: AElRT7H2jSiZkuaDxiVnqmuLJlz76iMjA+VCMgKHApH6ydY8XdZeRuvs
	WazAwA8/qV8Zb9ZY97SqRb/HoLJByyB/kv9gRw4=
X-Google-Smtp-Source: AIpwx4+TeMq6IANesS817vn1mYauBZxqxav4/jReGPcPaUi0pU9ypHJWdWSQgjmg0CJlT5FjRYHluCfcZq0fSKqPxVQ=
X-Received: by 10.28.63.148 with SMTP id m142mr7284680wma.153.1522119550428;
	Mon, 26 Mar 2018 19:59:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Mon, 26 Mar 2018 19:59:09 -0700 (PDT)
In-Reply-To: <20180326210734.165ac038@seebsdell>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
	<20180324145044.168f7e3f@seebsdell>
	<alpine.LRH.2.00.1803241306460.40806@sjc-ads-6991.cisco.com>
	<CAJTo0LbCLW+VH+hGz+D9GQZHZ5sb3NEiN6C-FmNBQHzHmddEeQ@mail.gmail.com>
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
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 26 Mar 2018 19:59:09 -0700
Message-ID: <CAJ86T=X8bq6MKdvnq7sPFzjKN3ZgEJL70xHGCgSNBuC7ppi51w@mail.gmail.com>
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
X-List-Received-Date: Tue, 27 Mar 2018 02:59:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 26, 2018 at 7:07 PM, Seebs <seebs@seebs.net> wrote:
>
>>> I remain interested in why the glibc implementation does all these
>>> weird things on some architectures if none of those things matter.
>>
>> Which glibc implementation? I'll take a look.
>
> syscall(2) for various architectures, which is actually implementing
> all this fancy ABI stuff. If that doesn't matter, why's it there?

The syscall manpage is from the kernel manpages, not glibc.

  http://man7.org/linux/man-pages/man2/syscall.2.html

I agree it's a bit weird that it contains a description of the
kernel's syscall calling conventions, but perhaps that's a historical
leftover from an original document which described kernel internals?
Either way I think it's useful background information.

> I think we may be talking past each other.

Well, the good news is I'm almost done talking :-)

> I'm not looking for "I tried
> this once on one architecture and it worked." I'm looking for a good
> enough understanding of *why* all these things are in the man page, and
> when they might matter, that I can reasonably predict whether this will
> work on lots of other platforms, and continue to work in the future.

I'm not sure I can help you with your understanding.

Personally, I've read the manpage, I've read code in glibc and musl,
I've straced coreutils mv and various little test programs on 32bit
ARM plus 32bit and 64bit x86 and written a wrapper for libc syscall()
which either intercepts or passes through syscalls. Everything I've
found seems to be consistent to the point that I've satisfied myself
that I have a pretty clear understanding of how libc syscall() works,
including why ARM EABI sometimes needs an extra argument to offset
64bit values - and when it matters for a wrapper and when it doesn't.
I don't think there's much more I can do.

