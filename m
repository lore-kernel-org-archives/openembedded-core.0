Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 16795716CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 21:26:54 +0000 (UTC)
Received: by qcvp6 with SMTP id p6so2940004qcv.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 13:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/D9p9CZ3gE0KxYGpAC/bBnY56pSAQrIqj6vpRV61Dk4=;
	b=B5B/dmhDGFZi+WlDtjR9eDQiEqZLMKtzcqCYjRJHjLLYvp/degB4RmKuzzakKI+KnA
	LJbcQZ0Zw+R727Ym0lHKUAnwyRtBpvcWgMm/q3zUQyRoUCvHFHZoSpE28ArS5qmca7ei
	XcwT2vWPOzzyqERS135sxpXOXZ1LJ6q19IH8J/va/rWhAmQ6vvZjisu2MZkIQDzqeWha
	EvFItsmbqWFT+1MmtmIsZu1Csw74xGVwceJKCNowBaAd1CEI97ryfhCrjfG4y69sQNBA
	kicwTZVlFtIcG3W/iE8LZ6GudtnTsYRAXn/DOAxzV9FXdO4UDmOwJ7hK/gFOWvny2Yfs
	kVxQ==
X-Gm-Message-State: ALoCoQkoWORXMGWsC5myWxmwBiwDJ+sc3eG+TqfzyJYeXKpzkQTp1youmh2UlFZeph5AZfmUwf9m
X-Received: by 10.140.239.68 with SMTP id k65mr28542284qhc.76.1424467615985;
	Fri, 20 Feb 2015 13:26:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Fri, 20 Feb 2015 13:26:35 -0800 (PST)
In-Reply-To: <1424436945.11836.46.camel@linuxfoundation.org>
References: <e879427a035a12a0b9040ff948fe3e22618412b8.1424405852.git.raj.khem@gmail.com>
	<f2524b85ea338525d78147b4bd90d2a1f3f3790d.1424405852.git.raj.khem@gmail.com>
	<1424436945.11836.46.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Feb 2015 21:26:35 +0000
Message-ID: <CAJTo0LZzTQ-Yh0AOYrdi2eg_CdptLzUj2xduMjG5QX2dBYeuSg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] util-linux, util-linux-libs: Build and package util-linux libs separately
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
X-List-Received-Date: Fri, 20 Feb 2015 21:26:58 -0000
Content-Type: multipart/alternative; boundary=001a1135b7583ed924050f8bb62c

--001a1135b7583ed924050f8bb62c
Content-Type: text/plain; charset=UTF-8

On 20 February 2015 at 12:55, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Every time we're tried to split a piece of software into two like this
> it has been a world  of pain. Are we sure there is no alternative to
> this?
>

One alternative is to just disable systemd in util-linux, surely.  Last
time I looked it was just uuidd that can optionally use libsystemd to
daemonise cleanly.

Ross

--001a1135b7583ed924050f8bb62c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 February 2015 at 12:55, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":2hy" class=3D"a3s" style=3D"overflow:hidden">Every time w=
e&#39;re tried to split a piece of software into two like this<br>
it has been a world=C2=A0 of pain. Are we sure there is no alternative to<b=
r>
this?</div></blockquote></div><br>One alternative is to just disable system=
d in util-linux, surely.=C2=A0 Last time I looked it was just uuidd that ca=
n optionally use libsystemd to daemonise cleanly.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1135b7583ed924050f8bb62c--
