Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4911570C47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 11:02:24 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id c11so1797471lbj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 04:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/CrconrKXHonqd4actpWhYq90a7Suh+kfvvznEzahqI=;
	b=j2H2WgUNMqY/JU6xxLtgfpuFWQh1gZiAxxnhfkpsxotpoH16wXuPeX+CCfVUgXhTtn
	hOh47QcjSc75SX9RwZpQA+WWwTRmr1oW9y/CbzEl9Hth3MJ8UDwK0l6GvbYCahE4LdLW
	Af76QyByiUrvvbpmQmi5A/NeDUz5/pJ1XDrXrj0AgeFn3xvDNjy4xceilGq/BLw/ijSK
	liOc5HH24s11B4C+6baHqxGfOYyjSHtxZS1ghazuE5E7SCoavqUDpt1q1HOi5NKBfxTr
	ZE85iKbxhfzpt+mDC3juxnGkoLWTbJnYKha3h9hpXZeCWjAeSZCapvntEJA9nt/xISE1
	cJDQ==
X-Received: by 10.112.62.132 with SMTP id y4mr1922995lbr.105.1408100545037;
	Fri, 15 Aug 2014 04:02:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x10sm4806180lal.13.2014.08.15.04.02.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Aug 2014 04:02:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 15 Aug 2014 13:03:02 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20140815110302.GF22747@jama>
References: <1407969402-9952-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1407969402-9952-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [RFC][PATCH] cmake: drop -fpermissive
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
X-List-Received-Date: Fri, 15 Aug 2014 11:02:25 -0000
X-Groupsio-MsgNum: 56586
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vKFfOv5t3oGVpiF+"
Content-Disposition: inline

--vKFfOv5t3oGVpiF+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2014 at 12:36:42AM +0200, Martin Jansa wrote:
> * it was dropped from default CXXFLAGS in:
>   commit 24dd8e129447013ee98609f3892ec414b1b21340
>   Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>   Date:   Sun Mar 2 17:38:33 2014 +0000
>=20
>     bitbake.conf: Drop -fpermissive
>=20
>     Drop the -fpermissive C++ compiler flag. We've had this around for ye=
ars, most
>     code should have been fixed long ago. Its possible some recipes may f=
ail
>     however we can (and should) just use the flag where needed.
>=20
> * I haven't build world with this yet, but maybe it's time to
>   drop it here as well at least for consistency

I've noticed that this RFC is already included in master-next.

Good news is, that it didn't cause any new build issues in my world
builds, so I'm fine with it loosing the RFC status.

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/cmake.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index ab2adec..c51b1cf 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -16,7 +16,7 @@ OECMAKE_CXX_COMPILER ?=3D "`echo ${CXX} | sed 's/^\([^ =
]*\).*/\1/'`"
> =20
>  # Compiler flags
>  OECMAKE_C_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
> -OECMAKE_CXX_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS}=
 -fpermissive"
> +OECMAKE_CXX_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS}"
>  OECMAKE_C_FLAGS_RELEASE ?=3D "${SELECTED_OPTIMIZATION} ${CFLAGS} -DNDEBU=
G"
>  OECMAKE_CXX_FLAGS_RELEASE ?=3D "${SELECTED_OPTIMIZATION} ${CXXFLAGS} -DN=
DEBUG"
>  OECMAKE_C_LINK_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLA=
GS} ${LDFLAGS}"
> --=20
> 2.0.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vKFfOv5t3oGVpiF+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPt6OYACgkQN1Ujt2V2gBz13gCeLIpG9Em1P7BMIGGHo+NhJr+8
S3oAoI8vn0jHw+LzZ+bFKOuW9j5gHz/E
=5sXn
-----END PGP SIGNATURE-----

--vKFfOv5t3oGVpiF+--
