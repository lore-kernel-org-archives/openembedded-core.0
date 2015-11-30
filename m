Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id A048560616
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 13:56:58 +0000 (UTC)
Received: by igcto18 with SMTP id to18so70997871igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 05:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xeqh7S2BVXKrjvWlY8mlLbOxar0X25g5+1zAUUZJFzQ=;
	b=pzyDp9jTtijtWSpp4j9msbZkeABqy2qSmF9DbWTFLpklX9xBxIzALSgEIR813+PAgp
	rYqxQqgwbf409wyRa7sCl+fYogt8RInE1sOLJsNjLLGx6Q1m8ZAmv0+F2DwJeLoMOLZK
	Fk/bWU+3enJGgLP6W4wIOh6DV67fY4JxrkuUKkwpKzlcCmtPb062VOk6RGhfiYGgmpnA
	AjR4EZu/PybfLlccXKFdZK4wHUYMUjTdEqO2tkgPhihPgGnQsKIfYzKVr/CIelYejsKa
	0RYQNQLMD6APYKMTvlpaa7U9lBnhHwLPG5GVdKchQnMWhGst0OdXo0iJfXAi+t51BlEj
	Vcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xeqh7S2BVXKrjvWlY8mlLbOxar0X25g5+1zAUUZJFzQ=;
	b=X9Wn4iq3Ps2pDsxDbYeopi/IqxiN14T4xoxAUqRa7ObF5ys8RBvg6lCRtgsk7wOiaQ
	RMi+ndctPlqHKyhgWy9tvhO5iB+yaj9bDiNnPt4tOwCXwWnxNRtqtstqZC4Bjo2OZJQn
	CQNGPO/2tuZWcagkbpnXS3zTOuIylAfr5OjPIlY3DEamR/Tu70pe/BLbGnluPU49+y9X
	yjx8GE4VrP5RrjsRYz28kFHqufAshBWSc+MY+Wy5wSbzpgP0QCwYfjFrpGEZgRzQ1Yav
	QewCkFPhPoFDy4trhjpvKcFo2hVJELOQfBJjptnsTGjSNIVsVXznZXIM/76wt37798u8
	CBuQ==
X-Gm-Message-State: ALoCoQlsmGKH517TjDeX9Nyi2kx9unqW/3k7YMKGPhVDblWKMoAvlkOFhuuWhR5Rl+liAaxRC+b+
X-Received: by 10.50.79.129 with SMTP id j1mr19807648igx.52.1448891819173;
	Mon, 30 Nov 2015 05:56:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 30 Nov 2015 05:56:39 -0800 (PST)
In-Reply-To: <20151130124035.GA2250@jama>
References: <1448885938-25946-1-git-send-email-ross.burton@intel.com>
	<20151130124035.GA2250@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Nov 2015 13:56:39 +0000
Message-ID: <CAJTo0LYK1S8e4r2ikXHuOkv6NSEn1ym9W1wU_6H6qw8KUA4HHg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: expand PACKAGECONFIG and enable native builds
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
X-List-Received-Date: Mon, 30 Nov 2015 13:57:02 -0000
Content-Type: multipart/alternative; boundary=089e011609fc3344ca0525c26a2b

--089e011609fc3344ca0525c26a2b
Content-Type: text/plain; charset=UTF-8

On 30 November 2015 at 12:40, Martin Jansa <martin.jansa@gmail.com> wrote:

> When it was needed for xbmc it was rejected (and I was carrying this in
> my branches since then):
>

I'm looking at producing a leaner libsdl-native that doesn't respect your
DISTRO_FEATURES (so doesn't pull in libGL, for example).  What does xmbc
need libsdl-native for?  In particular, anything that's optional such as
alsa/pulseaudio/GL?

Thanks,
Ross

--089e011609fc3344ca0525c26a2b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 November 2015 at 12:40, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1bo" clas=
s=3D"a3s" style=3D"overflow:hidden">When it was needed for xbmc it was reje=
cted (and I was carrying this in<br>
my branches since then):<br></div></blockquote></div><br>I&#39;m looking at=
 producing a leaner libsdl-native that doesn&#39;t respect your DISTRO_FEAT=
URES (so doesn&#39;t pull in libGL, for example).=C2=A0 What does xmbc need=
 libsdl-native for?=C2=A0 In particular, anything that&#39;s optional such =
as alsa/pulseaudio/GL?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Thanks,</div><div class=3D"gmail_extra">Ross</div></div>

--089e011609fc3344ca0525c26a2b--
