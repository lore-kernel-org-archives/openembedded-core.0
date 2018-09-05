Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 98EED78C9C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 10:38:19 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id j26-v6so7127829wre.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 03:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kBzSJDTPRxV3+GjyvTUi8w/Dl9K2UroDLXEsAMYDxcE=;
	b=TqIBEdPmaLQq8sOR1mfMl90lhbO1G5S+9kv0jgsI+9F/Txte9eJsf0UPGxyBFKnTZ4
	DPlIp36KGjEzT0xdeConu8Yr1xY/2Vs3pI3NSOLBQsFJ03LWycRJEtFf3nmSLEqqgm1w
	2lNR8KICQbwbtzrBIEamyF/uTEUzbX55CvDbkubhjujMFIPMsj1q2cCeqFBVm2+ovkMI
	+dUPmk8OXcNrB6M5KgDoNQV1lh0ra4cJLbLUakjaBD4FujVZEVbrngt1cLWK+1natM3k
	v5GJywgrdCBHt+EgQHXP40ruwp5OGvqOsxJ57/d61UOJaifj/qhM66gZegk49yugDJuj
	Q4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kBzSJDTPRxV3+GjyvTUi8w/Dl9K2UroDLXEsAMYDxcE=;
	b=P3FLvk2B1pXRLvW01xjtDkv9ujeQuZUlvYK1GOZ/l97aKcMociXYmLufW+ceZ7GA3O
	vIjAYq/aK5cISrt5GFNr3k/btTtsnUmBV38bjpxN/25n1T3cEg2UwucIRLt+6ROGzZEA
	oZrsIWldPVdu17NHR5l1H2dlk4fZNqNV/uKVO1TDbgN1cDtsTGqKsH59nCMPzM5fp/qn
	TGvVZjYwJA0uDPr4DaqRfsKHrMgzprNi29UhMrTDjssiJCnTxv18PyWMHjZUaNAXxd2g
	jpyRhRZegS9vdHcol4mUeSt0ApxAgF7MdYg5/pejUTN3+kf3l8e7knUzTM0ECWR4hwuA
	WkRg==
X-Gm-Message-State: APzg51AUPM78KPC/fVUWqePVdf3p6JEqF0EG2H+jS+UtgwmCbs41R15b
	g5FZg/WlJyd9IwjG3ezkwfA=
X-Google-Smtp-Source: ANB0VdZ1/DYoBYBoxq7f2HLcJSfbW3Y7Vlev8Z/a0tDLlcbTF62+nQxKViT9YMCVlEIVrggor8pH6w==
X-Received: by 2002:adf:f8ca:: with SMTP id
	f10-v6mr27205511wrq.237.1536143900353; 
	Wed, 05 Sep 2018 03:38:20 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g129-v6sm2467087wmf.42.2018.09.05.03.38.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Sep 2018 03:38:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Sep 2018 12:38:22 +0200
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20180905103822.GE1795@jama>
References: <cover.1536130313.git.liezhi.yang@windriver.com>
	<568c7b051fd166a653c943d618027f7b59e436b5.1536130313.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <568c7b051fd166a653c943d618027f7b59e436b5.1536130313.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2 V2] oe/utils.py: Add vartrue()
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
X-List-Received-Date: Wed, 05 Sep 2018 10:38:19 -0000
X-Groupsio-MsgNum: 115839
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7CZp05NP8/gJM8Cl"
Content-Disposition: inline

--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 05, 2018 at 03:16:17PM +0800, Robert Yang wrote:
> It can be used to simplify code like:
> "${@['iffalse', 'iftrue'][var]}"
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  meta/lib/oe/utils.py   | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index faef771..dbadeb3 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -610,7 +610,7 @@ DEBUG_FLAGS ?=3D "-g -feliminate-unused-debug-types $=
{DEBUG_PREFIX_MAP}"
>  # Disabled until the option works properly -feliminate-dwarf2-dups
>  FULL_OPTIMIZATION =3D "-O2 -pipe ${DEBUG_FLAGS}"
>  DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
> -SELECTED_OPTIMIZATION =3D "${@d.getVar(['FULL_OPTIMIZATION', 'DEBUG_OPTI=
MIZATION'][d.getVar('DEBUG_BUILD') =3D=3D '1'])}"
> +SELECTED_OPTIMIZATION =3D "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', '=
DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
>  SELECTED_OPTIMIZATION[vardeps] +=3D "FULL_OPTIMIZATION DEBUG_OPTIMIZATIO=
N"
>  BUILD_OPTIMIZATION =3D "-O2 -pipe"
> =20
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index f22a6ab..914a6f2 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -464,3 +464,10 @@ class ImageQAFailed(bb.build.FuncFailed):
>              msg =3D msg + ' (%s)' % self.description
> =20
>          return msg
> +
> +def vartrue(var, iftrue, iffalse, d):
> +    import oe.types
> +    if oe.types.boolean(d.getVar(var)):
> +        return iftrue
> +    else:
> +        return iffalse

Shouldn't we update bitbake to track var usage like in oe.utils.conditional:
http://git.openembedded.org/bitbake/commit/?id=3D5156b4bb6876dac636be9726df=
22c8ee792714dd
before this gets used more widely?

> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7CZp05NP8/gJM8Cl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW4+yHgAKCRA3VSO3ZXaA
HJsOAKCSulnhz8AHCqPUrurKumTu7Y9WnQCfYDTGa0VWk74r/NT7xSVwmCrUNn4=
=tLWL
-----END PGP SIGNATURE-----

--7CZp05NP8/gJM8Cl--
