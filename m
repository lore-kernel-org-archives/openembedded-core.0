Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.79])
 by mx.groups.io with SMTP id smtpd.web08.4337.1614154313052424790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 00:11:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=qgOOtL0N;
 spf=pass (domain: kpit.com, ip: 40.107.138.79, mailfrom: rahul.taya@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzWIFfCPFaOAHIydp9ChA9CY6eC/TqA3xkKGBsPB59dKXbPke/GIgRnK1Y88c56hu5LcjYjQkohu5pH7UbOP7JXzjouyodsAKJJNTP3DDKzuhiGJ50Ri2j2pkCHab9gL8BOqx/Ib0AXd3m2eaSycDAhpA2HdDj49ANMokuPxY1FTmsyE90laIhqQThOSilzZ9x0xlLcH9BxSZsYicP9DUqY4Z7BJSh3Rxm4RA7W5Q30CjAp1QAfkLxqcAay+Axjvf1/hUY8If6Ld9bb/X3HM4kpjcQNrHeAJ+Y8I+kRmYG/4CfwaMDiI+QWfA9/qXRul6uKhoB/oF/aH1rmW/l1mGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzK9RGjTAuCnbuLTu5L7R0sjuSkoPyOh+8zTQNp2c2o=;
 b=MEkfpY5/MnWkKaOVrepVOjzI59TGRndttPXPsLofXCurzPU8NhBSzewmGfNBw9mo6veJ9cFIjTK4anRG8zJw9zEcCkC/X+rTCy1zw7U0Vnho2eAegjTEj1Ew0Cb+nDL6qpr6wrEpdO3/JuIONxg0c6NL0/Ytyw/LfiGBkogHQWLvvMU7LloXHw7SILeWbhFcqar6+tHstsOMShzH7n9P3DHScN7kOno0Fjn2fsIE62+iOaQgh8jmIIHgiEhaD50I6fIEAwB0qaXc0Pj8SHp4Dx/ipdC+or+XzPGuwVyfLl8ypf8napk8p2lCf+pqEmCBXaRJMPMcZT0ck8mFhd5zlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzK9RGjTAuCnbuLTu5L7R0sjuSkoPyOh+8zTQNp2c2o=;
 b=qgOOtL0NqQu3Au1+rWyjZ/unEsS9gzd4oQxsrF68u/7ASrJPwgqNw3dHMVPEB9gZaUiwHvyTN1OcaDKBRXMShflOSeynJrQRT9k37wgae1u3x/EPGskJvKxt0EQ/dmBEbEEcnPmf6kFnaNibK+SBLPKtDlyY1wa36LrST/RxlYk=
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::18)
 by BM1PR01MB2706.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:4d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Wed, 24 Feb
 2021 08:11:45 +0000
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5c87:1000:2e85:9ab7]) by BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5c87:1000:2e85:9ab7%7]) with mapi id 15.20.3890.019; Wed, 24 Feb 2021
 08:11:45 +0000
From: "Rahul Taya" <Rahul.Taya@kpit.com>
To: akuster808 <akuster808@gmail.com>, Martin Jansa <Martin.Jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, Nisha Parrakat <Nisha.Parrakat@kpit.com>, Harpritkaur
 Bhandari <Harpritkaur.Bhandari@kpit.com>
Subject: Re: [OE-core] [meta-openembedded][dunfell][PATCH] nghttp2: Add fix for CVE-2020-11080
Thread-Topic: [OE-core] [meta-openembedded][dunfell][PATCH] nghttp2: Add fix
 for CVE-2020-11080
Thread-Index: 
 AQHXBD835SbkqO6G9EifuVOeU2EF76pa8c6AgAEZvtGAAGy3gIAFSl2AgAE33gCABAXuJg==
Date: Wed, 24 Feb 2021 08:11:45 +0000
Message-ID: 
 <BMXPR01MB3431E4A1E6B4ED0EE8F165C0F29F9@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
References: <20210216083900.7631-1-Rahul.Taya@kpit.com>
 <8abf4b2a-c035-eba0-0a19-8136296e4ad4@gmail.com>
 <BMXPR01MB34318E8491F3B495127DDFB8F2869@BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM>
 <d0888474-b89b-51f3-5303-407c52fefad3@gmail.com>
 <CA+chaQeiJaB2ngYNTsSgnD_MRy1COxUk5ivOfJxF2eLnO4Wi+A@mail.gmail.com>,<fe7724f4-8941-fd23-97f0-6d260bdca29d@gmail.com>
In-Reply-To: <fe7724f4-8941-fd23-97f0-6d260bdca29d@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=kpit.com;
x-originating-ip: [122.169.11.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f5c21aee-bff9-4c08-e09b-08d8d89bd3a1
x-ms-traffictypediagnostic: BM1PR01MB2706:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BM1PR01MB2706278A813317AEC5308F12F29F9@BM1PR01MB2706.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tDu2oK05Dpm8diw6zg9sViXuWOaHv+Pc/RkuYmA1cz3W57WqPtudKlw+1fhPIUDj/pLCiVv5/michB0ouoOUY0Y/OmYI4zgOhLnf3HCefNKPYkwfLCOMFB6J2BHWMna4OU2ogR8Ql2qgJoP6Dh6NGOx+P+sX1c+EWb5KSScwX1EgrCw52gvuOYNCcAsepj86o5QCmKzf1x2/60t2G1E/JKICTtSsBU4IAjozMqB3B7ie4NNev9mg+YfX7ay7KLtLePbMK5YynUzBkL1i4o7fHqmVMDWlzMktOrkxziV1DtQ9/cypVR2xMj7zZL2cLGLT2V/kPhqhE5U+J4X+p3dvzMjWW5wInXrqviC8IjvyOiZGa8L99wvoh2f7AKfGU8RO9BQPFn1GbeIWqPidZP+u698c1WtWl1Lw6LIYqQCrngQmicuUcNqS5gfHGRVZxPqL7tndibXL1zAV49SeFu058yLd9rRhV0+C0PHtw1+bxc12F+SJA8G1veB/RN7iw9V8FbRAt9GqAZBkCKAxGHv3PB7/kKrd1mUza8RGdpms6iVyYmFeQcJi16QAua2owpTwtMtWllz9lhDGMo7efRQwGKf936+j35bqqXniPu3Udk8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39850400004)(52536014)(53546011)(83380400001)(4326008)(6506007)(7696005)(478600001)(966005)(66574015)(64756008)(66446008)(8936002)(66556008)(66946007)(76116006)(66476007)(45080400002)(110136005)(316002)(33656002)(9686003)(8676002)(5660300002)(30864003)(2906002)(54906003)(19627405001)(186003)(107886003)(26005)(86362001)(71200400001)(166002)(55016002)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?AD8X8YYz8tsHiOySQUN1ZdoIXg0YTxVue64jJgTsvDxKvQqtyfpmBDTakOQs?=
 =?us-ascii?Q?/VCLFxpi3+BAgYE15c1zJ1dLlBgmTDi8te/InPc24+TYFQTnZoTsxBYuQBcN?=
 =?us-ascii?Q?wqVDhXOte9PgseqRCP/esxnz1hUDJKGXeF+VQ7LaHi5W/5FiBJ5SmIy4hogQ?=
 =?us-ascii?Q?7ML6EopFina0SN6nsiXpoh/udVZ7wQTNctk8z9hGJ0TJ039bYisqcdveMRsK?=
 =?us-ascii?Q?0jnfTKp6YlQUbxYbvxlLNb3M8MvtBjhO5Hsak7L20qZ/KXhuJW10rebxqFJo?=
 =?us-ascii?Q?zzutM9/QZyGFECM22sfAf/Ehnm5gMkFPHCLxILNAqC9MQYysVp06FCSUTeu8?=
 =?us-ascii?Q?mfimoCj6LPVHablJf8l0yEDeIbdxl2gHnpVRVg4dd1eEk+FHwS7B+HElgoaf?=
 =?us-ascii?Q?h47yyYciKGJMOcfWKHDH860WEkbDO/T/6Or8QCmdfoH1yOYVIc383ChTLlHu?=
 =?us-ascii?Q?RuWlbO0BZBRoqxU0C5VmxImiupruUbxnXa6t9JTMdfMD8qMEyxF4c+bGl+xO?=
 =?us-ascii?Q?hiQ3dTEyO8RehNBdyE97TSUSMAom46hQ/clUhqkM3k3U7+aPUhrr2BC+APD5?=
 =?us-ascii?Q?HaPLEoJgTgUTldcpWx7Uy8qrUlNTT91L6AwR4YqGgDshRpBK2C455CDj8RtW?=
 =?us-ascii?Q?qjDW03cPyMffjRaSYUnpWPl6EKRtyYGvvUTjRoHgj59qdpJqLEZMjdbQAjAT?=
 =?us-ascii?Q?koHoGZoRuPhLFh6RebhP0EJL4zf8tbl2dP/ndopNtEtKNkwhIOMdsJO0X9Xc?=
 =?us-ascii?Q?M0RZrg8RhRg/9L/1LmUeI3JjXjFP8bO7mX3pEIhxHOOJul4D2CCeVWe0hlYO?=
 =?us-ascii?Q?dusXYofZMjWi/LHyuJNZuB6CCOjuge59PFuYJ79vyRvCbdOVrjbyph1yXHN4?=
 =?us-ascii?Q?6YvB9cpVHgeJ2umVrYjDxnJjo3301oq6KxlTmP/gFgTy/OneV2X01XdCC14t?=
 =?us-ascii?Q?feVXyMf1XO5Ic6xIq9gd4sa9KGaIbaxnQACZjoucZocjgtpOdNXsWpCiD5Q3?=
 =?us-ascii?Q?bXCywmIpn5RYCFT1BwQ8H3T6HtZl++gQlsDqq+yPtAt065zl42H3expeAPkn?=
 =?us-ascii?Q?jewAoILcpLJWjovB27CGfH0cgO2hN/LaKnBScNqHMmAaEgbdKH9FsxFQfXUs?=
 =?us-ascii?Q?Ywyg+OIZOS0565M+5q30pBPQU5pjCeICl8vLQl1MlCC+GfhoukRyIGym8KsQ?=
 =?us-ascii?Q?EmmZ/CdNj2k6pX0AR1SNNDO0dBo0rGPini0veJ+Zar5d43PlWBNDQj5yftAS?=
 =?us-ascii?Q?ui6aST7/8I/A6WhHhH2GFZ5PTPvLdH0J2vjPmOmjyILiFSOyPGdQcQzK7R8z?=
 =?us-ascii?Q?I3zBf9XjIjWKqoOiGYOQ/CYu?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c21aee-bff9-4c08-e09b-08d8d89bd3a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 08:11:45.2638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GCOAB9RZG2cs3UvSlW3QuDNtkMVkj+Msb9An4bqLSJZYxCSIn08VASNtWjED4wtWK4tLqr9j5r/DHZmerlZpyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2706
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB3431E4A1E6B4ED0EE8F165C0F29F9BMXPR01MB3431INDP_"

--_000_BMXPR01MB3431E4A1E6B4ED0EE8F165C0F29F9BMXPR01MB3431INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi akuster,

Is there any update on this patch ?

Also i'm able to send the patches but i'm not able to see my patches in me=
ssages folder.

I have sent subscribe message to below ML's:

openembedded-devel+subscribe@lists.openembedded.org<mailto:openembedded-de=
vel+subscribe@lists.openembedded.org>
openembedded-devel@lists.openembedded.org<mailto:openembedded-devel@lists.=
openembedded.org>

but not able to see my sent posts.
Can you please help here ?

Thanks and Regards,
Rahul Taya
________________________________
From: akuster808 <akuster808@gmail.com>
Sent: Monday, February 22, 2021 12:13 AM
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Rahul Taya <Rahul.Taya@kpit.com>; Openembedded-core@lists.openembedded=
.org <Openembedded-core@lists.openembedded.org>; raj.khem@gmail.com <raj.kh=
em@gmail.com>; Nisha Parrakat <Nisha.Parrakat@kpit.com>; Harpritkaur Bhanda=
ri <Harpritkaur.Bhandari@kpit.com>
Subject: Re: [OE-core] [meta-openembedded][dunfell][PATCH] nghttp2: Add fi=
x for CVE-2020-11080



On 2/20/21 4:07 PM, Martin Jansa wrote:
> Looks like this version of the patch got merged to meta-oe today and
> it fails to apply cleanly, will send update.
it got pushed into dunfell-next which was then removed.

-armin
>
> On Wed, Feb 17, 2021 at 4:20 PM akuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>
>
>     On 2/17/21 12:57 AM, Rahul Taya wrote:
>     > Hi,
>     >
>     > I have backported this patch from Master branch as in
>     master(v1.43.0)
>     > and Gatesgarth(v1.41.0) the code of this patch is already present =
in
>     > the source code so it is only applicable for Dunfell(v1.40.0) and
>     > Zeus(v1.39.1) branch.
>     >
>     > Yes i will add my signoff in the patch.
>     >
>     > *Can you please tell which is the correct ML for sending this
>     patch ?*
>     openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>
>
>     Also I am seeing this this  error.
>
>     Applying patch CVE-2020-11080.patch
>     patching file doc/CMakeLists.txt
>     patching file doc/Makefile.am
>     Hunk #1 FAILED at 69.
>     1 out of 1 hunk FAILED -- rejects in file doc/Makefile.am
>     patching file lib/includes/nghttp2/nghttp2.h
>     patching file lib/nghttp2_helper.c
>     patching file lib/nghttp2_option.c
>     patching file lib/nghttp2_option.h
>     patching file lib/nghttp2_session.c
>     Hunk #3 succeeded at 5694 (offset 31 lines).
>     Hunk #4 succeeded at 7470 (offset 29 lines).
>     patching file lib/nghttp2_session.h
>     patching file tests/main.c
>     Hunk #1 succeeded at 315 (offset -2 lines).
>     patching file tests/nghttp2_session_test.c
>     Hunk #1 succeeded at 10558 (offset -56 lines).
>     patching file tests/nghttp2_session_test.h
>     Patch CVE-2020-11080.patch does not apply (enforce with -f)*
>     *
>     -armin*
>     *
>     >
>     > Thanks and Regards,
>     > Rahul Taya
>     >
>     --------------------------------------------------------------------=
----
>     > *From:* akuster808 <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     > *Sent:* Tuesday, February 16, 2021 9:32 PM
>     > *To:* Rahul Taya <Rahul.Taya@kpit.com <mailto:Rahul.Taya@kpit.com>=
>;
>     > Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     > <Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>>;
>     raj.khem@gmail.com <mailto:raj.khem@gmail.com>
>     > <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     > *Cc:* Nisha Parrakat <Nisha.Parrakat@kpit.com
>     <mailto:Nisha.Parrakat@kpit.com>>; Harpritkaur Bhandari
>     > <Harpritkaur.Bhandari@kpit.com
>     <mailto:Harpritkaur.Bhandari@kpit.com>>
>     > *Subject:* Re: [OE-core] [meta-openembedded][dunfell][PATCH]
>     nghttp2:
>     > Add fix for CVE-2020-11080
>     >
>     >
>     >
>     > On 2/16/21 12:39 AM, Rahul Taya wrote:
>     > > Added patch for CVE-2020-11080 taken from below link:
>     > >
>     >
>     https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
github.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F336a98feb0d56b9ac54e12736b18785c2=
7f75090&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cabd0c38f07d4492e704608=
d8d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637495298481483481%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DXlVWs1MqK9VMOpDeGiDk5dpKLfWVU9eosVusgY6B=
SaY%3D&amp;reserved=3D0
>     > >
>     > > Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com
>     <mailto:Rahul.Taya@kpit.com>>
>     > Wrong ML.
>     >
>     > Is master or Gatesgath affected by this?
>     >
>     > Also the patch it self is missing your signoff.
>     >
>     > -armin
>     > > ---
>     > >  .../nghttp2/nghttp2/CVE-2020-11080.patch      | 306
>     ++++++++++++++++++
>     > >  .../recipes-support/nghttp2/nghttp2_1.40.0.bb
>     <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
nghttp2_1.40.0.bb%2F&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cabd0c38f0=
7d4492e704608d8d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637495=
298481483481%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DSH2x72EejbALlFKSrppzTRuurKC=
GkJNBFCveRL%2FJQCY%3D&amp;reserved=3D0> |   1 +
>     > >  2 files changed, 307 insertions(+)
>     > >  create mode 100644
>     > meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.pat=
ch
>     > >
>     > > diff --git
>     >
>     a/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.pat=
ch
>     >
>     b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.pat=
ch
>     > > new file mode 100644
>     > > index 000000000..a376e5372
>     > > --- /dev/null
>     > > +++
>     >
>     b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.pat=
ch
>     > > @@ -0,0 +1,306 @@
>     > > +From 336a98feb0d56b9ac54e12736b18785c27f75090 Mon Sep 17
>     00:00:00 2001
>     > > +From: James M Snell <jasnell@gmail.com
>     <mailto:jasnell@gmail.com>>
>     > > +Date: Fri, 17 Apr 2020 16:53:51 -0700
>     > > +Subject: [PATCH] Implement max settings option
>     > > +
>     > > +CVE: CVE-2020-11080
>     > > +Upstream-Status: Backport
>     >
>     [https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgithub.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F336a98feb0d56b9ac54e12736b18785c=
27f75090&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cabd0c38f07d4492e70460=
8d8d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637495298481493480=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DeTMCIL1SPY7RkIwK%2B5s%2BSiQWRJ6lquajTKZ=
Qjmn1CHo%3D&amp;reserved=3D0]
>     > > +Comment: No hunks refreshed
>     > > +---
>     > > + doc/CMakeLists.txt             |  1 +
>     > > + doc/Makefile.am                |  1 +
>     > > + lib/includes/nghttp2/nghttp2.h | 23 +++++++++++++
>     > > + lib/nghttp2_helper.c           |  2 ++
>     > > + lib/nghttp2_option.c           |  5 +++
>     > > + lib/nghttp2_option.h           |  5 +++
>     > > + lib/nghttp2_session.c          | 21 ++++++++++++
>     > > + lib/nghttp2_session.h          |  2 ++
>     > > + tests/main.c                   |  2 ++
>     > > + tests/nghttp2_session_test.c   | 61
>     ++++++++++++++++++++++++++++++++++
>     > > + tests/nghttp2_session_test.h   |  1 +
>     > > + 11 files changed, 124 insertions(+)
>     > > +
>     > > +diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
>     > > +index 34c027929..f3aec84da 100644
>     > > +--- a/doc/CMakeLists.txt
>     > > ++++ b/doc/CMakeLists.txt
>     > > +@@ -42,6 +42,7 @@ set(APIDOCS
>     > > +   nghttp2_option_set_no_recv_client_magic.rst
>     > > +   nghttp2_option_set_peer_max_concurrent_streams.rst
>     > > +   nghttp2_option_set_user_recv_extension_type.rst
>     > > ++  nghttp2_option_set_max_settings.rst
>     > > +   nghttp2_pack_settings_payload.rst
>     > > +   nghttp2_priority_spec_check_default.rst
>     > > +   nghttp2_priority_spec_default_init.rst
>     > > +diff --git a/doc/Makefile.am b/doc/Makefile.am
>     > > +index 4d73cef50..f073bfa4c 100644
>     > > +--- a/doc/Makefile.am
>     > > ++++ b/doc/Makefile.am
>     > > +@@ -69,6 +69,7 @@ APIDOCS=3D \
>     > > +       nghttp2_option_set_peer_max_concurrent_streams.rst \
>     > > +       nghttp2_option_set_user_recv_extension_type.rst \
>     > > +       nghttp2_option_set_max_outbound_ack.rst \
>     > > ++      nghttp2_option_set_max_settings.rst \
>     > > +       nghttp2_pack_settings_payload.rst \
>     > > +       nghttp2_priority_spec_check_default.rst \
>     > > +       nghttp2_priority_spec_default_init.rst \
>     > > +diff --git a/lib/includes/nghttp2/nghttp2.h
>     > b/lib/includes/nghttp2/nghttp2.h
>     > > +index e3aeb9fed..9be6eea5c 100644
>     > > +--- a/lib/includes/nghttp2/nghttp2.h
>     > > ++++ b/lib/includes/nghttp2/nghttp2.h
>     > > +@@ -228,6 +228,13 @@ typedef struct {
>     > > +  */
>     > > + #define NGHTTP2_CLIENT_MAGIC_LEN 24
>     > > +
>     > > ++/**
>     > > ++ * @macro
>     > > ++ *
>     > > ++ * The default max number of settings per SETTINGS frame
>     > > ++ */
>     > > ++#define NGHTTP2_DEFAULT_MAX_SETTINGS 32
>     > > ++
>     > > + /**
>     > > +  * @enum
>     > > +  *
>     > > +@@ -398,6 +405,11 @@ typedef enum {
>     > > +    * receives an other type of frame.
>     > > +    */
>     > > +   NGHTTP2_ERR_SETTINGS_EXPECTED =3D -536,
>     > > ++  /**
>     > > ++   * When a local endpoint receives too many settings entries
>     > > ++   * in a single SETTINGS frame.
>     > > ++   */
>     > > ++  NGHTTP2_ERR_TOO_MANY_SETTINGS =3D -537,
>     > > +   /**
>     > > +    * The errors < :enum:`NGHTTP2_ERR_FATAL` mean that the
>     library is
>     > > +    * under unexpected condition and processing was
>     terminated (e.g.,
>     > > +@@ -2659,6 +2671,17 @@ NGHTTP2_EXTERN void
>     > nghttp2_option_set_no_closed_streams(nghttp2_option *option,
>     > > + NGHTTP2_EXTERN void
>     > nghttp2_option_set_max_outbound_ack(nghttp2_option *option,
>     > > +
>     size_t val);
>     > > +
>     > > ++/**
>     > > ++ * @function
>     > > ++ *
>     > > ++ * This function sets the maximum number of SETTINGS entries p=
er
>     > > ++ * SETTINGS frame that will be accepted. If more than those
>     entries
>     > > ++ * are received, the peer is considered to be misbehaving
>     and session
>     > > ++ * will be closed. The default value is 32.
>     > > ++ */
>     > > ++NGHTTP2_EXTERN void
>     nghttp2_option_set_max_settings(nghttp2_option
>     > *option,
>     > > ++                                                    size_t val=
);
>     > > ++
>     > > + /**
>     > > +  * @function
>     > > +  *
>     > > +diff --git a/lib/nghttp2_helper.c b/lib/nghttp2_helper.c
>     > > +index 91136a619..0bd541472 100644
>     > > +--- a/lib/nghttp2_helper.c
>     > > ++++ b/lib/nghttp2_helper.c
>     > > +@@ -334,6 +334,8 @@ const char *nghttp2_strerror(int
>     error_code) {
>     > > +   case NGHTTP2_ERR_FLOODED:
>     > > +     return "Flooding was detected in this HTTP/2 session, and =
it
>     > must be "
>     > > +            "closed";
>     > > ++  case NGHTTP2_ERR_TOO_MANY_SETTINGS:
>     > > ++    return "SETTINGS frame contained more than the maximum
>     allowed
>     > entries";
>     > > +   default:
>     > > +     return "Unknown error code";
>     > > +   }
>     > > +diff --git a/lib/nghttp2_option.c b/lib/nghttp2_option.c
>     > > +index e53f22d36..34348e660 100644
>     > > +--- a/lib/nghttp2_option.c
>     > > ++++ b/lib/nghttp2_option.c
>     > > +@@ -121,3 +121,8 @@ void
>     > nghttp2_option_set_max_outbound_ack(nghttp2_option *option,
>     size_t val) {
>     > > +   option->opt_set_mask |=3D NGHTTP2_OPT_MAX_OUTBOUND_ACK;
>     > > +   option->max_outbound_ack =3D val;
>     > > + }
>     > > ++
>     > > ++void nghttp2_option_set_max_settings(nghttp2_option *option,
>     > size_t val) {
>     > > ++  option->opt_set_mask |=3D NGHTTP2_OPT_MAX_SETTINGS;
>     > > ++  option->max_settings =3D val;
>     > > ++}
>     > > +diff --git a/lib/nghttp2_option.h b/lib/nghttp2_option.h
>     > > +index 1f740aaa6..939729fdc 100644
>     > > +--- a/lib/nghttp2_option.h
>     > > ++++ b/lib/nghttp2_option.h
>     > > +@@ -67,6 +67,7 @@ typedef enum {
>     > > +   NGHTTP2_OPT_MAX_DEFLATE_DYNAMIC_TABLE_SIZE =3D 1 << 9,
>     > > +   NGHTTP2_OPT_NO_CLOSED_STREAMS =3D 1 << 10,
>     > > +   NGHTTP2_OPT_MAX_OUTBOUND_ACK =3D 1 << 11,
>     > > ++  NGHTTP2_OPT_MAX_SETTINGS =3D 1 << 12,
>     > > + } nghttp2_option_flag;
>     > > +
>     > > + /**
>     > > +@@ -85,6 +86,10 @@ struct nghttp2_option {
>     > > +    * NGHTTP2_OPT_MAX_OUTBOUND_ACK
>     > > +    */
>     > > +   size_t max_outbound_ack;
>     > > ++  /**
>     > > ++   * NGHTTP2_OPT_MAX_SETTINGS
>     > > ++   */
>     > > ++  size_t max_settings;
>     > > +   /**
>     > > +    * Bitwise OR of nghttp2_option_flag to determine that
>     which fields
>     > > +    * are specified.
>     > > +diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
>     > > +index 563ccd7de..415e34776 100644
>     > > +--- a/lib/nghttp2_session.c
>     > > ++++ b/lib/nghttp2_session.c
>     > > +@@ -458,6 +458,7 @@ static int session_new(nghttp2_session
>     > **session_ptr,
>     > > +
>     > > +   (*session_ptr)->max_send_header_block_length =3D
>     > NGHTTP2_MAX_HEADERSLEN;
>     > > +   (*session_ptr)->max_outbound_ack =3D
>     > NGHTTP2_DEFAULT_MAX_OBQ_FLOOD_ITEM;
>     > > ++  (*session_ptr)->max_settings =3D NGHTTP2_DEFAULT_MAX_SETTING=
S;
>     > > +
>     > > +   if (option) {
>     > > +     if ((option->opt_set_mask &
>     NGHTTP2_OPT_NO_AUTO_WINDOW_UPDATE) &&
>     > > +@@ -521,6 +522,11 @@ static int session_new(nghttp2_session
>     > **session_ptr,
>     > > +     if (option->opt_set_mask & NGHTTP2_OPT_MAX_OUTBOUND_ACK) {
>     > > +       (*session_ptr)->max_outbound_ack =3D
>     option->max_outbound_ack;
>     > > +     }
>     > > ++
>     > > ++    if ((option->opt_set_mask & NGHTTP2_OPT_MAX_SETTINGS) &&
>     > > ++        option->max_settings) {
>     > > ++      (*session_ptr)->max_settings =3D option->max_settings;
>     > > ++    }
>     > > +   }
>     > > +
>     > > +   rv =3D nghttp2_hd_deflate_init2(&(*session_ptr)->hd_deflater=
,
>     > > +@@ -5657,6 +5663,16 @@ ssize_t
>     > nghttp2_session_mem_recv(nghttp2_session *session, const uint8_t
>     *in,
>     > > +           iframe->max_niv =3D
>     > > +               iframe->frame.hd.length /
>     > NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH + 1;
>     > > +
>     > > ++          if (iframe->max_niv - 1 > session->max_settings) {
>     > > ++            rv =3D nghttp2_session_terminate_session_with_reas=
on(
>     > > ++                session, NGHTTP2_ENHANCE_YOUR_CALM,
>     > > ++                "SETTINGS: too many setting entries");
>     > > ++            if (nghttp2_is_fatal(rv)) {
>     > > ++              return rv;
>     > > ++            }
>     > > ++            return (ssize_t)inlen;
>     > > ++          }
>     > > ++
>     > > +           iframe->iv =3D nghttp2_mem_malloc(mem,
>     > sizeof(nghttp2_settings_entry) *
>     > > +
>     iframe->max_niv);
>     > > +
>     > > +@@ -7425,6 +7441,11 @@ static int
>     > nghttp2_session_upgrade_internal(nghttp2_session *session,
>     > > +   if (settings_payloadlen %
>     NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH) {
>     > > +     return NGHTTP2_ERR_INVALID_ARGUMENT;
>     > > +   }
>     > > ++  /* SETTINGS frame contains too many settings */
>     > > ++  if (settings_payloadlen / NGHTTP2_FRAME_SETTINGS_ENTRY_LENGT=
H
>     > > ++        > session->max_settings) {
>     > > ++    return NGHTTP2_ERR_TOO_MANY_SETTINGS;
>     > > ++  }
>     > > +   rv =3D nghttp2_frame_unpack_settings_payload2(&iv, &niv,
>     > settings_payload,
>     > > +
>     settings_payloadlen,
>     > mem);
>     > > +   if (rv !=3D 0) {
>     > > +diff --git a/lib/nghttp2_session.h b/lib/nghttp2_session.h
>     > > +index d20827315..07bfbb6c9 100644
>     > > +--- a/lib/nghttp2_session.h
>     > > ++++ b/lib/nghttp2_session.h
>     > > +@@ -267,6 +267,8 @@ struct nghttp2_session {
>     > > +   /* The maximum length of header block to send.  Calculated
>     by the
>     > > +      same way as nghttp2_hd_deflate_bound() does. */
>     > > +   size_t max_send_header_block_length;
>     > > ++  /* The maximum number of settings accepted per SETTINGS
>     frame. */
>     > > ++  size_t max_settings;
>     > > +   /* Next Stream ID. Made unsigned int to detect >=3D (1 <<
>     31). */
>     > > +   uint32_t next_stream_id;
>     > > +   /* The last stream ID this session initiated.  For client
>     session,
>     > > +diff --git a/tests/main.c b/tests/main.c
>     > > +index 41e0b03eb..67eb4a1c2 100644
>     > > +--- a/tests/main.c
>     > > ++++ b/tests/main.c
>     > > +@@ -317,6 +317,8 @@ int main() {
>     > > +
>     test_nghttp2_session_set_local_window_size) ||
>     > > +       !CU_add_test(pSuite,
>     "session_cancel_from_before_frame_send",
>     > > +
>     > test_nghttp2_session_cancel_from_before_frame_send) ||
>     > > ++      !CU_add_test(pSuite, "session_too_many_settings",
>     > > ++                   test_nghttp2_session_too_many_settings) ||
>     > > +       !CU_add_test(pSuite, "session_removed_closed_stream",
>     > > +
>     test_nghttp2_session_removed_closed_stream) ||
>     > > +       !CU_add_test(pSuite, "session_pause_data",
>     > > +diff --git a/tests/nghttp2_session_test.c
>     > b/tests/nghttp2_session_test.c
>     > > +index 6eb8e244d..33ee3ad84 100644
>     > > +--- a/tests/nghttp2_session_test.c
>     > > ++++ b/tests/nghttp2_session_test.c
>     > > +@@ -10614,6 +10614,67 @@ void
>     > test_nghttp2_session_cancel_from_before_frame_send(void) {
>     > > +   nghttp2_session_del(session);
>     > > + }
>     > > +
>     > > ++void test_nghttp2_session_too_many_settings(void) {
>     > > ++  nghttp2_session *session;
>     > > ++  nghttp2_option *option;
>     > > ++  nghttp2_session_callbacks callbacks;
>     > > ++  nghttp2_frame frame;
>     > > ++  nghttp2_bufs bufs;
>     > > ++  nghttp2_buf *buf;
>     > > ++  ssize_t rv;
>     > > ++  my_user_data ud;
>     > > ++  nghttp2_settings_entry iv[3];
>     > > ++  nghttp2_mem *mem;
>     > > ++  nghttp2_outbound_item *item;
>     > > ++
>     > > ++  mem =3D nghttp2_mem_default();
>     > > ++  frame_pack_bufs_init(&bufs);
>     > > ++
>     > > ++  memset(&callbacks, 0, sizeof(nghttp2_session_callbacks));
>     > > ++  callbacks.on_frame_recv_callback =3D on_frame_recv_callback;
>     > > ++  callbacks.send_callback =3D null_send_callback;
>     > > ++
>     > > ++  nghttp2_option_new(&option);
>     > > ++  nghttp2_option_set_max_settings(option, 1);
>     > > ++
>     > > ++  nghttp2_session_client_new2(&session, &callbacks, &ud,
>     option);
>     > > ++
>     > > ++  CU_ASSERT(1 =3D=3D session->max_settings);
>     > > ++
>     > > ++  nghttp2_option_del(option);
>     > > ++
>     > > ++  iv[0].settings_id =3D NGHTTP2_SETTINGS_HEADER_TABLE_SIZE;
>     > > ++  iv[0].value =3D 3000;
>     > > ++
>     > > ++  iv[1].settings_id =3D NGHTTP2_SETTINGS_INITIAL_WINDOW_SIZE;
>     > > ++  iv[1].value =3D 16384;
>     > > ++
>     > > ++  nghttp2_frame_settings_init(&frame.settings,
>     NGHTTP2_FLAG_NONE,
>     > dup_iv(iv, 2),
>     > > ++                              2);
>     > > ++
>     > > ++  rv =3D nghttp2_frame_pack_settings(&bufs, &frame.settings);
>     > > ++
>     > > ++  CU_ASSERT(0 =3D=3D rv);
>     > > ++  CU_ASSERT(nghttp2_bufs_len(&bufs) > 0);
>     > > ++
>     > > ++  nghttp2_frame_settings_free(&frame.settings, mem);
>     > > ++
>     > > ++  buf =3D &bufs.head->buf;
>     > > ++  assert(nghttp2_bufs_len(&bufs) =3D=3D nghttp2_buf_len(buf));
>     > > ++
>     > > ++  ud.frame_recv_cb_called =3D 0;
>     > > ++
>     > > ++  rv =3D nghttp2_session_mem_recv(session, buf->pos,
>     > nghttp2_buf_len(buf));
>     > > ++  CU_ASSERT((ssize_t)nghttp2_buf_len(buf) =3D=3D rv);
>     > > ++
>     > > ++  item =3D nghttp2_session_get_next_ob_item(session);
>     > > ++  CU_ASSERT(NGHTTP2_GOAWAY =3D=3D item->frame.hd.type);
>     > > ++
>     > > ++  nghttp2_bufs_reset(&bufs);
>     > > ++  nghttp2_bufs_free(&bufs);
>     > > ++  nghttp2_session_del(session);
>     > > ++}
>     > > ++
>     > > + static void
>     > > + prepare_session_removed_closed_stream(nghttp2_session *session=
,
>     > > +                                       nghttp2_hd_deflater
>     *deflater) {
>     > > +diff --git a/tests/nghttp2_session_test.h
>     > b/tests/nghttp2_session_test.h
>     > > +index e872c5d0b..818c808d0 100644
>     > > +--- a/tests/nghttp2_session_test.h
>     > > ++++ b/tests/nghttp2_session_test.h
>     > > +@@ -156,6 +156,7 @@ void
>     > test_nghttp2_session_repeated_priority_change(void);
>     > > + void test_nghttp2_session_repeated_priority_submission(void);
>     > > + void test_nghttp2_session_set_local_window_size(void);
>     > > + void test_nghttp2_session_cancel_from_before_frame_send(void);
>     > > ++void test_nghttp2_session_too_many_settings(void);
>     > > + void test_nghttp2_session_removed_closed_stream(void);
>     > > + void test_nghttp2_session_pause_data(void);
>     > > + void test_nghttp2_session_no_closed_streams(void);
>     > > diff --git
>     > a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
>     <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
nghttp2_1.40.0.bb%2F&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cabd0c38f0=
7d4492e704608d8d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637495=
298481493480%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DpK2ccOglR19%2BMs3q3C6v0CmSn=
CyS7HkgwN2cWhS75kE%3D&amp;reserved=3D0>
>     > b/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
>     <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
nghttp2_1.40.0.bb%2F&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cabd0c38f0=
7d4492e704608d8d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637495=
298481493480%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DpK2ccOglR19%2BMs3q3C6v0CmSn=
CyS7HkgwN2cWhS75kE%3D&amp;reserved=3D0>
>     > > index 9ed8c5642..b212ede4d 100644
>     > > ---
>     a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
>     <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
nghttp2_1.40.0.bb%2F&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cabd0c38f0=
7d4492e704608d8d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637495=
298481493480%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DpK2ccOglR19%2BMs3q3C6v0CmSn=
CyS7HkgwN2cWhS75kE%3D&amp;reserved=3D0>
>     > > +++
>     b/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
>     <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
nghttp2_1.40.0.bb%2F&amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cabd0c38f0=
7d4492e704608d8d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637495=
298481493480%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DpK2ccOglR19%2BMs3q3C6v0CmSn=
CyS7HkgwN2cWhS75kE%3D&amp;reserved=3D0>
>     > > @@ -10,6 +10,7 @@ UPSTREAM_CHECK_URI =3D
>     >
>     "https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgithub.com%2Fnghttp2%2Fnghttp2%2Freleases&amp;data=3D04%7C01%7CRahul.Taya%=
40kpit.com%7Cabd0c38f07d4492e704608d8d698a3e6%7C3539451eb46e4a26a242ff61502=
855c7%7C0%7C0%7C637495298481493480%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DvrrKN=
WkedGjB7Q8L%2BahkQGj6cGlUX%2BHNw7epJLJ9zGc%3D&amp;reserved=3D0"
>     > >  SRC_URI =3D "\
>     > >
>     >
>     https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
github.com%2Fnghttp2%2Fnghttp2%2Freleases%2Fdownload%2Fv%24&amp;data=3D04%7=
C01%7CRahul.Taya%40kpit.com%7Cabd0c38f07d4492e704608d8d698a3e6%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637495298481493480%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3DIpyRVgtTSEsajguZx0eUP%2FdfsZLoXA9IxgRPNZAlvME%3D&amp;reserved=
=3D0{PV}/nghttp2-${PV}.tar.xz
>     <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgithub.com%2Fnghttp2%2Fnghttp2%2Freleases%2Fdownload%2Fv%24&amp;data=3D04%=
7C01%7CRahul.Taya%40kpit.com%7Cabd0c38f07d4492e704608d8d698a3e6%7C3539451eb=
46e4a26a242ff61502855c7%7C0%7C0%7C637495298481493480%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000=
&amp;sdata=3DIpyRVgtTSEsajguZx0eUP%2FdfsZLoXA9IxgRPNZAlvME%3D&amp;reserved=
=3D0>
>     > \
>     > >      file://0001-fetch-ocsp-response-use-python3.patch \
>     > > +    file://CVE-2020-11080.patch \
>     > >  "
>     > >  SRC_URI[md5sum] =3D "8d1a6b96760254e4dd142d7176e8fb7c"
>     > >  SRC_URI[sha256sum] =3D
>     > "09fc43d428ff237138733c737b29fb1a7e49d49de06d2edbed3bc4cdcee69073"
>     > > --
>     > > 2.17.1
>     > >
>     > > This message contains information that may be privileged or
>     > confidential and is the property of the KPIT Technologies Ltd. It =
is
>     > intended only for the person to whom it is addressed. If you are n=
ot
>     > the intended recipient, you are not authorized to read, print,
>     retain
>     > copy, disseminate, distribute, or use this message or any part
>     > thereof. If you receive this message in error, please notify the
>     > sender immediately and delete all copies of this message. KPIT
>     > Technologies Ltd. does not accept any liability for virus
>     infected mails.
>     > >
>     > >
>     > >
>     >
>     > This message contains information that may be privileged or
>     > confidential and is the property of the KPIT Technologies Ltd. It =
is
>     > intended only for the person to whom it is addressed. If you are n=
ot
>     > the intended recipient, you are not authorized to read, print,
>     retain
>     > copy, disseminate, distribute, or use this message or any part
>     > thereof. If you receive this message in error, please notify the
>     > sender immediately and delete all copies of this message. KPIT
>     > Technologies Ltd. does not accept any liability for virus
>     infected mails.
>
>
>    =20
>

This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print, retain copy, disseminate, distribute, =
or use this message or any part thereof. If you receive this message in err=
or, please notify the sender immediately and delete all copies of this mess=
age. KPIT Technologies Ltd. does not accept any liability for virus infecte=
d mails.

--_000_BMXPR01MB3431E4A1E6B4ED0EE8F165C0F29F9BMXPR01MB3431INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hi akuster,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Is there any update on this patch ?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Also i'm able to send the patches but i'm not able to see my patches in me=
ssages folder.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I have sent subscribe message to below ML's:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<a href=3D"mailto:openembedded-devel+subscribe@lists.openembedded.org">ope=
nembedded-devel+subscribe@lists.openembedded.org</a></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<a href=3D"mailto:openembedded-devel@lists.openembedded.org" id=3D"LPlnk98=
6215">openembedded-devel@lists.openembedded.org</a></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
but not able to see my sent posts.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Can you please help here ?<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div></div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:; margin:0">
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Thanks and R=
egards,</span></div>
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Rahul Taya</=
span><br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> akuster808 &lt;akust=
er808@gmail.com&gt;<br>
<b>Sent:</b> Monday, February 22, 2021 12:13 AM<br>
<b>To:</b> Martin Jansa &lt;martin.jansa@gmail.com&gt;<br>
<b>Cc:</b> Rahul Taya &lt;Rahul.Taya@kpit.com&gt;; Openembedded-core@lists=
.openembedded.org &lt;Openembedded-core@lists.openembedded.org&gt;; raj.khe=
m@gmail.com &lt;raj.khem@gmail.com&gt;; Nisha Parrakat &lt;Nisha.Parrakat@k=
pit.com&gt;; Harpritkaur Bhandari &lt;Harpritkaur.Bhandari@kpit.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [meta-openembedded][dunfell][PATCH] nghttp2:=
 Add fix for CVE-2020-11080</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
;">
<div class=3D"PlainText"><br>
<br>
On 2/20/21 4:07 PM, Martin Jansa wrote:<br>
&gt; Looks like this version of the patch got merged to meta-oe today and<=
br>
&gt; it fails to apply cleanly, will send update.<br>
it got pushed into dunfell-next which was then removed.<br>
<br>
-armin<br>
&gt;<br>
&gt; On Wed, Feb 17, 2021 at 4:20 PM akuster &lt;akuster808@gmail.com<br>
&gt; &lt;<a href=3D"mailto:akuster808@gmail.com">mailto:akuster808@gmail.c=
om</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; On 2/17/21 12:57 AM, Rahul Taya wrote:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; Hi,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; I have backported this patch from Master=
 branch as in<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; master(v1.43.0)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; and Gatesgarth(v1.41.0) the code of this=
 patch is already present in<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; the source code so it is only applicable=
 for Dunfell(v1.40.0) and<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; Zeus(v1.39.1) branch.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; Yes i will add my signoff in the patch.<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; *Can you please tell which is the correc=
t ML for sending this<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; patch ?*<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; openembedded-devel@lists.openembedded.org<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &lt;<a href=3D"mailto:openembedded-devel@list=
s.openembedded.org">mailto:openembedded-devel@lists.openembedded.org</a>&gt=
;<br>
&gt;<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; Also I am seeing this this&nbsp; error.<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; Applying patch CVE-2020-11080.patch<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; patching file doc/CMakeLists.txt<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; patching file doc/Makefile.am<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; Hunk #1 FAILED at 69.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; 1 out of 1 hunk FAILED -- rejects in file doc=
/Makefile.am<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; patching file lib/includes/nghttp2/nghttp2.h<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; patching file lib/nghttp2_helper.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; patching file lib/nghttp2_option.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; patching file lib/nghttp2_option.h<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; patching file lib/nghttp2_session.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; Hunk #3 succeeded at 5694 (offset 31 lines).<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; Hunk #4 succeeded at 7470 (offset 29 lines).<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; patching file lib/nghttp2_session.h<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; patching file tests/main.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; Hunk #1 succeeded at 315 (offset -2 lines).<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; patching file tests/nghttp2_session_test.c<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; Hunk #1 succeeded at 10558 (offset -56 lines)=
.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; patching file tests/nghttp2_session_test.h<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; Patch CVE-2020-11080.patch does not apply (en=
force with -f)*<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; -armin*<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; Thanks and Regards,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; Rahul Taya<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; ---------------------------------------------=
---------------------------<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; *From:* akuster808 &lt;akuster808@gmail.=
com<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &lt;<a href=3D"mailto:akuster808@gmail.com">m=
ailto:akuster808@gmail.com</a>&gt;&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; *Sent:* Tuesday, February 16, 2021 9:32 =
PM<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; *To:* Rahul Taya &lt;Rahul.Taya@kpit.com=
 &lt;<a href=3D"mailto:Rahul.Taya@kpit.com">mailto:Rahul.Taya@kpit.com</a>&=
gt;&gt;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; Openembedded-core@lists.openembedded.org=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &lt;<a href=3D"mailto:Openembedded-core@lists=
.openembedded.org">mailto:Openembedded-core@lists.openembedded.org</a>&gt;<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &lt;Openembedded-core@lists.openembedded=
.org<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &lt;<a href=3D"mailto:Openembedded-core@lists=
.openembedded.org">mailto:Openembedded-core@lists.openembedded.org</a>&gt;&=
gt;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; raj.khem@gmail.com &lt;<a href=3D"mailto:raj.=
khem@gmail.com">mailto:raj.khem@gmail.com</a>&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &lt;raj.khem@gmail.com &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com">mailto:raj.khem@gmail.com</a>&gt;&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; *Cc:* Nisha Parrakat &lt;Nisha.Parrakat@=
kpit.com<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &lt;<a href=3D"mailto:Nisha.Parrakat@kpit.com=
">mailto:Nisha.Parrakat@kpit.com</a>&gt;&gt;; Harpritkaur Bhandari<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &lt;Harpritkaur.Bhandari@kpit.com<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &lt;<a href=3D"mailto:Harpritkaur.Bhandari@kp=
it.com">mailto:Harpritkaur.Bhandari@kpit.com</a>&gt;&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; *Subject:* Re: [OE-core] [meta-openembed=
ded][dunfell][PATCH]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; nghttp2:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; Add fix for CVE-2020-11080<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; On 2/16/21 12:39 AM, Rahul Taya wrote:<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; Added patch for CVE-2020-11080 take=
n from below link:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://apc01.safelinks.protection=
.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Fcommit%2=
F336a98feb0d56b9ac54e12736b18785c27f75090&amp;amp;data=3D04%7C01%7CRahul.Ta=
ya%40kpit.com%7Cabd0c38f07d4492e704608d8d698a3e6%7C3539451eb46e4a26a242ff61=
502855c7%7C0%7C0%7C637495298481483481%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=
=3DXlVWs1MqK9VMOpDeGiDk5dpKLfWVU9eosVusgY6BSaY%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub=
.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F336a98feb0d56b9ac54e12736b18785c27f7509=
0&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cabd0c38f07d4492e704608d8=
d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637495298481483481%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DXlVWs1MqK9VMOpDeGiDk5dpKLfWVU9eosVusgY=
6BSaY%3D&amp;amp;reserved=3D0</a><br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; Signed-off-by: Rahul Taya &lt;Rahul=
.Taya@kpit.com<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &lt;<a href=3D"mailto:Rahul.Taya@kpit.com">ma=
ilto:Rahul.Taya@kpit.com</a>&gt;&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; Wrong ML.&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; Is master or Gatesgath affected by this?=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; Also the patch it self is missing your s=
ignoff.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; -armin<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ---<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; .../nghttp2/nghttp2/CVE-2020-=
11080.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 306<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; ++++++++++++++++++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; .../recipes-support/nghttp2/n=
ghttp2_1.40.0.bb<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &lt;<a href=3D"https://apc01.safelinks.protec=
tion.outlook.com/?url=3Dhttp%3A%2F%2Fnghttp2_1.40.0.bb%2F&amp;amp;data=3D04=
%7C01%7CRahul.Taya%40kpit.com%7Cabd0c38f07d4492e704608d8d698a3e6%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C637495298481483481%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;amp;sdata=3DSH2x72EejbALlFKSrppzTRuurKCGkJNBFCveRL%2FJQCY%3D&amp;amp;=
reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A=
%2F%2Fnghttp2_1.40.0.bb%2F&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7=
Cabd0c38f07d4492e704608d8d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C=
0%7C637495298481483481%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DSH2x72EejbALl=
FKSrppzTRuurKCGkJNBFCveRL%2FJQCY%3D&amp;amp;reserved=3D0</a>&gt;
 |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; 2 files changed, 307 insertio=
ns(+)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; create mode 100644<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; meta-networking/recipes-support/nghttp2/=
nghttp2/CVE-2020-11080.patch<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; diff --git<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; a/meta-networking/recipes-support/nghttp2/ngh=
ttp2/CVE-2020-11080.patch<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; b/meta-networking/recipes-support/nghttp2/ngh=
ttp2/CVE-2020-11080.patch<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; new file mode 100644<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; index 000000000..a376e5372<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; --- /dev/null<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; b/meta-networking/recipes-support/nghttp2/ngh=
ttp2/CVE-2020-11080.patch<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; @@ -0,0 +1,306 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +From 336a98feb0d56b9ac54e12736b187=
85c27f75090 Mon Sep 17<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; 00:00:00 2001<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +From: James M Snell &lt;jasnell@gm=
ail.com<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &lt;<a href=3D"mailto:jasnell@gmail.com">mail=
to:jasnell@gmail.com</a>&gt;&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +Date: Fri, 17 Apr 2020 16:53:51 -0=
700<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +Subject: [PATCH] Implement max set=
tings option<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +CVE: CVE-2020-11080<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +Upstream-Status: Backport<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; [<a href=3D"https://apc01.safelinks.protectio=
n.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Fcommit%=
2F336a98feb0d56b9ac54e12736b18785c27f75090&amp;amp;data=3D04%7C01%7CRahul.T=
aya%40kpit.com%7Cabd0c38f07d4492e704608d8d698a3e6%7C3539451eb46e4a26a242ff6=
1502855c7%7C0%7C0%7C637495298481493480%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=
=
=3DeTMCIL1SPY7RkIwK%2B5s%2BSiQWRJ6lquajTKZQjmn1CHo%3D&amp;amp;reserved=3D0=
">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F336a98feb0d56b9ac54e12736b18785c27f750=
90&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cabd0c38f07d4492e704608d=
8d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637495298481493480%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DeTMCIL1SPY7RkIwK%2B5s%2BSiQWRJ6lquajT=
KZQjmn1CHo%3D&amp;amp;reserved=3D0</a>]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +Comment: No hunks refreshed<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +---<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + doc/CMakeLists.txt&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + doc/Makefile.am&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&=
nbsp; 1 +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + lib/includes/nghttp2/nghttp2.h | =
23 +++++++++++++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + lib/nghttp2_helper.c&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + lib/nghttp2_option.c&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 5 +++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + lib/nghttp2_option.h&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 5 +++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + lib/nghttp2_session.c&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 21 ++++++++++++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + lib/nghttp2_session.h&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + tests/main.c&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; |&nbsp; 2 ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + tests/nghttp2_session_test.c&nbsp=
;&nbsp; | 61<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; ++++++++++++++++++++++++++++++++++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + tests/nghttp2_session_test.h&nbsp=
;&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + 11 files changed, 124 insertions(=
+)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +diff --git a/doc/CMakeLists.txt b/=
doc/CMakeLists.txt<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +index 34c027929..f3aec84da 100644<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +--- a/doc/CMakeLists.txt<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++++ b/doc/CMakeLists.txt<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +@@ -42,6 +42,7 @@ set(APIDOCS<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; nghttp2_option_set_no=
_recv_client_magic.rst<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; nghttp2_option_set_pe=
er_max_concurrent_streams.rst<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; nghttp2_option_set_us=
er_recv_extension_type.rst<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_option_set_max_set=
tings.rst<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; nghttp2_pack_settings=
_payload.rst<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; nghttp2_priority_spec=
_check_default.rst<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; nghttp2_priority_spec=
_default_init.rst<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +diff --git a/doc/Makefile.am b/doc=
/Makefile.am<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +index 4d73cef50..f073bfa4c 100644<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +--- a/doc/Makefile.am<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++++ b/doc/Makefile.am<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +@@ -69,6 +69,7 @@ APIDOCS=3D \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; nghttp2_option_set_peer_max_concurrent_streams.rst \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; nghttp2_option_set_user_recv_extension_type.rst \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; nghttp2_option_set_max_outbound_ack.rst \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ng=
http2_option_set_max_settings.rst \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; nghttp2_pack_settings_payload.rst \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; nghttp2_priority_spec_check_default.rst \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; nghttp2_priority_spec_default_init.rst \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +diff --git a/lib/includes/nghttp2/=
nghttp2.h<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; b/lib/includes/nghttp2/nghttp2.h<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +index e3aeb9fed..9be6eea5c 100644<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +--- a/lib/includes/nghttp2/nghttp2=
.h<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++++ b/lib/includes/nghttp2/nghttp2=
.h<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +@@ -228,6 +228,13 @@ typedef struc=
t {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp; */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + #define NGHTTP2_CLIENT_MAGIC_LEN =
24<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++/**<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++ * @macro<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++ *<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++ * The default max number of sett=
ings per SETTINGS frame<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++ */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++#define NGHTTP2_DEFAULT_MAX_SETTI=
NGS 32<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + /**<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp; * @enum<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp; *<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +@@ -398,6 +405,11 @@ typedef enum =
{<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp; * receives an o=
ther type of frame.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; NGHTTP2_ERR_SETTINGS_=
EXPECTED =3D -536,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; /**<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp; * When a local endpo=
int receives too many settings entries<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp; * in a single SETTIN=
GS frame.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; NGHTTP2_ERR_TOO_MANY_SETTI=
NGS =3D -537,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; /**<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp; * The errors &l=
t; :enum:`NGHTTP2_ERR_FATAL` mean that the<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; library is<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp; * under unexpec=
ted condition and processing was<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; terminated (e.g.,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +@@ -2659,6 +2671,17 @@ NGHTTP2_EXT=
ERN void<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; nghttp2_option_set_no_closed_streams(ngh=
ttp2_option *option,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + NGHTTP2_EXTERN void<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; nghttp2_option_set_max_outbound_ack(nght=
tp2_option *option,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; size_t val);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++/**<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++ * @function<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++ *<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++ * This function sets the maximum=
 number of SETTINGS entries per<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++ * SETTINGS frame that will be ac=
cepted. If more than those<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; entries<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++ * are received, the peer is cons=
idered to be misbehaving<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; and session<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++ * will be closed. The default va=
lue is 32.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++ */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++NGHTTP2_EXTERN void<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; nghttp2_option_set_max_settings(nghttp2_optio=
n<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; *option,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t val);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + /**<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp; * @function<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp; *<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +diff --git a/lib/nghttp2_helper.c =
b/lib/nghttp2_helper.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +index 91136a619..0bd541472 100644<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +--- a/lib/nghttp2_helper.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++++ b/lib/nghttp2_helper.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +@@ -334,6 +334,8 @@ const char *ng=
http2_strerror(int<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; error_code) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; case NGHTTP2_ERR_FLOO=
DED:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; return &q=
uot;Flooding was detected in this HTTP/2 session, and it<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; must be &quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;closed&quot;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; case NGHTTP2_ERR_TOO_MANY_=
SETTINGS:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp; return &quot;S=
ETTINGS frame contained more than the maximum<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; allowed<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; entries&quot;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; default:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; return &q=
uot;Unknown error code&quot;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +diff --git a/lib/nghttp2_option.c =
b/lib/nghttp2_option.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +index e53f22d36..34348e660 100644<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +--- a/lib/nghttp2_option.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++++ b/lib/nghttp2_option.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +@@ -121,3 +121,8 @@ void<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; nghttp2_option_set_max_outbound_ack(nght=
tp2_option *option,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; size_t val) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; option-&gt;opt_set_ma=
sk |=3D NGHTTP2_OPT_MAX_OUTBOUND_ACK;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; option-&gt;max_outbou=
nd_ack =3D val;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++void nghttp2_option_set_max_setti=
ngs(nghttp2_option *option,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; size_t val) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; option-&gt;opt_set_mask |=
=3D NGHTTP2_OPT_MAX_SETTINGS;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; option-&gt;max_settings =
=3D val;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++}<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +diff --git a/lib/nghttp2_option.h =
b/lib/nghttp2_option.h<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +index 1f740aaa6..939729fdc 100644<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +--- a/lib/nghttp2_option.h<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++++ b/lib/nghttp2_option.h<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +@@ -67,6 +67,7 @@ typedef enum {<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; NGHTTP2_OPT_MAX_DEFLA=
TE_DYNAMIC_TABLE_SIZE =3D 1 &lt;&lt; 9,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; NGHTTP2_OPT_NO_CLOSED=
_STREAMS =3D 1 &lt;&lt; 10,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; NGHTTP2_OPT_MAX_OUTBO=
UND_ACK =3D 1 &lt;&lt; 11,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; NGHTTP2_OPT_MAX_SETTINGS =
=3D 1 &lt;&lt; 12,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + } nghttp2_option_flag;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + /**<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +@@ -85,6 +86,10 @@ struct nghttp2_=
option {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp; * NGHTTP2_OPT_M=
AX_OUTBOUND_ACK<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; size_t max_outbound_a=
ck;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; /**<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp; * NGHTTP2_OPT_MAX_SE=
TTINGS<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; size_t max_settings;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; /**<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp; * Bitwise OR of=
 nghttp2_option_flag to determine that<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; which fields<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp; * are specified=
.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +diff --git a/lib/nghttp2_session.c=
 b/lib/nghttp2_session.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +index 563ccd7de..415e34776 100644<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +--- a/lib/nghttp2_session.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++++ b/lib/nghttp2_session.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +@@ -458,6 +458,7 @@ static int ses=
sion_new(nghttp2_session<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; **session_ptr,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; (*session_ptr)-&gt;ma=
x_send_header_block_length =3D<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; NGHTTP2_MAX_HEADERSLEN;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; (*session_ptr)-&gt;ma=
x_outbound_ack =3D<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; NGHTTP2_DEFAULT_MAX_OBQ_FLOOD_ITEM;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; (*session_ptr)-&gt;max_set=
tings =3D NGHTTP2_DEFAULT_MAX_SETTINGS;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; if (option) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; if ((opti=
on-&gt;opt_set_mask &amp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; NGHTTP2_OPT_NO_AUTO_WINDOW_UPDATE) &amp;&amp;=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +@@ -521,6 +522,11 @@ static int se=
ssion_new(nghttp2_session<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; **session_ptr,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (optio=
n-&gt;opt_set_mask &amp; NGHTTP2_OPT_MAX_OUTBOUND_ACK) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; (*session_ptr)-&gt;max_outbound_ack =3D<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; option-&gt;max_outbound_ack;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp; if ((option-&g=
t;opt_set_mask &amp; NGHTTP2_OPT_MAX_SETTINGS) &amp;&amp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; option-&gt;max_settings) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*=
session_ptr)-&gt;max_settings =3D option-&gt;max_settings;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; rv =3D nghttp2_hd_def=
late_init2(&amp;(*session_ptr)-&gt;hd_deflater,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +@@ -5657,6 +5663,16 @@ ssize_t<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; nghttp2_session_mem_recv(nghttp2_session=
 *session, const uint8_t<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; *in,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; iframe-&gt;max_niv =3D<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iframe-&gt;frame.hd.leng=
th /<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH + 1;=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (iframe-&gt;max_niv - 1 &gt; session-&gt;max_setti=
ngs) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rv =3D nghttp2_session_terminate_session_=
with_reason(<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; session, NGHTTP2_=
ENHANCE_YOUR_CALM,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SETTINGS: t=
oo many setting entries&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (nghttp2_is_fatal(rv)) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rv;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (ssize_t)inlen;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; iframe-&gt;iv =3D nghttp2_mem_malloc(mem,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; sizeof(nghttp2_settings_entry) *<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; iframe-&gt;max_niv);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +@@ -7425,6 +7441,11 @@ static int<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; nghttp2_session_upgrade_internal(nghttp2=
_session *session,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; if (settings_payloadl=
en %<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; return NG=
HTTP2_ERR_INVALID_ARGUMENT;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; /* SETTINGS frame contains=
 too many settings */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; if (settings_payloadlen / =
NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &gt; session-&gt;max_settings) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp; return NGHTTP2=
_ERR_TOO_MANY_SETTINGS;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; rv =3D nghttp2_frame_=
unpack_settings_payload2(&amp;iv, &amp;niv,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; settings_payload,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; settings_payloadlen,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; mem);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; if (rv !=3D 0) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +diff --git a/lib/nghttp2_session.h=
 b/lib/nghttp2_session.h<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +index d20827315..07bfbb6c9 100644<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +--- a/lib/nghttp2_session.h<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++++ b/lib/nghttp2_session.h<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +@@ -267,6 +267,8 @@ struct nghttp2=
_session {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; /* The maximum length=
 of header block to send.&nbsp; Calculated<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; by the<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sam=
e way as nghttp2_hd_deflate_bound() does. */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; size_t max_send_heade=
r_block_length;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; /* The maximum number of s=
ettings accepted per SETTINGS<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; frame. */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; size_t max_settings;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; /* Next Stream ID. Ma=
de unsigned int to detect &gt;=3D (1 &lt;&lt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; 31). */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; uint32_t next_stream_=
id;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; /* The last stream ID=
 this session initiated.&nbsp; For client<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; session,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +diff --git a/tests/main.c b/tests/=
main.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +index 41e0b03eb..67eb4a1c2 100644<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +--- a/tests/main.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++++ b/tests/main.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +@@ -317,6 +317,8 @@ int main() {<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; test_nghttp2_session_set_local_window_size) |=
|<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; !CU_add_test(pSuite,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;session_cancel_from_before_frame_send&q=
uot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; test_nghttp2_session_cancel_from_before_=
frame_send) ||<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !C=
U_add_test(pSuite, &quot;session_too_many_settings&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 test_nghttp2_session_too_many_settings) ||<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; !CU_add_test(pSuite, &quot;session_removed_closed_stream&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; test_nghttp2_session_removed_closed_stream) |=
|<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; !CU_add_test(pSuite, &quot;session_pause_data&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +diff --git a/tests/nghttp2_session=
_test.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; b/tests/nghttp2_session_test.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +index 6eb8e244d..33ee3ad84 100644<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +--- a/tests/nghttp2_session_test.c=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++++ b/tests/nghttp2_session_test.c=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +@@ -10614,6 +10614,67 @@ void<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; test_nghttp2_session_cancel_from_before_=
frame_send(void) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp; nghttp2_session_del(s=
ession);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++void test_nghttp2_session_too_man=
y_settings(void) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_session *session;<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_option *option;<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_session_callbacks =
callbacks;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_frame frame;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_bufs bufs;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_buf *buf;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; ssize_t rv;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; my_user_data ud;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_settings_entry iv[=
3];<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_mem *mem;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_outbound_item *ite=
m;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; mem =3D nghttp2_mem_defaul=
t();<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; frame_pack_bufs_init(&amp;=
bufs);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; memset(&amp;callbacks, 0, =
sizeof(nghttp2_session_callbacks));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; callbacks.on_frame_recv_ca=
llback =3D on_frame_recv_callback;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; callbacks.send_callback =
=3D null_send_callback;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_option_new(&amp;op=
tion);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_option_set_max_set=
tings(option, 1);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_session_client_new=
2(&amp;session, &amp;callbacks, &amp;ud,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; option);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; CU_ASSERT(1 =3D=3D session=
-&gt;max_settings);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_option_del(option)=
;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; iv[0].settings_id =3D NGHT=
TP2_SETTINGS_HEADER_TABLE_SIZE;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; iv[0].value =3D 3000;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; iv[1].settings_id =3D NGHT=
TP2_SETTINGS_INITIAL_WINDOW_SIZE;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; iv[1].value =3D 16384;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_frame_settings_ini=
t(&amp;frame.settings,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; NGHTTP2_FLAG_NONE,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; dup_iv(iv, 2),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; rv =3D nghttp2_frame_pack_=
settings(&amp;bufs, &amp;frame.settings);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; CU_ASSERT(0 =3D=3D rv);<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; CU_ASSERT(nghttp2_bufs_len=
(&amp;bufs) &gt; 0);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_frame_settings_fre=
e(&amp;frame.settings, mem);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; buf =3D &amp;bufs.head-&gt=
;buf;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; assert(nghttp2_bufs_len(&a=
mp;bufs) =3D=3D nghttp2_buf_len(buf));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; ud.frame_recv_cb_called =
=3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; rv =3D nghttp2_session_mem=
_recv(session, buf-&gt;pos,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; nghttp2_buf_len(buf));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; CU_ASSERT((ssize_t)nghttp2=
_buf_len(buf) =3D=3D rv);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; item =3D nghttp2_session_g=
et_next_ob_item(session);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; CU_ASSERT(NGHTTP2_GOAWAY =
=3D=3D item-&gt;frame.hd.type);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_bufs_reset(&amp;bu=
fs);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_bufs_free(&amp;buf=
s);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++&nbsp; nghttp2_session_del(sessio=
n);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++}<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + static void<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + prepare_session_removed_closed_st=
ream(nghttp2_session *session,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nghttp2_hd_deflater<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; *deflater) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +diff --git a/tests/nghttp2_session=
_test.h<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; b/tests/nghttp2_session_test.h<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +index e872c5d0b..818c808d0 100644<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +--- a/tests/nghttp2_session_test.h=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++++ b/tests/nghttp2_session_test.h=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +@@ -156,6 +156,7 @@ void<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; test_nghttp2_session_repeated_priority_c=
hange(void);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + void test_nghttp2_session_repeate=
d_priority_submission(void);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + void test_nghttp2_session_set_loc=
al_window_size(void);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + void test_nghttp2_session_cancel_=
from_before_frame_send(void);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ++void test_nghttp2_session_too_man=
y_settings(void);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + void test_nghttp2_session_removed=
_closed_stream(void);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + void test_nghttp2_session_pause_d=
ata(void);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; + void test_nghttp2_session_no_clos=
ed_streams(void);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; diff --git<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; a/meta-networking/recipes-support/nghttp=
2/nghttp2_1.40.0.bb<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &lt;<a href=3D"https://apc01.safelinks.protec=
tion.outlook.com/?url=3Dhttp%3A%2F%2Fnghttp2_1.40.0.bb%2F&amp;amp;data=3D04=
%7C01%7CRahul.Taya%40kpit.com%7Cabd0c38f07d4492e704608d8d698a3e6%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C637495298481493480%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;amp;sdata=3DpK2ccOglR19%2BMs3q3C6v0CmSnCyS7HkgwN2cWhS75kE%3D&amp;amp;=
reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A=
%2F%2Fnghttp2_1.40.0.bb%2F&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7=
Cabd0c38f07d4492e704608d8d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C=
0%7C637495298481493480%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DpK2ccOglR19%2=
BMs3q3C6v0CmSnCyS7HkgwN2cWhS75kE%3D&amp;amp;reserved=3D0</a>&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; b/meta-networking/recipes-support/nghttp=
2/nghttp2_1.40.0.bb<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &lt;<a href=3D"https://apc01.safelinks.protec=
tion.outlook.com/?url=3Dhttp%3A%2F%2Fnghttp2_1.40.0.bb%2F&amp;amp;data=3D04=
%7C01%7CRahul.Taya%40kpit.com%7Cabd0c38f07d4492e704608d8d698a3e6%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C637495298481493480%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;amp;sdata=3DpK2ccOglR19%2BMs3q3C6v0CmSnCyS7HkgwN2cWhS75kE%3D&amp;amp;=
reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A=
%2F%2Fnghttp2_1.40.0.bb%2F&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7=
Cabd0c38f07d4492e704608d8d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C=
0%7C637495298481493480%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DpK2ccOglR19%2=
BMs3q3C6v0CmSnCyS7HkgwN2cWhS75kE%3D&amp;amp;reserved=3D0</a>&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; index 9ed8c5642..b212ede4d 100644<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; ---<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; a/meta-networking/recipes-support/nghttp2/ngh=
ttp2_1.40.0.bb<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &lt;<a href=3D"https://apc01.safelinks.protec=
tion.outlook.com/?url=3Dhttp%3A%2F%2Fnghttp2_1.40.0.bb%2F&amp;amp;data=3D04=
%7C01%7CRahul.Taya%40kpit.com%7Cabd0c38f07d4492e704608d8d698a3e6%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C637495298481493480%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;amp;sdata=3DpK2ccOglR19%2BMs3q3C6v0CmSnCyS7HkgwN2cWhS75kE%3D&amp;amp;=
reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A=
%2F%2Fnghttp2_1.40.0.bb%2F&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7=
Cabd0c38f07d4492e704608d8d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C=
0%7C637495298481493480%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DpK2ccOglR19%2=
BMs3q3C6v0CmSnCyS7HkgwN2cWhS75kE%3D&amp;amp;reserved=3D0</a>&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +++<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; b/meta-networking/recipes-support/nghttp2/ngh=
ttp2_1.40.0.bb<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &lt;<a href=3D"https://apc01.safelinks.protec=
tion.outlook.com/?url=3Dhttp%3A%2F%2Fnghttp2_1.40.0.bb%2F&amp;amp;data=3D04=
%7C01%7CRahul.Taya%40kpit.com%7Cabd0c38f07d4492e704608d8d698a3e6%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C637495298481493480%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;amp;sdata=3DpK2ccOglR19%2BMs3q3C6v0CmSnCyS7HkgwN2cWhS75kE%3D&amp;amp;=
reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A=
%2F%2Fnghttp2_1.40.0.bb%2F&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7=
Cabd0c38f07d4492e704608d8d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C=
0%7C637495298481493480%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DpK2ccOglR19%2=
BMs3q3C6v0CmSnCyS7HkgwN2cWhS75kE%3D&amp;amp;reserved=3D0</a>&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; @@ -10,6 +10,7 @@ UPSTREAM_CHECK_UR=
I =3D<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<a href=3D"https://apc01.safelinks.prot=
ection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Fre=
leases&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cabd0c38f07d4492e704=
608d8d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6374952984814934=
80%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DvrrKNWkedGjB7Q8L%2BahkQGj6cGlUX%2=
BHNw7epJLJ9zGc%3D&amp;amp;reserved=3D0">https://apc01.safelinks.protection.=
outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Freleases&=
amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cabd0c38f07d4492e704608d8d6=
98a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637495298481493480%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DvrrKNWkedGjB7Q8L%2BahkQGj6cGlUX%2BHNw7ep=
JLJ9zGc%3D&amp;amp;reserved=3D0</a>&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; SRC_URI =3D &quot;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://apc01.safelinks.protection=
.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Freleases=
%2Fdownload%2Fv%24&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cabd0c38=
f07d4492e704608d8d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6374=
95298481493480%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DIpyRVgtTSEsajguZx0eUP=
%2FdfsZLoXA9IxgRPNZAlvME%3D&amp;amp;reserved=3D0{PV}/nghttp2-${PV}.tar.xz">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub=
.com%2Fnghttp2%2Fnghttp2%2Freleases%2Fdownload%2Fv%24&amp;amp;data=3D04%7C0=
1%7CRahul.Taya%40kpit.com%7Cabd0c38f07d4492e704608d8d698a3e6%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637495298481493480%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;amp;sdata=3DIpyRVgtTSEsajguZx0eUP%2FdfsZLoXA9IxgRPNZAlvME%3D&amp;amp;rese=
rved=3D0{PV}/nghttp2-${PV}.tar.xz</a><br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &lt;<a href=3D"https://apc01.safelinks.protec=
tion.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Frele=
ases%2Fdownload%2Fv%24&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7Cabd=
0c38f07d4492e704608d8d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C=
637495298481493480%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2lu=
MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DIpyRVgtTSEsajguZx=
0eUP%2FdfsZLoXA9IxgRPNZAlvME%3D&amp;amp;reserved=3D0">https://apc01.safelin=
ks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghtt=
p2%2Freleases%2Fdownload%2Fv%24&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.=
com%7Cabd0c38f07d4492e704608d8d698a3e6%7C3539451eb46e4a26a242ff61502855c7%7=
C0%7C0%7C637495298481493480%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DIpyRVgtT=
SEsajguZx0eUP%2FdfsZLoXA9IxgRPNZAlvME%3D&amp;amp;reserved=3D0</a>&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a hr=
ef=3D"file://0001-fetch-ocsp-response-use-python3.patch">file://0001-fetch-=
ocsp-response-use-python3.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; +&nbsp;&nbsp;&nbsp; <a href=3D"file=
://CVE-2020-11080.patch">file://CVE-2020-11080.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; &quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; SRC_URI[md5sum] =3D &quot;8d1=
a6b96760254e4dd142d7176e8fb7c&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; SRC_URI[sha256sum] =3D<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &quot;09fc43d428ff237138733c737b29fb1a7e=
49d49de06d2edbed3bc4cdcee69073&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; --<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; 2.17.1<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt; This message contains information t=
hat may be privileged or<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; confidential and is the property of the =
KPIT Technologies Ltd. It is<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; intended only for the person to whom it =
is addressed. If you are not<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; the intended recipient, you are not auth=
orized to read, print,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; retain<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; copy, disseminate, distribute, or use th=
is message or any part<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; thereof. If you receive this message in =
error, please notify the<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; sender immediately and delete all copies=
 of this message. KPIT<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; Technologies Ltd. does not accept any li=
ability for virus<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; infected mails.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; This message contains information that m=
ay be privileged or<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; confidential and is the property of the =
KPIT Technologies Ltd. It is<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; intended only for the person to whom it =
is addressed. If you are not<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; the intended recipient, you are not auth=
orized to read, print,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; retain<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; copy, disseminate, distribute, or use th=
is message or any part<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; thereof. If you receive this message in =
error, please notify the<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; sender immediately and delete all copies=
 of this message. KPIT<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; &gt; Technologies Ltd. does not accept any li=
ability for virus<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; infected mails.<br>
&gt;<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part the=
reof. If you receive this message in error, please notify the sender immedi=
ately and delete all copies of this message. KPIT Technologies Ltd. does no=
t accept any liability for virus
 infected mails.
</body>
</html>

--_000_BMXPR01MB3431E4A1E6B4ED0EE8F165C0F29F9BMXPR01MB3431INDP_--
