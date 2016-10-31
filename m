Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id CC40160017
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 16:56:47 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 68so12504752wmz.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 09:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=eZNlf96rsd/dgnZ4YnAz4sz/dU67LWqF3vjJ7EsTg18=;
	b=wcxUM3jTNZKLwx6iWGO+edTMfbsDOUcas6OkSZZHnYlzFxItvbZa4MmX0Q6Frgsl3h
	ZY0KpTnWLTKfu50P772Hf57/kUtHAzVn2QM3O7tNenupeBQjoAsu5qj6pcSyD8R7bRkU
	k852oiy27RbEj6UfG8oD3i58bwGapJxQiVO7l6NmKeUxERGmznB6ADYylCpQE+05oMWk
	qBJGtKg4sF2/qzte/QMdmgGm1+AtRI8xkeGZGeOjsiuFYmJanRwxp/EFQ9uE/KxVaI9F
	xFqTkltMTWHq7TMGeEMGcvAiBthcn/hKrBH8pUByeMsWXhNf6qtMSkj2oZ9OPF0p2Rmq
	5eOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=eZNlf96rsd/dgnZ4YnAz4sz/dU67LWqF3vjJ7EsTg18=;
	b=YOU7c6T8nZhljCXxocouVymGIY5wSHqwGg1CG4y4ihJgNHgO1uuS+ZD3hCpQ8f+TV/
	YQAfZe8EwpsB0J27prtOfxHKD7qJRHwLDYtpHfXhMbTBQTudGYBdfZ7PsXSKJUQeHONR
	C7/mvVNRONLqYWOcrDnIQIOSPAV6NzgcphCHE+9XGO7baYWsthk7zoh/GzzqYU4XsjqD
	sap3xviFrvWJ4hOUiDGBVtHvMwfC9zURnUG5R1YSbl7wJdC+chb0HuWj6kkvG16GpLTi
	uawN577knXf2c2HsBs1rjjMLeurbrcGn3drrcoQwOf96yyidLw+g+8dfXfVLMK6WbfNo
	w1ZQ==
X-Gm-Message-State: ABUngvcKk7++DTTtIYNO2dnLgix08kTiuAZwNwAMRp/NjT2eciJ9yJxVt06fh1PnaHB44w==
X-Received: by 10.194.117.10 with SMTP id ka10mr29133721wjb.148.1477933008538; 
	Mon, 31 Oct 2016 09:56:48 -0700 (PDT)
Received: from localhost ([217.30.64.102]) by smtp.gmail.com with ESMTPSA id
	w203sm25538932wmw.16.2016.10.31.09.56.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 31 Oct 2016 09:56:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 31 Oct 2016 17:56:51 +0100
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20161031165651.GA3008@jama>
References: <cover.1477886344.git.paul.eggleton@linux.intel.com>
	<e1af68e680f3fbf20d7b0a8c55802a9cdd3f404b.1477886344.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <e1af68e680f3fbf20d7b0a8c55802a9cdd3f404b.1477886344.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] classes/license: fix handling of symlinks pointed to in LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 31 Oct 2016 16:56:48 -0000
X-Groupsio-MsgNum: 88813
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2016 at 04:59:43PM +1300, Paul Eggleton wrote:
> If you set LIC_FILES_CHKSUM to point to a relative symlink then you'll
> get "Could not copy license file" warnings in copy_license_files() since
> the symlink won't be valid after it's copied. If the source is a symlink
> then we need to dereference it first.
>=20
> I encountered this when I used recipetool on the sources for capnproto,
> where the c++ directory contains a LICENSE.txt symlink to the LICENSE
> file in the parent directory, and this symlink ends up being pointed to
> in LIC_FILES_CHKSUM.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Please cherry-pick this to morty as well.

> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/license.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index da4fc3e..660b85f 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -351,6 +351,8 @@ def copy_license_files(lic_files_paths, destdir):
>              dst =3D os.path.join(destdir, basename)
>              if os.path.exists(dst):
>                  os.remove(dst)
> +            if os.path.islink(src):
> +                src =3D os.path.realpath(src)
>              canlink =3D os.access(src, os.W_OK) and (os.stat(src).st_dev=
 =3D=3D os.stat(destdir).st_dev)
>              if canlink:
>                  try:
> --=20
> 2.5.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgXd9IACgkQN1Ujt2V2gBy0WQCePH0Immj3hSQO3kkUGD3yUQ5L
6PYAn1CpZbznPZzR8+CXs7td6McUNEt8
=4Ctr
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
