Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 98A636D120
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 11:57:25 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so764163eaj.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 03:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Rgnt97wtviuaFLZtt2l4Qu/yLKLvu+WMAH0eM1RxgXg=;
	b=TqNM4ekHX/rCFweWBrdH1fsIM/OlKz7+4ineTPk1XQZI4M40OEBAX4ElSBP/YsnQD2
	zmobhLBMod9LxZHTMp1jzxEaBT0WBDqMwa3JKnKB+avxk7e33+jUFjx4Eckr8Wok+Dbm
	oUSYNU8PyRCXaUgzy3MEuNLuXB30gkEK2h2vmlVxzTFqXpPCpIVZnC9AOkYoQQsEfGHD
	o9YSq6CtyINoNX5KbnQwwnWPQI83zMXhSuAX8i6ZC6qWKq1AmgfX1giZYRgy269K6zyT
	lh2uD31RZFOoVjsy9WGUsatOmkHh0ct8DCjTUDrfGBA/13JETSnyRAtFE1IBJG8n0/bT
	O1pQ==
X-Received: by 10.15.45.135 with SMTP id b7mr26705478eew.88.1389182246235;
	Wed, 08 Jan 2014 03:57:26 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	b41sm188859134eef.16.2014.01.08.03.57.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jan 2014 03:57:25 -0800 (PST)
Date: Wed, 8 Jan 2014 12:57:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140108115736.GX3709@jama>
References: <20140106112937.00B9650473@opal>
MIME-Version: 1.0
In-Reply-To: <20140106112937.00B9650473@opal>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : make: upgrade to 4.0
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
X-List-Received-Date: Wed, 08 Jan 2014 11:57:26 -0000
X-Groupsio-MsgNum: 48684
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PjJwPjbdn5RfZuWK"
Content-Disposition: inline

--PjJwPjbdn5RfZuWK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2014 at 11:29:36AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: f2b40e09e1d9767001f8fd9d5948ff2757491b2f
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Df2b40e09e1d9767001f8fd9d5948ff2757491b2f
>=20
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Fri Dec 27 21:46:10 2013 +0800
>=20
> make: upgrade to 4.0
>=20
> Upgrade to 4.0, remove the following patches since they have been fixed
> by the upgrade:
>  - expand_MAKEFLAGS.patch
>  - intermediate-target-bugfix.patch
>  - make-savannah-bug30612-fix_white_space.patch
>  - make-savannah-bug30612-handling_of_archives.patch
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Fails to build here:

whole log:
http://jenkins.nas-admin.org/job/oe_shr-image-all_tmpfs_qemuarm/182/console=
Full

important part:

| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --sysr=
oot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemua=
rm -DLOCALEDIR=3D\"/usr/share/locale\" -DLIBDIR=3D\"/usr/lib\" -DINCLUDEDIR=
=3D\"/usr/include\" -DHAVE_CONFIG_H -I.     -pthread -I/home/jenkins/oe/shr=
-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/guile/2.0  =
-O2 -pipe -g -feliminate-unused-debug-types -c -o guile.o guile.c
| In file included from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/include/guile/2.0/libguile/pthread-threads.h:33:0,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/include/guile/2.0/libguile/threads.h:36,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/include/guile/2.0/libguile/async.h:28,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/qemuarm/usr/include/guile/2.0/libguile.h:37,
|                  from guile.c:25:
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/u=
sr/include/guile/2.0/libguile/bdw-gc.h:47:19: fatal error: gc/gc.h: No such=
 file or directory
|  #include <gc/gc.h>
|                    ^
| compilation terminated.
| make[2]: *** [guile.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/make/4.0-r0/make-4.0'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/make/4.0-r0/make-4.0'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/make=
/4.0-r0/temp/log.do_compile.11565)
NOTE: recipe make-4.0-r0: task do_compile: Failed


>=20
> ---
>=20
>  .../make/make-3.82/expand_MAKEFLAGS.patch          |  39 -----
>  .../make-3.82/intermediate-target-bugfix.patch     |  23 ---
>  .../make-savannah-bug30612-fix_white_space.patch   |  58 -------
>  ...ke-savannah-bug30612-handling_of_archives.patch | 188 ---------------=
------
>  meta/recipes-devtools/make/make_3.82.bb            |  16 --
>  meta/recipes-devtools/make/make_4.0.bb             |  10 ++
>  6 files changed, 10 insertions(+), 324 deletions(-)
>=20
> Diff:   http://git.openembedded.org/?p=3Dopenembedded-core.git/?a=3Dcommi=
tdiff;h=3Df2b40e09e1d9767001f8fd9d5948ff2757491b2f
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PjJwPjbdn5RfZuWK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLNPTAACgkQN1Ujt2V2gBxv6QCfYI5pgS6Fg51OxVmHKWpul4qr
0koAoIa08OUa6JHMIQkbVSa8Oid5skrl
=983j
-----END PGP SIGNATURE-----

--PjJwPjbdn5RfZuWK--
