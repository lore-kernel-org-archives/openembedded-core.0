Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id B481671957
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 08:43:42 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id n6so50219629qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 00:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0WLMdYJMfR1lh793lKlCrhGYyxOxi8oT5MUN4IKf30k=;
	b=NpMmqkqveuWiemNEBj0KQovfHg8dkZdv2or+OXbefPROm9DIlcxJa195nTGxLmPSEI
	Jw2tNI/qxwFz9xZ3cih8C800/ZMSxDoDC8MExi4TIPOM8OH92qDVPNPDT/NPHuyiEL6/
	ZMiOJCp+bLLP2tj1cxszUgtUbyIuDxagvmjRe0ItEEadpRHQm9lnveW2hPj0SpSYULtM
	KlJQdz7+HbyJMep7z511EO9OXbUmzta2NrjyoTTZvBpKZqtp6VwkFRDN9kqMe6jlOYwY
	JyA+mikSfhz/HK6FzVwjwXdovIeE3KoacCIKL0UkLwOIJk51SSEdB/LNpViGdxG87nmE
	8gPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0WLMdYJMfR1lh793lKlCrhGYyxOxi8oT5MUN4IKf30k=;
	b=R5fTDW3lEXwQyToErdW1NjgsK7glYk9AT3wtT8Y2UAUYd9XTHbIxVRQ/D3ex0h7lFg
	StztsVphf40wvyF/tJASm+XY5BFg8eqiXE++JLN2besmCHS3els5Odgu0hKnkHQ72/AW
	MbqB7YHB6B5DpoXTwjAEU1azn9PDP+ja7+k+gDEzQ9gs1j0QpFpYQ8+ltOjaVErVv1HK
	O6VSGOLB5QsTPPBcvcsuPuOJAwv60OdcMrvJUSxOWA+tNucd7vA9otT3otRLPsDf1i31
	3Il+F9LeyFhhdeedILFTjWoA0KltEOjIDfoJ9j+GPvouVC8im1K4ifgK7kCF9Unf1TG4
	fGQQ==
X-Gm-Message-State: AIkVDXINhHVNqVWVp959eJ9yHxYrHdd7jbFKl3Wk/VfRqhsVja+FF10GfBnAlWDFagUWo02DhjfyOSDxyUrBiAS2
X-Received: by 10.237.36.154 with SMTP id t26mr147040qtc.188.1481791423723;
	Thu, 15 Dec 2016 00:43:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 15 Dec 2016 00:43:23 -0800 (PST)
In-Reply-To: <CAMKF1sq--mXBzTh+xc+gZb9L9wNugK8izZ-MMrYJyKKKdR9aOg@mail.gmail.com>
References: <1481751480.3851.14.camel@pbcl.net>
	<CAMKF1sq--mXBzTh+xc+gZb9L9wNugK8izZ-MMrYJyKKKdR9aOg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Dec 2016 08:43:23 +0000
Message-ID: <CAJTo0Lb_7+-T0ugym2DjyeEqniRGUjJj9P=c8Gf2NF2SVwHx7A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng-ust: Patch python shebang appropriately for native builds
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
X-List-Received-Date: Thu, 15 Dec 2016 08:43:42 -0000
Content-Type: multipart/alternative; boundary=001a1141058e716ee70543ae73e6

--001a1141058e716ee70543ae73e6
Content-Type: text/plain; charset=UTF-8

On 14 December 2016 at 23:38, Khem Raj <raj.khem@gmail.com> wrote:

> This also means we need to add a dependency on python-native may be it
> should inherit the python native class.
>

Indeed.  For python-native, '#! /usr/bin/env python3' will always work as
that should find the Python that bitbake is running in.

Ross

--001a1141058e716ee70543ae73e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 December 2016 at 23:38, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":4db" class=3D"a3s aXj=
CH m158ffb48d3a8c9c6">This also means we need to add a dependency on python=
-native may be it<br>
should inherit the python native class.<div class=3D"yj6qo ajU"><div id=3D"=
:2jv" class=3D"ajR" tabindex=3D"0"></div></div></div></blockquote></div><br=
>Indeed.=C2=A0 For python-native, &#39;#! /usr/bin/env python3&#39; will al=
ways work as that should find the Python that bitbake is running in.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a1141058e716ee70543ae73e6--
