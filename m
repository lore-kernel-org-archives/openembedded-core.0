Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5D46E7F35D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 13:22:24 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id o19so17358446vkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 06:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Jm8hWJ1Vtkb+yILQ3zA3CKVFrmPcGN94+HErNLgbuFc=;
	b=ibQ7TMafHhp3iEPs9EQTnjP+S4j160t1ElsEvtwAhYn1PnwWlVel9VdfDQt7uJ9zQz
	k2NQB6GZkSN2nPs7GOGdGuVzIuVBUEj46DZO9X0L+CXWXPuafWGakTHbVfc5K5Kyrluj
	ptZbqJjTYyRnYeSPQ9+bSDVpKhQYbfMbmx/82NyBD3m1h/CX2SmFUOUe9Z5tFk7mf0fq
	eefWg+UwrarZQMsazg5VPe0Bp5xDqvoyXdfcyQoAA64SMYTPlQoDf9XgNEYHKzNSL6+n
	M9mszs3Fpa7S+81Wekp3P34KYhUKd0FEgbcX/R3PFtdI9urR4yc/3Kpoiw9XM5czvhbr
	RBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Jm8hWJ1Vtkb+yILQ3zA3CKVFrmPcGN94+HErNLgbuFc=;
	b=fajwaTIlWE10H5VSF7on1syT8i9KgLx6tzeCNCESvWTxNBD7RAslUihB0e/sSsVTkX
	LSK3SGN+ZdvvVHN5fsfpf5KaaIue04GFgmKFyVactfK4fvDScEDmRkk2I5HQXlGpZLaq
	uFiYGX75DECjwknc+/rgZwvBjxdxOxg85sO0Rm92TfTrxOmHnwmpklUG6Ald8M4m3sMw
	30tDcfDCB4lvIEwZoW1TVgfnt54D3IC5/Iv3QBNF8W38lYppsaC0WybdMZ7HqgQ6THp7
	3oBPm+wd7xGxGyUTnqHxQvS5uomANREgAVEVhG7LSbqiLoSFYS/u2SwzMQ37eokukfmb
	CFzQ==
X-Gm-Message-State: APjAAAWJzuYF7HTlaclWjidcSkq7KoXH7jwj+sacGMCnenRuT/RhPNfr
	pjeTpzaYG33PjtHdt3IOTkDsM/nuLs0lHgFkJ+8=
X-Google-Smtp-Source: APXvYqx3gyqivwcb7rLEiyBDVrROCsvNqi8dUcpiqg30RhjVcwDCOlVqmPlSeyejyj2mfohrT9Jvr9XinNk8nPhjdeM=
X-Received: by 2002:a1f:8bc4:: with SMTP id n187mr1131869vkd.32.1565097745120; 
	Tue, 06 Aug 2019 06:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565075067.git.liezhi.yang@windriver.com>
	<e5519d97e195842c793f688162919b21851d1dcb.1565075067.git.liezhi.yang@windriver.com>
	<4f3b75ada0eae73855b43347a56ea89042ab6aae.camel@linuxfoundation.org>
	<18287a98-33b5-c788-946e-5b5338c1c204@windriver.com>
	<CANNYZj8nk8q7VscomyLkaLYcNy-2gH+nwgsKgAO7x59i7uDgHw@mail.gmail.com>
	<eba25cda-3ca0-039d-45ea-f9a86e80b4f6@intel.com>
	<CANNYZj-QUcKdw4BygFyfXLSm4L=89XC44u65LNFx2OiiqrQE0Q@mail.gmail.com>
	<CA+chaQfsQLEcxS9-XVQJT-7PR-JgtZ1cEFMdbJshmYMst6s2Lw@mail.gmail.com>
	<CANNYZj_YSBdctNSqewYy96qofF4A_XkVVWahU0wMw3nBV=q58Q@mail.gmail.com>
	<b25b0b717daa6dbeecd61255caf10bc49deb3509.camel@linuxfoundation.org>
In-Reply-To: <b25b0b717daa6dbeecd61255caf10bc49deb3509.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Aug 2019 15:22:13 +0200
Message-ID: <CANNYZj9iLsF0fBRCYp+_CbRakizOyN=CJuDdRtZ9OdnZ84rFbA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] stress-ng: Add bash to DEPENDS
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
X-List-Received-Date: Tue, 06 Aug 2019 13:22:24 -0000
Content-Type: multipart/alternative; boundary="0000000000002302d6058f72b7a4"

--0000000000002302d6058f72b7a4
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Aug 2019 at 14:51, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> We now filter the pkgdata to the things a recipe can see in its
> dependencies after:
>
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=99206cb7b41be7a124ea8339bc891077f02128a2
>
> Does that help? If not, is it because some code isn't using the
> filtered copy? Or could we use this technique somewhere else?
>
> I've not looked at the underlying issues enough to tell which code is
> actually triggering it but that kind of approach should help with this
> kind of problem and at least make it deterministic...
>

I think the issue might be actually in the QA check where it looks beyond
the recipe's immediate RDEPENDS (and then fails or not depending on whether
those indirect dependencies have been packaged). I need to better
understand what happens there so will add some printouts first. The problem
does happen with latest master.

Alex

--0000000000002302d6058f72b7a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>On Tue, 6 Aug 2019 at 14:51, Richard=
 Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.p=
urdie@linuxfoundation.org</a>&gt; wrote:<br></div></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
We now filter the pkgdata to the things a recipe can see in its<br>
dependencies after:<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D99206cb7b=
41be7a124ea8339bc891077f02128a2" rel=3D"noreferrer" target=3D"_blank">http:=
//git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D99206cb7b41be7a124ea8339b=
c891077f02128a2</a><br>
<br>
Does that help? If not, is it because some code isn&#39;t using the<br>
filtered copy? Or could we use this technique somewhere else?<br>
<br>
I&#39;ve not looked at the underlying issues enough to tell which code is<b=
r>
actually triggering it but that kind of approach should help with this<br>
kind of problem and at least make it deterministic...<br></blockquote><div>=
<br></div><div><div>I think the issue might be actually in the QA check whe=
re it looks=20
beyond the recipe&#39;s immediate RDEPENDS (and then fails or not depending=
=20
on whether those indirect dependencies have been packaged). I need to bette=
r understand what happens there so will add some printouts first. The probl=
em does happen with latest master.<br></div><div><br></div><div>Alex<br></d=
iv></div></div></div>

--0000000000002302d6058f72b7a4--
