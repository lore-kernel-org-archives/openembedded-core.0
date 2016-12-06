Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 403BA719B5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 15:07:31 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id w33so348201208qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 07:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C4eC6c6APH7rhh5szmfgYqQyQRx62O25xBfYZ/HQbDI=;
	b=nSpE96QOTedpOZjOZoieozzr3pn+Cr8bLTMQ7tPwMBPJxwCzZot74NIP+BMUmD1Nt8
	y+CXEvd28PcXDvhDjhKVueZxJQ0vB2mGllUZLvRZrb4g1KFY+9WnEAI6vMEEcedbhoVh
	BjmaeRwgdYFT4JlirMyKRta2SrCnDayGWYxhaE2Hc/E9UnErKN/LPyUoO4bL9wUlZRhx
	KmnsTtqT9N2n2QqYPZKXMmvE4KH6Rf0kAWPgz9yWc4ItBIrHKSoiy4HBizdktd7QcyLk
	sHAZzo3lXS0tvU6dtKvOvkOfh6+6scOt2SS2L25gFcINmwrY5Ij8H02cDVCcIZZxYgVI
	bsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C4eC6c6APH7rhh5szmfgYqQyQRx62O25xBfYZ/HQbDI=;
	b=YiPTLkpmjeFMzmTUxPdrD6eJIpgKgZpqk1TSjGyjt4rIv+1BzKfu+EF58NnQhwfvxe
	QhF+OIhiSQ/bF80IHnCXi53/BAUOds2FzWhuAFauNXWZC1uP5oFuNCK1FzR4aKWIevAu
	mT3RHFzCetL3q32jDOcKGmPIlCcZS9rrVRJS8xfX8H7z6NuPwKypFeS9yllOK05fqgvu
	VzEnHjBsU+H0y1Jtc3HNpbo72mSWqUZlLNgCLzPR7OkaHbM4CvODXfu4xo28iyIkjYsB
	Tah0dxbxfRTgb11KWpbaXSlynEEwhrYsEu1FVoDBEBI0+w+eldW/pw6efJYZWZpPkQNU
	gB6A==
X-Gm-Message-State: AKaTC02tUMMmC3BNBbCBt6P0rG7WY8rSPJ/bXbSLIwBP7o+aDt7+0WIk8zLwivR+xvUJkX8uP34TQbXPe3yrFwNh
X-Received: by 10.237.34.46 with SMTP id n43mr60898886qtc.105.1481036852638;
	Tue, 06 Dec 2016 07:07:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 07:07:12 -0800 (PST)
In-Reply-To: <1481065505-49663-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1481065505-49663-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 15:07:12 +0000
Message-ID: <CAJTo0LbEYa6ywOiT6ZV2FvDC8LoM9VNaL3f-ACi6w6gxjwOaJQ@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] less: 481 -> 487
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
X-List-Received-Date: Tue, 06 Dec 2016 15:07:33 -0000
Content-Type: multipart/alternative; boundary=001a11377e1880552b0542fec33b

--001a11377e1880552b0542fec33b
Content-Type: text/plain; charset=UTF-8

On 6 December 2016 at 23:05, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> -                    file://LICENSE;md5=48c26a307f91af700e1f00585f215aaf"
> +                    file://LICENSE;md5=2ef3e4b8dafc85612bc5254b8081e234"
>

Please resend with an explanation in the commit message as to why the
LICENSE has changed (for example, because it was relicensed to GPLv3, or
because the copyright years were updated, or the text was reformatted).

Ross

--001a11377e1880552b0542fec33b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2016 at 23:05, Huang Qiyu <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangqy.fnst@cn.fujitsu=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1m=
u" class=3D"a3s aXjCH m158d4aba47836454">LIC_FILES_CHKSUM =3D &quot;file://=
COPYING;md5=3D<wbr>d32239bcb673463ab874e80d47fae5<wbr>04 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSE;md5=3D<wbr>48c26a307f91af700e1f00585f215a<wbr>af&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSE;md5=3D<wbr>2ef3e4b8dafc85612bc5254b8081e2<wbr>34&quot;</div></bl=
ockquote></div><br>Please resend with an explanation in the commit message =
as to why the LICENSE has changed (for example, because it was relicensed t=
o GPLv3, or because the copyright years were updated, or the text was refor=
matted).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a11377e1880552b0542fec33b--
