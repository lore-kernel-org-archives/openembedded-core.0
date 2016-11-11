Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 73C82600EB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 15:35:10 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id n21so23221024qka.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 07:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4FRLg/I3G0ekOacUdBLvxqXGQzJhz+j/+VL9NwndTN8=;
	b=lYYeb7y03CGsNyF5ZzPKkETgc8uegqh1YtnetYK9HcoRGezdIHt/0oAzBavks+ikJy
	HRxl+JTxGpkUVOIl2B0ZJywu6kjVuQeLrU0Pis3cR4LiZBCpS/yrCnXFioeELLKWKeFE
	kotJ9bir6EZj3YCQUoUaMwOomzOWTefQyyf0Pkb0eCFmFFcVLhODw3P8dF3izBtmMhpG
	6ucbnLoSCwZzAs3lqnk21nXlQv7nTJc1pQg4TcUzinPdMvePjszGqHljlkWGsG09dzpR
	yOs8uqHo+Nx4fbxfl18M1kw1DpgAPhZUweT1Hde2M2P1XMlUj7aW4lGLk31ITtCMxuXa
	TDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4FRLg/I3G0ekOacUdBLvxqXGQzJhz+j/+VL9NwndTN8=;
	b=Y7sgDWouewdFtB+x4HyF8ujq0XKkNiDsE8kaWNzvMefoT+gRof6RphgKaTOFZt5X0C
	zG6ikVp97l2DQwDgvGjDqZauau1MQ3a1g7iBNSgq0enzkaKKqAC/Vvdli6ZBpZr3ttpw
	M9aaAvRJyGHlKVLE4HCOHBNTyHSuloaXCpN6RLIxT6GbEas+cvUc4tVg8MddhEiDUHeL
	GPo5kjKKX03s39RluI4AQ4Lqf2It5Fwq66DFxRSl85ziK1Of3Pt/nbjtWjj8hzWiyjA2
	zS/mMVoDaTAhRt6KPH0b57gsm2OZcxMRh/yrkQtHNlTb3KFEoWF4azQD6hB/iNO7ZyTF
	I4SQ==
X-Gm-Message-State: ABUngveBJBANAkxrx5BJL18t3eEwwbkPhLcyWoRXcUEfWSGxnMtCcqtbMSZUBjAcDwwhNdfk9olYUnGwuPknep61
X-Received: by 10.55.39.88 with SMTP id n85mr3671823qkn.244.1478878512088;
	Fri, 11 Nov 2016 07:35:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Fri, 11 Nov 2016 07:34:51 -0800 (PST)
In-Reply-To: <0e379627-328b-cd37-0310-67a14156d90e@embed.me.uk>
References: <0e379627-328b-cd37-0310-67a14156d90e@embed.me.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Nov 2016 15:34:51 +0000
Message-ID: <CAJTo0LaY5K8gY97hXbLgGkaRNbKGv-DwvLU0H1jt8oSkXg+rug@mail.gmail.com>
To: Jack Mitchell <ml@embed.me.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: libtool --with-libtool-sysroot
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
X-List-Received-Date: Fri, 11 Nov 2016 15:35:12 -0000
Content-Type: multipart/alternative; boundary=94eb2c094b16611e530541083c57

--94eb2c094b16611e530541083c57
Content-Type: text/plain; charset=UTF-8

On 11 November 2016 at 14:34, Jack Mitchell <ml@embed.me.uk> wrote:

> However, looking at the libtool recipe in OE it has a patch which changes
> the libtool flag from --with-sysroot to --with-libtool-sysroot. The
> question is, how is this version not making it into my SDK, I have sourced
> the environment script and a which libtoolize points to the right path.
>

Is the package you are trying to build using its own libtool (or the host
libtool), and not our prefixed libtool?

Ross

--94eb2c094b16611e530541083c57
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 November 2016 at 14:34, Jack Mitchell <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ml@embed.me.uk" target=3D"_blank">ml@embed.me.uk</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":lm" class=3D"a3s aXjCH=
 m1585403ec2526576">However, looking at the libtool recipe in OE it has a p=
atch which changes the libtool flag from --with-sysroot to --with-libtool-s=
ysroot. The question is, how is this version not making it into my SDK, I h=
ave sourced the environment script and a which libtoolize points to the rig=
ht path.<br></div></blockquote></div><br>Is the package you are trying to b=
uild using its own libtool (or the host libtool), and not our prefixed libt=
ool?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--94eb2c094b16611e530541083c57--
