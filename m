Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
	[209.85.222.47])
	by mail.openembedded.org (Postfix) with ESMTP id CB3DC7E467
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 19:16:36 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id l6so859887uap.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 11:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iPfTCQI4qfCuSFHi8mMhO6khINpeWcCsGkA+1BZWqMM=;
	b=PMFVaiHSYPyHvQ1fiTw8m4Vizs6x+//9lKyrdeoBwrfECH/bTI/CVWUOWbWYHt989t
	iEDb3lMOWJ2oPOJAX+EmJ4+3VFsR8ZWgmFQfcX6LtAb6i3v482OwM0Wj2UV/dv7ZWwNX
	6+WdKVz2KwSvWxAONTQsyoUP8laInUStRbs/9C5xzHNel8nlI4nUqmx6rD3axPBm/yqK
	1TftV5othxpt8vXnTnE8x+ZVfqjYel4hzni3crbSahQo1nMpbSM9PFdvmv1PM83Cz3YJ
	KeVNtDJG7NHU8Ng+Uc9+zHHBit4+lQ741Y9Awkmy6fC5qgYbT7wSOYsfizYGAoP/v238
	jYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iPfTCQI4qfCuSFHi8mMhO6khINpeWcCsGkA+1BZWqMM=;
	b=lPd5henDUt/0rDWRw5Pcvf9ZSNL6NUUDxApTajQxRRi4Uyxd0Sbr5MClJO3tocaZgq
	CvXjLhhBp30DxGlspjP5c/tratl/Ozs9DfHrR9A1cBVCJ+AE1Z+pD6YVk7xK91fdoGQ/
	sAyiXs1Sy9/bdP1cal6P/VoFIi7Ubv5sBT3Oo2zZtEkejNifOzDfXiCGc7u5YbbPhynr
	0FPPUhRrvAMK38B+JcoXqnshmt5qQzieXxx2hwc15Pn0As8tRTjHvyQ9SCmqX64CJTv6
	PEpVzBEldZZ8/tLYkZKPrU0sJ6W4bP4G2NPuxinm2E3ITsA1zPQWG/gdfSb4lZm6vAMl
	rliw==
X-Gm-Message-State: APjAAAU69ej1Ttqr641nFr9XM2X/veciB2SAXmpYGJyFfwACmTh/xuoH
	6tE1AJaPubtWgSX7eLjIoFBz2aFFoUrVtlg4fY5SqA==
X-Google-Smtp-Source: APXvYqwb+ui2vRzsNI/5xVdRegVfUcZBZuzbH1kVu34YnVxBbzeaSN1qRViiUZaz9n+a93gEuxB/FAWS80bpkpg61nk=
X-Received: by 2002:ab0:3381:: with SMTP id y1mr20367104uap.93.1576437397489; 
	Sun, 15 Dec 2019 11:16:37 -0800 (PST)
MIME-Version: 1.0
References: <20191215183756.GB14038@localhost>
In-Reply-To: <20191215183756.GB14038@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 15 Dec 2019 20:16:26 +0100
Message-ID: <CANNYZj-x6q0VvPew8nCqUWPmcY=1MBE+efdQzoZaPESxtVXMYg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should patchtest warn on Upstream-Status: Pending ?
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
X-List-Received-Date: Sun, 15 Dec 2019 19:16:37 -0000
Content-Type: multipart/alternative; boundary="000000000000168ac40599c2efb8"

--000000000000168ac40599c2efb8
Content-Type: text/plain; charset="UTF-8"

I used to have similar ideas, but... there is already too few people doing
the recipe upgrade work. I would not want to reduce that number even
further by adding more barriers and requirements. It's always possible for
a human reviewer to ask to send the patch upstream, if it's likely to cause
upgrade headaches.

There have been situations where people do upstream patches later than they
are added to oe-core; I've upstreamed parallel rpm work, and gobject
introspection cross compile support that way. Those are significant
features, and it's best to thoroughly test and refine them first before
going upstream.

As for updates, I am regularly able to remove 'Pending' patches during
upgrades; this means they did make it to upstream one way or another, or
upstream fixed the issue independently, or the code was refactored and the
whole issue is moot.

Otherwise, if I am seeing a 'Pending' patch during upgrades and it cannot
be trivially rebased, tested or even understood, and dropping the patch
does not create build failures and passes the AB tests, to me that is good
enough to simply drop the patch. If people add complex, invasive patches
and don't bother to upstream them, then there is a good chance they will be
removed some time down the road. This kind of removal happens, but very
infrequently.

There have also been situations where recipes accumulated so much cruft
over the years (not just a pile of patches) that upgrades that preserve
existing recipe become nigh-impossible; in that case I re-write the whole
mess from scratch (e.g. perl, python3, rpm, webkit).

I don't think the pending patches are a particularly bad problem; also,
their number has declined since last year.

Alex

On Sun, 15 Dec 2019 at 19:38, Adrian Bunk <bunk@stusta.de> wrote:

> I am wondering whether patchtest should send warning emails on
>    Upstream-Status: Pending
>
> In practice patches are usually forwarded upstream either at submission
> or never.[1]
>
> Not upstreamed OE-only patches create a technical debt that often makes
> recipe upgrades a pain.
>
> cu
> Adrian
>
> [1] When upstream requires copyright assignment upstreaming
>     later is sometimes not even legally possible.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000168ac40599c2efb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I used to have similar ideas, but... there is already=
 too few people doing the recipe upgrade work. I would not want to reduce t=
hat number even further by adding more barriers and requirements. It&#39;s =
always possible for a human reviewer to ask to send the patch upstream, if =
it&#39;s likely to cause upgrade headaches.<br></div><div><br></div><div>Th=
ere have been situations where people do upstream patches later than they a=
re added to oe-core; I&#39;ve upstreamed parallel rpm work, and gobject int=
rospection cross compile support that way. Those are significant features, =
and it&#39;s best to thoroughly test and refine them first before going ups=
tream.<br></div><div><br></div><div>As for updates, I am regularly able to =
remove &#39;Pending&#39; patches during upgrades; this means they did make =
it to upstream one way or another, or upstream fixed the issue independentl=
y, or the code was refactored and the whole issue is moot.<br></div><div><b=
r></div><div>Otherwise, if I am seeing a &#39;Pending&#39; patch during upg=
rades and it cannot be trivially rebased, tested or even understood, and dr=
opping the patch does not create build failures and passes the AB tests, to=
 me that is good enough to simply drop the patch. If people add complex, in=
vasive patches and don&#39;t bother to upstream them, then there is a good =
chance they will be removed some time down the road. This kind of removal h=
appens, but very infrequently.<br></div><div><br></div><div>There have also=
 been situations where recipes accumulated so much cruft over the years (no=
t just a pile of patches) that upgrades that preserve existing recipe becom=
e nigh-impossible; in that case I re-write the whole mess from scratch (e.g=
. perl, python3, rpm, webkit).</div><div><br></div><div>I don&#39;t think t=
he pending patches are a particularly bad problem; also, their number has d=
eclined since last year. <br></div><div><br></div><div>Alex<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun=
, 15 Dec 2019 at 19:38, Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de" t=
arget=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">I am wondering whether patchtest should se=
nd warning emails on<br>
=C2=A0 =C2=A0Upstream-Status: Pending<br>
<br>
In practice patches are usually forwarded upstream either at submission <br=
>
or never.[1]<br>
<br>
Not upstreamed OE-only patches create a technical debt that often makes <br=
>
recipe upgrades a pain.<br>
<br>
cu<br>
Adrian<br>
<br>
[1] When upstream requires copyright assignment upstreaming<br>
=C2=A0 =C2=A0 later is sometimes not even legally possible.<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000168ac40599c2efb8--
