Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id AA60D6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 17:31:49 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id m11so53614368igk.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 09:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=15T35hjJToFfZooxSGElj35U7gND+AvumuIrERiuPso=;
	b=RPZ586cYfkcYtufUTVB+/XuDMwDaw1MaEX4H3ROk5Icu8Pi6zriFuK+lo3ctndxrmU
	nJZ9YsWmtssd0C+BjYrByo55ZZeCkhrC9rp2Ck6eeAYera9/cmZfepBWbQj2/YBGydxR
	Gc7ylqtRkCExfqKa0g8nr/iWESt60JnBVugoxi1l7aFeqdpz+XCU5iNvxWepkxXEu5lO
	xg/b2OpfhQJtCFfe7Z/araHnjMNnF2dVrKEMxkQWM1gruFWYuu8PmmXLm/buq6JvAzwr
	KUKqHXGAh1gs44oJl8IYdnOVCZVkHwCnYeV61VPkAuHfSadh9gSdQX+Fw3Zyr9WMm+z9
	Jmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=15T35hjJToFfZooxSGElj35U7gND+AvumuIrERiuPso=;
	b=TvN4n9p/UD8w+il3kjSbqFtkCXcsD0QZJi+6AmbezOo4F/Uo/FoeYs/gK2/e7NUcPC
	aXhWe+0+klI5Uqq57F3fd6fDsEZQq25xSIe4kXdBa16nDgJUNgDC8ZnpHubP0V4TRGwf
	vZa/w1ihj2z3/lMNCpVgG+X+B8zPh35ZEd0VcLBf67xH+4W4TuFnjqopaBr+RtBG6vEy
	Ytk5reasPFepLM9KxjIEQ93zyN4b2bg1UTSfitxr/0UoyC3qV7Foo0SBzx0eeGiHTF/P
	mIuveyM+L2I6jBe4dZUr2AhNQUd3VhuIgbtLqdOwcstQzzzmrpjZPxK9f43NoLlDy6p7
	UbcA==
X-Gm-Message-State: ALoCoQlLbg35w35X+zz4TkZagg/8dU5MXitABWZT8RrwsDrlMeRBUV1xs2fVeWkFD9h8wBJwyJoj4/GuRKJ+gznFgw09OnyNjnN7uIzFNEi0YstR0v+A7/M=
X-Received: by 10.50.18.113 with SMTP id v17mr9337054igd.64.1450805509852;
	Tue, 22 Dec 2015 09:31:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 22 Dec 2015 09:31:30 -0800 (PST)
In-Reply-To: <55c3139023d3c2d418e5c34b2a7f4a000fdbc1dc.1450288828.git.mschiffer@universe-factory.net>
References: <cover.1450288828.git.mschiffer@universe-factory.net>
	<55c3139023d3c2d418e5c34b2a7f4a000fdbc1dc.1450288828.git.mschiffer@universe-factory.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Dec 2015 17:31:30 +0000
Message-ID: <CAJTo0LZfmtfw-XsnVd7THwv1gKfmY=hjBF9EiNknA9jhLRS6Aw@mail.gmail.com>
To: Matthias Schiffer <mschiffer@universe-factory.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] base-files: create ${base_bindir} etc. instead of /bin, /sbin and /lib
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
X-List-Received-Date: Tue, 22 Dec 2015 17:31:50 -0000
Content-Type: multipart/alternative; boundary=089e01494ff20dacba05277ffb55

--089e01494ff20dacba05277ffb55
Content-Type: text/plain; charset=UTF-8

On 16 December 2015 at 18:11, Matthias Schiffer <
mschiffer@universe-factory.net> wrote:

> -dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
> -           ${sysconfdir}/skel /lib /mnt /proc ${ROOT_HOME} /run /sbin \
> +dirs755 = "${base_bindir} /boot /dev ${sysconfdir} ${sysconfdir}/default \
> +           ${sysconfdir}/skel ${nonarch_base_libdir} /mnt /proc
> ${ROOT_HOME} /run ${base_sbindir} \
>

I think the *intention* of /lib was to be $(base_libdir).

Ross

--089e01494ff20dacba05277ffb55
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 December 2015 at 18:11, Matthias Schiffer <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:mschiffer@universe-factory.net" target=3D"_blank">mschiffer@un=
iverse-factory.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":1k2" class=3D"a3s" style=3D"overflow:hidden">-dirs755 =3D &quot=
;/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}/skel /lib /mnt /pro=
c ${ROOT_HOME} /run /sbin \<br>
+dirs755 =3D &quot;${base_bindir} /boot /dev ${sysconfdir} ${sysconfdir}/de=
fault \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}/skel ${nonarch_base=
_libdir} /mnt /proc ${ROOT_HOME} /run ${base_sbindir} \</div></blockquote><=
/div><br>I think the *intention* of /lib was to be $(base_libdir).</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--089e01494ff20dacba05277ffb55--
