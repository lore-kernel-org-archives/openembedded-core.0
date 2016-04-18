Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id B6E2460116;
	Mon, 18 Apr 2016 19:48:55 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id e185so24195785vkb.2;
	Mon, 18 Apr 2016 12:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=8ld1aoC53j+Tv+fnD+71yHrYrA32ds6j7ogdYLsXVMk=;
	b=MZBlR180FhKcuiL2L71JmUp8QWah36pVEhacV8eejjHKINucdh/5KyUpXMa4nN+PUR
	sTG6hWtZFcpEf/mzqRr6UUL20fcP8JWhm17XGrgTjQrRlO14SgU8YVAB/nKMtNccHoSP
	Kl7ZOb8aVdAh+5vfJK7Ukr1wU/HTH4u3Y0+DHVaeLy8NemJQMX+gni4uOBd6JgJgn/rG
	SayGI5IbJy4W//rhJD2gUMwfSBiyVjQiAn/1AL5RVswyK/ZDe3QIGprvstm0Gsu9S8JG
	15sIT3cfrCSRNui5hWSM4dbf4vJTjKScpfgLPBNlWFDlU3vbWUlyLNhfxf29wEQXHV89
	h8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=8ld1aoC53j+Tv+fnD+71yHrYrA32ds6j7ogdYLsXVMk=;
	b=VFJbcI162bjOeDyF3z1uzgYIAfvdABsk9cr9QALqryxeBPHqpiIkFNjYLCU59mpwQ5
	3huUGmXnRu6D7/GiGTGGST7swUDMQkODalZLoG7a0MeS+3sUD15lT9smu7jGzFXdZTsC
	mbh51CB8E0HjBbi41g+WoH7KOLhEiS0mPOUWOkOUlRIgt/oJjOoOvSgPhLD5ZPc6mDmc
	gebl+BTOu5/5wbrstmDMcjCI6+fCHkTms0nPbVFuDuAbc4Hih+Zww45cFyPTVG558tDl
	6JiVRga7c/mdR4URI5JPOAFkc35KKypWt75FIV9wO1Kq61IEcD83IDyJqtYoYO11jy4A
	ZtlA==
X-Gm-Message-State: AOPr4FWnWUk2aW2lgQ5BcGF17WARgeDzx/D/eYVTz+nxX+wM7pwzaFIVcf3clc+PipWgkubWeFP6PVnhQnuKOA==
MIME-Version: 1.0
X-Received: by 10.159.36.144 with SMTP id 16mr2544890uar.98.1461008936026;
	Mon, 18 Apr 2016 12:48:56 -0700 (PDT)
Received: by 10.103.94.2 with HTTP; Mon, 18 Apr 2016 12:48:55 -0700 (PDT)
In-Reply-To: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
Date: Mon, 18 Apr 2016 13:48:55 -0600
Message-ID: <CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 6 Recipes
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
X-List-Received-Date: Mon, 18 Apr 2016 19:48:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 17 April 2016 at 23:15, Khem Raj <raj.khem@gmail.com> wrote:
> Hello all,
>
> I have put together a potential gcc6 upgrade recipe set, and pushed the b=
ranch to tree here
>
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-6
>
> and also at github fork of mine.
>
> https://github.com/kraj/openembedded-core/tree/kraj/master
>
> You need to set
>
> GCCVERSION =3D =E2=80=9C6.%=E2=80=9D
>
> in local.conf to enable it.
>
>
> There are few recipes in OE-Core which still don=E2=80=99t compile e.g.
>
> see
>
> http://errors.yoctoproject.org/Errors/Build/14782/
>
> any help in fixing them or otherwise fixing other layers is appreciated.
>
> gcc6 is a major release for some info see
>
> https://gcc.gnu.org/gcc-6/changes.html
>
> and porting guide
>
> https://gcc.gnu.org/gcc-6/porting_to.html
>
>

I haven't built an image with gcc6 as the compiler yet, but I did
check out your branch to try building with gcc 6 as the host compiler
(Fedora 24). I needed a few more fixes, available at
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Ddankm/gcc-6.
I fixed lzop, pkgconfig, and disabled werror on binutils.
core-image-minimal appears to be well on its way to building.


> Thanks
>
> -Khem
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

