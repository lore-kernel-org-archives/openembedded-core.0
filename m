Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TvrWr-00023u-0Y
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 16:37:25 +0100
Received: by mail-pb0-f54.google.com with SMTP id wz12so1452962pbc.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 07:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ISt0ydEaSqjGOaA4SdDOAGQboW7VuTTnZpciuJfUlH8=;
	b=slZa+7wcXL7f7tJBYZtiguIjiKDnb1nplTF8YZ+GS+PTRDzYZXnNrnlaH4QSGROCor
	OVgBUU5oPRAuur5i0OcdL/xNsxTA9RVZKSodO3m4yVGU9PalE92yY5Yk3VqPfK0i0Gs0
	uoUMnXofZYEpIOLxGmEAcV9xxLz+q+KZOkk4lWHi80eEQkCo8R0fmwyXVmzj7jcnj65p
	PPdnGLAUeOX4TGTRwArH99tLM3NV0mxH9cce3fJN+z07vdRb0T+0jL2CFOevS2yLm2oW
	cOATpGmlRxND3HOp/d+/Asz0pBtQzja86Wtas4SQhR9e8PmOD+GpcQbayvNutAyveejZ
	f8tw==
X-Received: by 10.68.235.1 with SMTP id ui1mr14301224pbc.138.1358436116842;
	Thu, 17 Jan 2013 07:21:56 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ov4sm1232775pbb.45.2013.01.17.07.21.54
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 07:21:55 -0800 (PST)
Date: Thu, 17 Jan 2013 16:21:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130117152150.GJ3067@jama>
References: <20130110235238.B9768103BD@opal>
MIME-Version: 1.0
In-Reply-To: <20130110235238.B9768103BD@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Robert P. J. Day : kernel.bbclass: Define MODULE_IMAGE_BASE_NAME for layer convenience.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 15:37:26 -0000
X-Groupsio-MsgNum: 33973
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4IYkFBVPN84tP7K"
Content-Disposition: inline

--T4IYkFBVPN84tP7K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 11:52:38PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 67e77cd948c69798695d5d5f34163ef89339b35a
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D67e77cd948c69798695d5d5f34163ef89339b35a
>=20
> Author: Robert P. J. Day <rpjday@crashcourse.ca>
> Date:   Wed Jan  9 12:01:23 2013 -0500
>=20
> kernel.bbclass: Define MODULE_IMAGE_BASE_NAME for layer convenience.
>=20
> Define the additional variable MODULE_IMAGE_BASE_NAME since some
> layers (like meta-ti) would find it handy for multi-kernel
> definitions in that they wouldn't have to define their own
> variable representing exactly the same thing.
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  meta/classes/kernel.bbclass |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index aff8842..46ba55f 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -500,7 +500,8 @@ KERNEL_IMAGE_BASE_NAME ?=3D "${KERNEL_IMAGETYPE}-${PE=
}-${PV}-${PR}-${MACHINE}-${DA
>  # Don't include the DATETIME variable in the sstate package signatures
>  KERNEL_IMAGE_BASE_NAME[vardepsexclude] =3D "DATETIME"
>  KERNEL_IMAGE_SYMLINK_NAME ?=3D "${KERNEL_IMAGETYPE}-${MACHINE}"
> -MODULE_TARBALL_BASE_NAME ?=3D "modules-${PE}-${PV}-${PR}-${MACHINE}-${DA=
TETIME}.tgz"
> +MODULE_IMAGE_BASE_NAME ?=3D "modules-${PE}-${PV}-${PR}-${MACHINE}-${DATE=
TIME}"
> +MODULE_TARBALL_BASE_NAME ?=3D "${MODULE_IMAGE_BASE_NAME}.tgz"
>  # Don't include the DATETIME variable in the sstate package signatures
>  MODULE_TARBALL_BASE_NAME[vardepsexclude] =3D "DATETIME"
>  MODULE_TARBALL_SYMLINK_NAME ?=3D "modules-${MACHINE}.tgz"

This makes sstate checksums to depend on DATETIME variable.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3299

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--T4IYkFBVPN84tP7K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD4Fw4ACgkQN1Ujt2V2gBzJGACfb825yCAY3v8cAblYpObY08Jr
B1gAnj+YUlEgTEuaclu8cnmXKmVpHh75
=LCM9
-----END PGP SIGNATURE-----

--T4IYkFBVPN84tP7K--
