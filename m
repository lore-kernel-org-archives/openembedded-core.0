Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 72FF1782E8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 01:10:21 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id o8so13747575wra.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 18:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9ZdKRWj4kPpG79MzP15rgY8rLJ5PC6WiFR/Me47DGEI=;
	b=bVylBQEo/wIWxIhkE0dv4ewZswoCXwYL24DG9YpQpiz5fMVcFQVkvmYhV39yNdr/Jl
	4wN1YPrUWJmVDOcnna2Gz0RprDb7WnQk5xfSVUYnumQ33pZ00WsJmp0ZXFEy8DbJ4US2
	k6P1DugOoKUybJu25nYhHUB4J/Uz4mV2qjKz/J00hZLiAh28MtrSaw1uCj/D/9hgCdIf
	gQK7oIVsajjIXkwB3WlGdD5C97nlrOqB7UsSnLB8v4KUwX1lg2E4lJrxxHm7XDtMftHx
	eg2MHqfBqPxPsdkFtbygJnIjF32o/sIlt4oC1ZYEA2Ra00q5pVEuviPAEDYajQrygwNa
	tvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9ZdKRWj4kPpG79MzP15rgY8rLJ5PC6WiFR/Me47DGEI=;
	b=TduFLL/qhJpb8nnA/7ToOPOZGFdDSQRb7E7T+sOE+IleRdKJme65NUsqNrq9U4DvlB
	z7abpccweKutwL9YwrPK+pqLLwnarimGLGzEKn5kBuqZtiFdOlFseThbEVA3oIbIfIGZ
	fD1efm7Q/fqfKGUq1UEoA8mFKemumBc3Z9C8qonRlqSVoPKFIUMaQjUGGUr39OQHX4p2
	6vACaJd8YvY7AMQYsg54uq925QCKupSi8t1bIfFpfaR9/0VL5avG5bf/kPX4xf5NdO9p
	tEwd/GLDgWGq1txrz+fghL/QiaWN6Z0x1W7PadFsOpzMVKkk/NoFvm51HBMxhZH08qui
	AeGQ==
X-Gm-Message-State: AElRT7Hhkkjd4UMfGXDSRQqe/cSu/PglqPaI4aR9AP+QEGfu+jHn7CjJ
	s32b0S9DH9AGTJ26NO6U626shNovUE/M5Dl0lcw=
X-Google-Smtp-Source: AG47ELuiw2alWeUF/oNgV5ppIMvhnQs/4iMI9xjuLVcLcH6O1oermxqGn2HpjZy7fV+ZnXTS+W1/8htL4dYyhfKF4rM=
X-Received: by 10.223.175.201 with SMTP id y9mr24137830wrd.107.1521853822208; 
	Fri, 23 Mar 2018 18:10:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Fri, 23 Mar 2018 18:10:21 -0700 (PDT)
In-Reply-To: <20180323193625.594f2093@seebsdell>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
	<20180323185655.51d96c05@seebsdell>
	<CAJ86T=W63x0epGUXyORsaXG-KEV41fcF5xaECaEXPG6zhyox_A@mail.gmail.com>
	<20180323193625.594f2093@seebsdell>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 23 Mar 2018 18:10:21 -0700
Message-ID: <CAJ86T=WYEJ_=TW-kSJbZVY42nvdJwcXStn6NYbP1HqwDw9x6mA@mail.gmail.com>
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
X-List-Received-Date: Sat, 24 Mar 2018 01:10:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 23, 2018 at 5:36 PM, Seebs <seebs@seebs.net> wrote:
> On Fri, 23 Mar 2018 17:33:28 -0700
> Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> Interposing the libc syscall wrapper doesn't seem to scary if you can
>> transparently pass on everything apart from syscall(SYS_renameat2,
>> ...) ?
>
> I don't think I can in the general case; I don't know how many
> arguments every possible syscall takes.

The syscall wrapper in musl handles 6 additional arguments -
unconditionally. Based on that you might not need to interpret
anything - just extract 6 arguments and pass them on?

long syscall(long n, ...)
{
    va_list ap;
    syscall_arg_t a,b,c,d,e,f;
    va_start(ap, n);
    a=va_arg(ap, syscall_arg_t);
    b=va_arg(ap, syscall_arg_t);
    c=va_arg(ap, syscall_arg_t);
    d=va_arg(ap, syscall_arg_t);
    e=va_arg(ap, syscall_arg_t);
    f=va_arg(ap, syscall_arg_t);
    va_end(ap);
    return __syscall_ret(__syscall(n,a,b,c,d,e,f));
}

