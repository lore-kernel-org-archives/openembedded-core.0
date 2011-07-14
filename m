Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QhFlv-0003b5-Gd
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 08:51:43 +0200
Received: by wwi14 with SMTP id 14so223560wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 23:47:44 -0700 (PDT)
Received: by 10.216.132.129 with SMTP id o1mr5730865wei.73.1310626064108;
	Wed, 13 Jul 2011 23:47:44 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m35sm4415781weq.36.2011.07.13.23.47.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jul 2011 23:47:43 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1310625080-30964-1-git-send-email-raj.khem@gmail.com>
Date: Thu, 14 Jul 2011 08:47:36 +0200
Message-Id: <7F425BAC-8BED-4312-B341-0B9D926A61D5@dominion.thruhere.net>
References: <1310625080-30964-1-git-send-email-raj.khem@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] package_ipk: add License field to control file
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
X-List-Received-Date: Thu, 14 Jul 2011 06:51:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

While we're at it, how about this one as well:

------>8----------------
commit 6ae45bbf2b5ca9e4fd7e8b04e461f0bf120dd44d
Author: Koen Kooi <koen.kooi@gmail.com>
Date:   Tue Dec 21 18:06:06 2010 +0000

    package ipk bbclass: store build branch and revision in ipkg =
metadata
   =20
    The ipkg metadata will look like this now:
   =20
    koen@dominion:/OE/angstrom-dev/deploy/glibc$ dpkg-deb -I =
ipk/am3517-evm/matrix-gui_1.3-r19.0.6_am3517-evm.ipk
     new debian package, version 2.0.
     size 24112 bytes: control archive=3D 540 bytes.
         629 bytes,    13 lines      control
     Package: matrix-gui
     Version: 1.3-r19.0.6
     Description: Matrix GUI for Qt X11
     Section: multimedia
     Priority: optional
     Maintainer: Angstrom Developers =
<angstrom-distro-devel@linuxtogo.org>
     License: BSD
     Architecture: am3517-evm
     OE: matrix-gui
     Homepage: https://gforge.ti.com/gf/project/matrix_gui/
     Build: org.openembedded.dev/f35ab2d
     Depends: matrix-gui-common, libpng12-0, libfreetype6, libz1, =
libgthread-2.0-0, libqtwebkit4, libphonon4, libqtdbus4, libqtxml4, =
libqtgui4, libqtnetwork4, libqtcore4, libglib-2.0-0, libc6, libstdc++
     Source: =
svn://gforge.ti.com/svn/matrix_gui/;module=3Dtrunk;proto=3Dhttps;user=3Dan=
onymous;pswd=3D''
    koen@dominion:/OE/angstrom-dev/deploy/glibc$
   =20
    Signed-off-by: Koen Kooi <koen@openembedded.org>
    Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
    Acked-by: Chase Maupin <chase.maupin@ti.com>
------8<----------------

Having some info on the oe-core revision (and branch) would be usefull.

Op 14 jul 2011, om 08:31 heeft Khem Raj het volgende geschreven:

> From: Koen Kooi <koen@openembedded.org>
>=20
> Port of oe.dev Revision e35d1ffad1553f259b084578992f15d10f590f98
>=20
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> Signed-off-by: Khem Raj <raj.khem@gmail.org>
> ---
> meta/classes/package_ipk.bbclass |    1 +
> 1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/classes/package_ipk.bbclass =
b/meta/classes/package_ipk.bbclass
> index 4317028..0c0f00d 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -263,6 +263,7 @@ python do_package_ipk () {
> 		fields.append(["Section: %s\n", ['SECTION']])
> 		fields.append(["Priority: %s\n", ['PRIORITY']])
> 		fields.append(["Maintainer: %s\n", ['MAINTAINER']])
> +		fields.append(["License: %s\n", ['LICENSE']])
> 		fields.append(["Architecture: %s\n", ['PACKAGE_ARCH']])
> 		fields.append(["OE: %s\n", ['PN']])
> 		fields.append(["Homepage: %s\n", ['HOMEPAGE']])
> --=20
> 1.7.4.1
>=20



