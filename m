Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id BB5AE6E688
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 10:07:26 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e3so13289575wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 03:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/pn+zLoA9MIrLb16TDP6IuRk6ORc68wvSLfmVoTOLuE=;
	b=bTR0PvCig2cLqU+C6RCF6N8Rf/5yZenO10sBrPXfpr0ZYiKUEX43DSXBn4TDP9m9Q/
	PVKJc9z0ywEgFwtnAaRRfCER8nn32acg9/GPsuAoN/gKu2d97efpSJaLbcP5Dcurel1p
	ldrbZ+6Jk11KzWBtPnYDhLMO0wn8bBKLF7pSZNVdk9KQcUmYmp5KIIz3mRHfHf0o/5w3
	OIg8UX6X+wepwx/Ts77pTjxIOVMVFeLUoYfAMgPb2seBYzBW7Ekc7zJtyI10UvNjbQSD
	UMg1nlu197YoMdOrQp5WdtykSrXmU2pAo2qjIKijVt7k4caV+yAQQMjF77TtljGId24y
	w2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/pn+zLoA9MIrLb16TDP6IuRk6ORc68wvSLfmVoTOLuE=;
	b=kUZNqeX4CkWw2a5Idk/YVoL4p3SwRTGB4xiZqgBkUQpIdzrkxpjQ3iSjiOmgFYh/so
	f2jw4JIMQL8K18wIOM0v2u0e2XDR2GrE/KOQNJzCsbqHzonpqlTGNjhgmUOmYl53YC0a
	ynjzmy6w7IEy8+B46984kqIGIfzQqng81+VCkplYyycbvJwQAXD9LilmpuLo9O2iz6Nq
	pNHiBaAjiYEwB4vh8lSV+d+jfGMIazSLj4SiMUDpgaC8MRlU8yJ+b40L/lEycGzfE2Lq
	wMY2FvvE2fet0qc1KGqC1op89gsNJXRClwtivTYXNZUlAccnEikeOmIk7xsx61rkK3of
	5ZhA==
X-Gm-Message-State: ALyK8tJsOeyF0OBSgcyfg5oPy2dtONJhpZNiLJBX1PNJMwvyfU2RnDt8fbCcko5fY7wCJQ==
X-Received: by 10.28.26.145 with SMTP id a139mr4818904wma.55.1464343646402;
	Fri, 27 May 2016 03:07:26 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id d7sm7853322wmd.11.2016.05.27.03.07.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 May 2016 03:07:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 May 2016 12:07:52 +0200
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Message-ID: <20160527100752.GA2570@jama>
References: <1464330370-6856-1-git-send-email-markus.lehtonen@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1464330370-6856-1-git-send-email-markus.lehtonen@linux.intel.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] license.bbclass: do not process LICENSE_pn variables
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
X-List-Received-Date: Fri, 27 May 2016 10:07:27 -0000
X-Groupsio-MsgNum: 82781
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2016 at 09:26:10AM +0300, Markus Lehtonen wrote:
> The loop iterating over LICENSE_pn variables has never worked. In
> addition, the LICENSE variable is supposed to contain all licenses
> defined in LICENSE_pn variables.

Is this really true?

I've seen couple examples where LICENSE variable is used as a "default"
for most packages, and then only 1 package sets different LICENSE_pn.

Changing the semantics as you said would force people to define
LICENSE_pn-dev
LICENSE_pn-staticdev
LICENSE_pn
LICENSE_pn-dbg
to foo when they have just one file in
LICENSE_pn-blah
which containd unwanted LICENSE bar

And then overall license will be "foo & bar"

There are real-world examples where there is one GPLv3 shell script we
don't even need in LGPLv2 component - for now it was simple to move this
script to separate package and set just LICENSE_pn-blah-script

> Thus, it is simpler just to use LICENSE
> as the data we get is essentially the same.
>=20
> [YOCTO #9499]
>=20
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  meta/classes/license.bbclass | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
>=20
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 69335d6..eacf9e8 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -376,20 +376,6 @@ def find_license_files(d):
>      import shutil
>      import oe.license
> =20
> -    pn =3D d.getVar('PN', True)
> -    for package in d.getVar('PACKAGES', True):
> -        if d.getVar('LICENSE_' + package, True):
> -            license_types =3D license_types + ' & ' + \
> -                            d.getVar('LICENSE_' + package, True)
> -
> -    #If we get here with no license types, then that means we have a rec=
ipe=20
> -    #level license. If so, we grab only those.
> -    try:
> -        license_types
> -    except NameError:       =20
> -        # All the license types at the recipe level
> -        license_types =3D d.getVar('LICENSE', True)
> -=20
>      # All the license files for the package
>      lic_files =3D d.getVar('LIC_FILES_CHKSUM', True)
>      pn =3D d.getVar('PN', True)
> @@ -487,7 +473,7 @@ def find_license_files(d):
> =20
>      v =3D FindVisitor()
>      try:
> -        v.visit_string(license_types)
> +        v.visit_string(d.getVar('LICENSE', True))
>      except oe.license.InvalidLicense as exc:
>          bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
>      except SyntaxError:
> --=20
> 2.6.6
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldIHF0ACgkQN1Ujt2V2gBwhfACfe+u2ggUmMAbOUELxd9CKIPU+
mnsAn2I93CNn7XjyHf7TOp1ll37ZpGoH
=9oeL
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
