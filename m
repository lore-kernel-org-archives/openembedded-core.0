Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id C2C22605FF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 21:03:32 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id n63so18679488qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 14:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qAj3kZcaGz67goRKuQvsLWSqG+04y4fhjvVdUPsUrCc=;
	b=aOCMGdYFxzdEeWj898WBkMwgAWb+bN2nmMXcCrTNP0Wuo3jIHks9cunHcrKGujITYl
	uk3LL1mAuwaKE3r7c5nCla21OLo6odWS/VqespZvjlpTSINzYcYfMNE1tiHoD5XXF0gf
	mzj4GOMkMPWRa5C+fqHkl9ArZPgWuoGwCkfWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qAj3kZcaGz67goRKuQvsLWSqG+04y4fhjvVdUPsUrCc=;
	b=k7Sou6/uEL+LUTlVNL0apwPEAQnncvGHRcGr/DYDD3ket8HL+Ehw5G8/FAq11OSwkQ
	7vxAX1RNxn7yTZSvjozFDIekb9UVfzmONeTwC9OOYLveCfFw2HAZ/iMRl+I+WTDOmv5F
	EHeBcSgwSKGsTY42O/fUeKxqH9uJ+QZDYkokPy3ttqdlFVDvR7rQmlslhA/JkuevDh3h
	Fbaa+6gMEQ7iIfKvLYctAJbCE/ibS53GIKhcTw4jsT0cMnvSfsmszl4W86zvfKSTmjq5
	2GZUAP47aB5LdGG6Bkcm0uiehac/OPeSgETyxNTZ4d+a7Xhe40nLOJknpVY49Eh8rIol
	mOww==
X-Gm-Message-State: AOPr4FVHrsCWDZ2/JyUy0+1BnMu/Q3JkU0KO8HacWO52yYQNBKWBgDxm7rFJCjJjXPpbsA==
X-Received: by 10.55.198.27 with SMTP id b27mr14493374qkj.27.1461186212805;
	Wed, 20 Apr 2016 14:03:32 -0700 (PDT)
Received: from bill-the-cat ([2001:470:8:32a:225:22ff:fec3:d28d])
	by smtp.gmail.com with ESMTPSA id
	p101sm31970974qge.13.2016.04.20.14.03.28
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 20 Apr 2016 14:03:29 -0700 (PDT)
Date: Wed, 20 Apr 2016 17:03:31 -0400
From: Tom Rini <trini@konsulko.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20160420210331.GA3732@bill-the-cat>
References: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461160239-7799-2-git-send-email-yannick.gicquel@iot.bzh>
	<20160420194958.GP16135@denix.org>
MIME-Version: 1.0
In-Reply-To: <20160420194958.GP16135@denix.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH v2 1/4] u-boot: basic support of dtb append for verified boot
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
X-List-Received-Date: Wed, 20 Apr 2016 21:03:32 -0000
X-Groupsio-MsgNum: 81088
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline

--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2016 at 03:49:58PM -0400, Denys Dmytriyenko wrote:
> On Wed, Apr 20, 2016 at 03:50:36PM +0200, Yannick Gicquel wrote:
> > This introduces a new uboot-sign.class to support U-Boot verified boot.
> >=20
> > This part delivers the new class file, with related environment variabl=
es, and
> > a basic prepend to do_install task which performs the concatenation of =
the
> > u-boot-nodtb.bin and the device tree blob. The 'cat' command used
> > overrides the u-boot.bin in both DEPLOYDIR & build dir to propagate the
> > changes in later tasks (do_install, do_package, etc.)
> >=20
> > Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
> > ---
> >  meta/classes/uboot-sign.bbclass    | 59 ++++++++++++++++++++++++++++++=
++++++++
> >  meta/recipes-bsp/u-boot/u-boot.inc |  2 +-
> >  2 files changed, 60 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/classes/uboot-sign.bbclass
> >=20
> > diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.=
bbclass
> > new file mode 100644
> > index 0000000..63a5181
> > --- /dev/null
> > +++ b/meta/classes/uboot-sign.bbclass
> > @@ -0,0 +1,59 @@
> > +# This file is part of U-Boot verified boot support and is intended to=
 be
> > +# inherited from u-boot recipe and from kernel-fitimage.bbclass.
> > +#
> > +# The signature procedure requires the user to generate an RSA key and
> > +# certificate in a directory and to define the following variable:
> > +#
> > +#   UBOOT_SIGN_KEYDIR =3D "/keys/directory"
> > +#   UBOOT_SIGN_KEYNAME =3D "dev" # keys name in keydir (eg. "dev.crt",=
 "dev.key")
> > +#   UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb -p 2000"
> > +#   UBOOT_SIGN_ENABLE =3D "1"
> > +#
> > +# As verified boot depends on fitImage generation, following is also r=
equired:
> > +#
> > +#   KERNEL_CLASSES ?=3D " kernel-fitimage "
> > +#   KERNEL_IMAGETYPE ?=3D "fitImage"
> > +#
> > +# The signature support is limited to the use of CONFIG_OF_SEPARATE in=
 U-Boot.
> > +#
> > +# The tasks sequence is as below, using DEPLOY_IMAGE_DIR as common pla=
ce to
> > +# treat the device tree blob:
> > +#
> > +# u-boot:do_deploy -> virtual/kernel:do_assemble_fitimage -> u-boot:do=
_install
> > +#
> > +# For more details on signature process, please refer to U-boot docume=
ntation.
> > +
> > +# Signature activation.
> > +UBOOT_SIGN_ENABLE ?=3D "0"
> > +
> > +# Default value for deployment filenames.
> > +UBOOT_DTB_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.dtb"
> > +UBOOT_DTB_BINARY ?=3D "u-boot.dtb"
> > +UBOOT_DTB_SYMLINK ?=3D "u-boot-${MACHINE}.dtb"
> > +UBOOT_NODTB_IMAGE ?=3D "u-boot-nodtb-${MACHINE}-${PV}-${PR}.${UBOOT_SU=
FFIX}"
> > +UBOOT_NODTB_BINARY ?=3D "u-boot-nodtb.${UBOOT_SUFFIX}"
> > +UBOOT_NODTB_SYMLINK ?=3D "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
> > +
> > +#
> > +# Following is relevant only for u-boot recipes:
> > +#
> > +
> > +do_install_prepend_pn-u-boot () {
>=20
> Why _pn-u-boot here? What if I have my own version of u-boot recipe?

Oh good point, maybe this should be class-target instead of pn-u-boot
(here and elsewhere) ?

--=20
Tom

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXF+6jAAoJEIf59jXTHXZSjvwQAIiIRrVSBPjARq7dnbgGWCag
R2T+2MoWZCgDb/fo9Uv3EW481sGyZkzh22h684Da42waTmflkOhDN7T7+nPfmdQy
jW+JTC7d38HOAHYvsakD3Ws8Lh1MOGWmaXIFKNGh00Pz59EjYUelbMfaNWHH+JXV
/M/X/Mj7gEMnr4hUnyA/OOhRwbV80KhfOnWj6kn+63HCycotS63ebo+GPriJwjz8
KfyqC7SpN4Cli0iKbdQRQsQpmB6yOYtvtjKPBeIAyOxqJDB/7a7j+Mjdl/2I9KM/
err1vbosJ9GqBuWZT1V5YEdPNT0QGsK6Tx++vVkDtDO8vv/fI2iX4dhIlLcA6zEw
tMuPxwMf3A1HsB7sOhSP03uQJRDFf5nhGaItT4ldn1UnhEASGMifKVBQ0GWWuc8G
+tlC902dJoTAtU7gLmWs3HH/CL+Ya7sH9+HMfBvYfj3lGGECuQppTCHBglz8cQUO
A9gJHLv/0qzQsgC7TIwh9gEPfwahGzThjSq1fI57XJQbBXJ4wTCnju64KOzT2mIc
kD+4lnvAgk730sDc+boStwm6l4gcrwVI8ezGLz+rVhwNUAtwQOHWrmBXpi2o6lDZ
PieJfYXceokGqhpXFI+iWfkNNi6xNmHuVJl2h+MQpRIH6NmZwnrE9IDVP3K0d9Qq
heIxewEcxHMIG3wWMOWw
=jz5J
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
