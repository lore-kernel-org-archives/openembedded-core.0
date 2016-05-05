Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3825D731CA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 15:46:24 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id a17so34668452wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2016 08:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3W1sFMuDNyM38PqMPjxyjUoDyJetE/cRzne3nv4Du3o=;
	b=0KwmAfPAgub3RbGlBnLPLtQzaIAnEdM7F78dzQcjIwl7uxL3o2UuczCHsKEr7CVFom
	ay2mqoiapwYm+qdsVvh8fGxUwi87J6gDcoIjjMMHIPop6sPgXlRFpa81brERkVXxPL47
	ETN4Emrhql0bEIipFr/efzfGD+wCGVXxZTtqtqnrUo6TJSMyB+sdCDpgh0Y2BZh/G2QS
	UbKoHE/HlSJUOUf/vgU70j1wmUakSQN7Nwkd5E3BAjJKdwZHgTJ2Ub0+k1xiULv16c4o
	BfEGnEATcVCMbOHXy14EzCzYZix5kkumFbPLXVQ9G5/himwiQeZTsz3qc0MoO+FE1z8f
	DpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3W1sFMuDNyM38PqMPjxyjUoDyJetE/cRzne3nv4Du3o=;
	b=G/kvFd/Kge/2VVPCNM4bk5DNKvkVCZqOF5RbYS+H/Nt4szQYaIphomDtn1191EoGvq
	Dgwk/UY9RTfpvbIpO7+Q9nlunf0/fElvJ/mGTeUBZOx/oKti7CgELF/eb2NggHQUowdP
	r5JTr/DvKxdYoFunfFSea1stBgWBIanJS/cd/mT4ThRIQ6nk90Ks/Z8gqzNR6P6DtRTA
	oDJjV+DePkmFXNLEq93YXse4DNyOCjeJAyvEHdVqMoEfAjpDWNkPFzQ6KLgeo3oTfBT8
	tm0UUyBvumSCYEnwhPMRvS68z7B35t2vxBSmDFvMmj9zYPie6E2FeMI4vNcotZNJI+vW
	cxfQ==
X-Gm-Message-State: AOPr4FW6oAIQ2U52DAoNOKQRPztj5RXnSccoIkvW8wGPqSa2hVD4VzGroZ5FU0ZNK1J/Ug==
X-Received: by 10.28.154.73 with SMTP id c70mr4399803wme.12.1462463185383;
	Thu, 05 May 2016 08:46:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ip10sm10351567wjb.33.2016.05.05.08.46.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 May 2016 08:46:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 May 2016 17:47:48 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160505154748.GA23370@jama>
References: <1461084427.31320.25.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1461084427.31320.25.camel@linuxfoundation.org>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Ensure rootfs dependencies cover DEBUGFS
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
X-List-Received-Date: Thu, 05 May 2016 15:46:26 -0000
X-Groupsio-MsgNum: 81634
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2016 at 05:47:07PM +0100, Richard Purdie wrote:
> If you configure a bz2 debugfs, pbzip2-native currently isn't built.
> This patch makes sure the dependencies are added.

BTW: I've tried to enable IMAGE_GEN_DEBUGFS for first time as described in =
manual:
  Build sysroot paths are now removed from debug symbol files. Removing the=
se paths means that remote GDB using an unstripped build system sysroot wil=
l no longer work (although this was never documented to work). The supporte=
d method to accomplish something similar is to set IMAGE_GEN_DEBUGFS to "1"=
, which will generate a companion debug image containing unstripped binarie=
s and associated debug sources alongside the image.

and it fails with ugly exception, because IMAGE_FSTYPES_DEBUGFS isn't set b=
y default.

It should either be mentioned in the manual or there should be some sane de=
fault for it.

meta/conf/local.conf.sample.extended shows example how to set it next to IM=
AGE_GEN_DEBUGFS,
people reading this sample may notice it, but the comment also says:
  If IMAGE_FSTYPES_DEBUGFS is not defined, it defaults to IMAGE_FSTYPES.
which isn't true for some reason in my setup, looking at the code I don't s=
ee where it is supposed
to default to IMAGE_FSTYPES

    if d.getVar('IMAGE_GEN_DEBUGFS', True) =3D=3D "1":
        debugfs_fstypes =3D d.getVar('IMAGE_FSTYPES_DEBUGFS', True).split()
        for t in debugfs_fstypes:
            alltypes.append("debugfs_" + t)

Maybe the author meant that IMAGE_FSTYPES variable is set to IMAGE_FSTYPES_=
DEBUGFS
only when IMAGE_FSTYPES_DEBUGFS is set, but that still leaves that split()
causing parse failure.

    debugfs_image_fstypes =3D d.getVar('IMAGE_FSTYPES_DEBUGFS', True)
    if debugfs_image_fstypes:
        d.setVar('IMAGE_FSTYPES', debugfs_image_fstypes)

ERROR: /OE/build/wpb/webos-ports/meta-webos-ports/meta-luneos/recipes-core/=
images/luneos-image.bb: Error executing a python function in <code>:

The stack trace of python calls that resulted in this exception/failure was:
File: '<code>', lineno: 14, function: <module>
     0010:__anon_38__OE_build_wpb_webos_ports_openembedded_core_meta_classe=
s_rootfs_ipk_bbclass(d)
     0011:__anon_113__OE_build_wpb_webos_ports_openembedded_core_meta_class=
es_image_bbclass(d)
     0012:__anon_176__OE_build_wpb_webos_ports_openembedded_core_meta_class=
es_image_bbclass(d)
     0013:__anon_146__OE_build_wpb_webos_ports_openembedded_core_meta_class=
es_siteinfo_bbclass(d)
 *** 0014:__anon_439__OE_build_wpb_webos_ports_openembedded_core_meta_class=
es_image_bbclass(d)
File: '/OE/build/wpb/webos-ports/openembedded-core/meta/classes/image.bbcla=
ss', lineno: 322, function: __anon_439__OE_build_wpb_webos_ports_openembedd=
ed_core_meta_classes_image_bbclass
     0318:    typedeps =3D {}
     0319:
     0320:    if d.getVar('IMAGE_GEN_DEBUGFS', True) =3D=3D "1":
     0321:        debugfs_fstypes =3D d.getVar('IMAGE_FSTYPES_DEBUGFS', Tru=
e).split()
 *** 0322:        for t in debugfs_fstypes:=20
     0323:            alltypes.append("debugfs_" + t)
     0324:
     0325:    def _add_type(t):
     0326:        baset =3D _image_base_type(t)
Exception: AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Failed to parse recipe: /OE/build/wpb/webos-ports/meta-webos-ports/m=
eta-luneos/recipes-core/images/luneos-image.bb

Summary: There were 3 ERROR messages shown, returning a non-zero exit code.


>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
> index e2467bd..122e080 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -17,7 +17,9 @@ def imagetypes_getdepends(d):
> =20
>      deps =3D []
>      ctypes =3D d.getVar('COMPRESSIONTYPES', True).split()
> -    for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
> +    fstypes =3D set((d.getVar('IMAGE_FSTYPES', True) or "").split())
> +    fstypes |=3D set((d.getVar('IMAGE_FSTYPES_DEBUGFS', True) or "").spl=
it())
> +    for type in fstypes:
>          if type in ["vmdk", "vdi", "qcow2", "hdddirect", "live", "iso", =
"hddimg"]:
>              type =3D "ext4"
>          basetype =3D type
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcrau0ACgkQN1Ujt2V2gByDewCfRyCYxCJETG1RWpZr4XyzAnxB
3D0An0WhbXevHMNOdEyCu+tdRlpjUY4J
=wDIf
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
