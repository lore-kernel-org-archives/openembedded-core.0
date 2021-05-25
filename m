Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.75])
 by mx.groups.io with SMTP id smtpd.web12.9085.1621947012525231487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 05:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=B0nG7mTz;
 spf=pass (domain: siemens.com, ip: 40.107.14.75, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcgF3QrykpmHp0VICqZdo3nfJa0a4Fa30jdBwX9gME4UBukLwRPQ9lMY/KrOhcZOH1V43dWGzBzSi9c8uzjDBsyRgt9mIM5ElNxnQlJxDFlQNvnGRKECH8B7xd9HDbQk3vQVQbPGDqdxPhnKk3ia3/QzmcF0XWjHtYzLsXCQPwxCGgPlqDzJLPFJiQBL7C+4KfupamlFayodIZ60S+CYIQu2y3XvXuVNzekAMH9ytmZa2sbKuSDhSpOlYtd0dtmxgxOCLLNrKsQnSHfs/1K339GTK+mcIjaDv+j1Z4TlBAYaVgIVrsF3cL0D5SZAEGuuKle2+tPS5K1rUjL7fDj6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzP2gPQVI3p2i5JF1dox+ulDYTaXAQcxnrDHoabraqk=;
 b=lZCRGWe2QKNjs1PgcqSk8T6uXVOlKs6RgUmDCNXVtqHdWNSoqn+siz5ff5ekUG0EHy+ELLe4sspYt9GUy3YkVPfFqg+DLTqhJtwvQ8g8rPC/hJk/3Ig1/0IlFMll5zMgZSKAD/nlNXh6+olz88PW0T7fScGq9vbceDVqIdU68BLE2D61Sh3VdSAeBXoWJBh4qtfiCZq66/Dh3BjBZMoCJjlO9IT++1pJOUYZZc62K14UX6GvMy0DR2FxyUC1mC78noQxmhIH+FbFGqFdxlXMHL8l32jCh8Yr3xSbp+NxcnzV9r2/WaLwbiMvS/aL2nzHJ2khTp4UBFzyO3AgGYKm6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzP2gPQVI3p2i5JF1dox+ulDYTaXAQcxnrDHoabraqk=;
 b=B0nG7mTzTYzVj3H3n8eGL2xbLpIVMWRpiQvooL08XYPsC6adSzrbrls3GnYoEAPmKBlc1s1PFW52BYd+UtKZz1YHU2/vixcznOqnCvCLXQMXSLsIs0A4POhGhuHxh7DIc/GhBysy6pkZidahY4NMoGYpvUWfnnyAAe6GzjWb0Xk=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB8PR10MB3958.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:161::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Tue, 25 May
 2021 12:50:10 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2ce8:8499:f719:8472]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2ce8:8499:f719:8472%7]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 12:50:10 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [OE-core][PATCH v2] expat: upgrade 2.3.0 -> 2.4.1
Thread-Topic: [OE-core][PATCH v2] expat: upgrade 2.3.0 -> 2.4.1
Thread-Index: AQHXUU6ncbUaqw1QvEGFYoXyXd72j6r0IdnQ
Date: Tue, 25 May 2021 12:50:09 +0000
Message-ID: 
 <DB8PR10MB397786AA74112101B3D9845192259@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20210525090910.11581-1-andrej.valek@siemens.com>
 <168247B8E1E1063C.25934@lists.openembedded.org>
In-Reply-To: <168247B8E1E1063C.25934@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2021-05-25T12:50:07Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=d3145e2b-7d24-4152-ba49-716080e8f37f;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=siemens.com;
x-originating-ip: [165.225.200.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64ea1b31-ba86-4720-3860-08d91f7ba184
x-ms-traffictypediagnostic: DB8PR10MB3958:
x-microsoft-antispam-prvs: 
 <DB8PR10MB395868A28FB12606EDAE235C92259@DB8PR10MB3958.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xDYuy+IGuuLs6KTxcm43hWnUURGaP4WXXBuiHIuJNaGPObzB5hmi2Agfw5lKVK4MUvaHst66ply0smB5jbLVGWudvRzs1r5sn9II8HBDq8s7mYXyKp9jCWMGqFmnQ9QDCofjR+cApQr5nIEZqGb4JIplgzs6JHX1xBmGSQhviz1mklbHciMS5JV+M1/Kbk8EQp/m4vzjcV0YhZCVuCullyLKr3q7jrz0/BusIKbO0BXP/48V3ZFAUjy/wff/xexhkDtND5i02sR5BJDk63gqJtrXBXMaeY++e6NrGrlcSwUOzTcClMZJCILzrm4VXJ7A4Mh81oRyBbA+el3xiRlXdqEWnxuWjbl1qX7iuAJO3bvhktG/kGLUzu+bg8khqlPQ5BeWrA33vdjbWk7dTXyX5wS3FaPZRfSD6O0KRpXCzYDfBGOyz5iN2rWLa0nDE8+50XCYZINtRgIsOYeZ85ySfQzI2oLctxeiH9MLEvyd+ttQomjn2dRI80lPamr3J2Z2i/fugl5M6Xbyzu06nHm/w38xKm6JijdZvsCfJR295zQUd/h0lITXlndiEfwQ7rNHwsS4g8qi7CAysVs1a2jCmvyB7+dGUbNytNYP19PAsmnnbukLynr8xYj6p3u0akFIuwDvBwXNxCENXT143O8IeFc/CSnF0VROUH0rwSUDrulrtrz3TqEHn66j5vT0ghbYeNQRVjSJ4jB/a1ksV3/teenqkPXAtvkpVIt3KCPUxEc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(71200400001)(316002)(186003)(55236004)(6506007)(5660300002)(26005)(122000001)(9686003)(2906002)(7696005)(38100700002)(33656002)(83380400001)(8936002)(86362001)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(52536014)(478600001)(4326008)(55016002)(8676002)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?g2MVLszSQFdxF6eJu1qVBS8WnMsQbew8zKV/9LG2Ak/mhCdDwgR0ugMIZX9K?=
 =?us-ascii?Q?aYI6JQso6NBt7PHrDj4NNs5uxmVBhiu8ZezbbjFQ3lfrmrZ6GAcIhTmTm9x7?=
 =?us-ascii?Q?GlVPR8APQF9rlNhiuX859bco7HO87koM0d/Jz5UJZ9TKMydYILyca15Gr2C7?=
 =?us-ascii?Q?CCoJwIqn+IckaBerKkL/ejrOOox5K6QngKtG1W5ez08Jbpsf8Zgk6Z3LXg6K?=
 =?us-ascii?Q?GHuIWh8SIsCpwLpK+XW8K9xMU/0Bdj/ByDDZ9s9AWu6/mCcclLHDfHDqhfmr?=
 =?us-ascii?Q?RoXsLA30aZE3f+Z+3Ar4AbCFCnP6IjRksJrKCcyizlNpUQ4Bg6cTwdSgdjsg?=
 =?us-ascii?Q?I+IUQOZ2klsliVWpfpRMflCF+4VUTayRq4V/6OvW6Eh+fIdjr2BGkhdpWUsB?=
 =?us-ascii?Q?j3/Yoi3QEzR/5SrWKLCE1fI5ly9rKpPTDEwkCKJOcVzOUon8i5Ocsp4gZJbO?=
 =?us-ascii?Q?cJlRzJju5SwpxSPZu/7XvNm+XymASYScCUsemKJ5e/XsT7dU29IO5Ol9kY5K?=
 =?us-ascii?Q?WUePGQI1jgiPOeTCViVkhl9dorZd1CVmkqd5pb/PvPEeptnh5UiIu+BN7ON1?=
 =?us-ascii?Q?LgDVEDg9RM0LnQPlwJUw7rxLZxOp4SEezcrIAFRK8TtX/SDNca/CLkFl2KNv?=
 =?us-ascii?Q?h3Pui9Lkcq/wlZC6mPHBM7XOL1XYnrfG9mZyYrZz6TQ9eX3xogCrIp1P5LYU?=
 =?us-ascii?Q?o6O91D6V3fufxXxNIKUs3mP6xoJ8oc+UV0B2U77fsbQAuMHqNSBl8GUG02sX?=
 =?us-ascii?Q?F/YO/nre1PWPlzx9v51L+SOSyee6FDmR80LMPoM0/a3W24IzrPkiVmFWEnLF?=
 =?us-ascii?Q?dtbX+Q6TrYUr3WrRXXV6xhYLtP4f/rjyVjTjWVvkybKHp81Ufg7bSgf2dz9H?=
 =?us-ascii?Q?nLouHUG532lXogS7IMySkNIG7+hS5iN13AxnwgNpJOmWrh3DopZvUnUYPTql?=
 =?us-ascii?Q?zUC5Rw/ovqECPWYho7rs8MNbIcu281EEIH+iTXLNoZi0sFh+8AcNSmHfmHwQ?=
 =?us-ascii?Q?Adcz82lUMRbibQkKtxztTxhmDtSJXiT62QmhWXkMEWuB1UioYHCCCitsG28W?=
 =?us-ascii?Q?mDJNYzmnFzvWWgrDUNA75bCHSWoFzDSFUxwwX2j/NdTFejQPDV4Kh4NRb0Gi?=
 =?us-ascii?Q?nbs48mYOhv3aqbtDkgx5aTGDKTlAgF8Z4gGcIDAIfWRywwNpSmRse2Rl/IoI?=
 =?us-ascii?Q?UGXxYmyMDJFOicO4O7YeXtW+GWNykF0SyrjBBSaWHTf0Q/MUn6t4yg7x1Hl5?=
 =?us-ascii?Q?Ly7EpAcaTFbze08k8UEAMwDwOmAU3dV7d7h1XPGkzk0jWlrSLGQZlmj0XvlG?=
 =?us-ascii?Q?+po448tYQpZcfuiGKQedsx5W?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ea1b31-ba86-4720-3860-08d91f7ba184
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2021 12:50:09.9527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xjIC1C1ZfQshzVxIrkG+NmUEyM0JL2Qq7+s7kl7OP9UcR9VP/GZTPMMKMniBsOuofv3cmht1mf/fBpRJh+3Ec8onfrBH/jSijpx/JxFdNTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3958
Content-Class: 
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

I have an another question regarding to backporting this to dunfell branch.=
 Is it possible to apply this upgrade to this branch? I would like to have =
an very important fix for CVE-2013-0340 (https://github.com/libexpat/libexp=
at/pull/220) there. But there is a lot of changes, means just applying the =
patch is not very promising.

How we can handle it?

Thanks,
Andrej

> Subject: [OE-core][PATCH v2] expat: upgrade 2.3.0 -> 2.4.1
>
> Includes lot of security fixes, especially CVE-2013-0340/CWE-776.
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/recipes-core/expat/{expat_2.3.0.bb =3D> expat_2.4.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)  rename meta/recipes-core/=
expat/{expat_2.3.0.bb =3D> expat_2.4.1.bb} (89%)
>
> diff --git a/meta/recipes-core/expat/expat_2.3.0.bb b/meta/recipes-core/e=
xpat/expat_2.4.1.bb
> similarity index 89%
> rename from meta/recipes-core/expat/expat_2.3.0.bb
> rename to meta/recipes-core/expat/expat_2.4.1.bb
> index 14d2855df3..a57fc1b23b 100644
> --- a/meta/recipes-core/expat/expat_2.3.0.bb
> +++ b/meta/recipes-core/expat/expat_2.4.1.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.ta=
r.bz2 \
>             file://run-ptest \
>             "
> =20
> -SRC_URI[sha256sum] =3D "f122a20eada303f904d5e0513326c5b821248f2d4d2afbf5=
c6f1339e511c0586"
> +SRC_URI[sha256sum] =3D "2f9b6a580b94577b150a7d5617ad4643a4301a6616ff4593=
07df3e225bcfbf40"
> =20
>  EXTRA_OECMAKE_class-native +=3D "-DEXPAT_BUILD_DOCS=3DOFF"
> =20
> --
> 2.11.0
>
