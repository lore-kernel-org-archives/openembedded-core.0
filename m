Received: from esa8.fujitsucc.c3s2.iphmx.com (esa8.fujitsucc.c3s2.iphmx.com [68.232.159.88])
 by mx.groups.io with SMTP id smtpd.web09.585.1621987383981268822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 17:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=dcCG9cyo;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.88, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1621987385; x=1653523385;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=9xK6+mnTdbAXBxM54sclVqRUm8qb/ELvSesBgyMKLUY=;
  b=dcCG9cyo7ykUTiao76Hxh1ZZJC+g3fM0jSeqH+bAPSdFe5ud+tqJTNgf
   qLC3v+W/YkWrwDlZsGMRpnOAgYpCKTK64SqcV09R124eAQFQ97IGn/qIN
   LQoo0L82O9iFP9ki/kVkc6UKIzKzlljKkhFbkAioUlNFXqH3DukMpo28D
   pAp1VVZtrDuor42+MNARNReTneD4ThUYDBpaipyyfxLl/0nLUuaz9xEbw
   A4ddY9eym6XDIQrXj8dK3mvKd2M0NUtM4yLkFAuhMB2MQ8LTuvCPcXuBa
   FneDTMXHYi4Mw+uHrjwRFZ5y31LfZBpJT3LVnfZdRHt73ijuCQYJ+JDLS
   w==;
IronPort-SDR: qPeHEZlC2b6caN4Wd6allDooz9p6Gf8BdIViq6Folk0MfKIigUHhyrvmikQuo1JtFibqFRb7Hx
 khJYBmmjIwMJSmpoIwiZbJ7S5Jl+nbv6s/VbSFd2vkc0sgJhhqgJ7XIAa2ZV9oYYl13+u3sTd4
 ZVME6qTu5/FPZk5GEQDNG0aOjo6EldekomIiNqeHJz/fv7OW3FX5kaYVSGuFKmidaEX5CSCKT+
 JPlvy0HwHQcs3CpZZartHhP1Ba36sOeAfQwjayy1CHNT1V71oUCk6K0bJoRdUP7DXQbhcE/6iI
 NAQ=
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="31923518"
X-IronPort-AV: E=Sophos;i="5.82,329,1613401200"; 
   d="scan'208";a="31923518"
Received: from mail-ty1jpn01lp2055.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.55])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 09:03:00 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiZBcftjzqiM10hAi0PyGFHfYQFFUyKZ3QPJUJXpnQDtT3C0F8r6LY0tnsnpyhw4qPMPmlQBv8oOeIHMnXjuYli5WteHL5XEanvz4JmQ2bDVcuZedoIKns3ZoeYlinMXM9CVD6mAomWsQw/QtDf3xLm1wXq8W9FEwlsiAongVdJtpqL9R7tXRjMjvMyt712le2zGA+szgbAi6TtOJ8sJMBlQorvp+KEAedXlev6zgFXkgCSgZBewGJCTvvXawXmKJFaZDmxn97yf2yxQj2RNTuTEemeZmj7ArsGRnOug90RwKLrW4FeddEKGNJDCvFwxc5FxXlX7yQf+bkFS5canMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xK6+mnTdbAXBxM54sclVqRUm8qb/ELvSesBgyMKLUY=;
 b=cvclVB3x4Nu5x60NDR5vt5Hn5P0GDxhLjCxSADbhx9A/NcSOLoHjzGKOZI3I0olAWFrPMFrWF2+tnOtqJv5DIJDj3wtK5UxG7vJTufj7S+dtpkST5gD8ra30y8rUoY73ymOZk6h91Vau6MXLvbVM+eyVM/M0Wyqb09PF41k1if5P10EOyDgGjdEN3sFQC2I5ePTgEsLJrxKS9wdHPrY1RY7sYuGrNiiLbV4XXkwZqSy7dHtCB3a6PvX0kJpNH4fZqyS7QujFJ1V4DlG/RiBMriZel4dwbLN+lt3qGdob/uyaFkFdka9mk6dDIOiXje9iHlYkNSENCKjzoI5EzTL2RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xK6+mnTdbAXBxM54sclVqRUm8qb/ELvSesBgyMKLUY=;
 b=guyDCzd1JZbDpA3vSk84YkVSGT8KwlArjVMK3sjWpnKrYxJ9/OtTC6zHIC3vB/XLuHBQy7tyKX6Tzbv7dmj8EXvUzYpsYsc8k+fSPYrI9czE3IJhbcbcuHn0IP3J/guYyGaCO5CK/qXsKhls9cep/CtLqtN5xWOXbYobiX5KAIk=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by OSAPR01MB2705.jpnprd01.prod.outlook.com (2603:1096:604:8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Wed, 26 May
 2021 00:02:57 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::550e:c53a:917f:a825]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::550e:c53a:917f:a825%7]) with mapi id 15.20.4173.021; Wed, 26 May 2021
 00:02:57 +0000
From: "leimaohui" <leimaohui@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Khem Raj (raj.khem@gmail.com)"
	<raj.khem@gmail.com>
Subject: gdb-cross-canadian-arm includes 64bit inc file when enable multilib
Thread-Topic: gdb-cross-canadian-arm includes 64bit inc file when enable
 multilib
Thread-Index: AddRDK0xN3FA8Hk9R5ynMAe5zzSX3A==
Date: Wed, 26 May 2021 00:02:57 +0000
Message-ID: 
 <OS0PR01MB617867B0AC3DCBCC6F77955AA0249@OS0PR01MB6178.jpnprd01.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f94071e7-5d46-4009-464b-08d91fd99e77
x-ms-traffictypediagnostic: OSAPR01MB2705:
x-microsoft-antispam-prvs: 
 <OSAPR01MB2705C26896668B752FF354ABA0249@OSAPR01MB2705.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 X1q6ey6qI2csVfs6rb8Amh0frx+78Bv11rxZaaWxNygYZUJkm0DQUu8hQ16rYjzYMJ5T3tl0I/F2xO5UWGtSEv0pKXuraKeBXkmmpnD4jCWnsB1wd4lXoHdIqdHXV4HSz6UfqcdFlnMgpgR0ZdUNHyhO5dae+mOeBM7oXnS6lW51IHlYEEp8Ef0qQGMmLMFtrR3WIvBVBcO7AFjd0vnAhUSSo0j5WLnG6kqjwWa0t6U/bUsi8/OVwjl3cpMhG7erQ6WNqRYt4lCoStlkcmak94FDQz1qUmBa0JPbZoMiL9ZW7R2yd0shJIzEMB+SXTq7prcSpA82qvJxpm/9OM8MlsIx2pZLSCTBDpYVqsA022g1LLzlqEjY6V+hj6BHqPbT02N4ohGJx12pb1fEzjJ0ZS96+UN7RsAQe3bjEhpyGZQNChzx4XZvvFQFgOIdWqFfn2glKWgvefzPYUd1O0oegu64TsUB276TrAF8odgVJBkeM8MwR8N/clQIzDcPsir4mufvV+JW3DNgclb/uAyTFK4bNms6YU3fvFtkArWD2e0Bw/6AlY7uxDlxvLAJznZ/BblB8VCiQJPk4tyKzyZJJIshkWXYAUqKA7MQLyQeLrc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(186003)(2906002)(478600001)(6506007)(7696005)(5660300002)(316002)(64756008)(66446008)(8936002)(52536014)(76116006)(110136005)(38100700002)(86362001)(66946007)(122000001)(26005)(4744005)(71200400001)(66556008)(8676002)(33656002)(66476007)(85182001)(9686003)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?shift_jis?B?dHA1aGlpd3g4b3o0bm8wWE1UOUtkZlNVT2dFTnpxSUJ0SlA1M2tYTW9N?=
 =?shift_jis?B?QVhIR3duTU14Q0xoM3k0UVNLSmhCdGxJeEpNR3czVWl0NUxBZjRTUDRZ?=
 =?shift_jis?B?cElRQ09rellhc2lHdjlEZk5hSTZNWFk4ZHZvd283c2g2STFiWVNUeVl3?=
 =?shift_jis?B?bnpMclB4dlIrWmZXSGcyaHFDNFZZVzJUaVpuQk5FblIrK2I2ZEtnMTJ6?=
 =?shift_jis?B?NHNJc242QkVnUjBzZDJWQWs1OTZ5SUMyL24vYnhwcVVOWWZmSkcvME5G?=
 =?shift_jis?B?RldjRjVaTUpiTVVjUkpXSlpNRW53akw0QW1ieCszeXpFelN0a242aEJk?=
 =?shift_jis?B?SHA1RVd0OGNkc2ZyZ2QrY0ZwRXNieXNsajlvMk8yQ05YQkpYZmRQUm5o?=
 =?shift_jis?B?TDJ0aElWdWt5cXlpbFZDOGU0dzgxbTVUOUZwY3lUZlk3dS9GdnFJOUpX?=
 =?shift_jis?B?V0VwTUZ0eXRIV1FJbTFiaGhqd1cyRE1peXVMbkQ1UmM5L05KVUpOSElG?=
 =?shift_jis?B?NjdKV21wSjBPV05YT2E5VlpwSjlyWUs5MzBMenZpVXhCV0hoWGp0OUxx?=
 =?shift_jis?B?SE5zYVFiVlo5S1hLSGpTU1Z0UFdaZFFxSHdzUUwzcVpyY2cvOWtWajNK?=
 =?shift_jis?B?NnIzRDlvdmlRSy8yQ0k4YmgzUmI4R05VbGNYakMzcDFGZlptMzFRa0pQ?=
 =?shift_jis?B?Y1FmbW4xMmtkRjZRdEpVZEU4ZFJKNXYzOXg1dnowT3psUm9pUUJJMkxv?=
 =?shift_jis?B?dUJzajJmN05FN0FESFVRVUlhRHI0MGRJdjQ1RzNKVGp3clFEcUNPcjNF?=
 =?shift_jis?B?WG1RbU41VFNNZlJrSGNKWTMyaFc4Z3dDNkNxcUI4ZFlDTjZvTURqNWV1?=
 =?shift_jis?B?ek9RaisrbGhTYmlUVlg0TXJzNUZmNkIrRzA3NDlBN09lVGJHcUFoUU94?=
 =?shift_jis?B?N1RaTldBVlZrYkMrRXZ0UTN6aDN1K2dsUlhQNFFhbXpNcFBWNThROVhQ?=
 =?shift_jis?B?QVMxb3hmcFpEZGhPOWEyTnN5VmdGVUdHSTBzTk5ma3RqZVNrYWx5ZGtY?=
 =?shift_jis?B?Q2d0ZGFPTTQrWFBVNG01Q2FqRUdNeVNabVdhWFkyYXRLTlR0ZWt2NzRV?=
 =?shift_jis?B?YzMvZEppMDR6K01oZlNzNWViaDhKWFhiZVRBYlVzWnprMU51Q01QaWJr?=
 =?shift_jis?B?RGtUVlVtK0pCM0hHZXlpc3NxVlJQeTdPNElDaGJOYVpDdjdBT0szODZp?=
 =?shift_jis?B?QTZaVGdvckZqU1RNdlFMMGdvVnR1RTR5T2dHYVlBd2hHbXdHbkppaW80?=
 =?shift_jis?B?bFlUTzMwbVR1SGxrZ2lSTWFwSXhHZ2MzNnFkNG1XcU9ZblNkMmYraHIz?=
 =?shift_jis?B?Q2IyZjVYT3Y4Z20vRlhjRkt3SkNHOXJJSU5laHZ0OS9lNkJndjNLS1hm?=
 =?shift_jis?B?WUc1b29DcnBlaXBPZE43MlNRMXV4Sjg1R29saDZWWWNNMW1ZMG9CM2lI?=
 =?shift_jis?B?cE5vaWNuY2o1NjFtczZLRFZmZ3JCaE0zb3pOampQcmRVUlJzY0JQV0xR?=
 =?shift_jis?B?UlRoUWpnWmM1WTZZRVJBM0dTOFNrd2ozcGkvR0RyT1h4a1kzbnExdXhj?=
 =?shift_jis?B?Q0VBaEpzWno1OWNjeFB4OUhmU0ZONXZZQ0dmR2N1cld0RUtPTGRGb09B?=
 =?shift_jis?B?N2UrWTBOSVh4em5wV1hZa2ZEZzMzRmRuTTBQSEcyclVGK0hIVW5TdUw3?=
 =?shift_jis?B?dUducW03dHZnV2hIN3p4MkZmSnNjSXZXN1J5ZVVZTnBZWE9Qand2bkRH?=
 =?shift_jis?B?L21kVDhyU3B2czhVb3llUElKVHdOZUdEekM3eE1xclpUTDQzSnNrTml5?=
 =?shift_jis?Q?oPiMeh5Dfm0L26yEfmjTc=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f94071e7-5d46-4009-464b-08d91fd99e77
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 00:02:57.6119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OmcUesqVmPIzMfOGiL6RFcWrBlkfgbW0ATlotXgDlrTBWhGSC2FjXIQUj+pql1h5F8InXtI6jVKRiT+5lDudjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2705
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGksDQoNCkkgZm91bmQgdGhhdCBnZGItY3Jvc3MtY2FuYWRpYW4tYXJtIGluY2x1ZGVzIDY0Yml0
IGluYyBmaWxlIHdoZW4gSSBlbmFibGUgbXVsdGlsaWIuIEl0IGlzIGNvcnJlY3Q/IFNob3VsZG4n
dCBpdCB1c2UgMzJiaXQgaW5jIGZpbGU/IA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
JCBscyB0bXAvd29yay94ODZfNjQtbmF0aXZlc2RrLXBva3lzZGstbGludXgvZ2RiLWNyb3NzLWNh
bmFkaWFuLWFybS8xMC4yLXIwL3JlY2lwZS1zeXNyb290L29wdC9wb2t5LzMuMytzbmFwc2hvdC9z
eXNyb290cy94ODZfNjQtcG9reXNkay1saW51eC91c3IvaW5jbHVkZS9nbnUvDQpsaWItbmFtZXMt
NjQuaCAgbGliLW5hbWVzLmggIGxpYmMtdmVyc2lvbi5oICBzdHVicy02NC5oICBzdHVicy5oDQok
DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCkluIGFkZGl0aW9uLCBnY2MtY3Jvc3Mt
Y2FuYWRpYW4tYXJtIGlzIHVzaW5nIDMyYml0IGluYyBmaWxlLg0KLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KJCBscyB0bXAvd29yay94ODZfNjQtbmF0aXZlc2RrLXBva3lzZGstbGludXgv
Z2NjLWNyb3NzLWNhbmFkaWFuLWFybS8xMS4xLjAtcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1
ZGUvZ251Lw0KbGliLW5hbWVzLTMyLmggIGxpYi1uYW1lcy1oYXJkLmggIGxpYi1uYW1lcy5oICBs
aWJjLXZlcnNpb24uaCAgc3R1YnMtMzIuaCAgc3R1YnMtaGFyZC5oICBzdHVicy5oDQokDQotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCkJlc3QgcmVnYXJkcw0KTGVpDQo=
