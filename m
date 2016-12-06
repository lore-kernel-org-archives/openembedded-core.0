Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 02B4A71A61
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 17:19:08 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id n204so386674239qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 09:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dSQuEyTi+dwz4Pp3R5m4LcZcCcU0cUZdmolrJKqbokE=;
	b=OdFq26T++qtHvEwvZf/DdE4Xgrlr5kN520BMTgGIEEWbVrmkAPtpkGao4Gty8e/u1M
	zglDu4H/CbnPX1wVdyYqcJKjXj4CLl4OXUn3m1Cc+LIS5eYyuJaFniEijU4UBiuYj9F+
	d9zOmJudHJZWmYEFfeKCtgnWWZMbVETWbyntNMpis+uotooVklNEYwJnwVzw2iedsdak
	ZFWH6OhKd5R9STOC5ptIsVMsnlS1y6nUsewblWd4pqG36KhR46qsGn3z92eSfi0zJqYj
	pPYUwQ+pz3u8W6DYVgzrFS71W6WB7FPB+UhUtQ/j1PMMrKA1aBYGiBOaoTP7ZwYsw+k1
	Ii9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dSQuEyTi+dwz4Pp3R5m4LcZcCcU0cUZdmolrJKqbokE=;
	b=eN6DvVTaT41cqR+c3tHDKWaPBj+yhmbLERoJEq4XyYOOU8sb8NGko2Owrfd53QUDax
	/lmykqh2Wl/95icaH8teg7JhqHpnFjDZwkoPTPlbXM7jOs+UDUipD8rFG4pl0xHqMyTS
	mFv9LL4E9vXqQbzs9VHWSAb9aUH0n4OJctOmHiyynyom1vmj+MF4VcQFtwhq21dFdjBk
	9MTraxHyvdM5xbD5RgjBfeh3R/rRYC2taZLKGpRHLOT0K/ysaSOq4xZwFGgH+CIaxS2n
	HhC5La201b6kU89uNJCKPOK5xgJg8DjGtBoyX1vwae9WkSVumNS+gmUmlKFP5YOPIUAG
	Y0Pw==
X-Gm-Message-State: AKaTC019uo2GTNdLbVGutrndt+pqWUAGVzonJEqWUNkzxX5ctXSTdH0A506gjfkhghGYC7p4yJcfedRmTA/rarya
X-Received: by 10.55.8.20 with SMTP id 20mr62898345qki.3.1481044749729; Tue,
	06 Dec 2016 09:19:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 09:18:49 -0800 (PST)
In-Reply-To: <6D6B8004-668B-4C5B-96BE-7A231F365788@gmail.com>
References: <20161201083726.6160-1-raj.khem@gmail.com>
	<CAHiDW_ERJNEoc4OfTQtV6Bi3UPzQkt9RMPJDUx-RAVJnrj2feA@mail.gmail.com>
	<6D6B8004-668B-4C5B-96BE-7A231F365788@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 17:18:49 +0000
Message-ID: <CAJTo0LaPBUCpN1DPDGQWTFrRoUfDOhHG2kq8Fh54JpZBwahBig@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: Add PKG_CONFIG_SYSROOT_DIR to output of pkg-config
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
X-List-Received-Date: Tue, 06 Dec 2016 17:19:09 -0000
Content-Type: multipart/alternative; boundary=001a114c9d60348dff0543009ab6

--001a114c9d60348dff0543009ab6
Content-Type: text/plain; charset=UTF-8

On 5 December 2016 at 19:08, Khem Raj <raj.khem@gmail.com> wrote:

> having said that, there could be a multilib issue if pkgdatadir thats in
> .pc file from wayland-protocols package is using variables like ${libdir}
> which then are
> multilib dependent, if this is the case then we need to fix .pc file.
> however when I look at the <target-sysroot>/usr/share/pkgconfig/wayland-protocols.pc
> it has
>
> prefix=/usr
> datarootdir=${prefix}/share
> pkgdatadir=/usr/share/wayland-protocols
>
> seems to be free of multilib deps.
>

Funnily enough this just failed in multilib on the AB (
http://errors.yoctoproject.org/Errors/Details/111361/)

Ross

--001a114c9d60348dff0543009ab6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 December 2016 at 19:08, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><div>having said that, there could be a multilib=
 issue if pkgdatadir thats in .pc file from wayland-protocols package is us=
ing variables like ${libdir} which then are</div><div>multilib dependent, i=
f this is the case then we need to fix .pc file. however when I look at the=
 &lt;target-sysroot&gt;/usr/share/<wbr>pkgconfig/wayland-protocols.pc it ha=
s</div><div><br></div><div><div>prefix=3D/usr</div><div>datarootdir=3D${pre=
fix}/share</div><div>pkgdatadir=3D/usr/share/wayland-<wbr>protocols</div><d=
iv><br></div><div>seems to be free of multilib deps.</div></div></blockquot=
e></div><br>Funnily enough this just failed in multilib on the AB (<a href=
=3D"http://errors.yoctoproject.org/Errors/Details/111361/">http://errors.yo=
ctoproject.org/Errors/Details/111361/</a>)</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114c9d60348dff0543009ab6--
