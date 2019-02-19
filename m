Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id CC58B7C9A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 16:54:50 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id y4so23868093qtc.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 08:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2yFCWZXJiU7lFU8oEqzkJDADTcub3BVwUaq79dXctFw=;
	b=cFhvJu4Nq9XSDy+CRyULDwKBZDX1/8hfZOuy9KbJYHhv1qWDje3SfUgvXBsS7ilbFM
	JUq6MK/+5rF35Wlk2wr/AZ/sl5buEf72A8c0TGTiQRcJpvLd9g34GR05Mp9pmVgJdq1J
	bUBUjZT4HMTvsliZ3EAi5XjMnxvy/4q/MlGsBiRcZ2EVMGV6aMJ6RKY1qIXOwdTa4Bl5
	KxJ0vRUAHawfrHSeeZFQ4LD25SF/DV7I/QHK2MFQXaVptS/e9//oTPHiuWxnGAbiq1OK
	cjH4kOCB83eqIjC0guQXCt3cH3OolO9Q20CZ+iEZGuXdeasvuULbGiRz+yMOSICldhKl
	sfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2yFCWZXJiU7lFU8oEqzkJDADTcub3BVwUaq79dXctFw=;
	b=RzERDSbd6yY2wT3CRzzeaO/FqOPCJboJmIEl8Rwgax6WsoefZd6dpb/luYiHRfWwyW
	Ud2NVVpUT+ykhLx2c8XRq+sfx/p2psvqx20GLASk3R9UcZRu337uhJnxhPn1r1lF3Odd
	wFHqM38D5rmtGkSwNeM41oCcrFDDssB2qtRv4iws2Rbk9vFsKCT+pCkzoD1tFOHwr60R
	D26PEgNtgPikWo5Kw0+AN1Rsd0DgF500zx8XwQlIbDMzBHWWvBHWWUrliyBzUAm2DyVw
	iRlCW1LZxPd3QxYE43psZwrAaLh4t+V94D83GHIw6dkyMa298Cm0mraHRR9DvW4bvwBq
	QlRw==
X-Gm-Message-State: AHQUAuY3yz6Dxzfmxfy7kI7IkURni7C61R8XLvmuYdoQawyejxa4ZTBU
	R1oPOAC2eAkyIyhQJVljkV3/zDMHhj3ZClSh34A=
X-Google-Smtp-Source: AHgI3IZAU8xd70LUY4w/C6PcTHj8V5oVcsxmNjRu2Ay5hQp07++L4ZGXoCwpiY5oolIsqWBAx0FsyzsQ191dTeWdhqk=
X-Received: by 2002:a0c:c103:: with SMTP id f3mr22145667qvh.194.1550595291596; 
	Tue, 19 Feb 2019 08:54:51 -0800 (PST)
MIME-Version: 1.0
References: <1550555410-24852-1-git-send-email-chunrong.guo@nxp.com>
	<6ddad18f22efe93d86c8ead0bbb0114e861fe9e9.camel@linuxfoundation.org>
In-Reply-To: <6ddad18f22efe93d86c8ead0bbb0114e861fe9e9.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Feb 2019 08:54:25 -0800
Message-ID: <CAMKF1soq_rQ5WcQuAStm+RZ+C1FEhM0jJC=6S9QKreB4jXauSw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: support powerpc e5500 and e6500
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
X-List-Received-Date: Tue, 19 Feb 2019 16:54:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 19, 2019 at 8:35 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-02-19 at 05:50 +0000, C.r. Guo wrote:
> > From: Chunrong Guo <chunrong.guo@nxp.com>
> >
> > Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
> > ---
> >  .../glibc/0031-glibc-support-e5500-and-e6500.patch | 564
> > +++++++++++++++++++++
> >  meta/recipes-core/glibc/glibc_2.29.bb              |   1 +
> >  2 files changed, 565 insertions(+)
> >  create mode 100644 meta/recipes-core/glibc/glibc/0031-glibc-support-
> > e5500-and-e6500.patch
>
> I'd like to understand whether this is likely to make it upstream and
> who is using the powerpc support in the Yocto Project. Do you have any
> information on that?

They are fairly upstreamable patches

>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

