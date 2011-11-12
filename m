Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RPBdq-0000BR-KN
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Nov 2011 12:20:58 +0100
Received: by bkbzs2 with SMTP id zs2so4240561bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2011 03:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=224/WkmUcIToWVNSzspZAAjDNDooxgAiDbA1zeQBilA=;
	b=u5e4i3iNY7EDWjaDZoZ9AuxmvkmYziioz9y5IXcQqSGjSWG0UjF2J3ptB9+adXRxYL
	ZusihUZHEjtmQWxQ+kaqpe1JfliHFze4znYxwFwql+/DgUJ0CGo2J8uz44U9OhEcNLwt
	D/MaWY+vx2b81Y83gKlr345N8hJXHwqwe7qNw=
Received: by 10.204.150.205 with SMTP id z13mr11762364bkv.67.1321096478843;
	Sat, 12 Nov 2011 03:14:38 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m12sm7378434bkg.14.2011.11.12.03.14.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Nov 2011 03:14:37 -0800 (PST)
Date: Sat, 12 Nov 2011 12:14:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111112111425.GA30296@jama.jama.net>
References: <1321033528.26881.13.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1321033528.26881.13.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] opkg: Ensure we use the uname/gname fields when extracting tarballs
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
X-List-Received-Date: Sat, 12 Nov 2011 11:20:58 -0000
X-Groupsio-MsgNum: 12395
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline

--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 11, 2011 at 05:45:28PM +0000, Richard Purdie wrote:
> When extracting packages onto the target system in particular, we really
> want to ensure the name fields in the tarball are used over and above
> the numerical uid/gid values. This patch adds this functionality to opkg
> and ensures package upgrades work correctly permission wise
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

doesn't apply, seems like some parts are twice.. add_uname_support.patch
is somehow added twice and opkg_svn.bb change is there also twice (one
is empty).

OE @ ~/shr-core/openembedded-core $ pw-am.sh.oe-core 14859
2011-11-12 12:09:15
URL:http://patchwork.openembedded.org/patch/14859/mbox/ [7429] ->
"pw-am-14859.patch" [1]
Applying: opkg: Ensure we use the uname/gname fields when extracting
tarballs
fatal: git apply: bad git-diff - expected /dev/null on line 7
Patch failed at 0001 opkg: Ensure we use the uname/gname fields when
extracting tarballs
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".


> diff --git a/meta/recipes-devtools/opkg/opkg/add_uname_support.patch b/me=
ta/recipes-devtools/opkg/opkg/add_uname_support.patch
> new file mode 100644
> index 0000000..885f75f
> --- a/dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/add_uname_support.patch
> @@ -0,0 +1,85 @@
> +When updating packages on the target device we ideally want to match=20
=2E..

> diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtoo=
ls/opkg/opkg_svn.bb
> index 099a373..8f50f67 10From a781e059562e91c6467be7c4aac43561413b3703 Mo=
n Sep 17 00:00:00 2001
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date: Fri, 11 Nov 2011 17:17:01 +0000
> Subject: opkg: Ensure we use the uname/gname fields when extracting tarba=
lls
>=20
> ---
> diff --git a/meta/recipes-devtools/opkg/opkg/add_uname_support.patch b/me=
ta/recipes-devtools/opkg/opkg/add_uname_support.patch
> new file mode 100644
> index 0000000..885f75f
> --- a/dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/add_uname_support.patch
> @@ -0,0 +1,85 @@
> +When updating packages on the target device we ideally want to match=20
=2E...
> diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtoo=
ls/opkg/opkg_svn.bb
> index 099a373..8f50f67 100644
> --- a/meta/recipes-devtools/opkg/opkg_svn.bb
> +++ b/meta/recipes-devtools/opkg/opkg_svn.bb
> @@ -11,13 +11,14 @@ RREPLACES_${PN} =3D "opkg-nogpg"
> =20
>  SRC_URI =3D "svn://opkg.googlecode.com/svn;module=3Dtrunk;proto=3Dhttp \
>             file://add_vercmp.patch \
=2E..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6+VREACgkQN1Ujt2V2gBzMxgCeONZEJqWKdTvewB7W0hjxOxVl
UNQAn2L89jtU0Yp9mrjoAWoDgaT6979t
=qkCl
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
