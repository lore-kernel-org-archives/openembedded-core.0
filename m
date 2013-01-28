Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tzo2R-000609-HY for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 13:42:23 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0SCUvIu028229; Mon, 28 Jan 2013 12:30:58 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fOnOvvTcT86U; Mon, 28 Jan 2013 12:30:57 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0SCUolw028220
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 28 Jan 2013 12:30:53 GMT
Message-ID: <1359375973.22371.49.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 28 Jan 2013 12:26:13 +0000
In-Reply-To: <cover.1359364363.git.sgw@linux.intel.com>
References: <cover.1359364363.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r0SCUvIu028229
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/33] Systemd Update along with other Updates
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
X-List-Received-Date: Mon, 28 Jan 2013 12:42:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2013-01-28 at 01:20 -0800, Saul Wold wrote:
> *** BLURB HERE ***
> The following changes since commit ab692ed618f83df2ce452769165314e70b86=
7345:
>=20
>   gettext: Fix build with uclibc remove upstreamed patches (2013-01-27 =
13:52:49 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?=
h=3Dsgw/stage
>=20
> Andreas M=C3=BCller (2):
>   buildhistory.bbclass: track also complementary package information
>   package.bbclass: remove RRECOMMENDS on base packages for locale
>     packages
>=20
> Chen Qi (1):
>   sysvinit & initscripts: use update-rc.d
>=20
> Cristian Iorga (1):
>   alsa-utils: upgrade to 1.0.26
>=20
> Frans Meulenbroeks (1):
>   mtd-utils: split into multiple packages
>=20
> Hongxu Jia (2):
>   gtk-icon-cache.bbclass:fix support postrm at image creation time
>   gtk-immodules-cache.bbclass:fix support postrm at image creation time
>=20
> Khem Raj (7):
>   eglibc: Upgrade recipes 2.16 -> 2.17
>   eglibc_2.17: Fix Tibetian locale generation error
>   eglibc: Backport upstream 2.17 patches
>   rpcbind: Dont use nss with uclibc

This is updated in Khem's branch

>   quota: inherit gettext
>   icu: Fix build on uclibc
>   systemd: Upgrade to 197
>=20
> Marcin Juszkiewicz (1):
>   xorg-minimal-fonts: depend on font-alias instead of shipping
>     fonts.alias
>=20
> Martin Jansa (2):
>   license.bbclass: extract functionality to find license files to
>     separate function
>   license.bbclass: package license texts to PN-lic when
>     LICENSE_CREATE_PACKAGE is enabled
>=20
> Radu Moisan (1):
>   valgrind: update to 3.8.1
>=20
> Richard Purdie (1):
>   sanity.bbclass: Ensure tmpdir exists when running the check

This is a rebase artefact. Please drop it. In future it might pay to
read through these before you send them as these kind of artefacts keep
creeping in :(

> Riku Voipio (1):
>   libaio: add aarch64 support
>=20
> Saul Wold (12):
>   libnl: Update to 3.2.19
>   rgb: Update to 1.0.5
>   sysstat: Update to 10.1.3
>   mc: Update to 4.8.7
>   man-pages: Update to 3.45
>   libidn: Update to 1.26
>   cracklib: Update to 2.8.22
>   file: Update to 5.12
>   dhcp: Update to 4.2.5
>   util-linux: Update to 2.22.2
>   resolvconf: Update to 1.69
>   libcgroup: Update to 0.38
>=20
> Xin Ouyang (1):
>   libcgroup: fix the QA issue for pam_cgroup.so*

Cheers,

Richard



