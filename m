Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SwAu1-0002XC-FY
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 13:46:17 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 31 Jul 2012 04:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128792734"
Received: from unknown (HELO helios.localnet) ([10.252.121.64])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Jul 2012 04:34:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Tue, 31 Jul 2012 12:34:38 +0100
Message-ID: <6342897.AO57iOdh1z@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <13577594.8MC7hXZgZN@helios>
References: <CALbNGRR4weykX9t_XwJ6ACVoXS2SbogcxXLPAj7vpAC2+AQpww@mail.gmail.com>
	<CALbNGRQq9VjWZ1NqKYfE33U=fe9XxK5yeyF9JVNFZJzzgwvj0w@mail.gmail.com>
	<13577594.8MC7hXZgZN@helios>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: do_rootfs fails
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
X-List-Received-Date: Tue, 31 Jul 2012 11:46:17 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tuesday 31 July 2012 12:21:21 Paul Eggleton wrote:
> On Tuesday 31 July 2012 13:01:26 Andreas M=FCller wrote:
> > Thanks that fixes first part but I still get
> >=20
> > |  * satisfy_dependencies_for: Cannot satisfy the following
> >=20
> > dependencies for gcc-runtime-locale-fr:
> > |  * =09gcc-runtime *
> > |  * opkg_install_cmd: Cannot install package gcc-runtime-locale-fr=
.
> > |  * satisfy_dependencies_for: Cannot satisfy the following
> >=20
> > dependencies for gcc-runtime-locale-de:
> > |  * =09gcc-runtime *
> > |  * opkg_install_cmd: Cannot install package gcc-runtime-locale-de=
.
> > |=20
> > | ERROR: Function failed: do_rootfs (see
> >=20
> > /home/andreas/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/=
xfce-fu
> > ll -image-1.0-r0/temp/log.do_rootfs.18542 for further informatio
> >=20
> > since I don't have gcc-runtime package
>=20
> Unfortunately we have exposed a weakness - package.bbclass does not
> currently handle when ${PN} is removed from PACKAGES and locale packa=
ges
> are still split out - the (invalid) RDEPENDS on ${PN} still gets adde=
d.
>=20
> I am testing a fix at the moment.

Fix worked for gcc-runtime and did not produce any changes with buildhi=
story=20
in other locale-producing packages, so I have just posted it.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


