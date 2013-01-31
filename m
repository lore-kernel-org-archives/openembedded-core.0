Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0umG-0003KY-0Y
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 15:06:17 +0100
Received: by mail-pb0-f50.google.com with SMTP id ro8so1623942pbb.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 05:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=/KVk+eOJ/9PRe7sw5wgkxzbo+Hxz4e/ztcOfUEPqyfc=;
	b=03mFEPGEVRM+Sh2F/b9Jdjy24FxYFdPDqLID0x6TY4O8vpDM1HMiJCgE+CIOMBQPLw
	NPN6B26h9ZgNIXx7H9YBWI6VORnsi9eZcTaEUJxaAZlo+VsVJkN2wG+oqDHuwhVnVvRO
	u3kT/Fh3R8BhkkjgkqRc/edjlD1tIQ6zWc1v58LERMhQeM+BD405Y9o4YtarTRm0duEk
	40We+0Y1Qh23JTlThulZfjCvlUdnOR82aKZzkmS7lxXlAfpCKipZFf5etZYJLFRwSV0c
	+nTPdL3Oe9X2GVKQI5NBv8DBhebYNbTq+W2tylpcTubXagUIU8hQO8qNJc0J3oeZiPbr
	OXXA==
X-Received: by 10.66.81.198 with SMTP id c6mr20776716pay.50.1359640224708;
	Thu, 31 Jan 2013 05:50:24 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id m3sm5671898pav.4.2013.01.31.05.50.21
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 05:50:23 -0800 (PST)
Date: Thu, 31 Jan 2013 14:50:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130131135020.GD2102@jama.dyndns-home.com>
References: <alpine.DEB.2.02.1301310531510.22001@oneiric>
	<20130131131021.6d5ffccd@e6520eb>
	<alpine.DEB.2.02.1301310711320.6796@oneiric>
	<20130131123847.GC2102@jama.dyndns-home.com>
	<alpine.DEB.2.02.1301310834500.31170@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1301310834500.31170@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: BB_SRCREV_POLICY doesn't seem to work
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
X-List-Received-Date: Thu, 31 Jan 2013 14:06:32 -0000
X-Groupsio-MsgNum: 34753
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="48TaNjbzBVislYPb"
Content-Disposition: inline

--48TaNjbzBVislYPb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2013 at 08:43:13AM -0500, Robert P. J. Day wrote:
> On Thu, 31 Jan 2013, Martin Jansa wrote:
>=20
>   ok, there's still an issue here that crops up during the *build*.
> after i did all the SRCREV caching, i could "fetchall" without network
> access so that part works fine.  then i started the build -- again,
> without network access since, theoretically, i don't need it, right?
> however:
>=20
> ERROR: Function failed: Network access disabled through BB_NO_NETWORK
> but access requested with command git ls-remote
> git://arago-project.org/git/projects/linux-davinci.git
> v2.6.37_DAVINCIPSP_03.21.00.04 (for url None)
> ERROR: Logfile of failure stored in:
> /home/rpjday/oe/builds/ti/am1808/tmp-eglibc/work/am180x_evm-oe-linux-gnue=
abi/linux-omapl138-psp/2.6.37-r0/temp/log.do_unpack.20808
> ERROR: Task 631
> (/home/rpjday/oe/dist/layers/meta-ti/recipes-kernel/linux/linux-omapl138-=
psp_2.6.37.bb,
> do_unpack) failed with exit code '1'

Have you tried to set
BB_FETCH_PREMIRRORONLY
?

>=20
>   here's the relevant excerpt from that meta-ti recipe file:
>=20
> =3D=3D=3D start
>=20
> BRANCH =3D "03.21.00.03"
> SRCREV =3D "v2.6.37_DAVINCIPSP_03.21.00.04"
>=20
> COMPATIBLE_MACHINE =3D "(omapl138)"
>=20
> SRC_URI +=3D "git://arago-project.org/git/projects/linux-davinci.git;prot=
ocol=3Dgit;branch=3D${BRANCH} \
>         file://defconfig"
>=20
> =3D=3D=3D end
>=20
>   i thought my combination of SRCREV_POLICY and "fetchall" should have
> guaranteed that i had all necessary source for my build locally.  why
> is bitbake trying to access the network again?  the only thing that
> strikes me as unusual about that recipe is it's the only one i recall
> that uses a non-master branch, could that possibly have any effect?
>=20
>   am i just misunderstanding something?  i'm after whatever it takes
> to absolutely guarantee that i have all source required for a build
> locally so that i can disconnect the network before starting the
> build.
>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--48TaNjbzBVislYPb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEKdpwACgkQN1Ujt2V2gBwtJACgrq90OY2NMOBBePUwceLi/SCi
0gUAmwR/7HZuPNeNoMwhU4ZR8jz8Cu3u
=LnmV
-----END PGP SIGNATURE-----

--48TaNjbzBVislYPb--
