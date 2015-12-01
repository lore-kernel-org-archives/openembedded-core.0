Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 40D1965C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 02:52:09 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so205362711pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 18:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=jf9z6/AFo0y1VS9OsxvvgTbHo7Hj6tX4QiwpfvYz9v0=;
	b=Q1m+HuMIIrU87dghWA4gm4cQAnbJ9qRBjHRIzX2Y8B49M4a7TKfJAP07WU3qHYjXtc
	3JEfpnu4a88QxIH4YZ1FUZ6+/jA7MkVYMPUFDbLyp8ghUQS1+S+q487vMx8h4rMdKoBB
	vtDdgUnihRmqG0wfwlLUb4fkg+E4+DmuiUH28Cff70p8uIIZnxPh7vL8o7EF9CJnGeUI
	JBFrcWru6xlFmdB92ErQSxpRNwbavu1C5HMrXM3evp9rnCNCjUFtPrKVjX7K/l5e42hs
	tJUGxP89PckM6qARG9c3jsXJYZm+RggaC+ptIQ6dpwAbHVtJYZgBjReq5rYe/9UPAsyi
	QzhA==
X-Received: by 10.98.2.210 with SMTP id 201mr75597456pfc.129.1448938330411;
	Mon, 30 Nov 2015 18:52:10 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:c95:fe56:183d:e715?
	([2601:646:8802:5d5c:c95:fe56:183d:e715])
	by smtp.gmail.com with ESMTPSA id
	g8sm43816297pfd.40.2015.11.30.18.52.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Nov 2015 18:52:09 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1448570627-13405-1-git-send-email-marex@denx.de>
Date: Mon, 30 Nov 2015 18:52:03 -0800
Message-Id: <398951CA-615F-4908-BCDE-BB7018D220FC@gmail.com>
References: <1448570627-13405-1-git-send-email-marex@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.3112)
Cc: Ley Foon Tan <lftan@altera.com>, Walter Goossens <waltergoossens@home.nl>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ghostscript: Add NIOS2 support
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
X-List-Received-Date: Tue, 01 Dec 2015 02:52:13 -0000
X-Groupsio-MsgNum: 74154
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BE4EBF11-54C5-4BE0-A68D-A8DF2C9F2774";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BE4EBF11-54C5-4BE0-A68D-A8DF2C9F2774
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Nov 26, 2015, at 12:43 PM, Marek Vasut <marex@denx.de> wrote:
>=20
> Add objarch.h for NIOS2 architecture.

this is ok

>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Ley Foon Tan <lftan@altera.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Walter Goossens <waltergoossens@home.nl>
> ---
> .../ghostscript/ghostscript/nios2/objarch.h        | 40 =
++++++++++++++++++++++
> 1 file changed, 40 insertions(+)
> create mode 100644 =
meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
>=20
> diff --git =
a/meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h =
b/meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
> new file mode 100644
> index 0000000..3ec8101
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
> @@ -0,0 +1,40 @@
> +/* Parameters derived from machine and compiler architecture. */
> +/* This file is generated mechanically by genarch.c. */
> +
> +	 /* ---------------- Scalar alignments ---------------- */
> +
> +#define ARCH_ALIGN_SHORT_MOD 2
> +#define ARCH_ALIGN_INT_MOD 4
> +#define ARCH_ALIGN_LONG_MOD 4
> +#define ARCH_ALIGN_PTR_MOD 4
> +#define ARCH_ALIGN_FLOAT_MOD 4
> +#define ARCH_ALIGN_DOUBLE_MOD 4
> +
> +	 /* ---------------- Scalar sizes ---------------- */
> +
> +#define ARCH_LOG2_SIZEOF_CHAR 0
> +#define ARCH_LOG2_SIZEOF_SHORT 1
> +#define ARCH_LOG2_SIZEOF_INT 2
> +#define ARCH_LOG2_SIZEOF_LONG 2
> +#define ARCH_LOG2_SIZEOF_LONG_LONG 3
> +#define ARCH_SIZEOF_GX_COLOR_INDEX 8
> +#define ARCH_SIZEOF_PTR 4
> +#define ARCH_SIZEOF_FLOAT 4
> +#define ARCH_SIZEOF_DOUBLE 8
> +#define ARCH_FLOAT_MANTISSA_BITS 24
> +#define ARCH_DOUBLE_MANTISSA_BITS 53
> +
> +	 /* ---------------- Unsigned max values ---------------- */
> +
> +#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
> +#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
> +#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
> +#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
> +
> +	 /* ---------------- Miscellaneous ---------------- */
> +
> +#define ARCH_IS_BIG_ENDIAN 0
> +#define ARCH_PTRS_ARE_SIGNED 0
> +#define ARCH_FLOATS_ARE_IEEE 1
> +#define ARCH_ARITH_RSHIFT 2
> +#define ARCH_DIV_NEG_POS_TRUNCATES 1
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_BE4EBF11-54C5-4BE0-A68D-A8DF2C9F2774
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZdC1gACgkQuwUzVZGdMxRyJgCdFC2DUC7UZ8RrtPYNy2PlqHEw
W70An3Syvm60JFy+k1K3vQQp1pO+VT62
=oGTb
-----END PGP SIGNATURE-----

--Apple-Mail=_BE4EBF11-54C5-4BE0-A68D-A8DF2C9F2774--
