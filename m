Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF48751AE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 04:54:55 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id t5-v6so6708836qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 21:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p8vCAA0xdOsnvU57MjRrPtmgCgorLbW93W88EOOnAZY=;
	b=Si7Zw2nNmvgK4Lum+3lc9Rn9pIs7vYOvgZI1h99DQnlibrepN8IDHaiyYrxVcrfiYO
	SyS36c5KwH6xxCJUTExgGpEZqSNHpqWewfLiXajzHp7l6b7OPsuf9fMJKeEvvEQgT/sU
	+7keupk1W2jgkenUgZn8WI5pVfzD/8GTDRF0aFV/+iqn1xYuXDtnaEIyC779BXohTvGX
	8b8YvhadIzXTo/lLM/y6ruvg/6hEl7XJDaRlpOLMYvpeDOiZm7yoWB7J7A2Y2nnmGGaU
	ehWckI9zo1+gGWGP7/eUFKW7ehx90Le970SCT7OZBqiwYyo1F1/h49JEcztA1az2RaJp
	DZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p8vCAA0xdOsnvU57MjRrPtmgCgorLbW93W88EOOnAZY=;
	b=elTqq0uo74HcnSVpIFDuh3NADsroBYAbe43nq354YygnRpLN6eRyXJdZDvjaqf0Qr4
	Ch8v8oIzqSmjiS2lwmrxvLedIW3951kaBGeW/HCAUVRfvfxdlZwsk3AKJQhzkxewDoeI
	U9WQQOZQCjJU/KZMqTveA1sNrUdAA5/HhF+q31ghMtaZikrvSdINheZA5oVo7kZ+lt+h
	s0RFXt/G8JH3KjadjcuU4bATA3n5R8T4ImcG5WrCVdqsy0BNcIKWqmDsxIPPUu9jNF/5
	D79vxM6kNMZaVw/PR85TCbxx8eT4MfpKXTqc7T3uJMYcDwTy/FGO8pPF+YQKqSFj0CGg
	Fniw==
X-Gm-Message-State: APzg51ARYqw3zuWqkmoBWYID0I9cMV1bRPfTi0R6Bg/XcLOjbrnaKB7D
	aXPvETJg6mL9iNjH3RnLspz1D01AC0fwv0fONFE=
X-Google-Smtp-Source: ANB0VdYfckOPuuy2UlvpOCUXGy21n5X6wODQAk4lvoyBYBokiPKUyE5wnIUL0WXUc1p2AxKY5eXS7/2pjSodeYRODGs=
X-Received: by 2002:ac8:18f1:: with SMTP id
	o46-v6mr33400303qtk.256.1536123296680; 
	Tue, 04 Sep 2018 21:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
	<CA+chaQfSBfzWoDKkWH0arU388zqewFMVKQ+bJwo4TMABZhAiog@mail.gmail.com>
	<a12df2950bb8cbe607429ba26247543ba63367af.camel@linuxfoundation.org>
	<CAMKF1spTfZD2B19zQFH+PhAytChCe1k-05ma2QQ9TCVp3TNrgw@mail.gmail.com>
	<fbe407b0f91278f2d416884eb1d737af30a20808.camel@linuxfoundation.org>
	<CAMKF1sp9uBnKKKu5nTKu_dS2=onTJvOgeroNDQtNx4DrWqBeRg@mail.gmail.com>
	<CAJ86T=V2QTuiz=KzNzZeyLKyvZd6m+ZPKmkP+tZwhfM_=fTASg@mail.gmail.com>
In-Reply-To: <CAJ86T=V2QTuiz=KzNzZeyLKyvZd6m+ZPKmkP+tZwhfM_=fTASg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Sep 2018 21:54:30 -0700
Message-ID: <CAMKF1sqWuf8sQj7TA_G-prWpOB5mtXo7F8k_K0bj2ufHXRa6Yg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/6] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Wed, 05 Sep 2018 04:54:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 4, 2018 at 9:08 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Tue, Sep 4, 2018 at 6:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Tue, Sep 4, 2018 at 3:58 PM <richard.purdie@linuxfoundation.org> wrote:
> >>
> >> On Tue, 2018-09-04 at 13:43 -0700, Khem Raj wrote:
> >> > I pointed this earlier before merge as well
> >> > meta-openembedded has 40 odd recipes failing due to openssl 1.1
> >> > upgrade
> >>
> >> Sorry, I think I missed something somewhere as I thought the
> >> indications were the bigger problems like qt5 were working now :/.
> >>
> >> > http://errors.yoctoproject.org/Errors/Build/67457/?page=2&limit=50
> >> >
> >> > so obvious fix was to keep them pinned to openssl10 and i created
> >> > couple of fixes
> >> > to start
> >> >
> >> > https://patchwork.openembedded.org/patch/154517/
> >> > https://patchwork.openembedded.org/patch/154516/
> >> >
> >> > and the effects are showing up where sysroot task now starts to fail
> >> > for dependent
> >> > recipes here
> >> >
> >> > http://errors.yoctoproject.org/Errors/Details/190427/
> >> > http://errors.yoctoproject.org/Errors/Details/190433/
> >> >
> >> > in meta-oe certain recipes can be upgraded and we can get openssl 1.1
> >> > support
> >> > but others like the two examples I cited above do not have openSSL
> >> > 1.1 port.
> >> > so I think we can not live without openSSL 1.0 and OpenSSL 2.0 being
> >> > able to
> >> > co-exist.
> >>
> >> The latter link is php 7.2 which should have openssl 1.1 support
> >> (https://bugs.php.net/bug.php?id=72360).
> >>
> >> For the former, libgdata doesn't have an openssl depends so I guessed
> >> at liboauth pulling it in which does have an openssl 1.1 patch at:
> >> https://github.com/x42/liboauth/issues/9
> >>
> >
> > Thanks for pointers and they do help. However IMO the problem that
> > Martin decribed
> > is going to be a real blocker. Unless we can provide a solution to let
> > both openssl versions
> > coexist, this change is going to be problematic since we maintain
> > several old recipes which
> > would have to be fixed for openssl 1.1 and this can take time, right
> > now we are only seeing
> > meta-openembedded layers, we don't even know all other layers which
> > might get into similar
> > issues.
>
> To be clear, the issue is ( foo depends on openssl 1.1 and bar ) and (
> bar depends on openssl 1.0 ), right?

yes.

>
> Anyway, just for reference, it looks like Debian is packaging both
> openssl 1.0 and 1.1:
>
>   https://packages.debian.org/source/sid/openssl1.0
>   https://packages.debian.org/source/sid/openssl
>
> In the case of liboauth, they avoid to need to patch by configuring
> liboauth to build with nss instead of openssl.

this is already taken care see
http://git.openembedded.org/meta-openembedded-contrib/commit/?h=kraj/master&id=b1f87edc4202d6238c469dde358819c534b35751

but thats just one case.

