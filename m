Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 880C4753E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 16:38:51 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id z1-v6so3156502pgv.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 09:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=4YnbjCxMPB1pukym2LsoOV05DUbqbGa+V06LvL9uqi8=;
	b=nVpK5SZS65SPCK60S+ETkfz54MW7+aSITjMp01U+DvzA4dRUwxe3xyF6bvgkLXjlEk
	gfyQK47Rlx6kEpPAtaFkGsc3Ylrv5+WgyMBLOMsMNTfYfodBiqnCrOS3Req4dL/j94A9
	Yo6tRG36jmHgycuhNaYSoT5ZeZB65KcuwJlgzsbChaAI84ICoh1RXbGZ0MV1t8cVPY5a
	vFs6dUZ6H9V4EjORsx9Avk6G7LwQ0EWZ+N7JqCRa8sHBNOD8MvvBLLBT5ZbJ8HjKjX+Z
	6V7AS6qBuaMlWJ3HqBWco7MlRnPAKds08Z++Fu17FdBANHOI1JU/3nRF3Tby17UK/PQv
	rtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=4YnbjCxMPB1pukym2LsoOV05DUbqbGa+V06LvL9uqi8=;
	b=TSWX+Dzc3ZUfWpW7SJu/ZKe8Wlv1oicuv4uWZimZjib/pj56b8677mG/qAe0xAR7nX
	1auJGYIguV+T+GZx0BkVuJNPCVfL1KTslpoVdWwqg8Ul5PCyAIrnbevA6cG/3Rv7050J
	wlPi2ZAy/TMkP9LItzaaTptOwTk1mcdd7YG7ogDQIqvg+qdkR7HGCJeyQNaa2RitJR19
	8xCN5xe2GxPQ/zhJQc/M5QxtqL9oWE+CnkR9eoLSgRkCUfaI+rW3S0DLHOtoXI8gco/H
	GimH4lDY/pmbdCNqLrA1BS+GwEo8wjvM7P+DB9EroioZJeWogPPXQKp3y0urX3vAtelj
	lZlw==
X-Gm-Message-State: APt69E33lXMGuBpRs6ExBe6AgMY4m4q1GYYgzgTEmTjHusf8XFlb7GQI
	NmVMqxiY1shf3L/sdsxEKOoxPkYQ
X-Google-Smtp-Source: ADUXVKJKYlNJrEYD9eHOwCRoewjaxUlg2cZCVjm4iY3w+8MPFH+ZzAu/ENWDyJc7toHW42+C9mXUhw==
X-Received: by 2002:a62:d345:: with SMTP id
	q66-v6mr10225130pfg.158.1528994332272; 
	Thu, 14 Jun 2018 09:38:52 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:819b:b40b:792d:8193?
	([2601:646:877f:9499:819b:b40b:792d:8193])
	by smtp.gmail.com with ESMTPSA id
	m23-v6sm7344832pgc.37.2018.06.14.09.38.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jun 2018 09:38:51 -0700 (PDT)
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
References: <1528968947-430998-1-git-send-email-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <bcb49b46-b97e-399b-5a6c-c994b1628ad6@gmail.com>
Date: Thu, 14 Jun 2018 09:38:46 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1528968947-430998-1-git-send-email-mingli.yu@windriver.com>
Subject: Re: [PATCH] ltp: set -fomit-frame-pointer explicitly
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
X-List-Received-Date: Thu, 14 Jun 2018 16:38:51 -0000
X-Groupsio-MsgNum: 112565
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="ycTuFgbCdy9aOXoJelnZEvMPg3O49rhen"

--ycTuFgbCdy9aOXoJelnZEvMPg3O49rhen
Content-Type: multipart/mixed; boundary="mRqv5eMOBzF67nJ3hCbrxqCukGkjdS8rT";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
Message-ID: <bcb49b46-b97e-399b-5a6c-c994b1628ad6@gmail.com>
Subject: Re: [OE-core] [PATCH] ltp: set -fomit-frame-pointer explicitly
References: <1528968947-430998-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1528968947-430998-1-git-send-email-mingli.yu@windriver.com>

--mRqv5eMOBzF67nJ3hCbrxqCukGkjdS8rT
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/14/18 2:35 AM, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
>=20
> When build ltp with -fno-omit-frame-pointer,
> it will trigger below error:
> | cve-2015-3290.c: In function 'child_thread':
> | cve-2015-3290.c:416:1: error: bp cannot be used in asm here
>=20
> And there is also some comment as below in the source
> file ltp/20180515-r0/git/testcases/cve/cve-2015-3290.c
> * Build with -O2.  Don't use -fno-omit-frame-pointer.
>=20
> So explicitly set -fomit-frame-pointer for compiler
> to fix the above build error.
>=20
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta/recipes-extended/ltp/ltp_20180515.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-e=
xtended/ltp/ltp_20180515.bb
> index b07c1b9..5ec25ed 100644
> --- a/meta/recipes-extended/ltp/ltp_20180515.bb
> +++ b/meta/recipes-extended/ltp/ltp_20180515.bb
> @@ -19,6 +19,10 @@ LIC_FILES_CHKSUM =3D "\
>  DEPENDS =3D "attr libaio libcap acl openssl zip-native"
>  DEPENDS_append_libc-musl =3D " fts "
>  EXTRA_OEMAKE_append_libc-musl =3D " LIBC=3Dmusl "
> +
> +# -fomit-frame-pointer to handle cases where optimisation is set to -O=
0 or frame
> +# pointers have been enabled by -fno-omit-frame-pointer earlier in CFL=
AGS, etc.
> +CFLAGS_append =3D " ${@bb.utils.contains('SELECTED_OPTIMIZATION', '-fn=
o-omit-frame-pointer', '-fomit-frame-pointer', '', d)}"

may be just append it unconditionally, what do we lose ?
CFLAGS +=3D "-fomit-frame-pointer"

>  CFLAGS_append_powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
>  CFLAGS_append_mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
>  SRCREV =3D "96cbf48313afa65ef4d693d3441cbfd60a8d9b27"
>=20



--mRqv5eMOBzF67nJ3hCbrxqCukGkjdS8rT--

--ycTuFgbCdy9aOXoJelnZEvMPg3O49rhen
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWyKaFgAKCRC7BTNVkZ0z
FGAzAJ9vR0KbntdNiWU8WGwb0S3TycOlxgCfZIgiJ8PH0oTsH9L4MlTGalaEAgE=
=a9tv
-----END PGP SIGNATURE-----

--ycTuFgbCdy9aOXoJelnZEvMPg3O49rhen--
