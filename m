Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 1402 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Nov 2014 08:52:27 UTC
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id ED1A360E49
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 08:52:27 +0000 (UTC)
Received: from mail2.sbs.de (localhost [127.0.0.1])
	by gecko.sbs.de (8.14.3/8.14.3) with ESMTP id sA58SxTt016331;
	Wed, 5 Nov 2014 09:28:59 +0100
Received: from DEFTHW99ERNMSX.ww902.siemens.net
	(defthw99ernmsx.ww902.siemens.net [139.22.70.141])
	by mail2.sbs.de (8.14.3/8.14.3) with ESMTP id sA58Sxc8024243
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Nov 2014 09:28:59 +0100
Received: from DEFTHW99ERRMSX.ww902.siemens.net (139.22.70.199) by
	DEFTHW99ERNMSX.ww902.siemens.net (139.22.70.141) with Microsoft SMTP
	Server (TLS) id 14.3.210.2; Wed, 5 Nov 2014 09:28:58 +0100
Received: from DEFTHW99EH4MSX.ww902.siemens.net ([169.254.2.159]) by
	DEFTHW99ERRMSX.ww902.siemens.net ([139.22.70.199]) with mapi id
	14.03.0210.002; Wed, 5 Nov 2014 09:28:58 +0100
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: "Bach, Pascal" <pascal.bach@siemens.com>, Koen Kooi
	<koen@dominion.thruhere.net>
Thread-Topic: [OE-core] [PATCH] image_types.bbclass: Make ubi depend on ubifs
Thread-Index: AQHP8bmaplvHw11RoUG3bEO0e33vfJxDwDOAgAAR3dCADe9HgA==
Date: Wed, 5 Nov 2014 08:28:58 +0000
Message-ID: <355BE46A91031048906B695426A8D8E616AF5F85@DEFTHW99EH4MSX.ww902.siemens.net>
References: <1414395756-29588-1-git-send-email-pascal.bach@siemens.com>
	<8AB2212A-15FB-4CB1-B88B-8C7C8FF5C86D@dominion.thruhere.net>
	<355BE46A91031048906B695426A8D8E616AF4942@DEFTHW99EH4MSX.ww902.siemens.net>
In-Reply-To: <355BE46A91031048906B695426A8D8E616AF4942@DEFTHW99EH4MSX.ww902.siemens.net>
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
X-List-Received-Date: Wed, 05 Nov 2014 08:52:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>=20
> > > }
> > > +IMAGE_TYPEDEP_ubi =3D "ubifs"
> > > +
> >
> > 'ubifs' or 'ubifs-native'?
>=20
> IMAGE_TYPEDEP describes dependencies between image types. So in this
> case ubifs referred to IMAGE_CMD_ubifs
> I'm not aware that there is ubifs-native image type.
> --

Any chance this gets included?

Pascal

