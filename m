Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 7668E70EF1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 11:43:01 +0000 (UTC)
Received: from mail2.sbs.de (localhost [127.0.0.1])
	by david.siemens.de (8.14.3/8.14.3) with ESMTP id s9RBgrR7032195;
	Mon, 27 Oct 2014 12:42:54 +0100
Received: from DEFTHW99ERHMSX.ww902.siemens.net
	(defthw99erhmsx.ww902.siemens.net [139.22.70.133])
	by mail2.sbs.de (8.14.3/8.14.3) with ESMTP id s9RBgrCm028120
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Oct 2014 12:42:53 +0100
Received: from DEFTHW99EROMSX.ww902.siemens.net (139.22.70.201) by
	DEFTHW99ERHMSX.ww902.siemens.net (139.22.70.133) with Microsoft SMTP
	Server (TLS) id 14.3.210.2; Mon, 27 Oct 2014 12:42:53 +0100
Received: from DEFTHW99EH4MSX.ww902.siemens.net ([169.254.2.159]) by
	DEFTHW99EROMSX.ww902.siemens.net ([139.22.70.201]) with mapi id
	14.03.0210.002; Mon, 27 Oct 2014 12:42:52 +0100
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [OE-core] [PATCH] image_types.bbclass: Make ubi depend on ubifs
Thread-Index: AQHP8bmaplvHw11RoUG3bEO0e33vfJxDwDOAgAAR3dA=
Date: Mon, 27 Oct 2014 11:42:51 +0000
Message-ID: <355BE46A91031048906B695426A8D8E616AF4942@DEFTHW99EH4MSX.ww902.siemens.net>
References: <1414395756-29588-1-git-send-email-pascal.bach@siemens.com>
	<8AB2212A-15FB-4CB1-B88B-8C7C8FF5C86D@dominion.thruhere.net>
In-Reply-To: <8AB2212A-15FB-4CB1-B88B-8C7C8FF5C86D@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.29]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types.bbclass: Make ubi depend on ubifs
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
X-List-Received-Date: Mon, 27 Oct 2014 11:43:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> > }
> > +IMAGE_TYPEDEP_ubi =3D "ubifs"
> > +
>=20
> 'ubifs' or 'ubifs-native'?

IMAGE_TYPEDEP describes dependencies between image types. So in this case u=
bifs referred to IMAGE_CMD_ubifs
I'm not aware that there is ubifs-native image type.

