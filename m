Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id ABC877600A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 01:49:32 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id t39-v6so6355275qtc.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 18:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=74kNZukaB130eaJJLtjLgiGmRJYv/IfdxSOlLyMtCxE=;
	b=iYv+S7rmJDkAp4QX9qxBDwgB5oWlavZEnqLuZLXmN9iJgUPyv9Rr9wpRgexim9/4xW
	KNxgmYhn/WafJ7z8TUi6A7PXhAiNrKYD/W+Nog5eBVay2qiTEModVmTvAg7DvLgBNZ53
	lEEIfRP+Fy78TYwR6Mpeyosil1LWRUtb8roauzJZdPBM1yATvoumRvNLXkXOo0JJ0neL
	dQbbhF6Y+Z8biU0ZfGoPIrpA6tnZrjoGW7FYodVkUJZvNNq5cps+38UYugNg5zV/nRFk
	YYzaOIl6oggJmN420AZi7XvorzQQqOSrgCA4s6pJtAoGb/TqP4enIZCu/0wK8SbGrC55
	GfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=74kNZukaB130eaJJLtjLgiGmRJYv/IfdxSOlLyMtCxE=;
	b=mOUuLLXAe0ak3lmbm9u0RH6wBqrdYRRGcrVTWEufnDf6uDegux+qk7Cekx+6T/qgy/
	hzpJCBpzFsaBQmVeyCbX/D3SQTVuoAVygsmljVRhaWBRTcTRQ7fGX91HZOnQNrSR1iJI
	4U8cvHZChF1Bhw4xjMoYjSlLiHXyf1O1WtdQqjWNyJj7hdcgx+G5ZuQXcxCmnmxYqEwN
	FoxciG7JMT3HpUpgs13SAUaVezZqF+n6p8OmKZbmOlC4EWgq14eRVoGP5OWmEIvIkZ6q
	ZmeJQz07FhECQXpAP4JhDCPSHz3jK4owIzrCalg087ADuQLBZZAD1FXm+31CoeLtTG5U
	t4Wg==
X-Gm-Message-State: APzg51A2gg6uBT6tYhuj5FCsBDJkqqFDIOJZmAsyXqudAgML/0YrdSOX
	DrV8oyUgG5xijAdsddj5/Wx0IMLUY3jQ7tHlo54=
X-Google-Smtp-Source: ANB0VdaY2fSXeOm5JGDCQzJzIlfJVr0uHwuf5IzUttOAQy9Xn+oGl8JmNqRFP55uwwEBdflPBtrVU1EjyU2wLkdGwsc=
X-Received: by 2002:ac8:c0e:: with SMTP id
	k14-v6mr32249173qti.20.1536112173183; 
	Tue, 04 Sep 2018 18:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
	<CA+chaQfSBfzWoDKkWH0arU388zqewFMVKQ+bJwo4TMABZhAiog@mail.gmail.com>
	<a12df2950bb8cbe607429ba26247543ba63367af.camel@linuxfoundation.org>
	<CAMKF1spTfZD2B19zQFH+PhAytChCe1k-05ma2QQ9TCVp3TNrgw@mail.gmail.com>
	<fbe407b0f91278f2d416884eb1d737af30a20808.camel@linuxfoundation.org>
In-Reply-To: <fbe407b0f91278f2d416884eb1d737af30a20808.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Sep 2018 18:49:06 -0700
Message-ID: <CAMKF1sp9uBnKKKu5nTKu_dS2=onTJvOgeroNDQtNx4DrWqBeRg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Wed, 05 Sep 2018 01:49:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 4, 2018 at 3:58 PM <richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2018-09-04 at 13:43 -0700, Khem Raj wrote:
> > I pointed this earlier before merge as well
> > meta-openembedded has 40 odd recipes failing due to openssl 1.1
> > upgrade
>
> Sorry, I think I missed something somewhere as I thought the
> indications were the bigger problems like qt5 were working now :/.
>
> > http://errors.yoctoproject.org/Errors/Build/67457/?page=2&limit=50
> >
> > so obvious fix was to keep them pinned to openssl10 and i created
> > couple of fixes
> > to start
> >
> > https://patchwork.openembedded.org/patch/154517/
> > https://patchwork.openembedded.org/patch/154516/
> >
> > and the effects are showing up where sysroot task now starts to fail
> > for dependent
> > recipes here
> >
> > http://errors.yoctoproject.org/Errors/Details/190427/
> > http://errors.yoctoproject.org/Errors/Details/190433/
> >
> > in meta-oe certain recipes can be upgraded and we can get openssl 1.1
> > support
> > but others like the two examples I cited above do not have openSSL
> > 1.1 port.
> > so I think we can not live without openSSL 1.0 and OpenSSL 2.0 being
> > able to
> > co-exist.
>
> The latter link is php 7.2 which should have openssl 1.1 support
> (https://bugs.php.net/bug.php?id=72360).
>
> For the former, libgdata doesn't have an openssl depends so I guessed
> at liboauth pulling it in which does have an openssl 1.1 patch at:
> https://github.com/x42/liboauth/issues/9
>

Thanks for pointers and they do help. However IMO the problem that
Martin decribed
is going to be a real blocker. Unless we can provide a solution to let
both openssl versions
coexist, this change is going to be problematic since we maintain
several old recipes which
would have to be fixed for openssl 1.1 and this can take time, right
now we are only seeing
meta-openembedded layers, we don't even know all other layers which
might get into similar
issues.

