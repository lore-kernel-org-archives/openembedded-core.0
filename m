Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id DB55A7821A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Jun 2017 00:54:01 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id x23so16273090wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 17:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4xpdCWLTxvpxkxpfWE0mx/SFnbA5KBPKEOZGDIslLM0=;
	b=liI7aI49+o/J8A6XOPRJ3OQFUGqels8Sn49rcVGpez83LUcOxW85YI4vSnoYYx5sII
	/OqfI7bOZNEPWg374Kgk7Q6WScUtOzPzdgExFREeSasK/GRRgMF7GNWrsT16tpwyVTwK
	Xg89g9Hb/dPNLt66ud7LpVTRS/9b2MsSJY7xqjjMGm32BQj0KAlGqOrHAGMLNDTjiWrC
	Qq4NieP9Vt3d3Ri5YuQ538JYZKyKxI4YsY9mcAhKBW4XIlC3PUBfJRhjQbvZFmP6pvu1
	PqyJ1bWc+a8zJ6FwqBq42AeE4QVDuK+kX0D6Nhya3Cfayi6mQf2h3fGrSuE5RKPxg5iz
	aNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4xpdCWLTxvpxkxpfWE0mx/SFnbA5KBPKEOZGDIslLM0=;
	b=C2AcMjpZgzUTvtlvZNLth4Zq81QsFLw35kpsgwf8NYnZpNFD89FYgUpMrxasgUmwxR
	jc+Yn4TdMv+WaY9A2wAhdOcS5a8CZGhonJ1SSBPwvCxxZQUIU1m9yO2aTuPdIGqPC7u1
	QGtmDKip2/KlUNhNIKEWPH1M0ia2o3fIaRLTprp+2u3+an478UCPtI3fWF9DV47eJMFc
	X7Z0e3NibiTLLB0D2YP44BbX4uof1TBCsQRPxIs00bG5yGEhHgWWSWpLC54hFsj8ho6J
	vIa/B/d8+DwsXc4hD8io0/7f9mM5AJLiUZrEq9l0SxH3ycXdMNS8TElS0k+qt2X0zjdt
	IGBA==
X-Gm-Message-State: AKS2vOxAQS5CvD2S7JUeiZ0mj3XpKBUL9srCBiAf4tFPO5vydQv5oCSL
	0cG4+NnK7peODgAK1BPCOoTLVoJplQ==
X-Received: by 10.28.153.213 with SMTP id b204mr6738217wme.96.1498265642255;
	Fri, 23 Jun 2017 17:54:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.176.170 with HTTP; Fri, 23 Jun 2017 17:54:01 -0700 (PDT)
In-Reply-To: <20170623234109.GF28053@denix.org>
References: <20170622151404.27496-1-git@andred.net>
	<CAMKF1spVoW38edBHwvV8vGg9C00K1tQvqRC1LR2NXofZm5DkEA@mail.gmail.com>
	<1498214792.25895.23.camel@andred.net>
	<CAMKF1sowVfO=avnnSJtDhYi=nda0hU_htvcTcmtdWydCxzOqvg@mail.gmail.com>
	<20170623141737.bksn4w2qbd7fyhzs@hiutale>
	<CAMKF1spOU3HZ3JuG58CXzGrKgKmw79RcW+CzesouvQdBV+9Rjw@mail.gmail.com>
	<20170623234109.GF28053@denix.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 23 Jun 2017 17:54:01 -0700
Message-ID: <CAJ86T=X3x7-Ndb2jC=U=6hrrrMCjTOEUWtv1G4i78UR25LZCGQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
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
X-List-Received-Date: Sat, 24 Jun 2017 00:54:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2017 at 4:41 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Jun 23, 2017 at 04:20:41PM -0700, Khem Raj wrote:
>> On Fri, Jun 23, 2017 at 7:17 AM,  <Mikko.Rapeli@bmw.de> wrote:
>> > Hi,
>> >
>> > I'm chipping in since I've been messing with these things a bit in ups=
tream
>> > Linux kernel.
>> >
>> > On Fri, Jun 23, 2017 at 06:37:52AM -0700, Khem Raj wrote:
>> >> On Fri, Jun 23, 2017 at 3:46 AM, Andr=C3=A9 Draszik <git@andred.net> =
wrote:
>> >> > connman is not doing anything wrong here.
>> >> >
>> >>
>> >> yes I am aware of this
>> >>
>> >> > The kernel is redefining IFF_LOWER_UP, because it thinks the libc d=
oesn't
>> >> > define it yet (and glibc doesn't).
>> >> >
>> >> > libc-compat.h is the way to solve these kind of issues. There also =
is https:
>> >> > //lkml.org/lkml/2017/3/12/238 which is very similar. I'll pick that=
 instead.
>> >> >
>> >> see the comment https://lkml.org/lkml/2017/3/16/121
>> >> that worries me for this patch
>> >
>> > I'm aware of those review comments but I have not seen any patches pos=
ted which
>> > fix the problem in some other way. Thus I would propose to apply these=
 patches
>> > as a workaround until upstream fixes the issues.
>> >
>> > These header files do not change that often either.
>>
>> problem is you become incompatible ABI forever that worries me.
>
> +1
>
>> However if bruce is fine to carry this patch as part of linux-yocto
>> I might relent. It still will be hassle where folks will have to apply
>> this patch to there kernels if they are building musl based systems.
>
> Don't forget that not everyone is using linux-yocto kernel!

Neither is linux-libc-headers, so getting these musl patches into the
linux-yocto kernel isn't going to change much...

>> >> I am not questioning the correctness of patch too. But
>> >> it would be better to get this patch accepted into kernel
>> >> before applying to OE since these are kind of patches which
>> >> you can get stuck with for life if upstream is not accepting it.
>> >
>> > Upstream-Status: Denied
>> >
>> > would be a correct marker for now I guess.
>>
>> I would rather see some progress made to get it resolved :)
>> we need to actually remove glibc'ness completely from kernel.
>> and this will fix itself.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

