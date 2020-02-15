Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
	[209.85.217.50])
	by mail.openembedded.org (Postfix) with ESMTP id E1A0D613D2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 16:10:37 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id k188so7796491vsc.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 08:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XuXo7QpqM5m5VmY+eMC05QU7GT0iG70/uSV7Xf6KesE=;
	b=uWIz+wdCoNLnEFQDreS5R7z0AgAhGCPOztEqfTgKT9uLUyrPRP1lZueEAkZGgLlZnL
	6+k3D//3t7+w1WnUEY2FPR6mzVn1EqEEH1Le8+NDngpjFYrx/FoTXGw5EitAjIe/qKib
	Ow1oyVIE7D94PHLut5qLJEJZx4MYCWYBiQBVMY17whyOMdxR2B8shJrIS+CzA5aDTx3D
	dvOz47ae8YId+oc+YggYQNc5h4gwE/0J+VzxBPsBuVHPDkBKZsjnYoS4ZpOhAK3OIbs5
	b4Yhr+Tl3S7watFn8ZIIISwKpA5vy9eMz/W2aK/wqOVscaUCRhkX9r/HN+0HIImB8gCb
	hTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XuXo7QpqM5m5VmY+eMC05QU7GT0iG70/uSV7Xf6KesE=;
	b=iRBeOm63DAxaoixg9D6o/SOKu9iEQptWxYpGJKDh7rb9cXK5Lh6x9g3YNcoQj0pqEc
	1WKfhrGCiR8/T/kUr2aGfDVsQHpa57LmvbPF2phWu+JzGzhhpuM8k5V0azy05yFGimdD
	Yc37hpRwnkoNTgzlPtRjrrntE1r8Knebg8s0EN1i1YNtzyFOE6bt3hO+P51Zas10FzV9
	OkZNon8/g+jNXMQx13eH0T3Mcgt60s6GL6nmo4K8KoTlsLLflGIkW6h2kcEW5hSdFT+w
	B/AjIhCMeRpcCwQWKXn35/dgPJC+vCEO+VjD40xp0HGw1nyRDXCgapY/wA7dLcCoB0e+
	YY3g==
X-Gm-Message-State: APjAAAWup5BErqWNPWFmb9GkaMeg70AM5beUU4q990aVtpxl/TWUS/ap
	y1YlRdcYE4aJBWb7r8yu/uvlaZON6DlIG46v0pg=
X-Google-Smtp-Source: APXvYqwhVe4gm03rYGKtXpZK/Kxe/Wll+uk2Ai/UnL/se747bjW6r4cKTTFYO1ggVqKQu3Xka16oF1ie1VjQzSYYGxI=
X-Received: by 2002:a05:6102:52e:: with SMTP id
	m14mr4359049vsa.25.1581783038853; 
	Sat, 15 Feb 2020 08:10:38 -0800 (PST)
MIME-Version: 1.0
References: <1581723869-21232-1-git-send-email-wangmy@cn.fujitsu.com>
	<1581723869-21232-2-git-send-email-wangmy@cn.fujitsu.com>
	<c0b0a4094d4abbdc319138d3d31be77467bdd269.camel@linuxfoundation.org>
In-Reply-To: <c0b0a4094d4abbdc319138d3d31be77467bdd269.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 15 Feb 2020 17:10:27 +0100
Message-ID: <CANNYZj_k+4H5peReUMTsG=jOiyjcxSEJUqOoPWG5EqLHTW-OVw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] icu: upgrade 64.2 -> 65.1
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
X-List-Received-Date: Sat, 15 Feb 2020 16:10:38 -0000
Content-Type: multipart/alternative; boundary="000000000000248434059e9f90c4"

--000000000000248434059e9f90c4
Content-Type: text/plain; charset="UTF-8"

On Sat, 15 Feb 2020 at 11:19, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> This breaks webkitgtk:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/1548
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/272
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1563
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1567
>

This should be addressed by the webkit update Khem just posted.

Alex

--000000000000248434059e9f90c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 15 Feb 2020 at 11:19, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br>
This breaks webkitgtk:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/52/build=
s/1548" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/52/builds/1548</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/108/buil=
ds/272" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/108/builds/272</a><br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/64/build=
s/1563" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/64/builds/1563</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/45/build=
s/1567" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/45/builds/1567</a><br></blockquote><div><br></div=
><div>This should be addressed by the webkit update Khem just posted.</div>=
<div><br></div><div>Alex<br></div></div></div>

--000000000000248434059e9f90c4--
