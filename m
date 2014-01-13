Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 451966B446
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 10:21:30 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so3163497ead.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 02:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3cVrpBQK5k/bAPcUF//SCI4SDW8nG1W7rqR//doIeE4=;
	b=kmwbtRgUDRo34qcgNtzMxoQ26IK07aVHt8JY/H8mN7b8ej5RaeJVelmYXtignYhmwY
	Pn5WQwvgZPmZQGM5PFe5EvrVfy0zeZHrYQ9c44JCdcoZ8xtUxI1iWkXo1m/3yPgO2/ut
	/DQ3ysfxUcI2b8E8VhSgfcHy8eHQcDyMSyFTuZzJYPLhaymecjwVxh2OW7V/OvZLQRKK
	mr6rPC4b7YLXqP9/uH634uWQjLJ3xivmWKzjsqJRe1B8CYxEwOzXbF4Y0digQjlUajAl
	iANS4uFL7ILdZ3HteNRaoctqu2jYevuAL8anQ8rwwpmAhTxLlzgZZsE2XEFSm9idat0n
	/FqA==
X-Received: by 10.15.111.201 with SMTP id cj49mr26483920eeb.56.1389608490794; 
	Mon, 13 Jan 2014 02:21:30 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	l41sm34889172eep.17.2014.01.13.02.21.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Jan 2014 02:21:29 -0800 (PST)
Date: Mon, 13 Jan 2014 11:21:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140113102147.GK16995@jama>
References: <cover.1389629682.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1389629682.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] refactor the archive*.bbcalss
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
X-List-Received-Date: Mon, 13 Jan 2014 10:21:30 -0000
X-Groupsio-MsgNum: 48898
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YIleam+9adpUeYf+"
Content-Disposition: inline

--YIleam+9adpUeYf+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2014 at 12:20:14AM +0800, Robert Yang wrote:
> * The archive*.bbclass didn't work, and there were a few problems, for
>   example:
>   1) There were a few duplicated code
>   2) There was no src_dir.org (or orig), but the diff command still use
>      it, and it is not easy to fix this issue if we don't change a lot
>      of the code.
>   3) It didn't archive the source for the native or gcc
>   4) The work flow is not very well
>   5) The "subprocess.call('fakeroot cp xxxx'" should be removed
>   6) And others ...
>=20
> * So that we have to refactor it, the benefits are:
>   1) Fix the problems and make it work well.
>   2) Reduce more than 400 lines in total.
>   3) Make it easy to use.

Have you seen
http://lists.openembedded.org/pipermail/openembedded-core/2013-December/087=
729.html
?

Could you review it/integrate changes from it?

>=20
> // Robert
>=20
> The following changes since commit 1b636173ca88e5ccca1992f9a12367a1189fa6=
74:
>=20
>   bitbake: toaster: Toaster GUI, generic search, filter and order (2014-0=
1-10 15:20:26 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib rbt/archiver
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Drbt/archiver
>=20
> Robert Yang (5):
>   classes/archive*.bbclass: remove archive-*-source.bbclass
>   archiver.bbclass: refactor it
>   package_rpm.bbclass: archive the source to srpm package
>   archiver.bbclass: move a few code to copyleft_compliance.bbclass
>   local.conf.sample.extended: update for the archiver
>=20
>  meta-yocto/conf/local.conf.sample.extended     |  72 +--
>  meta/classes/archive-configured-source.bbclass |  65 ---
>  meta/classes/archive-original-source.bbclass   |  65 ---
>  meta/classes/archive-patched-source.bbclass    |  65 ---
>  meta/classes/archiver.bbclass                  | 723 ++++++++-----------=
------
>  meta/classes/copyleft_compliance.bbclass       |  55 +-
>  meta/classes/package_rpm.bbclass               |  31 +-
>  7 files changed, 316 insertions(+), 760 deletions(-)
>  delete mode 100644 meta/classes/archive-configured-source.bbclass
>  delete mode 100644 meta/classes/archive-original-source.bbclass
>  delete mode 100644 meta/classes/archive-patched-source.bbclass
>=20
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YIleam+9adpUeYf+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLTvjsACgkQN1Ujt2V2gBw9kwCdGKDyW77ZpzkqVinTxTkGWyHb
iQIAnjyRJm3yyY89O1bHHNEKpkAiEHiS
=kUgK
-----END PGP SIGNATURE-----

--YIleam+9adpUeYf+--
