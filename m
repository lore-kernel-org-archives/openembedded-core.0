Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 319066FF78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 15:01:44 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id mv3so32174573igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 07:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KSo55Hv7xa0z7ai53Fl1Zy9K3WwH81KcTzP/iM+qcyA=;
	b=cNaRBII4pkrOPnmYfec/WVRgPs+pWDeE09zZmxu04/3AFGcxQkC6GV2NbsFe8TJAQI
	hZb1ivB51qPtzKeZhjvI9eMtEZLZbjQ/4qZEImWpbeFMq+/tf4tQyPIXPDz2jtWG49Pf
	qJiLDO51OqRUSRHJ+gsBw0xkoizJS+6tUg6wGw6cINDySx20MvKiSislk9jzfUUXlN73
	BQLI+QFpk1jqTLQBnOJUrMqR6+H9vDKfmSVBZbCwcWFc0NsTKAUuVFJlEtVrPbaL0pNe
	vDBhltF58i2rSwq3K11lP/V6thLua0wEJPN3JSXXOk5p13/vPofpjYcSiRkJt91mwpxM
	XaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KSo55Hv7xa0z7ai53Fl1Zy9K3WwH81KcTzP/iM+qcyA=;
	b=P3hh8M5i+gGI9vrxN5llOGMMae07F0EMRbEEJFNKmlPxRP3QEPXPcyD4ABfoEWW+L6
	Hwhm1g2R/Zy3P+P0RVp0yyG2glHqShFTcBE9YvDIVWiN/53t+wxZ3tfhDw145UrztpLX
	vc3GPfzG2J795g3rcdOL+AhXVb36ZC0H8Y4WFBIbAGkb19VQeNZdiqPFszRSqV8DLXLp
	O5GryhfCVWKanw1xBSWKDuIXRl1cb/0rNnEHBJzztqo2++5/RpntzSmE8yq7bwYI2fr8
	o1DXcbXviOtIMvdJFo5EUDWNJgufzm4i4ta11TcYLkJj7GoQms9WU8GhTCQBZu4L336U
	EN6g==
X-Gm-Message-State: ALoCoQny5N1/4aArWYDHz8FNpDkUaC88voGv2EvvryDg0+UibIqFOYHqtJF8Bjyvgpm1YdbxuaZaBLi7Fx/QAhyAxskaz2+aKEJWxWeafwburGRjGfulL/0=
X-Received: by 10.50.18.113 with SMTP id v17mr2540634igd.64.1450710105378;
	Mon, 21 Dec 2015 07:01:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 21 Dec 2015 07:01:25 -0800 (PST)
In-Reply-To: <CAMKF1soGKHFqC0+qxvZT4+B-ng9sfmMSyRJ-S4cBPvCs+SN1BQ@mail.gmail.com>
References: <1450629643-19659-1-git-send-email-liu.ming50@gmail.com>
	<CAMKF1soGKHFqC0+qxvZT4+B-ng9sfmMSyRJ-S4cBPvCs+SN1BQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Dec 2015 15:01:25 +0000
Message-ID: <CAJTo0LbQGtHo4QuxsQcB-DgLaceNO+dz6QSh1aEA5zZp3HdT9w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Yue Tao <yue.tao@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Ming Liu <peter.x.liu@external.atlascopco.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: Re: [PATCH v1] ncurses: fixes wrong paths in BINCONFIG
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
X-List-Received-Date: Mon, 21 Dec 2015 15:01:45 -0000
Content-Type: multipart/alternative; boundary=089e01494ff280eaf6052769c436

--089e01494ff280eaf6052769c436
Content-Type: text/plain; charset=UTF-8

On 20 December 2015 at 21:47, Khem Raj <raj.khem@gmail.com> wrote:

> This patch moved it to PN instead of PN-dev, now I wonder what happens
> if you were to install PN and lib32-PN packages, I guess you might
> have same problem
>

No it doesn't, binconfig.bbclass sets FILES_${PN}-dev += ${bindir}/*-config
so they were before and are now in ncurses-dev.

Ross

--089e01494ff280eaf6052769c436
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 December 2015 at 21:47, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":5qi" class=3D"a3s" st=
yle=3D"overflow:hidden">This patch moved it to PN instead of PN-dev, now I =
wonder what happens<br>
if you were to install PN and lib32-PN packages, I guess you might<br>
have same problem<br></div></blockquote></div><br>No it doesn&#39;t, bincon=
fig.bbclass sets FILES_${PN}-dev +=3D ${bindir}/*-config so they were befor=
e and are now in ncurses-dev.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--089e01494ff280eaf6052769c436--
