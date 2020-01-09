Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
	[209.85.217.49])
	by mail.openembedded.org (Postfix) with ESMTP id 318D97FE07
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 16:13:08 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id v12so4529940vsv.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 08:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kepUQNjpUZ9h5lstuwgd0K5xxak2kdlKyN6hGDtn8Z0=;
	b=nFNNTJ0Nljw/1wdOQeXIGKXgKFWajGKDPWv6DZ0gG6DIycEDyg5TqGyVFYihe8Gwj0
	ixSHTe4vDej0AdvqmaHOG2FFjontRuvxy6n8W443AoEvLp0OSXAYo1u2f9A6P6esMrIh
	kJ1FwhRmj+CzzPFHHtFHRADP4ihJbm0Pofrs+pke02zNfU0VakfgXtAsSZUeyillsBq5
	6LV+5IWxPGa6uGKYPlYPfkw0GVlFxWphT2T3Qry07VjKM9QLEgfSNJmb7if/WZqcRy1L
	Z6yNnWUDXg4O9fR08IyKDmRjFJGuId4v3iVbUhQWIa/Ub3oZDZzVfb/96qPGK2QAK2El
	F6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kepUQNjpUZ9h5lstuwgd0K5xxak2kdlKyN6hGDtn8Z0=;
	b=DJb6FxmhbYiYs4lfJZt6U6QbpdHHmAEnfD3wLTWnXHWbNNSPK2SBKfPY0i6HI31LdC
	BeqQ7CnTmiSIbEC0xdpkYz6EPkwyqLbUkNaPwt2LaRR5gfuVsSFTzbjXpZys2I9BTx6h
	Via7nxgecl5TvKOnWHx+nbIe30sN/MREKubxZOLesZ/j7uamPA+NNTZ1/aIT2fBKwHKR
	D/y7iN7UQJHmThOqZ64NproShJ7vX6tg6DOZNKWa7Q5egRl3zbIlF+1m2YfuuCsz9mRX
	xACaEkfxrCrwgJwk7qL/tPO/M8iFCKXQm/ZV5uwtqs6C4T2sM+M9pIL6VXRxtJxWsWzz
	6KGA==
X-Gm-Message-State: APjAAAW1okRhDBrj2S9aVa4aDAZAwySGcuSsxU9xcmH0SGEwQnNUTSoc
	oKn6FjP22W6kqx6YcAKq8io90NplEOAXgLcLC48=
X-Google-Smtp-Source: APXvYqzRb3mKB5fc4Qy6gMt862JTVj2ZnyQbN4kBxqqJx/wAhKBoRxI6MuJ6GEB58YK6t390GkQn8CXtVAtvo6+Gkdg=
X-Received: by 2002:a05:6102:3213:: with SMTP id
	r19mr6669664vsf.83.1578586388981; 
	Thu, 09 Jan 2020 08:13:08 -0800 (PST)
MIME-Version: 1.0
References: <20200108132759.95603-11-alex.kanavin@gmail.com>
	<15ea8a58c140419c32f08e4ab6148677bb23e920.camel@linuxfoundation.org>
	<CANNYZj_52vBnUoR=XL0-vVPs7-h3=vH0QoO9f_wBVo+8FiijhA@mail.gmail.com>
	<CANNYZj8Tr3N-kp1b47w8LimQOWOyWVzqLyq1ip6eS4juf5VXFQ@mail.gmail.com>
	<e1cd09d3f326c30da7ecf41e951105f3a92af64f.camel@linuxfoundation.org>
	<CANNYZj-26WfDZ3fdp1WgptphLYxrhA6H780rDQReGk3fP+x5og@mail.gmail.com>
	<20200109144454.GB31026@bill-the-cat>
	<CANNYZj_rB4cPnGTqoO4MX1iwj2N0a6bhP3jvxCwOuO9mfMRSLA@mail.gmail.com>
	<20200109150148.GC31026@bill-the-cat>
	<CANNYZj-UjHc=f-yvfGXhqRH_4AKKzrAdgaX1i_jpzDSAEFfnRQ@mail.gmail.com>
	<20200109155506.GD31026@bill-the-cat>
In-Reply-To: <20200109155506.GD31026@bill-the-cat>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jan 2020 17:12:58 +0100
Message-ID: <CANNYZj_wZx-FCrLmsoBvRF8eP8JPxMHFd2TjMgbD_BjkHsNjJQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/28] ifupdown: update 0.8.22 -> 0.8.35
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
X-List-Received-Date: Thu, 09 Jan 2020 16:13:08 -0000
Content-Type: multipart/alternative; boundary="000000000000f66aa2059bb74854"

--000000000000f66aa2059bb74854
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jan 2020 at 16:55, Tom Rini <trini@konsulko.com> wrote:

> I have to admit I'm guessing at what level of automated run-time testing
> we normally have today.  We sanity test a sysvinit+busybox image with
> networking, yes?  If so, we also do that on systemd and I assume with
> what I put for the systemd+busybox-free we also do there, yes?
>

I believe we test sysvinit+busybox, and systemd+busybox at runtime via poky
and poky-alt distro configs.

We also test systemd+busybox-free core-base-utils (without ifupdown), but
only as a build (no runtime tests). See
lib/oeqa/selftest/cases/imagefeatures.py.

Alex

--000000000000f66aa2059bb74854
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 9 Jan 2020 at 16:55, Tom Rini &lt=
;<a href=3D"mailto:trini@konsulko.com">trini@konsulko.com</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">I have to admit I&#39;m guessing at what level of automated run-=
time testing<br>
we normally have today.=C2=A0 We sanity test a sysvinit+busybox image with<=
br>
networking, yes?=C2=A0 If so, we also do that on systemd and I assume with<=
br>
what I put for the systemd+busybox-free we also do there, yes?<br></blockqu=
ote><div><br></div><div>I believe we test sysvinit+busybox, and systemd+bus=
ybox at runtime via poky and poky-alt distro configs.</div><div><br></div><=
div>We also test systemd+busybox-free core-base-utils (without ifupdown), b=
ut only as a build (no runtime tests). See  lib/oeqa/selftest/cases/imagefe=
atures.py.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000f66aa2059bb74854--
