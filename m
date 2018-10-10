Return-Path: <mans.zigher@gmail.com>
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
	[209.85.167.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8F15F7954B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 11:18:17 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id k64-v6so3739038oia.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 04:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=yA70x7YxE5m9AFy7FV0BDXLFt1phRNTScnfPxnjymZY=;
	b=qkUt5zEzAg32vM60JDeRjXNawU2kOB6KRG9rIr8pve1gnUcqHF6qHSzv0mDjaClgnR
	06B3i/mQ4EbnKrDNOdGvM919VqIxBvVSLP+sBMdhbpQoT3FxdBm/36i41U2EYaoq6suI
	sTYzEtGm28rvw+pY2b5L9NN1pvExnlgDD4U7BIq5WvHYKFP1fNCqd90SK3twkd6kF7TL
	mGmyXx1Xw91UZAjfBz23hhMWxoUZ4s0oERpw0nmU8r5RWBtfYc/afsAX3QMLUy8HIt9q
	RVN6Sq1ukLu7ohI1+wHO1GsNU7IHHdDKmHYMg7+vl7Qs/dJRC1EBvNitlIZ/jbjQhMmO
	tG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=yA70x7YxE5m9AFy7FV0BDXLFt1phRNTScnfPxnjymZY=;
	b=t8ynYFnrKM2hCSBNnr3UmbDAAKNIZpYwVXIkt3vRh92sRzdyWPiOYOQhM0RZuDcemn
	83bIUO9nC1S2BrqzV86M9jWAfI1E25rcEckU2bFEowQOHoAPo+TNGjjsOhRBb0xIO2TL
	yRoRIapvRz+1C0C8mlt5V+0ushU2VDZj0duYygd5p502wn2RYXfILG3nxGh7oQgJSlPh
	66NjDpmC6KlOmkUPBKyQ5DOPKTykMV7WqqR98Bj/xobUjgWubCdP/uIsEeE6HJ9ZunWv
	N+1qP87jiQTAcFi+Ei8pMnUSsVYwk6cVkc2pZdGF4yplO6pbT84KdvFYs/LGtir6zGU3
	DrNA==
X-Gm-Message-State: ABuFfojdvXoIYvMS2nPJ2BOMJNcTMb32eA6vX5kfM8X3hKIs5LUux0Sm
	WD9Uoyf8mzqSdJI6yPwYyNMZm6BmjAnLnjOFP7sQKrJT3VwGcA==
X-Google-Smtp-Source: ACcGV628//npZVhsghZzM6YyjWKJgLfTfYPaeABZrHij0lQm56KDmCmo6fkDSEy4cpb8PL7fQ5x0PLpWnxdwQ6HZLjM=
X-Received: by 2002:a54:4d8b:: with SMTP id
	y11-v6mr1400124oix.168.1539170298228; 
	Wed, 10 Oct 2018 04:18:18 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Date: Wed, 10 Oct 2018 13:18:06 +0200
Message-ID: <CAEhQi8kDQKOzouhjxshi6=jkHfitZkAYDWTVBQ26cgEojPn35Q@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: [bitbake] How to fetch private github release
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
X-List-Received-Date: Wed, 10 Oct 2018 11:18:17 -0000
Content-Type: multipart/alternative; boundary="000000000000dff5150577de02ff"

--000000000000dff5150577de02ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I need to fetch a github release tar file. I think I have seen that it
should be supported by default by setting the

SRC_URI =3D "
https://github.com/DynamicDevices/bbexample/releases/download/v1.0/bbexampl=
e-${PV}.tar.gz
"

The problem that I am facing is that the repo is private so I need to be
able to specify a github token. Is this supported?

I have also tried specify my own do_fetch to my recipe and from there
making use of https://github.com/gruntwork-io/fetch but do_fetch cannot the
binary. I have verified fetch binary is part of the package sysroot and I
can call the fetch tool from do_install but that feels like a bad hack. Do
you guys have any advice?

BR
M=C3=A5ns Zigher

--000000000000dff5150577de02ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>I need to fetch a =
github release tar file. I think I have seen that it should be supported by=
 default by setting the=C2=A0</div><div><span style=3D"background-color:rgb=
(249,249,249);color:rgb(0,0,0);font-family:monospace,Courier;font-size:12.7=
px"><br></span></div><div><span style=3D"background-color:rgb(249,249,249);=
color:rgb(0,0,0);font-family:monospace,Courier;font-size:12.7px">SRC_URI =
=3D &quot;</span><a rel=3D"nofollow" class=3D"external gmail-free" href=3D"=
https://github.com/DynamicDevices/bbexample/releases/download/v1.0/bbexampl=
e-$%7BPV%7D.tar.gz" style=3D"font-family:monospace,Courier;font-size:12.7px=
;text-decoration-line:none;color:rgb(51,102,187);background:url(&quot;data:=
image/gif;base64,R0lGODlhEAANAPcAACxNdj1xr0F5vUJ6vkR+xESAyEaEzkeFz0uI0UiG0F=
ON006K0lGM01GM01SO1FSO1FaP1Geb2Wqd2mue23mn33yp4IWw42OZ2Xyp4I625qHD66TF7LbR8=
r3W873W88Tb9sTb9sbc9t3s/ev1/+n0//L6//n///T7//3//////////////wD/AAwMDAwMDAwM=
DAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw=
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDA=
wMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMD=
AwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwM=
DAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw=
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDA=
wMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMD=
AwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwM=
DAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw=
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDA=
wMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMD=
AwMDAwMDCH5BAEAACwALAAAAAAQAA0AAAhzAFkIFJihYMGBCAdmGKECxQgNABIqHLECgEUOESJK=
zFBRIQWNCTOYAJlBAUiEC0kmOCkQRICXMGFiCLkiRQkRHzZYmPCAZYYBBQ4saPDgQQUPPmvezGl=
BQs+QAggYQMDAgdEOSW3i1DkBAssQFsOKvTAwIAA7&quot;) 100% 50% no-repeat;padding=
-right:16px">https://github.com/DynamicDevices/bbexample/releases/download/=
v1.0/bbexample-${PV}.tar.gz</a><span style=3D"background-color:rgb(249,249,=
249);color:rgb(0,0,0);font-family:monospace,Courier;font-size:12.7px">&quot=
;</span></div><div><br></div><div>The problem that I am facing is that the =
repo is private so I need to be able to specify a github token. Is this sup=
ported?</div><div><br></div><div>I have also tried specify my own do_fetch =
to my recipe and from there making use of=C2=A0<a href=3D"https://github.co=
m/gruntwork-io/fetch">https://github.com/gruntwork-io/fetch</a> but do_fetc=
h cannot the binary. I have verified fetch binary is part of the package sy=
sroot and I can call the fetch tool from do_install but that feels like a b=
ad hack. Do you guys have any advice?</div><div><br></div><div>BR</div><div=
>M=C3=A5ns Zigher</div><div><div><br></div></div></div></div>

--000000000000dff5150577de02ff--
