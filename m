Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 40FF171A34
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2016 18:36:45 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id os4so4302100pac.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2016 11:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=6Y60V2uYwGLlh9zjwoMQPPQRZFEhVS4u5q6jf0Grz1Y=;
	b=LqszgSO2lOVXDEWRj4rZjRSFEO+1t9sFJPKx/BCO9afFzNbMkJnkwYcmP8ViMmEjLm
	gK+m7R4nBpVgEnACz0mmwkW2CabFmEM67s6IM6J402cN+KwnXbpfX+yPCi1fG7t2lwZV
	++xsud8Z8Tol6QfAXCSlHp4F9eXlGdEzJPW8eQ84cn/P3wyMrKR8FYje5QOYl3TUgiyT
	dmpbcAFg6uNq7ArcAC+90VGXi5xAFAbuUUvjWkcvcwCjaVDuNGbbfI9LBM/5L4KEH8MU
	V7K50jc3V/wF0Y21fjFLx9GjjWZp5GEX8zWku8+IfLArVND/7zGpSVVL6+zuVbwJGKy6
	S/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=6Y60V2uYwGLlh9zjwoMQPPQRZFEhVS4u5q6jf0Grz1Y=;
	b=jPLFw+S8d8+lX85mMHI/728aLABYIDiQ5qdEGqZi6AblHXNxZdUq9vLlrHQPwzxYjt
	L/InFD7VevLFA/CQ2K8i4SPemFGVxUqfv1vvYavYWO88Pbd0Z4u+Ld34e167ji0Yv/H8
	gd6KdAODfaMWhW5hRGXpo8xlZR5SL388Sn3ogLiEVpmE7uNibDBlaMHNhRi6NtlQQSsl
	53O49Yq5NTEe2mVef71TIZMErwpeFU/ncOXG2xlfGMGjLYXqB/dY2z9MqDjnSzXrbYFA
	4rjLGRQEezEfxc+sLAgE7MoJ7kpKVudCNKGyQ1d2TP960GATKRHonRnh7gaIzkoW0ORm
	poUQ==
X-Gm-Message-State: AA6/9RmkniyaNSOWxvta+LZ74I0gEtTit98efsl/tKVt8rtZlc0CXpA+2TDJfV7ysdS69Q==
X-Received: by 10.66.221.132 with SMTP id qe4mr3823084pac.133.1476643007478;
	Sun, 16 Oct 2016 11:36:47 -0700 (PDT)
Received: from ?IPv6:2600:1010:b026:70df:d54d:70d9:9262:3840?
	([2600:1010:b026:70df:d54d:70d9:9262:3840])
	by smtp.gmail.com with ESMTPSA id
	yz6sm21913631pab.47.2016.10.16.11.36.46
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 16 Oct 2016 11:36:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1476276902-56841-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Date: Sun, 16 Oct 2016 11:36:45 -0700
Message-Id: <773482C7-1989-4EF4-A0BC-3548093C605D@gmail.com>
References: <1476276902-56841-1-git-send-email-Zubair.Kakakhel@imgtec.com>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libgpg-error: Make case generic for MIPS
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
X-List-Received-Date: Sun, 16 Oct 2016 18:36:46 -0000
X-Groupsio-MsgNum: 88214
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0CB5D018-D4A8-495A-8EED-414FD4DBB8A8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0CB5D018-D4A8-495A-8EED-414FD4DBB8A8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 12, 2016, at 5:55 AM, Zubair Lutfullah Kakakhel =
<Zubair.Kakakhel@imgtec.com> wrote:
>=20
> The tuples for MIPS r6 onwards are
> - mipsisa32r6el
> - mipsisa32r6
> - mipsisa64r6el
> - mipsisa64r6
>=20
> The default case passes it forward which isn't handled well and
> causes a build error. Rework the case statement to make it generic.
>=20
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> ---
> meta/recipes-support/libgpg-error/libgpg-error_1.24.bb | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.24.bb =
b/meta/recipes-support/libgpg-error/libgpg-error_1.24.bb
> index e45a7b8..84a882a 100644
> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.24.bb
> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.24.bb
> @@ -33,8 +33,8 @@ do_compile_prepend() {
> 	  arm)	      TUPLE=3Darm-unknown-linux-gnueabi ;;
> 	  armeb)      TUPLE=3Darm-unknown-linux-gnueabi ;;
> 	  i586|i686)  TUPLE=3Di686-pc-linux-gnu ;;
> -	  mips64el)   TUPLE=3Dmipsel-unknown-linux-gnu ;;
> -	  mips64)     TUPLE=3Dmips-unknown-linux-gnu ;;
> +	  mips*el)    TUPLE=3Dmipsel-unknown-linux-gnu ;;
> +	  mips*)      TUPLE=3Dmips-unknown-linux-gnu ;;

Is this enough or do we also need to fix TUPLE value to account
for this new triplet for another mips ABI ?

> 	  x86_64)     TUPLE=3Dx86_64-pc-linux-gnu ;;
> 	  *)          TUPLE=3D${TARGET_ARCH}-unknown-linux-gnu ;;
> 	esac
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_0CB5D018-D4A8-495A-8EED-414FD4DBB8A8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgDyL0ACgkQuwUzVZGdMxSqiwCgiFOhl4xkcPvSC8ocEQsRPQSR
QQ0An3P5g5TsPmI4IA75PjbTOq0MyF44
=wP0y
-----END PGP SIGNATURE-----

--Apple-Mail=_0CB5D018-D4A8-495A-8EED-414FD4DBB8A8--
