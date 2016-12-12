Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 51C48719A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 20:43:05 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id x190so96103338qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 12:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LvxevMTDSm6XGsZs1jz1lb5EbhmPaFuPLv+DGgS6vvI=;
	b=1F1CWAQfU1xQzOllHysLcE5qUL96CrWwqDU4GtIybu0kKHvmmMjoPRKUlrZ797b4HZ
	0PkiHyGcoh9CGks/FFn3oelUTfWY/NeSFhGbQ4RURciGEUfNlmcY8PpYyE5OkE+gykfa
	Iqs851raawZ02SCY9oTEw5dXgtZBB8tcRHxIPr9c3BMdPWW5vRhPQSNwzN8xasKbyK2Q
	XbFEt+0dyfi1yVRZtP4msbwh5DMDfYKWLwmuB70A595NltKv/IFnOelsPdvBc/6sADsY
	QO3RbEyniYL2XGhbC0rmMv9DmcB0DauspPZUtOvSVj9DHYXPJqF/0uae0C7ft/wD3qE+
	nZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LvxevMTDSm6XGsZs1jz1lb5EbhmPaFuPLv+DGgS6vvI=;
	b=INKYSRcg+RMFbag2O4XDXaMTDNYh469ttA2SbBlQzg8aAceBG6F4PpDFnp7zKAkmJT
	tzs8gxo8a8p6HvvRxOUrMELluQWSiQkoQ/atckHv+Cy+cjjVBdw6c0zCOvlbcKO1ZrMk
	ktQ8M4W3xna7x5VewVPP4ly3TDyQaA10IhTEKxdGILvNoAyBzs0moq6VCT7dEcS/Ao1K
	ePXqwn/0L6dJft/f8Mo7p4+YGpKqswXUpjniTawW6Ch47PGSfVsnr0m8k5eBGd23Ze3B
	vd/nZ2L7EJ4k3QyISbgOtMD92L1po2x3TKaZ/LtPuiYYh+A8cGOE8OygAALQL5W11EQK
	9nqQ==
X-Gm-Message-State: AKaTC03mkXAxjEp4rMyYNgBK2a2omfSTBihY2w+z0NL30wH3XJOErzihf7yL/rYuDX8v3D3XJkW7I4ATi+PCAFoi
X-Received: by 10.55.75.17 with SMTP id y17mr72925900qka.26.1481575386542;
	Mon, 12 Dec 2016 12:43:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 12 Dec 2016 12:42:46 -0800 (PST)
In-Reply-To: <FE42CCA4-D2B8-4AE1-83E5-5CBE94FA160C@gmail.com>
References: <1481571408-19983-1-git-send-email-mark.asselstine@windriver.com>
	<FE42CCA4-D2B8-4AE1-83E5-5CBE94FA160C@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Dec 2016 20:42:46 +0000
Message-ID: <CAJTo0LacDkdcdDK4gJZDbe_Sf-GsVg2v7o9KriQ7X-7p9-5Grg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: disable 'libdir' QA check
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
X-List-Received-Date: Mon, 12 Dec 2016 20:43:06 -0000
Content-Type: multipart/alternative; boundary=001a114a88c89f889c05437c2674

--001a114a88c89f889c05437c2674
Content-Type: text/plain; charset=UTF-8

On 12 December 2016 at 19:59, Khem Raj <raj.khem@gmail.com> wrote:

> Can we check if systemd can be a bit more flexible and accept it to go
> into multilib libdir ?
> this patch can be then applied if its not acceptable to systemd community.
>

Agreed, whilst I get that systemd really wants to use /lib as "libexec in
/" the libraries most definitely should be following $libdir.

Ross

--001a114a88c89f889c05437c2674
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 December 2016 at 19:59, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":2y9" class=3D"a3s aXj=
CH m158f49de43b7d2fd">Can we check if systemd can be a bit more flexible an=
d accept it to go into multilib libdir ?<br>
this patch can be then applied if its not acceptable to systemd community.<=
br></div></blockquote><div><br></div><div>Agreed, whilst I get that systemd=
 really wants to use /lib as &quot;libexec in /&quot; the libraries most de=
finitely should be following $libdir.</div><div><br></div><div>Ross</div></=
div></div></div>

--001a114a88c89f889c05437c2674--
