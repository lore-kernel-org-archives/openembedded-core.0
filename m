Return-Path: <Arsalan_Awan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7D3B16C0EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 11:07:06 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1gRxgO-0002h8-KA from Arsalan_Awan@mentor.com ;
	Wed, 28 Nov 2018 03:07:04 -0800
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Wed, 28 Nov 2018 11:07:01 +0000
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1320.000; Wed, 28 Nov 2018 11:07:00 +0000
From: "Awan, Arsalan" <Arsalan_Awan@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/1] initrdscripts/init-live.sh: fix mounts w/ spaces
	fail to move to real rootfs
Thread-Index: AQHUhwpuF0oNkuLCG0Sy/8EPG9bQTQ==
Date: Wed, 28 Nov 2018 11:07:00 +0000
Message-ID: <1543403220780.29461@mentor.com>
References: <cover.1530195143.git.Arsalan_Awan@mentor.com>,
	<54623c3251a086bd9474d51d60dd46183840506d.1530195143.git.Arsalan_Awan@mentor.com>
In-Reply-To: <54623c3251a086bd9474d51d60dd46183840506d.1530195143.git.Arsalan_Awan@mentor.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] initrdscripts/init-live.sh: fix mounts w/ spaces fail to move to real rootfs
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
X-List-Received-Date: Wed, 28 Nov 2018 11:07:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
This was fixed in Thud (& master), but can we backport this 6f8f984ba363f76=
4e83290b972ec31a90aad1603 to [sumo ... morty]?=0A=
=0A=
Link: http://git.openembedded.org/openembedded-core/commit/meta/recipes-cor=
e/initrdscripts/files/init-live.sh?h=3Dthud&id=3D6f8f984ba363f764e83290b972=
ec31a90aad1603=0A=
=0A=
Thanks=0A=
=0A=
-=0A=
Arsalan=

