Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QbZjo-0000IM-Uj
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 16:58:05 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2011 07:54:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,437,1304319600"; d="scan'208";a="19765515"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2011 07:54:21 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 28 Jun 2011 22:52:06 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 28 Jun 2011 22:52:05 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Tue, 28 Jun 2011 22:52:04 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jun 2011 22:52:03 +0800
Thread-Topic: [OE-core] [PATCH 1/1] base.bbclass: show layer's
	branches/revisions in the banner info
Thread-Index: Acw1n5lBgh1MMbsbRrelLcX1JqtltAAAXkMg
Message-ID: <1865303E0DED764181A9D882DEF65FB6A167F0C715@shsmsx502.ccr.corp.intel.com>
References: <cover.1309239001.git.dexuan.cui@intel.com>
	<674a391015f3cdebe891ae7e8439aea48698982e.1309239001.git.dexuan.cui@intel.com>
	<3819C41B-FF96-45FD-8265-8EFC9F73E771@dominion.thruhere.net>
	<4E09E4E6.9040703@windriver.com>
In-Reply-To: <4E09E4E6.9040703@windriver.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: 'Paul Eggleton' <paul.eggleton@linux.intel.com>,
	'Koen Kooi' <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] base.bbclass: show layer's	branches/revisions in the banner info
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
X-List-Received-Date: Tue, 28 Jun 2011 14:58:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Mark Hatle wrote:
> On 6/28/11 1:45 AM, Koen Kooi wrote:
>>=20
>> Op 28 jun 2011, om 07:37 heeft Dexuan Cui het volgende geschreven:
>>=20
>> .......
>> So it works as expected, but the output is a bit confusing. I have a
>> few (conflicting) suggestions:=20
>>=20
>> 1) replace _BRANCH and _REVISION with ' branch' and ' revision',
>> e.g.:=20
>>=20
>> 	meta-archos branch          =3D "master"
>> 	meta-archos revision        =3D
>> "413933fb5f62574e38a9a1e38905ba6e9c1be4ad"=20
>>=20
>> 2) for the extra layers put branch and revision on a single line:
>>=20
>> 	meta-archos          =3D
>> "master/413933fb5f62574e38a9a1e38905ba6e9c1be4ad"=20
>>=20
>> 3) Move the revision info down, e..g
>>=20
>> OE Build Configuration:
>> BB_VERSION                  =3D "1.13.1"
>> TARGET_ARCH                 =3D "arm"
>> TARGET_OS                   =3D "linux-gnueabi"
>> MACHINE                     =3D "beagleboard"
>> DISTRO                      =3D "angstrom"
>> DISTRO_VERSION              =3D "v2011.06-core"
>> TARGET_FPU                  =3D "hard"
>> METADATA_BRANCH             =3D "master"
>> METADATA_REVISION           =3D
>> "364ca0d2d0399c8cc6d3b3fc28308e1e14673544"=20
>> meta-angstrom_BRANCH        =3D "master"
>> meta-angstrom_REVISION      =3D
>> "c19c342c62416752117c2dce4696840bc864f647"=20
>>=20
>> etc.
>>=20
>> What do you think about that?
>=20
> I think my preference is either 3 or a combination of 2 & 3.
>=20
> To me the important bits are the configuration settings, followed by
> the components that are being used as a secondary concern.  It will
> all help in debugging and issue, but if the target/distro isn't
> correct then it doesn't matter what the rest is.
>=20
> --Mark
>=20

Hi, thank you very much for the suggestions!
I worked out a vesion 2 patch that combines 2 and 3:
http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/banner=
_v2&id=3D2c2d9d7c0e942b6748bc8bd7d5980113bae9a836

Please note I use a colon mark rather than a slash mark for better readabab=
ility since a branch name can contain colon.

An output result in my side is:
OE Build Configuration:
BB_VERSION                  =3D "1.13.1"
TARGET_ARCH                 =3D "i586"
TARGET_OS                   =3D "linux"
MACHINE                     =3D "qemux86"
DISTRO                      =3D "poky"
DISTRO_VERSION              =3D "1.0+snapshot-20110628"
TARGET_FPU                  =3D ""
METADATA_BRANCH             =3D "dcui/banner_v2"
METADATA_REVISION           =3D "2c2d9d7c0e942b6748bc8bd7d5980113bae9a836"
meta-sugarbay               =3D "dcui/test1:76d1178ba1a43cf6457c89717134aeb=
9f1275fae"

Please let me know if this new output looks ok.

BTW,  Koen, even with this v2 patch, the list looks still pretty long in yo=
ur side.
I noticed there are some layers with the same revision: e.g.,=20
meta-htc_REVISION           =3D "f37d05ca7450f85642cea0e43a75df10663bd8f6"
meta-nokia_BRANCH           =3D "master"
meta-nokia_REVISION         =3D "f37d05ca7450f85642cea0e43a75df10663bd8f6"
meta-openmoko_BRANCH        =3D "master"
meta-openmoko_REVISION      =3D "f37d05ca7450f85642cea0e43a75df10663bd8f6"
meta-palm_BRANCH            =3D "master"
meta-palm_REVISION          =3D "f37d05ca7450f85642cea0e43a75df10663bd8f6"
meta-zaurus_BRANCH          =3D "master"
meta-zaurus_REVISION        =3D "f37d05ca7450f85642cea0e43a75df10663bd8f6"

I guess they actually belong to the same repo.
In this case, maybe we can further improve the output format to:
meta-htc,nokia,openmoko,palm,zaurus:f37d05ca7450f85642cea0e43a75df10663bd8f=
6 ?

Thanks,
-- Dexuan=


