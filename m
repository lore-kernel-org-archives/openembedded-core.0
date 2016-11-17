Return-Path: <kergoth@gmail.com>
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id B63466069D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 16:15:40 +0000 (UTC)
Received: by mail-yb0-f195.google.com with SMTP id d128so7208021ybh.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 08:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=9TlVftVl5JnNYP6158TqxbWNPR3PBVqkH7zK/U8He5I=;
	b=f787DVMHxlR2Qb+X4vA8FVAjFWNx5bEahDfi99tk55Z/e0cljVxN6WIV2LiqWt7c7u
	ZmKMYdvT2p9L8L7o+Z6xRswPhJSYAAHD0xaLjhjv58tivs6uOTr5+7qWUy9swl1HrwoO
	vUtUk1LouMSHSPH+C20IqrE42/6YOXhpk190KelxuccGsc6GoB6jELUC6kd2EjpyKzZc
	IwCDi5YSdB73PmLOYigBrP13wqrAgQlYh7Kfo6OXYwNdBLQUHCcZ3ePreNV/HkujvM+0
	VDthn8WEy574vipC3XGwCe3Bjr3Hetx/H3HD1daDlAfT4zd/2pSkDMNpPNwLUuOVj+0I
	ngGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=9TlVftVl5JnNYP6158TqxbWNPR3PBVqkH7zK/U8He5I=;
	b=UT0cphOfmghiKhHMMF1WHpBT7MCyTaQaDc5g5kQRKNwLQ+W2PCaynWTWHPZrt6VrNt
	Di3zMjiOh6c78snIqGE/YSNiIsLtc+nNR/5tVPVtKa+HvobXzRIxSl9ofS9t+N8Nh8Et
	AU2l9QR8xCWiJxm00WP8cfGsS5GjzQNGVcxiC2ZqiRgmms78T0/hjdUanbKq2yIbxTVU
	cr44Zf5PYjrgeWcU+/hTK7Sf+HtIJcvM43nCAxXKuz/0WQNfjWF4QVpL0EPvJeRQhb99
	4x+qzAQB6Es7MpZZeOi8AkVAZ4VUGg71liDutJE/elC9IXbD+9WEVwgRDpXqXl4sIl3m
	9zZw==
X-Gm-Message-State: AKaTC036uOsBHtfKyp4o/VIg4/dGTm7clE6IKsSSA7MzUCmo8DyIMwWr09TxG5eWJSksBVUhQBR9KtiJsIVsVg==
X-Received: by 10.157.17.174 with SMTP id v43mr1655075otf.251.1479399341756;
	Thu, 17 Nov 2016 08:15:41 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.35.65 with HTTP; Thu, 17 Nov 2016 08:15:21 -0800 (PST)
In-Reply-To: <CAAPZna2pDLyq6PH6sb8c0J_Bxa2Pi+FNNZw_tVJ38o90mGsEJw@mail.gmail.com>
References: <1479396394-26134-1-git-send-email-fabio.berton@ossystems.com.br>
	<CABcZANmh+pV4Xxwi2UY7fA+BctpVXRvM6gLcgMJEx-rwODMi4g@mail.gmail.com>
	<CAAPZna2pDLyq6PH6sb8c0J_Bxa2Pi+FNNZw_tVJ38o90mGsEJw@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 17 Nov 2016 09:15:21 -0700
X-Google-Sender-Auth: m-9nvjSa8pjJ5hBaXqEnWrUHwKw
Message-ID: <CABcZAN=55DOHHy0fMJi6pPaR+TuwgwfErOd7YBAN=s_e9D0rwA@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpcap: Fix build when PACKAGECONFIG ipv6 is not enable
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
X-List-Received-Date: Thu, 17 Nov 2016 16:15:40 -0000
Content-Type: multipart/alternative; boundary=94eb2c18fcd43f1a9a0541818058

--94eb2c18fcd43f1a9a0541818058
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2016 at 9:11 AM, Fabio Berton <fabio.berton@ossystems.com.b=
r
> wrote:

> Patches in this commit have Upstream-Status: Submitted tag.
>

I know, the point was the tag was within the commit message in the patch,
not just the patch file =E2=80=94 wrong location within the patch file. Is =
the
Upstream-Status tag in the commits you submitted upstream? Unlikely, it=E2=
=80=99s
oe-specific metadata.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c18fcd43f1a9a0541818058
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 17, 2016 at 9:11 AM, Fabio Berton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berton@os=
systems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 class=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size=
:small">Patches in this commit have Upstream-Status: Submitted tag.<br></di=
v></blockquote></div><br>I know, the point was the tag was within the commi=
t message in the patch, not just the patch file =E2=80=94 wrong location wi=
thin the patch file. Is the Upstream-Status tag in the commits you submitte=
d upstream? Unlikely, it=E2=80=99s oe-specific metadata.<br>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">Christopher Larso=
n<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZau=
rus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div=
>
</div></div>

--94eb2c18fcd43f1a9a0541818058--
