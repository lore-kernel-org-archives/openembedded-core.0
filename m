Return-Path: <paul.barker@konsulko.com>
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
	[209.85.167.180])
	by mail.openembedded.org (Postfix) with ESMTP id 62CCC7FA23
	for <openembedded-core@openembedded.org>;
	Mon, 20 Jan 2020 10:04:43 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id 13so27991975oij.13
	for <openembedded-core@openembedded.org>;
	Mon, 20 Jan 2020 02:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=K7ROMBLAF3bikQdA5mm2AVdfQTetILR8KnIyDHWemiQ=;
	b=sbUdcqrvHIy2JcJ7gIdifMs2Q+iZnAFwTMOaulatxqcVpKyjEtBph6ZgQJBRx9r9mn
	x+R0Qq2us942fcBP1kfEZ+sCyu4pOATMTr5Chc09Tk7xgb8R38M0qkQmDLci8jdfPkT9
	nl2PUDjDJhfQ4ltKnqUdk6bABun8c8mAfqBaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=K7ROMBLAF3bikQdA5mm2AVdfQTetILR8KnIyDHWemiQ=;
	b=NBPoDpiUdfqnwOmWnRSBQADYEjfUFJmXHwGyRdBT0e397a0Vs8swK4/jv/3U0cvb4s
	56DXTT79U4nB28Mh9Xhsz7upQy96Sgk+Y5/7niyB9qd2sDk5ai/hRQr5yt2z0pSdeL8J
	lL9R1SHe5kLuxacqZKyAmBf0HEckccvPF2+wqcLkFLWKW5qKyR6yA1V61FQG5/fl4vWM
	10BJimEpg3hoUkr2l+PTRcXNYKrqfEG9FKUEl8TFLJek/V1xeI+BG6gSolRXINaepykl
	d7SsU3LDEYFoXzkxmdtzMH/fZTUMODISXJRkAGCa/f3IhrNJJ597ZAcxzPsjhhXP0kX7
	XA/Q==
X-Gm-Message-State: APjAAAVYelZibdI7ZUzzJsY8vfYk+LDyFyW52jkSF82o+IhrTkR5H6IB
	t0mZ6kQVW4S5EfUq4Xpkca0un68d5hXaB2WPQZ+PL0kS8ctjk8+9
X-Google-Smtp-Source: APXvYqx5JJqOK4t1KCGD/THBmFgvYoBCvq/OA3mVJDgWpHS2SIgRdFTCPWjFD3xOTeN0pKmXwBlePZvBnqfxbttw5Xk=
X-Received: by 2002:aca:1b01:: with SMTP id b1mr11503570oib.6.1579514683938;
	Mon, 20 Jan 2020 02:04:43 -0800 (PST)
MIME-Version: 1.0
References: <CA+4=imbzpDitOKi0_cuF4CyzMdzh-ht9HUYkrM8PbTZAc9FvgQ@mail.gmail.com>
In-Reply-To: <CA+4=imbzpDitOKi0_cuF4CyzMdzh-ht9HUYkrM8PbTZAc9FvgQ@mail.gmail.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Mon, 20 Jan 2020 10:04:33 +0000
Message-ID: <CAM9ZRVsn=hPOsvMrN29pehBgA8_je6Kj+DYvTFG_doOVbJfG=A@mail.gmail.com>
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: openembedded-core@openembedded.org
Subject: Re: libsolv giving opkg wrong hint about dependency issue
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
X-List-Received-Date: Mon, 20 Jan 2020 10:04:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, 19 Jan 2020 at 23:00, Yann Dirson <yann.dirson@blade-group.com> wrote:
>
> I was hit this week by opkg giving me a cryptic hint to resolve a problem:

You may also want to forward this to the opkg development mailing
list: http://groups.google.com/group/opkg-devel

Thanks,
Paul

