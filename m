Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.50])
 by mx.groups.io with SMTP id smtpd.web12.3866.1622010245321896050
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 23:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=oK+wmqY4;
 spf=pass (domain: siemens.com, ip: 40.107.14.50, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fazN6lmfeZxnkq61a+b4C3XUNW3vDic4j3w4uI6wLY3Dh3AcF+6cMmJtAV2s6ghidTO0j9ZCEglbYixlmjua6bCRWLICeikM0up9+H36SSmBHgZFwGznYG7lfBwRHsRMwO8OidSWPh/cyRFDeDTg6mM5XOqIRuK39vowR/Tzp0ih5+c5G9oeAcYcuuC1F4a6ILlfyT57ZvpUUVPqj/y9mnUtFczC1j6Z0ur4F5uDCqR17MbF4Wk+Ej1aaR+I9fYKCeVfQhbun5DyD+UWlaWJyUDbo7kJGXl2Zd/WotTtdbwDuRl3GbFgPkceVfzc4EEREK7QogT3k2j/bQAa1c0wqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Iu1tY7B0Oyu275EVq/CmaTF6v+sBN1WsgwvmDDHOQQ=;
 b=TQ2p9OU22lsx1Nbspwn/UFgv7Nr6IdB4TFRU9JMnesh4UhRKmtVRT4+tbktLbW+m7ek4VvtqQHcQkbznfyAO/DbhbRpHDu1iWdPi+ViWOAw9gXw/1nk21p1DY2nCYb1jHHaWgGjc5LsI6VcQydc69A7f5Dt2AoxavENUF50CKXgSFX+BVrLy7hcUCxrYa5uL0MAJzFuqenYCBZCRfnfutMFN+wg+Pxa+dVvepNp8h//89NRhw/2ZFVcPXukhBK4B+Gg1mD6M2pTjthTFN4wTNjz+/Ic/MfPBSGcvJxLgiJua60CMBPbLWNWMSGaSwiXhTMYZa130iTigy73dYFZ2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Iu1tY7B0Oyu275EVq/CmaTF6v+sBN1WsgwvmDDHOQQ=;
 b=oK+wmqY4/gHvnle0HCuSxjmBydCvquuT84JGltPGPu/RAJTTbJ6LdC4wx1oXAfoFrEnX5ugTLK24lKoB7nyfRzqqKc99N7aI1GwRes8r6Kyv4D2CKX2pE1tkrfEVCkW+MkDw3lpU+8x6slNo2s3tfS5GRCiYSC4zEooLBdbn9CY=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB9PR10MB4894.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:2cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Wed, 26 May
 2021 06:24:02 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2ce8:8499:f719:8472]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2ce8:8499:f719:8472%7]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 06:24:02 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: Steve Sakoman <steve@sakoman.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Subject: Re: [OE-core][PATCH v2] expat: upgrade 2.3.0 -> 2.4.1
Thread-Topic: [OE-core][PATCH v2] expat: upgrade 2.3.0 -> 2.4.1
Thread-Index: AQHXUU6ncbUaqw1QvEGFYoXyXd72j6r0IdnQgACi6wCAAAG/gIAAhTtg
Date: Wed, 26 May 2021 06:24:02 +0000
Message-ID: 
 <DB8PR10MB3977521110D5C9479417ACFD92249@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20210525090910.11581-1-andrej.valek@siemens.com>
 <168247B8E1E1063C.25934@lists.openembedded.org>
 <DB8PR10MB397786AA74112101B3D9845192259@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
 <8de2b83c408696703284e7204da5285c0b594a47.camel@linuxfoundation.org>
 <CAOSpxdZa15LkX2nBPND0SyD7cRGWaLQ4KOkVJ=E074rso8d0Qw@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdZa15LkX2nBPND0SyD7cRGWaLQ4KOkVJ=E074rso8d0Qw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2021-05-26T06:24:00Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=9e45341e-fa23-4b2c-80c0-9af3e5fb3d73;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=siemens.com;
x-originating-ip: [165.225.200.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57337670-c059-4155-fc5a-08d9200edaec
x-ms-traffictypediagnostic: DB9PR10MB4894:
x-microsoft-antispam-prvs: 
 <DB9PR10MB48944B61449113B7DDF66CDB92249@DB9PR10MB4894.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 meAGyuUifjEji2j6LJ3UmiIN0AHIq+fl2hBtDYkKtlSzoELTOdhdceshXAMFf8BaXNuCjaRqnh8SCwRn7UYCE9sLdgrbGSDLx+aAOPm3OO0VggjS9GACeJyUZDIaKtmG6lRaYAJvmrcQ50OyNcv7cFQFbNMhrk/lCcuwlla81/049fr+ypcGVAmyIytx64Lm4bM82NjNJqVXK3fxvCNre1lz4XNqbowArxGdemctHKz76TGyRR5ErGtXFG8UWMwMwIw9PBI1qTfzwmOfHK/RCIoLrJpo7Ot/6PSPjuVMjdCSTa1OSht2PFBe7yP0DE8x6JA6PElo+oc+UXewpDGCvuC2AoQVpAggTgMdaM1zIFUhDFQVpst7KVP9I/UHr+D942MP7hfv4ytYclvDFdU6KHhX7EYJwbFPcLZVQcVTX7wy9jX4/J1mhQRCmKJN5Xwx9PszbqjWejyQxqipkxpzJ1+at3w23A9rKlA2NVcqmD5S2mrn1o2o+bpud/kF05IOvZ2i2wWDoNVRqzWI2e7eT+x0tDXubtHbzMYiG57SX6xs4JAP1IEAisEV+zjmCkqZSi/OR7pV/iHv9DwliT9dyomnYlcOeJePLUUaVXkGrXLLThaXbLvebgX2rzCUSI8lyJqB8aY+Ye9z5oqoTbhgDTtIqRzNiaT69gudy+v3LIk+Wb2nXi1R2pwOKoh9M9Bd1BphWUj3mEC/EeCRDhQBrw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(71200400001)(4326008)(7696005)(8936002)(86362001)(66946007)(66556008)(64756008)(54906003)(66446008)(186003)(8676002)(55016002)(6916009)(53546011)(76116006)(66476007)(6506007)(55236004)(5660300002)(316002)(45080400002)(478600001)(9686003)(33656002)(26005)(52536014)(2906002)(38100700002)(122000001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?rDvUEuGX+BXIi26PcsK/V66Jnca4fffkHrF+Sc7odviqnkHj6NDnMmw0mjby?=
 =?us-ascii?Q?8i6jTeujzP9YASw8yQVArrWr/94OPbJrzjh2NiA5OswIVhqaDDj1VXRrKAyz?=
 =?us-ascii?Q?Bwvyy4vbqA5ZuqDkA9Q47yBZneqiBismiiygqPcWBwUZp8pgdbN724iwEHMB?=
 =?us-ascii?Q?Hc6dAwx4Mbru7LtQoXl/Ae5wJf5/mdRfC9zP5JwJnB9IMcra8PTurWlX3bsv?=
 =?us-ascii?Q?GoOkl1owlN+xMnip8VKU/8LydVWRxEG2LtauVvfs+5LVK1CSRrJNzTZPI0IQ?=
 =?us-ascii?Q?ipIKBHXlYQJlkAXP+OtDpwe/tdRdQt4iTPTiLQI7nsD2noR0ayU/uXqwTQqD?=
 =?us-ascii?Q?E1iSIgwZMdcPTL5Mc22kDebvo0yUKdY1TSfLwdichTxtdv9WNu2FN3HCKZNl?=
 =?us-ascii?Q?kGmsG4CmjqkcNHmUYAWE523y1wF63RcAK7BzZBOKUbi3awE3MxruTaze/sH8?=
 =?us-ascii?Q?jtsFMdJ1ZKw8DLtcCwjpHKGjhrddUFCZU58/8CBMkiLl2MMGxu7BgL1R4uNZ?=
 =?us-ascii?Q?XyjxVes+9GwbKnjkWk1dEWN0+fFJr3H2XJnn6bigCXkQKMXMFMgN8ebHLfj8?=
 =?us-ascii?Q?97ZwtDKG3nFmzaGDRV8wqtmvIsCUs/C57aZYLjTyY39u/WYFwLIb0GmW/neK?=
 =?us-ascii?Q?KLfoyvtaKcsQJO/8Kg8GfsesVs5he5dx1oYgc3+JWuLVGCMei34lCqRcWV3+?=
 =?us-ascii?Q?Hprr4LQHD0TGwBvXfmydvWgce1yvFZxbTyiHfToXiXdCfzS+oaDG1DJryY17?=
 =?us-ascii?Q?E8zLsGXZtEoW5zmkk+xc3z1TkIY5l8B7jDAleYcKNcGTovBUDZY8tZ2vNNXw?=
 =?us-ascii?Q?/tZHUiMnXPor6Xq+Vh7gmPpTB7wSwMXotrNtneiaiBLDhBXU/wKk9k4lhbW7?=
 =?us-ascii?Q?2FWgYdrI+Od+PYRWximG68ntQFV/MoglApno8Jbw1D/eXmlEXN2/5bRasiX0?=
 =?us-ascii?Q?muXwsXRVGW4oGDiqpgQN+Xs5DoIOJ9BjZDHFoHZxtXFvY48ZGRT89YtQ7I+N?=
 =?us-ascii?Q?xP/7JfK81GGJCSr/hZLeS1ZJwCbo71ZPjkq8N21h6PBHGrpAkSBI4LYCig/F?=
 =?us-ascii?Q?cCypH7SKxEtTaOq90Acqz0UE4TKHdRm6P/5xuGv9gjWtYddHhx2Sjpu4r/kD?=
 =?us-ascii?Q?UDQCPXk+JTVft92vz5CvzwZVrKUA++toue0zrWaPPtSNrcWDUEw8XAjHrlpW?=
 =?us-ascii?Q?nxKqgDUuPKwkgIlmYHpYRJk1UqERlS9efkTdYCcM6U8UfWpCGzUqFEdlo8bk?=
 =?us-ascii?Q?HhL4MAJ7UmXePJo0YZlTWAASVPQGqwxcT5qAcxVNkN7vvByD3ZP4nnbe5+kP?=
 =?us-ascii?Q?FHrofvUzHTP4eixlqYYQ2yHx?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 57337670-c059-4155-fc5a-08d9200edaec
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 06:24:02.2727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C1Gz/luKyQEIThGaVbIe02VzsDvn3AEVJK3rreik5Qe67fxlwQNdtBsJX8QCbnyvh1J9G14879klLQ4fA0CG5HYkcIWvaG09QSz0vjO0gHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4894
Content-Class: 
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Steve,

Thank you, that you're taking care of it.
Sorry, but maybe I didn't catch the right approach about the patching. Are =
you going to create a "fixing CVE" patch or just patch to set "CVE_PRODUCT"=
 ?

Thanks,
Andrej

> On Tue, May 25, 2021 at 12:17 PM Richard Purdie <richard.purdie@linuxfoun=
dation.org> wrote:
>>
>> On Tue, 2021-05-25 at 12:50 +0000, Andrej Valek wrote:
>> > Hello everyone,
>> >
>> > I have an another question regarding to backporting this to dunfell br=
anch.
>> > Is it possible to apply this upgrade to this branch? I would like to=20
>> > have an very important fix for CVE-2013-0340=20
>> > (https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg
>> > ithub.com%2Flibexpat%2Flibexpat%2Fpull%2F220&amp;data=3D04%7C01%7Candr
>> > ej.valek%40siemens.com%7Cc9695097e1bc47d8261708d91fcbba17%7C38ae3bcd
>> > 95794fd4addab42e1495d55a%7C1%7C0%7C637575782123699324%7CUnknown%7CTW
>> > FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC
>> > I6Mn0%3D%7C1000&amp;sdata=3DjBk29qyJpIq%2BsG0iXhnMoSbv%2F2%2Bd8dKIbuV7
>> > GqP3YA8%3D&amp;reserved=3D0) there. But there is a lot of changes,=20
>> > means just applying the patch is not very promising.
>> >
>> > How we can handle it?
>>
>> Adding Steve to Cc. It is possible if there is a good case for it and=20
>> there aren't bad side effects from the change. I don't know enough=20
>> about expat here to comment on that.
>
> Our responses crossed in the mail :-)
>
> I don't know enough about expat to comment on this either.  But if someon=
e who is familiar with expat would care to chime in I am open to consider w=
hether an exception should be made.
>
>> I suspect we should be adding something to the expat recipe to make it=20
>> match libexpat CVEs, maybe CVE_PRODUCT =3D "libexpat"?
>
> Yes, good catch, that does appear to be the case.  I'll do a little testi=
ng to verify that and will submit a patch.
>
> Steve
