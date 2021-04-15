Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.61])
 by mx.groups.io with SMTP id smtpd.web08.1342.1618525698132643872
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 15:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=pVv6pN+m;
 spf=pass (domain: nxp.com, ip: 40.107.3.61, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKKUAOMFsoEp8hCJuO9ZLfA0rMz8ALK5kVe6xV8Kl0WOs3X5QTpAG/YiE+zvCu0HXf1dWxbXImZcN6+KPTYDXBBfyP7MhuYv2jYqt1kdIyRU6+aIu/YuizjaTdrcOaNYQ3RVbqdyNPphD1scNI8IEao1u1UuB6sSf7vZfhL/iQYMXosUveT5ZJfPqPwvIU9IER4x+6cNI+aniKSEKYANfrpJIgChmgS9aqCK2ZP62uU8SwVTjiuUJbnPEPK5/ERxboAh7hteO2ZS76gXdFJKzO3nv1eVokMj+lg1GyiD2wG425iSbmsTYdy1PE35AYImstxQiZelexA/M7Skj/QRSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sD7skn0A6udF/xtWl0TS2ZZzx+vTEsFOy+JMiu8MzLs=;
 b=WAlHVQYAq3jiawDVMOT+bgoDM6YjnRwtbV49dxjzdaxNLDNzc7K0YBr7WglBYlOBbVlznnTsG5nIqrfo8le4iiGy9fHWdNz6FW93PiYN2B0QaTSAY4ydtFMdZfwzeuvvTv3zi/YYgWgcr2cz+jNViKA3lIgzzgoisUNRQ86XuVNkQizNo6okXqejqTaXeSg4khH8CpAzcz1aBb2G/g8eVgZr5mnpl/WrGBwGRml1LvGFr/ZzIeP2U0bHVEhp5T5aIrfv51t5za6Dh0PUb6TS4qv8jult1twuPqC2UF8OMaRXoXfT5HGlItQL00lrBYfkPv8oNeMZKcnFwZ8moVkcuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sD7skn0A6udF/xtWl0TS2ZZzx+vTEsFOy+JMiu8MzLs=;
 b=pVv6pN+m07aqyMt4HJWmpNS50aS6Zb89xu6aHm3crk37Rs82GlpItCGLNpkhRGhYpdKamEqREd+C/4I2nZwX1oynSzVRKIPRv+I5vR4XezeC/TZpFtIJ/uS/pvAP/k6CdRiNkheCZxJeuYAaa0vGVRCaduneLMN6z2C6svlVIlg=
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com (2603:10a6:10:1e1::5)
 by DBBPR04MB7819.eurprd04.prod.outlook.com (2603:10a6:10:1e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 15 Apr
 2021 22:28:16 +0000
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::95a8:50c0:6b44:9de7]) by DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::95a8:50c0:6b44:9de7%2]) with mapi id 15.20.4042.018; Thu, 15 Apr 2021
 22:28:15 +0000
From: "Tom Hochstein" <tom.hochstein@nxp.com>
To: "otavio.salvador@gmail.com" <otavio.salvador@gmail.com>, OpenEmbedded Core
 Mailing List <openembedded-core@lists.openembedded.org>
CC: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [OE-core] [PATCH 2/2] gstreamer1.0-plugins-base: Use bb.utils.filter to reduce code
Thread-Topic: [OE-core] [PATCH 2/2] gstreamer1.0-plugins-base: Use
 bb.utils.filter to reduce code
Thread-Index: AQHXMgf5AnnBx7VN4USx0RNyEwOKs6q2KDnQ
Date: Thu, 15 Apr 2021 22:28:15 +0000
Message-ID: 
 <DBBPR04MB775354F404BF99B70CF26EC1E24D9@DBBPR04MB7753.eurprd04.prod.outlook.com>
References: <20210415145929.2007522-1-otavio@ossystems.com.br>
 <20210415145929.2007522-2-otavio@ossystems.com.br>
In-Reply-To: <20210415145929.2007522-2-otavio@ossystems.com.br>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [70.113.31.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d973a06d-d854-44d0-3836-08d9005dc360
x-ms-traffictypediagnostic: DBBPR04MB7819:
x-microsoft-antispam-prvs: 
 <DBBPR04MB78194CF42E68BB76EA855C1DE24D9@DBBPR04MB7819.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:374;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ae64Vxp6Nwn6lRP8Xn/u86my4gx7yWfCeMPzG8u02pXQZb9WfI16DSA3Y8zlJSvholgozkxG6yP9NplcdYPrGi4N6gnt7ri9FavxurhS2AmxquhR96uNQJ/0PdWklzJaRUBWKLcAGQ84WkcV/A48HNz/ae5xjMWM5v95kpNa3iK2Y4A7Sw6HbYsMY9SYUXR3vhovdyglW4pCF9vYuslucoyjZSsgF0m2uK6f1mJyvTxGbZa+gMXlZ1AnSEc8bndlRdGCJ8giGn17N6OvW7pAmvjHD3W65ZA29DM9Y0931iZlvOULaYGIpQ9q7icx4OerJpnhmC1+WhLVQV1VUOS9C2GL75LsthLRfx5dxGl+dfFDolursUrWkNa/Gumv+Z2HFPioNrAxfrTboQaZhCgv7amxQSUHiExFkZQZyqqiaDRJEh8S2PN1vdU4x4PYTBhBmhMoYLoqnIDvnc+40KsvWn7b1w+u03djV11hF7hsLovoQZ3tMEcDbI2i6bgLx5V90TDxsE4A0Nr3LEnrlEbX2aT2W6z9uqwt8vdGnBpIQf6bPJDilQiqTn0pMkcOnMSOgOxNqgEbQYc3qNl8OkcRlQoL0hi9qJgopxbP7NHhu58=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7753.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(66946007)(4326008)(26005)(76116006)(4744005)(478600001)(5660300002)(110136005)(66446008)(6506007)(8676002)(86362001)(66476007)(66556008)(38100700002)(71200400001)(2906002)(64756008)(186003)(52536014)(316002)(33656002)(83380400001)(55016002)(9686003)(44832011)(122000001)(8936002)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?na1flMlCJMbMhu22X4un8rWeaCXKUD70ghzLUy/OT7Q+NCxLi2K/reRuXRki?=
 =?us-ascii?Q?WnUWpKIj8RDqIfqy+xN2R9cwTl5/oGZDFgzz4igoPLU82b4TFsT7zAM9g2cw?=
 =?us-ascii?Q?6ljVQAcPZ4M/0LpeHeUS1zKGyRu8SOvbc8Ne4MI9sNwuxfI7ZlQgkWDQMI9a?=
 =?us-ascii?Q?rcvIE//gR7QLpm34GXGa0lrRzfxJKfxsHB5B3qyS6Kr4GqXqkOhFIyCxgY5v?=
 =?us-ascii?Q?nnGlMpndOc7Y1lgthC0vPUslR5pb9fsVAWz/3ddPhrXAMOXZ4y3G3JTWQo4g?=
 =?us-ascii?Q?FTPC0d4nq7PQ9HT2dU0lAfTayfRMIV0C2l8XmM7lUTbuTWqbJuItgX33pJBp?=
 =?us-ascii?Q?o1YN/N9XRuBXgm2MHId0xZYPwhIEJjk+Um6K7vCoaquMU+UK8ZoX2cSEZKVw?=
 =?us-ascii?Q?o7Fs4x3cflFtSC53y1Kf6ipF8DOM2TZoVSgFrVScMAUnF2X4pQV6BBuSbJpD?=
 =?us-ascii?Q?6R40d7ERo96AmVUfsWOEUt7qqgxigpPhNIpXnXic/ALwGGDbhUgl/avMBG/k?=
 =?us-ascii?Q?FgKJxtgmxQrFmgILolXIYnhjt5tZmU1fNkRRHxEpy1t9f5SyBMV+APxe0bh9?=
 =?us-ascii?Q?cnrbOap4+F1ra2ifmU/mGcJD/Y/OexYASRE5iakSz+/jSZQhE+5ru2WIovsy?=
 =?us-ascii?Q?zcM7GJEznf3YP6gJ/UsSF/o5XPOzlF8Up1lfAfYRWJegl0vMi9t16wDVqR6M?=
 =?us-ascii?Q?0CVus7CsxHrmUmAYDLRSstG08s7/qa2iXSy5CT9joGAswQMVd6J8V9LIFTC0?=
 =?us-ascii?Q?0J+IPedIN5kXw7u9wOLcyY/dkcBeEFIEICkzTSi2GQXkGQFcMqfu5LRKFC3S?=
 =?us-ascii?Q?xlkJ6diHqZ7vpRhlmJbeGviBJZvX4OceC0maoe6Nj/vc31H1YK5Kvz7M3Fqt?=
 =?us-ascii?Q?5JzeXvZ42fFTnDKlkfHJGCzuPKsZwQJbzuzo23dhlMINYppkBN/MH27tyBFV?=
 =?us-ascii?Q?JvDaXhsTv72pNFPO0JQNECJAEGKor45LSf32Vy84u98fO7TebVY1wBxoxdMB?=
 =?us-ascii?Q?HGKGmA2vfx7DevQpZQdpGBxDoB5ALNBqP2JpqX9RmK+psRaF6TrkiTMY3Qy5?=
 =?us-ascii?Q?FjWbs5lWNfwpkI/Hkp9x17ZFDNhjyL2/cNMw3Kkfm6EnjY/hyIPhqivYNf7y?=
 =?us-ascii?Q?wUdgk3im59a7yY7fCVsiBuzhdYhFN4uEDwavjfybI0oeOO/ZUimuezINHWK7?=
 =?us-ascii?Q?GeVJWTW6C/UHsJBNbvnkMMgrGg4tea8Jy/3haiJc2AkgMLczUCY7/U3jDBJy?=
 =?us-ascii?Q?+OuUvFTrWwCxXhc2XKAGSlL+9GqLENMVAMazlWVcyKMd3Aq60a+c1CRflrwn?=
 =?us-ascii?Q?OVk=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7753.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d973a06d-d854-44d0-3836-08d9005dc360
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 22:28:15.8153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y4ay3mMSyPlPdD0j5lxkSjrdrNM5t/S1GGvMSgtNPBzuRrPNE3/2lQzQLr3wQMPsH7RaWcRT6HO8KAPakCzSjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7819
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Otavio Salvador via lists.openembedded.org
> Sent: Thursday, April 15, 2021 9:59 AM


> +OPENGL_WINSYS_append =3D "${@bb.utils.filter('PACKAGECONFIG', 'x11 gbm w=
ayland dispmanx egl viv-fb', d)}"

Needs a leading space?
