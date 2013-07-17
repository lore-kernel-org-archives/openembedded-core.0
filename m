Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8C3CF6B203
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 08:33:46 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id l10so880099eei.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 01:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=J1Gxts3kzXd/+TWYvh4adfOybqwpgsq7b8yHq6OmFlg=;
	b=GBHkyC2C1gyZ9cgKKNuZARUdmECs7TnBmEpMzEtIvQFKJZcY5gCWd448vqX29BQXF5
	TjQmhdrEpkq97urTXiyNt5gXEg/zzZAfAbK2tZCgldnSJx4r/FegBcBprtpniRBMqqwr
	/1KCqHBGFC2VwAcWdVW8UVO6EHU6tOBOHbkJ9yd6+8DLBS5a/w8s1tAXsT/hyN4Fgqdc
	cyGvyIptlCu+G0P6TsurgZtMFU73pwL0br2Cdqiep8+WF7apzxK52aL5QwDilvkMUj4l
	aeGZEuEV1cc6PZXdMny87lqNynxI4/JpN/jK/j49zIo2WLAvl5EtLvJfGqUvMK1mJ1om
	RtQA==
X-Received: by 10.15.91.69 with SMTP id r45mr5317794eez.79.1374050026640;
	Wed, 17 Jul 2013 01:33:46 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b3sm8918958eev.10.2013.07.17.01.33.45 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 17 Jul 2013 01:33:46 -0700 (PDT)
Date: Wed, 17 Jul 2013 10:34:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Message-ID: <20130717083403.GB9527@jama>
References: <1374049179-19107-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1374049179-19107-1-git-send-email-ming.liu@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V1] util-linux: replace += with _append to EXTRA_OECONF_virtclass-native
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
X-List-Received-Date: Wed, 17 Jul 2013 08:33:47 -0000
X-Groupsio-MsgNum: 42060
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline

--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2013 at 04:19:39PM +0800, Ming Liu wrote:
> The native/nativesdk overrides of EXTRA_OECONF should take effect before
> append operator, otherwise, it will cause EXTRA_OECONF be overridden inst=
ead
> of be appended at native/nativesdk build time.
>=20
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>  meta/recipes-core/util-linux/util-linux_2.23.1.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/util-linux/util-linux_2.23.1.bb b/meta/rec=
ipes-core/util-linux/util-linux_2.23.1.bb
> index 12f5021..ae80450 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.23.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.23.1.bb
> @@ -18,5 +18,5 @@ SRC_URI[md5sum] =3D "6741eeaff93ff5a6bacdd3816bdd87c4"
>  SRC_URI[sha256sum] =3D "ad4a7831d7b27d0172996fd343e809716c2403b32a94e151=
94d8ea797223c4af"
> =20
>  CACHED_CONFIGUREVARS +=3D "scanf_cv_alloc_modifier=3Das"
> -EXTRA_OECONF_class-native +=3D "--disable-fallocate --disable-use-tty-gr=
oup"
> -EXTRA_OECONF_class-nativesdk +=3D "--disable-fallocate --disable-use-tty=
-group"
> +EXTRA_OECONF_append_class-native +=3D "--disable-fallocate --disable-use=
-tty-group"
> +EXTRA_OECONF_append_class-nativesdk +=3D "--disable-fallocate --disable-=
use-tty-group"

You should change +=3D to =3D, because append + +=3D is confusing.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHmVvsACgkQN1Ujt2V2gBxwlACgkCvMOH1OCA28Z77yF1tKyAXd
SOIAnjEd/hU22AiMoh+gRN51HT/bgL9m
=SJH+
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
