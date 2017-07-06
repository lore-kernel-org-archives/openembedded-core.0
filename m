Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 07EB471985
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 07:23:35 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id z6so2006372pfk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 00:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=OMzHPLee/xa6PLP0lZx4H1wYO3MgY9UvzQvWvPouBsk=;
	b=C5Ca99J7WN8jON8StBUFAL8wyLYZ/6lIVPlkwNYWh66wOhg2yc63aDszX1hCjiW2vL
	/siRww/ZACgj5KhUUmb0YTZdo2pFckMH8EuPdb6ZSwez0uwPJU1NHCkoUJkTO0g4mnqa
	CTnvrHXK9fAP9p04fjhpUoPiifx2ZVfRK9zM7tQW0qKRNh7gv2cFB1Fy+80OojPZ412L
	fj1TSksPqMAAaQmJhyXIAigsJzzKOfnc+mnqs+GOO0J/aFiD3lLIchJkWlPfVFna4D+J
	/JQ6+zuxPIX2e6ndbcumxYEPYwZNGuKDjMgnUrViSua6n4NlspeKNvtm9BjZiUk12ZXp
	g8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=OMzHPLee/xa6PLP0lZx4H1wYO3MgY9UvzQvWvPouBsk=;
	b=VmAdNrTod5vs+awa2TSWyW0qaif7GOW3H5JsGA/0uaPEJzAhSJX792JugYiVI0nGmJ
	wOQXGZZlS+v1oqHI0RIFLOhrS4LX7n47b5VCkvla16U9ECLtAVtl6Vp1MiK3Gkcg0erw
	0J5H3jJBhc8DecDP3vEZV7APog/++8Pq6XxNmyWdmUJpi07yopj25eyghumfV8qA/Nrj
	As1OoAFYjNxV9Oa6S01GPGORURUwESrH15KuzQA0qkyyS7aloakdSrqHzKq97fV3sDvP
	A60HS8NvIE4R/OZCg6PhtCa3NeIlTwhL91Pskjt+jCnM+CDi9ZAPU6u4RyJ6sNlKxmmJ
	hwug==
X-Gm-Message-State: AIVw113Gojen/EuIe58WFTHVgJzIb9bTaJowCabkhAzVDASkPLu/f3z/
	DdIx5NvcdzEYC3W4wbc=
X-Received: by 10.98.87.195 with SMTP id i64mr18196752pfj.175.1499325816842;
	Thu, 06 Jul 2017 00:23:36 -0700 (PDT)
Received: from Khems-MacBook-Pro.local
	([2601:646:8882:b8c:18ea:9bca:fd8c:c77c])
	by smtp.gmail.com with ESMTPSA id
	q7sm2282666pfk.108.2017.07.06.00.23.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 00:23:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: swee.aun.khor@intel.com, openembedded-core@lists.openembedded.org
References: <cover.1499127835.git.swee.aun.khor@intel.com>
	<497112f6f6f805ab4dbc8ca48fbb53163f311f60.1499127835.git.swee.aun.khor@intel.com>
Organization: HIMVIS LLC
Message-ID: <20517da0-d00c-a85b-7bdb-a1fd16fb9659@gmail.com>
Date: Thu, 6 Jul 2017 00:23:32 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:54.0)
	Gecko/20100101 Thunderbird/54.0
MIME-Version: 1.0
In-Reply-To: <497112f6f6f805ab4dbc8ca48fbb53163f311f60.1499127835.git.swee.aun.khor@intel.com>
Subject: Re: [PATCH 5/7] openssl: Support musl-x32 build
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
X-List-Received-Date: Thu, 06 Jul 2017 07:23:36 -0000
X-Groupsio-MsgNum: 99752
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="vKiTrR6JHS0tfiTVWBvWLP6SJKNov6bjo"

--vKiTrR6JHS0tfiTVWBvWLP6SJKNov6bjo
Content-Type: multipart/mixed; boundary="sbpwgQgQmib9x4lvmjKAHAh9drr0IOfdq";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: swee.aun.khor@intel.com, openembedded-core@lists.openembedded.org
Message-ID: <20517da0-d00c-a85b-7bdb-a1fd16fb9659@gmail.com>
Subject: Re: [OE-core] [PATCH 5/7] openssl: Support musl-x32 build
References: <cover.1499127835.git.swee.aun.khor@intel.com>
 <497112f6f6f805ab4dbc8ca48fbb53163f311f60.1499127835.git.swee.aun.khor@intel.com>
In-Reply-To: <497112f6f6f805ab4dbc8ca48fbb53163f311f60.1499127835.git.swee.aun.khor@intel.com>

--sbpwgQgQmib9x4lvmjKAHAh9drr0IOfdq
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/5/17 4:56 PM, swee.aun.khor@intel.com wrote:
> From: sweeaun <swee.aun.khor@intel.com>
>=20
> Support musl-x32 build which to build openssl with 32 bits.
>=20
> Signed-off-by: sweeaun <swee.aun.khor@intel.com>
> ---
>  meta/recipes-connectivity/openssl/openssl.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recip=
es-connectivity/openssl/openssl.inc
> index 3980ec2..bcbbe06 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -65,8 +65,7 @@ do_configure () {
>  	os=3D${HOST_OS}
>  	case $os in
>  	linux-gnueabi |\
> -	linux-gnuspe |\
> -	linux-musl*)

removing this will break other musl arches.

> +	linux-gnuspe)
>  		os=3Dlinux
>  		;;
>  		*)
> @@ -101,6 +100,9 @@ do_configure () {
>  	linux-gnux32-x86_64)
>  		target=3Dlinux-x32
>  		;;
> +        linux-muslx32-x86_64)
> +                target=3Dlinux-x32
> +                ;;

you can move it above the generic check above

>  	linux-gnu64-x86_64)
>  		target=3Dlinux-x86_64
>  		;;
>=20



--sbpwgQgQmib9x4lvmjKAHAh9drr0IOfdq--

--vKiTrR6JHS0tfiTVWBvWLP6SJKNov6bjo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlld5XQACgkQuwUzVZGdMxTVuwCeIXJcY+stpFky3XyQcgiRUsUb
sKwAnjAVB6DXS6EAlW+Al2iw879Lm5CO
=aSmC
-----END PGP SIGNATURE-----

--vKiTrR6JHS0tfiTVWBvWLP6SJKNov6bjo--
