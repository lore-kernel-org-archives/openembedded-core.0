Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id D52577FE67
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 18:09:19 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id w47so3401822qtk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 10:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=d+BsSz3yDvCKMe/Bxsa3mOWJ8Z11kPifcx6bPAtvoZo=;
	b=QP9eSB9fql7JGHgVGbaJwdz2pJQiN5jbi15IXkJLTnvgAfGSKLcC7f6StoThwzHZK5
	hfaX5LZK7DEr1xJs9ypYXasdK7Cp59/DshfLotNpQhDTJc7L5h1R73aIfC9YOEC9AFmb
	8R2wNyalLSqdcYmDGaizaa+Fuv+x/4XqE7a5q+TqKt05OPa4x8j/iVGPdjDa3Kxjc8kS
	DWCyzdw5yOUbsd3V5g/S5ufME4Nx5JRFUuh2JFveK43W5wJVWPzkfEEaUWnTic1q7Mar
	pvTgGUNcUZFtIKJah1verh4RivOrR1X7tHYfhDnutwW7ZcF8BHLcS4SoaD6gU19aIfu/
	F80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=d+BsSz3yDvCKMe/Bxsa3mOWJ8Z11kPifcx6bPAtvoZo=;
	b=epBUhhFu1RkmjWkzU7W85MzNVUZQcn2yBUdICtTw/5Wj50njNZ4RPfdjJhCBUwFCh1
	Ta/U64pIEvi5K3cILfnETcmjfxBLs7PwiwJG+GyWw0LJXDJh9fqhdsN7FZbD9N+wxg+a
	avOqc+kn6sgqj3is7z9Y0lGIClIQ/S2Bth8QZ+OlASD0L5ai20qFqYOAIk6mGsgovHqP
	ergaqfvXgxFuxCjYKSyaSQjr6c3yK03353c6nGxPHr7MYlXSm3kSOPFqwOhTCjoVV3Bj
	5INDt4yLy8pXhDUvHFevxyhCJRa610k31lvln4t5BzsR/0nsfGN5biMSODChMAHzUXgK
	dukw==
X-Gm-Message-State: APjAAAXAthq4j4+CDcAWE82MoCB/TL23WFrUi93dI9XLxgjCHcLqG1f0
	ndPAkYlUGjcYxVguJJQ/tFX1bBhxGROs05SQl5c=
X-Google-Smtp-Source: APXvYqxIYHFhw30rIQqNsT14wkRecmucGjkQslIAGpSMicOdEcit52xwYBCZJ1hebsk5nQXEbvd5CHXInvUgJGK8Vsw=
X-Received: by 2002:ac8:5257:: with SMTP id y23mr5802573qtn.88.1579630160415; 
	Tue, 21 Jan 2020 10:09:20 -0800 (PST)
MIME-Version: 1.0
References: <20180514144415.40730-1-stefan@agner.ch>
	<20200113145729.amwegnpvnp2kb3ut@qschulz>
	<20200120123246.o5abx73ehcoqbbim@qschulz>
	<4e98fdb7ff73df6804e58f2f4339c816@agner.ch>
	<059aa62b-1c45-50a3-5d58-40f2646247ad@gmail.com>
	<20200121092341.bgb2elaqey75egjp@qschulz>
In-Reply-To: <20200121092341.bgb2elaqey75egjp@qschulz>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jan 2020 10:08:59 -0800
Message-ID: <CAMKF1spxORPSqDJuD2RWLFNXs8pHZSDQtVgzp+xcb3w2tC3htQ@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: busybox: udhcpc: fix IPv6 support when using udhcpc
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
X-List-Received-Date: Tue, 21 Jan 2020 18:09:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 21, 2020 at 1:23 AM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Khem,
>
> On Mon, Jan 20, 2020 at 11:26:27AM -0800, Khem Raj wrote:
> > > Just checked, we still override that script in our layer, so definitely
> > > would be happy if this gets merged upstream so I can get rid of our
> > > custom script downstream.
> > >
> >
> > I think this is good to go got OE-core, but I was wondering if default
> > script in busybox also need this and perhaps upstream too
> >
>
> What do you mean by "default script"?
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/busybox/files/default.script
> ?

yes.
>
> Upstream could benefit from it, I'd agree. Though, it is technically
> just provided as an example.
> https://git.busybox.net/busybox/tree/examples/udhcp/simple.script
>

> The reason why I didn't bother to send a patch to busybox before pinging
> on this patch was that we're already different from the upstream simple.script
> so it didn't make sense to me to add the Upstream-Status: pending or
> something on the patch (in some ways, since it's patching the file
> directly and not adding a patch in SRC_URI). Anyway, digressing. Do you
> want a patch to be sent to busybox ML (or PR or whatever they use)
> before taking this patch?
>

I think the problem this patch fixes is generic and somewhere the
script OE has is also derived from
that example, so while the patch in itself is enough for OE, it would
be better if it was in upstream too
perhaps one less thing to worry about when we cherry pick changes from
upstream script in future.

> Quentin

