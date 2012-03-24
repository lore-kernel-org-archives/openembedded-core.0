Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SBMJS-0007WN-Sp
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 09:27:03 +0100
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id CDDEBA6286
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 09:18:03 +0100 (CET)
Date: Sat, 24 Mar 2012 09:18:03 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120324091803.4b1fe761@eb-e6520>
In-Reply-To: <1332557774.1849.34.camel@dongxiao-osel>
References: <1332557774.1849.34.camel@dongxiao-osel>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: TMPDIR while building OE-Core
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
X-List-Received-Date: Sat, 24 Mar 2012 08:27:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Le Sat, 24 Mar 2012 10:56:14 +0800,
"Xu, Dongxiao" <dongxiao.xu@intel.com> a =E9crit :
> While building the pure OE-Core, I found there are two TMPDIRs, one is
> tmp-eglibc, another is tmp-eglibc-eglibc, any reason that make this
> result? My local.conf is like:
>=20
> BB_NUMBER_THREADS =3D "8"
> PARALLEL_MAKE =3D "-j 8"
> MACHINE ??=3D "qemuarm"
> PACKAGE_CLASSES ?=3D "package_rpm"
> EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> USER_CLASSES ?=3D "buildstats image-mklibs image-prelink"
> PATCHRESOLVE =3D "noop"
> CONF_VERSION =3D "1"
>=20
reported here :
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2167

Eric


