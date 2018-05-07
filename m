Return-Path: <jpewhacker@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7959F747EB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 23:43:02 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id w123-v6so17796460oia.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2018 16:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=L8Ueqzte/IInFTjQM6HS7fOTE+xI9Y+P6UaxINrlTKQ=;
	b=cdXHgLw/c4SluIRUCD5Au4bOgfhIshR+LWiegzSbDZL54Yvh8LXLvON7FhqwYojSeN
	uDmgO8vUqgCKUCbs06g2ofgenteripJGMPJk+BZxjuxsuVDekI1o0owNH+PvntP3lcs8
	34Hp5wzy02s92vDVxkbpPpU7Me/+HntH6yoU4w0dcCWqiQsUHdvcu50n91hCnzzZbxJl
	t2F5WJUJm3UXy1AeFGAkHEQDhVu696DKA2iFLZhc1dRZw62LSKYg8tfmRp4Rxj+qF7yV
	bGZGQQ7ffo6UXsEnaHiIm4s08gaBJNq7LAP9kfdUQi22T2DS1AoHH5SEipUvbQR2jczH
	xdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=L8Ueqzte/IInFTjQM6HS7fOTE+xI9Y+P6UaxINrlTKQ=;
	b=ok5Ip2ByTPnKi4l44eAdlwIkb5TMHwjYauMamZxR7frIetEQ/llGGR97ykSllGpQPK
	vHDmUdkNo+pEG+9HMnjMJnA+YQW8WE5sROrPtkKUdZ9d8idyIe9Onk0DEsGeACUxUkdR
	ql3k+qeuvpT+1K7CfFZLKAE17IxHhR8dkJDrG6JjWYa+IZVMxNJYuULZWhUp7/d8HmOS
	UgA5dxq1NlIu/03WD7eKpunMWMB0Q3Jm4Czq9qRax/5deL95Sq/AZr8IVhlFHiiOszf0
	qhFDyDC2Am1qaoy4ikDWc4cjwp1x2enNvASJWGmF1+ZUQoqPh4b+XMVu1MGe5zKfBBoU
	TEtA==
X-Gm-Message-State: ALQs6tCJF/l31JMQmYzUEfe+VpLYrJkn4cJmoaC6HdZkz678x5PVipYB
	WCypMIRgRPiUQyK+jMgfBXRyrTcummsX7bNeDXs=
X-Google-Smtp-Source: AB8JxZrmvliZDeVmbrhe4XFRHhxUm2lw8QVzpEa3Rh+n4t+pHZAIi6l5AteY1RdiqjlwXaP6IF3TP0/xit2JyHWT8Xg=
X-Received: by 2002:aca:dd46:: with SMTP id
	u67-v6mr22577150oig.355.1525736583475; 
	Mon, 07 May 2018 16:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAGVhguEEi7uE2HZQoDj_4puDZ+44j5RhJSvsHFCc4cQcobMvxA@mail.gmail.com>
In-Reply-To: <CAGVhguEEi7uE2HZQoDj_4puDZ+44j5RhJSvsHFCc4cQcobMvxA@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 07 May 2018 23:42:53 +0000
Message-ID: <CAJdd5GZiCoW3mMDkjaB-jyVBdZjbLRwYgEwokUd=bTs1weMy+A@mail.gmail.com>
To: C Michael Sundius <msundius@sundius.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sdk
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
X-List-Received-Date: Mon, 07 May 2018 23:43:04 -0000
Content-Type: multipart/alternative; boundary="000000000000143604056ba63b08"

--000000000000143604056ba63b08
Content-Type: text/plain; charset="UTF-8"

On Mon, May 7, 2018, 17:26 C Michael Sundius <msundius@sundius.com> wrote:

> Hi All,
>
> I've been scratching my head all day about why I can build my recipe under
> bitbake, but whne I try to build w/ the SDK I create w/ bitbake -c
> populate_sdk <my-image> it cant find the headers for the libraries that I
> depend upon.
>
> somehow when I create the sdk, it does not include the header files for
> the dependent libs. I see the .so files in the sysroot, but I don't see any
> of the header files.
>
> I don't see any of the headers for libxml2,  or the other libs.. those are
> simply standard recipes from yocto.
>
> any thoughts what am i doing wrong?
>

Maybe  "dev-pkgs" was accidentally removed from SDKIMAGE_FEATURES?


> -----------------------
> inherit abc-cmake
> inherit pkgconfig
> inherit systemd
>
> EXTRA_OECMAKE_append = "\
>     -DENABLE_SYSTEMD=ON \
>     -DENABLE_API=ON \
>     -DENABLE_CONFIG=ON \
>     -DENABLE_UNITTEST=ON \
>     -DENABLE_TUNCTL=ON \
>     -DENABLE_WATCHDOG=ON \
>     -DENABLE_AESNI=ON \
>     -DFORCE_ALIGNMENT=OFF \
>     -DENABLE_TRACE=OFF \
>     -DENABLE_TUNING=OFF \
> "
>
> EXTRA_OECMAKE_append_abc-dev = " -DENABLE_TRACE=ON"
> EXTRA_OECMAKE_append_abc-dbg = " -DENABLE_TUNING=ON"
>
> LIC_FILES_CHKSUM = "file://COPYING;md5=8b5f7a1e89273c8fd243ca57ad73e483"
>
> SRC_URI += "file://myprog.service"
> SRC_URI += "file://myprog.conf"
>
> SYSTEMD_SERVICE_${PN} = "myprog.service"
> SYSTEMD_AUTO_ENABLE_${PN} = "enable"
>
> do_install_append () {
>         #install systemd service file
>         install -d ${D}${systemd_system_unitdir}
>         install -m 0644 ${WORKDIR}/udpf.service
> ${D}${systemd_system_unitdir}
>
>         #install tmpfiles.d configuration file
>         install -d ${D}${sysconfdir}/tmpfiles.d
>         install -m 0644 ${WORKDIR}/udpf.conf ${D}${sysconfdir}/tmpfiles.d/
> }
>
>
> PACKAGES =+ "${PN}-utilities ${PN}-samples ${PN}-conf"
>
> FILES_${PN} += "${sbindir}/dpfd"
> FILES_${PN}-dev += "\
>     ${sbindir}/segtest \
>     ${sbindir}/ttest \
>     ${sbindir}/workq \
> "
> FILES_${PN}-utilities += "${sbindir}/tunctl ${sbindir}/tapctl"
> FILES_${PN}-samples += "${datadir}/*"
> FILES_${PN}-conf += "${sysconfdir}/dpf/*"
>
> RDEPENDS_${PN}-samples += "python"
> DEPENDS = "libxml2 libevent nss systemd concurrencykit netmap"
> RDEPENDS_${PN} = "libxml2 libevent nss systemd python-core
> kernel-module-tun netmap"
> RDEPENDS_${PN} += "libxml2 libevent nss-dev systemd python-core
> kernel-module-tun netmap"
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000143604056ba63b08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Mon, May 7, 2018, 17:26 C Michael Sundius &lt;<a href=3D"mailto:msundius=
@sundius.com">msundius@sundius.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"ltr"><div>Hi All, <br><br></div><div>I&#39;ve be=
en scratching my head all day about why I can build my recipe under bitbake=
, but whne I try to build w/ the SDK I create w/ bitbake -c populate_sdk &l=
t;my-image&gt; it cant find the headers for the libraries that I depend upo=
n. <br><br></div><div>somehow when I create the sdk, it does not include th=
e header files for the dependent libs. I see the .so files in the sysroot, =
but I don&#39;t see any of the header files. <br><br></div><div>I don&#39;t=
 see any of the headers for libxml2,=C2=A0 or the other libs.. those are si=
mply standard recipes from yocto.<br></div><div><br></div><div>any thoughts=
 what am i doing wrong?<br></div></div></blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Maybe=C2=A0<span style=3D"white-space:pr=
e-wrap"> &quot;dev-pkgs&quot; was accidentally removed from </span><span st=
yle=3D"font-family:sans-serif;white-space:pre-wrap">SDKIMAGE_FEATURES?</spa=
n></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><br>------------=
-----------<br>inherit abc-cmake<br>inherit pkgconfig<br>inherit systemd<br=
><br>EXTRA_OECMAKE_append =3D &quot;\<br>=C2=A0=C2=A0=C2=A0 -DENABLE_SYSTEM=
D=3DON \<br>=C2=A0=C2=A0=C2=A0 -DENABLE_API=3DON \<br>=C2=A0=C2=A0=C2=A0 -D=
ENABLE_CONFIG=3DON \<br>=C2=A0=C2=A0=C2=A0 -DENABLE_UNITTEST=3DON \<br>=C2=
=A0=C2=A0=C2=A0 -DENABLE_TUNCTL=3DON \<br>=C2=A0=C2=A0=C2=A0 -DENABLE_WATCH=
DOG=3DON \<br>=C2=A0=C2=A0=C2=A0 -DENABLE_AESNI=3DON \<br>=C2=A0=C2=A0=C2=
=A0 -DFORCE_ALIGNMENT=3DOFF \<br>=C2=A0=C2=A0=C2=A0 -DENABLE_TRACE=3DOFF \<=
br>=C2=A0=C2=A0=C2=A0 -DENABLE_TUNING=3DOFF \<br>&quot;<br><br>EXTRA_OECMAK=
E_append_abc-dev =3D &quot; -DENABLE_TRACE=3DON&quot;<br>EXTRA_OECMAKE_appe=
nd_abc-dbg =3D &quot; -DENABLE_TUNING=3DON&quot;<br><br>LIC_FILES_CHKSUM =
=3D &quot;file://COPYING;md5=3D8b5f7a1e89273c8fd243ca57ad73e483&quot;<br><b=
r>SRC_URI +=3D &quot;file://myprog.service&quot;<br>SRC_URI +=3D &quot;file=
://myprog.conf&quot;<br><br>SYSTEMD_SERVICE_${PN} =3D &quot;myprog.service&=
quot;<br>SYSTEMD_AUTO_ENABLE_${PN} =3D &quot;enable&quot;<br><br>do_install=
_append () {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #install systemd=
 service file<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}=
${systemd_system_unitdir}<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ins=
tall -m 0644 ${WORKDIR}/udpf.service ${D}${systemd_system_unitdir}<br><br>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #install tmpfiles.d configuratio=
n file<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${sysco=
nfdir}/tmpfiles.d<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m =
0644 ${WORKDIR}/udpf.conf ${D}${sysconfdir}/tmpfiles.d/<br>}<br><br><br>PAC=
KAGES =3D+ &quot;${PN}-utilities ${PN}-samples ${PN}-conf&quot;<br><br>FILE=
S_${PN} +=3D &quot;${sbindir}/dpfd&quot;<br>FILES_${PN}-dev +=3D &quot;\<br=
>=C2=A0=C2=A0=C2=A0 ${sbindir}/segtest \<br>=C2=A0=C2=A0=C2=A0 ${sbindir}/t=
test \<br>=C2=A0=C2=A0=C2=A0 ${sbindir}/workq \<br>&quot;<br>FILES_${PN}-ut=
ilities +=3D &quot;${sbindir}/tunctl ${sbindir}/tapctl&quot;<br>FILES_${PN}=
-samples +=3D &quot;${datadir}/*&quot;<br>FILES_${PN}-conf +=3D &quot;${sys=
confdir}/dpf/*&quot;<br><br>RDEPENDS_${PN}-samples +=3D &quot;python&quot;<=
br>DEPENDS =3D &quot;libxml2 libevent nss systemd concurrencykit netmap&quo=
t;<br>RDEPENDS_${PN} =3D &quot;libxml2 libevent nss systemd python-core ker=
nel-module-tun netmap&quot;<br>RDEPENDS_${PN} +=3D &quot;libxml2 libevent n=
ss-dev systemd python-core kernel-module-tun netmap&quot;<br><br></div></di=
v>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--000000000000143604056ba63b08--
