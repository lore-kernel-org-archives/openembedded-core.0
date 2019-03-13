Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 25098 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 13 Mar 2019 17:35:29 UTC
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr70085.outbound.protection.outlook.com [40.107.7.85])
	by mail.openembedded.org (Postfix) with ESMTP id E87D27C6A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 17:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-TopicProducts-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=urtw0idtqFKIq891iay9cVYAI+vaZckmufr4dpQ4q64=;
	b=spzQzNAN/o6SzHqyGbXCzpoU6RrBNV4dQ+Fm1bxNy4aAK6FdhSr8SUecboQgu98Bx0YUeYoqGTHm3yyJy5+VNY/A1THEN5aVIJyGdb6V+JmPZNb3w0BdvoiHk88QmwPIaSAFdEwoJvTQ1pRpiCkM9a0qr5tO4zkQ9eVKyk/ECKA=
Received: from DB7PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:10:12::31)
	by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:ad::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1709.13;
	Wed, 13 Mar 2019 10:03:16 +0000
Received: from VE1EUR01FT029.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e01::204) by DB7PR04CA0018.outlook.office365.com
	(2603:10a6:10:12::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1709.13 via
	Frontend Transport; Wed, 13 Mar 2019 10:03:15 +0000
Authentication-Results: spf=pass (sender IP is 52.236.92.113)
	smtp.mailfrom=topicproducts.com; lists.openembedded.org;
	dkim=pass (signature
	was verified) header.d=topicbv.onmicrosoft.com; lists.openembedded.org; 
	dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
	designates 52.236.92.113 as permitted sender)
	receiver=protection.outlook.com; client-ip=52.236.92.113;
	helo=eu2-emailsignatures-cloud.codetwo.com;
Received: from eu2-emailsignatures-cloud.codetwo.com (52.236.92.113) by
	VE1EUR01FT029.mail.protection.outlook.com (10.152.2.224) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.1686.19 via Frontend Transport; Wed, 13 Mar 2019 10:03:15 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (104.47.10.58) by
	eu2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server
	(TLS12) via SMTP; Wed, 13 Mar 2019 10:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-TopicProducts-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=urtw0idtqFKIq891iay9cVYAI+vaZckmufr4dpQ4q64=;
	b=spzQzNAN/o6SzHqyGbXCzpoU6RrBNV4dQ+Fm1bxNy4aAK6FdhSr8SUecboQgu98Bx0YUeYoqGTHm3yyJy5+VNY/A1THEN5aVIJyGdb6V+JmPZNb3w0BdvoiHk88QmwPIaSAFdEwoJvTQ1pRpiCkM9a0qr5tO4zkQ9eVKyk/ECKA=
Received: from DB7PR04MB5260.eurprd04.prod.outlook.com (20.176.236.92) by
	DB7PR04MB4858.eurprd04.prod.outlook.com (20.176.234.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1686.18; Wed, 13 Mar 2019 10:03:07 +0000
Received: from DB7PR04MB5260.eurprd04.prod.outlook.com
	([fe80::b0b4:776c:f2bf:963c]) by
	DB7PR04MB5260.eurprd04.prod.outlook.com
	([fe80::b0b4:776c:f2bf:963c%7]) with mapi id 15.20.1709.011;
	Wed, 13 Mar 2019 10:03:07 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: OE-core <openembedded-core@lists.openembedded.org>
Thread-Topic: Cannot get bitbake multiconfig to work
Thread-Index: AQHU2YP0f7vMBmbKPUmilsGnCtSV2w==
Date: Wed, 13 Mar 2019 10:03:07 +0000
Message-ID: <c7b19826-0eb6-2e9d-1369-9d407895826b@topic.nl>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
x-clientproxiedby: AM6PR0202CA0034.eurprd02.prod.outlook.com
	(2603:10a6:209:15::47) To DB7PR04MB5260.eurprd04.prod.outlook.com
	(2603:10a6:10:21::28)
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=mike.looijmans@topicproducts.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.173.50.109]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e3948fab-7a30-4268-69ef-08d6a79b1c56
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB4858; 
X-MS-TrafficTypeDiagnostic: DB7PR04MB4858:|VI1PR0402MB2829:
X-Microsoft-Exchange-Diagnostics-untrusted: =?utf-8?B?MTtEQjdQUjA0TUI0ODU4OzIzOm9vRnR6VWxBMkdSeXFFTlJockhSb2gyNDRJ?=
	=?utf-8?B?VGxVSFN3aGFVMVFBTlVGc01nRTVYUGpZQUJwcmIvbXV2dy9ZU2lyUXliSFcv?=
	=?utf-8?B?cUw1aUR4UnErTWNNN0diUzZZZndpMUg5bE54MzlXRjlBcUVmYkRjbVAzbzVG?=
	=?utf-8?B?R1FhRStpRUV2NHZ5VXRxWjZlaU9pbDVoSDN4U3NWNkMrOHdVR1VQNTF6MGI1?=
	=?utf-8?B?SUdJTGRjWnVyK052RXlMMm9QbzdEdmtFbkIzdzNZMXFPUm9zRys2a1JjTnBW?=
	=?utf-8?B?ZWhWTWdIMWI4clNhTXFRZlVpb28xZEY5WEZmUzlSYktycllZMXM0NzdPb2dS?=
	=?utf-8?B?N1Q3bldDaFM4Qnh4RVU3bUlORC9XdkI5a3pPMUNNVHBqcTdYdytWWmczOFgv?=
	=?utf-8?B?ekJHdi84MzA2cE1zMW40SGxyekR0THVLd3JxNUhOM2lTc0tiaDI4M2V0VTBu?=
	=?utf-8?B?N28xWmFjWmRkOGMrMUN1cVppaGMrbW1pYmtmNUQ0YkZzNDBLSXJDNDZOY1V2?=
	=?utf-8?B?clF1RnpOajJtYzdzZTVGWW5nL2o4OXBuT0RIM29zU2xBN2tMQUwrMzJ6VThF?=
	=?utf-8?B?eURTZGxGM2Y5TWxyeFRSOTdvTUNCQUJ1R1FJbllKNEdCNTQrenN0bStyUTRn?=
	=?utf-8?B?TzJyNVhNQ2RrekdSQ2FRUnRxWDBITUIyanN5ZTlGQUVXaTZYbFdDWVgveFVU?=
	=?utf-8?B?aXBULy8vbk1qL3BWT3ByOXp0YTlMTDZuQzdEWDdwdVFNbEkrYXRZTzdwWExq?=
	=?utf-8?B?dndtU1ArOW80dVpGR2FGUjRHODhNaDhGQ3dQalRJVXFVOFA4bmJPdXNRTkNG?=
	=?utf-8?B?RU1WRjZIZUpTaFI4WmltWFM3bk5EZ0Jsd0FrY1RWTnd0NVlzaWJQWStSZTZ0?=
	=?utf-8?B?NFFNVzgvODRHdjVmbVFGMytGby9YZjNBN1dxOExUSHZDdUFwR3l2eXR6MW9w?=
	=?utf-8?B?NmJuZEdOc3BiK2hjZUdHM2tNRy9mb2ZxNWlwQmdOUEhNWWhuUkc4WjEzMk5E?=
	=?utf-8?B?TThtUVpiZFltK0p6WjhnMEFwMUpNaFIxZ1VheEhhMTA1REVYZFNKbXQ5Lzl0?=
	=?utf-8?B?THBSYzhTWFBOdUVtakN6a21BTjFsNU9CaEtwS3U3QTkrN1diY0FreGZkUGxD?=
	=?utf-8?B?L2NLOENVclZqVGo3ZFREYUpRenFNQ2VBUHpuVEFkeXFuU3U4Qzc4Y0UzZGlD?=
	=?utf-8?B?SHhrSks2T0ROa2J1clJzRFkzZ056WGhkYlhhN1VCQ25VNm05RmNtd2xCV0R4?=
	=?utf-8?B?UzNqRkdOSVdhcWlVdlNhRkxpMCtpMlUzOTYra2dmbjJ1Z2p0bzdVUTJHQVUz?=
	=?utf-8?B?TWZiZWVneFIzak9RUDhBbjZpVGd2WEdhQ255cnVrU0NQakV0NHRZcFlJWklq?=
	=?utf-8?B?R1JCMVVBQTA0cUNPbGpnWkoxV2FhOExYclcxdS9INHBnZmUxeFM3dEp1bXlx?=
	=?utf-8?B?U09iMUJKa0ovaDRtZ1orbUdHdDVWRk4xMGxYODc4NjFQQmtYMkdtcmpxRXNn?=
	=?utf-8?B?Um5VSGh5aG5WS0NtRmtudUt0SHlPbXl1aXdPUUo1NXZIOGI1bktvTVR5dnVr?=
	=?utf-8?B?WFpqTUVXVHZNbmdiYnhsYUZnaG52dUhYL2VrVHZ2ZWJaRHdLRWtLRTFjemRU?=
	=?utf-8?B?MHBIeTZYanlOQ3E2OExPSFpZQmFpTzgwZFB2eHVVQldzcmdsRnZ6a3pLVEU5?=
	=?utf-8?Q?lgX7J6fT9GJqXQOQzxzt4dkVZtcvN4NbeilQyq6?=
X-Microsoft-Antispam-PRVS: <VI1PR0402MB28292E838C4FDB91226E9A2A964A0@VI1PR0402MB2829.eurprd04.prod.outlook.com>
x-forefront-prvs: 09752BC779
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10009020)(346002)(376002)(39840400004)(366004)(396003)(136003)(199004)(189003)(6506007)(386003)(74482002)(31686004)(105586002)(186003)(26005)(2906002)(102836004)(6916009)(58126008)(44832011)(316002)(5660300002)(486006)(65806001)(66066001)(65956001)(2616005)(476003)(31696002)(65826007)(106356001)(36756003)(99286004)(52116002)(305945005)(68736007)(25786009)(256004)(8936002)(42882007)(8676002)(81166006)(81156014)(53936002)(14454004)(6436002)(71200400001)(71190400001)(508600001)(97736004)(6512007)(3846002)(6116002)(14444005)(6486002)(7736002)(64126003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4858;
	H:DB7PR04MB5260.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: topicproducts.com does not
	designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 3llV+8qpVGWh11YqolAo4LpXdzTUByTjGpLl91HlGzPTFCM6WGJ6TPnz2C3rk0119Tt5uR6Mt6D6wLVPCsKpvzLejjGIq4PGt1DCrMmcv9mKlDOmoNMLDHIO3icn8wpX7eozpuk7MattX+KaBQCsAedOxklquewuKx+daCD5QKsbCkDjyRLC9qxWAI4R0pOq8UMaANXiCLHpPIsWOoHjmbBHQEa3i26rnp+R5qcT7AOw3mNX6OLQKfWibq+vlic9r7gq+MI0u+DdLlksxqtx/1n3VQhmgqMIxzai2hp2jf3Hyw27cm48KGJsC4nCSjHWIBWTTYbZp6PTKFuCro43NQdz/vklPYK27Z6tZcKFpVaElbuIfmxQjfVYWzwBLcR+588ml7db9ErbV6rQxOXxb59/a0F/xhJxQnz+7Hg8kGs=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4858
X-CodeTwo-MessageID: 20190313100311.ca03478d-a252-4e8e-a09e-90a7218fa560@eu2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR01FT029.eop-EUR01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:52.236.92.113; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(39840400004)(396003)(136003)(346002)(2980300002)(199004)(189003)(50466002)(66066001)(99286004)(14444005)(102836004)(2616005)(476003)(47776003)(316002)(6486002)(246002)(65956001)(65806001)(36756003)(6512007)(5660300002)(25786009)(31696002)(106002)(58126008)(508600001)(26005)(14454004)(6916009)(7736002)(6506007)(23676004)(2486003)(356004)(64126003)(31686004)(44832011)(7636002)(8676002)(8936002)(7596002)(65826007)(106466001)(486006)(436003)(126002)(2906002)(305945005)(186003)(336012)(42882007)(6116002)(386003)(3846002)(74482002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB2829;
	H:eu2-emailsignatures-cloud.codetwo.com; FPR:; SPF:Pass; LANG:en;
	PTR:eu2-emailsignatures-cloud.codetwo.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c0cea727-5d08-4339-7caa-08d6a79b1753
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(710020)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR0402MB2829; 
X-Forefront-PRVS: 09752BC779
X-Microsoft-Antispam-Message-Info: 94qsKUMVzqjKXrPBt//E6c3Y5nwQb/gVGuCte1VKDyXnw7wN6cCZeYwVoFgsvBswb/n+NfZUHc/N7NwRcd8FD+vZySSEzfDAgmq0jRIjuEus6w0M7PiXkIZJ5kOP0AuPgT0/nwd4himMOEubikxnlJKxSHnCwIS36HJ8i0PqZ/y4+AqYFm35UqqOAd38LDvfFyFGnKGkLkmDaT/bbdmOVfxYRmviNzT7VUfomYSXr2J+tWwIYtEHF7uyIJofPNkykVwrZk6fLdlwM2ojUf0jMfUdEzfSD7M1lkmT4ppfphJUMuf6HUnBu+i2pWnHIABMWgxH3DXdTY8jBUjBtJJajX6eImOhWptMjXbQtoQnv+q4qWmlBaa+5HLVHE59I5XUx1WbbxkGFfWXcZDqPdZrH0yir4Npe5jZyb8c1IT+54I=
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2019 10:03:15.1824 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3948fab-7a30-4268-69ef-08d6a79b1c56
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;
	Ip=[52.236.92.113]; Helo=[eu2-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829
Subject: Cannot get bitbake multiconfig to work
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
X-List-Received-Date: Wed, 13 Mar 2019 17:35:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBE0598C0EE55A4C84EC9C0EF8AF5EFF@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

SSB0aGluayBJJ3ZlIGRvbmUgZXZlcnl0aGluZywgYnV0IGNhbm5vdCBmaWd1cmUgb3V0IHdoYXQg
c3RlcCBJIG1pc3NlZC4NCg0KSSBhbSB1c2luZyB5ZXN0ZXJkYXkncyAidGh1ZCIgYnJhbmNoZXM6
DQoNCkJCX1ZFUlNJT04gICAgICAgICAgID0gIjEuNDAuMCINCkJVSUxEX1NZUyAgICAgICAgICAg
ID0gIng4Nl82NC1saW51eCINCm1ldGEgICAgICAgICAgICAgICAgID0gIkhFQUQ6ZmJiNjg4YWIz
ZWVjYTFiYmZiYWFhYWZmZDhjODFmZDgwNTJiY2M2OCINCm1ldGEtb2UNCm1ldGEtbXVsdGltZWRp
YQ0KbWV0YS1uZXR3b3JraW5nDQptZXRhLXB5dGhvbiAgICAgICAgICA9ICJIRUFEOjZlZjk2NTcw
Njg0OTJkNDY0NDA3OWM4OGYyYWRlZTljM2NhYzk1NDMiDQoNCg0KSSBjcmVhdGVkIGEgY29uZi9t
dWx0aWNvbmYgZGlyZWN0b3J5IHdpdGggYSAicG11LmNvbmYiIGZpbGUgKGFuZCBvdGhlcnMpDQoN
CiQgY2F0IGNvbmYvbXVsdGljb25maWcvcG11LmNvbmYNCk1BQ0hJTkU9Inp5bnFtcC1wbXUiDQpE
SVNUUk89InhpbGlueC1zdGFuZGFsb25lIg0KR0NDVkVSU0lPTj0iNy4lIg0KVE1QRElSPSIke1RP
UERJUn0vcG11dG1wIg0KDQpJIGFkZGVkIHRvIG15IGxvY2FsLmNvbmYgKGFuZCByZW1vdmVkIHRo
ZSBNQUNISU5FIHNldHRpbmcgdGhlcmUpOg0KDQpCQk1VTFRJQ09ORklHID0gInBtdSAuLi4iDQoN
Ck5vdyB3aGVuIEkgaW52b2tlIGJpdGJha2Ugd2l0aCB0aGUgbXVsdGljb25maWcgc3ludGF4LCBp
dCBjb21wbGV0ZWx5IGlnbm9yZXMgdGhhdDoNCg0KJCBiaXRiYWtlIG11bHRpY29uZmlnOnBtdTpw
bXUtZmlybXdhcmUNCkVSUk9SOiAgT0UtY29yZSdzIGNvbmZpZyBzYW5pdHkgY2hlY2tlciBkZXRl
Y3RlZCBhIHBvdGVudGlhbCBtaXNjb25maWd1cmF0aW9uLg0KICAgICBFaXRoZXIgZml4IHRoZSBj
YXVzZSBvZiB0aGlzIGVycm9yIG9yIGF0IHlvdXIgb3duIHJpc2sgZGlzYWJsZSB0aGUgDQpjaGVj
a2VyIChzZWUgc2FuaXR5LmNvbmYpLg0KICAgICBGb2xsb3dpbmcgaXMgdGhlIGxpc3Qgb2YgcG90
ZW50aWFsIHByb2JsZW1zIC8gYWR2aXNvcmllczoNCg0KICAgICBQbGVhc2Ugc2V0IGEgTUFDSElO
RSBpbiB5b3VyIGxvY2FsLmNvbmYgb3IgZW52aXJvbm1lbnQNCg0KDQpBcHBhcmVudGx5LCBiaXRi
YWtlIGRvZXNuJ3QgZXZlbiBjYXJlIGFib3V0IHRoZSAibXVsdGljb25maWc6IiBzeW50YXgsIEkg
Z2V0IA0KdGhlIHNhbWUgcmVzcG9uc2Ugd2hlbiBJIHR5cGU6DQokIGJpdGJha2UgbXVsdGljb25m
aWc6YmxhaDpwbXUtZmlybXdhcmUNCiQgYml0YmFrZSBtdWx0aWNvbmZpZzpibGFoOmJsYWgNCiQg
Yml0YmFrZSBibGFoOmJsYWg6YmxhaA0KDQpJIGNhbiBhZGQgYSAiTUFDSElORT89IiB0byBsb2Nh
bC5jb25mLCB3aGljaCByZXN1bHRzIGluIGEgYnVpbGQgZm9yIHRoYXQgDQptYWNoaW5lIGFuZCBu
b3RoaW5nIGZyb20gdGhlIHBtdS5jb25mIGdldHMgZXZlciB1c2VkIGF0IGFsbC4NCg0KU28gd2hh
dCBzdGVwIGRpZCBJIG1pc3M/DQoNCg==

