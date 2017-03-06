Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7376D65D00
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 14:52:51 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id 62so86172698oih.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 06:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nHSoMA3NdRIERkcJ/QzwX0jDMy+yWZ2rJPt5xVH3pSs=;
	b=xi1N7cMOmL+eF2+t8hrUyP04WAhcGgmgpEtx+jFrAAr1msRcfpZ8JcvfwoZQIBF17n
	Mc4V8gdbA/oJhng+1ud5d6YaiNX61cXH6A/gezlUjc0TSWWeKwxbP3IXCdMHNfhOPvt5
	3WQShl6HiMEkHvlIWjszkYrSnzKJG88nPnCXDAv4Yd6qkJyVlWi1NWEWYww3bDF2BGtM
	vkzRfB00Rdy6//lJrA+3x5n9x9/oXyWvAVRo1uw59tQGcyqmJRAVp2jMQaMidpR/GrC1
	fPFtNjOQsXaD1Nxa/Spq0KGR1lxNuUFWlKFtvZHfER8YVt3bPo0t7IET0gvTa6MLA+qi
	/J+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nHSoMA3NdRIERkcJ/QzwX0jDMy+yWZ2rJPt5xVH3pSs=;
	b=fiUgEgFZzj8KHf2M3U4AHo5JlYEeW/wTeeHNmAT/fMBwk+ydhX09HpVbUNN/RojAay
	fPNn7QaczIlKVFhtiRNOY2fH0OCHa5ZrAqZQtLYMS4Y1g34RSgdje8k6A+wn4B2/dw/E
	7xWoJRb5vi9+u6UtpbUnOM1krbrg4WlZ5Soxz+6uLgaJ3lM5vXXjoLdlm/8toY99527U
	ge0DdVuYL6s324cU67L4BYJkvK29RXN0XBo7/nv+uAHn+lbu0gJLezVShJeeM8P301y2
	hByE2DhgiKsqY2Xcos8PII1vQOiFoQPPzyorfkU/3PbZXJm66wU5kvvKeWWZ7/ACHRQT
	/g/Q==
X-Gm-Message-State: AMke39mAjYacf/qGazc3/ZJbDru7SroBK7xKvJJYWfKOSqLdL75x42rl9P9IwY5wrhHS+z5PbCMdB4Z+yoBH89J0
X-Received: by 10.237.43.69 with SMTP id p63mr15443998qtd.68.1488811973156;
	Mon, 06 Mar 2017 06:52:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 6 Mar 2017 06:52:32 -0800 (PST)
In-Reply-To: <1486636418-5719-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1486636418-5719-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Mar 2017 14:52:32 +0000
Message-ID: <CAJTo0LZw6GgVuwrXZRnb0oHOUrcpNdMw8UEJ7boN8QPkjty4=Q@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] busybox: 1.24.1 -> 1.26.2
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
X-List-Received-Date: Mon, 06 Mar 2017 14:52:52 -0000
Content-Type: multipart/alternative; boundary=94eb2c124cc4cc3762054a110c99

--94eb2c124cc4cc3762054a110c99
Content-Type: text/plain; charset=UTF-8

On 9 February 2017 at 10:33, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:

> 1) Upgrade busybox from 1.24.1 to 1.26.2
>

With busybox 1.24.1, the busybox package contains a /bin/sh ->
busybox.nosuid symlink and update-alternatives knows about the /bin/sh ->
busybox.nosuid alternative.

With 1.26.2, this binary doesn't exist anymore in the package and /bin/sh
is linked to busybox.suid at rootfs time.

sh being suid doesn't look right *at all*.  There are upstream changes to
make installing these binary names options, so it's quite likely that we're
just missing them in defconfig.

Also  makefile-fix-backport.patch was listed as a backported patch, so why
do we need to rebase it?  What's the current upstream-status, as you
deleted that from the patch?  Was it fixed in a different way in 1.26.2 so
the patch can be dropped?

Ross

--94eb2c124cc4cc3762054a110c99
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 February 2017 at 10:33, zhengrq <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.fujitsu.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:341" class=3D=
"gmail-a3s gmail-aXjCH gmail-m15a20b904027343e">1) Upgrade <span class=3D"g=
mail-il">busybox</span> from 1.24.1 to 1.26.2<br></div></blockquote><div><b=
r></div><div>With busybox 1.24.1, the busybox package contains a /bin/sh -&=
gt; busybox.nosuid symlink and update-alternatives knows about the /bin/sh =
-&gt; busybox.nosuid alternative.</div><div><br></div><div>With 1.26.2, thi=
s binary doesn&#39;t exist anymore in the package and /bin/sh is linked to =
busybox.suid at rootfs time.</div><div><br></div><div>sh being suid doesn&#=
39;t look right *at all*.=C2=A0 There are upstream changes to make installi=
ng these binary names options, so it&#39;s quite likely that we&#39;re just=
 missing them in defconfig.</div><div><br></div><div>Also =C2=A0<span style=
=3D"font-size:12.800000190734863px">makefile-fix-backport.</span><wbr style=
=3D"font-size:12.800000190734863px"><span style=3D"font-size:12.80000019073=
4863px">patch was listed as a backported patch, so why do we need to rebase=
 it?=C2=A0 What&#39;s the current upstream-status, as you deleted that from=
 the patch?=C2=A0 Was it fixed in a different way in 1.26.2 so the patch ca=
n be dropped?</span></div><div><span style=3D"font-size:12.800000190734863p=
x"><br></span></div><div><span style=3D"font-size:12.800000190734863px">Ros=
s</span></div></div></div></div>

--94eb2c124cc4cc3762054a110c99--
