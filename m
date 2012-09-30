Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TIDqV-00056Y-Hu
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Sep 2012 09:21:47 +0200
Received: by wibhj13 with SMTP id hj13so1086520wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Sep 2012 00:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=5HyKV4YEnOOmwp+2NAnFWf0bjWI/tVwhBz3sr1kLHXY=;
	b=LhlDy3WO8kymGHFbw0mI0s0oQFQODdvWxj/PMkLVi/H1CEE51EGOCMWMuzOx0d/6Tj
	QPRHJyryMJ8j/XeL854T8UEayDgqP9IYLKvHKn/GO2R4owS6UfOBDY3XRL1qmGOdiLkt
	uJFZZgnToE9UWPFVujignhvynTNHSpGVdL/4/9cgOPKNZR179jmgFaOhfTGEZoxI7ozB
	iGnNRWpWBjWkPWS01tHFIQ5guirIcuFoO8YJrzHwEcKvOKldBBFPKGmmIq3BbqLpTW6T
	Z+Mbrqa9fq15cpaTqvOoI/m/xPs53S1nqnjUg0T7l2MQxoXBhQSmVZqFNGDrGyqJiWOK
	SLZw==
Received: by 10.180.99.133 with SMTP id eq5mr7079153wib.21.1348988932192;
	Sun, 30 Sep 2012 00:08:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p4sm9242373wix.0.2012.09.30.00.08.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 30 Sep 2012 00:08:51 -0700 (PDT)
Date: Sun, 30 Sep 2012 09:09:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120930070906.GA3299@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Fetcher errors when looking for sstate package in do_package_write_ipk_setscene
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
X-List-Received-Date: Sun, 30 Sep 2012 07:21:47 -0000
X-Groupsio-MsgNum: 30155
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In last few days I often see errors when looking for sstate packages. They =
aren't fatal, build continues,=20
but in the end bitbake returns non-zero exit code:
Summary: There was 1 ERROR message shown, returning a non-zero exit code.
Which causes jenkins jobs seeing it as failure. Can we hide fetcher error i=
n this case?

NOTE: recipe shr-version-1.020120930-r0: task do_package_write_ipk_setscene=
: Started
WARNING: Failed to fetch URL file://5c/sstate-shr-version-om_gta02-oe-linux=
-gnueabi-1.020120930-r0-om_gta02-2-5c3135b290962ddfbeb18f87956911bb_deploy-=
ipk.tgz,
attempting MIRRORS if available
ERROR: Fetcher failure: Unable to find file file://5c/sstate-shr-version-om=
_gta02-oe-linux-gnueabi-1.020120930-r0-om_gta02-2-5c3135b290962ddfbeb18f879=
56911bb_deploy-ipk.tgz
anywhere. The paths that were searched were:
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/task-package_write_=
ipk_setscene
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/linux-gnueabi
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/arm
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/build-linux
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/pn-shr-version
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/om-gta02
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/armv4
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/om-gta02
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/shr
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/class-target
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/forcevariable
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/thumb
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/libc-glibc
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930-r0/
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/task-package_write_ipk=
_setscene
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/linux-gnueabi
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/arm
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/build-linux
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/pn-shr-version
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/om-gta02
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/armv4
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/om-gta02
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/shr
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/class-target
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/forcevariable
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/thumb
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/libc-glibc
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/task-package_write_ipk_setscene
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/linux-gnueabi
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/arm
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/build-linux
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/pn-shr-version
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/om-gta02
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/armv4
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/om-gta02
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/shr
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/class-target
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/forcevariable
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/thumb
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/libc-glibc
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/task-package_write_ipk=
_setscene
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/linux-gnueabi
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/arm
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/build-linux
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/pn-shr-version
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/om-gta02
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/armv4
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/om-gta02
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/shr
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/class-target
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/forcevariable
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/thumb
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/libc-glibc
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version-1.020120930/
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/task-package_write_ipk_setscene
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/linux-gnueabi
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/arm
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/build-linux
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/pn-shr-version
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/om-gta02
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/armv4
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/om-gta02
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/shr
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/class-target
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/forcevariable
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/thumb
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/libc-glibc
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr-version/
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/files/task-package_write_ipk_setscene
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/files/linux-gnueabi
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/files/arm
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/files/build-linux
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/files/pn-shr-version
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/files/om-gta02
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/files/armv4
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/files/om-gta02
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/files/shr
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/files/class-target
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/files/forcevariable
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/files/thumb
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/files/libc-glibc
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/files/
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/task-package_write_ipk_setscene
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/linux-gnueabi
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/arm
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/build-linux
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/pn-shr-version
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/om-gta02
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/armv4
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/om-gta02
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/shr
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/class-target
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/forcevariable
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/thumb
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/libc-glibc
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/meta-smartph=
one/meta-shr/recipes-shr/shr/.
    /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/sstate-cache
NOTE: recipe xserver-common-1.34-r8: task do_populate_sysroot_setscene: Suc=
ceeded
NOTE: recipe shr-version-1.020120930-r0: task do_package_write_ipk_setscene=
: Failed
WARNING: Setscene task 642 (/var/lib/jenkins/jobs/shr-core-branches/workspa=
ce/shr-core/meta-smartphone/meta-shr/recipes-shr/shr/shr-version.bb, do_pac=
kage_write_ipk_setscene) failed with exit code '1' - real task will be run =
instead

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBn8BIACgkQN1Ujt2V2gBw1VQCdG87pIxirKpZHLuxbRIli/BRb
cqcAnjxnksHUnkXXapq/BPOy/fV0r8Pu
=0xzm
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
