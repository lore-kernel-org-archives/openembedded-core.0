Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TR09Y-0005KR-AI
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 14:33:44 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so212876wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 05:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=q+CfhKgw6buhdbPesywFoE4eCrqys2uXYWNCBm8ro5s=;
	b=AE/Vb69kETJUc7uuuTpXYEdRlEpGNcIvTtRDHpM2pqsfI9NjiV5gZ8YZoy7mQ6vtk0
	9eBvXuoYqYPCznNGGsno7suE2NKWBZinOrO+YFUj/+3XQ/BXLmQiF1gj90UDxQeHR75z
	vhabKEx/cNeb+1DQHOwmVMeeM2gVKa0P834WfStT6GZKyv6FROWgjECw2TJhZuYkRv6t
	yfVheWpoO8k47qKx17ZpUJp9/pqPZUz5p0sOn6EM/P0F7yuKqEMCshf/jbLmk/L2Zvu9
	awSshpLLA0RIuJmNJ7I8DF6k2krG3svkawRLkM7/VN3QEReeWP11+NOgK8xU5OUtFaL4
	o1eQ==
Received: by 10.216.200.198 with SMTP id z48mr9153994wen.7.1351081217249;
	Wed, 24 Oct 2012 05:20:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ei1sm4642693wid.7.2012.10.24.05.20.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 05:20:16 -0700 (PDT)
Date: Wed, 24 Oct 2012 14:20:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20121024122034.GF3269@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: python-native wrong path to WORKDIR in RUNSHARED
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
X-List-Received-Date: Wed, 24 Oct 2012 12:33:44 -0000
X-Groupsio-MsgNum: 30930
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ilsi/0vOxQ+fn9lZ"
Content-Disposition: inline

--Ilsi/0vOxQ+fn9lZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

path to sysroot is correctly mangled but there is still wrong path
pointing to WORKDIR.

=2E/x86_64-linux/usr/lib/python2.7/config/Makefile:RUNSHARED=3D
LD_LIBRARY_PATH=3D/OE/jansa-test/shr-core/tmp-eglibc/work/x86_64-linux/pyth=
on-native-2.7.3-r0.1/Python-2.7.3:/OE/shr-core/tmp-eglibc/sysroots/x86_64-l=
inux/usr/bin/../lib/pseudo/lib:/OE/shr-core/tmp-eglibc/sysroots/x86_64-linu=
x/usr/bin/../lib/pseudo/lib64

Probably does not harm as that directory is probably empty, but still
should not be there.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Ilsi/0vOxQ+fn9lZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCH3RIACgkQN1Ujt2V2gBzldwCff7J4nbIalquQEReyn8liog6n
Ab8An32p73wtsHby8IaVIyMYX8EMxIEN
=nmpN
-----END PGP SIGNATURE-----

--Ilsi/0vOxQ+fn9lZ--
