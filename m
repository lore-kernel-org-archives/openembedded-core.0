Return-Path: <tom.hochstein@nxp.com>
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr40055.outbound.protection.outlook.com [40.107.4.55])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD347D5EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 12:40:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=IGD6aCnJA5MlwWWQm77WTWCQDbw/oaf/t0excee77ixTRWCHCoVKWnXWkWd5npbtxC2R12y3A9sj0ja4tHTSxUZYsdFVczY6nSQsvOz3mAqweGjr3jpk031UZeCQDhk0f7krqprXfOVTbzsh4RoGxhkQclKODthX2fbU6s+DquMLEVJZVRtfiVr2EogX6o7b1VghtNLt1zfWxW2H3wo8bbYhUOxqrur8l6YPaCmZXoqBP1lbvFYzp7O88kOSaJUp43tbiXLbnUYxBUSaq++dzzirURvFLSpDS6lgKr68Oi45h0QD6zT61JhuMVrH/NYHR9J8ql6CbHeNxoh7JT/ZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=77tx3AZb9RlVpW6kbHw6HP2rZq5ArfgDxn0dueU+g5k=;
	b=k4ROYRHesDzjyL3SoaunqKSS/3lgW7VgyyUTc9/M4ytOVAAOtl5YuEQNo8oZNkh7xQN9AYIU6bYLI9eB2RZeecjj4SWkpvYUN7qpZcSvxSIvtVVAJIF/QvmyZ3Rzg26SpL+75ykfDNkv9D13IRo+pUinOEae1gPs8I5DUM16m2qMM7kTvUuu+xLaMH50e8DSedL/eIsSCuKPyls4VeSBV7VOIqpg+BWrPkMJiMq9FOhLygdgOUpZ8QVbuf7TSkFbCyvE9yERwWhwBFwgdz9cMDMr/Q9GnS7bTS87WwQ3wn1/jn0MZ973m2L7AaOV1bRXbCER9jFbZrBNA+kWzGFedg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=77tx3AZb9RlVpW6kbHw6HP2rZq5ArfgDxn0dueU+g5k=;
	b=VrU9BWEBKZDhnqwgg2FsPOmIzEG7IHnH+kKg3hdvs3TjttGNptzpTRv69AAZK8aPhnDm7MM/KtpSSj/ru7fnOaOL81SNMQnflXrQwHsEVrx9fTMq2rwkTBWyzhanyBXFk+r55nnpys3ILxgZlTQ2KSN6dUnXd6OMPRQNT4KRAk8=
Received: from AM0PR04MB6612.eurprd04.prod.outlook.com (10.255.182.25) by
	AM0PR04MB5649.eurprd04.prod.outlook.com (20.178.118.213) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2474.17; Thu, 21 Nov 2019 12:40:23 +0000
Received: from AM0PR04MB6612.eurprd04.prod.outlook.com
	([fe80::2006:4675:2474:f3a0]) by
	AM0PR04MB6612.eurprd04.prod.outlook.com
	([fe80::2006:4675:2474:f3a0%5]) with mapi id 15.20.2474.019;
	Thu, 21 Nov 2019 12:40:23 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] devtool/standard.py: Allow recipe to
	disable menuconfig logic
Thread-Index: AQHVn9hOKHV1irVtG0aDGZ7QPWajF6eVanuAgAAh/hA=
Date: Thu, 21 Nov 2019 12:40:23 +0000
Message-ID: <AM0PR04MB661211653481F547F3FE70B4E24E0@AM0PR04MB6612.eurprd04.prod.outlook.com>
References: <20191120192419.7352-1-tom.hochstein@nxp.com>
	<b280bb0077e641158e47c85dd6948540@XBOX03.axis.com>
In-Reply-To: <b280bb0077e641158e47c85dd6948540@XBOX03.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a57539d9-92fa-4db6-bbd5-08d76e7ffa74
x-ms-traffictypediagnostic: AM0PR04MB5649:
x-microsoft-antispam-prvs: <AM0PR04MB56490DE786FF8B327683EF59E24E0@AM0PR04MB5649.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(13464003)(199004)(189003)(99286004)(7696005)(7736002)(305945005)(33656002)(3846002)(2906002)(186003)(71200400001)(74316002)(71190400001)(9686003)(6436002)(229853002)(53546011)(6506007)(6246003)(52536014)(110136005)(55016002)(102836004)(26005)(66066001)(14454004)(6116002)(2501003)(76176011)(25786009)(478600001)(8936002)(256004)(5660300002)(44832011)(76116006)(66946007)(316002)(81156014)(81166006)(66476007)(446003)(64756008)(66446008)(8676002)(66556008)(86362001)(11346002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB5649;
	H:AM0PR04MB6612.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9xZEaxcf53b0kesGYx4INcfttSdd94+M/46G1dbaUK0S/sXhRqXl+w63LmBp0/ifBV6A2NcFMcGWY8ZEPEYGoVpn4H66d0gb6zaJ0VjrOEt52nR8K+AqWfZDDsKbYIsV4Vr13PuMsRbJ336d35Z+RzXcpQqyzu3Br2lT09hHAEHe9OzlgOWQYe+lHkt7WW4Cj6suaPF/08NpPu6dK7EzZbhlkLOvUICkCvg/i1NFHWKMQKqTDD0RS4CwzBq7LnWqBM63736+oSp50EuAtRgbkztlK2RTRgSxLybuPH7lt+vWKh9wFv7CujFMUNvYRz1BXi7SbMZi2Ilm2I/twZen6Jvjl9PzGKpEy+p1GLWXPz0bUW/7sb6pDe54LHXGIQJpk19nG83YLaQHb0WNhZ5ve98W9aJCpJL+yeVD5CoNpvjFS2cN3gie6lQzYkjjLaGM
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a57539d9-92fa-4db6-bbd5-08d76e7ffa74
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 12:40:23.6891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uWClKoe3pH0p/VsSTp0KhLJTgA63FbcvrQ8TWS3J3WmseyNwkIKo+YW8RmbyQv2HYj1sW1VKNB2ylOUO5g/p8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5649
Subject: Re: [PATCH 1/2] devtool/standard.py: Allow recipe to disable menuconfig logic
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
X-List-Received-Date: Thu, 21 Nov 2019 12:40:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Sent: Thursday, November 21, 2019 4:24 AM
> To: Tom Hochstein <tom.hochstein@nxp.com>; openembedded-core@lists.openem=
bedded.org
> Subject: RE: [OE-core] [PATCH 1/2] devtool/standard.py: Allow recipe to d=
isable menuconfig logic
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-co=
re-
> > bounces@lists.openembedded.org> On Behalf Of Tom Hochstein
> > Sent: den 20 november 2019 20:26
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 1/2] devtool/standard.py: Allow recipe to
> > disable menuconfig logic
> >
> > @@ -940,8 +940,10 @@ def modify(args, config, basepath, workspace):
> >                          '}\n')
> >              if rd.getVarFlag('do_menuconfig','task'):
> >                  f.write('\ndo_configure_append() {\n'
> > -                '    cp ${B}/.config ${S}/.config.baseline\n'
> > -                '    ln -sfT ${B}/.config ${S}/.config.new\n'
> > +                '    if [ ! ${DEVTOOL_DISABLE_MENUCONFIG} ]; then\n'
> > +                '        cp ${B}/.config ${S}/.config.baseline\n'
> > +                '        ln -sfT ${B}/.config ${S}/.config.new\n'
> > +                '    fi\n'
>=20
> Why do you need the extra variable? Why not just check if the .config
> file exists before copying it:
>=20
>                 '    if -e ${B}/.config; then\n'
>                 '        cp ${B}/.config ${S}/.config.baseline\n'
>                 '        ln -sfT ${B}/.config ${S}/.config.new\n'
>                 '    fi\n'
>=20
> >                  '}\n')
> >              if initial_rev:
> >                  f.write('\n# initial_rev: %s\n' % initial_rev)
> > --
> > 2.17.1
>=20
> //Peter

I wanted to preserve the existing error handling in the case that menuconfi=
g is supported and .config is unexpectedly missing. Having the cp fail imme=
diately seems best.

Tom

