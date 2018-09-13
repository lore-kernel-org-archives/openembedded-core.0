Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id AAD5F7487E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 14:13:05 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id o15-v6so5459022qtk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 07:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=W8J9wOlNu7FCKo+bgT6Wb4Fbeu4Fe9+aPEd6OwrpLSo=;
	b=WzF2JMGqM7XbfrffT58ITf+PMDP9nrgp/wD1NSYHg5FQdlcgfp0TcwyobDMAHq7cB7
	GOj62endykJ+x4FlPhL8AMpSF08SvWYKiI2mmKEHjvcjVDu++db0tf9u+WtcIYpil58d
	e6mdvgew5kEMZ6KC7rnMnuPoCt/6WfCoOsGjujJd3NwUg43ESSXehDipGR6UOLQL2vnM
	IGIHAubuiP7n0jGnx/r0JW5JAUXGy5g3vwxqKJ1Kt6ITlVywBW5ndxRNX2yMz3tYmBjb
	KShR0aj7N3znyGlhMXv1KkZL+giWse5UzrUnC1eKPnaWWLkbJLypxQ731nHpjm5wwkMe
	8+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=W8J9wOlNu7FCKo+bgT6Wb4Fbeu4Fe9+aPEd6OwrpLSo=;
	b=SEgKka5//eh8LuMKCbtdX599kLcpfxzDdpXzzf3pE1pJUyBCO1CVNcyHBFQfPDp/TB
	+CKvmz+lrKPXg7I6/sC0xVJRvMA0vwXhj+25mJZUC5c1p73aY+Y9FHNTXmzT/1JT2W+J
	tw/ZktGOeIBu3efuoOrdn395hwUJ3+TjcwU1pvu8jVErERK2KvBN01GqDNTFJLFGe3YT
	LuxJCBi08madK+D3am8ADPdfXjf1iXYELDMrbX0NBM+qFtTDCNZOlQ/Q9/H1XkdIaQB4
	mInAhF3XiqdnYdoCsw7NFBPSNaPFZHU2vVyxB7dK40evvUoV7JRdnKSDZfSfVQkZRdBj
	Ezsw==
X-Gm-Message-State: APzg51DwhHs/x8Cuqus1FzipgLLfIKB1u0yzckAp/ETpzjiJm0WZ189x
	BHIfais8XgrbXvFNj96rFBlykIsMrm5z4gKzCS5hhA==
X-Google-Smtp-Source: ANB0VdbKr2FUUerUBc16BEmeJtqP9bJ0c0M9UD1N6Ft87oeXiwbgCpgz8Q5MokiWY2nMzQTvc7AWyHjLIpRpBmr7slQ=
X-Received: by 2002:a0c:f94e:: with SMTP id
	i14-v6mr5455040qvo.50.1536847986096; 
	Thu, 13 Sep 2018 07:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20180913010531.41241-1-raj.khem@gmail.com>
	<20180913010531.41241-2-raj.khem@gmail.com>
	<a222d88ce20cfd75df914085dee0111f7316f36b.camel@linuxfoundation.org>
In-Reply-To: <a222d88ce20cfd75df914085dee0111f7316f36b.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Sep 2018 07:12:33 -0700
Message-ID: <CAMKF1spz_3r0MFVrSrpzs3pLk1LjoWnjvy7cmy1mEJbMjMpqJg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] musl: Wire-up name_to_handle_at and name_to_handle_at syscalls
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
X-List-Received-Date: Thu, 13 Sep 2018 14:13:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 13, 2018 at 6:14 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2018-09-12 at 18:05 -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Somewhat ironically, this breaks musl builds in strace:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/11/builds/55/steps/7/logs/step1b
> https://autobuilder.yoctoproject.org/typhoon/#/builders/27/builds/55/steps/7/logs/step1b
>

yeah, sent another fix on top.

> Cheers,
>
> Richard

