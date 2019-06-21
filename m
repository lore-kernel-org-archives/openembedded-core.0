Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8FC6D79B57
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 12:03:46 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id f80so4495330oib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 05:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cnfteepVjavCPeS/+Zh1aEZRm9Gt3RYji0TAV0vTQDI=;
	b=gaS2pnrDN9mdzTwq1zLI9SrDxTEPEWUwARQzNWqq4UUDxhEf/ksJ2VtioRjcDMq0/0
	5oZHErPLFc1dFchh2dl1V12KddhUNYvoQeTBr/1I5XKUZ/qqv4EcjCs5Yus3V5cePfVW
	j1TigA+Z/2Td26iIKIBc9E6o3EDbpP+BY9y6Kpng55qNqofFfcUnXbheUOFi98+qNmfQ
	bh0DPcP6tUHs+Pr32ebhkC29OUBYPavSQZPIhMJPaMTM/aePbSy0BLmDriIA2i0d7nWD
	4KmpifW/pvvC4VNKGqxjJq+ztxUdCFaAqKLWUOy/+Z0gxOnv4FYKfhqOwxE4rD2O29Dj
	Vy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cnfteepVjavCPeS/+Zh1aEZRm9Gt3RYji0TAV0vTQDI=;
	b=fzULUsjEgMlrg/6lJ8kyL8SBMNoHWaLUQW2SVd8vPFcsYYktvcdHceQta6P+CmO2se
	qy5zwt18eDUanClecI5XumXqqN8g2wRM9RBrv1TYC+pT15tX23a1rtv1PqbZaKv9RPik
	drgRK/yvOXxnMkC5H7ygcMUroGwK8rsvbBePP37z/CdhY7nhhdWKKPx4aaT7Hbec7aAo
	DZR/IRI7ppVfrOsPPdsREIajEQDEl96d/LwIIBsvrGydjo0KDa7KOtpMibx4fHk3xlju
	DJ/BWQ0OpnxLgidQZV/492A4HOZDjK7OVX0O7Ljnu9pLgpLTjq/HrutSh1neB5TjqFYR
	vAGw==
X-Gm-Message-State: APjAAAUqbxOIPAi0xzxMq3pmIHFm0UBBilG+xavJtgRuLEAiSX/zjFwL
	Mm2c2QKNHgFbd5fdgWbYe/NNzQe2QgV8G76YZJo=
X-Google-Smtp-Source: APXvYqylnZA4eOv2OPlcefhM3P2eoVasi8FhNJxS9EwCWNTN5Mmn3IqUPS+mCzbhdf/f2e5HQX6eaVhaB06OjrKgFYI=
X-Received: by 2002:aca:ba02:: with SMTP id k2mr2278897oif.70.1561118627469;
	Fri, 21 Jun 2019 05:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190619135940.18544-1-lemagoup@gmail.com>
	<20190619202149.GA12516@localhost>
	<CAEz4NHp3y=GOXUBSb1K3Gv+fEW-5HD9A9nWRsgTvxdToMT0GJQ@mail.gmail.com>
	<20190621110356.GO3459@hiutale>
	<CANNYZj8wEidRKDJtqPHMTQxNtYSD1_btOOfgR5TyoF2zL=KEkg@mail.gmail.com>
	<20190621114837.GQ3459@hiutale>
In-Reply-To: <20190621114837.GQ3459@hiutale>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Jun 2019 14:03:36 +0200
Message-ID: <CANNYZj-8OLPyDoo3xOtBVKctMnbaM2+G8zwNLCvfJHe4K8G21Q@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] cve-update-db: New recipe to update CVE database
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
X-List-Received-Date: Fri, 21 Jun 2019 12:03:46 -0000
Content-Type: multipart/alternative; boundary="0000000000003e1d70058bd441ca"

--0000000000003e1d70058bd441ca
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Jun 2019 at 13:48, <Mikko.Rapeli@bmw.de> wrote:

>
> Hmm, possibly? I cherry-picked the patches to sumo and saw this missing
> dependency in my container.
>
> Did poky master switch from using host python to native after sumo?
>

poky uses host python for some things and native python for other things.
Generally where 'core python' is enough then we use the host python, but
when additional libraries are needed, then native python plus those
libraries is a better choice, as this doesn't require adding to the
required host packages list, and allows better control over how they're
built.

Alex

--0000000000003e1d70058bd441ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 21 Jun 2019 at 13:48, &lt;<a href=
=3D"mailto:Mikko.Rapeli@bmw.de">Mikko.Rapeli@bmw.de</a>&gt; wrote:<br></div=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><br>
Hmm, possibly? I cherry-picked the patches to sumo and saw this missing<br>
dependency in my container.<br>
<br>
Did poky master switch from using host python to native after sumo?<br></bl=
ockquote><div><br></div><div>poky uses host python for some things and nati=
ve python for other things. Generally where &#39;core python&#39; is enough=
 then we use the host python, but when additional libraries are needed, the=
n native python plus those libraries is a better choice, as this doesn&#39;=
t require adding to the required host packages list, and allows better cont=
rol over how they&#39;re built.</div><div><br></div><div>Alex<br></div></di=
v></div>

--0000000000003e1d70058bd441ca--
