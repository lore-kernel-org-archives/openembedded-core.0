Return-Path: <zhenhua.luo@nxp.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0075.outbound.protection.outlook.com [157.55.234.75])
	by mail.openembedded.org (Postfix) with ESMTP id C0180731F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 10:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=AAvZfrLqKwdOHD0s0fas84Bia3zlTVR0Ft8lMdH55sw=;
	b=w0YzQmY/2vsFm89nFsw1IGWKVdSCzBBipnZQzMn7N7ehqnJj1Yqx4gg9H7vyeXm+dT1XFPJVn5SG8jiil5VhrLhUfjHTxGsD7gdRpRPb8L3Pl/MKoUR+X7BkPeJmJqz6uHgo7dt+IAvXnAEIDNZOMVWbX4nc0QCIdNGwE3c9Wk0=
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com
	(2a01:111:e400:943c::14) by DB3PR04MB0683.eurprd04.prod.outlook.com
	(2a01:111:e400:943c::13) with Microsoft SMTP Server (TLS) id
	15.1.447.15; Fri, 1 Apr 2016 10:08:45 +0000
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::6154:2240:a351:cf3a]) by
	DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::6154:2240:a351:cf3a%15]) with mapi id 15.01.0443.017;
	Fri, 1 Apr 2016 10:08:45 +0000
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: Phil Blundell <pb@pbcl.net>, Ross Burton <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] meta: remove obsolete architectures
Thread-Index: AQHRi/XwgV/GvQB8nEWBESjl4ITy6Z904oGAgAAAboCAAAHVQA==
Date: Fri, 1 Apr 2016 10:08:45 +0000
Message-ID: <DB3PR04MB068489FF098D2F6CA960D0A6EE9A0@DB3PR04MB0684.eurprd04.prod.outlook.com>
References: <1459501616-4775-1-git-send-email-ross.burton@intel.com>
	<1459504783.2322.69.camel@pbcl.net> <1459504875.2322.70.camel@pbcl.net>
In-Reply-To: <1459504875.2322.70.camel@pbcl.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pbcl.net; dkim=none (message not signed)
	header.d=none;pbcl.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [199.59.230.102]
x-ms-office365-filtering-correlation-id: 76f11b42-da01-448c-1dee-08d35a159ca0
x-microsoft-exchange-diagnostics: 1; DB3PR04MB0683;
	5:IoVHy7Paa3+EUwpPUESGwxFUld6gc//adBw+SFoDa51wFGjUARrziWWMYLuODTwCgF9o9LIpWmn0R75Oz7jBLsLRc6v0yE1GV1HWc4DDMRCeVT0WU5MW4g8DBLEqwSvfr8mn+AuSdaaYVnWcBdo03g==;
	24:E0c4vYJT7x4dbRUi138n8JwSu7SiJd20B6PIupy1bGfEJC5j63VF6qTO+JGd/mVmZrhIfV2SOdMYOTAbpYyHbeO+/WyGGgFplEfQj3MBm/I=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB3PR04MB0683;
x-microsoft-antispam-prvs: <DB3PR04MB068339FC5BC922FA19AFAE55EE9A0@DB3PR04MB0683.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046);
	SRVR:DB3PR04MB0683; BCL:0; PCL:0; RULEID:; SRVR:DB3PR04MB0683; 
x-forefront-prvs: 0899B47777
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(377424004)(24454002)(13464003)(377454003)(3660700001)(189998001)(102836003)(6116002)(3280700002)(11100500001)(3846002)(586003)(76576001)(5004730100002)(4326007)(87936001)(1220700001)(33656002)(2906002)(92566002)(74316001)(19580395003)(81166005)(19580405001)(5002640100001)(1096002)(5008740100001)(1720100001)(86362001)(106116001)(5250100002)(5001770100001)(2900100001)(2950100001)(76176999)(66066001)(15975445007)(54356999)(50986999)(5003600100002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB3PR04MB0683;
	H:DB3PR04MB0684.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2016 10:08:45.6986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR04MB0683
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: remove obsolete architectures
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
X-List-Received-Date: Fri, 01 Apr 2016 10:24:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ah, a gift of the day. :)

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Phil Blundell
> Sent: Friday, April 01, 2016 6:01 PM
> To: Ross Burton <ross.burton@intel.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] meta: remove obsolete architectures
>=20
> On Fri, 2016-04-01 at 10:59 +0100, Phil Blundell wrote:
> > On Fri, 2016-04-01 at 10:06 +0100, Ross Burton wrote:
> > > Remove ancient and obsolete architectures from openembedded-core,
> > > they've no real users and are causing complications that can be now
> removed.
> >
> > It seems a bit harsh, or possibly wishful thinking on Intel's part, to
> > describe most of these as "ancient and obsolete".
>=20
> Oh, hah, I just realised what the date is.
>=20
> Removing SPARC still seems like a fine idea though :-)
>=20
> p.
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

