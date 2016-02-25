Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id C491A77103
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 12:52:45 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id g203so86746543iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 04:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=otPQG/shDCQXadITLhUwLoVrdAGh4qpH7G300NhjCKM=;
	b=jIDY478WcM9lMnh/jIv3xXeXJEKVNNzLagjllK6jH1/GjBLyoMk5qu8rnfEk7NsV0Q
	oAVaitSjXtNyR/pUkDtYGv1Zg8ElB/dbfX/FIFa/Djiu7miXRqXIZIEP7hdm/SV1dPSI
	XjDnPpAQ5eNifoQLGq8/wrmsamq7sn1vpUL13Nf5E11FxeXZR9oaI46TFxN4GM2FvyV8
	LZj8BC4K9+L1gsGV3MpOJ5/T/5SzdbdKkR6cenRyX0nsonZlgjVj1V8MZxHY+IBfTqb4
	JAGdqYJMp9mEOHPCjQfKdUl25tSg2+y3C+ONwJet18MoIWrfe3/BNkEeSSJ2HWUAtByZ
	/B5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=otPQG/shDCQXadITLhUwLoVrdAGh4qpH7G300NhjCKM=;
	b=Gx4hhHtodbCvGyAjPpWAVlYxyjXKZNKsPhXTPHCei24qh+Qp8t2Q89VSGszay1fLYo
	YV28bCWyQlSz4R+8PRHGfH5sjIlBxiTt6gqHuHjRkxUFOjNb9blsEbzpggJbRd5lISnE
	Wdfljz6J3G5ulMRDe7Ki69cwSABgF7y5GFcFRFeh/ozSWfkjXjlMtt/m8mqZ5BQJFL8i
	MB1Y398U9NK13SABT0LwWA70TF/HqPGxDJNmhfQKABlrn9bVGdu85fml5EB5Fo73oLZl
	pAqNeFS065g7F+b/eV7+zflwjB4Evy26dy8j3h5hBIcar4KHrsE5i+NdbepaUbpo5WP9
	X2xA==
X-Gm-Message-State: AG10YORMIO+gVWrcbnW5zmrwRYU6bDBhkiBXggIDoxQpvBLYExTLH8OoiJosR2HNAaqUZdXV7OVtX+EhZHEe9VhM
X-Received: by 10.107.3.220 with SMTP id e89mr2550439ioi.99.1456404766171;
	Thu, 25 Feb 2016 04:52:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 25 Feb 2016 04:52:26 -0800 (PST)
In-Reply-To: <2CD39F82881F465AAD78DBB61BCA369E@RD3>
References: <AB28D54196164B23BA942EBCF3204741@RD3>
	<20160224141143.GB2892@mbabyjoh-mobl.fi.intel.com>
	<2CD39F82881F465AAD78DBB61BCA369E@RD3>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Feb 2016 12:52:26 +0000
Message-ID: <CAJTo0LYMO4C9+rd1NG7mMmn4YfU6vRhuOYni4vvPAugoru=uwA@mail.gmail.com>
To: winiston@futuraautomation.com
Cc: yocto texas <meta-ti@yoctoproject.org>,
	Yocto layer <linux-yocto@yoctoproject.org>,
	OpenEmbedded core <openembedded-core@lists.openembedded.org>
Subject: Re: How to integrate third party application software to yocto image
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
X-List-Received-Date: Thu, 25 Feb 2016 12:52:46 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7cbcdf75052c97a853

--001a113f0e7cbcdf75052c97a853
Content-Type: text/plain; charset=UTF-8

On 25 February 2016 at 12:51, <winiston@futuraautomation.com> wrote:

> IMAGE_INSTALL_append = " navit_svn"
>

The recipe is called navit, _svn is the version.  Just append " navit".

Ross

--001a113f0e7cbcdf75052c97a853
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 February 2016 at 12:51,  <span dir=3D"ltr">&lt;<a href=3D"mailto:wini=
ston@futuraautomation.com" target=3D"_blank">winiston@futuraautomation.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":dxh" cl=
ass=3D"a3s" style=3D"overflow:hidden">IMAGE_INSTALL_append =3D &quot; navit=
_svn&quot;<br></div></blockquote></div><br>The recipe is called navit, _svn=
 is the version.=C2=A0 Just append &quot; navit&quot;.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113f0e7cbcdf75052c97a853--
