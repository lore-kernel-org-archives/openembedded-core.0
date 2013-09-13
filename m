Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3271D610EE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 08:45:55 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so415337eek.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 01:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+OqAJwXBPWobQsqWNx9g4BKqQdf+I0zB6vFd6ExocOM=;
	b=jRZU4ZopuM5eEsAIpkB02qgCh7+UdCKzPwiz8OcisrwFvpxFTB7Qvh+WnbOocTz0wb
	/GemC081ir9i1+/z7XKYIwHK8Nm2INcttI5jHTo6U0YI+TKU4C8lo1y1Bag2ZFYumV9Z
	Oc1Rc2KEHbE8rt6OBX/YCDrCbbyuLWuDgfRMkuXMCB9CK3JiupDrp5et+EmgNaYILnbw
	7In3cvh12Z+WIA/Cl7loHg/YLvJ5aef9MfcFAIcpq+0mF9hIaZllrBUcSehU15ofTum2
	iRDhCDPwsYZ1n9ttUK6M+folTSwNwa3rwvwo3iGJrOvBJcDhzyrooU64i3VWIFmSVneO
	MfCw==
X-Received: by 10.15.43.13 with SMTP id w13mr16500843eev.37.1379061956498;
	Fri, 13 Sep 2013 01:45:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm12934586eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Sep 2013 01:45:56 -0700 (PDT)
Date: Fri, 13 Sep 2013 10:47:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130913084724.GC11500@jama>
References: <1379054574-8526-1-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1379054574-8526-1-git-send-email-sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: bjorn.arnelid@xdin.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu.inc: Fix typo for KERNEL_FEATURES
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
X-List-Received-Date: Fri, 13 Sep 2013 08:45:56 -0000
X-Groupsio-MsgNum: 44949
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JAtnJwvplI04zgov"
Content-Disposition: inline

--JAtnJwvplI04zgov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2013 at 11:42:54PM -0700, Saul Wold wrote:
> Thans to Bjorn Arnelid for finding this
>=20
> Cc: bjorn.arnelid@xdin.com
>=20
> [YOCTO #5173]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/conf/machine/include/qemu.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/inclu=
de/qemu.inc
> index a78622d..8557777 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -26,4 +26,4 @@ PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
>  EXTRA_IMAGEDEPENDS +=3D "qemu-native qemu-helper-native"
> =20
>  # Provide the nfs server kernel module for all qemu images
> -KERNEL_FEATURES_append_pn-linux-yocto =3D " features/nfsd/nfsd-enable.sc=
c"
> +KERNEL_FEATURES_append_pn_linux-yocto =3D " features/nfsd/nfsd-enable.sc=
c"

Wait a minute, isn't _pn-foo correct override?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JAtnJwvplI04zgov
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIy0RwACgkQN1Ujt2V2gBx7EQCgt5poExeSx1W1VeTHuhVvxbTf
8t0AnRF2mm3Yf3dKuMAShbB1trIlWCKx
=hdNM
-----END PGP SIGNATURE-----

--JAtnJwvplI04zgov--
