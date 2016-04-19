Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 78043606BF;
	Tue, 19 Apr 2016 17:14:16 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id r184so6505945qkc.1;
	Tue, 19 Apr 2016 10:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=hjhQNdZQkdFGLDjVIIC091pzkNKEVNP+YusqQsfjzZU=;
	b=s3rTyAIy7+iFH/HkinLotFDxOCQ7UcdhP5v6w8dTIWLO3nXpVIBkiprwKe1IU3hBwd
	6n07E/f3uIlc0b+XStrABMsq7NmL0YM06TuLunlqxF7+Hec8JEeFpJ/IMFYlePXitVLx
	2MBLPeJlzdCX+kWK0Mt2lE42rUrOtTeM0kEDr5er/oUsQ9O6o1l16ORPK+tyT5H0A931
	SY4IvMJ/SgbSSje6mky0zwSOSNYwg/IkLOFniG3OUQVKMTjm2VUP2wwSN8JhXTpVUw9Y
	3nwJ2diW6V2Rv/k1gKWKOytPeskwPKF/jAp9wu4x+/uQFAFWi/aMSl9MeP5B6QWUgphk
	MpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=hjhQNdZQkdFGLDjVIIC091pzkNKEVNP+YusqQsfjzZU=;
	b=Ljx/oRt5pJpoKvDBGThFIR5RB71WPclfVF61VpxS34T9poAzalEhJqTYcbTn7P9YLB
	Y//3lPZI9gaTUUlPf+r+HfRECfb1pFkcAZLxuBJkDppbKaF7mNAf6tOksZ57OculOiIK
	v5izmDHa7nzmcQWnsHrDnjMLTgRdonAz1FVxmP1tiqqtyfn5y93m24MElFerrUkD83PC
	PLZ44GVOC0FAtt5652pkm+El6CEljag2G7NgMXLnW5q9Orp1/N/BZjJK+R1pV8gF+km9
	M7FbuRRmPn3/xYymzU2Lft2Fw5tTKIySNCDAMG0Q90mPoY6/TnCV8SwN1tl3ztbKtzIu
	ubdg==
X-Gm-Message-State: AOPr4FUpBBmHZ/nlNMgnpGiA0+V+jk7ZylQc5noaygkZnNM0ysiKq4hvoKdS46zz8JxqMw7dLkB+mWmLu17Deg==
MIME-Version: 1.0
X-Received: by 10.55.155.76 with SMTP id d73mr5309017qke.26.1461086056585;
	Tue, 19 Apr 2016 10:14:16 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Tue, 19 Apr 2016 10:14:15 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Tue, 19 Apr 2016 10:14:15 -0700 (PDT)
In-Reply-To: <CAJTo0LZ+xC=STKFwa2J4Kv1Pw4ruLeG2HhAZnxrQV5aJN56XOg@mail.gmail.com>
References: <CAJTo0LZtDL-hbxXmYWdgf7HTZtSA4D2FgRKtx1+n6Rqxq50n=g@mail.gmail.com>
	<CAMKF1spGMHQMVP_-mrHYmDnjM+DPk0mktK_e+9G1bekuP6PnUA@mail.gmail.com>
	<1461019868.9308.224.camel@linuxfoundation.org>
	<CAMKF1spKB=HXLipbo_qFBY6mo67LOWAB-uQxRA25ghZTwD=i5Q@mail.gmail.com>
	<CABcZANm7+ewyU8d2iMkMM6uNB7ZSBhcToE3g=rKWkAxrGCP85w@mail.gmail.com>
	<CAJTo0LZ+xC=STKFwa2J4Kv1Pw4ruLeG2HhAZnxrQV5aJN56XOg@mail.gmail.com>
Date: Tue, 19 Apr 2016 10:14:15 -0700
Message-ID: <CAMKF1soyXLG=66eEnSNKby_BmZCsHM62Ua-9qgCxh23Su-gXiQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: yocto@yoctoproject.org, Christopher Larson <clarson@kergoth.com>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bugzilla.yoctoproject.org policy for bugs against multiple releases
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
X-List-Received-Date: Tue, 19 Apr 2016 17:14:19 -0000
Content-Type: multipart/alternative; boundary=94eb2c073c3e63a2d80530d99ba6

--94eb2c073c3e63a2d80530d99ba6
Content-Type: text/plain; charset=UTF-8

See how gcc project manages it. May be that is sufficient for us too
On Apr 19, 2016 9:41 AM, "Burton, Ross" <ross.burton@intel.com> wrote:

>
> On 19 April 2016 at 03:17, Christopher Larson <clarson@kergoth.com> wrote:
>
>> There may be something better out there, and if we can find it, great,
>> but I think separate issues is better than not addressing the issue at all,
>> but only if the tooling is good enough to help reduce overhead on the part
>> of the devs dealing with it. Issue tracker overhead gets pretty frustrating
>> at times.
>>
>
> There may be a way of dealing with this using flags.  If we had a flag for
> each release then we could add a flag for each release which is impacted by
> the bug, and track when they're resolved by changing flag state.
>
> Ross
>

--94eb2c073c3e63a2d80530d99ba6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">See how gcc project manages it. May be that is sufficient fo=
r us too</p>
<div class=3D"gmail_quote">On Apr 19, 2016 9:41 AM, &quot;Burton, Ross&quot=
; &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt=
; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D=
"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 19 April=
 2016 at 03:17, Christopher Larson <span dir=3D"ltr">&lt;<a href=3D"mailto:=
clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmai=
l_quote"><div>There may be something better out there, and if we can find i=
t, great, but I think separate issues is better than not addressing the iss=
ue at all, but only if the tooling is good enough to help reduce overhead o=
n the part of the devs dealing with it. Issue tracker overhead gets pretty =
frustrating at times.</div></div></div>
</blockquote></div><br>There may be a way of dealing with this using flags.=
=C2=A0 If we had a flag for each release then we could add a flag for each =
release which is impacted by the bug, and track when they&#39;re resolved b=
y changing flag state.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>
</blockquote></div>

--94eb2c073c3e63a2d80530d99ba6--
