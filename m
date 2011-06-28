Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbZzp-0001AC-2X
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 17:14:37 +0200
Received: by wwi14 with SMTP id 14so3014257wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 08:10:55 -0700 (PDT)
Received: by 10.216.238.3 with SMTP id z3mr603269weq.86.1309273855667;
	Tue, 28 Jun 2011 08:10:55 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w8sm172627wec.24.2011.06.28.08.10.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 08:10:54 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6A167F0C715@shsmsx502.ccr.corp.intel.com>
Date: Tue, 28 Jun 2011 17:10:52 +0200
Message-Id: <B2EC960E-7F9F-49BB-BFB0-18C98A7FDE12@dominion.thruhere.net>
References: <cover.1309239001.git.dexuan.cui@intel.com>
	<674a391015f3cdebe891ae7e8439aea48698982e.1309239001.git.dexuan.cui@intel.com>
	<3819C41B-FF96-45FD-8265-8EFC9F73E771@dominion.thruhere.net>
	<4E09E4E6.9040703@windriver.com>
	<1865303E0DED764181A9D882DEF65FB6A167F0C715@shsmsx502.ccr.corp.intel.com>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: 'Paul Eggleton' <paul.eggleton@linux.intel.com>,
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] base.bbclass: show layer's branches/revisions in the banner info
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
X-List-Received-Date: Tue, 28 Jun 2011 15:14:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jun 2011, om 16:52 heeft Cui, Dexuan het volgende geschreven:

> Mark Hatle wrote:
>> On 6/28/11 1:45 AM, Koen Kooi wrote:
>>>=20
>>> Op 28 jun 2011, om 07:37 heeft Dexuan Cui het volgende geschreven:
>>>=20
>>> .......
>>> So it works as expected, but the output is a bit confusing. I have a
>>> few (conflicting) suggestions:=20
>>>=20
>>> 1) replace _BRANCH and _REVISION with ' branch' and ' revision',
>>> e.g.:=20
>>>=20
>>> 	meta-archos branch          =3D "master"
>>> 	meta-archos revision        =3D
>>> "413933fb5f62574e38a9a1e38905ba6e9c1be4ad"=20
>>>=20
>>> 2) for the extra layers put branch and revision on a single line:
>>>=20
>>> 	meta-archos          =3D
>>> "master/413933fb5f62574e38a9a1e38905ba6e9c1be4ad"=20
>>>=20
>>> 3) Move the revision info down, e..g
>>>=20
>>> OE Build Configuration:
>>> BB_VERSION                  =3D "1.13.1"
>>> TARGET_ARCH                 =3D "arm"
>>> TARGET_OS                   =3D "linux-gnueabi"
>>> MACHINE                     =3D "beagleboard"
>>> DISTRO                      =3D "angstrom"
>>> DISTRO_VERSION              =3D "v2011.06-core"
>>> TARGET_FPU                  =3D "hard"
>>> METADATA_BRANCH             =3D "master"
>>> METADATA_REVISION           =3D
>>> "364ca0d2d0399c8cc6d3b3fc28308e1e14673544"=20
>>> meta-angstrom_BRANCH        =3D "master"
>>> meta-angstrom_REVISION      =3D
>>> "c19c342c62416752117c2dce4696840bc864f647"=20
>>>=20
>>> etc.
>>>=20
>>> What do you think about that?
>>=20
>> I think my preference is either 3 or a combination of 2 & 3.
>>=20
>> To me the important bits are the configuration settings, followed by
>> the components that are being used as a secondary concern.  It will
>> all help in debugging and issue, but if the target/distro isn't
>> correct then it doesn't matter what the rest is.
>>=20
>> --Mark
>>=20
>=20
> Hi, thank you very much for the suggestions!
> I worked out a vesion 2 patch that combines 2 and 3:
> =
http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/banne=
r_v2&id=3D2c2d9d7c0e942b6748bc8bd7d5980113bae9a836

Could you in the future please base them on oe-core instead of poky? I =
just did 'git merge 2c2d9d7c0e942b6748bc8bd7d5980113bae9a836' and git =
blew up.=


