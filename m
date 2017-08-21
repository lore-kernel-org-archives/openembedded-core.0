Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 065267834A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 12:35:38 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id y4so5372354iod.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 05:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w9B46XmrxY1Kh7JvbZafhRSIHyCDPuutq3uG+HjjSTM=;
	b=KpzW/izofsJUqT3M1wAEt87POxVs31xGf+ZsfFhkH5xd7iEtK7OFdrBQwuLGQjF+Yw
	n4VpBGKp6trLMpyFJN6/7bailToTrCGu2LkKWjmukvdUxtdvQxuGSvMnu4dMl9CYQ2KN
	Hck0ZqU1cWm6y3lMa3WBRgF1JGYjy5RilMv36cAHPSISWYl7Dfa99QOmrd7J7HSoin/Y
	xVTonaZvPEF+EicLMYBzQQP1nmyT13agIktcsI7Wh2bFWg15AYzMJdgwnKHAcp38zI4J
	nYT7x2J3+w4b4JXTY9DlYfuwXTvem6TgeDTU7CfnR/RA+ZknYTLyTdkhlgMFSxG0PpN9
	CYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w9B46XmrxY1Kh7JvbZafhRSIHyCDPuutq3uG+HjjSTM=;
	b=f9JLH4jikeBVTQVh5M5OZdsVBAyhBvkaQQSlXqiKtCEFuob1bOR56twwwbV9+kogKz
	momWcJtlWjr/w+iBuiq8IHKv2xYlF2UBByVoRLWu1ySz+VIWov0hmyeH7KVMu7TB7vRQ
	eogaPBjxvhxmK4n3eUw5DEHK6Ubl76wBUsuhuLZcffhcHACuwMzfq7djmyuEyIHu/x/r
	xFtFn6fh9mDLYu9us0hcMI8RdSt0yly1w1JbxjCzyspjz9Uj4kAGMUbI+ISdW4PL82QU
	bBvry3A9LF6UhbrKwFkV1gL1K/NdYb8J1vDJJaKwruh3992GkPmEVCBiptB2xaefSfQx
	eNSg==
X-Gm-Message-State: AHYfb5hkYBScguCpQ1ZuFSjISwDF7e9OHNXeDHG2IQEvIss4OyKY4Ivu
	K4deNTG9cp/OsuyLwYMa5jRxt9dJ9ZQl
X-Received: by 10.107.50.136 with SMTP id y130mr15465481ioy.70.1503318940417; 
	Mon, 21 Aug 2017 05:35:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.200.71 with HTTP; Mon, 21 Aug 2017 05:35:09 -0700 (PDT)
In-Reply-To: <20170821102342.167780-1-jose.alarcon@ge.com>
References: <20170821102342.167780-1-jose.alarcon@ge.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 21 Aug 2017 15:35:09 +0300
Message-ID: <CAHiDW_FBQHxDOLgRC_tr-i5Y_rd4TBge0Vt_TwnRg9x5VU2ikg@mail.gmail.com>
To: Jose Alarcon <jose.alarcon@ge.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Dhrystone: add recipe 2.1
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
X-List-Received-Date: Mon, 21 Aug 2017 12:35:39 -0000
Content-Type: multipart/alternative; boundary="001a11447aca6d9bc5055742b721"

--001a11447aca6d9bc5055742b721
Content-Type: text/plain; charset="UTF-8"

On 21 August 2017 at 13:23, Jose Alarcon <jose.alarcon@ge.com> wrote:

> Dhrystone is a synthetic computing benchmark program developed
> in 1984 by Reinhold P. Weicker intended to be representative of
> system (integer) programming.
>
> https://en.wikipedia.org/wiki/Dhrystone
>
> Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
> ---
>  .../dhrystone/dhrystone-2.1/dhrystone.patch        | 81
> ++++++++++++++++++++++
>  .../recipes-benchmark/dhrystone/dhrystone_2.1.bb   | 26 +++++++
>  2 files changed, 107 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/
> dhrystone.patch
>  create mode 100644 meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb


Hi,

Please send meta-oe patches to openembedded-devel@lists.openembedded.org.

Also this part is unlikely to be welcome on oe-devel either:
> LICENSE = "Proprietary"

I think I remember seeing a dhrystone recipe submission with an open source
license (NCSA maybe?) last year .

Cheers,
  Jussi

--001a11447aca6d9bc5055742b721
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
1 August 2017 at 13:23, Jose Alarcon <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:jose.alarcon@ge.com" target=3D"_blank">jose.alarcon@ge.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Dhrystone is a=
 synthetic computing benchmark program developed<br>
in 1984 by Reinhold P. Weicker intended to be representative of<br>
system (integer) programming.<br>
<br>
<a href=3D"https://en.wikipedia.org/wiki/Dhrystone" rel=3D"noreferrer" targ=
et=3D"_blank">https://en.wikipedia.org/wiki/<wbr>Dhrystone</a><br>
<br>
Signed-off-by: Jose Alarcon &lt;<a href=3D"mailto:jose.alarcon@ge.com">jose=
.alarcon@ge.com</a>&gt;<br>
---<br>
=C2=A0.../dhrystone/dhrystone-2.1/<wbr>dhrystone.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 81 ++++++++++++++++++++++<br>
=C2=A0.../recipes-benchmark/<wbr>dhrystone/<a href=3D"http://dhrystone_2.1.=
bb" rel=3D"noreferrer" target=3D"_blank">dhrystone_2.1.bb</a>=C2=A0 =C2=A0|=
 26 +++++++<br>
=C2=A02 files changed, 107 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-benchmark/<wbr>dhrystone/dhrystone=
-2.1/<wbr>dhrystone.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-benchmark/<wbr>dhrystone/<a href=
=3D"http://dhrystone_2.1.bb" rel=3D"noreferrer" target=3D"_blank">dhrystone=
_2.1.bb</a></blockquote><div style=3D"font-size:12.8px"><br class=3D"gmail-=
Apple-interchange-newline">Hi,</div><div style=3D"font-size:12.8px"><br></d=
iv><div><span style=3D"font-size:12.8px">Please send meta-oe patches to=C2=
=A0</span><span style=3D"font-size:12.8px"><a href=3D"mailto:openembedded-d=
evel@lists.openembedded.org" target=3D"_blank">openembedded-devel@lists.<wb=
r>openembedded.org</a>.</span>=C2=A0</div><div><br></div><div>Also this par=
t is unlikely to be welcome on oe-devel either:</div><div>&gt; LICENSE =3D =
&quot;Proprietary&quot;<br></div><div><br></div><div>I think I remember see=
ing a dhrystone recipe submission with an open source license (NCSA maybe?)=
 last year .</div><div><br></div><div>Cheers,</div><div>=C2=A0 Jussi</div><=
/div></div></div>

--001a11447aca6d9bc5055742b721--
