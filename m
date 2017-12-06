Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id CA5926011B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 12:19:51 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id r78so6887963wme.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 04:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=szQajVLNKMQbdjq0WCbGOdUz1t0Y7+dLv2bsxUsENHs=;
	b=axhXt/nJ36uWqvKsVZujnCxOi6AN7Iy9QALxtqc2+89RVHRJJrnXM1iPnkvWQ8kdKi
	MM4BV70QPmpxYifBSdhrrCqcP+V/kn+Yy5U815WnNYVOJpxp74jqAdTO8yueocu5QdHK
	axtujIXdTkwnrqyDZacsFSyhMSEj3f18ORr55JWMkcpcWZ+9BsHkwAaluq8dGR3K5Nv7
	+PjN1ISO4hJTHRjpwvWYa8jCViIKcx7AVV5K9MFsVJoMcbIDKdIJRr241Z6l+oPh/GcB
	2U+KgtOpihrkaspTNRZGQwyW9t2tlCz/AtXO/aZfU02KhoUgJJFIa3YMdZuF6s577Qp2
	eF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=szQajVLNKMQbdjq0WCbGOdUz1t0Y7+dLv2bsxUsENHs=;
	b=UTrsu/x0/Bd6wipyTbkwH7UrR1PQiqnh79719h89R/JxB1aDtImjYE3UcvqYnhtTO0
	B75tuiAB15oh0BED+rl0om8YraS0pnXFDFxemmxq3dRBUSZLrVWS4cjb9H1+0Gt4x3Qt
	XKE/+PvBokQZTQrfBWARYCYrtNsi19Q69/DEJIz+6fSw4xq3KVdj5OxLadzmRnvMDy36
	xQyFwCUMMP9Fn4KVSckcTUa132zYzdewBy185eB5d0bztwfoWjX6wy80fH2p7cdPFvHB
	s5uaSLR+VfZyO9sru9plHjyZ6i4uUuI3S3zeIdMLoBp0JKGD1reKH/kIWmDnmgaHRfDj
	FLwg==
X-Gm-Message-State: AKGB3mKw2jPDJIYgBq70RZoNxIBVy7xUCkCyS5wA+m8LLLfn6HROjb5V
	RwS4FmQFQWUFu4b6ZCoev0G11GT51USswiyEkBI=
X-Google-Smtp-Source: AGs4zMbXBLDYUH63CeZmW3/A+pS7WzF4Yz6Qc0CSHN+Fb2uxQhF1TvpXwCl+qbhqESKdTEW2LitACZPqhZiEno6AIbg=
X-Received: by 10.28.103.68 with SMTP id b65mr8905933wmc.117.1512562792414;
	Wed, 06 Dec 2017 04:19:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Wed, 6 Dec 2017 04:19:51 -0800 (PST)
In-Reply-To: <CAP9ODKq14eNanqVJpXDyRdtr=fd_W5_7r6MhjAztVmg5FGbn7g@mail.gmail.com>
References: <CAP9ODKq14eNanqVJpXDyRdtr=fd_W5_7r6MhjAztVmg5FGbn7g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 6 Dec 2017 13:19:51 +0100
Message-ID: <CA+chaQd+T_OnX9vCYC+Qud_mm13tn8u796DZ0RuaUT42xWubWg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko] Go fixups
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
X-List-Received-Date: Wed, 06 Dec 2017 12:19:52 -0000
Content-Type: multipart/alternative; boundary="001a114b2faaf143f9055faaf706"

--001a114b2faaf143f9055faaf706
Content-Type: text/plain; charset="UTF-8"

Thanks,

this will most likely fix the issue I've reported earlier in:
http://lists.openembedded.org/pipermail/openembedded-core/2017-December/145278.html
as well.

On Wed, Dec 6, 2017 at 12:28 PM, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Hello Armin,
>
> There was one patch which was mistakenly forgotten on rocko-next, and
> ended being merged. It ended being reworked in master and I did the
> needed backports/revert in our repo[1].
>
> 1. https://github.com/OSSystems/oe-core/compare/rocko...rocko-next
>
> Please consider applying those soon as rocko is currently with a
> broken Go toolchain.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114b2faaf143f9055faaf706
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks,<div><br></div><div>this will most likely fix the i=
ssue I&#39;ve reported earlier in:</div><div><a href=3D"http://lists.openem=
bedded.org/pipermail/openembedded-core/2017-December/145278.html">http://li=
sts.openembedded.org/pipermail/openembedded-core/2017-December/145278.html<=
/a><br></div><div>as well.</div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On Wed, Dec 6, 2017 at 12:28 PM, Otavio Salvador <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=
=3D"_blank">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Hello Armin,<br>
<br>
There was one patch which was mistakenly forgotten on rocko-next, and<br>
ended being merged. It ended being reworked in master and I did the<br>
needed backports/revert in our repo[1].<br>
<br>
1. <a href=3D"https://github.com/OSSystems/oe-core/compare/rocko...rocko-ne=
xt" rel=3D"noreferrer" target=3D"_blank">https://github.com/OSSystems/<wbr>=
oe-core/compare/rocko...rocko-<wbr>next</a><br>
<br>
Please consider applying those soon as rocko is currently with a<br>
broken Go toolchain.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile:=
 +1 (347) 903-9750<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a114b2faaf143f9055faaf706--
