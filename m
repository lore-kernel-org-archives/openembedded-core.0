Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id ADC0C71C70
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 11:20:20 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id h23so10205323iob.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 03:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xgQKT4DykmvGFXmXyaI56KkG3JZE1Y0cPG6XF0Bj96w=;
	b=z4ZJvvg1HRoY1MnnT0bhf2M50nv68GwsKQaSvbSly6J1gl3CW2FMw1iqUNcOBG9QTU
	+318j8Xd5M8dKQnJOPkO17MkOWuVsuO6ypitqJpq6oBHXqVIZnc3qveJ/jZmq/eoayfd
	RyrBbDVqrMw3+um6vlTyKtU402BD1O1dEHE2rkd/rrz47e6jyRPljZPIIboEDAljNDbX
	etWUdO8T4TiEfpERVu5qn3JFMICIaKpq8Mm2DKtjwC31Wb8w0bbTu58NStDo5T2WNEbD
	92Y4EwY2mt+5dpEgqcB/3HcwhqZf5xli1GyA8s7u3AIJjVcKxYN+Mh3+mK91n4yzKI8e
	GXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xgQKT4DykmvGFXmXyaI56KkG3JZE1Y0cPG6XF0Bj96w=;
	b=NFXVO74pqS1P8+PYYBeNQWx90/9LnwKTJuvnyBM5CHbd7UxvbHW1IWGq/ncj4Fsubx
	rkjkpPUJJ1mwFwZLKNu3hsxyOG9UkRUIDdW6CDIjVplqaIzkgDTWcuOShNw5c+p8yYcx
	UTkMzsPPY6Vz3u3Yx7+7Fc85pcxrMg7+1BHDiAzKX9Bldznenz1asHmf21kDsH2LWvQ0
	x+/pQMQk1Naevlcu/fcJlcElsC4nYVuKCO9F7x66ePrZ3AK859bZvscegeiv6/jJVy9W
	tIcM8/N1A1AUAHhvVFRCQeBcrrnueGmAl2msqeIzOEyuNAsj5h3rvj11EosyP7ElGm2U
	Hu5w==
X-Gm-Message-State: APf1xPD2E9N/+uIbh4UlwOUeNOc89vODspwTsrSuuqJBNJE22Bjlmih+
	vYGYsSV5EIOugRVYbbtahdwUwTIajFKXu9Ds0TZZ0w==
X-Google-Smtp-Source: AG47ELtbeG21Usq4w0MaMSNvMu3H2iAF7BrvM/Kg3rLjDeeW4RoW0oib03O35RKXk3HXPXu3W+6GjSwxLJNnU6iBXRE=
X-Received: by 10.107.6.139 with SMTP id f11mr16323710ioi.23.1519730421544;
	Tue, 27 Feb 2018 03:20:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Tue, 27 Feb 2018 03:20:01 -0800 (PST)
In-Reply-To: <8f3fceb1-bb2b-de95-acd0-947ccc7a674e@linux.intel.com>
References: <20180202173815.9500-1-alexander.kanavin@linux.intel.com>
	<3144211.9qXzQgCZpO@yow-masselst-lx1>
	<00d7531e-b773-536e-ad5b-e19f8f993dbf@linux.intel.com>
	<1778379.J915XxZyfQ@yow-masselst-lx1>
	<8f3fceb1-bb2b-de95-acd0-947ccc7a674e@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Feb 2018 11:20:01 +0000
Message-ID: <CAJTo0LbK_EGmqKHdMmtWLKmTXfzjmJa80rN3u=6d_CF1H6r_Jg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gtk-doc: update to 1.27
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
X-List-Received-Date: Tue, 27 Feb 2018 11:20:20 -0000
Content-Type: multipart/alternative; boundary="001a113eeaeaee4eda05662fcf8e"

--001a113eeaeaee4eda05662fcf8e
Content-Type: text/plain; charset="UTF-8"

On 9 February 2018 at 07:03, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> gtk-doc recipe does have a direct dependency on python3-six, subject to
> 'api-documentation' in DISTRO_FEATURES. The reason it's conditional is that
> we don't want to build a ton of gtk-doc dependencies in the default case
> that used by almost everyone. Yes, this produces gtk-doc scripts that are
> not working, but they will not be run anyway, if gtk-doc capable recipes
> inherit the gtk-doc class, which will disable the gtk-doc feature.
> libunique was missing that inherit, the patch to fix that is now on oe-devl
> list. Take it and the issue will go away.


This is close but not quite right.  gtk-doc has a RDEPENDS on python3-six,
but it then uses the *host* python3 binary in gtkdoc-scan so if the host
doesn't have six installed it will fail:

| Traceback (most recent call last):
|   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-extras/build/build/tmp/work/core2-64-poky-linux/kmod/25+gitAUTOINC+aca4eca103-r0/recipe-sysroot-native/usr/bin/gtkdoc-scan",
line 29, in <module>
|     from gtkdoc import common, config, scan
|   File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-extras/build/build/tmp/work/core2-64-poky-linux/kmod/25+gitAUTOINC+aca4eca103-r0/recipe-sysroot-native/usr/share/gtk-doc/python/gtkdoc/common.py",
line 31, in <module>
|     import six
| ImportError: No module named 'six'

Ross

--001a113eeaeaee4eda05662fcf8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 9 February 2018 at 07:03, Alexander Kanavin <span dir=
=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D=
"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-s=
tyle:solid;border-left-color:rgb(204,204,204);padding-left:1ex">gtk-doc rec=
ipe does have a direct dependency on python3-six, subject to &#39;api-docum=
entation&#39; in DISTRO_FEATURES. The reason it&#39;s conditional is that w=
e don&#39;t want to build a ton of gtk-doc dependencies in the default case=
 that used by almost everyone. Yes, this produces gtk-doc scripts that are =
not working, but they will not be run anyway, if gtk-doc capable recipes in=
herit the gtk-doc class, which will disable the gtk-doc feature. libunique =
was missing that inherit, the patch to fix that is now on oe-devl list. Tak=
e it and the issue will go away.</blockquote><div><br></div><div>This is cl=
ose but not quite right. =C2=A0gtk-doc has a RDEPENDS on python3-six, but i=
t then uses the *host* python3 binary in gtkdoc-scan so if the host doesn&#=
39;t have six installed it will fail:</div><div><br></div>| Traceback (most=
 recent call last):<br>| =C2=A0 File &quot;/home/pokybuild/yocto-autobuilde=
r/yocto-worker/nightly-qa-extras/build/build/tmp/work/core2-64-poky-linux/k=
mod/25+gitAUTOINC+aca4eca103-r0/recipe-sysroot-native/usr/bin/gtkdoc-scan&q=
uot;, line 29, in &lt;module&gt;<br>| =C2=A0 =C2=A0 from gtkdoc import comm=
on, config, scan<br>| =C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/y=
octo-worker/nightly-qa-extras/build/build/tmp/work/core2-64-poky-linux/kmod=
/25+gitAUTOINC+aca4eca103-r0/recipe-sysroot-native/usr/share/gtk-doc/python=
/gtkdoc/common.py&quot;, line 31, in &lt;module&gt;<br>| =C2=A0 =C2=A0 impo=
rt six<br>| ImportError: No module named &#39;six&#39;</div><div class=3D"g=
mail_quote"><br></div><div class=3D"gmail_quote">Ross</div></div></div>

--001a113eeaeaee4eda05662fcf8e--
