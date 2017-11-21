Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 245F8785BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 03:27:19 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 5so397380wmk.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 19:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Gkjuwf9OW6qi7TGeFrxF9OaauVTHrg8SAd85pTCxBp8=;
	b=Aa/owIDeqrcCeCGKsKEnEGyc96lN88YSosPk2hftrQGaNFddshJuWAlLjGqmtpDhWR
	GegULFxJTey1zG4q0wFdAlyI/eZ1FZb5w/r++M/7BSaa9E6wnQt7POWm5pF6DCQeXHPr
	d/5x0cgc8GCoxUSsC0dXmy4q4U8F46kP8LtlTpwgm80aDpJZ/kTDMBTXhy6uIalBzLwH
	gRyIFenk9pkDmXl5wBktlWJ9OTq0A+gDLhBOS6LPBcUXge8uX5SyVfbJQwyaZHOgdq4y
	my815K2VMbLhsOsIK/jDduYCIIVD5UhBJcoQ6kP6dseeh0nKJIGtElhEszVkqhPh7etG
	kzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Gkjuwf9OW6qi7TGeFrxF9OaauVTHrg8SAd85pTCxBp8=;
	b=BcAnMhGq27SGoNbb2sNA33LvyCWPc+OQQp9oovbr4BunW/Q8aKV98zRMjl35M5FSnb
	C1Kc7TGmFM1oJ79H/Y9NphEsr0Zjs8sADuv/iyO3802v1UWcy6vjwi+Mo9uwVzNhMaFa
	d8hpy5Tja6Wwd2sT48E4hssexhC8+vAzpS2cOB5lJ2px+vKM02xV6cALOrSu+bPQk3aP
	nZFw0zDRH3CUIScPmems6iOWmuDUf3p1wy/muqGi6ntTv0u80CFFTOR5pflDBBiSX2Gf
	dYrAdW2lZB4uMtj1OKPQpYwu+r95ovCubwJ9jOqDd3SVq4ZyyZ4kNSJOcoRvOITp1Gv0
	n7bA==
X-Gm-Message-State: AJaThX6/IzlOdFKEPZyKmpSu8lGu9cIscNOtyjc/pdvW5cM8jhJeMFfW
	5h2MUigNoUwYR1/AnO5Mqp9JAdvavJUZyVf93HI=
X-Google-Smtp-Source: AGs4zMbhfkHN/Ct0MFWSzFTZI5c4BjM8BWbhpRAf2ymxQfC3ICPmnwA6ZJfvNf76sfGW+JAdCXuZxWK1lNX53Dkn2Mc=
X-Received: by 10.28.127.197 with SMTP id a188mr48291wmd.138.1511234840743;
	Mon, 20 Nov 2017 19:27:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Mon, 20 Nov 2017 19:27:20 -0800 (PST)
In-Reply-To: <c6cfdf1e-010a-0257-b1f9-465159db5a1d@windriver.com>
References: <cover.1495183828.git.kai.kang@windriver.com>
	<d0db7f059097d0271e5808dda280140ef49aae6f.1495183828.git.kai.kang@windriver.com>
	<CAJTo0LbxO83ka-W2znsakpTwOejgoJzmxFuehogFk5oDhZct2Q@mail.gmail.com>
	<c46b6cd7-cf25-8fd6-789f-c9cfbcbf9026@windriver.com>
	<726d845f-268e-0f27-bcd7-c6b2fd9f4c53@windriver.com>
	<CAJ86T=UMd9D-_WZ3um3Yg6+yKRFJyToLhNjZw90U0LUujTGfgg@mail.gmail.com>
	<9dabcc17-148f-a0d9-d9d6-3abcd2836ea0@windriver.com>
	<c6cfdf1e-010a-0257-b1f9-465159db5a1d@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 20 Nov 2017 19:27:20 -0800
Message-ID: <CAJ86T=WWKg09a61wi2ju+FkO3y1QnsiQiOsxzVh4=qRAzssBjA@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bind: build with threads and update configure options
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
X-List-Received-Date: Tue, 21 Nov 2017 03:27:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 19, 2017 at 10:56 PM, Kang Kai <Kai.Kang@windriver.com> wrote:
> On 2017=E5=B9=B411=E6=9C=8817=E6=97=A5 09:46, Kang Kai wrote:
>> On 2017=E5=B9=B411=E6=9C=8816=E6=97=A5 18:27, Andre McCurdy wrote:
>>> On Fri, May 26, 2017 at 8:24 PM, Kang Kai <Kai.Kang@windriver.com> wrot=
e:
>>>> On 2017=E5=B9=B405=E6=9C=8823=E6=97=A5 17:58, Kang Kai wrote:
>>>> On 2017=E5=B9=B405=E6=9C=8819=E6=97=A5 19:47, Burton, Ross wrote:
>>>> On 19 May 2017 at 09:52, <kai.kang@windriver.com> wrote:
>>>>>
>>>>> Build without threads for bind is inherited from legacy openembedded.
>>>>> All libc's support proper threading on Linux now, so enable threads
>>>>> support for bind.
>>>>>
>>>>> It is also need to disable static library build which cause package
>>>>> dhcp
>>>>> fail to build after enable bind threads support.
>>>
>>> It seems this change was made without taking into account the advice
>>> given in:
>>>
>>> http://git.openembedded.org/openembedded-core/commit/?id=3Df28757a4b894=
47ea528cba987f0396b92aa0bbfe
>>>
>>> "If and when we ship bind's shared libraries we should ensure that the
>>> libraries go into a separate package."
>
> Libraries are packaged to bind-libs which has been created by :
>
> http://git.openembedded.org/openembedded-core/commit/?id=3Dd74ebc91388941=
295a2321a295cdb06ee87fc38b
>

Looks good. Hopefully it gets pulled into rocko soon.

