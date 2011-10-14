Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REd5A-0008Cj-MY
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 10:25:32 +0200
Received: by bkat8 with SMTP id t8so1698085bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 01:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=337Mcu/3Zy9EVTUj+woh2i8nQq5X00NyOBKCkQEysmc=;
	b=U5ZprrBJfht2FdvrnnbaSfeszvHcYRsbXdsOkRjG6hbitFFL8NP7WpwEwoJYR2nXio
	7PE0X5MTAfpJ1j4vrII342N13fkzf1BHDYjfEO01eX4zIiWcID4A+EpW5BH/JmUqlLb3
	cs4anGvRFnPn8Bx7cXdI8w+1h4E+KAt71h/v8=
Received: by 10.204.131.217 with SMTP id y25mr5822770bks.98.1318580387812;
	Fri, 14 Oct 2011 01:19:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v16sm7506533bkd.6.2011.10.14.01.19.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 01:19:46 -0700 (PDT)
Date: Fri, 14 Oct 2011 10:19:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111014081939.GC3542@jama.jama.net>
References: <cover.1318547063.git.nitin.a.kamble@intel.com>
	<70807dd62c2c498616cc544869bd710b351b7212.1318547063.git.nitin.a.kamble@intel.com>
MIME-Version: 1.0
In-Reply-To: <70807dd62c2c498616cc544869bd710b351b7212.1318547063.git.nitin.a.kamble@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [review/test 3/5] python, python-native: upgrade from 2.6.6 to 2.7.2
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
X-List-Received-Date: Fri, 14 Oct 2011 08:25:32 -0000
X-Groupsio-MsgNum: 10995
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline

--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 04:06:13PM -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20

This patch does not apply after
9f9612d15acc6ee3b71f52bdb3f1ec4cb56b1a17

can you rebase on top of oe-core?

Also please drop
DEFAULT_PREFERENCE =3D "-27"

we have only one python version so I guess it's not usefull at all
anymore

I'll apply it manually, test it here.. and report if those modules are
build later..

Regards,

> Rebased these patches to the newer code
> 	modified:   python-native/nohostlibs.patch
> 	modified:   python/01-use-proper-tools-for-cross-build.patch
> 	modified:   python/06-avoid_usr_lib_termcap_path_in_linking.patch
> 	modified:   python/06-ctypes-libffi-fix-configure.patch
> 	modified:   python/multilib.patch
>=20
> Deleted these patches are the are now upstream
> 	deleted:    python/02-remove-test-for-cross.patch
> 	deleted:    python/security_issue_2254_fix.patch
>=20
> Added this patch to python-native
> 	new file:   python-native/multilib.patch
>=20
> Updated site config file for python
> 	modified:   ../../site/common-linux : add ac_cv_have_long_long_format fo=
r python
> 	avoid this error in python:
> 	Include/pyport.h:243:13: error: #error "This platform's pyconfig.h needs=
 to define PY_FORMAT_LONG_LONG"
>=20
> Updated default python version
> 	modified:   ../../conf/distro/include/default-versions.inc
>=20
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6X8JsACgkQN1Ujt2V2gBz/dACeJ6ieithGTEL22k+nQNaCa2xx
iEQAn3/zEy+arisL9tLfSIZ3GJKw38Ib
=KuSi
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
