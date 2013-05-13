Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ubpkn-0005zZ-IK
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 12:13:17 +0200
Received: by mail-da0-f47.google.com with SMTP id k13so1234080dae.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 02:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=UBxAOwAe3DBTzualWJNOkpFJW5qH92jgGbitSwon56U=;
	b=F3O+ZU+qZEU/h6126ZyMRFI48H+nkFncEcH9xcFcSr5DuVGst1le2bEJDcLjurZ+Vd
	Sd3YOu8sZ0vPoAou6Hgv7rauZ8D317N0nEmKzl/BtXRjI/q0L7RCcJe6bIW803aQ1x9N
	V7p/Sef7dhbgOkPJGf3cVKpKaiw4vAJbrwfbsM+JgYxRYA/DNME0DNN+aYZsYU5ejL7E
	fWL7WXdCmGQUjgs1Pt+8dnuvhxWwZZu77K26NUE+kt4t0wB5+S6xiKY4YQ7Ey4k+iUHn
	7V/E3ebibt+9BMC+OcMga2RnoXpF9une6Dj8OVI9VBE/9QQ77CkHFcSEQF+NzWBSRIHg
	OGZw==
X-Received: by 10.68.137.168 with SMTP id qj8mr28566039pbb.17.1368438903174;
	Mon, 13 May 2013 02:55:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t1sm14333279pab.12.2013.05.13.02.55.00 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 13 May 2013 02:55:02 -0700 (PDT)
Date: Mon, 13 May 2013 11:55:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20130513095459.GA3187@jama>
References: <cover.1368425946.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1368425946.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] insane/package: refactor packaging sanity tests
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
X-List-Received-Date: Mon, 13 May 2013 10:13:28 -0000
X-Groupsio-MsgNum: 39111
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2013 at 05:09:18AM -0400, Robert Yang wrote:
> The following changes since commit c5c1517726aa103a3cdb60abda95e28997cac7=
c4:
>=20
>   image-vmdk.bbclass: disable the NOISO =3D "1" (2013-05-12 09:37:21 +010=
0)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib robert/qa
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Drobert/qa

Looks good, it probably solves also at least partially:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4085

> Robert Yang (3):
>   insane/package: let package.bbclass inherit insane.bbclass
>   defaultsetup.conf: remove INHERIT_INSANE
>   insane/package: refactor packaging sanity tests
>=20
>  meta/classes/insane.bbclass        |   39 ++++++++++++++++++++++--------=
----
>  meta/classes/package.bbclass       |   41 ++++++++++++++++++++++++------=
------
>  meta/conf/distro/defaultsetup.conf |    3 +--
>  3 files changed, 54 insertions(+), 29 deletions(-)
>=20
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGQuHMACgkQN1Ujt2V2gBxdLgCfUs1CCqL01RIkuz64DzDtu3bc
GfYAn37yuRaLZyfY9Q+QHtROQHDV6ffF
=CNBv
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
