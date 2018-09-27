Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id F1C207459D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 04:26:22 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id z8-v6so1348526qto.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 21:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mMjlvinVsB9oIFb2EQsmwwLG+mLmSoreRiFjU3q/drk=;
	b=VH7f2gKSWQ3Y9LvvwCjThkSZPpC577RXfu8A93GKuz+nYUjPyXuOxpPtNbeLa4ETgB
	cvvmrfDFUQWsmJYxmJYsSvh0PrN8VRR3AT6w/dZY9/gvGIk0zTrOtGrD69zENzbiG0c1
	mXYJTYFMEvGYUQ1Y+PgY38SmHT4mZiVeTOKFpBIRDE9kDwgP8oKFDMyoCIIj/p7dBcGQ
	0xBfM66BVSZbVU17pg4HvD1uzcc6XsZ1rawgdAdFPGPJdE8qC5ae6zVFRwi6bc4xWCwf
	Ccwj2/MK3GO+Qry9HoRBSHeZMBHqXQRlr6dxu0xQuzwpVs8+FjJ+JbrqpcYiuC/I/9mx
	1J1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mMjlvinVsB9oIFb2EQsmwwLG+mLmSoreRiFjU3q/drk=;
	b=ep11enEkWygbKhIt0nwwOgHBm7n0RYx5dOSpHaROfxWY3nb27Pwru/izMg4uZW2QYp
	0FR2MyKS9OGbmsfjuCAs/4eVURpD3Zoh04lSjZutgZ4+P9YRwFf4yPCpe6SdWz8bCoiC
	XKaWX7cjLZUk3wKVrR+/KUW3goqGJvOHwOIqhUR5IVLlW8bctCoh5QpIRoXS0Vkh8v2e
	itEsFyxYyrl8S2xQTMKDh4HNB64vMDKwoufR1orr6h3Kg99LNbTGhI6U9C5MCxCV+KaG
	1z5wuwithFLEBUFB5IiOnj4K11GaCFbSih23W39LdBjj3lVvDF7NFJU4mKMYyo7+tiSr
	To3w==
X-Gm-Message-State: ABuFfohrgycrZJfNKQBPapJJ/c1e90z/kiO5KmuXclZcmhoj7wDtxzlc
	4Z++fFRvpiEaUEY/Gefyjc2PakHLiDeAON6LI4w=
X-Google-Smtp-Source: ACcGV601alQmuzX56ov1Uj7/H6gdDVPj1gMU1+tjtIN6YVywDcod2Hdsp8VOHAwiH9PrXSik4vva87eaZuHKUB0b3rs=
X-Received: by 2002:a0c:9141:: with SMTP id
	q59-v6mr6775209qvq.228.1538022383746; 
	Wed, 26 Sep 2018 21:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <e00126b08d5895fa7e4cc2fb0b8eaa9effb75cc4.camel@synopsys.com>
In-Reply-To: <e00126b08d5895fa7e4cc2fb0b8eaa9effb75cc4.camel@synopsys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Sep 2018 21:25:57 -0700
Message-ID: <CAMKF1soTGWbiB4AV9+PjZOD6aU7YwQ7B=Ejex2tzThLeU0pn4Q@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: ARC: machine dictionary - ARCompact vs ARCv2
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
X-List-Received-Date: Thu, 27 Sep 2018 04:26:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 25, 2018 at 4:57 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> Hello,
>
> While upstreaming ARC bits in OE core I faced one interesting challenge.
>
> As of today we have 2 binary-incompatible 32-bit ISAs (Instruction Set Arch):
>  1. ARCompact (AKA ARCv1) and
>  2. ARCv2
>
> In Binutils they have 2 separate machine numbers: EM_ARC_COMPACT=93 for ARCompact,
> see [1] and EM_ARC_COMPACT2=195 for ARCv2, see [2].
>
> Still we call them both "arc" and so I'm not sure what would be the right way
> of handling that mess in OE's machine dictionary.

mess is the right word. My preference would be to keep the newer
one in OE as the support is new,

>
> For now I just have separate instances of "arc_machine_dict" for ARCompact [3]
> and ARCv2 [4] and depending on what a given OE "machine" includes as "tune-arcX.inc"
> build system uses one or another dictionary entry.
>
> Even though it works fine it doesn't fit into common dictionary in meta/lib/oe/elf.py.
>
> Any suggestions on how ARC machine dictionary might be upstreamed?

you can define a separate arch like x32 is for x86_64 arch. but I think
PACKAGEQA_EXTRA_MACHDEFFUNCS is a way to hook in such ana

>
> -Alexey
>
> [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob;f=include/elf/common.h;h=e194274305663f565c6beee5ec21dbed70cdac46;hb=HEAD#l202
> [2] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob;f=include/elf/common.h;h=e194274305663f565c6beee5ec21dbed70cdac46;hb=HEAD#l309
> [3]
> https://github.com/foss-for-synopsys-dwc-arc-processors/meta-synopsys/blob/083958dedbd60c022432a17e952638a41e37c3dc/conf/machine/include/tune-arcompact.inc#L25
> [4]
> https://github.com/foss-for-synopsys-dwc-arc-processors/meta-synopsys/blob/083958dedbd60c022432a17e952638a41e37c3dc/conf/machine/include/tune-arcv2.inc#L38

