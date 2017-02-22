Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E7FE0730B5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 11:59:02 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u63so55572wmu.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 03:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=mStR1RIoU4Ra3vrhhFnTVkDx+GFoJSFN8bbbp8CFw+E=;
	b=pUTFHZN35B2pcVGagwzD0XCC3up/IWdD90NDfnWS1F1PeMmzoxnQ6Iy8lvyCJdyu62
	BlU5iavlTEvl/XGgzixZ/W1zIn2K+csBdFzNDpR59CVY6snwUcbwc7q4Pvz/JyCzLGel
	e7QIBdUhRX9hHXY3vsIhQYOgfHr+7o2DeHVjvVtWAl8wJCwTB8E79S1um9/zrSUBDJpa
	aI/ahIAaz54oTZSg/nETJ2Mw+We2liSRF6rxty1H+ToOtPMQ0bAEwHkenA6in/nflSl9
	FCwZrE+ImbEJ3qlIHonOMexYNFWq0ZmMwdHWPDqJCd7cy0kng3037V+vRbvawwQ01Pcj
	hIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mStR1RIoU4Ra3vrhhFnTVkDx+GFoJSFN8bbbp8CFw+E=;
	b=fmovgl7aCJiRiYGm1DxX/dK9qo+AxtVfSWkjPITpGpOy4E16I4O019hB8dIvRGnzda
	rLjzpoIghezJ+hd1FUgAZDkN8rx/m7Sx3O90T4hyKrd6/SU8r2fqnt9y+ZV1qnTHSSbX
	lo3+oQ0E6IGKp5CDTVxdSqxCDArUA3gjdvoZYLPza0E72M0MfXq2Kk/OzLxJ6BS44SYQ
	YoeGJsl6ypC7N8g+uHCgQaw0MJHf8YVHOVw77tgxbjAVNjnAKDqBPJfTCGLGYiv2a19Q
	AX2lG3Qn9KLZ27dJyTzcRMogxG66MPvqoTbkmxOjJPtyqxH3rFmqOEUh8zm5ER65bEFW
	Uktg==
X-Gm-Message-State: AMke39kfsu+BjxYjhndbWcdzg0wl4aq6RiQXFL6iABM1xLNOptxYX/fJu4GgpR0dekhviA==
X-Received: by 10.28.182.6 with SMTP id g6mr2075360wmf.11.1487764743892;
	Wed, 22 Feb 2017 03:59:03 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x69sm2279184wma.15.2017.02.22.03.59.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Feb 2017 03:59:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Feb 2017 12:59:03 +0100
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20170222115903.GA3283@jama>
References: <CA+chaQegXmqfE=3TmnYXvLdCW00QpinkXk=L27OQS5-1DnJYAQ@mail.gmail.com>
	<1487761949-13456-1-git-send-email-ed.bartosh@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1487761949-13456-1-git-send-email-ed.bartosh@linux.intel.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types_wic: fix expansion error
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
X-List-Received-Date: Wed, 22 Feb 2017 11:59:03 -0000
X-Groupsio-MsgNum: 93804
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2017 at 01:12:29PM +0200, Ed Bartosh wrote:
> Variable WKS_SEARCH_PATH was not fully expanded when used directly
> in this expression:
>     WKS_FULL_PATH =3D "${@wks_search('${WKS_FILES}'.split(), '${WKS_SEARC=
H_PATH}') or ''}"
> This caused expansion error: bb.data_smart.ExpansionError: Failure expand=
ing variable WKS_FULL_PATH,
> .... which triggered exception SyntaxError: invalid syntax (WKS_FULL_PATH=
, line 1)
>=20
> Using d.getVar('WKS_SEARCH_PATH') instead of directly referencing
> WKS_SEARCH_PATH variable should fix the issue.

Allows me to parse oe-core again, thanks!

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/classes/image_types_wic.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_ty=
pes_wic.bbclass
> index 43b2917..c6e92fb 100644
> --- a/meta/classes/image_types_wic.bbclass
> +++ b/meta/classes/image_types_wic.bbclass
> @@ -8,7 +8,7 @@ WICVARS ?=3D "\
>  WKS_FILE ??=3D "${IMAGE_BASENAME}.${MACHINE}.wks"
>  WKS_FILES ?=3D "${WKS_FILE} ${IMAGE_BASENAME}.wks"
>  WKS_SEARCH_PATH ?=3D "${THISDIR}:${@':'.join('%s/wic' % p for p in '${BB=
PATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l i=
n '${BBPATH}:${COREBASE}'.split(':'))}"
> -WKS_FULL_PATH =3D "${@wks_search('${WKS_FILES}'.split(), '${WKS_SEARCH_P=
ATH}') or ''}"
> +WKS_FULL_PATH =3D "${@wks_search('${WKS_FILES}'.split(), d.getVar('WKS_S=
EARCH_PATH')) or ''}"
> =20
>  def wks_search(files, search_path):
>      for f in files:
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWK19BgAKCRA3VSO3ZXaA
HDCHAJ9uPcxKOeeaDSzTnsIWyq50WrjQIACdG5laQD8tlmvW2OL5bFUCFNcpZVs=
=gnIC
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
