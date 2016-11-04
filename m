Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id BE03671C19
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 18:22:32 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n85so8605351pfi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2016 11:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=ytWMc3tpS7COXNM+YIAQXjcvOKAbjaRH7R63x5UA5cA=;
	b=p/f9chTa2UqaW1InQOyyNSRPWgoVIBt/X8u7dahCD3bCEriD5DOEX/napXBGpqvsMd
	DiatTkboyYjD1+ZOTEFiRVAffVxP9QykGLdKyZ28Y3gQ1TLOn5VFZgFx6iiDpsK6pulj
	zSvN70ERK4KJbw1YVvfN0jLn8N1fdUstJHdnHBPoCJU8vZ2lfI4fXrCCDQGdSc8KqVO8
	WSgub2uOxi9zwqT4hR1SjrDyJ/H1o4egbxm86s18j+cOmCU3XYoLFo/IQESTOzDlvan6
	ug84zqNDq0OCKTniy6teLP/cQ8ZEczZRGF2gEsrJ1T4l+qxB8rmkrZip4c+UF7uyOy8V
	SxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=ytWMc3tpS7COXNM+YIAQXjcvOKAbjaRH7R63x5UA5cA=;
	b=Sb0nqy5VfsvFaf8N5uQK7m+RJo8F46w8go5vIze642p1yI4uN0ilA2fYL+ycE1+2q5
	PeFoDnlJNK9rJPk1xbZ0rYmVHNXpCF2sW9RyFoeWPvm+7925msL1uBs2VZ9mSqeLjZA0
	MPRaR7IzDNPqa+F5+hWlb+y7C5iJQkgCBH0RW/7vR1CW8mVaqgJwQCI3FpdMjApWnC/8
	9eySttwmLpgXNBVPHFUwxUhuXEEkOPsZ4ETRLNkc4b8CQw0qGskDZ1Byy5SLsp3OGuV/
	xXkiPQt44fglAGabHpl5m//muvjNM7DUZdZ158DSZ+3n40h2hDwzMln1VbaPTje/4o+C
	Hu9g==
X-Gm-Message-State: ABUngveRSYXydXOdmk5coKvLMn7mBWsKt5EOJ5d1CjkbiG4NQLdkkScMmEVwJdKp1m5ZoQ==
X-Received: by 10.99.181.86 with SMTP id u22mr24221751pgo.24.1478283753550;
	Fri, 04 Nov 2016 11:22:33 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:49a8:f49a:4fb7:80ce])
	by smtp.gmail.com with ESMTPSA id
	k67sm21984271pfk.69.2016.11.04.11.22.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Nov 2016 11:22:33 -0700 (PDT)
To: Li Zhou <li.zhou@windriver.com>, openembedded-core@lists.openembedded.org
References: <20161104090719.30795-1-li.zhou@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <b3c8d5de-1d26-b37b-e28c-f8cca01c9ba3@gmail.com>
Date: Fri, 4 Nov 2016 11:22:31 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161104090719.30795-1-li.zhou@windriver.com>
Subject: Re: [PATCH] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Fri, 04 Nov 2016 18:22:32 -0000
X-Groupsio-MsgNum: 89036
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="j9pSSxKCiFVXUsJmtt7TjTWl220Dr98wH"

--j9pSSxKCiFVXUsJmtt7TjTWl220Dr98wH
Content-Type: multipart/mixed; boundary="5hoq3CSxfVvldgAJI1usFLsimaKSjGRnt";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Li Zhou <li.zhou@windriver.com>, openembedded-core@lists.openembedded.org
Message-ID: <b3c8d5de-1d26-b37b-e28c-f8cca01c9ba3@gmail.com>
Subject: Re: [OE-core] [PATCH] db: disable the ARM assembler mutex code
References: <20161104090719.30795-1-li.zhou@windriver.com>
In-Reply-To: <20161104090719.30795-1-li.zhou@windriver.com>

--5hoq3CSxfVvldgAJI1usFLsimaKSjGRnt
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 11/4/16 2:07 AM, Li Zhou wrote:
> The swpb in macro MUTEX_SET will cause "undefined instruction" error
> on the new arm arches which don't support this assembly instruction
> any more. If use ldrex/strex to replace swpb, the old arm arches don't
> support them. So to avoid this issue, just disable the ARM assembler
> mutex code, and use the default pthreads mutex.
>=20
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  meta/recipes-support/db/db_6.0.30.bb | 9 ---------
>  1 file changed, 9 deletions(-)
>=20
> diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-suppor=
t/db/db_6.0.30.bb
> index 50a469b..2d08b5e 100644
> --- a/meta/recipes-support/db/db_6.0.30.bb
> +++ b/meta/recipes-support/db/db_6.0.30.bb
> @@ -74,15 +74,6 @@ DB6_CONFIG ?=3D "--enable-o_direct --disable-cryptog=
raphy --disable-queue --disabl
> =20
>  EXTRA_OECONF =3D "${DB6_CONFIG} --enable-shared --enable-cxx --with-sy=
sroot"
> =20
> -# Override the MUTEX setting here, the POSIX library is
> -# the default - "POSIX/pthreads/library".
> -# Don't ignore the nice SWP instruction on the ARM:
> -# These enable the ARM assembler mutex code
> -ARM_MUTEX =3D "--with-mutex=3DARM/gcc-assembly"
> -MUTEX =3D ""
> -MUTEX_arm =3D "${ARM_MUTEX}"
> -MUTEX_armeb =3D "${ARM_MUTEX}"
> -EXTRA_OECONF +=3D "${MUTEX}"

it would be good to keep this for older < armv5 arches

>  EXTRA_OEMAKE_class-target =3D "LIBTOOL=3D${STAGING_BINDIR_CROSS}/${HOS=
T_SYS}-libtool"
> =20
>  # Cancel the site stuff - it's set for db3 and destroys the
>=20


--5hoq3CSxfVvldgAJI1usFLsimaKSjGRnt--

--j9pSSxKCiFVXUsJmtt7TjTWl220Dr98wH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgc0ecACgkQuwUzVZGdMxSi7ACfdjirnchewiETBpcXdS4T+BOc
OmoAn06aypRhlD/G1M/TJwuCOuEXOQ8B
=GSK7
-----END PGP SIGNATURE-----

--j9pSSxKCiFVXUsJmtt7TjTWl220Dr98wH--
