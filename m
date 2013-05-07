Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UZkEi-00019e-9k
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 17:55:32 +0200
Received: by mail-da0-f43.google.com with SMTP id u7so401815dae.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 08:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=rO39jnjJaXMOb2Sy8FrZy1rd5EYhoozokhpI2NhWei4=;
	b=vhq7u0ZMt+zq/oxpZ3BeDv7ag5fnhHzPNHd5Hpm0SFx/5rZ8v/MwOFK3kjvnm0j0Z8
	rPL23P6MLdLrXL8vc/Fd+QPmYXy4eKtw9pdU7cwAjkswsuZuTcUiZipc+EcdnkrgQ6iw
	sBpBDbFGxxH1RBQaNdK83JJmlylF5lw2D3GseyFmVCiNNcBSr0nX/wAfhwwFCYPNl26N
	6nSzW3rFvKmaf3QiV0RBbRM+ja4AtdRQe3QErtAUETFzEWiH/+Uaz3BJt0Ea93m2i2/+
	v7/M8Lb+WRPJoq6v3UzNY2v/h1+ldvsib1xxQyIVEhAZBXm6J1uquqhfXBPMs416zrhj
	axIg==
X-Received: by 10.68.190.104 with SMTP id gp8mr2959466pbc.120.1367941046621;
	Tue, 07 May 2013 08:37:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ea15sm30790313pad.16.2013.05.07.08.37.23 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 08:37:25 -0700 (PDT)
Date: Tue, 7 May 2013 17:37:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130507153716.GE3187@jama>
References: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/15] classes/recipes/lib: Fix various python whitespace issues
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
X-List-Received-Date: Tue, 07 May 2013 15:55:38 -0000
X-Groupsio-MsgNum: 38803
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2hMgfIw2X+zgXrFs"
Content-Disposition: inline

--2hMgfIw2X+zgXrFs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2013 at 01:55:53PM +0100, Richard Purdie wrote:
> There are some left over tab characters in the python functions. This
> removes them and resolves python 3 errors.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> =20
> @@ -202,13 +202,13 @@ def package_qa_check_useless_rpaths(file, name, d, =
elf, messages):
>      import re
>      rpath_re =3D re.compile("\s+RPATH\s+(.*)")
>      for line in phdrs.split("\n"):
> -    	m =3D rpath_re.match(line)
> -	if m:
> -	   rpath =3D m.group(1)
> -	   if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
> -	      # The dynamic linker searches both these places anyway.  There is=
 no point in
> -	      # looking there again.
> -	      messages.append("%s: %s contains probably-redundant RPATH %s" % (=
name, package_qa_clean_path(file, d), rpath))
> +        m =3D rpath_re.match(line)
> +        if m:
> +           rpath =3D m.group(1)
> +           if rpath_eq(rpath, libdir) or rpath_eq(rpath, base_libdir):
> +              # The dynamic linker searches both these places anyway.  T=
here is no point in
> +              # looking there again.
> +              messages.append("%s: %s contains probably-redundant RPATH =
%s" % (name, package_qa_clean_path(file, d), rpath))

last 2 blocks are indented only by 3 spaces

>      if not sane:
>          messages.append("ELF binary '%s' has relocations in .text" % pat=
h)
> @@ -498,7 +498,7 @@ def package_qa_hash_style(path, name, d, elf, message=
s):
>          if "GNU_HASH" in line:
>              sane =3D True
>          if "[mips32]" in line or "[mips64]" in line:
> -	    sane =3D True
> +             sane =3D True

this has 5 spaces

> =20
>      if has_syms and not sane:
>          messages.append("No GNU_HASH in the elf binary: '%s'" % path)
> diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib=
_global.bbclass
> index 529e82a..40ae006 100644
> --- a/meta/classes/multilib_global.bbclass
> +++ b/meta/classes/multilib_global.bbclass
> @@ -5,7 +5,7 @@ python multilib_virtclass_handler_global () {
>      if isinstance(e, bb.event.RecipePreFinalise):
>          for v in e.data.getVar("MULTILIB_VARIANTS", True).split():
>              if e.data.getVar("TARGET_VENDOR_virtclass-multilib-" + v, Fa=
lse) is None:
> -	       e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + v, e.data.ge=
tVar("TARGET_VENDOR", False) + "ml" + v)
> +               e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + v, e.=
data.getVar("TARGET_VENDOR", False) + "ml" + v)

3 spaces again

> =20
>      variant =3D e.data.getVar("BBEXTENDVARIANT", True)
> =20
> diff --git a/meta/recipes-core/meta/external-sourcery-toolchain.bb b/meta=
/recipes-core/meta/external-sourcery-toolchain.bb
> index 24c7ce8..3218754 100644
> --- a/meta/recipes-core/meta/external-sourcery-toolchain.bb
> +++ b/meta/recipes-core/meta/external-sourcery-toolchain.bb
> @@ -142,6 +142,6 @@ CSL_VER_MAIN ??=3D ""
> =20
>  python () {
>      if not d.getVar("CSL_VER_MAIN"):
> -	raise bb.parse.SkipPackage("External CSL toolchain not configured (CSL_=
VER_MAIN not set).")
> +        	raise bb.parse.SkipPackage("External CSL toolchain not configur=
ed (CSL_VER_MAIN not set).")

spaces AND tab

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2hMgfIw2X+zgXrFs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGJH6wACgkQN1Ujt2V2gByIWQCgjqIXtz94jISAvNUjpbgTxXc8
5TAAoJQWHharZi+4ZCdq6DCqGJypeFzz
=L1kB
-----END PGP SIGNATURE-----

--2hMgfIw2X+zgXrFs--
