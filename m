Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 64881775DE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 14:38:45 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id j85so32926412wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 07:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=wUkCCHff7Q4v+NXTUoAwguQPAcE0Q3jFyGb8jUbpXd0=;
	b=aScrDZ0IzfnA7oPEkqeCOteJPALdnEYba2pz3A1kTVTl9W2mZMeT69U445wTo4QbHO
	L9ShYFASOJuDJZb5TR7uw2efS69u90HhLvb4I6a8uDCwXfbHsebYaS6IdQUGM2I0mTSf
	TYUEVmrrgC1eIuX8njcoqtpCqLx+Y9hCZCmwA4vXiYA/uUSgWKais3utRTDOablwuPrY
	u8i0M0n49sObmwtLIgiN0Wdl9lItNq/z/LKHMn8i5AIgRbuGcEARxrxYBfZSkk5udvfH
	j+ke52lvFfA+/3vaTP1eKtP5jSnGXlL7gfrf53WckKzdjKxBwu2emMFEUIYzCkg+snf9
	hg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=wUkCCHff7Q4v+NXTUoAwguQPAcE0Q3jFyGb8jUbpXd0=;
	b=emiXCJD1F1L6nx6JxCSsb0w4xbmQnvC2PxfT16n7L+37HBIEa/ftAJ3VJqUJ2vRjSz
	pwHHP9Jx7UhoKIzNgWyVnnTiv6A1FD5l1PntSKIRZf0GUFAjNY591vlgR6nZK07OC/8H
	p49k1Do5YMj9YdGRh7ztnDzEes4joFjTB2L96H0F+K/EDmnNr5gxCdTWCyCL7xM38QvX
	1htqRIIrPRNmzNDCvR1+9KA1am5oZT+2MuO/0oXUZOCnfuHiOOlqMjzpz3asJeGG0vNs
	n71IpVMsnPG46zKhUiIelPghHDQAbUmQ5h7PvBBi0krjGhYWSZgWY82gwOmnCslXXuvV
	La7A==
X-Gm-Message-State: AKS2vOxfEjHNguVORykskACatMJNlDRG8h2VUekt1NdXDs0ZCMowpRD3
	rpxlYLAVu8Ln8kUcclS1GyE7N2DMaQ==
X-Received: by 10.80.140.204 with SMTP id r12mr22565804edr.123.1499265526607; 
	Wed, 05 Jul 2017 07:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1499241206.git.kai.kang@windriver.com>
In-Reply-To: <cover.1499241206.git.kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 05 Jul 2017 14:38:35 +0000
Message-ID: <CAMKF1sospBU00Y4RhShOavZm=eYxrzFXDOhA8JHeiRAvqxnkKQ@mail.gmail.com>
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Introduce a distro feature openssl-no-weak-ciphers
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
X-List-Received-Date: Wed, 05 Jul 2017 14:38:46 -0000
Content-Type: multipart/alternative; boundary="f403045c2d1e2335e7055392f529"

--f403045c2d1e2335e7055392f529
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 5, 2017 at 1:06 AM <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> Introduce a distro feature openssl-no-weak-ciphers to make openssl disable
> weak
> ciphers support, including:
>
> * des
> * ec
> * ecdh
> * ecdsa
> * md2
> * mdc2


It's probably more appropriate to pin it at recipe level may be via package
config OpenSSL is not universal and some may even avoid it completely

>
>
> The following changes since commit
> 4b1d270602a0542eef1b497eaf15bad2b747686f:
>
>   bitbake: bitbake-user-manual: Removed and replaced broken link
> (2017-07-04 16:05:22 +0100)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib kangkai/ciphers-weak
>
> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/ciphers-weak
>
> Kai Kang (2):
>   openssl: disable weak ciphers
>   bind: disable ecdsa if openssl doesn't support it
>
>  meta/recipes-connectivity/bind/bind_9.10.3-P3.bb | 1 +
>  meta/recipes-connectivity/openssl/openssl.inc    | 5 +++++
>  2 files changed, 6 insertions(+)
>
> --
> 2.10.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045c2d1e2335e7055392f529
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Wed, Jul 5, 2017 a=
t 1:06 AM &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.kang@windriver.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Kai Kang &=
lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.kang@win=
driver.com</a>&gt;<br>
<br>
Introduce a distro feature openssl-no-weak-ciphers to make openssl disable =
weak<br>
ciphers support, including:<br>
<br>
* des<br>
* ec<br>
* ecdh<br>
* ecdsa<br>
* md2<br>
* mdc2</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s p=
robably more appropriate to pin it at recipe level may be via package confi=
g OpenSSL is not universal and some may even avoid it completely</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><br>
<br>
The following changes since commit 4b1d270602a0542eef1b497eaf15bad2b747686f=
:<br>
<br>
=C2=A0 bitbake: bitbake-user-manual: Removed and replaced broken link (2017=
-07-04 16:05:22 +0100)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.pokylinux.org/poky-contrib" rel=3D"noref=
errer" target=3D"_blank">git.pokylinux.org/poky-contrib</a> kangkai/ciphers=
-weak<br>
=C2=A0 <a href=3D"http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dk=
angkai/ciphers-weak" rel=3D"noreferrer" target=3D"_blank">http://git.pokyli=
nux.org/cgit.cgi/poky-contrib/log/?h=3Dkangkai/ciphers-weak</a><br>
<br>
Kai Kang (2):<br>
=C2=A0 openssl: disable weak ciphers<br>
=C2=A0 bind: disable ecdsa if openssl doesn&#39;t support it<br>
<br>
=C2=A0meta/recipes-connectivity/bind/<a href=3D"http://bind_9.10.3-P3.bb" r=
el=3D"noreferrer" target=3D"_blank">bind_9.10.3-P3.bb</a> | 1 +<br>
=C2=A0meta/recipes-connectivity/openssl/openssl.inc=C2=A0 =C2=A0 | 5 +++++<=
br>
=C2=A02 files changed, 6 insertions(+)<br>
<br>
--<br>
2.10.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--f403045c2d1e2335e7055392f529--
