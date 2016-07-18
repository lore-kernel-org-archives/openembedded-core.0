Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0BBBF60746
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 13:30:59 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id w18so251932619oiw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 06:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KbJxnceQVYuYjAuJ0QxXpxNv3pmP8S4ltYhFgx9AOXE=;
	b=cp+9Zawd9cc/5OYgvDyc4qORTimfaJ0QrzHWMWeRQA3R7BbzHxkZJcQNMl2yDE8NGj
	jXYwSMMW1CgDYr23apyFTB8R0LU8aSJ4UEFajI7W0o7Dux1OMIlIE3w4hHGsNJamBWHl
	QZAlhEKsyXgZ8ix5rb97sxkiImFatgDc8j+oRxlb6E07Kf0YielIPfxMLnUdwvqvI8/O
	XNyHxr/63iOpWZVV0OnAJedzXIfAi6Xn/wqpAbnbWT+FAYJ5pKSQw1EL2oSpceI/3VxX
	nkIXOesYen6t0NheRfw2hzk+IBzKbFKNUjKiQ2C1oFC+ogzq1TckCiJtcrmoY4IeEAjv
	YBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KbJxnceQVYuYjAuJ0QxXpxNv3pmP8S4ltYhFgx9AOXE=;
	b=G1BIVeoe7kp1ywd1aVMPj57zhogPl7ahxmlsKhu3Zb3xRdYLp21sr0RWPCgpTYK8cK
	9ah38tIAZKy0JbiSrL3Ewxjd2/mjo0pTcK2MutvUr3FIT5+P/f63IrLIyU5rXWBx3mKF
	t0k23iPwDGOQJDulynQXL95s6l902BUX1TjxtmKPJhf/z+wIkXm9s07J2TGUcoqAjW0h
	WP7UQrsQlJBEc9vJHUJljpWexvuJSDOHV0sHZ6w/yW+4czM/0HtqqnHeOHpgkcwECVT5
	wLQnTb7Io+vCpubvqa7O9ArfnpWnhZYkHsRwGaU/PNIDa9Oo3QZqbXQ2m3IBoKkP36iF
	V5mQ==
X-Gm-Message-State: ALyK8tLUxGXqvtdoAV/Cl+mzjoC4Dh6hzLummEjPCWiwMt6Rl8o3WQpBfrg0grMqp1RzFE+XIb4a4eWzYvkW0Lrt
X-Received: by 10.202.228.133 with SMTP id b127mr16605970oih.168.1468848660071;
	Mon, 18 Jul 2016 06:31:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.199.134 with HTTP; Mon, 18 Jul 2016 06:30:30 -0700 (PDT)
In-Reply-To: <FC49D134-1826-4C0E-9D00-B0C63A0EFCAD@gmail.com>
References: <cover.1468578590.git.jussi.kukkonen@intel.com>
	<25b3f922c187722bc62a57610516064651cf2e1a.1468578590.git.jussi.kukkonen@intel.com>
	<CAJTo0La03=kJ14FYFFpNYzbpmUnC5vzy4R+XKzm3naqycAEZ7A@mail.gmail.com>
	<FC49D134-1826-4C0E-9D00-B0C63A0EFCAD@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 18 Jul 2016 16:30:30 +0300
Message-ID: <CAHiDW_Fm0eATYFU+iCNOfO4ZmRWVMuRyxaEMRV6ZUsz8bap-Bg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] wayland: Upgrade 1.10.0 -> 1.11.0
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
X-List-Received-Date: Mon, 18 Jul 2016 13:31:00 -0000
Content-Type: multipart/alternative; boundary=001a1141b28a9ce22f0537e8fa82

--001a1141b28a9ce22f0537e8fa82
Content-Type: text/plain; charset=UTF-8

On 16 July 2016 at 02:25, Khem Raj <raj.khem@gmail.com> wrote:

> On Jul 15, 2016, at 3:15 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
>
> On 15 July 2016 at 11:41, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>
>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>>
>
> This breaks with musl:
>
> | ../wayland-1.11.0/src/scanner.c: In function 'find_enumeration':
> | ../wayland-1.11.0/src/scanner.c:811:2: error: unknown type name 'uint'
> |   uint idx = 0, j;
>
>
> Fixed with
> https://patchwork.freedesktop.org/patch/98992/
>
> Please back port and test
>
>
Thanks Khem,

I've added one more small fix to weston, and things build on musl now.
Unfortunately at boot time I get the same versioned symbol relocation
problem that vte has:
  gbm: failed to open any driver (search paths /usr/lib/dri)
  gbm: last dlopen error: Error relocating /lib/libgcc_s.so.1:
__cpu_indicator_init: symbol not found
  failed to load driver: i965

This is with mesa 12.0.1 from this same patchset. I'll resend the set in a
minute.

Jussi

--001a1141b28a9ce22f0537e8fa82
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
6 July 2016 at 02:25, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div style=3D"word-wrap:break-word"><div>=
<span class=3D""><blockquote type=3D"cite"><div>On Jul 15, 2016, at 3:15 PM=
, Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blan=
k">ross.burton@intel.com</a>&gt; wrote:</div><br><div><div dir=3D"ltr"><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 15 July 2016 at 11=
:41, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mailto:jussi.kukkonen@=
intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:sol=
id;padding-left:1ex"><div>Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mail=
to:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>=
&gt;<br></div></blockquote></div><br>This breaks with musl:</div><div class=
=3D"gmail_extra"><br>| ../wayland-1.11.0/src/scanner.c: In function &#39;fi=
nd_enumeration&#39;:<br>| ../wayland-1.11.0/src/scanner.c:811:2: error: unk=
nown type name &#39;uint&#39;<br>| =C2=A0 uint idx =3D 0, j;</div></div></d=
iv></blockquote><div><br></div></span><div>Fixed with</div><div><a href=3D"=
https://patchwork.freedesktop.org/patch/98992/" target=3D"_blank">https://p=
atchwork.freedesktop.org/patch/98992/</a></div><div><br></div><div>Please b=
ack port and test</div><br></div></div></blockquote><div><br></div><div>Tha=
nks Khem,</div><div><br></div><div>I&#39;ve added one more small fix to wes=
ton, and things build on musl now. Unfortunately at boot time I get the sam=
e versioned symbol relocation problem that vte has:</div><div>=C2=A0 gbm: f=
ailed to open any driver (search paths /usr/lib/dri)</div><div>=C2=A0 gbm: =
last dlopen error: Error relocating /lib/libgcc_s.so.1: __cpu_indicator_ini=
t: symbol not found</div><div>=C2=A0 failed to load driver: i965</div><div>=
<br></div><div>This is with mesa 12.0.1 from this same patchset. I&#39;ll r=
esend the set in a minute.<br></div><div><br></div><div>Jussi</div></div></=
div></div>

--001a1141b28a9ce22f0537e8fa82--
