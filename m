Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.6798.1589866920779081443
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 22:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=hYYDLQEC;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.135] (cpe-173-172-201-6.elp.res.rr.com [173.172.201.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5285020B717B;
	Mon, 18 May 2020 22:41:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5285020B717B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1589866919;
	bh=njiJJLkN9nnpijGz+EosAfbjnMg3rXiKML5oAiZ+hKY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=hYYDLQEC2+dQT9A8e/prNNH+reUlCQma71BNWypWbIc+pi6KmEpww/cfxmdCCRaRx
	 9LkRt6ofSoRvvENsN2fcFMmZWciRoHU51fvjqoeV4tFaxmy1s66uDTv2JR1+tXP4Pr
	 ZfSVRloyk9c6m6tTr78gxn+0xymdXY9TeqlLGU+A=
Subject: Re: [OE-core] [PATCH 3/3] linux-firmware: Update to 20200122 -> 20200421
To: Anibal Limon <anibal.limon@linaro.org>,
 openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, nicolas.dechesne@linaro.org
References: <20200519033505.357681-1-anibal.limon@linaro.org>
 <20200519033505.357681-3-anibal.limon@linaro.org>
From: "Alejandro Hernandez" <alhe@linux.microsoft.com>
Message-ID: <33ee3455-5007-2dce-6bfd-bd40e157f8da@linux.microsoft.com>
Date: Mon, 18 May 2020 22:41:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519033505.357681-3-anibal.limon@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------5E5BFC9829BC36CC7A113139"
Content-Language: en-US

--------------5E5BFC9829BC36CC7A113139
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hola Anibal,

On 5/18/20 8:35 PM, Anibal Limon wrote:
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>   ...inux-firmware_20200122.bb =3D> linux-firmware_20200421.bb} | 6 +++-=
--
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200122.bb =
=
=3D> linux-firmware_20200421.bb} (99%)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.=
bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb
> similarity index 99%
> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20200122.b=
b
> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb
> index ac7d6ec431..fa0507a88c 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb
> @@ -125,7 +125,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.Abilis;md5=3Db5=
ee3f410780e56711ad48eadc22b8bc \
>                       file://LICENCE.xc4000;md5=3D0ff51d2dc49fce04814c91=
55081092f0 \
>                       file://LICENCE.xc5000;md5=3D1e170c13175323c32c7f4d=
0998d53f66 \
>                       file://LICENCE.xc5000c;md5=3D12b02efa3049db65d524a=
eb418dd87ca \
> -                    file://WHENCE;md5=3Dc27d0c06cd5d376d8ab55860e65ba4e=
4 \
> +                    file://WHENCE;md5=3Dcb9a66eff0464b55335d3a7374fbc51=
c \
>                       "
>  =20
>   # These are not common licenses, set NO_GENERIC_LICENSE for them
> @@ -196,8 +196,8 @@ PE =3D "1"
>  =20
>   SRC_URI =3D "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.ta=
r.xz"
>  =20
> -SRC_URI[md5sum] =3D "ac291b21f366ae2a37193ec8f14c39d2"
> -SRC_URI[sha256sum] =3D "a30e811b3736a72b874ac27e10662f5e5409b1cadf8aab7=
ba88e8f8bc8083986"

You can now drop the md5sum

Alejandro

> +SRC_URI[md5sum] =3D "229a93395f4033da68429f165a62b952"
> +SRC_URI[sha256sum] =3D "6dd7cba25d694c031f65529b9027cc8faaffaddfae70a4e=
3b58c2e4a0af3bfa8"
>  =20
>   inherit allarch
>  =20
>
>=20

--------------5E5BFC9829BC36CC7A113139
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <p>Hola Anibal,<br>
    </p>
    <div class=3D"moz-cite-prefix">On 5/18/20 8:35 PM, Anibal Limon wrote:=
<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20200519033505.357681-3-anibal.limon@linaro.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">Signed-off-by: An=C3=ADbal Li=
m=C3=B3n <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:anibal.limon@lin=
aro.org">&lt;anibal.limon@linaro.org&gt;</a>
---
 ...inux-firmware_20200122.bb =3D&gt; linux-firmware_20200421.bb} | 6 +++-=
--
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200122.bb =3D=
&gt; linux-firmware_20200421.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb=
 b/meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb
index ac7d6ec431..fa0507a88c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200122.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200421.bb
@@ -125,7 +125,7 @@ LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E=
" href=3D"file://LICENCE.Abilis;md5=3Db5ee3f410780e56711ad48eadc22b8bc\file=
://LICENCE.xc4000;md5=3D0ff51d2dc49fce04814c9155081092f0\file://LICENCE.xc5=
000;md5=3D1e170c13175323c32c7f4d0998d53f66\file://LICENCE.xc5000c;md5=3D12b=
02efa3049db65d524aeb418dd87ca\-file://WHENCE;md5=3Dc27d0c06cd5d376d8ab55860=
e65ba4e4\+file://WHENCE;md5=3Dcb9a66eff0464b55335d3a7374fbc51c\">"file://LI=
CENCE.Abilis;md5=3Db5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=3D0ff51d2dc49fce04814c91550=
81092f0 \
                     file://LICENCE.xc5000;md5=3D1e170c13175323c32c7f4d099=
8d53f66 \
                     file://LICENCE.xc5000c;md5=3D12b02efa3049db65d524aeb4=
18dd87ca \
-                    file://WHENCE;md5=3Dc27d0c06cd5d376d8ab55860e65ba4e4 =
\
+                    file://WHENCE;md5=3Dcb9a66eff0464b55335d3a7374fbc51c =
\
                     "</a>
=20
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -196,8 +196,8 @@ PE =3D "1"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.x=
z"
=20
-SRC_URI[md5sum] =3D "ac291b21f366ae2a37193ec8f14c39d2"
-SRC_URI[sha256sum] =3D "a30e811b3736a72b874ac27e10662f5e5409b1cadf8aab7ba=
88e8f8bc8083986"</pre>
    </blockquote>
    <p>You can now drop the md5sum</p>
    <p>Alejandro<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20200519033505.357681-3-anibal.limon@linaro.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
+SRC_URI[md5sum] =3D "229a93395f4033da68429f165a62b952"
+SRC_URI[sha256sum] =3D "6dd7cba25d694c031f65529b9027cc8faaffaddfae70a4e3b=
58c2e4a0af3bfa8"
=20
 inherit allarch
=20
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
  </body>
</html>

--------------5E5BFC9829BC36CC7A113139--
