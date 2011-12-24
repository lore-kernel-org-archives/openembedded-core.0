Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1ReMPJ-0002uO-0j
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Dec 2011 08:52:41 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Dec 2011 23:45:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99898252"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga001.fm.intel.com with ESMTP; 23 Dec 2011 23:45:31 -0800
Received: from pgsmsx103.gar.corp.intel.com (10.221.44.82) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 24 Dec 2011 15:45:30 +0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	PGSMSX103.gar.corp.intel.com (10.221.44.82) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Sat, 24 Dec 2011 15:45:30 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.199]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.223]) with mapi id
	14.01.0355.002; Sat, 24 Dec 2011 15:45:29 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 07/14] glib-2.0: upgrade to 2.30.2
Thread-Index: AQHMwZJQBlcJAJunPkKdmuzcpZiK5JXqnM5Q
Date: Sat, 24 Dec 2011 07:45:28 +0000
Message-ID: <3AB6CE7F274E534CAFD089D127A8A1FC0104C6@SHSMSX102.ccr.corp.intel.com>
References: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
	<7252a7660c6a9703c7fca5153f87d9dbaaa347e5.1324657801.git.shane.wang@intel.com>
	<CE503E09-2FAB-407C-8A54-77A62A480595@dominion.thruhere.net>
In-Reply-To: <CE503E09-2FAB-407C-8A54-77A62A480595@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 07/14] glib-2.0: upgrade to 2.30.2
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
X-List-Received-Date: Sat, 24 Dec 2011 07:52:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote on=A02011-12-24:

>=20
> Op 23 dec. 2011, om 17:35 heeft Shane Wang het volgende geschreven:
>=20
>> Signed-off-by: Shane Wang <shane.wang@intel.com> ---
>> .../{glib-2.0_2.30.1.bb =3D> glib-2.0_2.30.2.bb}     |    7 +++---- 1
>> files changed, 3 insertions(+), 4 deletions(-) rename
>> meta/recipes-core/glib-2.0/{glib-2.0_2.30.1.bb =3D> glib-2.0_2.30.2.bb}
>> (88%)
>>=20
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb
>> b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb similarity index 88%
>> rename from meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb rename to
>> meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb index bf415a1..62f7dc6
>> 100644 --- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.1.bb +++
>> b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb @@ -1,6 +1,6 @@ require
>> glib.inc
>>=20
>> -PR =3D "r1"
>> +PR =3D "r0"
>> PE =3D "1"
>>=20
>> DEPENDS +=3D "libffi python-argparse-native"
>> @@ -13,10 +13,9 @@ SRC_URI =3D
> "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.bz2 \
>>            file://configure-libtool.patch \
>>            file://60_wait-longer-for-threads-to-die.patch \
>>            file://g_once_init_enter.patch \
>> -           file://glib-2.0_fix_for_x32.patch \
>=20
> Please delete the patch file as well when removing it from SRC_URI

OK.

--
Shane


