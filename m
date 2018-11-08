Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 051DA744AE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 13:44:42 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id b7-v6so1562930itd.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 05:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t9q4rcS0qnFwlNBBCQWTaiWBjCNS2vaWz6I7MJ7+n0I=;
	b=ZHfpNs8ENILBwfYcJEXs7YSMZNDpvlsMSU0Z5BnHveKDPsTA1/ndbuU3W9DWCNMuqr
	XboInEUMX8oY0wJAZN2oBC3W110AOPWRmeeCWX8wgdSWdPkVayXwNbk92tZrbfoV2vs/
	enFll9JZumgFPkZYwCj6QX8dqbMz65QIYvc6FSKBrH8+jOsz4txCpdM16rNSqo+yinpI
	Svy6AUwLEx2VulR/dl6IOc+2bZrupQS7PmAT+2z8e95pCZ+Fa/wLWv5JRTh3FymW0vGL
	QUPY76jf2ygWxlXTiIC679KZcTMU/vLOyUt/Ff0MapZ6P9qwX9wexpilfnkt6L8WreAt
	oYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t9q4rcS0qnFwlNBBCQWTaiWBjCNS2vaWz6I7MJ7+n0I=;
	b=t2Jhq0lSOZHzP6iBVjhQlgGeaamVed/CAfzIjsqP74cJuEWydhaPJTl9ob0Ee1PQ6L
	9v31icPWCrfrGZBGJZWdNITP1P0f6QmhHMj7Gtr5xA813e4E6P8DPRLrpRNG24G6FzGs
	t/o5cYcmbSWL7WigffuOEKgCsaWTPNKEk2Dt+xvBIj96gFQ1jl16gKR3pxEvjIo96npD
	Y0XdT6jxYXFXusTRmTUKg+EjYZ5FAClKOXNa8paPAdbdP98XN2rKpVl//ctUrVcFZblg
	/4shS1bIpUdUIB7GlbeknvHi4u5mRNbO/pfTRyrdWdW7kqulEtRxrj68t0RDUwned6KS
	MmHQ==
X-Gm-Message-State: AGRZ1gJeTVkGFdIu/HNFBiySRkzBsH2I7bAEbyzmHMFVtU8BjydpdPyL
	ey26w1VsR9vtWbNqippL4lQOou6YXUMyBOh4XF+fTg==
X-Google-Smtp-Source: AJdET5dBFIxR973HUYBg/l3oKoC9dtl+nsSQbFznCBTxaCgXV0qPXUfnRxG9Xs7USjRqNZP1CVwsZ7PEMtv8rboJ+lI=
X-Received: by 2002:a24:1d8e:: with SMTP id 136-v6mr984918itj.62.1541684684019;
	Thu, 08 Nov 2018 05:44:44 -0800 (PST)
MIME-Version: 1.0
References: <20181108084312.9306-1-nathan@nathanrossi.com>
	<CAMKF1spLq0bORBG-0p32o3mKV4tqOd0hUjueCoMFcq3VkJMtcQ@mail.gmail.com>
In-Reply-To: <CAMKF1spLq0bORBG-0p32o3mKV4tqOd0hUjueCoMFcq3VkJMtcQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Nov 2018 13:44:32 +0000
Message-ID: <CAJTo0LafrmE_tQDPiMD2fwUY8=A7M40An-4AHueZp_Y=xY_hLA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ghostscript: Define COMPATIBLE_HOST with supported platforms
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
X-List-Received-Date: Thu, 08 Nov 2018 13:44:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Nov 2018 at 13:30, Khem Raj <raj.khem@gmail.com> wrote:
> > --- a/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
> > +++ b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
> > @@ -121,5 +121,4 @@ do_install_class-native () {
> >
> >  BBCLASSEXTEND = "native"
> >
> > -# ghostscript does not supports "arc"
> > -COMPATIBLE_HOST = "^(?!arc).*"
> > +COMPATIBLE_HOST = "(aarch64|arm|i.86|microblaze|mips|nios2|powerpc|x86_64).*"
>
> this ignores riscv now. since you wsnt to
> ignore for just one arch you can use
>
> COMPATIBLE_HOST_arc = "(none)"
>
> or somesuch mechanism.

How is that different to the original assignment?

The real point here is that all of these variations have flaws.
Listing the architectures which don't work means the list isn't
complete, but listing the working architectures means that layers
which provide a bbappend instead of submitting to oe-core [1] will
then refuse to build ghostscript unless they also do something clever
with COMPATIBLE_HOST.

Ross

[1] meta-riscv, I'm looking at you
https://github.com/riscv/meta-riscv/tree/master/recipes-extended/ghostscript

