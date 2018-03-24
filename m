Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A18B6605C3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 01:43:12 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l9so6532640wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 18:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sRuWRewSSUEHMIcZxQiRns+wT8c6Qp2Z/9ZfQ1w9E3M=;
	b=nJsb3lvBE7TRgMdGUS2kaqwCDyvfOeqtZ7dwLs0z3DAxqxrauzYsjv0UTmGd1BC0mm
	fWGGfESK2HR3Cz0IRqgugdO15ztpPmOmkJJSoFyFIzdM4hCvN4vPEZxMnNHcWPkwXFnq
	KUs6BvbsyCVEhiYqeHEX6PEBSYfrn2/X2DukfjayO5jCcYMDgaBDZG8CAfUf+dJA/A4e
	TyZ9XPPkR+GW0AySBr/Y6KEbGBsflCLXembvShp63nwPC0ulOFeZdOdjTDvdJ/TZ1HrP
	Dj9nFKH4f03nkG88ymg2lwQuHdgNrZHVUNN+uEFs6YYWpgZt6EIwlOc/by7laT2tv7X2
	zSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sRuWRewSSUEHMIcZxQiRns+wT8c6Qp2Z/9ZfQ1w9E3M=;
	b=Ucn6LEcFLcFWE5Wqjc6CBA/cqwxQWkdmJzB6GBKj7VN+obwef2sNiAGHEL6h7AC3X1
	wQWJOI7uwPDMgl2Sr8Ejj5fg6haDoeBxbqB/YdpZ9LXOu32lEX1xF8+HVNqQ/yzXAajp
	uewvngrGNi9r/nq/Od1gIk3023TQxqzMR2RgM5NCTBgM5FXwyy7P2z17cEtSKXCkb0Vh
	w4Z+b3eoGedfahrrppxj6LI7s0Eb6QwbURjBNN+xvDfqI+EpEQr8ucPCN6gBXsQrjbL2
	9bMqUOYRjxowadrjFX4kD1gve267gFd0zrvt44IO+czS3Fi5pAowOMMfJMQ6QulokPud
	PAhQ==
X-Gm-Message-State: AElRT7HHBQYlg/krAOTsEjzqQ5A30xmwY32519BJ8NsPUtiPXCe59qRy
	KxKh63O1fYir+EIw7R+RT9XoluKjipSIL3/2b3s=
X-Google-Smtp-Source: AG47ELsfUnP7fDthKHDQNpc5AUUNSZ66xVX9F9lA43CZeiY2XLvJ58MfcWkeNmt/B35FhPLgK8pc2PatC0YHMe7mIWc=
X-Received: by 10.28.145.83 with SMTP id t80mr5698645wmd.151.1521855793421;
	Fri, 23 Mar 2018 18:43:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Fri, 23 Mar 2018 18:43:12 -0700 (PDT)
In-Reply-To: <20180323201751.31380cef@seebsdell>
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
	<CAJ86T=WYEJ_=TW-kSJbZVY42nvdJwcXStn6NYbP1HqwDw9x6mA@mail.gmail.com>
	<20180323201751.31380cef@seebsdell>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 23 Mar 2018 18:43:12 -0700
Message-ID: <CAJ86T=UhWm86-1KU5PWXqTOjZzHZWxOV+BVWZmp9S1o0MWQ3og@mail.gmail.com>
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
X-List-Received-Date: Sat, 24 Mar 2018 01:43:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 23, 2018 at 6:17 PM, Seebs <seebs@seebs.net> wrote:
> On Fri, 23 Mar 2018 18:10:21 -0700
> Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> The syscall wrapper in musl handles 6 additional arguments -
>> unconditionally. Based on that you might not need to interpret
>> anything - just extract 6 arguments and pass them on?
>>
>> long syscall(long n, ...)
>> {
>>     va_list ap;
>>     syscall_arg_t a,b,c,d,e,f;
>>     va_start(ap, n);
>>     a=va_arg(ap, syscall_arg_t);
>>     b=va_arg(ap, syscall_arg_t);
>>     c=va_arg(ap, syscall_arg_t);
>>     d=va_arg(ap, syscall_arg_t);
>>     e=va_arg(ap, syscall_arg_t);
>>     f=va_arg(ap, syscall_arg_t);
>>     va_end(ap);
>>     return __syscall_ret(__syscall(n,a,b,c,d,e,f));
>> }
>
> That is the sort of thing which *might* work, but which is potentially
> subject to arch-specific calling conventions or strangeness.
>
> It's worth a try, I guess? But I also think it may be worth just having
> all the people maintaining stuff that expects this go yell at coreutils
> about bad implementation choices, like "bypass libc to make raw
> syscalls when you are not, in fact, implementing libc".

Since glibc doesn't provide a wrapper for renameat2, making the
syscall via the libc syscall() API is exactly what coreutils (actually
gnulib) should be doing. There would certainly be grounds to complain
if user space code were making a syscall directly, but that's not
what's happening here - the syscall is still being made from within
libc.

Some more background here:

  https://lwn.net/Articles/655028/

