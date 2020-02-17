Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 01F936145F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 13:15:38 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id p14so10303682vsq.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 05:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/HX9dG5AqX5tyX9skR1WquW30X/NPzqc7+/4f1Gws6U=;
	b=Hb2UFQ48Pi3hL0XRhYZl6B0YQiE5h5SNzWXYhtwEPMe5goN0QdgTWbvh9TBjQ2mEz2
	SdIzp0h62Ic77me3U0ebbAjy//S2Wk23THm+q8wSig+qxE2GHMpG5HOrEqdVKe1xa10Z
	HI2c0sKNVSt3y51qRIiHIzXkyxODSCA31lgcPgMGOIKrAguQjljCAogwbyioUrg1+x9G
	O2RcyDuIpgz8CPvbvGwaVITydt+OoyVPfqUlX2RIRIe6jq3suIEYEGfcRXez5aHGtCmx
	Ke7I1EM+D3jmDol0rYGQxLe1quQapgGc7SXYbkKQ43buhFA+0f7AV9zdBplzl9yztzf+
	cWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/HX9dG5AqX5tyX9skR1WquW30X/NPzqc7+/4f1Gws6U=;
	b=FSm0aB0Ro/jD2MyaE/khUzF8M2vkIR6fqxzP5ZqmgylPjsbqb909LXT4qVoEoRCwv0
	nJYb6sm67xKlA8SQdtQ3VOlA12SFKyT/oinsJ6WV/Z5OhvrvYY6N2hrpNGJ1tl2Hk+Bm
	JSfzyX58IhVJf/nGYx9mEIsUn6HJvAuh7XPPKsCeoZTPYY49rbSrCrmIH+kKk/8pqwUe
	W3PRcsR7d79QJL9WxpDfPvDTs6l5r8PFfjTBxZPGkpkgYL1O3Y6ecAhswURYOOaJ5QnN
	fA4V315ARXwRCSSRcLFUQ0MVycVIeQQyVEOJJw/yfkql2EsEdN04lTD1xWEMRfv8F5To
	11xQ==
X-Gm-Message-State: APjAAAVuurXRTkTwgnCG/9Y1oxG+29WhFekV/5uWazglWx1sz45eenm4
	L25L0scHMTmsEwpC78JqklsHtAUr18JG1xf2/Vc=
X-Google-Smtp-Source: APXvYqyky9YEZom4oARQUsWk8VOuEhUt6QWuNB6wddVG0jaISnAcPrg32Xs+FrGPOrsMv8r//9JQHkvkkbuuxyVPSww=
X-Received: by 2002:a05:6102:103:: with SMTP id
	z3mr8144159vsq.23.1581945339860; 
	Mon, 17 Feb 2020 05:15:39 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-5-alex.kanavin@gmail.com>
	<CAMKF1sppws+PSjDojzi7+=p_UjEkEafGa1_WtRLCpqO_73nhGA@mail.gmail.com>
	<CANNYZj8W0A12inq_K3kiShN7dsU3tsTuOgh4LZAtP-QcUVDaXQ@mail.gmail.com>
	<CAMKF1so86RKsiAXC=vzpT0wu8E=jiFMzJsVBdGb7SQ2TKxBo6Q@mail.gmail.com>
	<CANNYZj_k+iXWB_V3PQOv8eE8Pvwt8B-q4=x_F4e4hzisW-NXaA@mail.gmail.com>
	<CAMKF1spO36x=P-ts28+BEg+Pvw5FcEWNpyNyJGXcFB_jXSohUA@mail.gmail.com>
	<CANNYZj8ZC_pVkSHTisPryOJE7GfMqot5a=5uP5LUm3fB0nVMYw@mail.gmail.com>
In-Reply-To: <CANNYZj8ZC_pVkSHTisPryOJE7GfMqot5a=5uP5LUm3fB0nVMYw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Feb 2020 14:16:05 +0100
Message-ID: <CANNYZj9u8f+qD_3RTb+9O9cbNBk0UgteBcV_d7X2ffpCkg4UxA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] weston-init: use the drm backend rather than fbdev one
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
X-List-Received-Date: Mon, 17 Feb 2020 13:15:39 -0000
Content-Type: multipart/alternative; boundary="00000000000009594e059ec55a21"

--00000000000009594e059ec55a21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 17 Feb 2020 at 09:22, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> \perhaps then make this chage such thst it only affects the
>> architecture you have tested.
>
>
> Fbdev backend is not documented, and there is no guarantee by upstream
> that it will work. You wouldn=E2=80=99t want to use it on actual targets =
either as
> it has no hw acceleration support. I think the change should apply to all=
,
> we should test standard drm/kms code paths everywhere and fix/report issu=
es
> as needed.
>

The issue with qemumips in particular is that it is still using cirrus for
the graphics card, which has been superseded by '-vga std' for a long time:
https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/

If that is switched, then fbdev backend should be no longer necessary just
like in qemux86_64.

Alex

--00000000000009594e059ec55a21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">On Mon, 17 Feb 2020 at 0=
9:22, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.=
kanavin@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding=
-left:1ex"><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style=
:solid;border-left-color:rgb(204,204,204);padding-left:1ex">\perhaps then m=
ake this chage such thst it only affects the<br>
architecture you have tested.</blockquote><div dir=3D"auto"><br></div><div =
dir=3D"auto">Fbdev backend is not documented, and there is no guarantee by =
upstream that it will work. You wouldn=E2=80=99t want to use it on actual t=
argets either as it has no hw acceleration support. I think the change shou=
ld apply to all, we should test standard drm/kms code paths everywhere and =
fix/report issues as needed.</div></div></div></blockquote><div><br></div><=
div>The issue with qemumips in particular is that it is still using cirrus =
for the graphics card, which has been superseded by &#39;-vga std&#39; for =
a long time:</div><div><a href=3D"https://www.kraxel.org/blog/2014/10/qemu-=
using-cirrus-considered-harmful/">https://www.kraxel.org/blog/2014/10/qemu-=
using-cirrus-considered-harmful/</a><br></div><div><br></div><div>If that i=
s switched, then fbdev backend should be no longer necessary=C2=A0just like=
 in qemux86_64.</div><div><br></div><div>Alex</div></div></div></div>

--00000000000009594e059ec55a21--
