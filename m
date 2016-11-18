Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD3871AD8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 20:12:48 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id n204so278102737qke.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 12:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u1zTJ4cgHpvKHlb01XLiZjKt+vGVNARXOIfr8getqno=;
	b=I7VIzWcTlvmkUDyRUFyvNMzG/PiZ/UWcWyut5sYo+0oegmFiJegyCyHNflAMzgpHEx
	XO+O166Jee6EqxuKgL9aEsxRsNYKrFAbngcu1ri+/lformECGzN7+U1yIqfLxDySHffL
	vW4a6/VXWkC19Fr34BRL+LTj7CosGQ/lNivQKbtv4hHc+Rgd535miT9xfOt+7mgiyZoE
	o0198HUiUPPf+JDk2WfSQhwfT6mMpVOTnTf+0XHcuSYL2KVvn0ZlkNwlqRCocOF001T7
	FhSmgliXgDUuH9TbnRAd5V1aS6egqx3O9sfuxOckUXzy+l6l/iG6icTvNld03nk9WYsa
	Euaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u1zTJ4cgHpvKHlb01XLiZjKt+vGVNARXOIfr8getqno=;
	b=SrvcZZxf083uagmrKHcFdyyxoeXbjaPXrTRXKrAhrdJFWlzpe2p5iHgg1lNt7UZPaD
	PIUPD4T6i6Ldvm8uV+wKapC1hRBlvbeQMrXwR/5X076OzFaQfo3PAutosSpkYxd7rUta
	10Ub1gML8uKnOCF74bQe4vENntd6xgeo15I/7+wCgIA4mLqvaFtmKB2+PzDrFDKRxBvW
	v3NY6984p9o96n8QRPAuUSP6mtKpev/Y02PR8jl2J+1xjhUPcgdasJE7p+s2nswacAv4
	GglsX2dGbiajEJMHzEMa+zNWqanFFzy0e0kqQXHivsat2MbEdpWJxr6gppddzUXIJvg4
	WYzA==
X-Gm-Message-State: AKaTC00KmiUJVBTl7Ut/3RbAXnwxwSsCkxA+LQy80jryOOWAVO2aRMOaxaNRp2FNO0Vwb2B0Ho86oBTHm1DZIPEX
X-Received: by 10.55.207.78 with SMTP id e75mr2317935qkj.36.1479499969042;
	Fri, 18 Nov 2016 12:12:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Fri, 18 Nov 2016 12:12:28 -0800 (PST)
In-Reply-To: <20161118193748.4850-1-dev@codyps.com>
References: <20161118193748.4850-1-dev@codyps.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Nov 2016 20:12:28 +0000
Message-ID: <CAJTo0LYvMEV8v4H1cp1jq2tHmUVY1r9BQfbZJigZxnRLdyOT8A@mail.gmail.com>
To: Cody P Schafer <dev@codyps.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cantarell-fonts: add inherit pkgconfig to get pkgconfig dependency
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
X-List-Received-Date: Fri, 18 Nov 2016 20:12:48 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b819fe5b054198ee4c

--001a1145b7b819fe5b054198ee4c
Content-Type: text/plain; charset=UTF-8

On 18 November 2016 at 19:37, Cody P Schafer <dev@codyps.com> wrote:

> Without this, do_configure can fail with:
>
>         | ../git/configure: line 2381: syntax error near unexpected token
> `0.19'
>         | ../git/configure: line 2381: `PKG_PROG_PKG_CONFIG(0.19)'
>
> If pkgconfig-native happens to be added to the sysroot too late.
>

Looking at upstream's configure there's no reason why it calls that macro,
so you could submit a patch to remove that line upstream and then just bump
the SRCREV.

Ross

--001a1145b7b819fe5b054198ee4c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 November 2016 at 19:37, Cody P Schafer <span dir=3D"ltr">&lt;<a href=
=3D"mailto:dev@codyps.com" target=3D"_blank">dev@codyps.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":2x7" class=3D"a3s aXjC=
H m1587905ecede8ae0">Without this, do_configure can fail with:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | ../git/configure: line 2381: syntax error nea=
r unexpected token `0.19&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | ../git/configure: line 2381: `PKG_PROG_PKG_CO=
NFIG(0.19)&#39;<br>
<br>
If pkgconfig-native happens to be added to the sysroot too late.</div></blo=
ckquote></div><br>Looking at upstream&#39;s configure there&#39;s no reason=
 why it calls that macro, so you could submit a patch to remove that line u=
pstream and then just bump the SRCREV.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--001a1145b7b819fe5b054198ee4c--
