Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Ss859-0004KF-PC; Fri, 20 Jul 2012 09:57:03 +0200
Received: by wgbdr1 with SMTP id dr1so3116498wgb.24
	for <multiple recipients>; Fri, 20 Jul 2012 00:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=O4OJAnMywPf/LUXCtO39orZTTl5fFutYvGbSRjbg5l4=;
	b=P+m7dUcWOkvXMCEIphBl9Sl2p1zfrNYPgO7CPlMPVcpxxN9NW4LJiRFPlsMCAbdPnp
	f+ZtvWCAI3nmQ3b85Bvi/ZV9D0Wn5eM2gjRODSmkAAoNc2b3paCFPi77NFf+/fa1JprN
	9R/zc5rmmtK9TlVDwGbOHv7TtwiP6FGzJ+YNxVrnc6vM6MO3ztj1cGqpSJqID3HXNvMG
	Y9nv0+MYctunfUMCrAbEI7qZyNqXeac5vZ1gHenQ/YWAcC3SlFBUDLdKe+qIY0Vsey2W
	x+pXbYkWsu1FkBsiyVfEgOBX6jRBT+DYd7FVSdyFDbpYonT8XJUs65OJaQlAJVKcomtX
	dcJA==
Received: by 10.216.29.74 with SMTP id h52mr3158398wea.146.1342770340901;
	Fri, 20 Jul 2012 00:45:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb20sm12972701wid.1.2012.07.20.00.45.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 00:45:39 -0700 (PDT)
Date: Fri, 20 Jul 2012 09:45:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120720074551.GC3534@jama.jama.net>
References: <20120717095159.1190C10333@opal>
MIME-Version: 1.0
In-Reply-To: <20120717095159.1190C10333@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Khem Raj : lib/oe/sstatesig.py: Exclude git-native from sstate checksum
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
X-List-Received-Date: Fri, 20 Jul 2012 07:57:03 -0000
X-Groupsio-MsgNum: 25831
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Content-Disposition: inline

--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 17, 2012 at 09:51:57AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 72cc3df204c4b838cc0358a7ac989adfdd5c1760
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D72cc3df204c4b838cc0358a7ac989adfdd5c1760
>=20
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Mon Jul  9 12:31:38 2012 -0700
>=20
> lib/oe/sstatesig.py: Exclude git-native from sstate checksum
>=20
> gcc exposed this issue where cross gcc recipes were not having
> same task checksums as libgcc or gcc-runtime the target recipes
> which use same shared workdir and it was triggering the unpack
> fetch and patch tasks to reexecute and hence the trouble
>=20
> Now that we have more than 1 package to consider lets combine
> the check
>=20
> Thanks RP for help and this is on the line of patch
> 793ce6cd9aa632e0f13789c8293770a86085d28d
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

I still see this behavior with latest oe-core

Complete cooker.log + do_compile error:
http://build.shr-project.org/tests/jama/gcc-parallel-unpack/

interesting part from cooker.log (stripped eglibc tasks between)

NOTE: package gcc-crosssdk-initial-4.7.1.0+git1+d07e24f4ab59f264d68d2183879=
5349faab5dede-r7: task do_compile: Started
NOTE: Running task 608 of 5331 (ID: 1559, /OE/shr-core/openembedded-core/me=
ta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.7.bb, do_rm_old_works)
NOTE: package gcc-crosssdk-intermediate-4.7.1.0+git1+d07e24f4ab59f264d68d21=
838795349faab5dede-r7: task do_rm_old_works: Started
NOTE: package gcc-crosssdk-intermediate-4.7.1.0+git1+d07e24f4ab59f264d68d21=
838795349faab5dede-r7: task do_rm_old_works: Succeeded
NOTE: Running task 610 of 5331 (ID: 1554, /OE/shr-core/openembedded-core/me=
ta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.7.bb, do_unpack)
NOTE: package gcc-crosssdk-intermediate-4.7.1.0+git1+d07e24f4ab59f264d68d21=
838795349faab5dede-r7: task do_unpack: Started
ERROR: Function failed: do_compile (see /OE/shr-core/tmp-eglibc/work/i686-o=
esdk-linux/gcc-crosssdk-initial/gcc-crosssdk-initial-4.7.1.0+git1+d07e24f4a=
b59f264d68d21838795349faab5dede-r7/temp/log.do_compile.19681 for further in=
formation)
NOTE: package gcc-crosssdk-initial-4.7.1.0+git1+d07e24f4ab59f264d68d2183879=
5349faab5dede-r7: task do_compile: Failed
ERROR: Task 4532 (/OE/shr-core/openembedded-core/meta/recipes-devtools/gcc/=
gcc-crosssdk-initial_4.7.bb, do_compile) failed with exit code '1'
NOTE: package gcc-crosssdk-intermediate-4.7.1.0+git1+d07e24f4ab59f264d68d21=
838795349faab5dede-r7: task do_unpack: Succeeded
NOTE: Running task 614 of 5331 (ID: 1555, /OE/shr-core/openembedded-core/me=
ta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.7.bb, do_patch)
NOTE: package gcc-crosssdk-intermediate-4.7.1.0+git1+d07e24f4ab59f264d68d21=
838795349faab5dede-r7: task do_patch: Started
NOTE: Running task 627 of 5331 (ID: 529, /OE/shr-core/openembedded-core/met=
a/recipes-devtools/gcc/gcc-crosssdk_4.7.bb, do_rm_old_works)
NOTE: package gcc-crosssdk-intermediate-4.7.1.0+git1+d07e24f4ab59f264d68d21=
838795349faab5dede-r7: task do_patch: Succeeded

Maybe it's caused by rm_old_works.bbclass..

Cheers,

>=20
> ---
>=20
>  meta/lib/oe/sstatesig.py |    6 ++----
>  1 files changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 4cd1221..20d94b2 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -17,10 +17,8 @@ def sstate_rundepfilter(siggen, fn, recipename, task, =
dep, depname, dataCache):
>          return True
> =20
>      # Quilt (patch application) changing isn't likely to affect anything
> -    if depname =3D=3D "quilt-native" and recipename !=3D "quilt-native":
> -        return False
> -    # Subversion also isn't likely to affect anything
> -    if depname =3D=3D "subversion-native" and recipename !=3D "subversio=
n-native":
> +    excludelist =3D ['quilt-native', 'subversion-native', 'git-native']
> +    if depname in excludelist and recipename !=3D depname:
>          return False
> =20
>      # Don't change native/cross/nativesdk recipe dependencies any further
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAJDK8ACgkQN1Ujt2V2gBwcLgCfZ/J+phlF1ia1oHMDiIgACVhQ
sUMAmgPOg2A6V9NtiFQ8Bp0BgplvqP0t
=Vwi+
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--
