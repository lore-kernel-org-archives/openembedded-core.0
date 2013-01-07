Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TsApo-0002Fk-EP for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 12:25:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07BAS68003891;
	Mon, 7 Jan 2013 11:10:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32506-08; Mon,  7 Jan 2013 11:10:23 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07BAJUh003885
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 7 Jan 2013 11:10:21 GMT
Message-ID: <1357557021.28649.228.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 07 Jan 2013 11:10:21 +0000
In-Reply-To: <cover.1357366840.git.sgw@linux.intel.com>
References: <cover.1357366840.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	r07BAS68003891
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (V2) 00/35] Updates, Multilib Patches and other fixes
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
X-List-Received-Date: Mon, 07 Jan 2013 11:25:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-01-04 at 22:22 -0800, Saul Wold wrote:
> Richard,
>=20
> Finally another collected set of patches, my network access
> was worse than I thought it would be the last few days.
>=20
> I built these locally.
>=20
> Thanks
> 	Sau!
>=20
> The following changes since commit b693f6d3d48b281fbbf71fd56996c85e23c3=
a9c9:
>=20
>   freetype: update to 2.4.11 which includes fixes for CVE-2012-{5668, 5=
669, 5670} (2012-12-31 09:42:49 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?=
h=3Dsgw/stage
>=20
> Chen Qi (1):
>   init-live.sh: avoid duplicate mount points for the same filesystem
>=20
> Christopher Larson (6):
>   update-alternatives.bbclass: use absolute paths for link targets
>   opkg-native: obey virtual/update-alternatives-native
>   chkconfig: don't inherit autotools
>   chkconfig: obey sysconfdir, base_libdir
>   chkconfig: package the update-alternatives implementation
>   chkconfig-alternatives-native-1.3.59: add recipe
>=20
> Constantin Musca (8):
>   libpam: enable multilib
>   package.bbclass: don't prepend MLPREFIX to LOCALEBASEPN
>   eglibc-locale: enable multilib
>   sysstat: fix sa_lib_dir
>   rpm: replace /usr/lib with ${libdir}
>   libfm: upgrade to 1.1.0
>   pcmanfm: upgrade to 1.1.0
>   vte: add missing unpackaged files
>=20
> David Nystr=C3=B6m (1):
>   Added ability to parse python sources to create-recipe
>=20
> Kang Kai (4):
>   autoconf: update RDEDENDS
>   perl: add sub-package perl-tests
>   perl: update RPROVIDES and popuate_package script
>   perl: update dependency creating script
>=20
> Laurentiu Palcu (1):
>   pango: have postinstalls run at do_rootfs time
>=20
> Marko Lindqvist (7):
>   automake: update to upstream version 1.12.6
>   gmp: update SRC_URI and HOMEPAGE
>   gmp: update to upstream version 5.1.0
>   mpfr: update to upstream version 3.1.1
>   icu: update to upstream version 50.1.1
>   harfbuzz: add recipe, version 0.9.9
>   pango: update to upstream version 1.32.5
>=20
> Martin Jansa (1):
>   kernel.bbclass: include PE in KERNEL_IMAGE_BASE_NAME
>=20
> Noor Ahsan (1):
>   cairo: Adds libxext in X11DEPENDS.
>=20
> Robert P. J. Day (2):
>   lib_package.bbclass: Correct comment referring to bin directories.
>   package.bbclass: Skip testing "packages" a second time.
>=20
> Saul Wold (3):
>   libnl: Update to 3.2.16
>   glib-2.0: Update to 2.35.3
>   glib-networking: Update to 2.35.1

Merged, apart from harfbuzz, pango, glib and glib-networking changes as
per the feedback on list.

Cheers,

Richard



