Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id BDEDA78A54
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 12:57:07 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id m22so17829675iob.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 04:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BkR8AgNMniGEYCxdRzBVz2vy3NBSKPFz5/zWnr8TKwY=;
	b=ftbG8VHL4GJnYuiWg8pb5JJsSAV0sCZia5K2WuI/uneLcsdmQqUhNWTUPpjz8vsCPD
	PPdeW1046DAfZNOg+51v4qS2ueb2hJY8En+cfR+X7AAX6TD6Hhgf6n799WxZUG/CJa4N
	u8aikl2cqOxZajuStNGr0d6l+KdbosMfYmNAFGGuvidYjNPkdVUE5DVnvgqKTs7qm/Gm
	6D5dmdp45DH2G9agmcBzkmlAJUOsXuLalFEd+r9rnMESU+n8m4/+66LxlDzGvYDQqeFG
	NEK4BWJ9fMvm/Sx8urHt4+2BKMb1A02FzOPR3cJtbj6SWLHmjI+b+qgFvybP0YF9Aoia
	UFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BkR8AgNMniGEYCxdRzBVz2vy3NBSKPFz5/zWnr8TKwY=;
	b=JjdpquZewh5JwG9Z6P4QFdGocTc+MGaD0fm7A2+20wqqYP0fEaaXolP1kiTl9rAIfI
	jAuv5cbTfiWsibATT2XNMPbbCaIWuvbbbIVwkSgqjyLlFNlwQNNyyxFeIP84ZhJ5V43p
	ZaGqY5j/og8mvfyH+5dv0yxFHZhXfUg1lVcvEg+uojMMjqUAjwftoQXOeyJvymx/1woj
	trL+epkMuQ08WyzqGtEObKuGcfZNFYc8fu2xRAcKCsTROmcazT2s2ieXNF/8otn1rch2
	G8afoQKZf171Nek97YE3XAi9lFd/u1WWEf+G2co9MhUjcZn7+bMZAq5uaWVMqdbkJLRT
	qZmA==
X-Gm-Message-State: AElRT7FgtctoIJ++VMexu2RHOJrAtdAI0lvlRMZK5DwYDioDZC1iC/wD
	ssOpyHrIhsAqRue5GJy/Cl+L52LPp/K0Gd4cOJa54w==
X-Google-Smtp-Source: AG47ELvof1GEpJayuftkziLn6N0vfmjSlT6m/6SdK+wMFKiqnYbrssvz1gRSmh9661PHwTtPEcho1hsVM8tcSoXdVfs=
X-Received: by 10.107.183.76 with SMTP id h73mr17228027iof.201.1520254629041; 
	Mon, 05 Mar 2018 04:57:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.212.6 with HTTP; Mon, 5 Mar 2018 04:56:48 -0800 (PST)
In-Reply-To: <1520254360-16927-1-git-send-email-derek@asterius.io>
References: <1520254360-16927-1-git-send-email-derek@asterius.io>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Mar 2018 12:56:48 +0000
Message-ID: <CAJTo0LbwDJGp6zGz=OenK0rFnrKMogASi-EzuQ5BOgCsDakhsA@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-pycairo: update to 1.16.3
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
X-List-Received-Date: Mon, 05 Mar 2018 12:57:08 -0000
Content-Type: multipart/alternative; boundary="94eb2c0b9e3a21eca00566a9ddc4"

--94eb2c0b9e3a21eca00566a9ddc4
Content-Type: text/plain; charset="UTF-8"

Shouldn't the .h and .pc be in PN-dev?

On 5 March 2018 at 12:52, Derek Straka <derek@asterius.io> wrote:

> Update to the latest stable release
> Add the .pc file to the list of FILES
>
> Tested in qemux86-64 running core-image-minimal
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../{python3-pycairo_1.15.6.bb => python3-pycairo_1.16.3.bb}     | 9
> ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/python/{python3-pycairo_1.15.6.bb =>
> python3-pycairo_1.16.3.bb} (78%)
>
> diff --git a/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
> b/meta/recipes-devtools/python/python3-pycairo_1.16.3.bb
> similarity index 78%
> rename from meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
> rename to meta/recipes-devtools/python/python3-pycairo_1.16.3.bb
> index 5c3e1e6..b648852 100644
> --- a/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
> +++ b/meta/recipes-devtools/python/python3-pycairo_1.16.3.bb
> @@ -13,8 +13,8 @@ DEPENDS = "cairo"
>  SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${
> PV}/pycairo-${PV}.tar.gz"
>  UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
>
> -SRC_URI[md5sum] = "3ff210c34e7b052590e15fd0fb147766"
> -SRC_URI[sha256sum] = "ad150ea637860836b66705e0513b8e
> 59494538f0b80497ad3462051368755016"
> +SRC_URI[md5sum] = "d2a115037ccd128219f43d5ed3df7926"
> +SRC_URI[sha256sum] = "5bb321e5d4f8b3a51f56fc6a35c143
> f1b72ce0d748b43d8b623596e8215f01f7"
>
>  S = "${WORKDIR}/pycairo-${PV}"
>
> @@ -28,4 +28,7 @@ do_install_append() {
>      install -d ${D}${includedir}/pycairo/
>      install -m 0644 ${D}${datadir}/include/pycairo/py3cairo.h
> ${D}${includedir}/pycairo/
>  }
> -FILES_${PN} += "${datadir}/include/pycairo/py3cairo.h"
> +FILES_${PN} += " \
> +    ${datadir}/include/pycairo/py3cairo.h \
> +    ${datadir}/lib/pkgconfig/py3cairo.pc \
> +"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0b9e3a21eca00566a9ddc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Shouldn&#39;t the .h and .pc be in PN-dev?</div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 5 March 2018 at 12:52, D=
erek Straka <span dir=3D"ltr">&lt;<a href=3D"mailto:derek@asterius.io" targ=
et=3D"_blank">derek@asterius.io</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Update to the latest stable release<br>
Add the .pc file to the list of FILES<br>
<br>
Tested in qemux86-64 running core-image-minimal<br>
<br>
Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io">derek@=
asterius.io</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-pycairo_1.15.6.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-pycairo_1.15.6.bb</a> =3D&gt; <a href=3D"http://p=
ython3-pycairo_1.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyca=
iro_1.16.3.bb</a>}=C2=A0 =C2=A0 =C2=A0| 9 ++++++---<br>
=C2=A01 file changed, 6 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-pycair=
o_1.15.6.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>python3-pycairo_1.15=
.6.bb</a> =3D&gt; <a href=3D"http://python3-pycairo_1.16.3.bb" rel=3D"noref=
errer" target=3D"_blank">python3-pycairo_1.16.3.bb</a>} (78%)<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3-py=
cairo_1.15.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.15.=
6.<wbr>bb</a> b/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3=
-pycairo_1.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.=
16.3.<wbr>bb</a><br>
similarity index 78%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-pycairo_=
1.15.6.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>ython3-pycairo_1.15.6=
.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-pycairo_1.=
16.3.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>ython3-pycairo_1.16.3.b=
b</a><br>
index 5c3e1e6..b648852 100644<br>
--- a/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3-pycairo_1=
.15.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.15.6.<wbr>=
bb</a><br>
+++ b/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3-pycairo_1=
.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycairo_1.16.3.<wbr>=
bb</a><br>
@@ -13,8 +13,8 @@ DEPENDS =3D &quot;cairo&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/pygobject/pycairo/rel=
eases/download/v${PV}/pycairo-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/pygobject/<wbr>pycairo/releases/download/v${<wbr>P=
V}/pycairo-${PV}.tar.gz</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/pygobject/=
pycairo/releases/" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
pygobject/<wbr>pycairo/releases/</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>3ff210c34e7b052590e15fd0fb1477<wbr>66&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>ad150ea637860836b66705e0513b8e<wbr>59494=
538f0b80497ad346205136875<wbr>5016&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>d2a115037ccd128219f43d5ed3df79<wbr>26&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>5bb321e5d4f8b3a51f56fc6a35c143<wbr>f1b72=
ce0d748b43d8b623596e8215f<wbr>01f7&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/pycairo-${PV}&quot;<br>
<br>
@@ -28,4 +28,7 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${includedir}/pycairo/<br>
=C2=A0 =C2=A0 =C2=A0install -m 0644 ${D}${datadir}/include/<wbr>pycairo/py3=
cairo.h ${D}${includedir}/pycairo/<br>
=C2=A0}<br>
-FILES_${PN} +=3D &quot;${datadir}/include/pycairo/<wbr>py3cairo.h&quot;<br=
>
+FILES_${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${datadir}/include/pycairo/<wbr>py3cairo.h \<br>
+=C2=A0 =C2=A0 ${datadir}/lib/pkgconfig/<wbr>py3cairo.pc \<br>
+&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c0b9e3a21eca00566a9ddc4--
