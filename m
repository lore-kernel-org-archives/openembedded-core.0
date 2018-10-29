Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7ADCD79101
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:40:34 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id q41-v6so9966747qtq.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=X+yyNosNQuNrAH+IXnTHP4GYxP5+ghRInRSYjM0e4EE=;
	b=KER5icAXICnx6XfqzdaKg1FaQMsWr1HkDScGuSvtIYjp6gIsQIfVJhyzgxNHw4j4CF
	bf/lQ57Kkj/glTCCfOf1TBSGevgQg+NJTfWKdNBfkq/LsDafnGktoNv3ZFe4qCsA18JO
	7ftHOKx7JY3AmxtuGOyFfxEeQ+MwQLZchxUMQIleMXeNT9N05hZFBqe+tAjV4wM7sBZX
	cjSza4DE9BeeHbEWqzgWz0RBHOJ+th3ga2wsRotCucX+fCmNDKKh7n7adASTMqF5sjzG
	lXKp8+HrCrUAd70phVrQj/nqcUByUJQngZWXrGv4ZU/0S0O0Fx0Unu0XocJkSiCD/Lzz
	RiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X+yyNosNQuNrAH+IXnTHP4GYxP5+ghRInRSYjM0e4EE=;
	b=RGcSlpNbFrZFS33gdeq8pyk0Q8w6e2DYurK41nck5sDpMpezUhaHTungcT2dlcVaoy
	DdqXKD4qg8MTMeIztCLPogrF8U5lb9go29vVLAdZ08irtaRnSEsZoD3uBPjB4etrZn09
	1e10IlbyORpAD50VcRl1FuxXLj7iaExQYdFrW2URC/G2zHqkKfQik6az7iHvYRWB5Xlz
	xUAY/hCXF+9kOJMYZJ+oxvoRrs9KXD8mHTKepVIc/Os3xj5fidOsOSGAIMXUW42fuLbl
	rww/2KtZR5zSpdxHrHoqO+EOopZc0PzfBqWv+zlcH2wSne9hN0vjsMSjRRHaOaSWNNfK
	3xuw==
X-Gm-Message-State: AGRZ1gI3Y8yBazbaiL+kzWSKV755RJIP38FOtS1oi/GAgR44Yc4XQTf6
	lNbkn91/qU1Lpq6Ykv3cELy4x0ePPvOCX+9yF/k=
X-Google-Smtp-Source: AJdET5fLxnAhwrl/Hyt2eA3EFnW7Wx34+b3/6tpNKHvvW/NcVD+ijCPtajtapHWN0DMnS20nixYck74yTupzfoYtENw=
X-Received: by 2002:a0c:ad47:: with SMTP id v7mr13816644qvc.228.1540831235250; 
	Mon, 29 Oct 2018 09:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <1540351835-16861-1-git-send-email-changqing.li@windriver.com>
	<46d200d7ef4c6399ccc99801674fb203916555c6.camel@linuxfoundation.org>
	<3746db69-c37e-4500-4780-bfe24bdafdd2@windriver.com>
	<CAMKF1sqhaOzFwUy2fjJwH9c2AZh39jbBMeSfZYOY3MkW_+kX7w@mail.gmail.com>
	<08d89f07eca5ba249ab527f83f258cd45d7cb70d.camel@linuxfoundation.org>
In-Reply-To: <08d89f07eca5ba249ab527f83f258cd45d7cb70d.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Oct 2018 09:40:09 -0700
Message-ID: <CAMKF1soK411nrFbwT80_ZAUxUeHfYw9f41qQ0NF9BzbVgrB45g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: fix occasionally install fail for parallel build
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
X-List-Received-Date: Mon, 29 Oct 2018 16:40:34 -0000
Content-Type: text/plain; charset="UTF-8"

Cool, thanks for update I will chime in
On Mon, Oct 29, 2018 at 9:30 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2018-10-29 at 09:18 -0700, Khem Raj wrote:
> > On Tue, Oct 23, 2018 at 11:53 PM Changqing Li
> > <changqing.li@windriver.com> wrote:
> > >
> > >
> > >
> > > On 10/24/2018 02:04 PM, Richard Purdie wrote:
> > > > On Wed, 2018-10-24 at 11:30 +0800, changqing.li@windriver.com
> > > > wrote:
> > > > > From: Changqing Li <changqing.li@windriver.com>
> > > > >
> > > > > when do parallel build, like run "make install -j 48", openssl
> > > > > will
> > > > > do_install
> > > > > failed with below error:
> > > > > mv: cannot stat 'openssl/1.1.1-
> > > > > r0/image/usr/lib/libcrypto.so.1.1.new': No such file or
> > > > > directory
> > > > > Makefile:318: recipe for target 'install_dev' failed
> > > > >
> > > > > problem caused by target install_dev and target
> > > > > install_runtime, both
> > > > > installed
> > > > > libcrypto.so.1.1, result in log:
> > > > > *** Installing development files
> > > > > ...
> > > > > install libcrypto.so.1.1 -> /var/tmp/foo/lib/libcrypto.so.1.1
> > > > > link /var/tmp/foo/lib/libcrypto.so ->
> > > > > /var/tmp/foo/lib/libcrypto.so.1.1
> > > > > ...
> > > > > *** Installing runtime files
> > > > > install libcrypto.so.1.1 -> /var/tmp/foo/lib/libcrypto.so.1.1
> > > > >
> > > > > command in install_dev and install_runtime will have parallel
> > > > > competition.
> > > > >
> > > > > have create an issue to upstream:
> > > > >
> https://github.com/openssl/openssl/issues/7466#issuecomment-432148137
> > > > >
> > > > > but upstream won't support this condition, so use this fix as a
> > > > > workaround to fix the problem.
> > > >
> > > > This means that:
> > > >
> > > > a) Upstream don't support parallel make install
> > > > b) Reject patches fixing any bugs in parallel make install
> > > >
> > > > This means the Upstream-Status should be rejected with the link
> > > > above,
> > > > not pending. It also means we may need to think about not using
> > > > parallel install although since its working, its tempting to
> > > > carry
> > > > patches and keep using it if it works.
> > > >
> > > > It may be worth pointing out to upstream that it is mostly
> > > > working for
> > > > us? I am a little worried they know something we don't about
> > > > problems
> > > > this could run into.
> > > >
> > > > Cheers,
> > > >
> > > > Richard
> > > >
> > > >
> > >
> > > I will point out to upstream that it is mostly working for us,  and
> > > ask upstream suggestion about potential problem of parallel build.
> > >
> > > if upstream think no obvious potential problem can seen,  I will
> > > change
> > > upstream-status to reject and resend the patch.
> > >
> > > if upstream recommend not to do parallel build,  I will add
> > > something
> > > like below
> > > to stop parallel build for make install, and resend the patch, but
> > > in
> > > this case,  build
> > > openssl  will very slow.
> > >
> > > ifneq ($(filter install,$(MAKECMDGOALS)),)
> > > .NOTPARALLEL:
> > > endif
> >
> > I think its best to convince or follow upstream here. Making install
> > target as serial might be best approach if there are other issues
> > with
> > parallel install that upstream is uncomfortable with such a patch we
> > should try to find more.
>
> If you follow the upstream discussion they originally said no, then
> they are possibly reconsidering after I explained more about the
> situation. I've not seen a fix land yet but they did say they are
> working on one.
>
> If anyone wants to +1 them fixing it, feel free:
>
> https://github.com/openssl/openssl/issues/7466#issuecomment-432938981
>
> Cheers,
>
> Richard
>
>
>

