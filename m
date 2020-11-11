Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.55])
 by mx.groups.io with SMTP id smtpd.web10.5610.1605095359602444503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 03:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=P97MBbT3;
 spf=pass (domain: spinetix.com, ip: 40.107.7.55, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEGIoyFBj3L+WhZespHxrFqbEXgPRuSuASXd2cDPf7ZWXG/Oe9alKOlQmafosp5ONEpLQe4089q88lFfK9EOZW+p1+jOccH+LsW5+elapkhpaaC1P2yZ5TSIAtqNgyyGk2hKINcexMS9Ed5V1RzLGNx1ruaD2ytsU2zjrqbUa2HV51c/sgcZ13lKyDwr2nj5FsKaWKMpBYZSH/x97/nFIEJgH/xLBI+DfCRnwIdYb823ffSSNdECPfhns/yNWgHPqf8A1cszwGGRpvu7SXmFSI/Hp4MWPUlkudzguf8X3fw1sWHfBhFy0bLsdnS0jhYkXwgwdeqVT6WES3vv5kDi/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlwZ+Ueq77IIw++NsPDweoAlX6+K0aOm5VJyjnTtxvw=;
 b=lczP38kKrsDnFyNX4gfJSSosTkKP9WjyuM6g599h7gxXDtuEk1vIovNc2ZiG3q1atF7LcP54S7VPwz6/JLC7jLz2Tia1CbKJ4I8Fr4LU9kmKxxPvRDJsZSoXGO75mv9ZiziVVBJ+CyYrSjgATIUd7Pkt4qwfHeo1t/6+cnwcM6qn5BkluIXwXswp+nQM3rGrzgY1rXo6V6bgvKJCWY7EuqKZOYq1tPjAOJggmpZ7/ew52liyZEPK4xiCA+TfQ9CNAorJz9LqWtil0B4PKGTaLUnlKwrOWCTX7yXKB0MsFiO9b1qv9lWp7SBM8wDikiEnGs+4Z2ZiY47HY4lV/AfhVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlwZ+Ueq77IIw++NsPDweoAlX6+K0aOm5VJyjnTtxvw=;
 b=P97MBbT3QPMqA4iDUCsrZaogJbuas5I8ZC9OWyBduzOsTxJ2HEiObVZ2jrNU5Z02nYKkyGRaIg6TjwyeB31SV0Asu5ZGj63WMg2jR43sD+MA8bkNEQB2569OJIqcVmb+DEYTBHQgwOQoz8wp4t8Xyrf0cZpFrcpwi2fbmBZzoUw=
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DBBPR01MB7611.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1ed::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 11:49:17 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c14b:724a:501b:411c]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c14b:724a:501b:411c%7]) with mapi id 15.20.3499.034; Wed, 11 Nov 2020
 11:49:17 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: "Mikko.Rapeli@bmw.de" <Mikko.Rapeli@bmw.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] FreeType CVE-2020-15999
Thread-Topic: [OE-core] FreeType CVE-2020-15999
Thread-Index: Ada3/yfZgI6So/CPS5+iqCvl+/ICCAAAl+IAAAe5kNA=
Date: Wed, 11 Nov 2020 11:49:16 +0000
Message-ID: 
 <DB6PR0102MB26302E054D838889B6399CE288E80@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
References: 
 <DB6PR0102MB2630314CC44CCB6400F59C4E88E80@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
 <20201111090616.GS1246345@korppu>
In-Reply-To: <20201111090616.GS1246345@korppu>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bmw.de; dkim=none (message not signed)
 header.d=none;bmw.de; dmarc=none action=none header.from=spinetix.com;
x-originating-ip: [178.198.197.47]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25f3f501-13a3-453e-7301-08d88637d196
x-ms-traffictypediagnostic: DBBPR01MB7611:
x-microsoft-antispam-prvs: 
 <DBBPR01MB7611B2131F2DF7404B25AED588E80@DBBPR01MB7611.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3K5K8qi0/qy6HNZIiukQXGxRcT8lRdLMfb7B++fo2GEHbp+d03TySx01BVSWN/KNj8Yw9FGHrXeweX7fgAlsMCBxh92C+lm3/7qY47g3QFtn1DK1rCrBUtbtWDeefdyA4QecIgu7qVXyAGWO0Hkq0mCBPHAzLfmcIS1vWfEBgmLPxcOsfVFH/xxUzh2/+XZEKHOahcCxHiG5fXNucBnVRNBa64XRpBmVtc2VPHBafvi5MSCyhZl2WFAjwdoE99w0fbrZP8KjhP4mz/bps2itDYajmV+eHxaks9CVFgT1FnoUsfNU/vEMj6hATFagQf1jjqC+gTZchPpfZ1nWUg8akautfl1UAxjlKYeB29n4mw8X7qCehdTq19HdcLqgRROD4XP75d8Tg4vGMzMoSK89SQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(366004)(39830400003)(396003)(376002)(346002)(136003)(8676002)(83380400001)(33656002)(5660300002)(26005)(966005)(66446008)(478600001)(86362001)(8936002)(316002)(4326008)(64756008)(66946007)(66556008)(6506007)(66476007)(53546011)(2906002)(76116006)(71200400001)(55016002)(6916009)(7696005)(16799955002)(186003)(52536014)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 W0mAmP6FqlAoaZa20gGbGPNkDbyjtTzeJ0ybTPrg9icvmBaMF632Ue5aY2Wg3dxJy4knpkNvFsx07TOe+Hrj3Oswv99c7+co3ncF924DLHPcEnAPpdPBi/2ft5uSLLZCkbUlXb9/s8reAnqf1y/zpCWLNzueA5pLOZyyTFhcfcRl+XbBAz+Y34yBK39PhancT8El53HrGQIezWZ1AJbi6Nv25E6sKzBMYrY++vsEVVbtkMjNZfYPRCmzaafRzVQafFGMio1fKUURJKDbb5xgYb09vXAwaeelJDXK++2VkSeUzjs0DkzmJ0p+dJ7ZawiOoKiTgJhP2+s21WRFOn7+BrfIsJLGEBHfeM1rj2zkujYY4Q2PbMAqJ1AXStiycVRHcoq2+xl2OLiaLc15FOkv/OxKU9+BiSk+DwutmcssNdjFWi4MdxDGaB3WxNeHqRf20dkpicV0GEQwGP6uG9Sx16T1JeoTazuD1DTrbw0UiXrS1fdRuSiaWoRDhZTomSzXZaRHv/L6pAn0zJL+73IAykbkvi7pK0PViA9geugPyv4HYP3vBR7l4lYujtnwkbySE/Ob87MnuODtvz1TCd3v6Y7K3jFKv4gK28CnKVZnFDj4h72GQbCmeF7FCYd8md9pNx6heeTRHYeM3dlCpEAPAA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f3f501-13a3-453e-7301-08d88637d196
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 11:49:16.9187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RgLqdATEdWjPsvjI169DtZG3wxTJrOI0CerSu8Ph+VyvFGWmeKn7x/Ax+POeIbIxuxOE8Y2VCsHPkSIHgS7m0p2NFVXTOY0U++3qTkFN4p0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR01MB7611
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Mikko.Rapeli@bmw.de <Mikko.Rapeli@bmw.de>
> Sent: 11 November 2020 10:06
> To: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] FreeType CVE-2020-15999
>=20
> Hi,
>=20
> On Wed, Nov 11, 2020 at 08:06:44AM +0000, Diego Santa Cruz via
> lists.openembedded.org wrote:
> > Hi all,
> >
> > It was brought to my attention that FreeType < 2.10.4 is affected by a
> buffer overflow with PNG bitmaps as per
> https://sourceforge.net/projects/freetype/files/freetype2/2.10.4/,
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2020-15999
> >
> > This does not appear in the CVE metrics which have been posted recently=
,
> apparently because it is tagged as google:chrome in the NVD database.
> >
> > In master freetype is already at 2.10.4, but on gatesgarth it is 2.10.2=
 and
> dunfell 2.10.1. What is the strategy regarding FreeType updates in OE-Cor=
e
> releases? Should I send a patch to update freetype to 2.10.4 in both bran=
ches
> or backport the fix for the buffer overrun?
>=20
> Safe approach would be to pick the patch from Debian and with some luck
> it would apply as is to gatesgarth and dunfell versions.
>=20
> Patch from Debian is
> https://security-tracker.debian.org/tracker/CVE-2020-15999
> -> https://sources.debian.org/patches/freetype/2.10.2+dfsg-4/cve-2020-
> 15999.patch/
>=20
> 2.10.4 from master could be ABI compatible according to
> https://abi-laboratory.pro/index.php?view=3Dtimeline&l=3Dfreetype
> but https://www.freetype.org/index.html#news does list
> possible API break in 2.10.3:
>=20
> "A warning for distribution maintainers: Version 2.10.3 and later may bre=
ak
> the build of ghostscript, due to ghostscript's use of a withdrawn macro t=
hat
> wasn't intended for external usage. A fix is available here."
>=20

[Diego Santa Cruz] OK, thanks, I will prepare and post patches with the bac=
kported fix then.
--=20
Diego Santa Cruz, PhD
Technology Architect
spinetix.com
