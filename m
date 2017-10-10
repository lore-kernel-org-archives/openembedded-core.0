Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 93AE6605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 16:34:20 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id n195so2792727itg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 09:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DCbrtiVtLUAU2XhUn23cIcgu3WhIlAbIgmsj1lltruw=;
	b=wovySzrrrqebBwXfOzhY3bER8BOgoW4Zm1x7fmqqykTDrtVYUSoxtqrzCW8r0ctn0r
	UdQhQvJ/HEuYd9XQDD/b9DKpNklPkhcMY3AwmkHG90m/IcLL1BRcI5XRQciAzdl4XiO5
	8TKhphd2dWU4Dx/fiRmcxkypOjfgPOdWPaZ3ND/i/tsWwJRCIY7Ps0idKX/vMSgIQENB
	tmFDF9KijVK8VFiQ1qMnNGo9AwvxzABuOHHEtu2fHaEONw2Ua6pmCcD6GSa2y3sQJvWz
	VDWjxm7FdVsZCOJu/udfUKgw8NJwFIxxKptcoGaAk/SlIIcV0WRGwz0sY76EP/e3hKFe
	lwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DCbrtiVtLUAU2XhUn23cIcgu3WhIlAbIgmsj1lltruw=;
	b=Rw6ZjSnUSIDPCJJaEN84H/1f4lD4PUPwkIw+CmfHks8W99eiklMjMyw9B25xBEsE4n
	kdDl3gEIIWv9jGkSficN7fTmcobBmC9Wr7AoKtTsye273Ma6kDQdVcDZv6pDm9zhnTqK
	kX60mWxpwp0wkd4ISKGs8r9qUnS1DmabfKN99ed3W02FEj3LopIFa88RiC8EBsukd6FQ
	H+6ks19x4LyPtAQQOTNn/JSzakchhlvWjn46CQ1o4E8XB0iAAMuCy1RSIDIZKxYGpGpS
	kPou94veBk4Np9TKhSepaHcdtlL82PNsotRjyk/RPELv4otyn23AefBvdOUbn5fDzw5I
	zZjw==
X-Gm-Message-State: AMCzsaWwidREweOQGEecK/NXxoV2j+4BAzSqOltxuBywWMPoxMrfN+mK
	Z7EkreQ/+eRmnvMqGFV9qUOPdRsND5TG86EUA1VQOQ==
X-Google-Smtp-Source: AOwi7QCxGi7AYVKuLc9NqJn9yiNFM6PsrQNFSJ8KCuCyZA0WwFxeC8jaV07hwjqs/Xw5pQEjlNPG4oK2DcJcVzEF6kU=
X-Received: by 10.36.178.1 with SMTP id u1mr21089686ite.120.1507653261610;
	Tue, 10 Oct 2017 09:34:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.205 with HTTP; Tue, 10 Oct 2017 09:34:00 -0700 (PDT)
In-Reply-To: <CAE-gg=4JFemmp8hXEz-+OfftE1MCrX3Snwd+SwDaFfDtRk3-EA@mail.gmail.com>
References: <20170927094014.2666-1-andreas.kling@gmail.com>
	<20170928163521.21828-1-andreas.kling@gmail.com>
	<CAJTo0LaWULzrFRwq+7Pwnv-_Py5-AHAYuKoc9iT61q1iuMLNFg@mail.gmail.com>
	<CAE-gg=5Wq6K4JdNpscupPVAHi+cY1Npo8_Ajt17uNMNbA0ZY=g@mail.gmail.com>
	<CAE-gg=4JFemmp8hXEz-+OfftE1MCrX3Snwd+SwDaFfDtRk3-EA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Oct 2017 17:34:00 +0100
Message-ID: <CAJTo0LbLAfSoyqR9SPDWO8jgc-53fku++dc5TOKJje3LNUK=xg@mail.gmail.com>
To: Andy <andreas.kling@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: add runtime dependencies to pam plugins.
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
X-List-Received-Date: Tue, 10 Oct 2017 16:34:20 -0000
Content-Type: multipart/alternative; boundary="f403045d9c0e1a6a8c055b33e186"

--f403045d9c0e1a6a8c055b33e186
Content-Type: text/plain; charset="UTF-8"

On 9 October 2017 at 20:00, Andy <andreas.kling@gmail.com> wrote:

> this was change in git [1] and landed in v.2.13.0. I won't indent the
> body in the future to prevent this.
>

That's stupid, I often quote by indenting in commit messages... :/

Ross

--f403045d9c0e1a6a8c055b33e186
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 9 October 2017 at 20:00, Andy <span dir=3D"ltr">&lt;<a =
href=3D"mailto:andreas.kling@gmail.com" target=3D"_blank">andreas.kling@gma=
il.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=
=3D"h5"><span style=3D"color:rgb(34,34,34)">this was change in git [1] and =
landed in v.2.13.0. I won&#39;t indent the</span><br></div></div>
body in the future to prevent this.<br></blockquote><div><br></div><div>Tha=
t&#39;s stupid, I often quote by indenting in commit messages... :/</div><d=
iv><br></div><div>Ross=C2=A0</div></div></div></div>

--f403045d9c0e1a6a8c055b33e186--
