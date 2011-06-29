Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QbxwR-0006m0-6k
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 18:48:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Jun 2011 09:44:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,444,1304319600"; d="scan'208";a="21560139"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2011 09:44:43 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 30 Jun 2011 00:44:43 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 30 Jun 2011 00:44:42 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Thu, 30 Jun 2011 00:44:41 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jun 2011 00:44:40 +0800
Thread-Topic: [OE-core] [PATCH 1/1] base.bbclass: show layer's
	branches/revisions in the banner info
Thread-Index: Acw2eG4WZi65/S+tQLGafuIgNlnvEwAAe27w
Message-ID: <1865303E0DED764181A9D882DEF65FB6A167F0C726@shsmsx502.ccr.corp.intel.com>
References: <cover.1309239001.git.dexuan.cui@intel.com>
	<674a391015f3cdebe891ae7e8439aea48698982e.1309239001.git.dexuan.cui@intel.com>
	<3819C41B-FF96-45FD-8265-8EFC9F73E771@dominion.thruhere.net>
	<201106281207.23516.paul.eggleton@linux.intel.com>
	<4E0A794C.5060303@gmail.com>
	<1865303E0DED764181A9D882DEF65FB6A167F0C724@shsmsx502.ccr.corp.intel.com>
	<53FFBC7D-50F2-4307-B253-EAB8F86DFDAA@dominion.thruhere.net>
In-Reply-To: <53FFBC7D-50F2-4307-B253-EAB8F86DFDAA@dominion.thruhere.net>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: 'Koen Kooi' <koen@dominion.thruhere.net>
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
X-List-Received-Date: Wed, 29 Jun 2011 16:48:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote:
> Op 29 jun 2011, om 18:14 heeft Cui, Dexuan het volgende geschreven:
>=20
>> Khem Raj wrote:
>>> On 06/28/2011 04:07 AM, Paul Eggleton wrote:
>>>> On Tuesday 28 June 2011 07:45:09 Koen Kooi wrote:
>> BTW: meta and mete-yocto belong to the same git repo actually, so do
>> you think showing them in one line like this=20
>>=20
>> meta,meta-yocto   =3D "master:2c2d9d7c0e942b6748bc8bd7d5980113bae9a836"
>>=20
>> is better than showing 2 lines like this:
>>=20
>> meta             =3D "master:2c2d9d7c0e942b6748bc8bd7d5980113bae9a836"
>> meta-yocto    =3D "master:2c2d9d7c0e942b6748bc8bd7d5980113bae9a836"
>=20
> That breaks with repos like meta-intel and meta-oe. Maybe something
Could you please explain a bit more?

> like this:=20
>=20
> METADATA_BRANCH             =3D "master"
> METADATA_REVISION           =3D
> "16f84804cfbe472833ff00bfd2694947eabf8e20" meta-angstrom            =20
> =3D "master:fd68a073e9669fdee0a9dc0483b3d39d3e3e0b46" meta-oe         =20
> =3D "master:8a12ecca32766ecdceb72cae76e93f8aadcf3669" meta-efl        =20
> same=20
> meta-gpe                    	same
> meta-gnome                 same
> meta-texasinstruments       =3D
> "master:2e16e2fbd93bc00bc0a0afaf86975da7778eaa43" meta-efikamx      =20
> =3D "master:70cff8742d629fd32463e3ef1bddb83f04d08dc5" meta-nslu2      =20
> =3D "master:aaf918b85d7a8155d6e7c0ff042808346998fbea" meta-htc        =20
> =3D "master:f37d05ca7450f85642cea0e43a75df10663bd8f6" meta-nokia      =20
> same=20
> meta-openmoko              same
> meta-palm                   same
> meta-zaurus                 same
> meta-sugarbay               =3D
> "master:50661bf038a34702f3aa139c3ea0d67fbb0ce5db" meta-crownbay     =20
> same=20
> meta-emenlow                same
> meta-fishriver             same
> meta-jasperforest           same
> meta-n450                   same
> meta-ettus                  =3D
> "master:c34c30fa29f7ab484cc90efb9713325da8e01460" meta-openpandora  =20
> =3D "master:edaf6e751f873ed7a82c1116d3d58b9a070052dc" meta-archos     =20
> =3D "master:4b689944d968b0ef4d0e9928e76c54f8a76a919a"=20
I think the below is a better format(but the line may be too long?)?
meta,meta-yocto             =3D "master:16f84804cfbe472833ff00bfd2694947eab=
f8e20"
meta-angstrom               =3D "master:fd68a073e9669fdee0a9dc0483b3d39d3e3=
e0b46"
meta-oe,meta-efl,meta-gpe,meta-gnome =3D "master:8a12ecca32766ecdceb72cae76=
e93f8aadcf3669"
meta-texasinstruments       =3D "master:2e16e2fbd93bc00bc0a0afaf86975da7778=
eaa43"
meta-efikamx                =3D "master:70cff8742d629fd32463e3ef1bddb83f04d=
08dc5"
meta-nslu2                  =3D "master:aaf918b85d7a8155d6e7c0ff04280834699=
8fbea"
meta-htc,meta-nokia,meta-openmoko,meta-palm,meta,zaurus  =3D "master:f37d05=
ca7450f85642cea0e43a75df10663bd8f6"
meta-sugarbay,meta-crownbay,meta-emenlow,meta-fishriver,meta-jasperforest,m=
eta-n450, =3D "master:50661bf038a34702f3aa139c3ea0d67fbb0ce5db"
meta-ettus                  =3D "master:c34c30fa29f7ab484cc90efb9713325da8e=
01460"
meta-openpandora            =3D "master:edaf6e751f873ed7a82c1116d3d58b9a070=
052dc"
meta-archos                 =3D "master:4b689944d968b0ef4d0e9928e76c54f8a76=
a919a"

Thanks,
-- Dexuan=


