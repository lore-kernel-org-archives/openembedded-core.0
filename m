Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SMhQP-0007rr-S4
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 17:13:05 +0200
Received: by wera1 with SMTP id a1so557875wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 08:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bO78/V48QnmZEYICJoDR4U+0XazWpCXK5E6BN1uC5dc=;
	b=dRjtYhBMPnp1t8+Ue3gDzm8AQ18uhcx5z307NFUkJVbTaE0H/E77Sc+vaiGq6CXumn
	reipMTgXaPCULGHz6npdCynawWFBzbMCyBXrulS37DoYdUl6hJb0XizR0mncGO/hULqm
	2bE/0UHqDqmqgfn3JAmQ63mXq0mkwkgUHQRoGGHDL6UHkt61YMEmC2zjJX6dHxvGh9Ds
	CVvpiD29V89coZr8eZq+3r5KmFpItZgfXNfTNvB0+zqguTQqlaUdUdtqoPNZbCSN8opQ
	SPB8y6y6o7d2Ox1fukAw9ur+wZ5m7wpKHdjHJyEes0qOU9iRDnI0WQDrGst2EYhkytQ1
	MmDQ==
Received: by 10.180.88.199 with SMTP id bi7mr32210346wib.12.1335279811190;
	Tue, 24 Apr 2012 08:03:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ca3sm30317199wib.6.2012.04.24.08.03.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Apr 2012 08:03:28 -0700 (PDT)
Date: Tue, 24 Apr 2012 17:03:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120424150329.GC3687@jama.jama.net>
References: <cover.1333001415.git.Martin.Jansa@gmail.com>
	<cover.1333028738.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1333028738.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCHv2 0/2] more kernel.bbclass updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Apr 2012 15:13:05 -0000
X-Groupsio-MsgNum: 21149
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline

--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 04:08:43PM +0200, Martin Jansa wrote:
> The following changes since commit 432e36300d7231c9b01cd2c6c4b39b84cf4fdd=
ca:
>=20
>   rpm: Ensure we depend on file (2012-03-28 18:40:20 +0100)
>=20
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib jansa/kernel2
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Djansa/kernel2
>=20
> Martin Jansa (2):
>   kernel.bbclass: merge uboot_mkimage improvements from meta-oe
>   kernel.bbclass: unify white spaces
>=20
>  meta/classes/kernel.bbclass |   67 ++++++++++++++++++++++++-------------=
-----
>  1 files changed, 38 insertions(+), 29 deletions(-)

Can this go to master-next?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+WwMEACgkQN1Ujt2V2gBwtLgCcD0kePVQiiyr9nvLcwgFVmV8e
+BMAoJB82RKMrAJsP7EY1Ord2aqLX5mX
=96pX
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--
