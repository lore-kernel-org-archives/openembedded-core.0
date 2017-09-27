Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5720A6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 11:12:42 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id m123so6611746ita.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 04:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QDdJCV+ZmKcFeLMxh9wEdGLoFEdOQkyLovUCWilMovw=;
	b=ihgLXHm1re/YvgOYvL3CH6TG0P9uF/V9skc/skE7S9lLWQsMrTXuYcSoBmfElMuAaH
	MvpyEypLRk9atELsu9QQj82BfO0YzdtB2GqjOlsof2T/3piNSy0v3GnTu/wIqIVTWSAd
	9uvZPSUF7Ivr5p8Hp/XoUs6aKrQkpTgOQ8pJ91zrw8daTJyZ7XGEoPD4c9ydt3tA1zGd
	yHOgzQC2ggn784ygdorOinI40lrlEbNlPu3WA5OTyNuju3kIwLYcEbcbwfe6LsZMz/Yz
	tQ9buWnR8ewxYf9fPn2v9KOLspEU26o2jPL1BwwpoQ8df7jIsA0T5gzrElBhTuJzs86x
	D+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QDdJCV+ZmKcFeLMxh9wEdGLoFEdOQkyLovUCWilMovw=;
	b=p4YOBE4NPcB4Jj7jLfdq4hpiMLFFOyIqLVIZIcSDxn5/sPk/Cg74SfB1n0dHpRrcXG
	scEw3nFZfCM9vC1C5FQkPQZZbSH3kmJwzZiZw5QplvrRI4mP/XZc7pAnAv3h1oQmwQjK
	jnlYT4yjQrGJVBMsvhGduVQUoY+zc6pns8V20YLmwKyWelatp/44FyvtegqFwebcKAn8
	R3+6lvDmtQoXJBG/QKEVSlfJ8hMfxhhAHCWnOSn5s4UY+By1zXEIeXSxLGqcguUu5E5S
	j1P2xxBNQ7rh/nfAj16H49TVa1qtUwMYNhTD42rQ4sHZgVBg9yrbuKNYnY6brEowjn82
	OepA==
X-Gm-Message-State: AHPjjUhxs7SC0chKYuZ+HzUIx3PzdzcsISef3xtlGT9AVwEHLmbAYxxB
	T6kFX+sD6VLR2+lqUj/mrH/Oe/emiAgRMZkD0Gloaw==
X-Google-Smtp-Source: AOwi7QD/564DgZnKcsLz1Cl5BwlHHnJKlyWbcjsMR0adVWiclBl2I0sWuiwsRCDLhvnwjfca+5jW9GwAu7oN2b+OGY4=
X-Received: by 10.36.178.1 with SMTP id u1mr2045315ite.120.1506510763465; Wed,
	27 Sep 2017 04:12:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Wed, 27 Sep 2017 04:12:22 -0700 (PDT)
In-Reply-To: <1506467312.13215.1.camel@collabora.co.uk>
References: <20170922110243.10454-1-fabien.lahoudere@collabora.co.uk>
	<20170922110243.10454-2-fabien.lahoudere@collabora.co.uk>
	<CAJTo0LYMQ9NAvK+zNegmtbPQnPao1rx6wQM1q48TRP6FDUopHg@mail.gmail.com>
	<CAP9ODKp6tsZd34jS1QzDnEpi=0ALSs8GaHFPC9iVO-5wjkUD7A@mail.gmail.com>
	<CAJTo0La3fRSYaQAgWZt-qWB-noNsqvgO8Q2G4wYgqj62qB8Mug@mail.gmail.com>
	<1506467312.13215.1.camel@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Sep 2017 12:12:22 +0100
Message-ID: <CAJTo0Lb3sAfd1Cs5gfoLD06_r62qPnxc+RcuqFDCFa9EWMJJtA@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/4] wayland-protocols: Fix installation patch issue
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
X-List-Received-Date: Wed, 27 Sep 2017 11:12:42 -0000
Content-Type: multipart/alternative; boundary="f403045d9c0ee83a7b055a29de32"

--f403045d9c0ee83a7b055a29de32
Content-Type: text/plain; charset="UTF-8"

On 27 September 2017 at 00:08, Fabien Lahoudere <
fabien.lahoudere@collabora.co.uk> wrote:

> On Tue, 2017-09-26 at 20:16 +0100, Burton, Ross wrote:
>
> On 26 September 2017 at 19:04, Otavio Salvador <otavio.salvador@ossystems.
> com.br> wrote:
>
> On Tue, Sep 26, 2017 at 12:29 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > Does this depend on the upgrades, or should it work standalone?
>
> This works standalone. I've been using it.
>
>
> In which case I should report that when I applied it, building weston
> failed:
>
> make: *** No rule to make target 'protocol/xdg-shell-unstable-v6-protocol.c',
> needed by 'all'.  Stop.
>
>
> This is because I test with weston patch (3/4) that drop line "
> WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT}"
>

Bisectability is important, so reordering the patches so this patch is
first and everything still builds followed by the upgrades would make both
merging now (there was a chance that this patch would make 2.4) and later
bisects easier.

Ross

--f403045d9c0ee83a7b055a29de32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 27 September 2017 at 00:08, Fabien Lahoudere <span dir=
=3D"ltr">&lt;<a href=3D"mailto:fabien.lahoudere@collabora.co.uk" target=3D"=
_blank">fabien.lahoudere@collabora.co.uk</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div><span class=3D""><div>On Tue, 2017-09-26 at 20:16 +0100, Burton, Ross=
 wrote:</div><blockquote type=3D"cite"><div dir=3D"ltr">On 26 September 201=
7 at 19:04, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"mailto:otavio.=
salvador@ossystems.com.br" target=3D"_blank">otavio.salvador@ossystems.<wbr=
>com.br</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"g=
mail_quote"><blockquote type=3D"cite"><span class=3D"m_-5589556574993032862=
gmail-">On Tue, Sep 26, 2017 at 12:29 PM, Burton, Ross &lt;<a href=3D"mailt=
o:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wr=
ote:<br>
&gt; Does this depend on the upgrades, or should it work standalone?<br>
<br>
</span>This works standalone. I&#39;ve been using it.<br></blockquote><div>=
<br></div><div>In which case I should report that when I applied it, buildi=
ng weston failed:</div><div><br></div><div>make: *** No rule to make target=
 &#39;protocol/xdg-shell-unstable-<wbr>v6-protocol.c&#39;, needed by &#39;a=
ll&#39;.=C2=A0 Stop.<br></div><div><br></div></div></div></div></blockquote=
><div><br></div></span><div>This is because I test with weston patch (3/4) =
that drop line &quot;<span style=3D"font-family:monospace">WAYLAND_PROTOCOL=
S_SYSROOT_<wbr>DIR=3D${RECIPE_SYSROOT}&quot;</span></div></div></blockquote=
><div><br></div><div>Bisectability is important, so reordering the patches =
so this patch is first and everything still builds followed by the upgrades=
 would make both merging now (there was a chance that this patch would make=
 2.4) and later bisects easier.</div><div><br></div><div>Ross=C2=A0</div></=
div></div></div>

--f403045d9c0ee83a7b055a29de32--
