Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 199DB6FA5E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 18:22:53 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id uq10so2130716igb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 11:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ZxShSuUe3RxYvK/+UtdQacP+MBBLh9F5xi2OprYxrMg=;
	b=jHi/N0sLPLZ/9vYmWCMKXEmRSC6DWl0lpIYJmtVqcnDOKULqtyl+7jaOOfxQNo75zp
	Rl87eWkMjpN2zkjwHXyAM6byUckMchMn3CUrOiqx95ZWcLPtLi29RFaLJLMk8Fx9EkE2
	cy/ytzlBtdM15Fm2krSMSbVtBtSJOFkJFZTdlgDohP8jwujA0PFoj46kZTug3HDMs5tM
	i2vThcksQfWYcuf0ciCqfFoWDPZyxtGm8faraZiUXV+uWsH0Ec9flvQAvVFefkVTRpA+
	yrYr8AGL4nRzAFNaoZMrh/NTSnevYQ1eoduSaN6xjzUJgEz9EFaQyU0dpULBkYOyOIDN
	pPBA==
X-Received: by 10.50.60.103 with SMTP id g7mr4412331igr.20.1395426174423; Fri,
	21 Mar 2014 11:22:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Fri, 21 Mar 2014 11:22:24 -0700 (PDT)
In-Reply-To: <CANyK_8e6dfzu64SRLzZdXFE3obT6Td-8UUDqfcoSAqWTjoOq3g@mail.gmail.com>
References: <CANyK_8e6dfzu64SRLzZdXFE3obT6Td-8UUDqfcoSAqWTjoOq3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Mar 2014 11:22:24 -0700
Message-ID: <CAMKF1sq7QUcKypgyn8auurnqRd5ZfztdymcxquRwsRxvN4seqw@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OpenEmbedded and musl-libc
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
X-List-Received-Date: Fri, 21 Mar 2014 18:22:54 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 21, 2014 at 5:34 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
> Hi all,
>
> musl-libc hit version 1.0.0 yesterday and is starting to look good to
> me. It's basically a really small but very functional libc that would
> suit embedded environments very well as an alternative to
> eglibc/uclibc. I'm personally very interested in using it in my
> projects and I also think it could fit in well with the aims of
> poky-tiny.
>
> http://www.etalabs.net/compare_libcs.html gives some pretty useful info.
>
> I'm basically emailing to see if anyone else is interested in this or
> if anyone has looked at using it before in OpenEmbedded as a google
> for previous discussions didn't turn anything up.
>
> I'm currently very busy between various projects so I don't have time
> to hack together a musl-libc recipe myself but I should have time to
> help test it.

it has been under my radar for a while. I have actually locally made
toolchains with
clang+musl and it seems to be coming along. its licensed differently thats
the biggest attraction for folks who do static linking. Otherwise it still
doesnt yet support variety of architectures that other libcs support. given
now we have kconfig for eglibc too may be it fills in the nommu gap much
like uclibc does today. I have some plans for 1.7 for adding it to OE
may be in a layer
of its own first and then migrate it to OE-core

>
> Thanks,
>
> --
> Paul Barker
>
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

