Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8732979980
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 14:35:55 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id i17so2075315pfo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 07:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=IgnOZl+sqTGM5xOf0xIVV+dvcv+C6GTlBk/dBxGbez4=;
	b=oRLeuOLwN7Jw+DQ0Re3IcUz4Ste2jgCTxJQJ3Q+RaEJPE6HfoOs05WTzfp7dxE0BKi
	3IYsgcc2Fgef1H6/KdBzu2FOfF666DbO092X0rbZ9i9pGJ5qs1M/bSSalgzVDjD/U0YT
	lCqpY60EZxctW6HG+mcXHu12gb2nfYvRDXS3rq2SQUGtOLpxUDFwuncmKwh5QcCG1tnb
	KouEkIJDIJ2vNpue3tn1PYHynjSYnJeri0InNEGa4wy0pPsks5QSX3Cn7rSxl1TW6Doz
	K9cf7mXbodo91XreHu6mxndvBTbtc6N7915jgPRcLJHbo8MzBfOrHQrBn/L6ouByN01l
	biiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=IgnOZl+sqTGM5xOf0xIVV+dvcv+C6GTlBk/dBxGbez4=;
	b=lJXiiu0EjEeBkI/zbsMo/uLNO6sdfVxNwfIvkD1iOlcJu8Z9c3qFLa54NyLDKUWJ/9
	UjJ6qIXbnAncSUkH/Fco9khprM7E29kvYL6uZvBpjPNZlEMFkERcceyks9pge5fJ/o3h
	XM/V2FFfszkzOcRaW1cenQcbskz3gV93cX8qYdRol0PRPFfCLy9r4zdpWUVHQ4ANS9m7
	bVqm8Z/bmdE4dGORA25GY7oUPOxKvhPoFFcWSBu95hNnnn/OEGVhBqfhsXYcnZPMHg15
	KM+MQW7BBFBu8Xhg6nt3zd7bBntssAnumB3hmBzSifdYbqi/RwLRMptRd2NqX3XbtR+C
	hNuw==
X-Gm-Message-State: APjAAAWDJqbtTGD0ZHCc8EGhYIZ5rVsrfyenY2Eo9skRoGunKwwdSjDp
	lU/fxEuafGTWI9A5CbK65ecSetWv
X-Google-Smtp-Source: APXvYqxhfrIMIqFMkgS8edfeW0AqNKEPONfxu2Li9UyrBHfONU7imHVpkOgrVu3q5QZju+YAmwl3IQ==
X-Received: by 2002:a63:1061:: with SMTP id 33mr7628449pgq.226.1553092556066; 
	Wed, 20 Mar 2019 07:35:56 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:9d5b:fb53:b464:877c?
	([2601:202:4180:c33:9d5b:fb53:b464:877c])
	by smtp.gmail.com with ESMTPSA id
	i13sm2983501pgq.17.2019.03.20.07.35.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Mar 2019 07:35:55 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20190320140929.24410-1-bunk@stusta.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <6682ab95-b029-e881-43ee-59d3f7cfc174@gmail.com>
Date: Wed, 20 Mar 2019 07:35:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190320140929.24410-1-bunk@stusta.de>
Subject: Re: [PATCH] bind: Upgrade 9.11.5 -> 9.11.6
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
X-List-Received-Date: Wed, 20 Mar 2019 14:35:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 3/20/19 7:09 AM, Adrian Bunk wrote:
> Copyright hash changed to to year change.

=C2=A0You are missing one of the more important bits of info that would h=
elp
make the decision if this gets into M4 or waits until after 2.7 releases.=


Go look at the 9.11.5-p4 release notes.

Did you double check this is in line with DHCP?

- Armin
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  ...0001-configure.in-remove-useless-L-use_openssl-lib.patch | 4 ++--
>  ...nd-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
>  .../bind/{bind_9.11.5.bb =3D> bind_9.11.6.bb}                 | 6 +++-=
--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>  rename meta/recipes-connectivity/bind/{bind_9.11.5.bb =3D> bind_9.11.6=
=2Ebb} (96%)
>
> diff --git a/meta/recipes-connectivity/bind/bind/0001-configure.in-remo=
ve-useless-L-use_openssl-lib.patch b/meta/recipes-connectivity/bind/bind/=
0001-configure.in-remove-useless-L-use_openssl-lib.patch
> index 871bb2a5f6..92a84a206c 100644
> --- a/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-usel=
ess-L-use_openssl-lib.patch
> +++ b/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-usel=
ess-L-use_openssl-lib.patch
> @@ -16,8 +16,8 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> =20
>  diff --git a/configure.in b/configure.in
>  index 54efc55..76ac0eb 100644
> ---- a/configure.in
> -+++ b/configure.in
> +--- a/configure.ac
> ++++ b/configure.ac
>  @@ -1691,7 +1691,7 @@ If you don't want OpenSSL, use --without-openssl=
])
>   				fi
>   				;;
> diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-=
for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bin=
d/bind-ensure-searching-for-json-headers-searches-sysr.patch
> index 37e210e6da..f686862d3d 100644
> --- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-jso=
n-headers-searches-sysr.patch
> +++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-jso=
n-headers-searches-sysr.patch
> @@ -33,8 +33,8 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriv=
er.com>
> =20
>  Index: bind-9.11.3/configure.in
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- bind-9.11.3.orig/configure.in
> -+++ bind-9.11.3/configure.in
> +--- bind-9.11.3.orig/configure.ac
> ++++ bind-9.11.3/configure.ca
>  @@ -2574,7 +2574,7 @@ case "$use_libjson" in
>   		libjson_libs=3D""
>   		;;
> diff --git a/meta/recipes-connectivity/bind/bind_9.11.5.bb b/meta/recip=
es-connectivity/bind/bind_9.11.6.bb
> similarity index 96%
> rename from meta/recipes-connectivity/bind/bind_9.11.5.bb
> rename to meta/recipes-connectivity/bind/bind_9.11.6.bb
> index 67672792b1..36c3425cfe 100644
> --- a/meta/recipes-connectivity/bind/bind_9.11.5.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.11.6.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.isc.org/sw/bind/"
>  SECTION =3D "console/network"
> =20
>  LICENSE =3D "ISC & BSD"
> -LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D6ba7c9fe0c888a943c79c93e6=
de744fb"
> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D8f17f64e47e83b60cd920a1e4=
b54419e"
> =20
>  DEPENDS =3D "openssl libcap zlib"
> =20
> @@ -22,8 +22,8 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BP=
N}-${PV}.tar.gz \
>             file://0001-avoid-start-failure-with-bind-user.patch \
>  "
> =20
> -SRC_URI[md5sum] =3D "17a0d02102117c9a221e857cf2cc8157"
> -SRC_URI[sha256sum] =3D "a4cae11dad954bdd4eb592178f875bfec09fcc7e29fe0f=
6b7a4e5b5c6bc61322"
> +SRC_URI[md5sum] =3D "4882bd3eeef779e05b515b32354cc081"
> +SRC_URI[sha256sum] =3D "4499007f3a6b8bba84fc757053caeabf36466d6f7d278b=
accef9fd109beac6d4"
> =20
>  UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>9(\.\d+)+(-P\d+)*)/"



