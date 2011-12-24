Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1ReLuQ-0002Ud-9k
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Dec 2011 08:20:46 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Dec 2011 23:13:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="89125375"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by azsmga001.ch.intel.com with ESMTP; 23 Dec 2011 23:13:36 -0800
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 24 Dec 2011 15:13:35 +0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 24 Dec 2011 15:13:35 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.199]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.223]) with mapi id
	14.01.0355.002; Sat, 24 Dec 2011 15:13:34 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 03/14] gst-plugins-bad: upgrade to 0.10.22
Thread-Index: AQHMwZG7rWuGgLyG7Uy9Lvadwfhgl5Xqkq0Q
Date: Sat, 24 Dec 2011 07:13:32 +0000
Message-ID: <3AB6CE7F274E534CAFD089D127A8A1FC01047D@SHSMSX102.ccr.corp.intel.com>
References: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
	<6a425c8c138a3eddc3c2b01eb350e3277f9eb888.1324657801.git.shane.wang@intel.com>
	<E52DB641-01B4-4DB4-AFEC-395E8A780D16@dominion.thruhere.net>
In-Reply-To: <E52DB641-01B4-4DB4-AFEC-395E8A780D16@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 03/14] gst-plugins-bad: upgrade to 0.10.22
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
X-List-Received-Date: Sat, 24 Dec 2011 07:20:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote on=A02011-12-24:

>=20
> Op 23 dec. 2011, om 17:35 heeft Shane Wang het volgende geschreven:
>=20
>> Signed-off-by: Shane Wang <shane.wang@intel.com> ---
>> ...s-bad_0.10.21.bb =3D> gst-plugins-bad_0.10.22.bb} |    7 +++---- 1
>> files changed, 3 insertions(+), 4 deletions(-) rename
>> meta/recipes-multimedia/gstreamer/{gst-plugins-bad_0.10.21.bb =3D>
>> gst-plugins-bad_0.10.22.bb} (76%)
>>=20
>> diff --git
> a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb
> b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
>> similarity index 76% rename from
>> meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb rename to
>> meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb index
>> a7023e3..ec067b8 100644 ---
>> a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb +++
>> b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb @@ -4,12
>> +4,11 @@ LICENSE =3D "GPLv2+ & LGPLv2+ & LGPLv2.1+ " LIC_FILES_CHKSUM =
=3D
>> "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3 \
>>=20
> file://gst/tta/filters.h;beginline=3D12;endline=3D29;md5=3D629b0c7a665d15=
5a667
> 7778f4460ec06 \
>> =09
>> file://COPYING.LIB;md5=3D55ca817ccb7d5b5b66355690e9abc605 \ -
> file://gst/qtmux/gstqtmuxmap.h;beginline=3D1;endline=3D19;md5=3D2da8f56a4=
46
> 97c1527c5a4bcf8d5d69b \
>=20
> Why is that removed?

Because the file as well as the folder disappeared in the new version.

--
Shane


