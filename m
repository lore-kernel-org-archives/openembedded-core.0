Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 91AD365E69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 14:40:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Apr 2014 07:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,944,1389772800"; d="scan'208";a="529865571"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga002.fm.intel.com with ESMTP; 28 Apr 2014 07:40:47 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.70]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.173]) with mapi id
	14.03.0123.003; Mon, 28 Apr 2014 15:40:32 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [OE-core] [PATCH] xdg-utils: upgrade to 1.1.0-rc1
Thread-Index: AQHPYu3PQKx/KOnRKkuGuMxxFHoij5snGI6Q
Date: Mon, 28 Apr 2014 14:40:31 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1CEA2F51@IRSMSX105.ger.corp.intel.com>
References: <1373547110-11539-1-git-send-email-cristian.iorga@intel.com>
	<4087F39D-2252-47C8-B596-81648E6C08FD@dominion.thruhere.net>
In-Reply-To: <4087F39D-2252-47C8-B596-81648E6C08FD@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xdg-utils: upgrade to 1.1.0-rc1
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
X-List-Received-Date: Mon, 28 Apr 2014 14:40:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Koen,

Care to go into details why exactly the version is wrong?
In YP Dev Manual, my recipe is given as an example of correct naming:
http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#new-rec=
ipe-storing-and-naming-the-recipe
Quote:
"Naming Your Recipe: When you name your recipe, you need to follow this nam=
ing convention:

     <basename>_<version>.bb
                   =20

Use lower-cased characters and do not include the reserved suffixes -native=
, -cross, -initial, or -dev casually (i.e. do not use them as part of your =
recipe name unless the string applies). Here are some examples:

     cups_1.7.0.bb
     gawk_4.0.2.bb
     xdg-utils_1.1.0-rc1.bb"

Also, in meta-openembedded, I found several recipes following the same patt=
ern, i.e. fim and irssi packages.

Regards,
Cristian
YP
Intel Corporation

-----Original Message-----
From: Koen Kooi [mailto:koen@dominion.thruhere.net]=20
Sent: Monday, April 28, 2014 5:26 PM
To: Iorga, Cristian
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] xdg-utils: upgrade to 1.1.0-rc1


Op 11 jul. 2013, om 14:51 heeft Cristian Iorga <cristian.iorga@intel.com> h=
et volgende geschreven:

> This version of xdg-utils is needed by BA in order to associate=20
> correctly types of files with PCManFM file manager.
> The release cycle of xdg-utils is very slow, so this is the best shot=20
> of a stable version available for YP 1.5 release.
> As a reference, the previous stable version was released in 2007.
> Also, desktop Linux distros use this release candidate as a stable=20
> version, for example, Ubuntu 12.04.
>=20
> Part of the implementation of [YOCTO #2370].
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
> .../xdg-utils/{xdg-utils_1.0.2.bb =3D> xdg-utils_1.1.0-rc1.bb}  |    9 ++=
++-----
> 1 file changed, 4 insertions(+), 5 deletions(-) rename=20
> meta/recipes-extended/xdg-utils/{xdg-utils_1.0.2.bb =3D>=20
> xdg-utils_1.1.0-rc1.bb} (80%)

This has been in OE-core for a while, but I do have to point out that it vi=
olates the version policy, it should be: 1.0.2+1.1.0-rc1

