Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9ECA1601F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:57:36 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id p9so387983vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 05:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=t/S7Rv6Hy4YBE5cp27PxoiFxtaQTzAt+Dtv9wL/xRkg=;
	b=YyscYZH0xcK7XxIyqUf12ayy65JfFN7DoSM9yEuXtIXuYLBsvKNOqHv/xCLRDT8btc
	jIk65FsuQPzkGVfluxmLUmm8Jz7kF/wfThmHv8IhisuWY+Zn8rw1Vf7us0e38a1/djlA
	dPLOSmIIYCDzT/rXG4ufCedAaHa2HJcATBjNuQCG+REXFDIFf4erDV4eZu4uo2VYEcfc
	eM/DdoojKIK6EI0ygRgY+hl4/caYvJa3mwjfsOx4gov2ilWF48XJ1C2Ax6Hkznjodro9
	vkBvtWJnZz56D50LuYrF5zTwADrs6zRug0UD48pSvmJy3dfXD9/rtFcCF9kV2YwoPs1w
	GEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=t/S7Rv6Hy4YBE5cp27PxoiFxtaQTzAt+Dtv9wL/xRkg=;
	b=HzC2PfnCcyYmNQIkcxwmGWgZVDuY0WV+PwOaI207a6IfORRnqhcS/RC3+GJnPpVSq7
	bWEiV+KGw+tf0T/g+Kc75AYHiW2f9VFEF0Z7kTWzYjgpqAlc8jNemH6kP18mcm6EDcat
	lnBuN1mwXUkBJ/7R/M2T6WtBzYQR2GjCM9raIzS6vgBEFuVj0vzX/8W3wEnVWmLP3L3d
	q7ao7X5fx4LiuGQDWQQvsJNiayHeFpuVWP0npcspnc6va3MEhVVJdIge7XLK5Db9ejLM
	tukNZlzbS8f3SyiQDWx+XlYa0DUhjScpNc7nPSgXwBHnabLlnE/RNmZ8yDfbY8Zzvglk
	GAPA==
X-Gm-Message-State: AKaTC02FKaMGXN2x1O0GB4TbHgEXS0ZSrEUPJny6S/3Sks+qvvzkuSqD8l1gOilv5Cd5nQ==
X-Received: by 10.31.96.202 with SMTP id u193mr1169822vkb.53.1479909457032;
	Wed, 23 Nov 2016 05:57:37 -0800 (PST)
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com.
	[209.85.213.45])
	by smtp.gmail.com with ESMTPSA id e34sm8515636uae.1.2016.11.23.05.57.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 05:57:36 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f45.google.com with SMTP id w194so8259415vkw.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 05:57:36 -0800 (PST)
X-Received: by 10.31.175.8 with SMTP id y8mr1136585vke.131.1479909455768; Wed,
	23 Nov 2016 05:57:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.151.16 with HTTP; Wed, 23 Nov 2016 05:57:34 -0800 (PST)
In-Reply-To: <CABcZANmw1GUVVRiGJ-pv6PLgO247GR9Z9tPPaTerm9RKOkROYA@mail.gmail.com>
References: <1479396394-26134-1-git-send-email-fabio.berton@ossystems.com.br>
	<CABcZANmh+pV4Xxwi2UY7fA+BctpVXRvM6gLcgMJEx-rwODMi4g@mail.gmail.com>
	<CAAPZna2pDLyq6PH6sb8c0J_Bxa2Pi+FNNZw_tVJ38o90mGsEJw@mail.gmail.com>
	<CABcZAN=55DOHHy0fMJi6pPaR+TuwgwfErOd7YBAN=s_e9D0rwA@mail.gmail.com>
	<CAAPZna2dHKqh-rDSo6UGu0uP=CBLRHaGbhC-c=OisccQ4HUUsQ@mail.gmail.com>
	<CABcZANnL5MxwQmiZZ0i8CGHaYxsD9zapNfcyB_a37OoigHq2oA@mail.gmail.com>
	<CAP9ODKr7igkbbvi2tu6qwAv+gVLbty0HrkfF30cDtiG+5xqdWQ@mail.gmail.com>
	<CABcZANmw1GUVVRiGJ-pv6PLgO247GR9Z9tPPaTerm9RKOkROYA@mail.gmail.com>
Date: Wed, 23 Nov 2016 11:57:34 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqhsjyD-_BOaVPVTwSq5mRe6KnOPmQ6R85U2+njzK9X9g@mail.gmail.com>
Message-ID: <CAP9ODKqhsjyD-_BOaVPVTwSq5mRe6KnOPmQ6R85U2+njzK9X9g@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpcap: Fix build when PACKAGECONFIG ipv6 is not enable
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
X-List-Received-Date: Wed, 23 Nov 2016 13:57:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 11:41 AM, Christopher Larson
<clarson@kergoth.com> wrote:
>
> On Wed, Nov 23, 2016 at 3:00 AM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> On Thu, Nov 17, 2016 at 2:24 PM, Christopher Larson <clarson@kergoth.com=
>
>> wrote:
>> >
>> > On Thu, Nov 17, 2016 at 9:21 AM, Fabio Berton
>> > <fabio.berton@ossystems.com.br> wrote:
>> >>
>> >> No, I created a patch, git format-patch and then edit generated files
>> >> with
>> >> Upstream-Status tag and added to recipe. Is this wrong?
>> >
>> >
>> > As I indicated in my first reply, it=E2=80=99s best to put the tag out=
side the
>> > generated patch (above it, or below the =E2=80=94-), as it isn=E2=80=
=99t part of the
>> > commit,
>> > only part of the patch file. It=E2=80=99s minor, and you don=E2=80=99t=
 need to
>> > re-submit,
>> > but in general the tag is not part of the commit message. For example,
>> > if
>> > your patch was applied to a git repository with git-am, it=E2=80=99d b=
e in the
>> > commit message, which should not be the case.
>>
>> To be honest, there a many files which does as Fabio did and I also
>> personally do as well. I don't like it outside of the commit log as it
>> looks out of context.
>>
>> If someone is getting the patch file, it is expected they will review
>> it and not blindly apply it on upstream repository.
>
>
> I don=E2=80=99t feel too strongly about it, if that=E2=80=99s the consens=
us, that=E2=80=99s fine, I
> just wanted to open up a dialogue on the subject. Thanks.

Me too; but if this need change we need:

 - update the guidelines
 - migrate current patches to use the new format
 - ask Richard and other reviewers to start to enforce the new policy

In any case, I think this is not needed. The current way is good enough for=
 me.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

