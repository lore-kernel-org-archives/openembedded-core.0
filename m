Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.82])
 by mx.groups.io with SMTP id smtpd.web12.27063.1629738732830956308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 10:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=cF29n1Uv;
 spf=pass (domain: siemens.com, ip: 40.107.7.82, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZDQ9QA6GfA4GyBOSEOmUNrL56E/Ic0m+uls5GIPVCq2jG0/Jmm7VpYDj8gtP2cHx4gnX6k5ZEH9gUMTP3WkST3wLISMWk3AaHDUZefzqthiUsO1f3GugcJUVU8LYjXIY3p9e+aa28Xd/GlyXrhBdSVHQZc9wVg3oRUts3xo3y+P+WLLEZPVA3w75UJn3l6WQzPSxc5ia7Gy+DpjBcWflv+Y0xhhHjrZeVOByb2QACCKe/Cutf541TctYFN2ubX0T+DOc4lar/KmefwcqSCwmvfHPvrI0HmrN2s7UIj6siZsHzrsXo6tDz+uEsbqolooA4jL55YJZY0RC8exddAqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+eJdbDZvPnl0DpiS7hlN3y9O4vRWrwBSKkio5zsC4w=;
 b=Ff6H4y3rEzXFEebxecNb5piZuzG56DDkKZJWvMKh8r8KDPdUiHVymq6bz0DmjWcb8K7OlODNSUMxjcU3n+miDn0fTwNMxap6p1F9nPAax3F87EmBZxuR9TduzhnWpgXzJBrvupNTGfp1c4/Xvi8qiyqFD6fK3GkU6PXTuJzgeT5LTCMGC/xo2BdK66FfMQhtoFvwyvpKTioW9rVBIoXQAK4v94c1uT5Vhl+ptP2FMHep4txO/yrwTcP1y5TM24v9KDQcU8F3qaw23eFusvPVuf2TmvE+wHH7NVz0aIfw98O7gvXk0A0jluleDpREKiVkTmU92qcm2gb5s3625U7LfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+eJdbDZvPnl0DpiS7hlN3y9O4vRWrwBSKkio5zsC4w=;
 b=cF29n1UvOdLqMge5q1k+tSkh4R2kpbb3zWAmRGdZsN2K85LGogxYS4vjsMr2dHDnahK68TdBZVlBA4cW5nTRilYoucAl8BIW6E+vpJ7bodsSjvCDg9DQOjPTcEypYJYRvYr+lo7+GXoPtit0n42njAbmZ0jR2iO6x6L7NFAcwcc=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 17:12:10 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a95f:bc47:e21e:adac]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a95f:bc47:e21e:adac%9]) with mapi id 15.20.4436.022; Mon, 23 Aug 2021
 17:12:10 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] vim: add option to disable NLS support
Thread-Topic: [OE-core][PATCH] vim: add option to disable NLS support
Thread-Index: AQHXmDmyq6OWCTGY0EC5q1c7gKrRnKuBUePw
Date: Mon, 23 Aug 2021 17:12:10 +0000
Message-ID: 
 <DB8PR10MB3977E6C2E704FF73707CA62492C49@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20210823101205.29267-1-andrej.valek@siemens.com>
 <ce3005b3-6213-9528-2c82-c4f612f3b549@gmail.com>
In-Reply-To: <ce3005b3-6213-9528-2c82-c4f612f3b549@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2021-08-23T17:12:08Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=f5d097d2-7642-4be6-8f45-c7ba11aa6c8a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 980fd5ad-4ee2-4381-eda1-08d96659249d
x-ms-traffictypediagnostic: DB8PR10MB3977:
x-microsoft-antispam-prvs: 
 <DB8PR10MB3977E4DD9CBB235C26A8C50F92C49@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jeImtVvrB94wuVfRZqcdgoHCRTiEOGdhPzPg/Ey46aDPw0ZhrXfevzVGcam4VgnX9mPTktJGjHjoIkN5q0kfxfRypcXTjmpLH6C3YRqwtjd22+tL2wf1gXPEsb6z/gqUVcyF6OzOQG6GiaZO3//y5f6r4JJNmzqwtmKASP+056ew5Bjh7FD2hWBHyJ0NF5uMBxTMeGh7+1ob/o8zbe3djVZ7nx/XZbAv1mrn/4GG4fP9kQWIywNEvwaLR6sqPums+N5Bpr58NmmXy3b4TIXEmA86X7jjjRuLg/ONIZ1mKNaWptXY2p7s3pwGNnmvKorXy338/CGMtZBDsvxarpIpKjDR6gV672/pbSJcisnOcgZi8NkEoe2NAbLyMwBeprchuctR124e/0+vIscqLT6ulpbtjU3vSUe9JbX+1jg+vYOi7a71HnqM6P+9YTs1h/6/8Og2OZBKhzkVZGdSBndePU3PMZmRSSt0f70kI93SiUYl6vOmhBU22rsJB/eG5eGfA6TjNoxFNGWJ57YONuyzbWrzTinrqnGb+cZUQvPuQuacz+vcBPpW9ABkig7l2ZThKkmvCnmY6JobAQFdOwvjJu13E3UoDj4c3cU1U7ntYBjpEXZiGguD0PO7Seethblf4bcwDeguFdtGPLTdWbMkcgxa5OLtWointDdWKZBV2BHVCz1OT+GMdVEutpCP//K1fPUuSiOn/G9+6m3jVYh7rA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(2906002)(38100700002)(186003)(76116006)(52536014)(38070700005)(7696005)(86362001)(9686003)(316002)(8676002)(55016002)(110136005)(83380400001)(8936002)(66946007)(6506007)(478600001)(66446008)(64756008)(66556008)(66476007)(26005)(5660300002)(71200400001)(53546011)(122000001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DcAoEuJaN6XkKCv3KxY2Y5UEf+kQGaOkiubmvHfMOopmMyt2Ae/VEucB6IbS?=
 =?us-ascii?Q?WY/8wxWVOjIhHAshhC9xCQbPdkaCMOjbJoYR0r2CYTsKTZkAJxC7/TXTdBOP?=
 =?us-ascii?Q?dVGZWJmCNq3mMZb0aHHNd3bqmopeiDUt0CsUapAfMNFjw30ppvGPmquqyuFE?=
 =?us-ascii?Q?Jh2MfzNnQPedUPKXro1ClzyjWo+pEAUIUQJJ5zzN/5yIChFiKLnxp2eApaVZ?=
 =?us-ascii?Q?2Yz9qRD+naCYoKF5luGvx83lY+LIgdq/aIWte7m0lz+r8vjlKj/pBwtH9NMY?=
 =?us-ascii?Q?Vsa8pw+FSch7YwiEypIG9JUGoRa185/jXbo87zUEq2izA2np0YDc/hx7TxtL?=
 =?us-ascii?Q?MF8rE1KWcYwaWpTxbhrkHVjnyxWhy6zZIytIoCssCWwiL22TQGXF0yf50mGa?=
 =?us-ascii?Q?SO9tRc4cwt5NswMFR9VhLHGXsdPVhpsZlEJNFR8NvfRKHVXDGAdv1uzr9GNq?=
 =?us-ascii?Q?ApjBoUA96qqe3zQ6a4cgkBAJYplwVoUaHMPa+LI98TpbPH97UOmdVsHu4wR3?=
 =?us-ascii?Q?RKVhKxfPuKq5OVOgEZUp4oGo672itIpidk1dEOYRa52J4JYixCDXZimNU0B+?=
 =?us-ascii?Q?vFKW2kyc2KTmV2ihWfcdJzNWt9tExgAZ3jlStzBPe+6YA/+p5CpfPI8r2LMN?=
 =?us-ascii?Q?PCtdG+3wx03UPtygiKl6H3/oNpAvLQHNhKfFo8pLqj9YOnSIBGVtlwJjNdMy?=
 =?us-ascii?Q?v2PUBVGS10EmVJFz1NKYMq4OquwzydrD5U4qq3uqwYZTQJlSusyAI2PjXAbu?=
 =?us-ascii?Q?7PFpyHKV4EEdL7Dh13csjagt4Hz8OzolD4MLdmL08PoLmZATlJvmDLuMD3VT?=
 =?us-ascii?Q?oqa062zrTrdyf9bfKHHRxwZhVDCe9PRwj6X0b9H57J2QTkOjHPh7dobMZF6m?=
 =?us-ascii?Q?v49TZMHu0awecs88mY10lzJJrgP6rcEs880Z8zjHHwsimBrBlI0rBjvb11jQ?=
 =?us-ascii?Q?al5rZKTSDBbcht/BAV0UyOX4aH/dXPN8hlxSvYpPDCOuQYFS5PKbU9OTWf1V?=
 =?us-ascii?Q?+QbGbBZcC0HvdYaoq/lLqz9+FybLEE3chOm5m9ua8sTY+YClBYLCAy1HNU/2?=
 =?us-ascii?Q?uLIMr6EupI5+Gcj69ENnGYWZUmFsgwVb3PAftPcYByJLOUBUfXoWC9AfjqJ/?=
 =?us-ascii?Q?ZkYyYLxkUrM5YQmXF3Dw8QshmNToTyeHvx5LD/Vab0NcXrwMjn7J70i7Qf6I?=
 =?us-ascii?Q?Y7SWiyKkEuG7TmwSUhxnVr1dyO1O++bOMPjvBXv3bb+yTcDlBV42F//t6BGU?=
 =?us-ascii?Q?Dubkg//zyN+LPx4M3tixF3R+aBcM+Q+J1IoS6oujkLtkgT82TpRUulbdD0r/?=
 =?us-ascii?Q?fQZSRVlEn7F0MO1DGPJ/xhkb?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 980fd5ad-4ee2-4381-eda1-08d96659249d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2021 17:12:10.1211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wuJz6Mayqltjn1dvGVp+i6TuQP9MC5MNtlxFkAs8pShoa/R50TumOykR0AstzcSjzrp64KgIMPC6oEU29FIo2+VzkIvPh2dSZSdhqYPpHE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3977
Content-Class: 
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Khem,

I looked exactly into configure.ac which arguments are expecting for those =
options. So I think, it has to be mentioned explicitly.=20

Regards,
Andrej

> On 8/23/21 3:12 AM, Andrej Valek wrote:
>> - Some distributions with UTF-8 locale have problem when National Langua=
ge
>>   Support is enabled. Add there an option to disable it.
>> - refresh options based on configure.ac
>>=20
>> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>> ---
>>   meta/recipes-support/vim/vim.inc | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta/recipes-support/vim/vim.inc=20
>> b/meta/recipes-support/vim/vim.inc
>> index 17d1c24a7c..7cc47884f2 100644
>> --- a/meta/recipes-support/vim/vim.inc
>> +++ b/meta/recipes-support/vim/vim.inc
>> @@ -54,19 +54,21 @@ do_compile() {
>>       autotools_do_compile
>>   }
>>  =20
>> -#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
>> +#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny, selinux,=20
>> +elfutils, nls
>>   PACKAGECONFIG ??=3D ""
>>   PACKAGECONFIG +=3D " \
>>       ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
>>       ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '',=20
>> d)} \
>> +    nls \
>>   "
>>  =20
>>   PACKAGECONFIG[gtkgui] =3D "--enable-gui=3Dgtk3,--enable-gui=3Dno,gtk+3=
"
>> -PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,acl,"
>> +PACKAGECONFIG[acl] =3D "enable_acl=3D"yes",--disable-acl,acl,"
>
>is 'yes' needed to be explicit ? I thought --enable-XYZ meant it implicitl=
y
>
>>   PACKAGECONFIG[x11] =3D "--with-x,--without-x,xt,"
>>   PACKAGECONFIG[tiny] =3D "--with-features=3Dtiny,--with-features=3Dbig,=
,"
>> -PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselin=
ux,"
>> +PACKAGECONFIG[selinux] =3D "enable_selinux=3D"yes",--disable-selinux,li=
bselinux,"
>>   PACKAGECONFIG[elfutils] =3D "--enable-elf-check,,elfutils,"
>> +PACKAGECONFIG[nls] =3D "enable_nls=3D"yes",--disable-nls,,"
>>  =20
>>   EXTRA_OECONF =3D " \
>>       --disable-gpm \
