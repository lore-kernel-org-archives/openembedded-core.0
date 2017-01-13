Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3079071D8C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:19:36 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id a20so7291845qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GUbl2KNKt9p1hxW2TK/3T6/blaOLARZQc12Zi1QJrJ0=;
	b=FJeYX235LYnRaMr65qvP+rWOE28nBfDn3sNaLk6lvFAf/YjBdXaZQiNOCDeT8KpsQk
	/Dcxnt+mLRMxMA5BTLp50IR2aDBelx8q7NNW0eKubpL9ZISaeXuQF1BTgMOyESxaVK2b
	ZqYSAg/JS4rYXSf9Or8LD4QVm1oAuyjlfxeBO9ei/GGIcGUzHoNoHHtzyszaQrdhR87W
	AyHiBYFFC+INhikpD6O7Op4tIxhXPIJG7n/8FRTC+lJpMIfL4jPiY2PEE1EqzQ7QCsTP
	d3GtpL0rSzPm9CIAEIyxphkndS4bK2kKEQKMTXU5x10ezZyZKcuI5p1mvm9v15sg56jq
	nDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GUbl2KNKt9p1hxW2TK/3T6/blaOLARZQc12Zi1QJrJ0=;
	b=oDV1DLoX2eCDh1DqhtTcBVFdwa/0VT7yoDYJuLajAyDWu8N/k2t+hejVOCZPfrvjp3
	QtYUgj17Gx5TaUciLiVbJVdIsACZx/IkYIJH9dZXLdGbqRydznMasPOCbh7q+5a9utQt
	YThlQP7VcNXzylawO+b2eOjGaKU1TAbGpNdDXOk3FME4vJJyBk/Nee09SgH+NP2uMyCS
	TqS8YkXTRaykBxvEPkVp6ZRhgw4AO2o/cTU3U922UND9+SLdoKOLI51PduBMFWGBpQ72
	EBlW7GCLvurRzYpOUPeVJL8Lvst5WzmktrLYWzUeR160fwG/r/IodNA5Bm61dRvNjarR
	7nzA==
X-Gm-Message-State: AIkVDXLpgv51QO9eEV8bG9B9WmeV7cs2Ra68nBfPYG+Q+h6fZe8W7EjG+nFCpn4WMxNQlSa031k1z7raeczWuQ==
X-Received: by 10.55.140.67 with SMTP id o64mr21345829qkd.157.1484317177042;
	Fri, 13 Jan 2017 06:19:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Fri, 13 Jan 2017 06:19:36 -0800 (PST)
In-Reply-To: <CAHiDW_Fs4B1B2qzqsJqVdVuEZa40boKH8zGnON04W7L8=bfgSA@mail.gmail.com>
References: <cover.1484312322.git.ross.burton@intel.com>
	<CADkTA4NpPn78=SB+b2zO=Vd8z2SG+BtBLQi1ciKjXyEruoQ1rQ@mail.gmail.com>
	<CAHiDW_Fs4B1B2qzqsJqVdVuEZa40boKH8zGnON04W7L8=bfgSA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 13 Jan 2017 09:19:36 -0500
Message-ID: <CADkTA4O0vhL8k+nvvwMsyBGt-YToan0KiSpMtSYOh+Qkwms6SQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/80] Consolidated pull
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
X-List-Received-Date: Fri, 13 Jan 2017 14:19:37 -0000
Content-Type: multipart/alternative; boundary=94eb2c05481e125c1a0545fa864d

--94eb2c05481e125c1a0545fa864d
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 13, 2017 at 9:16 AM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> On 13 January 2017 at 15:39, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >
> >
> >
> > On Fri, Jan 13, 2017 at 8:00 AM, Ross Burton <ross.burton@intel.com>
> wrote:
> >>
> >> Hi,
> >>
> >> Another consolidated pull.  Last run on the AB was mostly green:
> >> - byacc on beaglebone-lsb failed (upgrade removed)
> >> - checkuri failed (transient, works now)
> >> - selftest failed (fixed in branch, tests work locally now)
> >
> >
> >
> > Should I re-send my kernel queue ? It is now about 13 patches long, and
> I'm stacking
> > a few more on every couple of days.
> >
> > I assume there are still some outstanding issues with the 4.9 kernel, or
> more specifically
> > the 4.9 kernel headers ?
> >
> > If there's a pointer to the list of issues, that would be great, so I
> can help prod things
> > along (assuming I can sort out the build issues .. c libraries give me
> headaches ;)
>
>
> There's at least the connman build issue on musl with 4.9 headers:
> http://errors.yoctoproject.org/Errors/Details/116506/
>

Ah ok.

I'm not much good with musl unfortunately, but honestly, I'm wondering how
long we
can keep this out with relatively few build issues. In tree, they'll get
more attention.

I'll continue stacking on 4.9 changes until they get sorted out.  I'll
probably have some
cycles near the end of next week to get lost in c library #ifdef's, if the
issues are still
around.

Bruce


>
> Musl defines IFF_LOWER_UP which breaks compilation with linux/if.h.
> kernel has uapi/linux/libc-compat.h for similar issues with glibc but at
> least currently it does not check for musl...
>
> See other discussion "musl: Upgrade to 1.1.16+ on master".
>
>  - Jussi
>
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c05481e125c1a0545fa864d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jan 13, 2017 at 9:16 AM, Jussi Kukkonen <span dir=3D"ltr">&lt;<=
a href=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen=
@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><span class=3D"">On 13 January 2017 at 15:39, Bruce Ashfield &lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt; wrote:<br>&gt;<br>&gt;<br>&gt;<br>&gt; On Fri, Jan 13, 2=
017 at 8:00 AM, Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" ta=
rget=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<br>&gt;&gt;<br>&gt;&gt=
; Hi,<br>&gt;&gt;<br>&gt;&gt; Another consolidated pull.=C2=A0 Last run on =
the AB was mostly green:<br>&gt;&gt; - byacc on beaglebone-lsb failed (upgr=
ade removed)<br>&gt;&gt; - checkuri failed (transient, works now)<br>&gt;&g=
t; - selftest failed (fixed in branch, tests work locally now)<br>&gt;<br>&=
gt;<br>&gt;<br>&gt; Should I re-send my kernel queue ? It is now about 13 p=
atches long, and I&#39;m stacking<br>&gt; a few more on every couple of day=
s.<br>&gt;<br>&gt; I assume there are still some outstanding issues with th=
e 4.9 kernel, or more specifically<br>&gt; the 4.9 kernel headers ?<br>&gt;=
<br>&gt; If there&#39;s a pointer to the list of issues, that would be grea=
t, so I can help prod things<br>&gt; along (assuming I can sort out the bui=
ld issues .. c libraries give me headaches ;)<br><br><br></span>There&#39;s=
 at least the connman build issue on musl with 4.9 headers:<br><a href=3D"h=
ttp://errors.yoctoproject.org/Errors/Details/116506/" target=3D"_blank">htt=
p://errors.yoctoproject.<wbr>org/Errors/Details/116506/</a><br></div></bloc=
kquote><div><br></div><div>Ah ok.<br><br></div><div>I&#39;m not much good w=
ith musl unfortunately, but honestly, I&#39;m wondering how long we<br></di=
v><div>can keep this out with relatively few build issues. In tree, they&#3=
9;ll get more attention.<br></div><div><br></div><div>I&#39;ll continue sta=
cking on 4.9 changes until they get sorted out.=C2=A0 I&#39;ll probably hav=
e some<br></div><div>cycles near the end of next week to get lost in c libr=
ary #ifdef&#39;s, if the issues are still<br></div><div>around.<br></div><d=
iv><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div dir=3D"ltr"><br>Musl defines IFF_LOWER_UP which breaks compilati=
on with linux/if.h.<div>kernel has uapi/linux/libc-compat.h for similar iss=
ues with glibc but at least currently it does not check for musl...<br><div=
><br></div><div>See other discussion &quot;musl: Upgrade to 1.1.16+ on mast=
er&quot;.<span class=3D"HOEnZb"><font color=3D"#888888"><br><br>=C2=A0- Jus=
si<br><br><br></font></span></div></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the =
NULL pointer, for chaos and madness await thee at its end&quot;</div>
</div></div>

--94eb2c05481e125c1a0545fa864d--
