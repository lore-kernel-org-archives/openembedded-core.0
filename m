Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1ReLpz-0002OO-69
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Dec 2011 08:16:11 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Dec 2011 23:08:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105653790"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga002.fm.intel.com with ESMTP; 23 Dec 2011 23:08:13 -0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 24 Dec 2011 15:07:56 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.199]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.223]) with mapi id
	14.01.0355.002; Sat, 24 Dec 2011 15:07:55 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 01/14] polkit: upgrade to 0.103
Thread-Index: AQHMwZGtvTrIR3d5iUaSeb9WTFGgXpXqkJ4Q
Date: Sat, 24 Dec 2011 07:07:54 +0000
Message-ID: <3AB6CE7F274E534CAFD089D127A8A1FC01046A@SHSMSX102.ccr.corp.intel.com>
References: <cover.1324657801.git.shane.wang@intel.com>
	<b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
	<3D030A85-C2B2-4487-AB24-FA0A48A6408D@dominion.thruhere.net>
In-Reply-To: <3D030A85-C2B2-4487-AB24-FA0A48A6408D@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 01/14] polkit: upgrade to 0.103
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
X-List-Received-Date: Sat, 24 Dec 2011 07:16:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> Op 23 dec. 2011, om 17:35 heeft Shane Wang het volgende geschreven:
>=20
>> Signed-off-by: Shane Wang <shane.wang@intel.com> ---
>> .../introspection.patch                            |    0
>> .../polkit-1_pam.patch                             |    0
>> .../polkit/{polkit_0.102.bb =3D> polkit_0.103.bb}    |    6 +++--- 3
>> files changed, 3 insertions(+), 3 deletions(-) rename
>> meta/recipes-extended/polkit/{polkit-0.102 =3D>
>> polkit-0.103}/introspection.patch (100%) rename
>> meta/recipes-extended/polkit/{polkit-0.102 =3D>
>> polkit-0.103}/polkit-1_pam.patch (100%) rename
>> meta/recipes-extended/polkit/{polkit_0.102.bb =3D> polkit_0.103.bb} (84%=
)
>>=20
>> diff --git
>> a/meta/recipes-extended/polkit/polkit-0.102/introspection.patch
>> b/meta/recipes-extended/polkit/polkit-0.103/introspection.patch
>> similarity index 100% rename from
>> meta/recipes-extended/polkit/polkit-0.102/introspection.patch rename to
>> meta/recipes-extended/polkit/polkit-0.103/introspection.patch diff
>> --git a/meta/recipes-extended/polkit/polkit-0.102/polkit-1_pam.patch
>> b/meta/recipes-extended/polkit/polkit-0.103/polkit-1_pam.patch
>> similarity index 100% rename from
>> meta/recipes-extended/polkit/polkit-0.102/polkit-1_pam.patch rename to
>> meta/recipes-extended/polkit/polkit-0.103/polkit-1_pam.patch diff --git
>> a/meta/recipes-extended/polkit/polkit_0.102.bb
>> b/meta/recipes-extended/polkit/polkit_0.103.bb similarity index 84%
>> rename from meta/recipes-extended/polkit/polkit_0.102.bb rename to
>> meta/recipes-extended/polkit/polkit_0.103.bb index 714aa8e..0498494
>> 100644 --- a/meta/recipes-extended/polkit/polkit_0.102.bb +++
>> b/meta/recipes-extended/polkit/polkit_0.103.bb @@ -4,7 +4,7 @@ HOMEPAGE
>> =3D "http://code.google.com/p/polkit/" LICENSE =3D "LGPLv2+"
>> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D155db86cdbafa7532b41f39040928=
3eb
>> \
>>=20
> file://src/polkit/polkit.h;beginline=3D1;endilne=3D20;md5=3D9f797b8912dac=
8a806b
> e820c14e783f8 \
>> -
> file://docs/polkit/html/license.html;md5=3D570dd8c794dc8df913cb03b86e78d
> 936"
>> +
> file://docs/polkit/html/license.html;md5=3Dd85a36709a446c10f4ee123f9dda0
> e38"
>=20
> What changed?
>=20

The diff is trivial:

< <meta name=3D"generator" content=3D"GTK-Doc V1.17 (XML mode)">
---
> <meta name=3D"generator" content=3D"GTK-Doc V1.18 (XML mode)">
514c514
<           Generated by GTK-Doc V1.17</div>
---
>           Generated by GTK-Doc V1.18</div>


>>=20
>> SRC_URI =3D "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
>>            file://introspection.patch \
>> @@ -28,5 +28,5 @@ do_install_append() {
>> 	rm -f ${D}${libdir}/${PN}-1/extensions/*.a
>> }
>>=20
>> -SRC_URI[md5sum] =3D "a3726bdb9728c103e58f62131e26693a"
>> -SRC_URI[sha256sum] =3D
> "0a6573da841c6f5c428218f1456aed45724a0127932af0de563d568bb90586
> 41"
>> +SRC_URI[md5sum] =3D "aaacf2ef18774ea8a825a426a7cfe763"
>> +SRC_URI[sha256sum] =3D
> "36607c8ce576980ee55bd12bab1944f13217eb8e9d04ab56022545861ece3b c5"
>=20
> These should go next to SRC_URI, not at the bottom

Will update

--
Shane


