Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6C360809
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Nov 2014 22:54:18 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id dc16so4629972qab.34
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Nov 2014 14:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6ssdStB210WboefULHz0dWvHguBZEq/FUAcmFpiYDe4=;
	b=ObriLwWZXurCffT0Jj/KXR3niqxjB0W3bA6z7f4wT+k9FoEPiIPUQ289JYhQDKtBKS
	JGlqLK4j19z4HE+mksQ70ZHhIxtiV554Ntl6XUCm7ZbOIMfn3W8xCLQkpoQjLgfzCxPd
	7tfJKWKrxKvEBal+s8hjoVXkScFILxLseKwf2LFlAbY21GfYFYGpkgUY0vUb+yboJZU1
	xJZJhLtNQmLAwm/n31ezHmQBJEhDoykStfSNo81e3bZf4MUsVnNoOaDaQHZxA6ftjuL+
	Txh11lI8wcYyGcx8ZMxjrZVFusuJdDaWT/RquSAkNe52aKdYQ6M4RLSPvPFb1k45F7TM
	FpLA==
X-Gm-Message-State: ALoCoQnnq5L3Qr40nOin0RGoT968WpTe2e2QS1bPfJwqtk/4iVyWcE8qlabTvgjlxTnGwhXVz7CD
X-Received: by 10.224.138.2 with SMTP id y2mr34974577qat.52.1415573658566;
	Sun, 09 Nov 2014 14:54:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Sun, 9 Nov 2014 14:53:57 -0800 (PST)
In-Reply-To: <545E4DBD.6060806@windriver.com>
References: <cover.1415264548.git.kai.kang@windriver.com>
	<CAJTo0LbUiPaj5aE0Eb0W9zGthfqx5ct4+6-obv0pJEwPMseuiw@mail.gmail.com>
	<CAJTo0LY+Mx8KnjsuCQ==ROG5V286_ZDViJ1xPVe0FxAY58mm9A@mail.gmail.com>
	<545E4DBD.6060806@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 9 Nov 2014 22:53:57 +0000
Message-ID: <CAJTo0LaDa5D1XXtZpaPrzagesdkQAaT84rg=x4NWLLngWxQS6w@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/25] Add machine qemuarm64
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
X-List-Received-Date: Sun, 09 Nov 2014 22:54:23 -0000
Content-Type: multipart/alternative; boundary=047d7b6709c31299a5050774edab

--047d7b6709c31299a5050774edab
Content-Type: text/plain; charset=UTF-8

On 8 November 2014 17:07, Mark Hatle <mark.hatle@windriver.com> wrote:

> This is why relying on userspace qemu to do postinstall actions isn't
> good.  If the host kernel doesn't have a new enough kernel it'll break.  If
> the qemu does emulate the exact SOC, it'll break.. etc.. etc.. etc..
>

Do you know how new is new enough for aarch64?  My build machine is running
3.2.0 at the moment (Debian stable).


> So I would expect failures like this on anything that is using QEMU
> userspace emulation (any arch).
>

Apart from userspace ppc aborting we've done pretty well so far...

Ross

--047d7b6709c31299a5050774edab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 November 2014 17:07, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":274" class=
=3D"a3s" style=3D"overflow:hidden">This is why relying on userspace qemu to=
 do postinstall actions isn&#39;t good.=C2=A0 If the host kernel doesn&#39;=
t have a new enough kernel it&#39;ll break.=C2=A0 If the qemu does emulate =
the exact SOC, it&#39;ll break.. etc.. etc.. etc..<br></div></blockquote><d=
iv><br></div><div>Do you know how new is new enough for aarch64?=C2=A0 My b=
uild machine is running 3.2.0 at the moment (Debian stable).</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":274" class=3D"a3s" styl=
e=3D"overflow:hidden">
So I would expect failures like this on anything that is using QEMU userspa=
ce emulation (any arch).</div></blockquote><div><br></div><div>Apart from u=
serspace ppc aborting we&#39;ve done pretty well so far...</div><div><br></=
div><div>Ross=C2=A0</div></div></div></div>

--047d7b6709c31299a5050774edab--
