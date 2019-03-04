Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 385987C933
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 16:17:41 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id g12so6200852wrm.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 08:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xAb6bBxOiJuKUfJrr9XPf7bd1IC8QvjhexTbnK41Eyk=;
	b=Z750Q0QiLqPKxxnjlxmV3dzCYm/O0HdW/disD10ozoeDJT4Eoe9tS2sI3KwZDoo5Mk
	3FJzSpgTwxENhBB/giafSZV/rhHOBvPtSLO6r7CcSSvTu9/O7CK6bOdUvvYC6eNEKhgP
	wOGRhbLaItli4FMr6SJnr5Pr8HBz/AfJ0T2j9nOwy00O/KPAHQ5fvqpt8/aHthQ8K8h8
	mbc1rxVI7NXkx9k3s0co/diXd1SpiKPiXa7yb3QmEBVqTb5mswAUmJ3oU1vz32ohMjh0
	JKWZoODfqYcIxMA2eOteHFHf/vKp0HuzuFFyTpE/VOdtIfm+OfDTQRL+tOBGDwFrJaZ/
	rPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xAb6bBxOiJuKUfJrr9XPf7bd1IC8QvjhexTbnK41Eyk=;
	b=CrYEL/Z75vm3/OdF8GrZ/4kz68jkOEGZ/+JMvybkXZeOMRKL/oaNeVU8ydq6lzfdDw
	p878UQ3/sFQQjOEW8Kjo65FheXbGjTyZYQuNIV4PV7fmPT9kNccSXpv/GbAgBNPlKPmT
	7gLk5Qu9oIaucVovTRE0RrDdyPRCPvtypTREtSadceTZV8mZIimH0WZbUU1c/8dyoB1z
	nXg6xjfq6PfGEWkaoIsg4GumfwNL0gQ4jvCFkbDdFHClhawDM/vu0j8+udN0FVZiP4xZ
	JB7BSgl0B8D+tVXbVPUXbmB/Zc4zhgSRamaPU12uUSCs3dAP0PL2DqqncZLGr8yKsCbx
	bXXQ==
X-Gm-Message-State: APjAAAWRjrMGOlNF0efhKYGhQGT5rQRTatYUS5VoxLY3/VIkFWytlkwc
	toreVK3uPfS9+0ritzamz7aRCNJltKv0OopFMYg=
X-Google-Smtp-Source: APXvYqzKFwckIaYqnRzkh/yCKRys9HrALI0bRbo1tRyBKyZA/R/4e5lJcJ4x7sms490E3futHI3aq1c2mdC6+uJ7HlU=
X-Received: by 2002:adf:e949:: with SMTP id m9mr10145256wrn.1.1551716261863;
	Mon, 04 Mar 2019 08:17:41 -0800 (PST)
MIME-Version: 1.0
References: <20190303204731.GK5026@bill-the-cat>
	<CAJdd5GYLLN4OB+wRsFGN10Cs2ybvKNcM_TP5pMHRdycf0M_Lsg@mail.gmail.com>
	<20190303212515.GL5026@bill-the-cat>
	<CAJdd5GbdpUCenci29Pk16vzhFDR=rMb_sd9CWD15pHreFPQfDw@mail.gmail.com>
	<20190304155845.GP5026@bill-the-cat>
	<c35172f8efc2e7d16a7915037f4b0d412d1707c0.camel@linuxfoundation.org>
In-Reply-To: <c35172f8efc2e7d16a7915037f4b0d412d1707c0.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 4 Mar 2019 10:17:29 -0600
Message-ID: <CAJdd5GZP3G0vgc-E-zSXMCNw4+y95_nrMEN3YMfk=SFFJ874GQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Tom Rini <trini@konsulko.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sstate hash equivalence breaks rm_work
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
X-List-Received-Date: Mon, 04 Mar 2019 16:17:41 -0000
Content-Type: multipart/alternative; boundary="00000000000094a535058347187d"

--00000000000094a535058347187d
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 4, 2019, 10:06 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2019-03-04 at 10:58 -0500, Tom Rini wrote:
> > Ah, so "poky" got me thinking this morning.  I was just on bitbake
> > v1.40
> > (since I usually use thud, and that's the version for that).  Moving
> > to
> > bitbake master/tip and I don't see the problem anymore.
> >
> > Is it possible to have some logic within OE to check the version of
> > bitbake and throw an error / warning?
>
> You mean like the BB_MIN_VERSION variable:
>
> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/sanity.conf#n6
>
> ?
>
> :)
>
> The changes were intended to be backwards compatible hence it wasn't
> bumped. Clearly something isn't playing as intended...
>

Ah, older bitbake isn't going to set BB_UNIHASH, which I bet is what breaks
it. I bet if we add:

 BB_UNIHASH ?= "${BB_TASKHASH}"

somewhere (bitbake.conf?) it would fix it.


> Cheers,
>
> Richard
>
>

--00000000000094a535058347187d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Mar 4, 2019, 10:06 AM Richard Purdie &lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfounda=
tion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, 201=
9-03-04 at 10:58 -0500, Tom Rini wrote:<br>
&gt; Ah, so &quot;poky&quot; got me thinking this morning.=C2=A0 I was just=
 on bitbake<br>
&gt; v1.40<br>
&gt; (since I usually use thud, and that&#39;s the version for that).=C2=A0=
 Moving<br>
&gt; to<br>
&gt; bitbake master/tip and I don&#39;t see the problem anymore.<br>
&gt; <br>
&gt; Is it possible to have some logic within OE to check the version of<br=
>
&gt; bitbake and throw an error / warning?<br>
<br>
You mean like the BB_MIN_VERSION variable:<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/sanity.=
conf#n6" rel=3D"noreferrer noreferrer" target=3D"_blank">http://git.yoctopr=
oject.org/cgit.cgi/poky/tree/meta/conf/sanity.conf#n6</a><br>
<br>
?<br>
<br>
:)<br>
<br>
The changes were intended to be backwards compatible hence it wasn&#39;t<br=
>
bumped. Clearly something isn&#39;t playing as intended...<br></blockquote>=
</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ah, older bitbake=
 isn&#39;t going to set BB_UNIHASH, which I bet is what breaks it. I bet if=
 we add:</div><div dir=3D"auto"><br></div><div dir=3D"auto">=C2=A0BB_UNIHAS=
H ?=3D &quot;${BB_TASKHASH}&quot;</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">somewhere (bitbake.conf?) it would fix it.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div></div>

--00000000000094a535058347187d--
