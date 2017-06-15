Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38CC3783A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B6D3A184F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:41:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id pnVRF6xYJrLU
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:41:28 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id CB2B81823F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:41:28 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2EB71E076
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:41:28 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A82941E060
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:41:28 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:41:28 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 9CD5CF02
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:41:28 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 15 Jun 2017 17:41:28 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Thu, 15 Jun 2017 17:41:28 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCHv2 00/11] More fixes for file dependency
	generation	with RPM
Thread-Index: AQHS5e1oifhSh/csI0+OqJO1cWK/sqImDyXQ
Date: Thu, 15 Jun 2017 15:41:28 +0000
Message-ID: <4bc9ccfc1adc4f53838ddbb760bac8f8@XBOX02.axis.com>
References: <cover.1497540930.git.pkj@axis.com>
In-Reply-To: <cover.1497540930.git.pkj@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCHv2 00/11] More fixes for file dependency generation	with RPM
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
X-List-Received-Date: Thu, 15 Jun 2017 15:41:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Bah, forgot to add:

Changed in PATCHv2:
* Removal of git cvsserver and git svn from git-perltools are now=20
  controlled by PACKAGECONFIGs.

//Peter

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Peter Kjellerstedt
> Sent: den 15 juni 2017 17:38
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCHv2 00/11] More fixes for file dependency
> generation with RPM
>=20
> This is the second take on restoring the file dependency support for
> RPM that was lost in Pyro. These changes should fix most (all?)
> problems that were seen on the autobuilders after the first set of
> changes were introduced.
>=20
> The first patch is not strictly needed for this, but it fixes a build
> problem due to a renamed file in a patch file that I got when building
> core-image-sato. No idea why no one else has had problems with this...
>=20
> //Peter
>=20
> The following changes since commit
> 2bf2ab9fcd12b179c396d2d4b4603b774a37eef6:
>=20
>   bitbake: bitbake-user-manual: Updated BBLAYERS_FETCH_DIR variable
> description (2017-06-15 11:15:59 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib pkj/rpm_regressions2
>   http://git.yoctoproject.org/cgit.cgi/poky-
> contrib/log/?h=3Dpkj/rpm_regressions2
>=20
> Peter Kjellerstedt (11):
>   gtk+3: Update the patches to work without PATCHTOOL =3D "git"
>   perl: Do not generate file dependencies for perl-ptest
>   rpm: Add dependencies on bash, perl and python3-core
>   linux-firmware: Avoid a dependency on python-core
>   texi2html: Add a dependency on perl
>   git: Add a dependency on perl for gitweb
>   git: Do not install git cvsserver and git svn by default
>   texinfo: Avoid a problem with a dependency on
> perl(Locale::gettext_xs)
>   package_rpm.bbclass: Filter out unwanted file deps for nativesdk
>     packages
>   insane.bbclass: Ignore perl as dependency for nativesdk packages
>   package.bbclass: Restore functionality to detect RPM dependencies
>=20
>  meta/classes/insane.bbclass                        |   2 +-
>  meta/classes/package.bbclass                       |   5 +-
>  meta/classes/package_rpm.bbclass                   |  25 +-
>  meta/lib/oe/package.py                             |  60 +++--
>  meta/recipes-devtools/git/git.inc                  |  23 +-
>  meta/recipes-devtools/perl/perl-ptest.inc          |   4 +
>  meta/recipes-devtools/rpm/rpm_git.bb               |   5 +
>  meta/recipes-extended/texi2html/texi2html_5.0.bb   |   2 +
>  meta/recipes-extended/texinfo/texinfo_6.3.bb       |   6 +
>  .../gtk+/gtk+3/0001-Hardcoded-libtool.patch        |  12 +-
>  ...Do-not-try-to-initialize-GL-without-libGL.patch |   8 +-
>  .../0003-Add-disable-opengl-configure-option.patch | 268
> +++++++++++++++------
>  ...4-configure.ac-Fix-wayland-protocols-path.patch |   8 +-
>  .../linux-firmware/linux-firmware_git.bb           |   3 +
>  14 files changed, 317 insertions(+), 114 deletions(-)
>=20
> --
> 2.12.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

