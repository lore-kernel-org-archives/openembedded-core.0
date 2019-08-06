Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3E26C7F38E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 14:30:11 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id h28so58406741vsl.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 07:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mJn9ApQlpLUBnVtVaqqKH0P0s44Y7L7zsQ2kTwLElSo=;
	b=DQU9uypEsQAqflqtP/JLElvNXKOtyTIeUNolf24yuH2au+lRnSroTt37WsgdZFyMg+
	dXyJhnr5C5RsG7a8scKIruc0keSZt3Qt9qiRX1miVv1aLx/98l7J14SpyYfIywF4HnV6
	ATaMIuHeUG3noXHRSw8nf8rb8+p9d4z27zWmMOasbSc8NSwKuLiOiazrvOnmuz4z3zaV
	tVxWiCycEp9t554/3JsC4UjM09tdiw7fp/Awn7W9T916hEZeJzjC2oVBeEN/biH6wL7N
	L8HNuJ2qrVu55Anfn4UbzfK0CCDRh2cCYownlFFtwFpj/kqyS0j/TOhHOK8XLR9B3ufN
	iyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mJn9ApQlpLUBnVtVaqqKH0P0s44Y7L7zsQ2kTwLElSo=;
	b=Tzlwuf6QMTTwjZsdJnB0gm5vJSCwOJMzeESBu0KMNWy89OADCnfmKByaH7n7lcW0vL
	ZS7HD5kJ0MTxZoc9XGMNPhp/4Kgp8bVk6DWyl9ho7vVacYJPf6EJZE7cZ9lNxdMLyM4I
	LlLrAs4gC9TF66+ORn7uKs5sFyrvk/7xQFwexYxPjG5GXw+Q/AYEVdFQRC+aBIFntX9Z
	3dA/YmrfNCgsrZ+lja7T6ExGc0QoXSilfqH3BN8l6D0BIXYphy/dFqLgWEPoDxbBeamg
	K+QEWy9hgLmywOuudnuh0lzpW0tGi62DXXUEpQQ5OQBnfKRCf3U+mhEwE/c+zTSfpVBt
	HeuQ==
X-Gm-Message-State: APjAAAWM0GY7zHblbWleQL9hxX9dPi9QrSjJDbzG9UJL2d7uOl8m1q2X
	5nD8UVW5g0br+DzWNh7CQWFg3KkAepIwGrh3z88=
X-Google-Smtp-Source: APXvYqz3Xp1g4NeHgxqciimqAizZTm/EmP+a0L8n7YhPjo2ySYCy9ebDW+T7DJN9bZDSsCFRgXHgWzljpJxW1N1w82c=
X-Received: by 2002:a67:8042:: with SMTP id b63mr2614465vsd.23.1565101812199; 
	Tue, 06 Aug 2019 07:30:12 -0700 (PDT)
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
	<CANNYZj9iLsF0fBRCYp+_CbRakizOyN=CJuDdRtZ9OdnZ84rFbA@mail.gmail.com>
	<CANNYZj_4QNNfHr+9rke06rGDrfh-0C9PwqfnAYrT6urf5k62wA@mail.gmail.com>
	<837f692b83714ef0ed412288121e817e7790dae3.camel@linuxfoundation.org>
In-Reply-To: <837f692b83714ef0ed412288121e817e7790dae3.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Aug 2019 16:30:00 +0200
Message-ID: <CANNYZj8WgVxSqgih-P=5kgT-+fg1dGwSEqmWkKbn4z22qfE+Qw@mail.gmail.com>
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
X-List-Received-Date: Tue, 06 Aug 2019 14:30:11 -0000
Content-Type: multipart/alternative; boundary="0000000000008db569058f73a99c"

--0000000000008db569058f73a99c
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Aug 2019 at 16:16, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I partly agree with this. There is:
>
> insane.bbclass:do_package_qa[rdeptask] = "do_packagedata"
>
> which does help the situation by forcing package_qa after all the
> runtime dependencies.
>
> I suspect the real problem is that it can also see RDEPENDS for things
> it doesn't rdepend upon...
>
> You might want package_prepare_pkgdata() from package_pkgdata called
> for package_qa's context on a separate directory, then to use that as
> the pkgdata to resolve against?
>
> Note that package_prepare_pkgdata() called for do_package is different
> than package_prepare_pkgdata() called for do_package_qa as the tasks
> have different dependencies...
>

I am actually inclined to remove the recursive resolver in insane.bbclass.
It gives a QA pass to a situation when there is a bash script in A, and the
bash runtime dependency is satisfied indirectly through a chain of
arbitrary length: A -> bash-completion -> bash. It becomes hard to reason
where the dependencies come from; I think any runtime dependencies should
be explicitly listed. We may need to fix up a few recipes, but the outcome
is a better definition of runtime dependencies.

I have confirmed that for stress-ng removing the recursive resolver and
adding an explicit RDEPENDS on bash solves the issue (stress-ng package_qa
does not start until bash packaging completes, unlike previously).

Alex

--0000000000008db569058f73a99c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 6 Aug 2019 at 16:16, Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_bla=
nk">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I partly=
 agree with this. There is:<br>
<br>
insane.bbclass:do_package_qa[rdeptask] =3D &quot;do_packagedata&quot;<br>
<br>
which does help the situation by forcing package_qa after all the<br>
runtime dependencies.<br>
<br>
I suspect the real problem is that it can also see RDEPENDS for things<br>
it doesn&#39;t rdepend upon...<br>
<br>
You might want package_prepare_pkgdata() from package_pkgdata called<br>
for package_qa&#39;s context on a separate directory, then to use that as<b=
r>
the pkgdata to resolve against?<br>
<br>
Note that package_prepare_pkgdata() called for do_package is different<br>
than package_prepare_pkgdata() called for do_package_qa as the tasks<br>
have different dependencies...<br></blockquote><div><br></div><div>I am act=
ually inclined to remove the recursive resolver in insane.bbclass. It gives=
 a QA pass to a situation when there is a bash script in A, and the bash ru=
ntime dependency is satisfied indirectly through a chain of arbitrary lengt=
h: A -&gt; bash-completion -&gt; bash. It becomes hard to reason where the =
dependencies come from; I think any runtime dependencies should be explicit=
ly listed. We may need to fix up a few recipes, but the outcome is a better=
 definition of runtime dependencies.<br></div><div><br></div><div>I have co=
nfirmed that for stress-ng removing the recursive resolver and adding an ex=
plicit RDEPENDS on bash solves the issue (stress-ng package_qa does not sta=
rt until bash packaging completes, unlike previously).</div><div><br></div>=
<div>Alex<br></div></div></div>

--0000000000008db569058f73a99c--
