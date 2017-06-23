Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1437F781F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:21:10 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id x23so15948553wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 16:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gPFZzLw9iod/NVbn3dUUrkXlSR9N6XqIfq8Pb8Cu49A=;
	b=h1tN3rrImHni2F4a9X1I13Li4l33Z7BftutcrpYtSZE++PuTNGMah30JBiFytUNrF/
	+JcIAWX2AXkq6/uSu99ddY472hmVgC0GnwnM33KqqO5Aq3581xAQi9l/tRkFHu554t8A
	5O/Lb2tJu5TFhDdotaYVjj7xGyjXfQ4HXTrjx0BpLECoQXYMgrYitWbJdCH/WOwmBo3v
	ug+1LDE1nBU/kLXc+NCw4NRPl0Toi87jOqtU324YSX1bauYxccOzMh+9Mz8fK2tziS7g
	0Y/yDUnfMAGQCSRYZ9BDQH7AR2cRO+uz+ARyFpissd1B7uzhE2XOKyJx4ErOm4w6+OMi
	HhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gPFZzLw9iod/NVbn3dUUrkXlSR9N6XqIfq8Pb8Cu49A=;
	b=rGaW7RucRisJV5C+Rh/vckZQWBieexZQgdP0CSXWHQiP9JfEzDaJUp8dt3QwBro1h4
	O6gGC6Rg8tG1ecj2m87f+3HmWb/nDRgG0wRn6EyIEBjUTPKrBs80IFkvMTgnV/6DtruT
	t2PCTHUJK6sXBaO/FMVGGUzsPp8bwAYPBz5LAmne1iG9ORRWaJ6tZu6YNu6WeWgu4SbG
	KGF8BflZqAlX2fbpKXws1y9my0JzJ8qC+wI3pu5L3Mye9r0QKZgm2LYHhobqyyONIopa
	g/diWua+WzS+g7aiyQPEmsDDbwO7RS/GnD1rNF3cPuheZvGKGL1ouuMp290FOXxHrHne
	gxHA==
X-Gm-Message-State: AKS2vOwFWLe6FRAJB+wqXPWQB2gu+n6tEqu7n/XWjJyNChz2kzW2jpI/
	zgoCz5FkgHBcZXHbwnIuB4u2oh73uA==
X-Received: by 10.80.140.204 with SMTP id r12mr7875127edr.123.1498260072069;
	Fri, 23 Jun 2017 16:21:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Fri, 23 Jun 2017 16:20:41 -0700 (PDT)
In-Reply-To: <20170623141737.bksn4w2qbd7fyhzs@hiutale>
References: <20170622151404.27496-1-git@andred.net>
	<CAMKF1spVoW38edBHwvV8vGg9C00K1tQvqRC1LR2NXofZm5DkEA@mail.gmail.com>
	<1498214792.25895.23.camel@andred.net>
	<CAMKF1sowVfO=avnnSJtDhYi=nda0hU_htvcTcmtdWydCxzOqvg@mail.gmail.com>
	<20170623141737.bksn4w2qbd7fyhzs@hiutale>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Jun 2017 16:20:41 -0700
Message-ID: <CAMKF1spOU3HZ3JuG58CXzGrKgKmw79RcW+CzesouvQdBV+9Rjw@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: fix duplicate IFF_LOWER_UP DORMANT ECHO on musl
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
X-List-Received-Date: Fri, 23 Jun 2017 23:21:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2017 at 7:17 AM,  <Mikko.Rapeli@bmw.de> wrote:
> Hi,
>
> I'm chipping in since I've been messing with these things a bit in upstre=
am
> Linux kernel.
>
> On Fri, Jun 23, 2017 at 06:37:52AM -0700, Khem Raj wrote:
>> On Fri, Jun 23, 2017 at 3:46 AM, Andr=C3=A9 Draszik <git@andred.net> wro=
te:
>> > connman is not doing anything wrong here.
>> >
>>
>> yes I am aware of this
>>
>> > The kernel is redefining IFF_LOWER_UP, because it thinks the libc does=
n't
>> > define it yet (and glibc doesn't).
>> >
>> > libc-compat.h is the way to solve these kind of issues. There also is =
https:
>> > //lkml.org/lkml/2017/3/12/238 which is very similar. I'll pick that in=
stead.
>> >
>> see the comment https://lkml.org/lkml/2017/3/16/121
>> that worries me for this patch
>
> I'm aware of those review comments but I have not seen any patches posted=
 which
> fix the problem in some other way. Thus I would propose to apply these pa=
tches
> as a workaround until upstream fixes the issues.
>
> These header files do not change that often either.

problem is you become incompatible ABI forever that worries me.
However if bruce is fine to carry this patch as part of linux-yocto
I might relent. It still will be hassle where folks will have to apply
this patch to there kernels if they are building musl based systems.

>
>> I am not questioning the correctness of patch too. But
>> it would be better to get this patch accepted into kernel
>> before applying to OE since these are kind of patches which
>> you can get stuck with for life if upstream is not accepting it.
>
> Upstream-Status: Denied
>
> would be a correct marker for now I guess.

I would rather see some progress made to get it resolved :)
we need to actually remove glibc'ness completely from kernel.
and this will fix itself.
>
> Hope this helps,
>
> -Mikko

