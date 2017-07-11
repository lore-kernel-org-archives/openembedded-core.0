Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 31F4777DCA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 16:18:01 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id t72so4722935lff.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DBP2tBJfLNwP2sSRqyL13iu8/qJT94a/K9YE3SG5c1I=;
	b=ZuPb81JEJcauf9YItmgDfuXmMOCZbPe8kA9WyQhzNv3GS/SzgGCDCG/uGSVrsg2Oa3
	wxZoDdXWmvS2KTDCQq4qvV5bwuP1jM/ilpT5ha1KGta2tO+g5KA8mKCP+5r+7hAgRHbf
	u56E1R0mMnkalMdcuzcqr4L/4HhG3pyDuulPec7pFhqKEYPZNnSl6u6hpciUiGSOe5IO
	JFEzgYP/r5XIy2OmuPPu0N3r5fikhbEUAXikweFKuOKAUNKgK1xUdVEzq+pLCUDaT09Z
	uQcblA/TtyyMF5s6LP9tv1kG5tvQ/andr0md+PqQwSKl+QfjHFcM2TkheDpVxWzICGHA
	8Tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DBP2tBJfLNwP2sSRqyL13iu8/qJT94a/K9YE3SG5c1I=;
	b=Ugnqsgq9HOFEL4L48pZw0MO8ybO5G9V7fXRHo0q4nf3JLpTwjWTW2mnjRy7qTblv8B
	XdjGbSiB0lvyjxoN6T58mO+sGfHac+3dGdANmj6RLFD8tIDy96CAT/ahGEs+yD6Ajp5H
	A1B86v4/Ud4KQKjSuoLVxtozTJlXcxHXu9K9J+OGWsJBbErRP57NQKjzvvvi2IPp9Tgh
	dfthNgzr0Y8x/esYW6Hcg2Yn81lwuUYxStwcL6y/cHRmUs9D0wFzGAWgl9brPB0lTWgn
	+m4PH5OHcMNFVcvZL5IFBQrfeKb8PsN/x3XZg0lNAFqn3FWToIukuXlhsRROskuDJyw/
	r89A==
X-Gm-Message-State: AIVw110vby1HUPgcooiXcqLDoAJcp72MYjU/nxifGtmKDxsT/ExnlVBx
	bsJtnNgdFm5y5DubULseIsu5QvXhRw==
X-Received: by 10.80.144.5 with SMTP id b5mr3136251eda.24.1499789882011; Tue,
	11 Jul 2017 09:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <1499777893-16292-1-git-send-email-maxin.john@intel.com>
In-Reply-To: <1499777893-16292-1-git-send-email-maxin.john@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jul 2017 16:17:51 +0000
Message-ID: <CAMKF1sozPp_jSyoXJgAnO88R1TeX1oGdVmeEnka56DVSJWbwvg@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
Cc: joshua.g.lock@intel.com, stanley.cheong.kwan.phoong@intel.com
Subject: Re: [PATCH 0/3] pkgconf: consider pkgconf as a replacement for pkg-config
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
X-List-Received-Date: Tue, 11 Jul 2017 16:18:03 -0000
Content-Type: multipart/alternative; boundary="f403045c244827b75b05540d0b34"

--f403045c244827b75b05540d0b34
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 11, 2017 at 5:58 AM Maxin B. John <maxin.john@intel.com> wrote:

> pkgconf is a better replacement for pkg-config. Fedora 26 replaces the
> system pkg-config implementation with pkgconf because it "provides better
> support for handling .pc files and a stable library ABI/API for integrating
> into applications." and is actively maintained, unlike pkg-config.
>
> pkgconf aims to offer many improvements over pkg-config such as faster/more
> efficient dependency resolver which "allows for the user to more
> conservatively
> link their binaries -- which may be helpful in some environments, such as
> when
> prelink(1) is being used.
>
> pkgconf also aims to provide a more complete implementation of pkg-config.
> The features most likely to benefit the Yocto Project build system are the
> faster/more efficient dependency resolution and linker flag optimisation.
>
> To test this, after applying these patches, update "local.conf" as below:
>
> PREFERRED_PROVIDER_pkgconfig = "pkgconf"
> PREFERRED_PROVIDER_pkgconfig-native = "pkgconf-native"
> PREFERRED_PROVIDER_nativesdk-pkgconfig = "nativesdk-pkgconf"


Is this going to be the case permanently?
I would suggest to make pkgconf default and dump pkgconfig recipes at same
time
Or do we plan to wait for one release

>
>
> Links:
> 1. http://pkgconf.org
> 2.
> https://fedoraproject.org/wiki/Changes/pkgconf_as_system_pkg-config_implementation
> 3. https://bugzilla.yoctoproject.org/show_bug.cgi?id=11308
>
> Maxin B. John (3):
>   pkgconf: add recipe
>   libx11: fix build error
>   libxt: fix build failure
>
>  meta/files/common-licenses/pkgconf                 | 10 ++++
>  .../pkgconf/pkgconf/pkg-config-native.in           |  6 +++
>  .../pkgconf/pkgconf/pkg-config-wrapper             | 16 +++++++
>  meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb     | 55
> ++++++++++++++++++++++
>  meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb     |  3 ++
>  ...il-don-t-link-makestrs-with-target-cflags.patch | 33 +++++++++++++
>  meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb      |  4 +-
>  7 files changed, 126 insertions(+), 1 deletion(-)
>  create mode 100644 meta/files/common-licenses/pkgconf
>  create mode 100644 meta/recipes-devtools/pkgconf/pkgconf/
> pkg-config-native.in
>  create mode 100755
> meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
>  create mode 100644 meta/recipes-devtools/pkgconf/pkgconf_1.3.7.bb
>  create mode 100644
> meta/recipes-graphics/xorg-lib/libxt/0001-libXt-util-don-t-link-makestrs-with-target-cflags.patch
>
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045c244827b75b05540d0b34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Tue, Jul 11, 2017 =
at 5:58 AM Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">maxin.=
john@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">pkgco=
nf is a better replacement for pkg-config. Fedora 26 replaces the<br>
system pkg-config implementation with pkgconf because it &quot;provides bet=
ter<br>
support for handling .pc files and a stable library ABI/API for integrating=
<br>
into applications.&quot; and is actively maintained, unlike pkg-config.<br>
<br>
pkgconf aims to offer many improvements over pkg-config such as faster/more=
<br>
efficient dependency resolver which &quot;allows for the user to more conse=
rvatively<br>
link their binaries -- which may be helpful in some environments, such as w=
hen<br>
prelink(1) is being used.<br>
<br>
pkgconf also aims to provide a more complete implementation of pkg-config.<=
br>
The features most likely to benefit the Yocto Project build system are the<=
br>
faster/more efficient dependency resolution and linker flag optimisation.<b=
r>
<br>
To test this, after applying these patches, update &quot;local.conf&quot; a=
s below:<br>
<br>
PREFERRED_PROVIDER_pkgconfig =3D &quot;pkgconf&quot;<br>
PREFERRED_PROVIDER_pkgconfig-native =3D &quot;pkgconf-native&quot;<br>
PREFERRED_PROVIDER_nativesdk-pkgconfig =3D &quot;nativesdk-pkgconf&quot;</b=
lockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Is this going to be=
 the case permanently?</div><div dir=3D"auto">I would suggest to make pkgco=
nf default and dump pkgconfig recipes at same time</div><div dir=3D"auto">O=
r do we plan to wait for one release=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><br>
<br>
Links:<br>
1. <a href=3D"http://pkgconf.org" rel=3D"noreferrer" target=3D"_blank">http=
://pkgconf.org</a><br>
2. <a href=3D"https://fedoraproject.org/wiki/Changes/pkgconf_as_system_pkg-=
config_implementation" rel=3D"noreferrer" target=3D"_blank">https://fedorap=
roject.org/wiki/Changes/pkgconf_as_system_pkg-config_implementation</a><br>
3. <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11308" re=
l=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_b=
ug.cgi?id=3D11308</a><br>
<br>
Maxin B. John (3):<br>
=C2=A0 pkgconf: add recipe<br>
=C2=A0 libx11: fix build error<br>
=C2=A0 libxt: fix build failure<br>
<br>
=C2=A0meta/files/common-licenses/pkgconf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++<br>
=C2=A0.../pkgconf/pkgconf/<a href=3D"http://pkg-config-native.in" rel=3D"no=
referrer" target=3D"_blank">pkg-config-native.in</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++<br>
=C2=A0.../pkgconf/pkgconf/pkg-config-wrapper=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 16 +++++++<br>
=C2=A0meta/recipes-devtools/pkgconf/<a href=3D"http://pkgconf_1.3.7.bb" rel=
=3D"noreferrer" target=3D"_blank">pkgconf_1.3.7.bb</a>=C2=A0 =C2=A0 =C2=A0|=
 55 ++++++++++++++++++++++<br>
=C2=A0meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11_1.6.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libx11_1.6.5.bb</a>=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 3 ++<br>
=C2=A0...il-don-t-link-makestrs-with-target-cflags.patch | 33 +++++++++++++=
<br>
=C2=A0meta/recipes-graphics/xorg-lib/<a href=3D"http://libxt_1.1.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libxt_1.1.5.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 +-<br>
=C2=A07 files changed, 126 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/files/common-licenses/pkgconf<br>
=C2=A0create mode 100644 meta/recipes-devtools/pkgconf/pkgconf/<a href=3D"h=
ttp://pkg-config-native.in" rel=3D"noreferrer" target=3D"_blank">pkg-config=
-native.in</a><br>
=C2=A0create mode 100755 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-w=
rapper<br>
=C2=A0create mode 100644 meta/recipes-devtools/pkgconf/<a href=3D"http://pk=
gconf_1.3.7.bb" rel=3D"noreferrer" target=3D"_blank">pkgconf_1.3.7.bb</a><b=
r>
=C2=A0create mode 100644 meta/recipes-graphics/xorg-lib/libxt/0001-libXt-ut=
il-don-t-link-makestrs-with-target-cflags.patch<br>
<br>
--<br>
2.4.0<br>
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

--f403045c244827b75b05540d0b34--
