Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C36DB754F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 16:40:54 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y5-v6so3513754pfn.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 09:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=HRP1WzUbkkVxacBYHsrgtfJgGRb08Wys8Ua2IsJpac4=;
	b=q62nxvzwOfVqJXMm0GpCi3HT9s8fwLOnLiB7H8Zp9phjAPeLG9SCGgHGJjQsVJn2yN
	krQZ1T0vpOf02WR1Usr/BeWWzTN1vI5bpwOzY8x6vIdFvzdHdntr05VJKhLhYzs4eKPR
	meqBWL6pe4F08xu7u7CU9cecppcTSZb6VzGwlmFIAzMG4LOvY3ZYPaqQZPb6UVFTJ7YN
	YNElfqHoEFoa4sFEgp9y53QH89AsxTOI24zhG0CedQccG+8iD5W15xGOvSE5sX++x13F
	9zzubWgt3OCpEpE3x99QkkVqR/dvP3mgkblqDY/gJ9h2/2HB8AX+CUQCISkUkJ/mdZPd
	bqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=HRP1WzUbkkVxacBYHsrgtfJgGRb08Wys8Ua2IsJpac4=;
	b=RzoF3M8Ndk3yI40TTnEVQij1AzEXS0X8S2Co5G1mg/j7+0BQ2Hxp4UBgI/5ofViqnj
	2JEoZ9aDzHqE8XfkS1MYvEPTNX9O1GDJJGyfqoCWS58cF7QHTJ+NXEUQR2DKIeNZK1Ox
	dyERnV2CN1dnosDbAOhNEJZZfwg3rhix5buzPenFsWzEfTjtB1KDTIcTZ76fplzT8FQR
	kiXifk/KMs9eEnFs7Fi4zoi5OEra/FnnbKejWNOaewoOpYAtbOmfadgcurkFMFcmkajy
	cbQ6qJvzMhrHGe/uOImPexQZsCBjERmrvh8KIvNKtVXYq2RCHit/BcroZQcGXpQ6asxU
	yHyg==
X-Gm-Message-State: APt69E3NjQH5L9F0gnQA388YBUF5y0LaqPUm1rjFirBNPqoh1ZgkvMcp
	D34jqFyV2z+om2ElJqiHlsFl31Ti
X-Google-Smtp-Source: ADUXVKI26nfYmSH7/BB+St2OL5KQpUC7Vpyh1iv0OdDFK8HHjxnh/osx8SFn2UoWI3UkCc3+JtWx7Q==
X-Received: by 2002:a65:6504:: with SMTP id
	x4-v6mr2967065pgv.131.1528994455456; 
	Thu, 14 Jun 2018 09:40:55 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:819b:b40b:792d:8193?
	([2601:646:877f:9499:819b:b40b:792d:8193])
	by smtp.gmail.com with ESMTPSA id
	m7-v6sm7590894pgr.5.2018.06.14.09.40.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jun 2018 09:40:54 -0700 (PDT)
To: Herve Jourdain <herve.jourdain@neuf.fr>,
	'Ovidiu Panait' <ovidiu.panait@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1528977321-8121-1-git-send-email-ovidiu.panait@windriver.com>
	<002e01d403d8$b811f1b0$2835d510$@neuf.fr>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <20da1542-9903-d4fc-b38f-8f0ad3b2d4a1@gmail.com>
Date: Thu, 14 Jun 2018 09:40:48 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <002e01d403d8$b811f1b0$2835d510$@neuf.fr>
Subject: Re: [PATCH 1/1] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Thu, 14 Jun 2018 16:40:54 -0000
X-Groupsio-MsgNum: 112566
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="D5LFlGi0taILUyjZHPfCylXA4hmaxtHS0"

--D5LFlGi0taILUyjZHPfCylXA4hmaxtHS0
Content-Type: multipart/mixed; boundary="fMN3Y3P8GeMDBLyooRYrjy08WkXQFy9FY";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Herve Jourdain <herve.jourdain@neuf.fr>,
 'Ovidiu Panait' <ovidiu.panait@windriver.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <20da1542-9903-d4fc-b38f-8f0ad3b2d4a1@gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] db: disable the ARM assembler mutex code
References: <1528977321-8121-1-git-send-email-ovidiu.panait@windriver.com>
 <002e01d403d8$b811f1b0$2835d510$@neuf.fr>
In-Reply-To: <002e01d403d8$b811f1b0$2835d510$@neuf.fr>

--fMN3Y3P8GeMDBLyooRYrjy08WkXQFy9FY
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/14/18 5:10 AM, Herve Jourdain wrote:
> Hi,
>=20
> I believe I solved that same problem by just adding, in the case of arm=
v8
> (which I believe may be the new architecture you're referring to):
> MUTEX_armv8 =3D ""
> This way, it allows previous versions to work just like they did before=
,
> without having to disable ARM assembler mutex code for architectures th=
at
> support it correctly - up to armv7ve I believe.
> Of course, we might need to also have a good definition for armv8, whic=
h is
> the object of another thread.

right thats a better approach.

>=20
> Cheers,
> Herve
>=20
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Ovidiu Panait
> Sent: jeudi 14 juin 2018 13:55
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/1] db: disable the ARM assembler mutex code=

>=20
> The swpb in macro MUTEX_SET will cause "undefined instruction" error on=
 the
> new arm arches which don't support this assembly instruction any more. =
If
> use ldrex/strex to replace swpb, the old arm arches don't support them.=
 So
> to avoid this issue, just disable the ARM assembler mutex code, and use=
 the
> default pthreads mutex.
>=20
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  meta/recipes-support/db/db_5.3.28.bb | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>=20
> diff --git a/meta/recipes-support/db/db_5.3.28.bb
> b/meta/recipes-support/db/db_5.3.28.bb
> index 093ee44909..15b4155a29 100644
> --- a/meta/recipes-support/db/db_5.3.28.bb
> +++ b/meta/recipes-support/db/db_5.3.28.bb
> @@ -59,18 +59,7 @@ FILES_SOLIBSDEV =3D "${libdir}/libdb.so
> ${libdir}/libdb_cxx.so"
>  # All the --disable-* options replace --enable-smallbuild, which break=
s a
> bunch of stuff (eg. postfix)  DB5_CONFIG ?=3D "--enable-o_direct
> --disable-cryptography --disable-queue --disable-replication
> --disable-verify --disable-compat185 --disable-sql"
> =20
> -EXTRA_OECONF =3D "${DB5_CONFIG} --enable-shared --enable-cxx --with-sy=
sroot"
> -
> -# Override the MUTEX setting here, the POSIX library is -# the default=
 -
> "POSIX/pthreads/library".
> -# Don't ignore the nice SWP instruction on the ARM:
> -# These enable the ARM assembler mutex code, this won't -# work with t=
humb
> compilation...
> -ARM_MUTEX =3D "--with-mutex=3DARM/gcc-assembly"
> -MUTEX =3D ""
> -MUTEX_arm =3D "${ARM_MUTEX}"
> -MUTEX_armeb =3D "${ARM_MUTEX}"
> -EXTRA_OECONF +=3D "${MUTEX} STRIP=3Dtrue"
> +EXTRA_OECONF =3D "${DB5_CONFIG} --enable-shared --enable-cxx --with-sy=
sroot
> STRIP=3Dtrue"
>  EXTRA_OEMAKE +=3D "LIBTOOL=3D'./${HOST_SYS}-libtool'"
> =20
>  EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader  -I ${S}/dist/aclocal
> -I${S}/dist/aclocal_java"
> --
> 2.17.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20



--fMN3Y3P8GeMDBLyooRYrjy08WkXQFy9FY--

--D5LFlGi0taILUyjZHPfCylXA4hmaxtHS0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWyKakAAKCRC7BTNVkZ0z
FL7TAJ9zaowIcr8gw1a5Oq7g/+y6FqjXxwCePKEwRWZwZQugOfFvIWIFL8ALJN0=
=0dnn
-----END PGP SIGNATURE-----

--D5LFlGi0taILUyjZHPfCylXA4hmaxtHS0--
