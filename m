Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 199F4719BB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 16:19:39 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id x190so351081685qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 08:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3ZKPNUcYqbDW1qlcjC+9LX1k9Td2vPw/W39AxDtfxUs=;
	b=gvdwoFYC7Tou7XH57gX0caBA4SNcxShvPGX83/mGZwa+HE0HPQckQC/adaX2H/CKBS
	dgTltIBDGiAZn5VpjeDKHMMvaPTLCKptLTakPN9C9q495tmAHF6rJ4c+OjPMN1QUDmu4
	8r0POlQI0CQ6zStIo38YnN5eJYYybfy+RM9WPmos4syBXoboefSJNccZFFcVmjA+h557
	yJ+YO3JLlQ4/ppwAcUDVz9HEpD0ta8yAzJ23lA9SitMICdGaneDbhY0uG2qmuCkbkrur
	pMgkVd+V+rzbeW5QoyvxkAD2jDQh8uIfeTU83dE7vT8bQq1K1oF8qN25QCBCQwKIcInz
	xmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3ZKPNUcYqbDW1qlcjC+9LX1k9Td2vPw/W39AxDtfxUs=;
	b=SO0vTuDmsVlg/lYKf7e5vw1CxrfhoIsF2NuipFDYdtKF0/tNYwC7Yud/dc/cmSy2KR
	W76AdLZGvwvfH/7UecE1s/cFe+GIgb8BcTAtFRaNd/HUtazzZB8yzQHVNH6jy0Jv7DYh
	9PbZ1NTShFok3q18D0YERD2uksHFOTsjHFxsZjperMwyXKn3++hcM5VnJmkbOXXKza1u
	hH45KiVzChXt9u+u1AhVF3ui73hUUzf60z4WS1dpDiWdRn6rv5w9/fs95NV2MTT8I+so
	SGS64Kw9vHkuYTitDMctn66eggd8Vdka4CurnkrmzVbV9QaPH1+eeDlZYluf04iwLr36
	E5Ng==
X-Gm-Message-State: AKaTC03cKfSVLcVRoC8rFM1n+D5HX320tPPqW9n/Ri3GHqD/wGoospxYem6mNwydjQt2JFkqGIRg24qYX256b8bM
X-Received: by 10.55.39.88 with SMTP id n85mr49345627qkn.244.1480954781160;
	Mon, 05 Dec 2016 08:19:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 5 Dec 2016 08:19:20 -0800 (PST)
In-Reply-To: <20161118192955.17284-1-marex@denx.de>
References: <20161118192955.17284-1-marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Dec 2016 16:19:20 +0000
Message-ID: <CAJTo0LYdVfLUnMsJkiV_bCu5cGTwrY5HvbFYfjnKj3kp+4iFNQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to v2016.11 release
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
X-List-Received-Date: Mon, 05 Dec 2016 16:19:40 -0000
Content-Type: multipart/alternative; boundary=94eb2c094b16a9255f0542eba7f2

--94eb2c094b16a9255f0542eba7f2
Content-Type: text/plain; charset=UTF-8

This doesn't apply to master cleanly, I suspect it's part of a series that
has managed to become split up in my inbox.

Is there a branch with this on?

Ross

On 18 November 2016 at 19:29, Marek Vasut <marex@denx.de> wrote:

> Upgrade U-Boot to the latest version.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Denys Dmytriyenko <denis@denix.org>
> Cc: Ross Burton <ross.burton@intel.com>
> ---
>  .../{u-boot-common_2016.09.01.inc => u-boot-common_2016.11.inc}       |
> 4 ++--
>  .../{u-boot-fw-utils_2016.09.01.bb => u-boot-fw-utils_2016.11.bb}     | 0
>  .../{u-boot-mkimage_2016.09.01.bb => u-boot-mkimage_2016.11.bb}       | 0
>  meta/recipes-bsp/u-boot/{u-boot_2016.09.01.bb => u-boot_2016.11.bb}   | 0
>  4 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-common_2016.09.01.inc =>
> u-boot-common_2016.11.inc} (71%)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2016.09.01.bb =>
> u-boot-fw-utils_2016.11.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2016.09.01.bb =>
> u-boot-mkimage_2016.11.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2016.09.01.bb => u-boot_2016.11.bb}
> (100%)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> b/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
> similarity index 71%
> rename from meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> rename to meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
> index f706a6b..84adc1c 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
> @@ -7,8 +7,8 @@ PE = "1"
>
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
> +SRCREV = "29e0cfb4f77f7aa369136302cee14a91e22dca71"
>
> -SRC_URI = "git://git.denx.de/u-boot.git;branch=u-boot-2016.09.y"
> +SRC_URI = "git://git.denx.de/u-boot.git"
>
>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb
> b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.11.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.11.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
> b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.11.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2016.11.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb
> b/meta/recipes-bsp/u-boot/u-boot_2016.11.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2016.11.bb
> --
> 2.10.2
>
>

--94eb2c094b16a9255f0542eba7f2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This doesn&#39;t apply to master cleanly, I suspect it&#39=
;s part of a series that has managed to become split up in my inbox.<div><b=
r></div><div>Is there a branch with this on?</div><div><br></div><div>Ross<=
/div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 18 =
November 2016 at 19:29, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"mailto=
:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">Upgrade U-Boot to the latest version.<br>
<br>
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de">marex@denx.=
de</a>&gt;<br>
Cc: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org=
">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<br>
Cc: Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org">denis@denix.or=
g</a>&gt;<br>
Cc: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@in=
tel.com</a>&gt;<br>
---<br>
=C2=A0.../{u-boot-common_2016.09.01.<wbr>inc =3D&gt; u-boot-common_2016.11.=
inc}=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A0.../{<a href=3D"http://u-boot-fw-utils_2016.09.01.bb" rel=3D"noreferr=
er" target=3D"_blank">u-boot-fw-utils_2016.09.<wbr>01.bb</a> =3D&gt; <a hre=
f=3D"http://u-boot-fw-utils_2016.11.bb" rel=3D"noreferrer" target=3D"_blank=
">u-boot-fw-utils_2016.11.bb</a>}=C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../{<a href=3D"http://u-boot-mkimage_2016.09.01.bb" rel=3D"noreferre=
r" target=3D"_blank">u-boot-mkimage_2016.09.<wbr>01.bb</a> =3D&gt; <a href=
=3D"http://u-boot-mkimage_2016.11.bb" rel=3D"noreferrer" target=3D"_blank">=
u-boot-mkimage_2016.11.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot_2016.09.01.bb" rel=
=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2016.09.01.bb</a> =3D&gt; <a =
href=3D"http://u-boot_2016.11.bb" rel=3D"noreferrer" target=3D"_blank">u-bo=
ot_2016.11.bb</a>}=C2=A0 =C2=A0| 0<br>
=C2=A04 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{u-<wbr>boot-common_2016.09.01.inc =3D=
&gt; u-boot-common_2016.11.inc} (71%)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot-fw-utils_201=
6.09.01.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2016.=
09.01.bb</a> =3D&gt; <a href=3D"http://u-boot-fw-utils_2016.11.bb" rel=3D"n=
oreferrer" target=3D"_blank">u-boot-fw-utils_2016.11.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot-mkimage_2016=
.09.01.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2016.09=
.01.bb</a> =3D&gt; <a href=3D"http://u-boot-mkimage_2016.11.bb" rel=3D"nore=
ferrer" target=3D"_blank">u-boot-mkimage_2016.11.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot_2016.09.01.b=
b" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2016.09.01.bb</a> =3D&g=
t; <a href=3D"http://u-boot_2016.11.bb" rel=3D"noreferrer" target=3D"_blank=
">u-boot_2016.11.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/u-<wbr>boot-common_2016.09.01.inc b/me=
ta/recipes-bsp/u-boot/u-<wbr>boot-common_2016.11.inc<br>
similarity index 71%<br>
rename from meta/recipes-bsp/u-boot/u-<wbr>boot-common_2016.09.01.inc<br>
rename to meta/recipes-bsp/u-boot/u-<wbr>boot-common_2016.11.inc<br>
index f706a6b..84adc1c 100644<br>
--- a/meta/recipes-bsp/u-boot/u-<wbr>boot-common_2016.09.01.inc<br>
+++ b/meta/recipes-bsp/u-boot/u-<wbr>boot-common_2016.11.inc<br>
@@ -7,8 +7,8 @@ PE =3D &quot;1&quot;<br>
<br>
=C2=A0# We use the revision in order to avoid having to fetch it from the<b=
r>
=C2=A0# repo during parse<br>
-SRCREV =3D &quot;<wbr>f3363c060497515ca8b71451cb56f3<wbr>ec0abacaa9&quot;<=
br>
+SRCREV =3D &quot;<wbr>29e0cfb4f77f7aa369136302cee14a<wbr>91e22dca71&quot;<=
br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-boot.git;branch=3D=
u-boot-2016.09.y" rel=3D"noreferrer" target=3D"_blank">git.denx.de/u-boot.g=
it;<wbr>branch=3Du-boot-2016.09.y</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-boot.git" rel=3D"n=
oreferrer" target=3D"_blank">git.denx.de/u-boot.git</a>&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2016=
.09.01.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2016.0=
9.01.bb</a> b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_201=
6.11.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2016.11.=
bb</a><br>
similarity index 100%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2016.=
09.01.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2016.09=
.01.bb</a><br>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2016.11=
.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2016.11.bb</=
a><br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2016.=
09.01.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2016.09.=
01.bb</a> b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2016.1=
1.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2016.11.bb</=
a><br>
similarity index 100%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2016.0=
9.01.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2016.09.0=
1.bb</a><br>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2016.11.=
bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2016.11.bb</a>=
<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2016.09.01.bb=
" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2016.09.01.bb</a> b/meta=
/recipes-bsp/u-boot/<a href=3D"http://u-boot_2016.11.bb" rel=3D"noreferrer"=
 target=3D"_blank">u-<wbr>boot_2016.11.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2016.09.01.bb"=
 rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2016.09.01.bb</a><br>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2016.11.bb" rel=
=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2016.11.bb</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.10.2<br>
<br>
</font></span></blockquote></div><br></div>

--94eb2c094b16a9255f0542eba7f2--
