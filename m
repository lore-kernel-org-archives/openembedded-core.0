Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF896FFED
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 15:56:58 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h75so2230616pfh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Aug 2017 08:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=Zc12GFHj8513y+aBGDVmKfj5NpqWfDH+0jBWoWpL9cM=;
	b=eTZdBn0iRYV0zHSUCHoT0cuAQfAH4yP/WgEqAF5XzA6ZnH/04jvSORjZGomN6heGks
	Er9p7172FOf1R1IuES41JCucGV/o1Fx0rJExM/iEakSHw+2QPaqaj3c9SgeffXWZuT5W
	lzzpomqkxotbGgaBgEMxNGW0GYV+Quw4S+xbzOX06cyHdEU3mDzoobTIsdS3om3DVS+j
	pbU4WYHzls+uxGe/wshRSKI99i6d5jjCX3QQ22IyTwChzHPkiU6KK+8fvr6SBvfjVhXE
	jAVqcJFBSkC062ia8RjVftoOXRaQ2/5+UA6ZBUcOOWDAzwf0IPoc0sf9rk9U74nFTIEL
	0btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=Zc12GFHj8513y+aBGDVmKfj5NpqWfDH+0jBWoWpL9cM=;
	b=gRsmsjxi1Va8i+dSEs4NpzNsPO32sKTVl6RVNdvwMp5fcZ4PJfnMkUCxrOMpLhaQ+t
	53L65BKZQlm8ZlZ9hZFOMIG423bP50zU6ShKmHLuQeGO/1dgEmCwQxGKs27uhoMu/3BD
	Bh0Byl+9DVBROCIHJCTx5nBgM8ZM8bVdjvWfDRlSe6nhLes5JJVsjgG3JnBJRJaUpAHH
	XwMfDqvYPNkOzwKtzHHg4TIGLzM0NzFN6urTZOOCAa1OYJz6yKMiyyKP1tgOAPWPDvZq
	pC6C7SJSpK0Za3D+LAQos8bfb1H+X4xLzTEitHacAD2n69FaJiFN+ILDx8FvuvdaV9VJ
	XaTA==
X-Gm-Message-State: AIVw1108qYdoyPvxXiXwBGliXdDXGofowJAaPiRsmGsPVpKmbd0Isz2c
	2epzmeOASEBtWkE3FDU=
X-Received: by 10.98.16.154 with SMTP id 26mr2946697pfq.58.1501862220208;
	Fri, 04 Aug 2017 08:57:00 -0700 (PDT)
Received: from Khems-MacBook-Pro.local
	([2601:646:8882:b8c:3d12:bcdd:cd39:49d7])
	by smtp.gmail.com with ESMTPSA id q88sm3841301pfk.8.2017.08.04.08.56.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 08:56:58 -0700 (PDT)
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <1501837889-5749-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <001063ea-2cae-a89f-91cd-072624ab06c1@gmail.com>
Date: Fri, 4 Aug 2017 08:56:52 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:55.0)
	Gecko/20100101 Thunderbird/55.0
MIME-Version: 1.0
In-Reply-To: <1501837889-5749-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Subject: Re: [PATCH v3] openssl: cryptodev enable method modified
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
X-List-Received-Date: Fri, 04 Aug 2017 15:56:59 -0000
X-Groupsio-MsgNum: 101068
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="cSUu6SU0owa8EbG7LsKdpBxWNv4pX6ICE"

--cSUu6SU0owa8EbG7LsKdpBxWNv4pX6ICE
Content-Type: multipart/mixed; boundary="tC68qvUKvdWhv7ElE4CeHqgCxCQCGLq35";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <001063ea-2cae-a89f-91cd-072624ab06c1@gmail.com>
Subject: Re: [OE-core] [PATCH v3] openssl: cryptodev enable method modified
References: <1501837889-5749-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
In-Reply-To: <1501837889-5749-1-git-send-email-huangqy.fnst@cn.fujitsu.com>

--tC68qvUKvdWhv7ElE4CeHqgCxCQCGLq35
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 8/4/17 2:11 AM, Huang Qiyu wrote:
> Use PACKAGECONFIG to enable cryptodev.
>=20
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.0.2l.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb b/meta=
/recipes-connectivity/openssl/openssl_1.0.2l.bb
> index 7c8f18b..0535c85 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
> @@ -2,6 +2,7 @@ require openssl.inc
> =20
>  # For target side versions of openssl enable support for OCF Linux dri=
ver
>  # if they are available.
> +PACKAGECONFIG ?=3D "cryptodev-linux"
>  PACKAGECONFIG[cryptodev-linux] =3D "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_D=
IGESTS,,cryptodev-linux"

There is another packageconfig for perl support in openssh.inc file.
perhaps this should be moved next to that

>  CFLAG +=3D "${PACKAGECONFIG_CONFARGS}"
> =20
>=20


--tC68qvUKvdWhv7ElE4CeHqgCxCQCGLq35--

--cSUu6SU0owa8EbG7LsKdpBxWNv4pX6ICE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlmEmUkACgkQuwUzVZGdMxTemACePgDdqkPt/FzMR2WEEIYzr59h
bTwAnR/iRfh2kF4J8bXNheX6DhS1bjBS
=p4Kd
-----END PGP SIGNATURE-----

--cSUu6SU0owa8EbG7LsKdpBxWNv4pX6ICE--
