Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A0D4F65E7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 14:50:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Apr 2014 07:45:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,944,1389772800"; d="scan'208";a="530971579"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga002.jf.intel.com with ESMTP; 28 Apr 2014 07:50:41 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 28 Apr 2014 15:49:32 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.70]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.128]) with mapi id
	14.03.0123.003; Mon, 28 Apr 2014 15:49:32 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [OE-core] [PATCH] xdg-utils: upgrade to 1.1.0-rc1
Thread-Index: AQHPYu3PQKx/KOnRKkuGuMxxFHoij5snGI6Q///xtgCAABHg0A==
Date: Mon, 28 Apr 2014 14:49:32 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1CEA2F84@IRSMSX105.ger.corp.intel.com>
References: <1373547110-11539-1-git-send-email-cristian.iorga@intel.com>
	<4087F39D-2252-47C8-B596-81648E6C08FD@dominion.thruhere.net>
	<969F26A8BAB325438E7EB80D3C3134FB1CEA2F51@IRSMSX105.ger.corp.intel.com>
	<1A02AEF1-091C-4766-9C84-34DDC0AC5FBD@dominion.thruhere.net>
In-Reply-To: <1A02AEF1-091C-4766-9C84-34DDC0AC5FBD@dominion.thruhere.net>
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
X-List-Received-Date: Mon, 28 Apr 2014 14:50:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Will do, thanks for the context.

-----Original Message-----
From: Koen Kooi [mailto:koen@dominion.thruhere.net]=20
Sent: Monday, April 28, 2014 5:45 PM
To: Iorga, Cristian
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] xdg-utils: upgrade to 1.1.0-rc1


Op 28 apr. 2014, om 16:40 heeft Iorga, Cristian <cristian.iorga@intel.com> =
het volgende geschreven:

> Hello Koen,
>=20
> Care to go into details why exactly the version is wrong?

http://www.openembedded.org/wiki/Versioning_Policy

> In YP Dev Manual, my recipe is given as an example of correct naming:
> http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#ne
> w-recipe-storing-and-naming-the-recipe
> Quote:
> "Naming Your Recipe: When you name your recipe, you need to follow this n=
aming convention:
>=20
>     <basename>_<version>.bb
>=20
>=20
> Use lower-cased characters and do not include the reserved suffixes -nati=
ve, -cross, -initial, or -dev casually (i.e. do not use them as part of you=
r recipe name unless the string applies). Here are some examples:
>=20
>     cups_1.7.0.bb
>     gawk_4.0.2.bb
>     xdg-utils_1.1.0-rc1.bb"

And that's why I only read OE policy docs when working on OE.

> Also, in meta-openembedded, I found several recipes following the same pa=
ttern, i.e. fim and irssi packages.

koen@beast:/build/v2014.06/sources/meta-openembedded$ grep PV ./meta-oe/rec=
ipes-connectivity/irssi/irssi_0.8.16-rc1.bb
REALPV =3D "0.8.16-rc1"
PV =3D "0.8.15+${REALPV}"
SRC_URI =3D "http://irssi.org/files/irssi-${REALPV}.tar.gz"
S =3D "${WORKDIR}/irssi-${REALPV}"

But 'fim' violates versioning policy as well.


>=20
> Regards,
> Cristian
> YP
> Intel Corporation
>=20
> -----Original Message-----
> From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> Sent: Monday, April 28, 2014 5:26 PM
> To: Iorga, Cristian
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] xdg-utils: upgrade to 1.1.0-rc1
>=20
>=20
> Op 11 jul. 2013, om 14:51 heeft Cristian Iorga <cristian.iorga@intel.com>=
 het volgende geschreven:
>=20
>> This version of xdg-utils is needed by BA in order to associate=20
>> correctly types of files with PCManFM file manager.
>> The release cycle of xdg-utils is very slow, so this is the best shot=20
>> of a stable version available for YP 1.5 release.
>> As a reference, the previous stable version was released in 2007.
>> Also, desktop Linux distros use this release candidate as a stable=20
>> version, for example, Ubuntu 12.04.
>>=20
>> Part of the implementation of [YOCTO #2370].
>>=20
>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>> ---
>> .../xdg-utils/{xdg-utils_1.0.2.bb =3D> xdg-utils_1.1.0-rc1.bb}  |    9 +=
+++-----
>> 1 file changed, 4 insertions(+), 5 deletions(-) rename=20
>> meta/recipes-extended/xdg-utils/{xdg-utils_1.0.2.bb =3D>=20
>> xdg-utils_1.1.0-rc1.bb} (80%)
>=20
> This has been in OE-core for a while, but I do have to point out that=20
> it violates the version policy, it should be: 1.0.2+1.1.0-rc1
>=20


