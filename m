Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9CBAC60125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 12:23:28 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id o130so17083670itg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 04:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GifYy6c/+iIpMCKq6IECJpbu/cJmhVXMRDL84kp2nNU=;
	b=DdSsFsicJSHXWZn5a9SuMkXEfuN7brAGKZrb8sW2hdDkPXnvO44snW8dbP8avvFtej
	HkVc26wturmAffj2X2bvNPwJ0ziXqryk5gH5AeJWYt/xZD8wkjeh6eHpk7SihBZdV98n
	dm5Y0oA3iy81WAMeNQatnE3KOhVWHQ3SqHujV4s+4xLc36QnBn6AnLqEC0W92lJnJ323
	z3Qvv1CC2SDpnELboCQZwdSUAtvJzT0xGBAIBiFT+wznIwiTAd6wyV7VEVMveUgr9dTn
	A3zKYRUrAK+CO1gMIHGBHF8Lo8Y7C23VH7SbBWAc0hZ6DFXdoCQEMeat516OwswI4M+r
	+TFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GifYy6c/+iIpMCKq6IECJpbu/cJmhVXMRDL84kp2nNU=;
	b=CvpBiF+hB5OaZ9+kl6AeyhWCJMZ/sPFZhd8JmmH1YGQtBrmW/Dk7zWqlmer7qr/st6
	cVGTvT8qfD8aFgfqyLvkx5KdLaJRqc46PnjGJgzDiecw1RreuYQ/axno2g8rGpVckB1K
	2sbgTllLLotOexWJTcumW5LUFSwINctkL6tnz9SaZt1wb2ZXS2CHQbvTTH05zmYEmY4c
	eFPe67hJIteD6FNoLytnI0FL+iqO6r5hCsFmgTvmV7hOtPYoSOMjH/kt5HTLWe2GwRV0
	ZkJxOKdxZ8uA3r+ymO5N47JAAs6uHpssPqldhNPf5nNjztZRdpxPGz3TVMzU5WeQbK7t
	iLcg==
X-Gm-Message-State: AKGB3mKCs2Q7ZuoKJ4U0E5o16Pvjn8eSyVbtfOAqQMJPkcWoU0DXeO+e
	q13d9fwVij8YFfOmtFrRdet5ZVInBzG1qsyaMQi8/w==
X-Google-Smtp-Source: ACJfBovZREyKQn42/vRPXUmB0na8pODrTiIdhHCEGw87Lg1mNZZ2yCofy4N/+TdUFQG/VrF52FUfhqyJ39nAjYque/c=
X-Received: by 10.107.180.18 with SMTP id d18mr4961003iof.52.1513081409799;
	Tue, 12 Dec 2017 04:23:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Tue, 12 Dec 2017 04:23:09 -0800 (PST)
In-Reply-To: <20171206220037.32335-1-limon.anibal@gmail.com>
References: <20171206220037.32335-1-limon.anibal@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Dec 2017 12:23:09 +0000
Message-ID: <CAJTo0LYYn+FvwjH-DJc2GCraLRV=9uC3YX7WNXF82ZeFJtLrZw@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Cc: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] recipes-multimedia/gstreamer: Add gst-validate recipe
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
X-List-Received-Date: Tue, 12 Dec 2017 12:23:28 -0000
Content-Type: multipart/alternative; boundary="94eb2c06f0fcf29b13056023b7e8"

--94eb2c06f0fcf29b13056023b7e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 6 December 2017 at 22:00, An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com=
> wrote:

> +SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar=
.xz
> "
>

ERROR: lib32-gst-validate-1.12.3-r0 do_fetch: Fetcher failure for URL: '
https://gstreamer.freedesktop.org/src/lib32-gst-validate/lib32-gst-validate=
-1.12.3.tar.xz'.
Unable to fetch URL from any source.

You need to use BPN not PN, but use ${BP} instead of of BPN-PV.

Ross

--94eb2c06f0fcf29b13056023b7e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 6 December 2017 at 22:00, An=C3=ADbal Lim=C3=B3n <span =
dir=3D"ltr">&lt;<a href=3D"mailto:limon.anibal@gmail.com" target=3D"_blank"=
>limon.anibal@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-l=
eft-color:rgb(204,204,204);padding-left:1ex">+SRC_URI =3D &quot;<a href=3D"=
https://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.xz" rel=3D"nore=
ferrer" target=3D"_blank">https://gstreamer.<wbr>freedesktop.org/src/${PN}/=
${<wbr>PN}-${PV}.tar.xz</a>&quot;<br></blockquote><div><br></div>ERROR: lib=
32-gst-validate-1.12.3-r0 do_fetch: Fetcher failure for URL: &#39;<a href=
=3D"https://gstreamer.freedesktop.org/src/lib32-gst-validate/lib32-gst-vali=
date-1.12.3.tar.xz">https://gstreamer.freedesktop.org/src/lib32-gst-validat=
e/lib32-gst-validate-1.12.3.tar.xz</a>&#39;. Unable to fetch URL from any s=
ource.<div><br></div><div>You need to use BPN not PN, but use ${BP} instead=
 of of BPN-PV.</div><div><br></div><div>Ross</div></div></div></div>

--94eb2c06f0fcf29b13056023b7e8--
